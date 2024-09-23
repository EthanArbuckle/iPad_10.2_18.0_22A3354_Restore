@implementation LSInstallationService

uint64_t __40___LSInstallationService_beginListening__block_invoke()
{
  _LSInstallationService *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(_LSInstallationService);
  v1 = (void *)beginListening_installationServiceDelegate;
  beginListening_installationServiceDelegate = (uint64_t)v0;

  v2 = objc_alloc(MEMORY[0x1E0CB3B58]);
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithMachServiceName:", v3);
  v5 = (void *)beginListening_listener;
  beginListening_listener = v4;

  objc_msgSend((id)beginListening_listener, "setDelegate:", beginListening_installationServiceDelegate);
  return objc_msgSend((id)beginListening_listener, "resume");
}

@end
