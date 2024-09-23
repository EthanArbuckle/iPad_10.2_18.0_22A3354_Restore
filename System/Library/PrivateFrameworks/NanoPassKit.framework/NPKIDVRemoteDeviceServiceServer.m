@implementation NPKIDVRemoteDeviceServiceServer

- (NPKIDVRemoteDeviceServiceServer)initWithConnection:(id)a3 delegate:(id)a4
{
  id v6;
  NPKIDVRemoteDeviceServiceServer *v7;
  NPKIDVRemoteDeviceServiceServer *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NPKIDVRemoteDeviceServiceServer;
  v7 = -[PDXPCService initWithConnection:](&v10, sel_initWithConnection_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4 ackHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Receive event: %@ from remote device with ID:%@", (uint8_t *)&v15, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "identityRemoteDeviceServiceServer:didReceiveEvent:fromRemoteDeviceWithID:", self, a3 & 0x3F, v8);

  v9[2](v9);
}

- (NPKIDVRemoteDeviceServiceServerDelegate)delegate
{
  return (NPKIDVRemoteDeviceServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
