@implementation IFImageBag

void __60__IFImageBag_IconServicesAdditions__defaultAppIconAssetsBag__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNamed:fromBundle:", CFSTR("DefaultIcon"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultAppIconAssetsBag_bag;
  defaultAppIconAssetsBag_bag = v0;

}

void __60__IFImageBag_IconServicesAdditions__defaultAppClipAssetsBag__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D3A798], "iconsetResourceBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A7C8], "imageBagWithResourcesNamed:fromBundle:", CFSTR("AppClipDefaultIcon"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultAppClipAssetsBag_bag;
  defaultAppClipAssetsBag_bag = v0;

}

@end
