@implementation CILinearBurnBlendMode

- (CILinearBurnBlendMode)init
{
  CILinearBurnBlendMode *v2;
  CILinearBurnBlendMode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CILinearBurnBlendMode;
  v2 = -[CILinearBurnBlendMode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CILinearBurnBlendMode setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CILinearBurnBlendMode _defaultVersion](v2, "_defaultVersion")), CFSTR("__inputVersion"));
  return v3;
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CILinearBurnBlendMode;
  -[CIFilter setDefaults](&v3, sel_setDefaults);
  -[CILinearBurnBlendMode setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CILinearBurnBlendMode _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
}

- (int)_maxVersion
{
  return 1;
}

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_linearBurnBlendMode_v0);
}

- (id)_kernel_v1
{
  return +[CIBlendKernel linearBurn](CIBlendKernel, "linearBurn");
}

- (id)_kernel
{
  int v3;

  v3 = objc_msgSend((id)-[CILinearBurnBlendMode valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
  if (v3 == 1)
    return -[CILinearBurnBlendMode _kernel_v1](self, "_kernel_v1");
  if (v3)
    return 0;
  return -[CILinearBurnBlendMode _kernel_v0](self, "_kernel_v0");
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryCompositeOperation");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryInterlaced");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("8");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.10");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

@end
