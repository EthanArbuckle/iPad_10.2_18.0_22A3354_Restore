@implementation AMSBag(AppleMediaServicesUI)

+ (uint64_t)amsui_internalBag
{
  if (amsui_internalBag_onceToken != -1)
    dispatch_once(&amsui_internalBag_onceToken, &__block_literal_global);
  return objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("appstored"), CFSTR("1"));
}

@end
