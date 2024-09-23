@implementation MRActiveEndpointTypeForCurrentApplication

void __MRActiveEndpointTypeForCurrentApplication_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  id v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "supportGroupSessionActiveEndpoint");

  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    MRActiveEndpointTypeForCurrentApplication_type = MRActiveEndpointTypeForBundleIdentifier(v3);
  }
}

@end
