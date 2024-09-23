@implementation MDLLight

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(NSString *)colorSpace
{
  CGColorSpace *cgColorSpace;
  __CFString *name;

  name = colorSpace;
  objc_storeStrong((id *)&self->_colorSpace, colorSpace);
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace)
    CGColorSpaceRelease(cgColorSpace);
  self->_cgColorSpace = CGColorSpaceCreateWithName(name);

}

- (MDLLight)init
{
  MDLLight *v2;
  MDLTransform *v3;
  const char *v4;
  const __CFString *v5;
  CGColorSpace *v6;
  CGColor *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  MDLLight *v12;
  objc_super v14;
  CGFloat components[2];
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MDLLight;
  v2 = -[MDLObject init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MDLTransform);
    objc_msgSend_setTransform_(v2, v4, (uint64_t)v3);

    v5 = (const __CFString *)*MEMORY[0x1E0C9DA10];
    objc_storeStrong((id *)&v2->_colorSpace, (id)*MEMORY[0x1E0C9DA10]);
    v6 = CGColorSpaceCreateWithName(v5);
    v2->_cgColorSpace = v6;
    *(_OWORD *)components = xmmword_1DCC58598;
    v16 = unk_1DCC585A8;
    v7 = CGColorCreate(v6, components);
    v8 = operator new();
    objc_msgSend_transform(v2, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1DCB87DDC(v8, v11, v7);
    v2->_light = (RTLight *)v8;

    CGColorRelease(v7);
    v2->_lightType = 0;
    v12 = v2;
  }

  return v2;
}

- (void)dealloc
{
  RTLight *light;
  CGColorSpace *cgColorSpace;
  objc_super v5;

  light = self->_light;
  if (light)
  {
    (*((void (**)(RTLight *, SEL))light->var0 + 1))(light, a2);
    self->_light = 0;
  }
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace)
  {
    CGColorSpaceRelease(cgColorSpace);
    self->_cgColorSpace = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MDLLight;
  -[MDLLight dealloc](&v5, sel_dealloc);
}

- (void)setLightType:(MDLLightType)lightType
{
  int v3;

  self->_lightType = lightType;
  if (lightType - 1 > 3)
    v3 = 3;
  else
    v3 = dword_1DCC58570[lightType - 1];
  self->_light->var3 = v3;
}

- (RTLight)rtLight
{
  return self->_light;
}

- (CGColorRef)irradianceAtPoint:(vector_float3)point
{
  return (CGColorRef)(*((uint64_t (**)(RTLight *))self->_light->var0 + 2))(self->_light);
}

- (CGColorRef)irradianceAtPoint:(vector_float3)point colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CGColorRef)(*((uint64_t (**)(RTLight *, uint64_t))self->_light->var0 + 3))(self->_light, point.i64[0]);
}

- (void)setTransform:(id)a3
{
  id v5;
  objc_super v6;

  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MDLLight;
  -[MDLObject setTransform:](&v6, sel_setTransform_, v5);
  if (self->_light)
    objc_storeStrong(&self->_light->var2, a3);

}

- (__n128)position
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;

  objc_msgSend_transform(a1, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_transform(a1, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_matrix(v7, v8, v9);
    v12 = v10;

  }
  else
  {
    v12 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  }

  return (__n128)v12;
}

- (MDLLightType)lightType
{
  return self->_lightType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

@end
