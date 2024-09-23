@implementation FBKSIsInternalInstall

void __FBKSIsInternalInstall_block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v0, "cStringUsingEncoding:", 4);
  FBKSIsInternalInstall__isInternal = os_variant_has_internal_ui();

}

@end
