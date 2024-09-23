@implementation ARViewerRemoteViewController

void __63___ARViewerRemoteViewController_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01F1FB0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceViewControllerInterface_sVendorInterface;
  serviceViewControllerInterface_sVendorInterface = v0;

}

void __50___ARViewerRemoteViewController_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01EC7A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_sHostInterface;
  exportedInterface_sHostInterface = v0;

}

@end
