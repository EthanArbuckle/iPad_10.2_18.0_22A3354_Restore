@implementation NSSBundleInternal

void __NSSBundleInternal_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NSSBundleInternal_sNSSBundle;
  NSSBundleInternal_sNSSBundle = v0;

}

@end
