@implementation MRNetServiceTransport

- (MRNetServiceTransport)initWithNetService:(id)a3
{
  id v5;
  MRNetServiceTransport *v6;
  MRNetServiceTransport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNetServiceTransport;
  v6 = -[MRNetServiceTransport init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_netService, a3);
    v7->_requiresCustomPairing = 1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MRNetServiceTransport resetWithError:](self, "resetWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MRNetServiceTransport;
  -[MRNetServiceTransport dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p netService = %@>"), objc_opt_class(), self, self->_netService);
}

- (void)setNetService:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSNetService *v11;

  v11 = (NSNetService *)a3;
  if (self->_netService != v11)
  {
    objc_storeStrong((id *)&self->_netService, a3);
    v5 = (void *)MEMORY[0x1E0C92C38];
    -[NSNetService TXTRecordData](v11, "TXTRecordData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryFromTXTRecordData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[NSNetService name](v11, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("Name"));

    -[MRNetServiceTransport updateDeviceInfoWithTXTRecord:](self, "updateDeviceInfoWithTXTRecord:", v8);
  }

}

+ (id)createDeviceInfoFromNetService:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C92C38];
  v4 = a3;
  objc_msgSend(v4, "TXTRecordData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryFromTXTRecordData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("Name"));

  objc_msgSend((id)objc_opt_class(), "createDeviceInfoFromTXTRecord:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)createDeviceInfoFromTXTRecord:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  MRDeviceInfo *v29;
  uint64_t v30;
  NSObject *v31;
  int v33;
  MRDeviceInfo *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UniqueIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModelName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithData:encoding:", v12, 4);

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemBuildVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithData:encoding:", v15, 4);

  v17 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BluetoothAddress"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithData:", v18);

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocalAirPlayReceiverPairingIdentity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithData:encoding:", v21, 4);

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macAddress"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithData:encoding:", v24, 4);

  v26 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowPairing"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v26, "initWithData:encoding:", v27, 4);
  if (v7)
  {
    v29 = objc_alloc_init(MRDeviceInfo);
    -[MRDeviceInfo setIdentifier:](v29, "setIdentifier:", v7);
    -[MRDeviceInfo setName:](v29, "setName:", v10);
    -[MRDeviceInfo setLocalizedModelName:](v29, "setLocalizedModelName:", v13);
    -[MRDeviceInfo setBuildVersion:](v29, "setBuildVersion:", v16);
    -[MRDeviceInfo setBluetoothAddress:](v29, "setBluetoothAddress:", v19);
    -[MRDeviceInfo setDeviceUID:](v29, "setDeviceUID:", v22);
    -[MRDeviceInfo setManagedConfigurationDeviceIdentifier:](v29, "setManagedConfigurationDeviceIdentifier:", v25);
    if (objc_msgSend(v28, "length"))
      v30 = objc_msgSend(v28, "BOOLValue");
    else
      v30 = 1;
    -[MRDeviceInfo setPairingAllowed:](v29, "setPairingAllowed:", v30);
  }
  else
  {
    v29 = 0;
  }
  _MRLogForCategory(3uLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v29;
    _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, "decoded txtData: %@", (uint8_t *)&v33, 0xCu);
  }

  return v29;
}

- (void)updateDeviceInfoWithTXTRecord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  MRDeviceInfo *deviceInfo;
  MRDeviceInfo *v9;
  MRDeviceInfo *v10;
  MRDeviceInfo *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
    objc_msgSend(v6, "setObject:forKey:", deviceInfo, CFSTR("OldDeviceInfo"));
  objc_msgSend((id)objc_opt_class(), "createDeviceInfoFromTXTRecord:", v5);
  v9 = (MRDeviceInfo *)objc_claimAutoreleasedReturnValue();

  v10 = self->_deviceInfo;
  self->_deviceInfo = v9;

  v11 = self->_deviceInfo;
  if (v11)
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("NewDeviceInfo"));
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("MRExternalDeviceTransportDeviceInfoDidChangeNotification"), self, v7);

}

- (id)deviceInfo
{
  MRDeviceInfo *deviceInfo;
  MRDeviceInfo *v4;
  MRDeviceInfo *v5;

  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    objc_msgSend((id)objc_opt_class(), "createDeviceInfoFromNetService:", self->_netService);
    v4 = (MRDeviceInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceInfo;
    self->_deviceInfo = v4;

    deviceInfo = self->_deviceInfo;
  }
  return deviceInfo;
}

- (id)name
{
  return -[NSNetService name](self->_netService, "name");
}

- (id)hostname
{
  return -[NSNetService hostName](self->_netService, "hostName");
}

- (int64_t)port
{
  return -[NSNetService port](self->_netService, "port");
}

- (int64_t)connectionType
{
  return 2;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (id)error
{
  return 0;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  MRStreamTransportConnection *v6;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v3 = -[MRNetServiceTransport getInputStream:outputStream:userInfo:](self, "getInputStream:outputStream:userInfo:", &v9, &v8, a3);
  v4 = v9;
  v5 = v8;
  v6 = 0;
  if (v3)
    v6 = -[MRStreamTransportConnection initWithInputStream:outputStream:]([MRStreamTransportConnection alloc], "initWithInputStream:outputStream:", v4, v5);

  return v6;
}

- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5
{
  BOOL v7;
  id v9;
  id v10;

  v9 = 0;
  v10 = 0;
  v7 = -[NSNetService getInputStream:outputStream:](self->_netService, "getInputStream:outputStream:", &v10, &v9, a5);
  *a3 = objc_retainAutorelease(v10);
  *a4 = objc_retainAutorelease(v9);

  return v7;
}

- (BOOL)requiresCustomPairing
{
  return self->_requiresCustomPairing;
}

- (void)setRequiresCustomPairing:(BOOL)a3
{
  self->_requiresCustomPairing = a3;
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
