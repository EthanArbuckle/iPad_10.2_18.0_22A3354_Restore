@implementation HMIsCurrentProcessAnExtension

void __HMIsCurrentProcessAnExtension_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "extensionPointIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HMIsCurrentProcessAnExtension_isCurrentProcessAnExtension = v1 != 0;

}

@end
