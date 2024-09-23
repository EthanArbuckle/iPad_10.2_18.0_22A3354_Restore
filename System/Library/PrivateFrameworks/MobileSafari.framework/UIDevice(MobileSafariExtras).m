@implementation UIDevice(MobileSafariExtras)

+ (uint64_t)safari_mainScreenClass
{
  if (safari_mainScreenClass_onceToken != -1)
    dispatch_once(&safari_mainScreenClass_onceToken, &__block_literal_global_59);
  return safari_mainScreenClass_mainScreenClass;
}

@end
