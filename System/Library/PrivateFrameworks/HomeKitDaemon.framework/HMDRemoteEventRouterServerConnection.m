@implementation HMDRemoteEventRouterServerConnection

- (HMDRemoteEventRouterServerConnection)initWithDevice:(id)a3 connectionMode:(int64_t)a4 supportsFragmentMessage:(BOOL)a5 userAccessControlProviderUUID:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  HMDRemoteEventRouterServerConnection *v13;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDRemoteEventRouterServerConnection initWithDeviceIdentifier:device:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:](self, "initWithDeviceIdentifier:device:connectionMode:supportsFragmentMessage:userAccessControlProviderUUID:", v12, v11, a4, v6, v10);

  return v13;
}

- (HMDRemoteEventRouterServerConnection)initWithDeviceIdentifier:(id)a3 device:(id)a4 connectionMode:(int64_t)a5 supportsFragmentMessage:(BOOL)a6 userAccessControlProviderUUID:(id)a7
{
  id v13;
  id v14;
  id v15;
  HMDRemoteEventRouterServerConnection *v16;
  HMDRemoteEventRouterServerConnection *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteEventRouterServerConnection;
  v16 = -[HMDRemoteEventRouterServerConnection init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deviceIdentifier, a3);
    v17->_connectionMode = a5;
    v17->_supportsFragmentMessage = a6;
    objc_storeStrong((id *)&v17->_device, a4);
    objc_storeStrong((id *)&v17->_userAccessControlProviderUUID, a7);
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t connectionMode;
  __CFString *v7;
  __CFString *v8;
  NSUUID *v9;
  NSUUID *userAccessControlProviderUUID;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    connectionMode = self->_connectionMode;
    if (connectionMode)
    {
      if (connectionMode == 1)
        v7 = CFSTR("ConnectionModeResident");
      else
        v7 = CFSTR("Unknown");
      v8 = v7;
    }
    else
    {
      v8 = CFSTR("ConnectionModePrimary");
    }
    v9 = self->_deviceIdentifier;
    userAccessControlProviderUUID = self->_userAccessControlProviderUUID;
  }
  else
  {
    v9 = 0;
    userAccessControlProviderUUID = 0;
    v8 = CFSTR("ConnectionModePrimary");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ mode: %@, deviceIdentifier: %@, userACLProvider: %@>"), v5, v8, v9, userAccessControlProviderUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccessControlProviderUUID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
