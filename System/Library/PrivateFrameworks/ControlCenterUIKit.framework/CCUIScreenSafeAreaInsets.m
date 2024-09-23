@implementation CCUIScreenSafeAreaInsets

void __CCUIScreenSafeAreaInsets_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_keyWindowForScreen:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeAreaInsets");
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_0 = v2;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_1 = v3;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_2 = v4;
  CCUIScreenSafeAreaInsets___screenSafeAreaInsets_3 = v5;

}

@end
