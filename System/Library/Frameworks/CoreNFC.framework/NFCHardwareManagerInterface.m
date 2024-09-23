@implementation NFCHardwareManagerInterface

+ (id)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global);
  return (id)interface_interface;
}

void __40__NFCHardwareManagerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E03F18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_interface;
  interface_interface = v0;

  v2 = (void *)interface_interface;
  +[NFReaderSessionCallbacks interface](NFReaderSessionCallbacks, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueReaderSession_sessionConfig_completion_, 0, 0);

  v4 = (void *)interface_interface;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_queueReaderSession_sessionConfig_completion_, 1, 0);

  v6 = (void *)interface_interface;
  +[NFReaderSessionInterface interface](NFReaderSessionInterface, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_queueReaderSession_sessionConfig_completion_, 0, 1);

  v8 = (void *)interface_interface;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_queueCardSession_sessionConfig_completion_, 1, 0);

  v10 = (void *)interface_interface;
  +[NFCCardSessionCallbackInterface interface]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_queueCardSession_sessionConfig_completion_, 0, 0);

  v12 = (void *)interface_interface;
  +[NFCCardSessionInterface interface]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_queueCardSession_sessionConfig_completion_, 0, 1);

  v14 = (void *)interface_interface;
  +[NFCFieldDetectSessionCallbacksInterface interface](NFCFieldDetectSessionCallbacksInterface, "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_queueCardFieldDetectSession_completion_, 0, 0);

  v16 = (void *)interface_interface;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E03F78);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_queueCardFieldDetectSession_completion_, 0, 1);

}

@end
