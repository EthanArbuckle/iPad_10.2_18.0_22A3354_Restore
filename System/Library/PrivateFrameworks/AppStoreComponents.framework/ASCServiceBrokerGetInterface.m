@implementation ASCServiceBrokerGetInterface

void __ASCServiceBrokerGetInterface_block_invoke()
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4CF690);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCServiceBrokerGetInterface_interface = v0;

  v2 = (void *)ASCServiceBrokerGetInterface_interface;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_testConnectionWithReplyHandler_, 0, 1);

  v4 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCAppOfferStateDelegateGetInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getAppOfferStateServiceForDelegate_withReplyHandler_, 0, 0);

  v6 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCAppOfferStateServiceGetInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_getAppOfferStateServiceForDelegate_withReplyHandler_, 0, 1);

  v8 = (void *)ASCServiceBrokerGetInterface_interface;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getAppOfferStateServiceForDelegate_withReplyHandler_, 1, 1);

  v10 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCURLLaunchServiceGetInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_getURLLaunchServiceWithReplyHandler_, 0, 1);

  v12 = (void *)ASCServiceBrokerGetInterface_interface;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getURLLaunchServiceWithReplyHandler_, 1, 1);

  v14 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCLockupFetcherServiceGetInterface();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_getLockupFetcherServiceWithReplyHandler_, 0, 1);

  v16 = (void *)ASCServiceBrokerGetInterface_interface;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getLockupFetcherServiceWithReplyHandler_, 1, 1);

  v18 = (void *)ASCServiceBrokerGetInterface_interface;
  ASCMetricsServiceGetInterface();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_getMetricsServiceWithReplyHandler_, 0, 1);

  v20 = (void *)ASCServiceBrokerGetInterface_interface;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getMetricsServiceWithReplyHandler_, 1, 1);

}

@end
