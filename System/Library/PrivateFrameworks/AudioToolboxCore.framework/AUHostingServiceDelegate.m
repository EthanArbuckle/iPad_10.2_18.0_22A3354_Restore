@implementation AUHostingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  AUHostingService *v9;
  void *v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1715D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classesForSelector:argumentIndex:ofReply:", sel_loadAudioUnitInRemoteHost_config_reply_, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addObject:", objc_opt_class());
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_loadAudioUnitInRemoteHost_config_reply_, 1, 0);
  v8 = ConfigureAUAudioUnitXPCInterface(v5);

  objc_msgSend(v4, "setExportedInterface:", v5);
  v9 = -[AUHostingService initWithConnection:]([AUHostingService alloc], "initWithConnection:", v4);
  objc_msgSend(v4, "setExportedObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16CDE0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v10);
  objc_msgSend(v4, "setRemoteObjectInterface:", v10);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
