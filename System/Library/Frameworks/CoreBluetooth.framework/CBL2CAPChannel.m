@implementation CBL2CAPChannel

- (CBL2CAPChannel)initWithPeer:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  CBL2CAPChannel *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  CBL2CAPChannel *v17;
  NSObject *v18;
  NSOutputStream *v20;
  CFReadStreamRef readStream;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CBL2CAPChannel;
  v9 = -[CBL2CAPChannel init](&v22, sel_init);
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_PSM = objc_msgSend(v10, "intValue");

  objc_storeStrong((id *)&v9->_peer, a3);
  v9->_socketFD = -1;
  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgIsIncoming"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isIncoming = objc_msgSend(v11, "intValue") != 0;

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBL2CAPChannel initWithPeer:info:].cold.2(&v9->_PSM, v12);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSocket"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v17 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    -[CBL2CAPChannel initWithPeer:info:].cold.1(v18);
    goto LABEL_11;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSocket"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_socketFD = objc_msgSend(v14, "intValue");

  v20 = 0;
  readStream = 0;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9->_socketFD, &readStream, (CFWriteStreamRef *)&v20);
  inputStream = v9->_inputStream;
  v9->_inputStream = (NSInputStream *)readStream;

  outputStream = v9->_outputStream;
  v9->_outputStream = v20;

LABEL_8:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)dealloc
{
  int socketFD;
  void *v4;
  void *v5;
  objc_super v6;

  socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    close(socketFD);
    self->_socketFD = -1;
  }
  -[CBPeer manager](self->_peer, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeer identifier](self->_peer, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeL2CAPChannelForPeerUUID:withPsm:", v5, -[CBL2CAPChannel PSM](self, "PSM"));

  v6.receiver = self;
  v6.super_class = (Class)CBL2CAPChannel;
  -[CBL2CAPChannel dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p peer = %@, psm = %d>"), objc_opt_class(), self, self->_peer, self->_PSM);
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (CBL2CAPPSM)PSM
{
  return self->_PSM;
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUUID, a3);
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)initWithPeer:(os_log_t)log info:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A82A2000, log, OS_LOG_TYPE_ERROR, "Skywalk unsupported with le l2cap channels", v1, 2u);
}

- (void)initWithPeer:(unsigned __int16 *)a1 info:(NSObject *)a2 .cold.2(unsigned __int16 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_DEBUG, "Init CBL2CAPChannel with psm : %u", (uint8_t *)v3, 8u);
}

@end
