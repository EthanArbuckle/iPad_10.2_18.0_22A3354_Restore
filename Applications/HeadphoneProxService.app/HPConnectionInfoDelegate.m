@implementation HPConnectionInfoDelegate

- (void)start
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_new(NSMutableSet, a2);
  -[HPConnectionInfoDelegate setAllowedEndpointUUIDs:](self, "setAllowedEndpointUUIDs:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
  objc_msgSend(v4, "registerDelegate:", self);

}

- (void)stop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
  objc_msgSend(v3, "registerDelegate:", 0);

  -[HPConnectionInfoDelegate setAllowedEndpointUUIDs:](self, "setAllowedEndpointUUIDs:", 0);
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HPConnectionInfoDelegate *v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HPConnectionInfoDelegate allowedEndpointUUIDs](self, "allowedEndpointUUIDs"));
  v12 = objc_msgSend(v11, "containsObject:", v10);

  if (v12)
  {
    if (dword_1000B7810 <= 30
      && (dword_1000B7810 != -1 || _LogCategory_Initialize(&dword_1000B7810, 30)))
    {
      LogPrintF(&dword_1000B7810, "-[HPConnectionInfoDelegate accessoryEndpointInfoPropertyChanged:properties:forConnection:]", 30, "SVSConnectionInfoDelegate - Endpoint Update Called %@", v8);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005D14;
    v14[3] = &unk_1000A5680;
    v15 = v8;
    v16 = self;
    objc_msgSend(v13, "accessoryInfoForConnection:withReply:", v9, v14);

  }
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HPConnectionInfoDelegate *v19;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend((id)objc_opt_class(self), "_isAudioProductCertsProtocol:", v9)
    && objc_msgSend((id)objc_opt_class(self), "_isBluetoothClassicTransport:", v10))
  {
    if (dword_1000B7810 <= 30
      && (dword_1000B7810 != -1 || _LogCategory_Initialize(&dword_1000B7810, 30)))
    {
      LogPrintF(&dword_1000B7810, "-[HPConnectionInfoDelegate accessoryEndpointAttached:transportType:protocol:properties:forConnection:]", 30, "SVSConnectionInfoDelegate - Endpoint Attached Called %@", v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HPConnectionInfoDelegate allowedEndpointUUIDs](self, "allowedEndpointUUIDs"));
    objc_msgSend(v15, "addObject:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100005ED0;
    v17[3] = &unk_1000A5680;
    v18 = v13;
    v19 = self;
    objc_msgSend(v16, "accessoryInfoForConnection:withReply:", v14, v17);

  }
}

+ (BOOL)_isAudioProductCertsProtocol:(int)a3
{
  return a3 == 13;
}

+ (BOOL)_isBluetoothClassicTransport:(int)a3
{
  return a3 == 2;
}

- (id)accessoryAttached
{
  return self->_accessoryAttached;
}

- (void)setAccessoryAttached:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableSet)allowedEndpointUUIDs
{
  return self->_allowedEndpointUUIDs;
}

- (void)setAllowedEndpointUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedEndpointUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEndpointUUIDs, 0);
  objc_storeStrong(&self->_accessoryAttached, 0);
}

@end
