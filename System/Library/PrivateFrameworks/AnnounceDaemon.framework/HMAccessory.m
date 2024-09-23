@implementation HMAccessory

uint64_t __64__HMAccessory_Announce__an_announceSettingFromAccessorySettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("root.announce"));

  return v3;
}

uint64_t __64__HMAccessory_Announce__an_announceSettingFromAccessorySettings__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("root.announce.enabled"));

  return v3;
}

@end
