@implementation _LSDReadService

+ (unsigned)connectionType
{
  return 0;
}

+ (id)XPCInterface
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31___LSDReadService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDReadService XPCInterface]::once != -1)
    dispatch_once(&+[_LSDReadService XPCInterface]::once, v3);
  return (id)+[_LSDReadService XPCInterface]::result;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isEnabled
{
  return 1;
}

@end
