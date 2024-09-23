@implementation HMMaxLengthForNaming

void __HMMaxLengthForNaming_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("maxLengthForNaming"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMMaxLengthForNaming__hmf_once_v6 = objc_msgSend(v1, "unsignedIntValue");

}

@end
