@implementation CNUIApplicationLaunchOptions

+ (id)defaultOptions
{
  if (defaultOptions_cn_once_token_2 != -1)
    dispatch_once(&defaultOptions_cn_once_token_2, &__block_literal_global_66);
  return (id)defaultOptions_cn_once_object_2;
}

void __46__CNUIApplicationLaunchOptions_defaultOptions__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  getFBSOpenApplicationOptionKeyUnlockDevice();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v1 = MEMORY[0x1E0C9AAB0];
  v7[0] = MEMORY[0x1E0C9AAB0];
  getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v7[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)defaultOptions_cn_once_object_2;
  defaultOptions_cn_once_object_2 = v4;

}

@end
