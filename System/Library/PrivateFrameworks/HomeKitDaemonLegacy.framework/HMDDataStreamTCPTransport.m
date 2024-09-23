@implementation HMDDataStreamTCPTransport

- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDDataStreamTCPTransport *v14;
  HMDDataStreamTCPTransport *v15;
  uint64_t v16;
  HMDDataStreamFrameReader *byteReader;
  uint64_t v18;
  NSString *logIdentifier;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDDataStreamTCPTransport;
  v14 = -[HMDDataStreamTCPTransport init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteAddress, a3);
    v15->_remotePort = a4;
    objc_storeStrong((id *)&v15->_workQueue, a5);
    v16 = objc_opt_new();
    byteReader = v15->_byteReader;
    v15->_byteReader = (HMDDataStreamFrameReader *)v16;

    v18 = objc_msgSend(v13, "copy");
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;

    v15->_schedulingMode = 0;
  }

  return v15;
}

- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 targetQueue:(id)a5 logIdentifier:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  HMDDataStreamTCPTransport *v17;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = a6;
  v14 = a5;
  v15 = a3;

  v16 = dispatch_queue_create_with_target_V2("HMDDataStreamTCPTransport", v12, v14);
  v17 = -[HMDDataStreamTCPTransport initWithAddress:port:workQueue:logIdentifier:](self, "initWithAddress:port:workQueue:logIdentifier:", v15, a4, v16, v13);

  if (v17)
    v17->_schedulingMode = 2;

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_tcpConnection)
    -[HMDDataStreamTCPTransport close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamTCPTransport;
  -[HMDDataStreamTCPTransport dealloc](&v3, sel_dealloc);
}

- (id)_createTcpConnection
{
  void *v3;
  HMDDataStreamTCPTransport *v4;
  NSObject *v5;
  void *v6;
  uint64_t schedulingMode;
  nw_parameters_t secure_tcp;
  void *v9;
  void *v10;
  id v11;
  void *host_with_numeric_port;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  HMDNetworkConnection *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    schedulingMode = v4->_schedulingMode;
    v18 = 138543618;
    v19 = v6;
    v20 = 2048;
    v21 = schedulingMode;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating TCP connection with scheduling mode %ld", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  nw_parameters_set_data_mode();
  if (v4->_schedulingMode)
  {
    v9 = (void *)nw_context_create();
    nw_context_set_isolate_protocol_stack();
    nw_context_set_scheduling_mode();
    nw_parameters_set_context();

  }
  -[HMDDataStreamTCPTransport remoteAddress](v4, "remoteAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addressString");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port();

  -[HMDDataStreamTCPTransport connectionFactory](v4, "connectionFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDDataStreamTCPTransport connectionFactory](v4, "connectionFactory");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, nw_parameters_t))v14)[2](v14, host_with_numeric_port, secure_tcp);
    v15 = (HMDNetworkConnection *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = -[HMDNetworkConnection initWithEndpoint:parameters:]([HMDNetworkConnection alloc], "initWithEndpoint:parameters:", host_with_numeric_port, secure_tcp);
  }
  -[HMDDataStreamTCPTransport workQueue](v4, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkConnection setQueue:](v15, "setQueue:", v16);

  return v15;
}

- (void)connect
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDDataStreamTCPTransport *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDDataStreamTCPTransport *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDDataStreamTCPTransport *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, int, void *);
  void *v31;
  id v32;
  id location;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = !self->_connected;
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v22;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-connecting transport", buf, 0xCu);

      }
    }
    else if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    self->_connected = 0;
    -[HMDDataStreamTCPTransport _createTcpConnection](self, "_createTcpConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamTCPTransport setTcpConnection:](self, "setTcpConnection:", v10);

    -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_initWeak(&location, self);
      -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __36__HMDDataStreamTCPTransport_connect__block_invoke;
      v31 = &unk_1E89B2BA8;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v12, "setStateChangedHandler:", &v28);

      v17 = (void *)MEMORY[0x1D17BA0A0](v13, v14, v15, v16);
      v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket starting", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDDataStreamTCPTransport tcpConnection](v18, "tcpConnection", v28, v29, v30, v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "start");

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v26;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create TCP connection (out of memory?)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamTCPTransport _stopWithError:](v24, "_stopWithError:", v27);

    }
  }
}

- (void)_handleReadClose
{
  void *v3;
  HMDDataStreamTCPTransport *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket read-end closed (half-close scenario)", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_registerForConnectionEvents
{
  void *v3;
  _BOOL4 connected;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    connected = self->_connected;

    if (connected)
    {
      objc_initWeak(&location, self);
      -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__HMDDataStreamTCPTransport__registerForConnectionEvents__block_invoke;
      v6[3] = &unk_1E89BE3F8;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v5, "setReadCloseHandler:", v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_start
{
  id v3;

  self->_connected = 1;
  -[HMDDataStreamTCPTransport _registerForConnectionEvents](self, "_registerForConnectionEvents");
  -[HMDDataStreamFrameReader reset](self->_byteReader, "reset");
  -[HMDDataStreamTCPTransport _doReceive](self, "_doReceive");
  -[HMDDataStreamTCPTransport delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportDidOpen:", self);

}

- (void)_stopWithError:(id)a3
{
  self->_connected = 0;
  -[HMDDataStreamTCPTransport _closeWithError:](self, "_closeWithError:", a3);
}

- (void)_consumeReceivedData:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushFrameData:", v13);

  -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCompleteFrame");

  if (v6)
  {
    do
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "popRawFrame");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[HMDDataStreamTCPTransport delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "transport:didReceiveRawFrame:", self, v9);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasCompleteFrame");

    }
    while ((v12 & 1) != 0);
  }

}

- (void)_doReceive
{
  void *v3;
  int v4;
  void *v5;
  HMDDataStreamTCPTransport *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasFailed");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing socket.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamTCPTransport _stopWithError:](v6, "_stopWithError:", v9);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HMDDataStreamTCPTransport byteReader](self, "byteReader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "bytesNeededForCurrentFrame");

    -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__HMDDataStreamTCPTransport__doReceive__block_invoke;
    v13[3] = &unk_1E89B2BD0;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v12, "receiveWithMinLength:maxLength:completion:", v11, (v11 + 256), v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDDataStreamTCPTransport *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket closing socket.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDataStreamTCPTransport tcpConnection](v7, "tcpConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancel");

    -[HMDDataStreamTCPTransport setTcpConnection:](v7, "setTcpConnection:", 0);
    v7->_connected = 0;
    -[HMDDataStreamTCPTransport delegate](v7, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
      objc_msgSend(v12, "transport:didFailWithError:", v7, v4);
    else
      objc_msgSend(v12, "transportDidClose:", v7);

  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)close
{
  -[HMDDataStreamTCPTransport _closeWithError:](self, "_closeWithError:", 0);
}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const void *v8;
  size_t v9;
  dispatch_data_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = objc_retainAutorelease(a3);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = dispatch_data_create(v8, v9, 0, 0);
  -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CCECE8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HMDDataStreamTCPTransport_sendRawFrame_completion___block_invoke;
  v14[3] = &unk_1E89BFC88;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v11, "sendData:context:isComplete:completion:", v10, v12, 1, v14);

}

- (void)setTrafficClass:(unint64_t)a3
{
  void *v5;
  void *v6;
  HMDDataStreamTCPTransport *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDDataStreamTCPTransport tcpConnection](self, "tcpConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class to %lu", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDDataStreamTCPTransport tcpConnection](v7, "tcpConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetTrafficClass:", a3);

  }
}

- (HMDDataStreamTransportDelegate)delegate
{
  return (HMDDataStreamTransportDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFNetAddress)remoteAddress
{
  return self->_remoteAddress;
}

- (HMDNetworkConnection)tcpConnection
{
  return self->_tcpConnection;
}

- (void)setTcpConnection:(id)a3
{
  objc_storeStrong((id *)&self->_tcpConnection, a3);
}

- (HMDDataStreamFrameReader)byteReader
{
  return self->_byteReader;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (id)connectionFactory
{
  return self->_connectionFactory;
}

- (void)setConnectionFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_tcpConnection, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __53__HMDDataStreamTCPTransport_sendRawFrame_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@DataStream Socket write error (%@)", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Socket wrote bytes.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __39__HMDDataStreamTCPTransport__doReceive__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  size_t size;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v12;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v16;
        v23 = 2048;
        size = dispatch_data_get_size(v8);
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Socket read %zd bytes", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      WeakRetained = (id)objc_msgSend(v14, "_consumeReceivedData:", v8);
    }
    if (v10)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0](WeakRetained);
      v18 = v12;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        size = (size_t)v10;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket read error (%@)", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v18, "_stopWithError:", v10);
    }
    else
    {
      objc_msgSend(v12, "_doReceive");
    }
  }

}

void __57__HMDDataStreamTCPTransport__registerForConnectionEvents__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleReadClose");
    WeakRetained = v2;
  }

}

void __36__HMDDataStreamTCPTransport_connect__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((a2 - 4) >= 2)
    {
      if (a2 == 3)
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = WeakRetained;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v14;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket connected", (uint8_t *)&v15, 0xCu);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v12, "_start");
      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = WeakRetained;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2112;
        v18 = v5;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket disconnected with error (%@)", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v8, "_stopWithError:", v5);
    }
  }

}

@end
