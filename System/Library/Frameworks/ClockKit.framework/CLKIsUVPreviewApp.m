@implementation CLKIsUVPreviewApp

void __CLKIsUVPreviewApp_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.dt.XcodePreviews")))
  {
    CLKIsUVPreviewApp___isUVPreview = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CLKIsUVPreviewApp___isUVPreview = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PreviewShell"));

  }
}

@end
