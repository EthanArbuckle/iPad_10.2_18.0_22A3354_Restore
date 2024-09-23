@implementation GLKSkyboxEffect

- (GLKSkyboxEffect)init
{
  char *v2;
  GLKSkyboxEffect *v3;
  GLKEffectPropertyTexture *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GLKSkyboxEffect;
  v2 = -[GLKSkyboxEffect init](&v11, sel_init);
  v3 = (GLKSkyboxEffect *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 15) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((_QWORD *)v2 + 3) = _D0;
    *((_QWORD *)v2 + 11) = 0;
    *(_OWORD *)(v2 + 8) = xmmword_20DC813F0;
    *((_QWORD *)v2 + 10) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->_transform = objc_alloc_init(GLKEffectPropertyTransform);
    v9 = objc_alloc_init(GLKEffectPropertyTexture);
    v3->_textureCubeMap = v9;
    -[GLKEffectPropertyTexture setTarget:](v9, "setTarget:", 34067);
    -[GLKEffectPropertyTexture setEnvMode:](v3->_textureCubeMap, "setEnvMode:", 0);
    -[NSMutableArray addObject:](-[GLKSkyboxEffect propertyArray](v3, "propertyArray"), "addObject:", v3->_transform);
    -[NSMutableArray addObject:](-[GLKSkyboxEffect propertyArray](v3, "propertyArray"), "addObject:", v3->_textureCubeMap);
    v3->_effect = -[GLKEffect initWithPropertyArray:]([GLKEffect alloc], "initWithPropertyArray:", v3->_propertyArray);
    v3->_effectStale = 1;
  }
  return v3;
}

- (void)createAndBindVAOWithPositions:(float *)a3 texCoords:(float *)a4
{
  GLint params;

  params = 0;
  glGetIntegerv(0x8894u, &params);
  if (self->_vao)
  {
    glBindVertexArrayOES();
  }
  else
  {
    glGenVertexArraysOES();
    glBindVertexArrayOES();
    glGenBuffers(1, &self->_texCoordVBO);
    glBindBuffer(0x8892u, self->_texCoordVBO);
    glBufferData(0x8892u, 288, a4, 0x88E8u);
    glVertexAttribPointer(3u, 3, 0x1406u, 0, 0, 0);
  }
  glGenBuffers(1, &self->_positionVBO);
  glBindBuffer(0x8892u, self->_positionVBO);
  glBufferData(0x8892u, 288, a3, 0x88E8u);
  glVertexAttribPointer(0, 3, 0x1406u, 0, 0, 0);
  glBindBuffer(0x8892u, params);
}

- (void)setXSize:(GLfloat)xSize
{
  if (self->_xSize != xSize)
  {
    self->_xSize = xSize;
    self->_effectStale = 1;
  }
}

- (void)setYSize:(GLfloat)ySize
{
  if (self->_ySize != ySize)
  {
    self->_ySize = ySize;
    self->_effectStale = 1;
  }
}

- (void)setZSize:(GLfloat)zSize
{
  if (self->_zSize != zSize)
  {
    self->_zSize = zSize;
    self->_effectStale = 1;
  }
}

- (void)setCenter:(GLKVector3)center
{
  float v3;
  float v4;
  float v5;

  if (self->_center.x != v3 || self->_center.y != v4 || self->_center.z != v5)
  {
    self->_center.x = v3;
    self->_center.y = v4;
    self->_center.z = v5;
    self->_effectStale = 1;
  }
}

- (void)updateSkyboxEffect
{
  uint64_t v3;
  float *p_zSize;
  float *p_xSize;
  float32x4_t v6;
  float *p_ySize;
  float64x2_t v8;
  float32x4_t v9;
  float64x2_t v10;
  float32x4_t v11;
  float64x2_t v12;
  const float *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float *v22;
  _BYTE v23[288];
  uint64_t v24;
  float32x4x3_t v25;
  float32x4x3_t v26;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_effectStale == 1)
  {
    if (self->_vao)
      glDeleteBuffers(1, &self->_positionVBO);
    v3 = 0;
    p_zSize = &self->_zSize;
    p_xSize = &self->_xSize;
    v6 = vld1q_dup_f32(p_xSize);
    p_ySize = &self->_ySize;
    v8 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.x), 0);
    v9 = vld1q_dup_f32(p_ySize);
    v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.y), 0);
    v11 = vld1q_dup_f32(p_zSize);
    v12 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_center.z), 0);
    __asm { FMOV            V6.2D, #0.5 }
    do
    {
      v18 = (const float *)((char *)&texCoords + v3);
      v25 = vld3q_f32(v18);
      v19 = vmulq_f32(v25.val[0], v6);
      v26.val[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v8, _Q6, vcvtq_f64_f32(*(float32x2_t *)v19.f32))), vmlaq_f64(v8, _Q6, vcvt_hight_f64_f32(v19)));
      v20 = vmulq_f32(v25.val[1], v9);
      v26.val[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v10, _Q6, vcvtq_f64_f32(*(float32x2_t *)v20.f32))), vmlaq_f64(v10, _Q6, vcvt_hight_f64_f32(v20)));
      v21 = vmulq_f32(v25.val[2], v11);
      v26.val[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v12, _Q6, vcvtq_f64_f32(*(float32x2_t *)v21.f32))), vmlaq_f64(v12, _Q6, vcvt_hight_f64_f32(v21)));
      v22 = (float *)&v23[v3];
      vst3q_f32(v22, v26);
      v3 += 48;
    }
    while (v3 != 288);
    -[GLKEffect setLabel:](self->_effect, "setLabel:", -[GLKSkyboxEffect label](self, "label"));
    -[GLKSkyboxEffect createAndBindVAOWithPositions:texCoords:](self, "createAndBindVAOWithPositions:texCoords:", v23, &texCoords);
    self->_effectStale = 0;
  }
}

- (void)prepareToDraw
{
  -[GLKSkyboxEffect updateSkyboxEffect](self, "updateSkyboxEffect");
  glBindVertexArrayOES();
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(3u);
  -[GLKEffect bind](self->_effect, "bind");
}

- (void)draw
{
  GLint i;

  -[GLKSkyboxEffect updateSkyboxEffect](self, "updateSkyboxEffect");
  for (i = 0; i != 24; i += 4)
    glDrawArrays(5u, i, 4);
}

- (void)dealloc
{
  objc_super v3;

  glDeleteBuffers(1, &self->_positionVBO);
  glDeleteBuffers(1, &self->_texCoordVBO);
  glDeleteVertexArraysOES();
  v3.receiver = self;
  v3.super_class = (Class)GLKSkyboxEffect;
  -[GLKSkyboxEffect dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("self = %p\n{\n"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("center = { %6.3f, %6.3f, %6.3f }\n"), self->_center.x, self->_center.y, self->_center.z);
  objc_msgSend(v3, "appendFormat:", CFSTR("xSize = %6.3f\n"), self->_xSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("ySize = %6.3f\n"), self->_ySize);
  objc_msgSend(v3, "appendFormat:", CFSTR("zSize = %6.3f\n"), self->_zSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("textureCubeMap = %p\n"), -[GLKSkyboxEffect textureCubeMap](self, "textureCubeMap"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyTexture description](-[GLKSkyboxEffect textureCubeMap](self, "textureCubeMap"), "description"));
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (GLKVector3)center
{
  GLKVector3 result;

  result.z = *(float *)&a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLfloat)xSize
{
  return self->_xSize;
}

- (GLfloat)ySize
{
  return self->_ySize;
}

- (GLfloat)zSize
{
  return self->_zSize;
}

- (GLKEffectPropertyTexture)textureCubeMap
{
  return self->_textureCubeMap;
}

- (unsigned)vao
{
  return self->_vao;
}

- (void)setVao:(unsigned int)a3
{
  self->_vao = a3;
}

- (unsigned)positionVBO
{
  return self->_positionVBO;
}

- (void)setPositionVBO:(unsigned int)a3
{
  self->_positionVBO = a3;
}

- (unsigned)texCoordVBO
{
  return self->_texCoordVBO;
}

- (void)setTexCoordVBO:(unsigned int)a3
{
  self->_texCoordVBO = a3;
}

- (NSMutableArray)propertyArray
{
  return self->_propertyArray;
}

- (unsigned)effectStale
{
  return self->_effectStale;
}

- (void)setEffectStale:(unsigned __int8)a3
{
  self->_effectStale = a3;
}

- (GLKEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  self->_effect = (GLKEffect *)a3;
}

- (unsigned)programName
{
  return self->_programName;
}

- (void)setProgramName:(unsigned int)a3
{
  self->_programName = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 48);
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (unsigned)centerChanged
{
  return self->_centerChanged;
}

- (void)setCenterChanged:(unsigned __int8)a3
{
  self->_centerChanged = a3;
}

@end
