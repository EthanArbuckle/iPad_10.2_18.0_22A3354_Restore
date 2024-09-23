@implementation AXAssistiveTouchBundle

void __AXAssistiveTouchBundle_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  AXSystemRootDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("System/Library/CoreServices/AssistiveTouch.app"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AXAssistiveTouchBundle_ASTBundle;
  AXAssistiveTouchBundle_ASTBundle = v2;

}

@end
