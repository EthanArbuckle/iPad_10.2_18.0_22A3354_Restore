@implementation EFVerboseVersion

void __EFVerboseVersion_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  EFProductName();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  EFSystemBuildVersion();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithFormat:", CFSTR("%@ %@"), v4, v1);
  v3 = (void *)EFVerboseVersion_verboseVersion;
  EFVerboseVersion_verboseVersion = v2;

}

@end
