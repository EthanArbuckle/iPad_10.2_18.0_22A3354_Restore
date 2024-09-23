@implementation AXMIsRunningInServiceProcess

void __AXMIsRunningInServiceProcess_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AXMIsRunningInServiceProcess__RunningInServiceProcess = objc_msgSend(v0, "isEqualToString:", AXMServiceIdentifier);

}

@end
