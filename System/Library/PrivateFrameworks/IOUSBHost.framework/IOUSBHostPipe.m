@implementation IOUSBHostPipe

- (IOUSBHostPipe)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7
{
  IOUSBHostPipe *v7;
  IOUSBHostPipe *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IOUSBHostPipe;
  v7 = -[IOUSBHostIOSource initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:](&v12, sel_initWithHostInterface_endpointAddress_ioConnection_ioNotificationPortRef_deviceAddress_, a3, a4, *(_QWORD *)&a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[IOUSBHostPipe setStreamsEnabled:](v7, "setStreamsEnabled:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    -[IOUSBHostPipe setInvalidDescriptorCache:](v8, "setInvalidDescriptorCache:", v9);

    -[IOUSBHostPipe invalidDescriptorCache](v8, "invalidDescriptorCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (const)originalDescriptors
{
  return -[IOUSBHostPipe ioSourceDescriptorsWithOption:](self, "ioSourceDescriptorsWithOption:", 0);
}

- (const)descriptors
{
  return -[IOUSBHostPipe ioSourceDescriptorsWithOption:](self, "ioSourceDescriptorsWithOption:", 1);
}

- (const)ioSourceDescriptorsWithOption:(unint64_t)a3
{
  void *v5;
  void *v6;
  mach_port_t v7;
  id v8;
  kern_return_t v9;
  const IOUSBHostIOSourceDescriptors *v10;
  id v11;
  const IOUSBHostIOSourceDescriptors *v12;
  id v14;
  void *v15;
  size_t v16;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[IOUSBHostPipe currentDescriptorsCache](self, "currentDescriptorsCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IOUSBHostPipe originalDescriptorsCache](self, "originalDescriptorsCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[IOUSBHostPipe originalDescriptorsCache](self, "originalDescriptorsCache");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const IOUSBHostIOSourceDescriptors *)objc_msgSend(v11, "bytes");

      return v12;
    }
  }
  v16 = 24;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = a3;
  v7 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  v8 = objc_retainAutorelease(v6);
  v9 = IOConnectCallMethod(v7, 0x11u, input, 2u, 0, 0, 0, 0, (void *)objc_msgSend(v8, "mutableBytes"), &v16);
  v10 = 0;
  if (!v9)
  {
    if (objc_msgSend(v8, "isEqualToData:", v5))
    {
      v10 = (const IOUSBHostIOSourceDescriptors *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
    }
    else
    {
      v14 = objc_retainAutorelease(v8);
      v10 = (const IOUSBHostIOSourceDescriptors *)objc_msgSend(v14, "bytes");
      if (v5)
      {
        -[IOUSBHostPipe invalidDescriptorCache](self, "invalidDescriptorCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v5);

      }
      if (a3)
        -[IOUSBHostPipe setCurrentDescriptorsCache:](self, "setCurrentDescriptorsCache:", v14);
      else
        -[IOUSBHostPipe setOriginalDescriptorsCache:](self, "setOriginalDescriptorsCache:", v14);
    }
  }

  return v10;
}

- (BOOL)adjustPipeWithDescriptors:(const IOUSBHostIOSourceDescriptors *)descriptors error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  const char *v16;
  uint64_t input;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  input = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  v7 = IOConnectCallMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0xDu, &input, 1u, descriptors, 0x18uLL, 0, 0, 0, 0);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to adjust pipe."), &stru_24DEDD560, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v7, v14);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[IOUSBHostPipe adjustPipeWithDescriptors:error:].cold.1(v15, v16);

  }
  return v7 == 0;
}

- (NSTimeInterval)idleTimeout
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  output = 0;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0xFu, input, 1u, &output, &outputCnt);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = 0.0;
    if ((-[IOUSBHostIOSource debugLoggingMask](self, "debugLoggingMask") & 1) != 0)
      NSLog(CFSTR("[Line %d of %s] %sconnect call failed with 0x%x"), 183, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostPipe.m", "-[IOUSBHostPipe idleTimeout]", v4);
  }
  else
  {
    v5 = (double)output;
  }
  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  NSUInteger v7;
  uint64_t (*__ptr32 *v8)();
  kern_return_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  const char *v18;
  uint64_t input[2];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v7 = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  v8 = &off_21B5E5000;
  LODWORD(v8) = vcvtad_u64_f64(idleTimeout * 1000.0);
  input[0] = v7;
  input[1] = (uint64_t)v8;
  v9 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0xEu, input, 2u, 0, 0);
  if (v9 && error)
  {
    v21[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Unable to set an idle timeout."), &stru_24DEDD560, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    v21[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v9, v16);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      -[IOUSBHostPipe setIdleTimeout:error:].cold.1(v17, v18);

  }
  return v9 == 0;
}

- (BOOL)clearStallWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  const char *v13;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection", -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")), 0x10u, &v15, 1u, 0, 0);
  if (v4 && error)
  {
    v16[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Unable to clear stall."), &stru_24DEDD560, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v16[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    v16[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v4, v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      -[IOUSBHostPipe clearStallWithError:].cold.1(v12, v13);

  }
  return v4 == 0;
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:](self, "sendControlRequest:data:bytesTransferred:completionTimeout:error:", request, 0, 0, error, 5.0);
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:](self, "sendControlRequest:data:bytesTransferred:completionTimeout:error:", request, data, bytesTransferred, error, 5.0);
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  uint64_t wLength;
  NSMutableData *v13;
  uint64_t (*__ptr32 *v14)();
  uint64_t v15;
  kern_return_t v16;
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  const char *v26;
  uint64_t v28;
  uint32_t outputCnt;
  uint64_t input[8];
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x24BDAC8D0];
  wLength = request.wLength;
  v13 = data;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = request.bmRequestType;
  input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  v14 = &off_21B5E5000;
  LODWORD(v14) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v14;
  if (v13)
    v15 = -[NSMutableData mutableBytes](objc_retainAutorelease(v13), "mutableBytes");
  else
    v15 = 0;
  input[7] = v15;
  outputCnt = 1;
  v16 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection", 0), 0x12u, input, 8u, &v28, &outputCnt);
  v17 = v16;
  if (bytesTransferred)
    *bytesTransferred = v28;
  if (v16 && error)
  {
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Unable to send control request."), &stru_24DEDD560, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v31[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    v31[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v17, v24);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:].cold.1(v25, v26);

  }
  return v17 == 0;
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:](self, "enqueueControlRequest:data:completionTimeout:error:completionHandler:", request, 0, error, completionHandler, 5.0);
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:](self, "enqueueControlRequest:data:completionTimeout:error:completionHandler:", request, data, error, completionHandler, 5.0);
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  uint64_t wLength;
  NSMutableData *v13;
  IOUSBHostCompletionHandler v14;
  uint64_t (*__ptr32 *v15)();
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  mach_port_t v19;
  mach_port_t MachPort;
  kern_return_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  const char *v31;
  NSError **v33;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t input[8];
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x24BDAC8D0];
  wLength = request.wLength;
  v13 = data;
  v14 = completionHandler;
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = request.bmRequestType;
  input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  v15 = &off_21B5E5000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v15;
  if (v13)
    v16 = -[NSMutableData mutableBytes](objc_retainAutorelease(v13), "mutableBytes");
  else
    v16 = 0;
  input[7] = v16;
  outputCnt = 1;
  output = 0;
  *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38 = v17;
  v39 = v17;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v37 = v17;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v14)
  {
    v18 = MEMORY[0x220763B3C](v14);

  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)&v37 = v18;
  v19 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v21 = IOConnectCallAsyncScalarMethod(v19, 0x12u, MachPort, reference, 3u, input, 8u, &output, &outputCnt);
  if (v21)
  {
    v22 = (void *)v37;
    if (error)
    {
      v41[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = error;
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue control request."), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v24;
      v41[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v26;
      v41[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v21, v29);
      *v33 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v30)
        -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:].cold.1(v30, v31);

    }
  }

  return v21 == 0;
}

- (BOOL)abortWithError:(NSError *)error
{
  return -[IOUSBHostPipe abortWithOption:error:](self, "abortWithOption:error:", 1, error);
}

- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  const char *v16;
  uint64_t input[2];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = option;
  v7 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x13u, input, 2u, 0, 0);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to abort IO."), &stru_24DEDD560, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    v19[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v7, v14);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[IOUSBHostPipe abortWithOption:error:].cold.1(v15, v16);

  }
  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  NSMutableData *v10;
  NSMutableData *v11;
  NSMutableData *v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t (*__ptr32 *v16)();
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  const char *v27;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v10 = data;
  v11 = v10;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = -[NSMutableData mutableBytes](v12, "mutableBytes");
    v14 = -[NSMutableData length](v12, "length");
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  v15 = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  v16 = &off_21B5E5000;
  LODWORD(v16) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[0] = v15;
  input[1] = v14;
  input[2] = (uint64_t)v16;
  input[3] = v13;
  outputCnt = 1;
  output = 0;
  v17 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x14u, input, 4u, &output, &outputCnt);
  v18 = v17;
  if (bytesTransferred)
    *bytesTransferred = output;
  if (v17 && error)
  {
    v32[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Unable to send IO."), &stru_24DEDD560, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    v32[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    v32[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v18, v25);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:].cold.1(v26, v27);

  }
  return v18 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  NSMutableData *v10;
  IOUSBHostCompletionHandler v11;
  NSMutableData *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*__ptr32 *v15)();
  __int128 v16;
  uint64_t v17;
  mach_port_t v18;
  mach_port_t MachPort;
  kern_return_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  const char *v30;
  NSError **v32;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t input[4];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v10 = data;
  v11 = completionHandler;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = -[NSMutableData mutableBytes](v12, "mutableBytes");
    v14 = -[NSMutableData length](v12, "length");
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = v14;
  v15 = &off_21B5E5000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[2] = (uint64_t)v15;
  input[3] = v13;
  outputCnt = 1;
  output = 0;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v16;
  v38 = v16;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v36 = v16;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v11)
  {
    v17 = MEMORY[0x220763B3C](v11);

  }
  else
  {
    v17 = 0;
  }
  *(_QWORD *)&v36 = v17;
  v18 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v20 = IOConnectCallAsyncScalarMethod(v18, 0x14u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v20)
  {
    v21 = (void *)v36;
    if (error)
    {
      v40[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue IO."), &stru_24DEDD560, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v23;
      v40[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = error;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v25;
      v40[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v20, v28);
      *v32 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v29)
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:].cold.1(v29, v30);

    }
  }

  return v20 == 0;
}

- (BOOL)sendIORequestWithData:(id)a3 frameList:(void *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 version:(unint64_t)a9
{
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  kern_return_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  const char *v31;
  uint64_t input[8];
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = v15;
  if (v15)
  {
    v17 = objc_retainAutorelease(v15);
    v18 = objc_msgSend(v17, "mutableBytes");
    v19 = objc_msgSend(v17, "length");
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = (uint64_t)a4;
  input[2] = a5;
  input[3] = v18;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a9;
  if (a9 == 1)
  {
    v20 = 21;
  }
  else
  {
    if (a9 != 2)
    {
      v21 = -536870199;
      goto LABEL_11;
    }
    v20 = 26;
  }
  v21 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), v20, input, 8u, 0, 0);
  if (!v21)
  {
    v22 = 1;
    goto LABEL_16;
  }
LABEL_11:
  if (a8)
  {
    v34[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Unable to send IO."), &stru_24DEDD560, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v24;
    v34[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v26;
    v34[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v21, v29);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:].cold.1(v30, v31);

  }
  v22 = 0;
LABEL_16:

  return v22;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error
{
  return -[IOUSBHostPipe sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:](self, "sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:", data, frameList, frameListCount, firstFrameNumber, 0, error, 1);
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error
{
  return -[IOUSBHostPipe sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:](self, "sendIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:version:", data, transactionList, transactionListCount, firstFrameNumber, *(_QWORD *)&options, error, 2);
}

- (BOOL)enqueueIORequestWithData:(id)a3 frameList:(IOUSBHostIsochronousFrame *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 completionHandler:(id)a9 version:(unint64_t)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  void *v22;
  uint32_t v23;
  id *v24;
  mach_port_t v25;
  mach_port_t MachPort;
  kern_return_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  const char *v37;
  BOOL v38;
  void *v41;
  uint64_t reference[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t input[8];
  _QWORD v47[3];
  _QWORD v48[5];

  v48[3] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a9;
  v17 = v15;
  if (v15)
  {
    v18 = objc_retainAutorelease(v15);
    v15 = (id)objc_msgSend(v18, "mutableBytes");
    v19 = objc_msgSend(v18, "length");
  }
  else
  {
    v19 = 0;
  }
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = (uint64_t)a4;
  input[2] = a5;
  input[3] = (uint64_t)v15;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a10;
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v20;
  v45 = v20;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v43 = v20;
  reference[1] = (uint64_t)_isochCompletionCallback;
  if (v16)
  {
    v21 = (void *)MEMORY[0x220763B3C](v16);

  }
  else
  {
    v21 = 0;
  }
  v22 = v17;
  *(_QWORD *)&v43 = v21;
  if (a10 == 1)
  {
    v23 = 21;
  }
  else
  {
    if (a10 != 2)
    {
      v28 = -536870199;
      v24 = a8;
      if (!a8)
        goto LABEL_18;
LABEL_15:
      v41 = v22;
      v47[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue IO."), &stru_24DEDD560, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v30;
      v47[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v32;
      v47[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v28, v35);
      *v24 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v36)
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:].cold.1(v36, v37);

      v22 = v41;
      goto LABEL_18;
    }
    v23 = 26;
  }
  v24 = a8;
  v25 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v27 = IOConnectCallAsyncMethod(v25, v23, MachPort, reference, 3u, input, 8u, 0, 0, 0, 0, 0, 0);
  if (!v27)
  {
    v38 = 1;
    goto LABEL_20;
  }
  v21 = (void *)v43;
  v28 = v27;
  if (a8)
    goto LABEL_15;
LABEL_18:

  v38 = 0;
LABEL_20:

  return v38;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error completionHandler:(IOUSBHostIsochronousCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:](self, "enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:", data, frameList, frameListCount, firstFrameNumber, 0, error, completionHandler, 1);
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error completionHandler:(IOUSBHostIsochronousTransactionCompletionHandler)completionHandler
{
  return -[IOUSBHostPipe enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:](self, "enqueueIORequestWithData:frameList:frameListCount:firstFrameNumber:options:error:completionHandler:version:", data, transactionList, transactionListCount, firstFrameNumber, *(_QWORD *)&options, error, completionHandler, 2);
}

- (BOOL)enableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  const char *v14;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection", -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")), 0x16u, &v16, 1u, 0, 0);
  if (v5)
  {
    if (error)
    {
      v17[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unable to enable streams."), &stru_24DEDD560, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v17[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v9;
      v17[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v5, v12);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        -[IOUSBHostPipe enableStreamsWithError:].cold.1(v13, v14);

    }
  }
  else
  {
    -[IOUSBHostPipe setStreamsEnabled:](self, "setStreamsEnabled:", 1);
  }
  return v5 == 0;
}

- (BOOL)disableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  BOOL v6;
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  const char *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostPipe streamsEnabled](self, "streamsEnabled"))
  {
    v5 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection", -[IOUSBHostIOSource endpointAddress](self, "endpointAddress")), 0x17u, &v27, 1u, 0, 0);
    v6 = v5 == 0;
    if (v5)
    {
      if (error)
      {
        v7 = v5;
        v28 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to disable streams."), &stru_24DEDD560, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v9;
        v29 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v11;
        v30 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v28, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v7, v14);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v15)
          -[IOUSBHostPipe disableStreamsWithError:].cold.1(v15, v16);

      }
    }
    else
    {
      -[IOUSBHostPipe setStreamsEnabled:](self, "setStreamsEnabled:", 0);
    }
  }
  else
  {
    if (error)
    {
      v28 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Unable to disable streams."), &stru_24DEDD560, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      v29 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Streams were never enabled."), &stru_24DEDD560, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      v30 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Enable streams before disabling streams."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v28, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870911, v23);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v24)
        -[IOUSBHostPipe disableStreamsWithError:].cold.2(v24, v25);

    }
    return 0;
  }
  return v6;
}

- (IOUSBHostStream)copyStreamWithStreamID:(NSUInteger)streamID error:(NSError *)error
{
  void *v7;
  io_registry_entry_t v8;
  CFTypeRef v9;
  CFTypeID v10;
  IOUSBHostStream *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  const char *v45;
  unsigned __int8 valuePtr;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (!-[IOUSBHostPipe streamsEnabled](self, "streamsEnabled"))
  {
    if (error)
    {
      v48 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Unable to copy stream."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v22;
      v49 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Streams were never enabled."), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v24;
      v50 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Enable streams before copying a stream."), &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v48, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870911, v27);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v28)
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.4(v28, v29);
      goto LABEL_20;
    }
    return 0;
  }
  valuePtr = 0;
  -[IOUSBHostIOSource hostInterface](self, "hostInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ioService");
  v9 = IORegistryEntrySearchCFProperty(v8, "IOService", CFSTR("USBSpeed"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);

  if (!v9)
  {
    if (error)
    {
      v48 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Unable to copy stream."), &stru_24DEDD560, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v31;
      v49 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Unable to get device speed."), &stru_24DEDD560, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v33;
      v50 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v48, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v27);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v36)
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.1(v36, v37);
      goto LABEL_20;
    }
    return 0;
  }
  v10 = CFGetTypeID(v9);
  if (v10 == CFNumberGetTypeID())
    CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt8Type, &valuePtr);
  CFRelease(v9);
  if (streamID - 1 >= IOUSBGetEndpointMaxStreams(valuePtr, (const IOUSBEndpointDescriptor *)(-[IOUSBHostPipe descriptors](self, "descriptors") + 2), (const IOUSBSuperSpeedEndpointCompanionDescriptor *)(-[IOUSBHostPipe descriptors](self, "descriptors")+ 9)))
  {
    if (error)
    {
      v48 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Unable to copy stream."), &stru_24DEDD560, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v39;
      v49 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("StreamID out of bounds."), &stru_24DEDD560, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v41;
      v50 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Select a valid streamID."), &stru_24DEDD560, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v48, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v27);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v44)
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.3(v44, v45);
LABEL_20:

      return 0;
    }
    return 0;
  }
  v11 = -[IOUSBHostStream initWithHostPipe:streamID:ioConnection:ioNotificationPortRef:]([IOUSBHostStream alloc], "initWithHostPipe:streamID:ioConnection:ioNotificationPortRef:", self, streamID, -[IOUSBHostIOSource ioConnection](self, "ioConnection"), -[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  if (!v11 && error)
  {
    v48 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Unable to copy stream."), &stru_24DEDD560, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v13;
    v49 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("IOUSBHostStream init failed."), &stru_24DEDD560, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v15;
    v50 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v48, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v18);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.2(v19, v20);

  }
  return v11;
}

- (NSData)originalDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOriginalDescriptorsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)currentDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentDescriptorsCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)streamsEnabled
{
  return self->_streamsEnabled;
}

- (void)setStreamsEnabled:(BOOL)a3
{
  self->_streamsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidDescriptorCache, 0);
  objc_storeStrong((id *)&self->_currentDescriptorsCache, 0);
  objc_storeStrong((id *)&self->_originalDescriptorsCache, 0);
}

- (void)adjustPipeWithDescriptors:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to adjust pipe."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)setIdleTimeout:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to set an idle timeout."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)clearStallWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to clear stall."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)sendControlRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to send control request."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueControlRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue control request."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)abortWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to abort IO."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)sendIORequestWithData:(uint64_t)a1 bytesTransferred:(const char *)a2 completionTimeout:error:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to send IO."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueIORequestWithData:(uint64_t)a1 completionTimeout:(const char *)a2 error:completionHandler:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue IO."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)enableStreamsWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enable streams."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)disableStreamsWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to disable streams."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)disableStreamsWithError:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to disable streams."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Streams were never enabled."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy stream."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to get device speed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy stream."), a2);
  OUTLINED_FUNCTION_2(CFSTR("IOUSBHostStream init failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.3(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy stream."), a2);
  OUTLINED_FUNCTION_2(CFSTR("StreamID out of bounds."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyStreamWithStreamID:(uint64_t)a1 error:(const char *)a2 .cold.4(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy stream."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Streams were never enabled."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end
