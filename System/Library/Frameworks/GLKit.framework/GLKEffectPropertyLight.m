@implementation GLKEffectPropertyLight

- (GLKEffectPropertyLight)initWithTransform:(id)a3 lightingType:(int)a4 firstLight:(unsigned __int8)a5
{
  GLKEffectPropertyLight *v8;
  GLKEffectPropertyLight *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GLKEffectPropertyLight;
  v8 = -[GLKEffectProperty init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GLKEffectPropertyLight setTransform:](v8, "setTransform:", a3);
    v9->_enabled = 0;
    v9->_quadraticAttenuationLoc = -1;
    v9->_linearAttenuationLoc = -1;
    v9->_constantAttenuationLoc = -1;
    v9->_spotCutoffLoc = -1;
    v9->_spotExponentLoc = -1;
    v9->_normalizedSpotDirectionEyeLoc = -1;
    v9->_specularLoc = -1;
    v9->_diffuseLoc = -1;
    v9->_ambientTermLoc = -1;
    v9->_ambientLoc = -1;
    v9->_positionEyeLoc = -1;
    v9->_normalizeLoc = -1;
    v9->_lightIndex = -1;
    v9->_lightingType = a4;
    v9->_effectDirtyUniforms = 0;
    v9->_firstLight = a5;
    -[GLKEffectPropertyLight setGLDefaults](v9, "setGLDefaults");
  }
  return v9;
}

- (void)dirtyAllUniforms
{
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0x1FDC0000000);
}

- (void)setGLDefaults
{
  double v2;
  double v3;
  double v4;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  self->_position = (_GLKVector4)xmmword_20DC813C0;
  self->_positionEye = (_GLKVector4)xmmword_20DC813C0;
  v6 = 0.0;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  LODWORD(v4) = 1.0;
  -[GLKEffectPropertyLight setAmbientColor:](self, "setAmbientColor:", 0.0, v2, v3, v4);
  if (self->_firstLight)
    v6 = 1.0;
  LODWORD(v10) = 1.0;
  *(float *)&v7 = v6;
  *(float *)&v8 = v6;
  *(float *)&v9 = v6;
  -[GLKEffectPropertyLight setDiffuseColor:](self, "setDiffuseColor:", v7, v8, v9, v10);
  LODWORD(v11) = 1.0;
  *(float *)&v12 = v6;
  *(float *)&v13 = v6;
  *(float *)&v14 = v6;
  -[GLKEffectPropertyLight setSpecularColor:](self, "setSpecularColor:", v12, v13, v14, v11);
  *(_QWORD *)&self->_spotDirection.x = 0;
  self->_spotDirection.z = -1.0;
  *(_QWORD *)&self->_normalizedSpotDirectionEye.x = 0;
  self->_normalizedSpotDirectionEye.z = -1.0;
  self->_spotExponent = 0.0;
  self->_spotCutoff = 3.1416;
  self->_spotCutoffDegrees = 180.0;
  self->_constantAttenuation = 1.0;
  self->_linearAttenuation = 0.0;
  self->_quadraticAttenuation = 0.0;
}

- (void)initializeMasks
{
  uint64_t v3;

  *(_QWORD *)self->super._prv = objc_msgSend(*((id *)self->super._prv + 4), "vshMask");
  *((_QWORD *)self->super._prv + 2) = objc_msgSend(*((id *)self->super._prv + 4), "fshMask");
  _setMasks((uint64_t)self);
  v3 = *((_QWORD *)self->super._prv + 4);
  if (v3)
  {
    _lightStateChanged(v3);
    _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
    _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
  }
  -[GLKEffectProperty setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (void)setShaderBindings
{
  GLint params;
  char __str[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  snprintf(__str, 0x3FuLL, "light_positionEye[%d]", self->_lightIndex);
  self->_positionEyeLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_ambientColor[%d]", self->_lightIndex);
  self->_ambientLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_diffuseColor[%d]", self->_lightIndex);
  self->_diffuseLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_specularColor[%d]", self->_lightIndex);
  self->_specularLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_normalizedSpotDirectionEye[%d]", self->_lightIndex);
  self->_normalizedSpotDirectionEyeLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_spotExponent[%d]", self->_lightIndex);
  self->_spotExponentLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_spotCutoffAngle[%d]", self->_lightIndex);
  self->_spotCutoffLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_constantAttenuation[%d]", self->_lightIndex);
  self->_constantAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_linearAttenuation[%d]", self->_lightIndex);
  self->_linearAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "light_quadraticAttenuation[%d]", self->_lightIndex);
  self->_quadraticAttenuationLoc = glGetUniformLocation(params, __str);
  snprintf(__str, 0x3FuLL, "ambientTerm[%d]", self->_lightIndex);
  self->_ambientTermLoc = glGetUniformLocation(params, __str);
  self->_normalizeLoc = glGetUniformLocation(params, "normalizeNormal");
  -[GLKEffectPropertyLight dirtyAllUniforms](self, "dirtyAllUniforms");
}

- (void)setTransform:(GLKEffectPropertyTransform *)transform
{
  GLKEffectPropertyTransform *v5;

  if (transform)
  {
    v5 = self->_transform;
    if (v5 != transform)
    {

      self->_transform = transform;
    }
  }
}

- (void)setSpotDirection:(GLKVector3)spotDirection
{
  float x;
  float y;
  float z;
  _GLKVector3 *p_spotDirection;
  GLKEffectPropertyTransform *transform;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float v12;
  float v13;
  float v14;
  float32x2_t v15;
  float v16;
  float32x2_t v17;
  float v18;
  _OWORD v19[2];
  float v20[4];

  p_spotDirection = &self->_spotDirection;
  self->_spotDirection.x = x;
  self->_spotDirection.y = y;
  self->_spotDirection.z = z;
  transform = self->_transform;
  if (transform)
  {
    -[GLKEffectPropertyTransform normalMatrix](transform, "normalMatrix", *(_QWORD *)&spotDirection.x, *(_QWORD *)&spotDirection.v[2]);
    x = p_spotDirection->x;
    y = p_spotDirection->y;
    z = p_spotDirection->z;
    v9 = *(float32x2_t *)&v19[0];
    v10 = *(float32x2_t *)((char *)v19 + 12);
    v11 = *(float32x2_t *)((char *)&v19[1] + 8);
    v12 = *((float *)v19 + 2);
    v13 = *((float *)&v19[1] + 1);
    v14 = v20[0];
  }
  else
  {
    v20[0] = 0.0;
    memset(v19, 0, sizeof(v19));
    v11 = 0;
    v14 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
    v9 = 0;
    v10 = 0;
  }
  v15 = vmul_n_f32(v10, y);
  v16 = (float)((float)(y * v13) + (float)(v12 * x)) + (float)(v14 * z);
  v17 = vmla_n_f32(vmla_n_f32(v15, v9, x), v11, z);
  v18 = 1.0 / sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v17, v17).i32[1]), v17.f32[0], v17.f32[0]) + (float)(v16 * v16));
  *(float32x2_t *)&self->_normalizedSpotDirectionEye.x = vmul_n_f32(v17, v18);
  self->_normalizedSpotDirectionEye.z = v16 * v18;
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", v19[0], *(_QWORD *)&v19[1], *((_QWORD *)&v19[1] + 1), *(_QWORD *)v20) | 0x4000000000);
}

- (void)setSpecularColor:(GLKVector4)specularColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;

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
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&specularColor.x, *(_QWORD *)&specularColor.v[2]) | 0x2000000000);
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
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&diffuseColor.x, *(_QWORD *)&diffuseColor.v[2]) | 0x100000000);
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
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&ambientColor.x, *(_QWORD *)&ambientColor.v[2]) | 0x40000000);
    effectDirtyUniforms = self->_effectDirtyUniforms;
    if (effectDirtyUniforms)
      *effectDirtyUniforms |= 0x40000000uLL;
  }
}

- (void)setPosition:(GLKVector4)position
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  GLKEffectPropertyTransform *transform;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  _GLKVector4 v20;
  int v21;
  int v22;
  GLKEffectPropertyPrv *prv;
  int8x16_t *v24;
  uint64_t lightIndex;
  uint64_t v26;
  uint64_t v27;
  int8x16_t *v28;
  _GLKVector4 v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;

  v7 = v4;
  transform = self->_transform;
  if (transform)
  {
    v34 = v5;
    v36 = v6;
    v30 = v3;
    v32 = v4;
    -[GLKEffectPropertyTransform modelviewMatrix](transform, "modelviewMatrix", *(_QWORD *)&position.x, *(_QWORD *)&position.v[2]);
    v3 = v30;
    v7 = v32;
    v5 = v34;
    v6 = v36;
    v10 = v38;
    v11 = v39;
    v12 = v40;
    v13 = v41;
  }
  else
  {
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    v10 = 0uLL;
  }
  v14 = vaddq_f32(vaddq_f32(vmulq_n_f32(v10, v3), vmulq_n_f32(v11, v7)), vaddq_f32(vmulq_n_f32(v12, v5), vmulq_n_f32(v13, v6)));
  if (v14.f32[3] == 0.0)
  {
    v15 = vmulq_f32(v14, v14);
    v15.i64[0] = vpaddq_f32(v15, v15).u64[0];
    *(float32x2_t *)v15.f32 = vpadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32);
    v15.f32[0] = 1.0 / sqrtf(v15.f32[0]);
    v16 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0);
  }
  else
  {
    v17 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 3);
    v18 = vrecpeq_f32(v17);
    v19 = vmulq_f32(v18, vrecpsq_f32(v17, v18));
    v16 = vmulq_f32(vrecpsq_f32(v17, v19), v19);
  }
  v20 = (_GLKVector4)vmulq_f32(v14, v16);
  if (v20.x != self->_positionEye.x)
    goto LABEL_12;
  if (v20.y != self->_positionEye.y)
    goto LABEL_12;
  if (v20.z != self->_positionEye.z)
    goto LABEL_12;
  if (v20.w != self->_positionEye.w)
    goto LABEL_12;
  v35 = v5;
  v37 = v6;
  v31 = v3;
  v33 = v7;
  v29 = v20;
  v21 = -[GLKEffectProperty masksInitialized](self, "masksInitialized");
  v20 = v29;
  v3 = v31;
  v7 = v33;
  v5 = v35;
  v6 = v37;
  if (!v21)
  {
LABEL_12:
    self->_position.x = v3;
    self->_position.y = v7;
    self->_position.z = v5;
    self->_position.w = v6;
    self->_positionEye = v20;
    _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
    v22 = -[GLKEffectPropertyLight isSpot](self, "isSpot");
    prv = self->super._prv;
    v24 = *(int8x16_t **)prv;
    lightIndex = self->_lightIndex;
    v26 = 6;
    if (v22)
      v27 = 6;
    else
      v27 = 12;
    if (v22)
      v26 = 12;
    *v24 = vorrq_s8(*v24, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v27]);
    v28 = (int8x16_t *)*((_QWORD *)prv + 2);
    *v28 = vorrq_s8(*v28, *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v27]);
    *v24 = vbicq_s8(*v24, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v26]);
    *v28 = vbicq_s8(*v28, *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v26]);
    _attenuateMask((uint64_t)self);
    _positionalLightMask((uint64_t)self);
    _directionalLightMask((uint64_t)self);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x800000000);
  }
}

- (void)setNormalize:(unsigned __int8)a3
{
  glUniform1i(self->_normalizeLoc, 1);
}

- (void)setEnabled:(GLBOOLean)enabled
{
  if (self->_enabled != enabled || !-[GLKEffectProperty masksInitialized](self, "masksInitialized"))
  {
    self->_enabled = enabled;
    _lightStateChanged(*((_QWORD *)self->super._prv + 4));
    _setMasks((uint64_t)self);
    _vPositionEyeMask(*((_QWORD *)self->super._prv + 4));
    _normalizedNormalsMask(*((_QWORD *)self->super._prv + 4));
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
  }
}

- (void)setLightingType:(int)a3
{
  if (self->_lightingType != a3 || !-[GLKEffectProperty masksInitialized](self, "masksInitialized"))
  {
    self->_lightingType = a3;
    _lightStateChanged(*((_QWORD *)self->super._prv + 4));
    _setMasks((uint64_t)self);
  }
}

- (void)setSpotExponent:(GLfloat)spotExponent
{
  if (self->_spotExponent != spotExponent)
  {
    self->_spotExponent = spotExponent;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x8000000000);
  }
}

- (void)setQuadraticAttenuation:(GLfloat)quadraticAttenuation
{
  if (self->_quadraticAttenuation != quadraticAttenuation)
  {
    self->_quadraticAttenuation = quadraticAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x1000000000);
  }
}

- (void)setLinearAttenuation:(GLfloat)linearAttenuation
{
  if (self->_linearAttenuation != linearAttenuation)
  {
    self->_linearAttenuation = linearAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x400000000);
  }
}

- (void)setConstantAttenuation:(GLfloat)constantAttenuation
{
  if (self->_constantAttenuation != constantAttenuation)
  {
    self->_constantAttenuation = constantAttenuation;
    _attenuateMask((uint64_t)self);
    _modelviewMatrixMask(*((_QWORD *)self->super._prv + 4));
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x80000000);
  }
}

- (void)setSpotCutoff:(GLfloat)spotCutoff
{
  float v4;
  int v5;
  uint64_t lightIndex;
  uint64_t v7;
  uint64_t v8;

  if (self->_spotCutoffDegrees != spotCutoff)
  {
    self->_spotCutoffDegrees = spotCutoff;
    v4 = spotCutoff * 0.0174532925;
    self->_spotCutoff = v4;
    v5 = -[GLKEffectPropertyLight isSpot](self, "isSpot");
    lightIndex = self->_lightIndex;
    v7 = 6;
    if (v5)
      v8 = 6;
    else
      v8 = 12;
    *(int8x16_t *)*(_QWORD *)self->super._prv = vorrq_s8(*(int8x16_t *)*(_QWORD *)self->super._prv, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v8]);
    *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vorrq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v8]);
    if (v5)
      v7 = 12;
    *(int8x16_t *)*(_QWORD *)self->super._prv = vbicq_s8(*(int8x16_t *)*(_QWORD *)self->super._prv, *(int8x16_t *)&_staticVshMasks_0[2 * lightIndex + v7]);
    *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), *(int8x16_t *)&_staticFshMasks[2 * lightIndex + v7]);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x10000000000);
  }
}

- (GLfloat)spotCutoff
{
  return self->_spotCutoffDegrees;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t i;
  uint64_t v14;
  __CFString *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t j;
  uint64_t v20;
  __CFString *v21;
  _QWORD *v22;
  uint64_t v23;

  v6 = 0;
  v7 = &unk_2549DE828;
  v8 = &unk_2549DE6D8;
  do
  {
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lighting%d"), v6);
    *(v8 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", v9, a3, v6);
    *v8 = v10;
    *(v7 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", v9, a4, v6);
    *v7 = v11;
    ++v6;
    v7 += 2;
    v8 += 2;
  }
  while (v6 != 3);
  v12 = &unk_2549DE708;
  for (i = 1; i != 7; ++i)
  {
    v14 = 0;
    v15 = _maskStrs_0[i];
    v16 = v12;
    do
    {
      *(v16 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", v15, a3, v14);
      *v16 = v17;
      ++v14;
      v16 += 2;
    }
    while (v14 != 3);
    v12 += 6;
  }
  v18 = &unk_2549DE858;
  for (j = 1; j != 7; ++j)
  {
    v20 = 0;
    v21 = _maskStrs_0[j];
    v22 = v18;
    do
    {
      *(v22 - 1) = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", v21, a4, v20);
      *v22 = v23;
      ++v20;
      v22 += 2;
    }
    while (v20 != 3);
    v18 += 6;
  }
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (*(_OWORD *)((_BYTE *)a3 + 8) & *(_OWORD *)&self->_allVshMasks) == 0
        || (v3 = *(_QWORD **)self->super._prv, (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (*(_OWORD *)((_BYTE *)a3 + 8) & *(_OWORD *)&self->_allFshMasks) == 0
        || (v3 = (_QWORD *)*((_QWORD *)self->super._prv + 2), (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (unsigned)isSpot
{
  return self->_spotCutoff != 3.1416 && self->_position.w != 0.0;
}

- (unsigned)isAttenuated
{
  float v3;
  float v4;
  float v5;
  float v6;
  unsigned __int8 result;

  -[GLKEffectPropertyLight position](self, "position");
  result = 0;
  if (v3 != 0.0)
  {
    -[GLKEffectPropertyLight constantAttenuation](self, "constantAttenuation");
    if (v4 != 1.0)
      return 1;
    -[GLKEffectPropertyLight linearAttenuation](self, "linearAttenuation");
    if (v5 != 0.0)
      return 1;
    -[GLKEffectPropertyLight quadraticAttenuation](self, "quadraticAttenuation");
    if (v6 != 0.0)
      return 1;
  }
  return result;
}

- (void)bind
{
  if (-[GLKEffectPropertyLight enabled](self, "enabled") && -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms"))
  {
    glUniform1i(self->_normalizeLoc, 1);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x800000000) != 0)
      glUniform4fv(self->_positionEyeLoc, 1, &self->_positionEye.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x40000000) != 0)
      glUniform4fv(self->_ambientLoc, 1, &self->_ambientColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x100000000) != 0)
      glUniform4fv(self->_diffuseLoc, 1, &self->_diffuseColor.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x2000000000) != 0)
      glUniform4fv(self->_specularLoc, 1, &self->_specularColor.x);
    if (self->_position.w != 0.0)
    {
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x4000000000) != 0)
        glUniform3fv(self->_normalizedSpotDirectionEyeLoc, 1, &self->_normalizedSpotDirectionEye.x);
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x8000000000) != 0)
        glUniform1f(self->_spotExponentLoc, self->_spotExponent);
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x10000000000) != 0)
        glUniform1f(self->_spotCutoffLoc, self->_spotCutoff);
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x80000000) != 0)
        glUniform1f(self->_constantAttenuationLoc, self->_constantAttenuation);
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x400000000) != 0)
        glUniform1f(self->_linearAttenuationLoc, self->_linearAttenuation);
      if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x1000000000) != 0)
        glUniform1f(self->_quadraticAttenuationLoc, self->_quadraticAttenuation);
    }
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0);
  }
}

- (void)setLightIndex:(int)a3
{
  uint64_t v3;
  GLKBigInt_s v4;
  uint64_t v5;
  GLKBigInt_s v6;

  if (self->_lightIndex != a3)
  {
    v3 = 0;
    self->_lightIndex = a3;
    v4 = (GLKBigInt_s)0;
    self->_allVshMasks = 0u;
    do
    {
      v4 = (GLKBigInt_s)vorrq_s8((int8x16_t)v4, *(int8x16_t *)&_staticVshMasks_0[2 * a3 + v3]);
      self->_allVshMasks = v4;
      v3 += 6;
    }
    while (v3 != 42);
    v5 = 0;
    v6 = (GLKBigInt_s)0;
    self->_allFshMasks = 0u;
    do
    {
      v6 = (GLKBigInt_s)vorrq_s8((int8x16_t)v6, *(int8x16_t *)&_staticFshMasks[2 * a3 + v5]);
      self->_allFshMasks = v6;
      v5 += 6;
    }
    while (v5 != 42);
  }
}

- (id)description
{
  id v3;
  GLKVector3 v5;
  GLKVector4 v6;
  GLKVector4 v7;
  GLKVector4 v8;
  GLKVector4 v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %p\n{\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  *(_QWORD *)&v6.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tenabled =        %d\n"), self->_enabled);
  *(_QWORD *)&v7.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tposition =       %@\n"), NSStringFromGLKVector4(v6));
  *(_QWORD *)&v8.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tambientColor =   %@\n"), NSStringFromGLKVector4(v7));
  *(_QWORD *)&v9.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tdiffuseColor =   %@\n"), NSStringFromGLKVector4(v8));
  *(_QWORD *)&v5.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tspecularColor =  %@\n"), NSStringFromGLKVector4(v9));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tspotDirection =  %@\n"), NSStringFromGLKVector3(v5));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tspotExponent =   %-6.4f\n"), self->_spotExponent);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tspotCutoff =     %-6.4f\n"), self->_spotCutoff);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tconstantAtten =  %-6.4f\n"), self->_constantAttenuation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tlinearAtten =    %-6.4f\n"), self->_linearAttenuation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tquadraticAtten = %-6.4f\n"), self->_linearAttenuation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\ttransform =      %@\n"), -[GLKEffectPropertyTransform description](self->_transform, "description"));
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKEffectPropertyLight;
  -[GLKEffectProperty dealloc](&v3, sel_dealloc);
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (GLKVector4)position
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (_GLKVector4)positionEye
{
  _GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (void)setPositionEye:(_GLKVector4)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_positionEye.x = v3;
  self->_positionEye.y = v4;
  self->_positionEye.z = v5;
  self->_positionEye.w = v6;
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

- (GLKVector3)spotDirection
{
  GLKVector3 result;

  result.z = *(float *)&a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (_GLKVector3)normalizedSpotDirectionEye
{
  _GLKVector3 result;

  result.z = *(float *)&a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (void)setNormalizedSpotDirectionEye:(_GLKVector3)a3
{
  float v3;
  float v4;
  float v5;

  self->_normalizedSpotDirectionEye.x = v3;
  self->_normalizedSpotDirectionEye.y = v4;
  self->_normalizedSpotDirectionEye.z = v5;
}

- (GLfloat)spotExponent
{
  return self->_spotExponent;
}

- (float)spotCutoffDegrees
{
  return self->_spotCutoffDegrees;
}

- (void)setSpotCutoffDegrees:(float)a3
{
  self->_spotCutoffDegrees = a3;
}

- (GLfloat)constantAttenuation
{
  return self->_constantAttenuation;
}

- (GLfloat)linearAttenuation
{
  return self->_linearAttenuation;
}

- (GLfloat)quadraticAttenuation
{
  return self->_quadraticAttenuation;
}

- (unint64_t)effectDirtyUniforms
{
  return self->_effectDirtyUniforms;
}

- (void)setEffectDirtyUniforms:(unint64_t *)a3
{
  self->_effectDirtyUniforms = a3;
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (unsigned)positionEyeStale
{
  return self->_positionEyeStale;
}

- (void)setPositionEyeStale:(unsigned __int8)a3
{
  self->_positionEyeStale = a3;
}

- (int)positionEyeLoc
{
  return self->_positionEyeLoc;
}

- (void)setPositionEyeLoc:(int)a3
{
  self->_positionEyeLoc = a3;
}

- (int)ambientLoc
{
  return self->_ambientLoc;
}

- (void)setAmbientLoc:(int)a3
{
  self->_ambientLoc = a3;
}

- (int)diffuseLoc
{
  return self->_diffuseLoc;
}

- (void)setDiffuseLoc:(int)a3
{
  self->_diffuseLoc = a3;
}

- (int)specularLoc
{
  return self->_specularLoc;
}

- (void)setSpecularLoc:(int)a3
{
  self->_specularLoc = a3;
}

- (int)normalizedSpotDirectionEyeLoc
{
  return self->_normalizedSpotDirectionEyeLoc;
}

- (void)setNormalizedSpotDirectionEyeLoc:(int)a3
{
  self->_normalizedSpotDirectionEyeLoc = a3;
}

- (int)spotExponentLoc
{
  return self->_spotExponentLoc;
}

- (void)setSpotExponentLoc:(int)a3
{
  self->_spotExponentLoc = a3;
}

- (int)spotCutoffLoc
{
  return self->_spotCutoffLoc;
}

- (void)setSpotCutoffLoc:(int)a3
{
  self->_spotCutoffLoc = a3;
}

- (int)constantAttenuationLoc
{
  return self->_constantAttenuationLoc;
}

- (void)setConstantAttenuationLoc:(int)a3
{
  self->_constantAttenuationLoc = a3;
}

- (int)linearAttenuationLoc
{
  return self->_linearAttenuationLoc;
}

- (void)setLinearAttenuationLoc:(int)a3
{
  self->_linearAttenuationLoc = a3;
}

- (int)quadraticAttenuationLoc
{
  return self->_quadraticAttenuationLoc;
}

- (void)setQuadraticAttenuationLoc:(int)a3
{
  self->_quadraticAttenuationLoc = a3;
}

- (int)normalizeLoc
{
  return self->_normalizeLoc;
}

- (void)setNormalizeLoc:(int)a3
{
  self->_normalizeLoc = a3;
}

- (int)ambientTermLoc
{
  return self->_ambientTermLoc;
}

- (void)setAmbientTermLoc:(int)a3
{
  self->_ambientTermLoc = a3;
}

- (int)lightIndex
{
  return self->_lightIndex;
}

- (int)lightingType
{
  return self->_lightingType;
}

- (unsigned)firstLight
{
  return self->_firstLight;
}

- (void)setFirstLight:(unsigned __int8)a3
{
  self->_firstLight = a3;
}

- (GLKBigInt_s)allVshMasks
{
  GLKBigInt_s *p_allVshMasks;
  unint64_t n0;
  unint64_t n1;
  GLKBigInt_s result;

  p_allVshMasks = &self->_allVshMasks;
  n0 = self->_allVshMasks.n0;
  n1 = p_allVshMasks->n1;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

- (GLKBigInt_s)allFshMasks
{
  GLKBigInt_s *p_allFshMasks;
  unint64_t n0;
  unint64_t n1;
  GLKBigInt_s result;

  p_allFshMasks = &self->_allFshMasks;
  n0 = self->_allFshMasks.n0;
  n1 = p_allFshMasks->n1;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

@end
