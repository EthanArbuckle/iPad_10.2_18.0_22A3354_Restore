@implementation NTKGreenfieldServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3B50];
  v5 = a4;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_1F8E88550);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "setExportedObject:", v7);
  objc_msgSend(v5, "resume");

  return 1;
}

@end
