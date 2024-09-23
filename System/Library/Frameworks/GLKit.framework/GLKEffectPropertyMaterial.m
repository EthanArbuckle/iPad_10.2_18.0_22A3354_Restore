@implementation GLKEffectPropertyMaterial

- (GLKEffectPropertyMaterial)init
{
  GLKEffectPropertyMaterial *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKEffectPropertyMaterial;
  result = -[GLKEffectProperty init](&v3, sel_init);
  if (result)
  {
    result->_ambientColor = (_GLKVector4)xmmword_20DC81340;
    result->_diffuseColor = (_GLKVector4)xmmword_20DC813E0;
    result->_specularColor = (_GLKVector4)xmmword_20DC813F0;
    result->_emissiveColor = (_GLKVector4)xmmword_20DC813F0;
    result->_shininess = 0.0;
    result->_effectDirtyUniforms = 0;
    result->_colorMaterialEnabledMask.n0 = 0;
    result->_colorMaterialEnabledMask.n1 = 0;
  }
  return result;
}

- (void)dirtyAllUniforms
{
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 1056964608);
}

- (void)setEffectDirtyUniforms:(unint64_t *)a3
{
  if (self->_effectDirtyUniforms != a3)
  {
    self->_effectDirtyUniforms = a3;
    *a3 |= 0x5000000uLL;
  }
}

- (void)setAmbientColor:(GLKVector4)ambientColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;
  unint64_t *effectDirtyUniforms;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_ambientColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_ambientColor.x = v3;
    self->_ambientColor.y = v4;
    self->_ambientColor.z = v5;
    self->_ambientColor.w = v6;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&ambientColor.x, *(_QWORD *)&ambientColor.v[2]) | 0x1000000);
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms)
      *effectDirtyUniforms |= 0x1000000uLL;
  }
}

- (void)setDiffuseColor:(GLKVector4)diffuseColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_diffuseColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_diffuseColor.x = v3;
    self->_diffuseColor.y = v4;
    self->_diffuseColor.z = v5;
    self->_diffuseColor.w = v6;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&diffuseColor.x, *(_QWORD *)&diffuseColor.v[2]) | 0x2000000);
  }
}

- (void)setEmissiveColor:(GLKVector4)emissiveColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;
  unint64_t *effectDirtyUniforms;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_emissiveColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_emissiveColor.x = v3;
    self->_emissiveColor.y = v4;
    self->_emissiveColor.z = v5;
    self->_emissiveColor.w = v6;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&emissiveColor.x, *(_QWORD *)&emissiveColor.v[2]) | 0x4000000);
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms)
      *effectDirtyUniforms |= 0x4000000uLL;
  }
}

- (void)initializeMasks
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  GLKEffectPropertyPrv *prv;
  int8x16_t *v12;
  uint64_t v13;
  int8x16_t *v14;
  uint64_t v15;
  int8x16_t v16;

  *(_QWORD *)self->super._prv = objc_msgSend(*((id *)self->super._prv + 4), "vshMask");
  *((_QWORD *)self->super._prv + 2) = objc_msgSend(*((id *)self->super._prv + 4), "fshMask");
  v3 = &_staticFshMasks_0;
  v4 = &_staticVshMasks_1;
  if (self->_specularColor.x == 0.0
    && self->_specularColor.y == 0.0
    && self->_specularColor.z == 0.0
    && self->_specularColor.w == 1.0)
  {
    v5 = &qword_2549DE9C8;
    v6 = &qword_2549DE9B8;
    v7 = &_staticFshMasks_0;
    v3 = &qword_2549DE9C0;
    v8 = &qword_2549DE9A8;
    v9 = &qword_2549DE998;
    v10 = &_staticVshMasks_1;
    v4 = &qword_2549DE9A0;
  }
  else
  {
    v5 = &qword_2549DE9B8;
    v8 = &qword_2549DE998;
    v6 = &qword_2549DE9C8;
    v7 = &qword_2549DE9C0;
    v9 = &qword_2549DE9A8;
    v10 = &qword_2549DE9A0;
  }
  prv = self->super._prv;
  v12 = *(int8x16_t **)prv;
  v13 = *(_QWORD *)(*(_QWORD *)prv + 8) | *v9;
  v12->i64[0] = **(_QWORD **)prv | *v10;
  v12->i64[1] = v13;
  v14 = (int8x16_t *)*((_QWORD *)prv + 2);
  v15 = v14->i64[1] | *v6;
  v14->i64[0] |= *v7;
  v14->i64[1] = v15;
  v16.i64[0] = *v4;
  v16.i64[1] = *v8;
  *v12 = vbicq_s8(*v12, v16);
  v16.i64[0] = *v3;
  v16.i64[1] = *v5;
  *v14 = vbicq_s8(*v14, v16);
  -[GLKEffectProperty setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (void)setSpecularColor:(GLKVector4)specularColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;
  int8x16_t *v9;
  uint64_t *v10;
  int8x16_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  GLKEffectPropertyPrv *prv;
  _QWORD *v18;
  uint64_t v19;
  int8x16_t **v20;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_specularColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_specularColor.x = v3;
    self->_specularColor.y = v4;
    self->_specularColor.z = v5;
    self->_specularColor.w = v6;
    v9 = (int8x16_t *)&_staticFshMasks_0;
    v10 = &qword_2549DE9C8;
    v11 = (int8x16_t *)&_staticVshMasks_1;
    v12 = &qword_2549DE9C0;
    v13 = &qword_2549DE9A8;
    v14 = &qword_2549DE9A0;
    if (v3 == 0.0 && v4 == 0.0 && v5 == 0.0 && v6 == 1.0)
    {
      v14 = &_staticVshMasks_1;
      v13 = &qword_2549DE998;
      v12 = &_staticFshMasks_0;
      v10 = &qword_2549DE9B8;
      v11 = (int8x16_t *)&qword_2549DE9A0;
      v9 = (int8x16_t *)&qword_2549DE9C0;
    }
    v15 = *(_QWORD **)self->super._prv;
    v16 = v15[1] | *v13;
    *v15 |= *v14;
    prv = self->super._prv;
    v15[1] = v16;
    v18 = (_QWORD *)*((_QWORD *)prv + 2);
    v19 = v18[1] | *v10;
    *v18 |= *v12;
    v20 = (int8x16_t **)self->super._prv;
    v18[1] = v19;
    **v20 = vbicq_s8(**v20, *v11);
    *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), *v9);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x10000000);
  }
}

- (void)setShininess:(GLfloat)shininess
{
  if (self->_shininess != shininess)
  {
    self->_shininess = shininess;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x8000000);
  }
}

- (void)setShaderBindings
{
  GLint params;

  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_ambientColorLoc = glGetUniformLocation(params, "material.ambientColor");
  self->_diffuseColorLoc = glGetUniformLocation(params, "material.diffuseColor");
  self->_specularColorLoc = glGetUniformLocation(params, "material.specularColor");
  self->_emissiveColorLoc = glGetUniformLocation(params, "material.emissiveColor");
  self->_shininessLoc = glGetUniformLocation(params, "material.shininess");
  -[GLKEffectPropertyMaterial dirtyAllUniforms](self, "dirtyAllUniforms");
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = 0;
  _allVshMasks_0 = 0uLL;
  _allFshMasks_0 = 0uLL;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = &_staticVshMasks_1[2 * v6];
    v10 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs_1[v6], a3, objc_msgSend(a3, "index"));
    v7 = 0;
    *v9 = v10;
    v9[1] = v11;
    *(_QWORD *)&_allVshMasks_0 = _allVshMasks_0 | v10;
    *((_QWORD *)&_allVshMasks_0 + 1) |= v11;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  v12 = 0;
  v13 = 1;
  do
  {
    v14 = v13;
    v15 = &_staticFshMasks_0[2 * v12];
    v16 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs_1[v12], a4, objc_msgSend(a4, "index"));
    v13 = 0;
    *v15 = v16;
    v15[1] = v17;
    *(_QWORD *)&_allFshMasks_0 = _allFshMasks_0 | v16;
    *((_QWORD *)&_allFshMasks_0 + 1) |= v17;
    v12 = 1;
  }
  while ((v14 & 1) != 0);
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (_allVshMasks_0 & *(_OWORD *)((_BYTE *)a3 + 8)) == 0
        || (v3 = *(_QWORD **)self->super._prv, (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (_allFshMasks_0 & *(_OWORD *)((_BYTE *)a3 + 8)) == 0
        || (v3 = (_QWORD *)*((_QWORD *)self->super._prv + 2), (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (void)bind
{
  if (-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms"))
  {
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x1000000) != 0)
      glUniform4fv(self->_ambientColorLoc, 1, &self->_ambientColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x2000000) != 0)
      glUniform4fv(self->_diffuseColorLoc, 1, &self->_diffuseColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x10000000) != 0)
      glUniform4fv(self->_specularColorLoc, 1, &self->_specularColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x4000000) != 0)
      glUniform4fv(self->_emissiveColorLoc, 1, &self->_emissiveColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x8000000) != 0)
      glUniform1f(self->_shininessLoc, self->_shininess);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0);
  }
}

- (id)description
{
  id v3;
  GLKVector4 v5;
  GLKVector4 v6;
  GLKVector4 v7;
  GLKVector4 v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  *(_QWORD *)&v5.x = objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %p\n{\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  *(_QWORD *)&v6.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tambientColor =   %@\n"), NSStringFromGLKVector4(v5));
  *(_QWORD *)&v7.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tdiffuseColor =   %@\n"), NSStringFromGLKVector4(v6));
  *(_QWORD *)&v8.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tspecularColor =  %@\n"), NSStringFromGLKVector4(v7));
  objc_msgSend(v3, "appendFormat:", CFSTR("\temissiveColor =  %@\n"), NSStringFromGLKVector4(v8));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tshininess =      %6.4f\n"), self->_shininess);
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyMaterial;
  -[GLKEffectProperty dealloc](&v2, sel_dealloc);
}

- (GLKVector4)ambientColor
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLKVector4)diffuseColor
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLKVector4)specularColor
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLKVector4)emissiveColor
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLfloat)shininess
{
  return self->_shininess;
}

- (unint64_t)effectDirtyUniforms
{
  return self->_effectDirtyUniforms;
}

- (int)_ambientColorLoc
{
  return self->_ambientColorLoc;
}

- (void)set_ambientColorLoc:(int)a3
{
  self->_ambientColorLoc = a3;
}

- (int)_diffuseColorLoc
{
  return self->_diffuseColorLoc;
}

- (void)set_diffuseColorLoc:(int)a3
{
  self->_diffuseColorLoc = a3;
}

- (int)_specularColorLoc
{
  return self->_specularColorLoc;
}

- (void)set_specularColorLoc:(int)a3
{
  self->_specularColorLoc = a3;
}

- (int)_emissiveColorLoc
{
  return self->_emissiveColorLoc;
}

- (void)set_emissiveColorLoc:(int)a3
{
  self->_emissiveColorLoc = a3;
}

- (int)_shininessLoc
{
  return self->_shininessLoc;
}

- (void)set_shininessLoc:(int)a3
{
  self->_shininessLoc = a3;
}

- (GLKBigInt_s)_colorMaterialEnabledMask
{
  GLKBigInt_s *p_colorMaterialEnabledMask;
  unint64_t n0;
  unint64_t n1;
  GLKBigInt_s result;

  p_colorMaterialEnabledMask = &self->_colorMaterialEnabledMask;
  n0 = self->_colorMaterialEnabledMask.n0;
  n1 = p_colorMaterialEnabledMask->n1;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

- (void)set_colorMaterialEnabledMask:(GLKBigInt_s)a3
{
  self->_colorMaterialEnabledMask = a3;
}

@end
