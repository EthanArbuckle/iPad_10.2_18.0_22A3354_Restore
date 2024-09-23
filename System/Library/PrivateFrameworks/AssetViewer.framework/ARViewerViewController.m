@implementation ARViewerViewController

void __57___ARViewerViewController__remoteViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01EC7A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_remoteViewControllerInterface_sHostInterface;
  _remoteViewControllerInterface_sHostInterface = v0;

}

void __45___ARViewerViewController__exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01F1FB0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_exportedInterface_sVendorInterface;
  _exportedInterface_sVendorInterface = v0;

}

uint64_t __54___ARViewerViewController_isIgnoringInteractionEvents__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __47___ARViewerViewController_statusBarOrientation__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
