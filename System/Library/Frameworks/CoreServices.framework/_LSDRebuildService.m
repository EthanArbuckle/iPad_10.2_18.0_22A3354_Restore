@implementation _LSDRebuildService

+ (BOOL)isEnabled
{
  return objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInSyncBubble") ^ 1;
}

+ (unsigned)connectionType
{
  return 13;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34___LSDRebuildService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDRebuildService XPCInterface]::once != -1)
    dispatch_once(&+[_LSDRebuildService XPCInterface]::once, v3);
  return (id)+[_LSDRebuildService XPCInterface]::result;
}

@end
