@implementation BNBundleIdentifier

void __BNBundleIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BNBundleIdentifier___bundleID;
  BNBundleIdentifier___bundleID = v0;

}

@end
