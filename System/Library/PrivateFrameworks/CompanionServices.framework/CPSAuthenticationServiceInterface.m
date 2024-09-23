@implementation CPSAuthenticationServiceInterface

+ (NSXPCInterface)clientInterface
{
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

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2569081D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_authenticationSessionDeviceTappedNotification_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_authenticationSessionDeviceStartedAuthentication_, 0, 0);

  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_authenticationSessionDidFinishWithResponse_, 0, 0);
  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_authenticationSessionDidFailWithError_, 0, 0);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonInterface
{
  void *v2;
  uint64_t v3;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256909928);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v3 = objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v13 = (void *)v3;
  objc_msgSend(v12, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_startAuthenticationSessionWithRequest_completionHandler_, 0, 0);
  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_startAuthenticationSessionWithRequest_completionHandler_, 0, 1);

  v18 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_fetchDaemonStatusWithCompletionHandler_, 0, 1);

  v21 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_fetchDaemonStatusWithCompletionHandler_, 1, 1);

  v24 = (void *)MEMORY[0x24BDBCF20];
  getAMSDelegatePurchaseRequestClass();
  objc_opt_self();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_, 0, 0);

  v27 = (void *)MEMORY[0x24BDBCF20];
  getAMSDelegatePurchaseResultClass();
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithObject:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_, 0, 1);

  v30 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_performAMSDelegatePurchaseWithRequest_isSandboxPurchase_completionHandler_, 1, 1);

  return (NSXPCInterface *)v34;
}

@end
