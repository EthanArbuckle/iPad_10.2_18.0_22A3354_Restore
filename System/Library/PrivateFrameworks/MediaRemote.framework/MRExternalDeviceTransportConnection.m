@implementation MRExternalDeviceTransportConnection

- (BOOL)isValid
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDeviceTransportConnection isValid]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSError)error
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDeviceTransportConnection sendTransportData:options:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)close
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDeviceTransportConnection close]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)_notifyDelegateDidCloseWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MRExternalDeviceTransportConnection delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MRExternalDeviceTransportConnection delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportDidClose:error:", self, v7);

  }
}

- (void)_notifyDelegateDidReceiveData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MRExternalDeviceTransportConnection delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MRExternalDeviceTransportConnection delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transport:didReceiveData:", self, v7);

  }
}

- (id)exportEndpoint:(id)a3
{
  return a3;
}

- (id)exportEndpoints:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MRExternalDeviceTransportConnection_exportEndpoints___block_invoke;
  v4[3] = &unk_1E30CAC18;
  v4[4] = self;
  objc_msgSend(a3, "mr_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __55__MRExternalDeviceTransportConnection_exportEndpoints___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "exportEndpoint:", a2);
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  MRAVDistantOutputDevice *v4;
  void *v5;
  void *v6;
  MRDeviceInfoOutputDevice *v7;
  MRAVDistantOutputDevice *v8;
  unsigned int (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v13[4];
  MRAVDistantOutputDevice *v14;

  v4 = (MRAVDistantOutputDevice *)a3;
  if (-[MRAVDistantOutputDevice isLocalDevice](v4, "isLocalDevice"))
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[MRDeviceInfoOutputDevice initWithDeviceInfo:fallbackOutputDevice:forExporting:]([MRDeviceInfoOutputDevice alloc], "initWithDeviceInfo:fallbackOutputDevice:forExporting:", v6, v4, 1);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__MRExternalDeviceTransportConnection_exportOutputDevice_endpoint___block_invoke;
    v13[3] = &unk_1E30C82F8;
    v14 = v4;
    v8 = v4;
    v9 = (unsigned int (**)(_QWORD))MEMORY[0x194036C44](v13);
    -[MRAVOutputDevice descriptor](v7, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9[2](v9))
    {
      objc_msgSend(v6, "WHAIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUniqueIdentifier:", v11);

    }
    v4 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v10);

  }
  return v4;
}

BOOL __67__MRExternalDeviceTransportConnection_exportOutputDevice_endpoint___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "parentUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1 == 0;
}

- (id)exportOutputDevices:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__MRExternalDeviceTransportConnection_exportOutputDevices_endpoint___block_invoke;
  v10[3] = &unk_1E30C8790;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "mr_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __68__MRExternalDeviceTransportConnection_exportOutputDevices_endpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "exportOutputDevice:endpoint:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  return 1;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  return 1;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, a3);
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationGroupUID, a3);
}

- (unsigned)connectOptions
{
  return self->_connectOptions;
}

- (void)setConnectOptions:(unsigned int)a3
{
  self->_connectOptions = a3;
}

- (NSDictionary)connectUserInfo
{
  return self->_connectUserInfo;
}

- (void)setConnectUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectUserInfo, a3);
}

- (MRExternalDeviceTransportConnectionDelegate)delegate
{
  return (MRExternalDeviceTransportConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectUserInfo, 0);
  objc_storeStrong((id *)&self->_destinationGroupUID, 0);
  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
