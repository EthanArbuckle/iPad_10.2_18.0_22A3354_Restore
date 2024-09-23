@implementation BTSDevice

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BTSDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BTSDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)identifier
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)name
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)productName
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)healthDeviceType
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)connected
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)paired
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isTemporaryPairedDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)cloudPaired
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)classicDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isHealthDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setHealthDevice:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (int)userSelectedHealthDataSyncConfig
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 2;
}

- (void)setUserSelectedHealthDataSyncConfig:(int)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isCTKDDevice
{
  return 0;
}

- (void)setCtkdDevice:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isManagedByWallet
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setManagedByWallet:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isManagedByAliroWallet
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isManagedByDeviceAccess
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isMyDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)connect
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)disconnect
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)unpair
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  int v7;
  BOOL v8;
  int64_t v9;
  int v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[BTSDevice shouldDenyIncomingClassicConnection](self, "shouldDenyIncomingClassicConnection");
  if (v5 != objc_msgSend(v4, "shouldDenyIncomingClassicConnection"))
  {
    v6 = -[BTSDevice shouldDenyIncomingClassicConnection](self, "shouldDenyIncomingClassicConnection");
LABEL_5:
    v8 = !v6;
    goto LABEL_6;
  }
  v7 = -[BTSDevice connected](self, "connected");
  if (v7 != objc_msgSend(v4, "connected"))
  {
    v6 = -[BTSDevice connected](self, "connected");
    goto LABEL_5;
  }
  v11 = -[BTSDevice paired](self, "paired")
     || -[BTSDevice isHealthDevice](self, "isHealthDevice")
     || -[BTSDevice isManagedByDeviceAccess](self, "isManagedByDeviceAccess");
  if ((objc_msgSend(v4, "paired") & 1) != 0 || (objc_msgSend(v4, "isHealthDevice") & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v4, "isManagedByDeviceAccess");
  if (v12 == v11)
  {
    -[BTSDevice name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "compare:options:", v14, 1);

    goto LABEL_9;
  }
  v8 = v11 == 0;
LABEL_6:
  if (v8)
    v9 = 1;
  else
    v9 = -1;
LABEL_9:

  return v9;
}

- (BOOL)supportsANCS
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)ancsAuthorized
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setANCSAuthorization:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isApplePencil:(int *)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)doesSupportBackgroundNI
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isLimitedConnectivityDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isHIDDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isiPad
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isCarPlayDevice
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)shouldDenyIncomingClassicConnection
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)relatedFutureRadioAddress
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)linkedRadioAddress
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setDenyIncomingClassicConnection:(BOOL)a3
{
  -[BTSDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (NSString)accessorySetupKitDisplayName
{
  return self->_accessorySetupKitDisplayName;
}

- (void)setAccessorySetupKitDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySetupKitDisplayName, a3);
}

- (void)setRelatedFutureRadioAddress:(id)a3
{
  objc_storeStrong((id *)&self->_relatedFutureRadioAddress, a3);
}

- (void)setLinkedRadioAddress:(id)a3
{
  objc_storeStrong((id *)&self->_linkedRadioAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedRadioAddress, 0);
  objc_storeStrong((id *)&self->_relatedFutureRadioAddress, 0);
  objc_storeStrong((id *)&self->_accessorySetupKitDisplayName, 0);
}

@end
