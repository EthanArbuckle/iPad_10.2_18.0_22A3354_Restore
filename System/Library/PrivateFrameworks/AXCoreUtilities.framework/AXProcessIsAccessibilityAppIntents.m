@implementation AXProcessIsAccessibilityAppIntents

void __AXProcessIsAccessibilityAppIntents_block_invoke()
{
  void *v0;
  int v1;

  AXProcessGetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("AccessibilityAppIntents"));

  if (v1)
    AXProcessIsAccessibilityAppIntents__IsAccessibilityAppIntents = 1;
}

@end
