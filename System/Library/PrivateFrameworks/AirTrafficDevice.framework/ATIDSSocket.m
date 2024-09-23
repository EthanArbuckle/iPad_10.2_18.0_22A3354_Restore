@implementation ATIDSSocket

- (ATIDSSocket)initWithDevice:(id)a3 service:(id)a4 priority:(int64_t)a5
{
  id v9;
  id v10;
  ATIDSSocket *v11;
  ATIDSSocket *v12;
  CFIndex AppIntegerValue;
  CFIndex v14;
  NSObject *v15;
  unsigned int wifiWriteBufferSize;
  unsigned int btWriteBufferSize;
  Boolean keyExistsAndHasValidFormat;
  objc_super v20;
  uint8_t buf[4];
  ATIDSSocket *v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATIDSSocket;
  v11 = -[ATSocket init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a3);
    v12->_priority = a5;
    objc_storeStrong((id *)&v12->_service, a4);
    v12->_wifiWriteBufferSize = 0x8000;
    v12->_btWriteBufferSize = 0x8000;
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("IDSSocketWiFiWriteBufferSize"), CFSTR("com.apple.atc"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppIntegerValue)
      v12->_wifiWriteBufferSize = (_DWORD)AppIntegerValue << 10;
    v14 = CFPreferencesGetAppIntegerValue(CFSTR("IDSSocketBTWriteBufferSize"), CFSTR("com.apple.atc"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && v14)
      v12->_btWriteBufferSize = (_DWORD)v14 << 10;
    _ATLogCategoryFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      wifiWriteBufferSize = v12->_wifiWriteBufferSize;
      btWriteBufferSize = v12->_btWriteBufferSize;
      *(_DWORD *)buf = 138543874;
      v22 = v12;
      v23 = 1024;
      v24 = wifiWriteBufferSize;
      v25 = 1024;
      v26 = btWriteBufferSize;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new IDS socket. _wifiWriteBufferSize=%uk, _btWriteBufferSize=%uk", buf, 0x18u);
    }

    -[ATSocket setWriteBufferSize:](v12, "setWriteBufferSize:", v12->_btWriteBufferSize);
  }

  return v12;
}

- (void)connectWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  IDSDevice *device;
  id v13;
  void *v14;
  IDSDeviceConnection *v15;
  IDSDeviceConnection *deviceConnection;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  ATIDSSocket *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D340A8];
  v24[0] = &unk_1E928B710;
  v6 = *MEMORY[0x1E0D34098];
  v23[0] = v5;
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATIDSSocket priority](self, "priority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryFramework();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSDevice uniqueID](self->_device, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ creating connection to %{public}@", buf, 0x16u);

  }
  v11 = objc_alloc(MEMORY[0x1E0D342C8]);
  device = self->_device;
  v17 = MEMORY[0x1E0C809B0];
  v18 = v4;
  v13 = v4;
  -[ATSocket queue](self, "queue", v17, 3221225472, __37__ATIDSSocket_connectWithCompletion___block_invoke, &unk_1E927C960, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (IDSDeviceConnection *)objc_msgSend(v11, "initSocketWithDevice:options:completionHandler:queue:", device, v8, &v17, v14);
  deviceConnection = self->_deviceConnection;
  self->_deviceConnection = v15;

}

- (void)dealloc
{
  objc_super v3;

  if (-[ATSocket isOpen](self, "isOpen"))
    -[ATSocket close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  -[ATSocket dealloc](&v3, sel_dealloc);
}

- (BOOL)open
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  return -[ATSocket open](&v3, sel_open);
}

- (void)closeDescriptor
{
  NSObject *v3;
  IDSDeviceConnection *deviceConnection;
  int v5;
  ATIDSSocket *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_deviceConnection)
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ closing IDS connection", (uint8_t *)&v5, 0xCu);
    }

    -[IDSDeviceConnection close](self->_deviceConnection, "close");
    -[ATSocket setDescriptor:](self, "setDescriptor:", 0);
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = 0;

  }
}

- (void)addTransportUpgradeException
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  -[ATSocket addTransportUpgradeException](&v3, sel_addTransportUpgradeException);
  if (-[ATSocket transportUpdgradeExceptionCount](self, "transportUpdgradeExceptionCount") == 1)
  {
    -[ATIDSService setPreferWifi:](self->_service, "setPreferWifi:", 1);
    -[ATSocket setWriteBufferSize:](self, "setWriteBufferSize:", self->_wifiWriteBufferSize);
  }
}

- (void)removeTransportUpgradeException
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATIDSSocket;
  -[ATSocket removeTransportUpgradeException](&v3, sel_removeTransportUpgradeException);
  if (!-[ATSocket transportUpdgradeExceptionCount](self, "transportUpdgradeExceptionCount"))
  {
    -[ATIDSService setPreferWifi:](self->_service, "setPreferWifi:", 0);
    -[ATSocket setWriteBufferSize:](self, "setWriteBufferSize:", self->_btWriteBufferSize);
  }
}

- (IDSDevice)device
{
  return self->_device;
}

- (ATIDSService)service
{
  return self->_service;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
}

void __37__ATIDSSocket_connectWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v7 + 65672), "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    v15 = 1024;
    v16 = a2;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ connection to %{public}@ completed. fd=%d, error=%{public}@", (uint8_t *)&v11, 0x26u);

  }
  v9 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v9, "closeDescriptor");
  else
    objc_msgSend(v9, "setDescriptor:", a2);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);

}

@end
