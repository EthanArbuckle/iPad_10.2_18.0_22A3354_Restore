@implementation AXProcessIsFullKeyboardAccess

void __AXProcessIsFullKeyboardAccess_block_invoke()
{
  void *v0;
  int v1;

  AXProcessGetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.FullKeyboardAccess"));

  if (v1)
    AXProcessIsFullKeyboardAccess__IsFullKeyboardAccess = 1;
}

@end
