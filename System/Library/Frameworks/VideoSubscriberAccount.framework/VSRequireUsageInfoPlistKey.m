@implementation VSRequireUsageInfoPlistKey

void __VSRequireUsageInfoPlistKey_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("NSVideoSubscriberAccountUsageDescription"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSRequireUsageInfoPlistKey_usageValueOrNil;
  VSRequireUsageInfoPlistKey_usageValueOrNil = v0;

}

@end
