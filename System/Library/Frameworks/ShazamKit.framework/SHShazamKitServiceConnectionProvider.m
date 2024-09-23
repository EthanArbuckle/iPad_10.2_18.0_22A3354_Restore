@implementation SHShazamKitServiceConnectionProvider

- (id)shazamKitServiceConnection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.shazamd"), 4096);
  SHShazamKitServiceInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  SHShazamKitClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v4);

  return v2;
}

@end
