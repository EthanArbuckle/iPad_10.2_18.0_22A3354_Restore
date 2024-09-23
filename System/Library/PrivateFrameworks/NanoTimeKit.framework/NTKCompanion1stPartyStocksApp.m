@implementation NTKCompanion1stPartyStocksApp

- (NTKCompanion1stPartyStocksApp)initWithDevice:(id)a3
{
  id v5;
  void *v6;
  NTKCompanion1stPartyStocksApp *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  NTKRemoteComplicationStocksClientIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)NTKCompanion1stPartyStocksApp;
  v7 = -[NTKCompanion3rdPartyApp _initWithWatchAppId:containerAppId:complicationClientId:](&v12, sel__initWithWatchAppId_containerAppId_complicationClientId_, CFSTR("com.apple.stocks.watchapp"), CFSTR("com.apple.stocks"), v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_device, a3);
    -[NTKCompanion3rdPartyApp setInstalled:](v7, "setInstalled:", 1);
    -[NTKCompanion1stPartyStocksApp complication](v7, "complication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "complicationDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportedFamilies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanion3rdPartyApp setSupportedFamilies:](v7, "setSupportedFamilies:", v10);

  }
  return v7;
}

- (id)complication
{
  return +[NTKRemoteComplication _remoteStocksComplicationWithIdentifier:forDevice:](NTKRemoteComplication, "_remoteStocksComplicationWithIdentifier:forDevice:", *MEMORY[0x1E0C93EC8], self->_device);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
