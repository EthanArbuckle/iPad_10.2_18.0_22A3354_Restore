@implementation ASTDisabledLockScreenBundles

void __ASTDisabledLockScreenBundles_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("LockscreenSuggestionsDisabledBundles"), CFSTR("com.apple.duetexpertd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v1 = v0;
  if (v0)
    v2 = v0;
  else
    v2 = (id)objc_opt_new();
  v6 = v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", CFSTR("com.apple.application"));
  objc_msgSend(v3, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("com.apple.DocumentsApp")))
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)ASTDisabledLockScreenBundles_disabledLockScreenBundles;
  ASTDisabledLockScreenBundles_disabledLockScreenBundles = v4;

}

@end
