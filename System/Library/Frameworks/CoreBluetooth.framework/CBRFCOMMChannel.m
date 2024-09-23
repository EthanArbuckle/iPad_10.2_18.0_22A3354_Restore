@implementation CBRFCOMMChannel

- (CBRFCOMMChannel)initWithPeer:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  CBRFCOMMChannel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CBUUID *serviceUUID;
  NSObject *v16;
  void *v17;
  void *v18;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  CBRFCOMMChannel *v21;
  NSObject *v22;
  NSOutputStream *v24;
  CFReadStreamRef readStream;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CBRFCOMMChannel;
  v9 = -[CBRFCOMMChannel init](&v26, sel_init);
  if (!v9)
    goto LABEL_10;
  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgRFCOMMChannelID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_channelID = objc_msgSend(v10, "intValue");

  objc_storeStrong((id *)&v9->_peer, a3);
  v9->_socketFD = -1;
  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgMTU"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_mtu = objc_msgSend(v11, "intValue");

  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgIsIncoming"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isIncoming = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v8, "objectForKey:", CFSTR("kCBMsgArgServiceUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    serviceUUID = v9->_serviceUUID;
    v9->_serviceUUID = (CBUUID *)v14;

  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v16 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBRFCOMMChannel initWithPeer:info:].cold.2(&v9->_channelID, (uint64_t)v9, v16);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSocket"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        v21 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
    }
    -[CBRFCOMMChannel initWithPeer:info:].cold.1(v22);
    goto LABEL_13;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSocket"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_socketFD = objc_msgSend(v18, "intValue");

  v24 = 0;
  readStream = 0;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9->_socketFD, &readStream, (CFWriteStreamRef *)&v24);
  inputStream = v9->_inputStream;
  v9->_inputStream = (NSInputStream *)readStream;

  outputStream = v9->_outputStream;
  v9->_outputStream = v24;

LABEL_10:
  v21 = v9;
LABEL_14:

  return v21;
}

- (void)dealloc
{
  int socketFD;
  objc_super v4;

  socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    close(socketFD);
    self->_socketFD = -1;
  }
  if (self->_channelID)
    -[CBClassicPeer closeRFCOMMChannel:](self->_peer, "closeRFCOMMChannel:");
  v4.receiver = self;
  v4.super_class = (Class)CBRFCOMMChannel;
  -[CBRFCOMMChannel dealloc](&v4, sel_dealloc);
}

- (void)configureChannelPortParams:(unsigned int)a3 dataBits:(unsigned __int8)a4 parity:(unsigned __int8)a5 stopBits:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v11 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CBRFCOMMChannel configureChannelPortParams:dataBits:parity:stopBits:]";
    _os_log_impl(&dword_1A82A2000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  self->_baudRate = v9;
  self->_dataBits = v8;
  self->_parity = v7;
  self->_stopBits = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9, CFSTR("kCBMsgArgRFCOMMBaudRate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = CFSTR("kCBMsgArgRFCOMMDataBit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("kCBMsgArgRFCOMMParityBit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  v18[3] = CFSTR("kCBMsgArgRFCOMMStopBit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  v18[4] = CFSTR("kCBMsgArgRFCOMMChannelID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_channelID);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBClassicPeer configureRFCOMMPortParams:](self->_peer, "configureRFCOMMPortParams:", v17);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_isIncoming)
    v5 = CFSTR("incoming");
  else
    v5 = CFSTR("outgoing");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@, CID: %u, MTU: %d, %@>"), v4, self, self->_peer, self->_channelID, self->_mtu, v5);
}

- (int)socketFD
{
  return self->_socketFD;
}

- (CBClassicPeer)peer
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

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (unsigned)channelID
{
  return self->_channelID;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (unsigned)baudRate
{
  return self->_baudRate;
}

- (void)setBaudRate:(unsigned int)a3
{
  self->_baudRate = a3;
}

- (unsigned)dataBits
{
  return self->_dataBits;
}

- (void)setDataBits:(unsigned __int8)a3
{
  self->_dataBits = a3;
}

- (unsigned)parity
{
  return self->_parity;
}

- (void)setParity:(unsigned __int8)a3
{
  self->_parity = a3;
}

- (unsigned)stopBits
{
  return self->_stopBits;
}

- (void)setStopBits:(unsigned __int8)a3
{
  self->_stopBits = a3;
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
  _os_log_error_impl(&dword_1A82A2000, log, OS_LOG_TYPE_ERROR, "Skywalk unsupported with rfcomm channels", v1, 2u);
}

- (void)initWithPeer:(os_log_t)log info:.cold.2(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 136315650;
  v6 = "-[CBRFCOMMChannel initWithPeer:info:]";
  v7 = 1024;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "%s CID: %u %@", (uint8_t *)&v5, 0x1Cu);
}

@end
