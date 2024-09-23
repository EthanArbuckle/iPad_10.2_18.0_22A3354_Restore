@implementation MDLPhysicallyPlausibleLight

- (MDLPhysicallyPlausibleLight)init
{
  MDLPhysicallyPlausibleLight *v2;
  MDLPhysicallyPlausibleLight *v3;
  RTLight *light;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  CGColor *v11;
  const char *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  MDLPhysicallyPlausibleLight *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)MDLPhysicallyPlausibleLight;
  v2 = -[MDLLight init](&v33, sel_init);
  v3 = v2;
  if (v2)
  {
    light = v2->super._light;
    if (light)
      (*((void (**)(RTLight *))light->var0 + 1))(light);
    v5 = operator new();
    objc_msgSend_transform(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9.i32[0] = 1170939904;
    v11 = sub_1DCAECFE4(v9, v10);
    sub_1DCB87ED4(v5, v8, v11);

    *(_DWORD *)(v5 + 48) = 1056964608;
    v3->super._light = (RTLight *)v5;
    objc_msgSend_setLightType_(v3, v12, 3);
    LODWORD(v13) = 1102315520;
    objc_msgSend_setInnerConeAngle_(v3, v14, v15, v13);
    LODWORD(v16) = 1110704128;
    objc_msgSend_setOuterConeAngle_(v3, v17, v18, v16);
    LODWORD(v19) = 1.0;
    objc_msgSend_setAttenuationStartDistance_(v3, v20, v21, v19);
    LODWORD(v22) = 1128792064;
    objc_msgSend_setAttenuationEndDistance_(v3, v23, v24, v22);
    LODWORD(v25) = 2.0;
    objc_msgSend_setAttenuationFalloffExponent_(v3, v26, v27, v25);
    LODWORD(v28) = 1148846080;
    objc_msgSend_setLumens_(v3, v29, v30, v28);
    v31 = v3;
  }

  return v3;
}

- (void)setColor:(CGColorRef)color
{
  float32x4_t v3;
  float32x4_t v4;
  RTLight *light;
  RTLight *v6;
  CGColor *v7;

  light = self->super._light;
  if (color)
  {
    v6 = self->super._light;
    v7 = color;
  }
  else
  {
    v3.i32[0] = 1170939904;
    v7 = sub_1DCAECFE4(v3, v4);
    v6 = light;
  }
  sub_1DCB87E58((uint64_t)v6, v7);
}

- (CGColorRef)color
{
  return self->super._light->var1;
}

- (void)setColorByTemperature:(float)temperature
{
  float32x4_t v3;
  RTLight *light;
  CGColor *v5;

  light = self->super._light;
  v5 = sub_1DCAECFE4(*(float32x4_t *)&temperature, v3);
  sub_1DCB87E58((uint64_t)light, v5);
}

- (void)setInnerConeAngle:(float)innerConeAngle
{
  self->_innerConeAngle = innerConeAngle;
  *((float *)&self->super._light->var3 + 1) = innerConeAngle;
}

- (void)setOuterConeAngle:(float)outerConeAngle
{
  self->_outerConeAngle = outerConeAngle;
  *(float *)&self->super._light[1].var0 = outerConeAngle;
}

- (void)setAttenuationEndDistance:(float)attenuationEndDistance
{
  self->_attenuationEndDistance = attenuationEndDistance;
  *(float *)&self->super._light[1].var1 = attenuationEndDistance;
}

- (void)setAttenuationStartDistance:(float)attenuationStartDistance
{
  self->_attenuationStartDistance = attenuationStartDistance;
  *((float *)&self->super._light[1].var0 + 1) = attenuationStartDistance;
}

- (void)setAttenuationFalloffExponent:(float)a3
{
  self->_attenuationFalloffExponent = a3;
  *((float *)&self->super._light[1].var1 + 1) = a3;
}

- (void)setLumens:(float)lumens
{
  self->_lumens = lumens;
  *((float *)&self->super._light[1].var2 + 1) = lumens;
}

- (float)lumens
{
  return self->_lumens;
}

- (float)innerConeAngle
{
  return self->_innerConeAngle;
}

- (float)outerConeAngle
{
  return self->_outerConeAngle;
}

- (float)attenuationStartDistance
{
  return self->_attenuationStartDistance;
}

- (float)attenuationEndDistance
{
  return self->_attenuationEndDistance;
}

- (float)attenuationFalloffExponent
{
  return self->_attenuationFalloffExponent;
}

@end
