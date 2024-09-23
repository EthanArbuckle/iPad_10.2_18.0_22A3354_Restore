@implementation MEExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "MERemoteExtensiontInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "MEExtensionRemoteHostInterface");
}

+ (id)extensionHostRequestScheduler
{
  if (extensionHostRequestScheduler_onceToken != -1)
    dispatch_once(&extensionHostRequestScheduler_onceToken, &__block_literal_global_2);
  return (id)extensionHostRequestScheduler_scheduler;
}

void __55__MEExtensionHostContext_extensionHostRequestScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE2E688], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.extension.extensionHostRequestScheduler"), 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)extensionHostRequestScheduler_scheduler;
  extensionHostRequestScheduler_scheduler = v0;

}

- (void)regenerateEmailAddressTokenChangesForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[MEExtensionHostContext extensionHostRequestScheduler](MEExtensionHostContext, "extensionHostRequestScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__MEExtensionHostContext_regenerateEmailAddressTokenChangesForSession___block_invoke;
  v7[3] = &unk_24C4D28F0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __71__MEExtensionHostContext_regenerateEmailAddressTokenChangesForSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "composeExtensionHostDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regenerateEmailAddressTokenChangesForSession:forContextUUID:", v2, v3);

}

- (void)regenerateSecurityStatusInformationForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[MEExtensionHostContext extensionHostRequestScheduler](MEExtensionHostContext, "extensionHostRequestScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__MEExtensionHostContext_regenerateSecurityStatusInformationForSession___block_invoke;
  v7[3] = &unk_24C4D28F0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

void __72__MEExtensionHostContext_regenerateSecurityStatusInformationForSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "composeExtensionHostDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regenerateSecurityStatusInformationForSession:forContextUUID:", v2, v3);

}

- (MEMailComposeExtensionHostDelegate)composeExtensionHostDelegate
{
  return (MEMailComposeExtensionHostDelegate *)objc_loadWeakRetained((id *)&self->_composeExtensionHostDelegate);
}

- (void)setComposeExtensionHostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_composeExtensionHostDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composeExtensionHostDelegate);
}

@end
