@implementation MDLAreaLight

- (MDLAreaLight)init
{
  MDLAreaLight *v2;
  float32x4_t v3;
  float32x4_t v4;
  MDLAreaLight *v5;
  RTLight *light;
  CGColor *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
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
  MDLAreaLight *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MDLAreaLight;
  v2 = -[MDLPhysicallyPlausibleLight init](&v24, sel_init);
  v5 = v2;
  if (v2)
  {
    light = v2->super.super._light;
    if (light)
      v3 = (float32x4_t)((__n128 (*)(RTLight *))*((_QWORD *)light->var0 + 1))(light);
    v3.i32[0] = 1170939904;
    v7 = sub_1DCAECFE4(v3, v4);
    v8 = operator new();
    objc_msgSend_transform(v5, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1DCB885DC(v8, v11, v7);
    v5->super.super._light = (RTLight *)v8;

    CGColorRelease(v7);
    objc_msgSend_setLightType_(v5, v12, 8);
    LODWORD(v13) = 0;
    objc_msgSend_setAttenuationStartDistance_(v5, v14, v15, v13);
    LODWORD(v16) = 0;
    objc_msgSend_setAttenuationEndDistance_(v5, v17, v18, v16);
    LODWORD(v19) = 2.0;
    objc_msgSend_setAttenuationFalloffExponent_(v5, v20, v21, v19);
    v22 = v5;
  }

  return v5;
}

- (void)setAreaRadius:(float)areaRadius
{
  self->_areaRadius = areaRadius;
  *(float *)&self->super.super._light[1].var2 = areaRadius;
}

- (void)setAspect:(float)aspect
{
  self->_aspect = aspect;
  *(float *)&self->super.super._light[2].var0 = aspect;
}

- (void)setSuperEllipticPower:(vector_float2)superEllipticPower
{
  *(vector_float2 *)self->_superEllipticPower = superEllipticPower;
  *(vector_float2 *)&self->super.super._light[1].var3 = superEllipticPower;
}

- (float)areaRadius
{
  return self->_areaRadius;
}

- (vector_float2)superEllipticPower
{
  return *(vector_float2 *)self->_superEllipticPower;
}

- (float)aspect
{
  return self->_aspect;
}

@end
