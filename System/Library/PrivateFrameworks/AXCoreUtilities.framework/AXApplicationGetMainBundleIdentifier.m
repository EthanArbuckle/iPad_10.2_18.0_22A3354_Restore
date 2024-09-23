@implementation AXApplicationGetMainBundleIdentifier

void __AXApplicationGetMainBundleIdentifier_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)AXApplicationGetMainBundleIdentifier__AXApplicationMainBundleIdentifier;
  AXApplicationGetMainBundleIdentifier__AXApplicationMainBundleIdentifier = v1;

}

@end
