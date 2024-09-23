@implementation _LSDIconService

+ (unsigned)connectionType
{
  return 10;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_27);
  return (id)XPCInterface_interface;
}

@end
