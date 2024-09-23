@implementation IOUSBHostStream

- (IOUSBHostStream)initWithHostPipe:(id)a3 streamID:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  IOUSBHostStream *v12;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  objc_msgSend(v10, "hostInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IOUSBHostIOSource initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:](self, "initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:", v11, objc_msgSend(v10, "endpointAddress"), v7, a6, objc_msgSend(v10, "deviceAddress"));

  if (v12)
  {
    -[IOUSBHostStream setStreamID:](v12, "setStreamID:", a4);
    -[IOUSBHostStream setHostPipe:](v12, "setHostPipe:", v10);
  }

  return v12;
}

- (BOOL)abortWithError:(NSError *)error
{
  return -[IOUSBHostStream abortWithOption:error:](self, "abortWithOption:error:", 1, error);
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
  uint64_t v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v18[1] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress", -[IOUSBHostIOSource endpointAddress](self, "endpointAddress"));
  v18[2] = option;
  v7 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x18u, v18, 3u, 0, 0);
  if (v7 && error)
  {
    v19[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to abort stream."), &stru_24DEDD560, 0);
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
      -[IOUSBHostStream abortWithOption:error:].cold.1(v15, v16);

  }
  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  NSMutableData *v8;
  NSMutableData *v9;
  NSMutableData *v10;
  uint64_t v11;
  uint64_t v12;
  kern_return_t v13;
  kern_return_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  const char *v23;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v8 = data;
  v9 = v8;
  if (v8)
  {
    v10 = objc_retainAutorelease(v8);
    v11 = -[NSMutableData mutableBytes](v10, "mutableBytes");
    v12 = -[NSMutableData length](v10, "length");
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = -[IOUSBHostStream streamID](self, "streamID");
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0;
  v13 = IOConnectCallScalarMethod(-[IOUSBHostIOSource ioConnection](self, "ioConnection"), 0x19u, input, 4u, &output, &outputCnt);
  v14 = v13;
  if (bytesTransferred)
    *bytesTransferred = output;
  if (v13 && error)
  {
    v28[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Unable to send IO with stream."), &stru_24DEDD560, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v28[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    v28[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v14, v21);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      -[IOUSBHostStream sendIORequestWithData:bytesTransferred:error:].cold.1(v22, v23);

  }
  return v14 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  NSMutableData *v8;
  IOUSBHostCompletionHandler v9;
  NSMutableData *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  mach_port_t v15;
  mach_port_t MachPort;
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  const char *v27;
  NSError **v29;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t input[4];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x24BDAC8D0];
  v8 = data;
  v9 = completionHandler;
  if (v8)
  {
    v10 = objc_retainAutorelease(v8);
    v11 = -[NSMutableData mutableBytes](v10, "mutableBytes");
    v12 = -[NSMutableData length](v10, "length");
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  input[0] = -[IOUSBHostIOSource endpointAddress](self, "endpointAddress");
  input[1] = -[IOUSBHostStream streamID](self, "streamID");
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v13;
  v35 = v13;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v33 = v13;
  reference[1] = (uint64_t)_ioCompletionCallback;
  if (v9)
  {
    v14 = MEMORY[0x220763B3C](v9);

  }
  else
  {
    v14 = 0;
  }
  *(_QWORD *)&v33 = v14;
  v15 = -[IOUSBHostIOSource ioConnection](self, "ioConnection");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostIOSource ioNotificationPortRef](self, "ioNotificationPortRef"));
  v17 = IOConnectCallAsyncScalarMethod(v15, 0x19u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v17)
  {
    v18 = (void *)v33;
    if (error)
    {
      v37[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue IO with stream."), &stru_24DEDD560, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v20;
      v37[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v29 = error;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v22;
      v37[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v17, v25);
      *v29 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v26)
        -[IOUSBHostStream enqueueIORequestWithData:error:completionHandler:].cold.1(v26, v27);

    }
  }

  return v17 == 0;
}

- (IOUSBHostPipe)hostPipe
{
  return (IOUSBHostPipe *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHostPipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSUInteger)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostPipe, 0);
}

- (void)abortWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to abort stream."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)sendIORequestWithData:(uint64_t)a1 bytesTransferred:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to send IO with stream."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueIORequestWithData:(uint64_t)a1 error:(const char *)a2 completionHandler:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue IO with stream."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

@end
