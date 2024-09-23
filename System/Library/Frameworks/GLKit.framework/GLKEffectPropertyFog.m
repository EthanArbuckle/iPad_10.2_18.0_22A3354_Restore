@implementation GLKEffectPropertyFog

- (GLKEffectPropertyFog)init
{
  GLKEffectPropertyFog *v2;
  GLKEffectPropertyFog *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKEffectPropertyFog;
  v2 = -[GLKEffectProperty init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 0;
    v2->_mode = 0;
    *(_QWORD *)&v2->_color.x = 0;
    *(_QWORD *)&v2->_color.v[2] = 0;
    v2->_density = 1.0;
    v2->_end = 1.0;
    v2->_start = 0.0;
    -[GLKEffectProperty setMasksInitialized:](v2, "setMasksInitialized:", 0);
  }
  return v3;
}

- (void)dirtyAllUniforms
{
  -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 126976);
}

- (void)initializeMasks
{
  GLKEffectPropertyPrv *prv;
  int8x16_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t mode;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)self->super._prv = objc_msgSend(*((id *)self->super._prv + 4), "vshMask");
  *((_QWORD *)self->super._prv + 2) = objc_msgSend(*((id *)self->super._prv + 4), "fshMask");
  prv = self->super._prv;
  v4 = *(int8x16_t **)prv;
  if (self->_enabled)
  {
    v5 = v4->i64[1] | *((_QWORD *)&_staticVshMasks + 1);
    v4->i64[0] |= _staticVshMasks;
    v4->i64[1] = v5;
    v6 = (_QWORD *)*((_QWORD *)prv + 2);
    v7 = v6[1] | _staticFshMasks_1;
    *v6 |= _staticFshMasks_0;
    v6[1] = v7;
  }
  else
  {
    *v4 = vbicq_s8(*v4, (int8x16_t)_staticVshMasks);
    *(int8x16_t *)*((_QWORD *)prv + 2) = vbicq_s8(*(int8x16_t *)*((_QWORD *)prv + 2), (int8x16_t)__PAIR128__(_staticFshMasks_1, _staticFshMasks_0));
  }
  mode = self->_mode;
  if (mode <= 2)
  {
    v9 = *(&off_24C848170 + mode);
    v10 = *(&off_24C848188 + mode);
    v11 = *(&off_24C8481A0 + mode);
    v12 = *(&off_24C8481B8 + mode);
    v13 = *(&off_24C8481D0 + mode);
    v14 = *(&off_24C8481E8 + mode);
    v15 = v4->i64[0] | *v9;
    v16 = v4->i64[1] | *v10;
    v4->i64[0] = v15;
    v4->i64[1] = v16;
    v17 = v15 & ~*v11;
    v18 = v16 & ~*v12;
    v4->i64[0] = v17;
    v4->i64[1] = v18;
    v19 = v18 & ~*v14;
    v4->i64[0] = v17 & ~*v13;
    v4->i64[1] = v19;
  }
  -[GLKEffectProperty setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (void)setEnabled:(GLBOOLean)enabled
{
  int v3;
  int8x16_t *v5;
  uint64_t v6;
  GLKEffectPropertyPrv *prv;
  _QWORD *v8;
  uint64_t v9;

  v3 = enabled;
  if (self->_enabled != enabled || !-[GLKEffectProperty masksInitialized](self, "masksInitialized"))
  {
    self->_enabled = v3;
    v5 = *(int8x16_t **)self->super._prv;
    if (v3)
    {
      v6 = v5->i64[1] | *((_QWORD *)&_staticVshMasks + 1);
      v5->i64[0] |= _staticVshMasks;
      prv = self->super._prv;
      v5->i64[1] = v6;
      v8 = (_QWORD *)*((_QWORD *)prv + 2);
      v9 = v8[1] | _staticFshMasks_1;
      *v8 |= _staticFshMasks_0;
      v8[1] = v9;
    }
    else
    {
      *v5 = vbicq_s8(*v5, (int8x16_t)_staticVshMasks);
      *(int8x16_t *)*((_QWORD *)self->super._prv + 2) = vbicq_s8(*(int8x16_t *)*((_QWORD *)self->super._prv + 2), (int8x16_t)__PAIR128__(_staticFshMasks_1, _staticFshMasks_0));
    }
  }
}

- (void)setMode:(GLint)mode
{
  int8x16_t *v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  int8x16_t v10;

  if (self->_mode == mode)
  {
    if (!-[GLKEffectProperty masksInitialized](self, "masksInitialized") && mode < 3)
      goto LABEL_4;
  }
  else if (mode <= 2)
  {
LABEL_4:
    v5 = (int8x16_t *)*(&off_24C8481A0 + mode);
    v6 = (uint64_t *)*(&off_24C8481D0 + mode);
    v7 = *(_QWORD **)self->super._prv;
    v8 = (uint64_t *)*(&off_24C8481E8 + mode);
    v9 = v7[1] | *(_QWORD *)*(&off_24C848188 + mode);
    *v7 |= *(_QWORD *)*(&off_24C848170 + mode);
    v7[1] = v9;
    *(int8x16_t *)*(_QWORD *)self->super._prv = vbicq_s8(*(int8x16_t *)*(_QWORD *)self->super._prv, *v5);
    v10.i64[0] = *v6;
    v10.i64[1] = *v8;
    *(int8x16_t *)*(_QWORD *)self->super._prv = vbicq_s8(*(int8x16_t *)*(_QWORD *)self->super._prv, v10);
    self->_mode = mode;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x2000);
  }
}

- (void)setDensity:(GLfloat)density
{
  if (self->_density != density)
  {
    self->_density = density;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x4000);
  }
}

- (void)setStart:(GLfloat)start
{
  if (self->_start != start)
  {
    self->_start = start;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x8000);
  }
}

- (void)setEnd:(GLfloat)end
{
  if (self->_end != end)
  {
    self->_end = end;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") | 0x10000);
  }
}

- (void)setColor:(GLKVector4)color
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_color);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_color.x = v3;
    self->_color.y = v4;
    self->_color.z = v5;
    self->_color.w = v6;
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&color.x, *(_QWORD *)&color.v[2]) | 0x1000);
  }
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (_allVshMasks & *(_OWORD *)((_BYTE *)a3 + 8)) == 0
        || (v3 = *(_QWORD **)self->super._prv, (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  _QWORD *v3;
  BOOL result;

  result = (_allFshMasks & *(_OWORD *)((_BYTE *)a3 + 8)) == 0
        || (v3 = (_QWORD *)*((_QWORD *)self->super._prv + 2), (*v3 & *((_QWORD *)a3 + 1)) != 0)
        || (*((_QWORD *)a3 + 2) & v3[1]) != 0;
  return result;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = 0;
  _allVshMasks = 0uLL;
  _allFshMasks = 0uLL;
  v7 = (_QWORD *)&_staticVshMasks + 1;
  do
  {
    v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", _maskStrs[v6], a3, objc_msgSend(a3, "index"));
    *(v7 - 1) = v8;
    *v7 = v9;
    *(_QWORD *)&_allVshMasks = _allVshMasks | v8;
    *((_QWORD *)&_allVshMasks + 1) |= v9;
    ++v6;
    v7 += 2;
  }
  while (v6 != 4);
  _staticFshMasks_0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("fog enabled"), a4, objc_msgSend(a4, "index"));
  _staticFshMasks_1 = v10;
  *(_QWORD *)&_allFshMasks = _allFshMasks | _staticFshMasks_0;
  *((_QWORD *)&_allFshMasks + 1) |= v10;
}

- (void)setShaderBindings
{
  GLint params;

  params = 0;
  glGetIntegerv(0x8B8Du, &params);
  self->_modeLoc = glGetUniformLocation(params, "fog.mode");
  self->_colorLoc = glGetUniformLocation(params, "fog.color");
  self->_densityLoc = glGetUniformLocation(params, "fog.density");
  self->_startLoc = glGetUniformLocation(params, "fog.start");
  self->_endLoc = glGetUniformLocation(params, "fog.end");
  -[GLKEffectPropertyFog dirtyAllUniforms](self, "dirtyAllUniforms");
}

- (void)bind
{
  if (-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms"))
  {
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x1000) != 0)
      glUniform4fv(self->_colorLoc, 1, &self->_color.x);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x2000) != 0)
      glUniform1i(self->_modeLoc, self->_mode);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x4000) != 0)
      glUniform1f(self->_densityLoc, self->_density);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x8000) != 0)
      glUniform1f(self->_startLoc, self->_start);
    if ((-[GLKEffectProperty dirtyUniforms](self, "dirtyUniforms") & 0x10000) != 0)
      glUniform1f(self->_endLoc, self->_end);
    -[GLKEffectProperty setDirtyUniforms:](self, "setDirtyUniforms:", 0);
  }
}

- (id)description
{
  id v3;
  int mode;
  const __CFString *v5;
  const __CFString *v6;
  GLKVector4 v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %p\n{\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tenabled = %d\n"), self->_enabled);
  mode = self->_mode;
  v5 = CFSTR("GLKFogModeLinear");
  if (mode == 1)
    v5 = CFSTR("GLKFogModeExp2");
  if (mode)
    v6 = v5;
  else
    v6 = CFSTR("GLKFogModeExp");
  *(_QWORD *)&v8.x = objc_msgSend(v3, "appendFormat:", CFSTR("\tmode =    %@\n"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcolor =   %@\n"), NSStringFromGLKVector4(v8));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdensity = %6.4f\n"), self->_density);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tstart =   %6.4f\n"), self->_start);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tend =     %6.4f\n"), self->_end);
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GLKEffectPropertyFog;
  -[GLKEffectProperty dealloc](&v2, sel_dealloc);
}

- (GLBOOLean)enabled
{
  return self->_enabled;
}

- (GLint)mode
{
  return self->_mode;
}

- (GLKVector4)color
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (GLfloat)density
{
  return self->_density;
}

- (GLfloat)start
{
  return self->_start;
}

- (GLfloat)end
{
  return self->_end;
}

- (int)modeLoc
{
  return self->_modeLoc;
}

- (void)setModeLoc:(int)a3
{
  self->_modeLoc = a3;
}

- (int)colorLoc
{
  return self->_colorLoc;
}

- (void)setColorLoc:(int)a3
{
  self->_colorLoc = a3;
}

- (int)densityLoc
{
  return self->_densityLoc;
}

- (void)setDensityLoc:(int)a3
{
  self->_densityLoc = a3;
}

- (int)startLoc
{
  return self->_startLoc;
}

- (void)setStartLoc:(int)a3
{
  self->_startLoc = a3;
}

- (int)endLoc
{
  return self->_endLoc;
}

- (void)setEndLoc:(int)a3
{
  self->_endLoc = a3;
}

@end
