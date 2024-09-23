@implementation MFMobileMailContainerPath

void __MFMobileMailContainerPath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilemail"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataContainerURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)MFMobileMailContainerPath_containerPath;
  MFMobileMailContainerPath_containerPath = v2;

}

@end
