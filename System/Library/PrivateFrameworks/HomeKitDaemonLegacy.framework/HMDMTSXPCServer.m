@implementation HMDMTSXPCServer

- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  HMDMTSXPCServer *v13;
  HMDMTSXPCServer *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v9)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CC1B48]);
    v13 = -[HMDMTSXPCServer initWithPairingServer:deviceSetupServer:authorizationServer:xpcServer:](self, "initWithPairingServer:deviceSetupServer:authorizationServer:xpcServer:", v8, v9, v11, v12);

    return v13;
  }
LABEL_7:
  v15 = (HMDMTSXPCServer *)_HMFPreconditionFailure();
  return -[HMDMTSXPCServer initWithPairingServer:deviceSetupServer:authorizationServer:xpcServer:](v15, v16, v17, v18, v19, v20);
}

- (HMDMTSXPCServer)initWithPairingServer:(id)a3 deviceSetupServer:(id)a4 authorizationServer:(id)a5 xpcServer:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMTSXPCServer *v16;
  HMDMTSXPCServer *v17;
  HMDMTSXPCServer *result;
  HMDMTSXPCServer *v19;
  SEL v20;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = (HMDMTSXPCServer *)_HMFPreconditionFailure();
    -[HMDMTSXPCServer start](v19, v20);
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDMTSXPCServer;
  v16 = -[HMDMTSXPCServer init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_pairingServer, a3);
    objc_storeStrong((id *)&v17->_deviceSetupServer, a4);
    objc_storeStrong((id *)&v17->_authorizationServer, a5);
    objc_storeStrong((id *)&v17->_xpcServer, a6);
  }

  return v17;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDMTSXPCServer pairingServer](self, "pairingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMTSXPCServer xpcServer](self, "xpcServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDevicePairingServer:", v3);

  -[HMDMTSXPCServer deviceSetupServer](self, "deviceSetupServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMTSXPCServer xpcServer](self, "xpcServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceSetupServer:", v5);

  -[HMDMTSXPCServer pairingServer](self, "pairingServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMTSXPCServer xpcServer](self, "xpcServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSystemCommissionerPairingServer:", v7);

  -[HMDMTSXPCServer authorizationServer](self, "authorizationServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMTSXPCServer xpcServer](self, "xpcServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAuthorizationServer:", v9);

  -[HMDMTSXPCServer xpcServer](self, "xpcServer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

}

- (HMDMTSPairingServer)pairingServer
{
  return (HMDMTSPairingServer *)objc_getProperty(self, a2, 8, 1);
}

- (HMDMTSDeviceSetupServer)deviceSetupServer
{
  return (HMDMTSDeviceSetupServer *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMTSAuthorizationServer)authorizationServer
{
  return (HMDMTSAuthorizationServer *)objc_getProperty(self, a2, 24, 1);
}

- (MTSXPCServer)xpcServer
{
  return (MTSXPCServer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_authorizationServer, 0);
  objc_storeStrong((id *)&self->_deviceSetupServer, 0);
  objc_storeStrong((id *)&self->_pairingServer, 0);
}

@end
