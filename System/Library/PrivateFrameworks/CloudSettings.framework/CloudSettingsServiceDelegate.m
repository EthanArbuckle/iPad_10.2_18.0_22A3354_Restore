@implementation CloudSettingsServiceDelegate

- (CloudSettingsServiceDelegate)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4
{
  id v6;
  id v7;
  CloudSettingsServiceDelegate *v8;
  CloudSettingsService *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CloudSettingsServiceDelegate;
  v8 = -[CloudSettingsServiceDelegate init](&v11, sel_init);
  if (v8)
  {
    v9 = -[CloudSettingsService initWithStoreIdentifier:settingsMediator:]([CloudSettingsService alloc], "initWithStoreIdentifier:settingsMediator:", v6, v7);
    -[CloudSettingsServiceDelegate setService:](v8, "setService:", v9);

  }
  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_2549E7BE8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  -[CloudSettingsServiceDelegate service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedObject:", v8);

  objc_msgSend(v6, "resume");
  return 1;
}

- (CloudSettingsService)service
{
  return (CloudSettingsService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
