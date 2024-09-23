@implementation AXProcessIsSystemApplication

void __AXProcessIsSystemApplication_block_invoke()
{
  uint64_t v0;
  void *v1;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIApplication")), "safeValueForKey:", CFSTR("sharedApplication"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXProcessIsSystemApplication_app;
  AXProcessIsSystemApplication_app = v0;

}

@end
