@implementation AXProcessIsCommandAndControl

void __AXProcessIsCommandAndControl_block_invoke()
{
  void *v0;
  int v1;

  AXProcessGetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("CommandAndControl"));

  if (v1)
    AXProcessIsCommandAndControl__IsCommandAndControl = 1;
}

@end
