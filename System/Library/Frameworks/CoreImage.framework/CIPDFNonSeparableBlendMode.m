@implementation CIPDFNonSeparableBlendMode

- (CIPDFNonSeparableBlendMode)init
{
  CIPDFNonSeparableBlendMode *v2;
  CIPDFNonSeparableBlendMode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIPDFNonSeparableBlendMode;
  v2 = -[CIPDFNonSeparableBlendMode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CIPDFNonSeparableBlendMode setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPDFNonSeparableBlendMode _defaultVersion](v2, "_defaultVersion")), CFSTR("__inputVersion"));
  return v3;
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIPDFNonSeparableBlendMode;
  -[CIFilter setDefaults](&v3, sel_setDefaults);
  -[CIPDFNonSeparableBlendMode setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPDFNonSeparableBlendMode _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
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
  return 0;
}

- (id)_kernel_v1
{
  return 0;
}

- (id)_kernel
{
  int v3;

  v3 = objc_msgSend((id)-[CIPDFNonSeparableBlendMode valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "intValue");
  if (v3 == 1)
    return -[CIPDFNonSeparableBlendMode _kernel_v1](self, "_kernel_v1");
  if (v3)
    return 0;
  return -[CIPDFNonSeparableBlendMode _kernel_v0](self, "_kernel_v0");
}

@end
