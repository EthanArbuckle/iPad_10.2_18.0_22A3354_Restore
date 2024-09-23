@implementation DASimulatedDeviceServer

- (DASimulatedDeviceServer)init
{
  DASimulatedDeviceServer *v2;
  DASimulatedDeviceServer *v3;
  DASimulatedDeviceServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DASimulatedDeviceServer;
  v2 = -[DASimulatedDeviceServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return -[DASimulatedDeviceServer descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  objc_opt_class();
  NSAppendPrintF();
  return 0;
}

- (void)activate
{
  void *v3;
  NSString *v4;
  NSString *deviceIdentitifer;
  NSString *v6;
  NSString *deviceName;
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (!self->_deviceBonjourServiceType)
  {
    self->_deviceBonjourServiceType = (NSString *)CFSTR("_deviceaccess._udp");

  }
  if (!self->_deviceIdentitifer)
  {
    NSRandomData();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataAddress();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceIdentitifer = self->_deviceIdentitifer;
    self->_deviceIdentitifer = v4;

  }
  if (!self->_deviceName)
  {
    arc4random();
    NSPrintF();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceName = self->_deviceName;
    self->_deviceName = v6;

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__DASimulatedDeviceServer_activate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__DASimulatedDeviceServer_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_activate");
  }
  return result;
}

- (void)_activate
{
  CUBonjourAdvertiser **p_bonjourAdvertiser;
  CUBonjourAdvertiser *v4;
  id v5;
  void *v6;
  NSString *deviceIdentitifer;
  CUTCPServer **p_tcpServer;
  CUTCPServer *v9;
  id v10;
  CUTCPServer *tcpServer;
  id v12;
  CUTCPServer *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  CUTCPServer *v17;
  DASimulatedDeviceServer *v18;

  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  v4 = self->_bonjourAdvertiser;
  if (!v4)
  {
    v4 = (CUBonjourAdvertiser *)objc_alloc_init(MEMORY[0x24BE29790]);
    objc_storeStrong((id *)p_bonjourAdvertiser, v4);
    -[CUBonjourAdvertiser setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourAdvertiser setDomain:](v4, "setDomain:", CFSTR("local."));
    -[CUBonjourAdvertiser setLabel:](v4, "setLabel:", self->_deviceIdentitifer);
    -[CUBonjourAdvertiser setName:](v4, "setName:", self->_deviceName);
    -[CUBonjourAdvertiser setServiceType:](v4, "setServiceType:", self->_deviceBonjourServiceType);
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = v5;
    deviceIdentitifer = self->_deviceIdentitifer;
    if (deviceIdentitifer)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", deviceIdentitifer, CFSTR("rpBA"));
    -[CUBonjourAdvertiser setTxtDictionary:](v4, "setTxtDictionary:", v6);

  }
  p_tcpServer = &self->_tcpServer;
  v9 = self->_tcpServer;
  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE29848]);
    objc_storeStrong((id *)&self->_tcpServer, v10);
    objc_msgSend(v10, "setBonjourAdvertiser:", v4);
    objc_msgSend(v10, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v10, "setLabel:", self->_deviceIdentitifer);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __36__DASimulatedDeviceServer__activate__block_invoke;
    v16[3] = &unk_24D1698E0;
    v9 = (CUTCPServer *)v10;
    v17 = v9;
    v18 = self;
    -[CUTCPServer setConnectionStartedHandler:](v9, "setConnectionStartedHandler:", v16);
    tcpServer = self->_tcpServer;
    v15 = 0;
    -[CUTCPServer activateDirectAndReturnError:](tcpServer, "activateDirectAndReturnError:", &v15);
    v12 = v15;
    if (v12)
    {
      if (gLogCategory_DASimulatedDeviceServer <= 90
        && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[CUTCPServer invalidate](*p_tcpServer, "invalidate", v14);
      v13 = *p_tcpServer;
      *p_tcpServer = 0;

    }
  }

}

_QWORD *__36__DASimulatedDeviceServer__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[5])
    return (_QWORD *)objc_msgSend(result, "_connectionAccept:", a2);
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__DASimulatedDeviceServer_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__DASimulatedDeviceServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  CUBonjourAdvertiser *bonjourAdvertiser;
  CUTCPServer *tcpServer;

  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
  tcpServer = self->_tcpServer;
  self->_tcpServer = 0;

  -[DASimulatedDeviceServer _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_DASimulatedDeviceServer <= 30
      && (gLogCategory_DASimulatedDeviceServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_connectionAccept:(id)a3
{
  id v4;
  id v5;
  NSMutableSet *tcpConnections;
  NSMutableSet *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  DASimulatedDeviceServer *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __45__DASimulatedDeviceServer__connectionAccept___block_invoke;
  v12 = &unk_24D169140;
  v13 = self;
  v5 = v4;
  v14 = v5;
  objc_msgSend(v5, "setInvalidationHandler:", &v9);
  tcpConnections = self->_tcpConnections;
  if (!tcpConnections)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = self->_tcpConnections;
    self->_tcpConnections = v7;

    tcpConnections = self->_tcpConnections;
  }
  -[NSMutableSet addObject:](tcpConnections, "addObject:", v5, v9, v10, v11, v12, v13);

}

uint64_t __45__DASimulatedDeviceServer__connectionAccept___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionEnded:", *(_QWORD *)(a1 + 40));
}

- (void)_connectionEnded:(id)a3
{
  -[NSMutableSet removeObject:](self->_tcpConnections, "removeObject:", a3);
}

- (NSString)deviceBonjourServiceType
{
  return self->_deviceBonjourServiceType;
}

- (void)setDeviceBonjourServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceIdentitifer
{
  return self->_deviceIdentitifer;
}

- (void)setDeviceIdentitifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentitifer, 0);
  objc_storeStrong((id *)&self->_deviceBonjourServiceType, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_tcpConnections, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end
