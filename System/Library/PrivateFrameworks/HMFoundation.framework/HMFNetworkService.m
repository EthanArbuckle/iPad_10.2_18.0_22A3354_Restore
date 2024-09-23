@implementation HMFNetworkService

- (HMFNetworkService)initWithTXTRecords:(id)a3 browseResult:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  HMFNetworkServiceInfo *v11;
  HMFNetworkService *v12;

  v8 = a5;
  v9 = a3;
  v10 = nw_browse_result_copy_endpoint((nw_browse_result_t)a4);
  v11 = -[HMFNetworkServiceInfo initWithEndpoint:txtRecord:]([HMFNetworkServiceInfo alloc], "initWithEndpoint:txtRecord:", v10, v9);

  v12 = -[HMFNetworkService initWithServiceInfo:port:queue:](self, "initWithServiceInfo:port:queue:", v11, nw_endpoint_get_port(v10), v8);
  return v12;
}

- (HMFNetworkService)initWithServiceInfo:(id)a3 port:(unsigned __int16)a4 queue:(id)a5
{
  id v9;
  id v10;
  HMFNetworkService *v11;
  HMFNetworkService *v12;
  uint64_t v13;
  NSMutableArray *ipAddresses;
  HMFNetworkService *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFNetworkService;
    v11 = -[HMFNetworkService init](&v17, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_workQueue, a5);
      objc_storeStrong((id *)&v12->_serviceInfo, a3);
      v12->_port = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      ipAddresses = v12->_ipAddresses;
      v12->_ipAddresses = (NSMutableArray *)v13;

    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "host"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HMFNetworkService host](self, "host"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = HMFEqualObjects(v8, v9),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v7, "serviceInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetworkService serviceInfo](self, "serviceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects(v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;

  -[HMFNetworkService nwConnection](self, "nwConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMFNetworkService nwConnection](self, "nwConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v4);

    -[HMFNetworkService setNwConnection:](self, "setNwConnection:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[HMFNetworkService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HMFNetworkService;
  -[HMFNetworkService dealloc](&v3, sel_dealloc);
}

- (id)resolveAddressWithAddressType:(unint64_t)a3 timeout:(double)a4 receivedDataHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *secure_udp;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  nw_ip_version_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v27;

  v8 = a5;
  if (-[HMFNetworkService lowPowerMode](self, "lowPowerMode"))
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC373C](v8);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, _QWORD, void *))v9)[2](v9, 1, 0, v10);

    }
    +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
    +[HMFFuture futureWithPromise:](HMFFuture, "futureWithPromise:", &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetworkService serviceInfo](self, "serviceInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isUDP");
    v15 = (void *)*MEMORY[0x1E0CCED20];
    if (v14)
      secure_udp = nw_parameters_create_secure_udp(v15, &__block_literal_global_83);
    else
      secure_udp = nw_parameters_create_secure_tcp(v15, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    v17 = secure_udp;
    v18 = nw_parameters_copy_default_protocol_stack(secure_udp);
    v19 = nw_protocol_stack_copy_internet_protocol(v18);
    v20 = v19;
    if (a3 == 2)
      v21 = 6;
    else
      v21 = 0;
    if (a3 == 1)
      v22 = nw_ip_version_4;
    else
      v22 = v21;
    nw_ip_options_set_version(v19, v22);
    v23 = nw_interface_create_with_name();
    nw_parameters_prohibit_interface(v17, v23);

    -[HMFNetworkService _connectionWithPromise:parameters:receivedDataHandler:](self, "_connectionWithPromise:parameters:receivedDataHandler:", v27, v17, v8);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      nw_connection_start(v24);
      -[HMFNetworkService setNwConnection:](self, "setNwConnection:", v25);
      objc_msgSend(v12, "timeout:", a4);
    }
    else
    {
      +[HMFFuture futureWithNoValue](HMFFuture, "futureWithNoValue");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)updateWithService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFNetworkService workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HMFNetworkService_updateWithService___block_invoke;
  v7[3] = &unk_1E3B37CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__HMFNetworkService_updateWithService___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "serviceInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithServiceInfo:", v2);

}

- (NSString)host
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMFNetworkService serviceInfo](self, "serviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkService serviceInfo](self, "serviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkService serviceInfo](self, "serviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)hostName
{
  void *v2;
  void *v3;

  -[HMFNetworkService serviceInfo](self, "serviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)addresses
{
  void *v2;
  void *v3;

  -[HMFNetworkService ipAddresses](self, "ipAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)lowPowerMode
{
  void *v2;
  void *v3;
  char v4;

  -[HMFNetworkService serviceInfo](self, "serviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("_lpm"));

  return v4;
}

- (id)_connectionWithPromise:(id)a3 parameters:(id)a4 receivedDataHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *srv;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD handler[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMFNetworkService invalidate](self, "invalidate");
  -[HMFNetworkService host](self, "host");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  srv = nw_endpoint_create_srv();
  v13 = nw_connection_create(srv, v9);

  -[HMFNetworkService workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v13, v14);

  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke;
  handler[3] = &unk_1E3B38B20;
  objc_copyWeak(&v25, &location);
  v15 = v13;
  v22 = v15;
  v16 = v10;
  v24 = v16;
  v17 = v8;
  v23 = v17;
  nw_connection_set_state_changed_handler(v15, handler);
  v18 = v23;
  v19 = v15;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

void __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  nw_path_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  _QWORD completion[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 5)
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v14 = "%{public}@Connection is cancelled";
LABEL_9:
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEBUG, v14, buf, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v10);
    goto LABEL_11;
  }
  if (a2 == 3)
  {
    v7 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    v8 = objc_msgSend(WeakRetained, "_updateDeviceWithPath:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = *(NSObject **)(a1 + 32);
      completion[0] = MEMORY[0x1E0C809B0];
      completion[1] = 3221225472;
      completion[2] = __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke_11;
      completion[3] = &unk_1E3B38AF8;
      v16 = *(id *)(a1 + 48);
      nw_connection_receive(v9, 0, 0xFFFFFFFF, completion);
      objc_msgSend(*(id *)(a1 + 40), "fulfillWithNoValue");

      goto LABEL_11;
    }
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v14 = "%{public}@Reported a network path that cannot be resolved to an IP address - skipping";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_11:

}

void __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  CFErrorRef v10;
  id v11;

  v11 = a2;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC373C](*(_QWORD *)(a1 + 32));
  if (v9)
  {
    if (v8)
      v10 = nw_error_copy_cf_error(v8);
    else
      v10 = 0;
    ((void (**)(_QWORD, uint64_t, id, CFErrorRef))v9)[2](v9, a4, v11, v10);

  }
}

- (BOOL)_updateDeviceWithPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const sockaddr *address;
  HMFNetAddress *v9;
  void *v10;
  HMFNetworkService *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int port;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMFNetworkService workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = nw_path_copy_endpoint();
    v7 = v6;
    if (v6 && (address = nw_endpoint_get_address(v6)) != 0)
    {
      v9 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", address);
      -[NSMutableArray addObject:](self->_ipAddresses, "addObject:", v9);
      self->_port = nw_endpoint_get_port(v7);
      v10 = (void *)MEMORY[0x1A1AC355C]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFNetAddress addressString](v9, "addressString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        port = self->_port;
        v18 = 138543874;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        v22 = 1024;
        v23 = port;
        _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_INFO, "%{public}@Resolved: %{public}@ %hu", (uint8_t *)&v18, 0x1Cu);

      }
      objc_autoreleasePoolPop(v10);

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v7 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMFNetworkService host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkService addresses](self, "addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ (%hu)"), v4, v5, v7, -[HMFNetworkService port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMFNetworkService host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_9 != -1)
    dispatch_once(&_MergedGlobals_3_9, &__block_literal_global_27);
  return (id)qword_1ED012F48;
}

void __32__HMFNetworkService_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkService"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F48;
  qword_1ED012F48 = v0;

}

- (HMFNetworkServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (unsigned)port
{
  return self->_port;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableArray)ipAddresses
{
  return self->_ipAddresses;
}

- (void)setIpAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddresses, a3);
}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (void)setNwConnection:(id)a3
{
  objc_storeStrong((id *)&self->_nwConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwConnection, 0);
  objc_storeStrong((id *)&self->_ipAddresses, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end
