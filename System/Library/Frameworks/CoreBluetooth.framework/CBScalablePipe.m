@implementation CBScalablePipe

- (CBScalablePipe)initWithPipeManager:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  CBScalablePipe *v9;
  CBScalablePipe *v10;
  CBPeer *v11;
  CBPeer *peer;
  uint64_t v13;
  NSString *name;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSInputStream *input;
  NSOutputStream *output;
  NSObject *v27;
  int socket;
  const char *v29;
  const char *v30;
  NSObject *v32;
  void *channel;
  const char *v34;
  CFWriteStreamRef writeStream;
  objc_super v36;
  CFReadStreamRef readStream[2];
  uint8_t buf[4];
  CBScalablePipe *v39;
  __int16 v40;
  _BYTE v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CBScalablePipe;
  v9 = -[CBScalablePipe init](&v36, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pipeManager, a3);
    v11 = -[CBPeer initWithInfo:manager:]([CBPeer alloc], "initWithInfo:manager:", v8, v7);
    peer = v10->_peer;
    v10->_peer = v11;

    objc_storeStrong((id *)&v10->_central, v10->_peer);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v13;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_type = objc_msgSend(v15, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgPriority"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_priority = objc_msgSend(v16, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgReliable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_reliablePipe = objc_msgSend(v17, "integerValue") != 0;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgPeerType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerType = objc_msgSend(v18, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgPeerCLVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerCLVersion = objc_msgSend(v19, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgPeerCLFeatures"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerCLFeatures = objc_msgSend(v20, "unsignedIntValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArglocalCLVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_localCLVersion = objc_msgSend(v21, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArglocalCLFeatures"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_localCLFeatures = objc_msgSend(v22, "unsignedIntValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgSocket"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBLePipeMsgArgSocket"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_socket = objc_msgSend(v24, "intValue");

      readStream[0] = 0;
      writeStream = 0;
      CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10->_socket, readStream, &writeStream);
      input = v10->_input;
      v10->_input = (NSInputStream *)readStream[0];

      output = v10->_output;
      v10->_output = (NSOutputStream *)writeStream;

      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v27 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        socket = v10->_socket;
        v29 = "yes";
        if (v10->_input)
          v30 = "yes";
        else
          v30 = "no";
        if (!v10->_output)
          v29 = "no";
        *(_DWORD *)buf = 138413058;
        v39 = v10;
        v40 = 1024;
        *(_DWORD *)v41 = socket;
        *(_WORD *)&v41[4] = 2080;
        *(_QWORD *)&v41[6] = v30;
        *(_WORD *)&v41[14] = 2080;
        *(_QWORD *)&v41[16] = v29;
        _os_log_impl(&dword_1A82A2000, v27, OS_LOG_TYPE_DEFAULT, "%@ created socket pipe: fd %d, in %s, out %s", buf, 0x26u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        readStream[0] = 0;
        readStream[1] = 0;
        objc_msgSend(v23, "getUUIDBytes:", readStream);
        if (uuid_is_null((const unsigned __int8 *)readStream))
        {
          if (CBLogInitOnce != -1)
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
            -[CBScalablePipe initWithPipeManager:info:].cold.1();
        }
        else
        {
          os_channel_attr_create();
          os_channel_attr_set();
          v10->_channel = (void *)os_channel_create_extended();
          os_channel_attr_destroy();
          if (CBLogInitOnce != -1)
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          v32 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          {
            channel = v10->_channel;
            *(_DWORD *)buf = 138412802;
            if (channel)
              v34 = "yes";
            else
              v34 = "no";
            v39 = v10;
            v40 = 2112;
            *(_QWORD *)v41 = v23;
            *(_WORD *)&v41[8] = 2080;
            *(_QWORD *)&v41[10] = v34;
            _os_log_impl(&dword_1A82A2000, v32, OS_LOG_TYPE_DEFAULT, "%@ created skywalk pipe: UUID %@, channel %s", buf, 0x20u);
          }
        }
      }
      else
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
          -[CBScalablePipe initWithPipeManager:info:].cold.2();
      }
    }

  }
  return v10;
}

- (void)setOrphan
{
  CBScalablePipeManager *pipeManager;

  pipeManager = self->_pipeManager;
  self->_pipeManager = 0;

}

- (void)dealloc
{
  int socket;
  objc_super v4;

  socket = self->_socket;
  if (socket)
    close(socket);
  if (self->_channel)
    os_channel_destroy();
  v4.receiver = self;
  v4.super_class = (Class)CBScalablePipe;
  -[CBScalablePipe dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  int64_t type;
  int64_t priority;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = "low";
  v6 = "medium";
  type = self->_type;
  priority = self->_priority;
  v9 = "isochronous";
  if (priority == 2)
    v9 = "high";
  if (priority != 1)
    v6 = v9;
  if (priority)
    v5 = v6;
  v10 = "server";
  if (type != 1)
    v10 = "peer-to-peer";
  if (!type)
    v10 = "client";
  if (self->_reliablePipe)
    v11 = "ON";
  else
    v11 = "OFF";
  v12 = "yes";
  if (!self->_channel)
    v12 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: peer = %@, name = \"%@\", type = %s, priority = %s reliability is %s, socket %d, channel %s>"), v4, self->_peer, self->_name, v10, v5, v11, self->_socket, v12);
}

- (CBCentral)central
{
  return self->_central;
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)reliablePipe
{
  return self->_reliablePipe;
}

- (int64_t)peerType
{
  return self->_peerType;
}

- (NSInputStream)input
{
  return self->_input;
}

- (NSOutputStream)output
{
  return self->_output;
}

- (void)channel
{
  return self->_channel;
}

- (unsigned)localCLVersion
{
  return self->_localCLVersion;
}

- (unsigned)peerCLVersion
{
  return self->_peerCLVersion;
}

- (unsigned)localCLFeatures
{
  return self->_localCLFeatures;
}

- (unsigned)peerCLFeatures
{
  return self->_peerCLFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
}

- (void)initWithPipeManager:info:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A82A2000, v0, v1, "%@ not creating skywalk channel: UUID %@");
}

- (void)initWithPipeManager:info:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A82A2000, v0, v1, "%@ init with no socket/UUID: %@");
}

@end
