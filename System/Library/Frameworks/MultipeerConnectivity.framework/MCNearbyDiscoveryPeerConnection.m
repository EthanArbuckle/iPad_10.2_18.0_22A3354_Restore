@implementation MCNearbyDiscoveryPeerConnection

- (MCNearbyDiscoveryPeerConnection)initWithLocalServiceName:(id)a3
{
  MCNearbyDiscoveryPeerConnection *v4;
  NSMutableData *v5;
  NSMutableData *v6;
  NSMutableData *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MCNearbyDiscoveryPeerConnection;
  v4 = -[MCNearbyDiscoveryPeerConnection init](&v13, sel_init);
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v4->_dataReceived = v5;
    if (!v5)
      goto LABEL_10;
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v4->_dataToSend = v6;
    if (!v6)
      goto LABEL_10;
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v4->_dataToSendHoldingQueue = v7;
    if (!v7)
      goto LABEL_10;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->_receivedDataHoldingQueue = v8;
    if (!v8)
      goto LABEL_10;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->_receivedDataContentHoldingQueue = v9;
    if (v9
      && (v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]), (v4->_messageReceiptHandlerList = v10) != 0)
      && (v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]),
          (v4->_messageReceiptHandlerHoldingQueue = v11) != 0))
    {
      -[MCNearbyDiscoveryPeerConnection setLocalServiceName:](v4, "setLocalServiceName:", a3);
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v4;
}

- (void)setSyncQueue:(id)a3
{
  NSObject *syncQueue;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);
  self->_syncQueue = (OS_dispatch_queue *)a3;
}

- (void)setTargetQueue:(id)a3
{
  NSObject *targetQueue;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_release(targetQueue);
  self->_targetQueue = (OS_dispatch_queue *)a3;
}

- (void)syncAppendDataToSend:(id)a3
{
  -[NSMutableData appendData:](self->_dataToSend, "appendData:", a3);
  if (self->_readyToWrite)
    -[MCNearbyDiscoveryPeerConnection syncSendData](self, "syncSendData");
}

- (void)setupInputStream:(id)a3 outputStream:(id)a4
{
  OS_dispatch_queue *v7;
  OS_dispatch_queue *syncQueue;
  OS_dispatch_queue *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "setDelegate:", self);
  objc_msgSend(a4, "setDelegate:", self);
  v7 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
  if (self->_syncQueue)
    syncQueue = self->_syncQueue;
  else
    syncQueue = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
  MEMORY[0x212BB131C](a3, syncQueue);
  if (self->_syncQueue)
    v9 = self->_syncQueue;
  else
    v9 = v7;
  MEMORY[0x212BB13D0](a4, v9);
  v10 = *MEMORY[0x24BDB7758];
  v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(a3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB7758]);
  objc_msgSend(a4, "setProperty:forKey:", v11, v10);
  self->_shouldSendHello = 1;
  v12 = mcdpc_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a3;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Opening input [%p]/output [%p] streams.", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(a3, "open");
  objc_msgSend(a4, "open");
}

- (void)connectToNetService:(id)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  if (!syncQueue)
    syncQueue = MEMORY[0x24BDAC9B8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__MCNearbyDiscoveryPeerConnection_connectToNetService___block_invoke;
  v4[3] = &unk_24C840658;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(syncQueue, v4);
}

void __55__MCNearbyDiscoveryPeerConnection_connectToNetService___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _BYTE buf[12];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = mcdpc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(v4 + 8);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Requesting connection with netService with name [%@] ptr [%p] remote [%@].", buf, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v6 + 40) || *(_QWORD *)(v6 + 48))
  {
    v7 = mcdpc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Already connected!", buf, 2u);
    }
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 25) = 0;
    v8 = 0;
    *(_QWORD *)buf = 0;
    objc_msgSend(*(id *)(a1 + 32), "getInputStream:outputStream:", buf, &v8);
    objc_msgSend(*(id *)(a1 + 40), "setupInputStream:outputStream:", *(_QWORD *)buf, v8);
    objc_msgSend(*(id *)(a1 + 40), "setInputStream:", *(_QWORD *)buf);
    objc_msgSend(*(id *)(a1 + 40), "setOutputStream:", v8);

  }
}

- (void)attachInputStream:(id)a3 outputStream:(id)a4
{
  NSObject *syncQueue;
  _QWORD block[7];

  syncQueue = MEMORY[0x24BDAC9B8];
  if (self->_syncQueue)
    syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MCNearbyDiscoveryPeerConnection_attachInputStream_outputStream___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

void __66__MCNearbyDiscoveryPeerConnection_attachInputStream_outputStream___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = mcdpc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = v3;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Responding connection sequence - remoteServiceName [%@] inputStream [%p] outputStream =[%p]).", (uint8_t *)&v8, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 40) || *(_QWORD *)(v6 + 48))
  {
    v7 = mcdpc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Already connected!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setupInputStream:outputStream:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setInputStream:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setOutputStream:", *(_QWORD *)(a1 + 48));
  }
}

- (BOOL)shouldDecideAboutConnection
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned __int8 v12[8];
  unint64_t v13;
  unsigned __int8 md[8];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName")
    && -[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"))
  {
    if (-[NSString isEqualToString:](-[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"), "isEqualToString:", -[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName")))
    {
      v3 = mcdpc_log();
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        -[MCNearbyDiscoveryPeerConnection shouldDecideAboutConnection].cold.2();
LABEL_8:
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), -[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName"));
      v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), -[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"));
      do
      {
        objc_msgSend(v6, "appendFormat:", CFSTR("+%@"), -[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName"));
        objc_msgSend(v7, "appendFormat:", CFSTR("+%@"), -[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName"));
        CC_MD5((const void *)objc_msgSend(v6, "UTF8String"), objc_msgSend(v6, "length"), md);
        CC_MD5((const void *)objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "length"), v12);
        v8 = bswap64(*(unint64_t *)md);
        v9 = bswap64(*(unint64_t *)v12);
        if (v8 != v9)
          break;
        v8 = bswap64(v15);
        v9 = bswap64(v13);
      }
      while (v8 == v9);
      if (v8 < v9)
        v10 = -1;
      else
        v10 = 1;
      return v10 >> 31;
    }
  }
  else
  {
    v5 = mcdpc_log();
    v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[MCNearbyDiscoveryPeerConnection shouldDecideAboutConnection].cold.1();
      goto LABEL_8;
    }
  }
  return v4;
}

- (void)syncSendData
{
  uint64_t v3;
  BOOL v4;

  if (self->_shouldSendHello)
  {
    -[MCNearbyDiscoveryPeerConnection syncSendHello](self, "syncSendHello");
    self->_shouldSendHello = 0;
  }
  if (-[NSMutableData length](self->_dataToSend, "length"))
  {
    v3 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", -[NSMutableData bytes](self->_dataToSend, "bytes"), -[NSMutableData length](self->_dataToSend, "length"));
    if (v3 < 1)
      return;
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSend, "replaceBytesInRange:withBytes:length:", 0, v3, 0, 0);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  self->_readyToWrite = v4;
}

- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5
{
  void *v9;
  id v10;
  int v11;
  unsigned int currentSequenceNumber;
  unsigned int v13;
  NSObject *v14;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSString *remoteServiceName;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSInputStream *v25;
  NSOutputStream *v26;
  NSString *v27;
  int v28;
  NSInputStream *v29;
  NSOutputStream *v30;
  NSString *v31;
  _QWORD v32[6];
  unsigned int v33;
  int v34;
  unsigned int v35;
  uint8_t v36[4];
  __int128 v37;
  _BYTE v38[10];
  _BYTE v39[10];
  _BYTE v40[10];
  _QWORD v41[2];
  Bytef buf[2];
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;
  unsigned int v48;
  char v49;
  char v50;
  char v51;
  char v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x212BB19AC](self, a2);
  if (a3 == 2000 || a3 == 2100 || a3 == 2200)
  {
    v10 = (id)objc_msgSend(a5, "copy");
    v11 = objc_msgSend(a4, "length");
    currentSequenceNumber = self->_currentSequenceNumber;
    self->_currentSequenceNumber = (currentSequenceNumber + 1) & 0x7FFFFFFF;
    buf[0] = BYTE1(a3);
    buf[1] = a3;
    v43 = 0;
    v44 = HIBYTE(v11);
    v45 = BYTE2(v11);
    v46 = BYTE1(v11);
    v47 = v11;
    v48 = 0;
    v49 = HIBYTE(currentSequenceNumber);
    v50 = BYTE2(currentSequenceNumber);
    v51 = BYTE1(currentSequenceNumber);
    v52 = currentSequenceNumber;
    v13 = crc32(0, buf, 0x10u);
    if (objc_msgSend(a4, "length"))
      v13 = crc32(v13, (const Bytef *)objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
    v48 = bswap32(v13);
    v14 = mcdpc_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      inputStream = self->_inputStream;
      outputStream = self->_outputStream;
      remoteServiceName = self->_remoteServiceName;
      *(_DWORD *)v36 = 67110658;
      LODWORD(v37) = currentSequenceNumber;
      WORD2(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 6) = v11 + 16;
      WORD5(v37) = 1024;
      HIDWORD(v37) = v13;
      *(_WORD *)v38 = 2048;
      *(_QWORD *)&v38[2] = self;
      *(_WORD *)v39 = 2048;
      *(_QWORD *)&v39[2] = inputStream;
      *(_WORD *)v40 = 2048;
      *(_QWORD *)&v40[2] = outputStream;
      LOWORD(v41[0]) = 2112;
      *(_QWORD *)((char *)v41 + 2) = remoteServiceName;
      _os_log_impl(&dword_20DC1A000, v14, OS_LOG_TYPE_DEFAULT, "Made message #%u with length [len=%u] and crc [=%08X] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x3Cu);
    }
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __78__MCNearbyDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke;
    v32[3] = &unk_24C840B90;
    v33 = currentSequenceNumber;
    v34 = v11;
    v35 = v13;
    v32[4] = self;
    v32[5] = v10;
    v18 = (id)objc_msgSend(v32, "copy");
    if (a3 == 2100 && !self->_connected)
    {
      v23 = mcdpc_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(a4, "length");
        v25 = self->_inputStream;
        v26 = self->_outputStream;
        v27 = self->_remoteServiceName;
        *(_DWORD *)v36 = 67110146;
        LODWORD(v37) = v24;
        WORD2(v37) = 2048;
        *(_QWORD *)((char *)&v37 + 6) = self;
        HIWORD(v37) = 2048;
        *(_QWORD *)v38 = v25;
        *(_WORD *)&v38[8] = 2048;
        *(_QWORD *)v39 = v26;
        *(_WORD *)&v39[8] = 2112;
        *(_QWORD *)v40 = v27;
        _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Still connecting - queueing data (%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x30u);
      }
      -[NSMutableArray addObject:](self->_messageReceiptHandlerHoldingQueue, "addObject:", v18);
      -[NSMutableData appendBytes:length:](self->_dataToSendHoldingQueue, "appendBytes:length:", buf, 16);
      -[NSMutableData appendData:](self->_dataToSendHoldingQueue, "appendData:", a4);
    }
    else
    {
      -[NSMutableArray addObject:](self->_messageReceiptHandlerList, "addObject:", v18);
      v19 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", buf, 16);
      objc_msgSend(v19, "appendData:", a4);
      v20 = mcdpc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 == 2000)
        {
          v21 = "Hello";
        }
        else if (a3 == 2200)
        {
          v21 = "Accept";
        }
        else
        {
          v21 = "Data";
        }
        v28 = objc_msgSend(a4, "length");
        v29 = self->_inputStream;
        v30 = self->_outputStream;
        v31 = self->_remoteServiceName;
        *(_DWORD *)v36 = 136316418;
        *(_QWORD *)&v37 = v21;
        WORD4(v37) = 1024;
        *(_DWORD *)((char *)&v37 + 10) = v28;
        HIWORD(v37) = 2048;
        *(_QWORD *)v38 = self;
        *(_WORD *)&v38[8] = 2048;
        *(_QWORD *)v39 = v29;
        *(_WORD *)&v39[8] = 2048;
        *(_QWORD *)v40 = v30;
        *(_WORD *)&v40[8] = 2112;
        v41[0] = v31;
        _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "Sending type [%s] data [%u] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x3Au);
      }
      -[MCNearbyDiscoveryPeerConnection syncAppendDataToSend:](self, "syncAppendDataToSend:", v19);
    }
  }
  else
  {
    v22 = mcdpc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MCNearbyDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:].cold.1(a3, self, v22);
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCNearbyDiscoveryPeerConnection"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unable to send unknown message type"), *MEMORY[0x24BDD0FC8])));
  }
  objc_autoreleasePoolPop(v9);
}

BOOL __78__MCNearbyDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _QWORD *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 48);
  v5 = mcdpc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(a1 + 48);
    v7 = *(_DWORD *)(a1 + 52) + 16;
    v8 = *(_DWORD *)(a1 + 56);
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[5];
    v11 = v9[6];
    v12 = v9[1];
    v16[0] = 67110914;
    v16[1] = a2;
    v17 = 1024;
    v18 = v6;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 2048;
    v26 = v10;
    v27 = 2048;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Got receipt #%u for message #%u with length [len=%u] and crc [=%08X] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v16, 0x42u);
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    if (v4 == a2)
      v14 = 0;
    else
      v14 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCNearbyDiscoveryPeerConnection"), -2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Receipt does not match"), *MEMORY[0x24BDD0FC8]));
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);
  }
  return v4 == a2;
}

- (void)syncSendHello
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "Bad serviceName [%d]? - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)syncSendAccept
{
  -[MCNearbyDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:](self, "syncSendMessage:data:withCompletionHandler:", 2200, 0, 0);
}

- (void)syncAcceptedConnection
{
  id receiveDataHandler;
  NSMutableArray *receivedDataHoldingQueue;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *targetQueue;
  NSObject *v13;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSString *remoteServiceName;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  MCNearbyDiscoveryPeerConnection *v23;
  __int16 v24;
  NSInputStream *v25;
  __int16 v26;
  NSOutputStream *v27;
  __int16 v28;
  NSString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[MCNearbyDiscoveryPeerConnection syncAppendDataToSend:](self, "syncAppendDataToSend:", self->_dataToSendHoldingQueue);
  -[NSMutableArray addObjectsFromArray:](self->_messageReceiptHandlerList, "addObjectsFromArray:", self->_messageReceiptHandlerHoldingQueue);
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerHoldingQueue, "removeAllObjects");
  if (-[NSMutableArray count](self->_receivedDataHoldingQueue, "count"))
  {
    receiveDataHandler = self->_receiveDataHandler;
    if (receiveDataHandler)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      receivedDataHoldingQueue = self->_receivedDataHoldingQueue;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](receivedDataHoldingQueue, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v19;
        v8 = MEMORY[0x24BDAC9B8];
        v9 = MEMORY[0x24BDAC760];
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v19 != v7)
              objc_enumerationMutation(receivedDataHoldingQueue);
            v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (self->_targetQueue)
              targetQueue = self->_targetQueue;
            else
              targetQueue = v8;
            v17[0] = v9;
            v17[1] = 3221225472;
            v17[2] = __57__MCNearbyDiscoveryPeerConnection_syncAcceptedConnection__block_invoke;
            v17[3] = &unk_24C840BB8;
            v17[4] = v11;
            v17[5] = receiveDataHandler;
            dispatch_async(targetQueue, v17);
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](receivedDataHoldingQueue, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        }
        while (v6);
      }
    }
    else
    {
      v13 = mcdpc_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        outputStream = self->_outputStream;
        remoteServiceName = self->_remoteServiceName;
        *(_DWORD *)buf = 134218754;
        v23 = self;
        v24 = 2048;
        v25 = inputStream;
        v26 = 2048;
        v27 = outputStream;
        v28 = 2112;
        v29 = remoteServiceName;
        _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "ReceiveDataHandler is nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
      }
    }
  }
  -[NSMutableArray removeAllObjects](self->_receivedDataContentHoldingQueue, "removeAllObjects");
  self->_connected = 1;
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncAcceptedConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4
{
  Bytef buf[2];
  __int16 v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  buf[0] = BYTE1(a3);
  buf[1] = a3;
  v6 = 256;
  v7 = 0;
  v8 = HIBYTE(a4);
  v9 = BYTE2(a4);
  v10 = BYTE1(a4);
  v11 = a4;
  HIDWORD(v7) = bswap32(crc32(0, buf, 0x10u));
  -[MCNearbyDiscoveryPeerConnection syncAppendDataToSend:](self, "syncAppendDataToSend:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 16));
}

- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSInputStream *v12;
  NSOutputStream *v13;
  NSString *v14;
  uint64_t v15;
  id v16;
  id connectedHandler;
  NSObject *v18;
  _QWORD *v19;
  NSObject *v20;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSString *remoteServiceName;
  NSMutableArray *receivedDataContentHoldingQueue;
  id receiveDataHandler;
  NSObject *targetQueue;
  NSObject *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  int v32;
  NSInputStream *v33;
  NSOutputStream *v34;
  NSString *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  unint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  NSInputStream *v55;
  NSOutputStream *v56;
  NSString *v57;
  NSObject *v58;
  NSInputStream *v59;
  NSOutputStream *v60;
  NSString *v61;
  const char *v62;
  NSObject *v63;
  uint32_t v64;
  NSObject *v65;
  NSInputStream *v66;
  NSOutputStream *v67;
  NSString *v68;
  const char *v69;
  int v70;
  NSInputStream *v71;
  NSOutputStream *v72;
  NSString *v73;
  NSObject *v74;
  _BOOL4 v75;
  NSObject *v76;
  NSInputStream *v77;
  NSOutputStream *v78;
  NSString *v79;
  uint64_t v80;
  id v81;
  _QWORD v82[7];
  _QWORD v83[5];
  _QWORD block[6];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[6];
  _QWORD v90[7];
  _QWORD v91[5];
  uint8_t v92[128];
  uint8_t buf[4];
  _BYTE v94[10];
  _BYTE v95[50];
  __int16 v96;
  NSOutputStream *v97;
  __int16 v98;
  NSString *v99;
  uint64_t v100;

  v5 = *(_QWORD *)&a5;
  v100 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x212BB19AC](self, a2);
  if (a3 != 2200)
  {
    if (a3 == 2100)
    {
      v20 = mcdpc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        outputStream = self->_outputStream;
        remoteServiceName = self->_remoteServiceName;
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)v94 = self;
        *(_WORD *)&v94[8] = 2048;
        *(_QWORD *)v95 = inputStream;
        *(_WORD *)&v95[8] = 2048;
        *(_QWORD *)&v95[10] = outputStream;
        *(_WORD *)&v95[18] = 2112;
        *(_QWORD *)&v95[20] = remoteServiceName;
        _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "Got Data - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
      }
      -[MCNearbyDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2100, v5);
      receivedDataContentHoldingQueue = self->_receivedDataContentHoldingQueue;
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_23;
      v89[3] = &unk_24C840C30;
      v89[4] = receivedDataContentHoldingQueue;
      v89[5] = a4;
      if (!self->_connected)
      {
        v39 = objc_msgSend(a4, "length");
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v40 = self->_receivedDataContentHoldingQueue;
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v86 != v43)
                objc_enumerationMutation(v40);
              v39 += objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "length");
            }
            v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
          }
          while (v42);
        }
        if (v39 >> 24 > 4)
        {
          v65 = mcdpc_log();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = self->_inputStream;
            v67 = self->_outputStream;
            v68 = self->_remoteServiceName;
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)v94 = self;
            *(_WORD *)&v94[8] = 2048;
            *(_QWORD *)v95 = v66;
            *(_WORD *)&v95[8] = 2048;
            *(_QWORD *)&v95[10] = v67;
            *(_WORD *)&v95[18] = 2112;
            *(_QWORD *)&v95[20] = v68;
            _os_log_impl(&dword_20DC1A000, v65, OS_LOG_TYPE_DEFAULT, "Too many enqueued messages before connect. Closing connection.ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
          }
          goto LABEL_62;
        }
        -[NSMutableArray addObject:](self->_receivedDataHoldingQueue, "addObject:", (id)objc_msgSend(v89, "copy"));
        -[NSMutableArray addObject:](self->_receivedDataContentHoldingQueue, "addObject:", a4);
        goto LABEL_63;
      }
      receiveDataHandler = self->_receiveDataHandler;
      if (receiveDataHandler)
      {
        if (self->_targetQueue)
          targetQueue = self->_targetQueue;
        else
          targetQueue = MEMORY[0x24BDAC9B8];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_25;
        block[3] = &unk_24C840BB8;
        block[4] = v89;
        block[5] = receiveDataHandler;
        dispatch_async(targetQueue, block);
        goto LABEL_63;
      }
      v58 = mcdpc_log();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        goto LABEL_63;
      v59 = self->_inputStream;
      v60 = self->_outputStream;
      v61 = self->_remoteServiceName;
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)v94 = self;
      *(_WORD *)&v94[8] = 2048;
      *(_QWORD *)v95 = v59;
      *(_WORD *)&v95[8] = 2048;
      *(_QWORD *)&v95[10] = v60;
      *(_WORD *)&v95[18] = 2112;
      *(_QWORD *)&v95[20] = v61;
      v62 = "ReceiveDataHandler is nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
      v63 = v58;
      v64 = 42;
    }
    else
    {
      if (a3 == 2000)
      {
        if ((unint64_t)objc_msgSend(a4, "length") <= 5)
        {
          v10 = mcdpc_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:].cold.1(a4, self, v10);
          goto LABEL_62;
        }
        v28 = objc_msgSend(a4, "bytes");
        v29 = *(_DWORD *)v28;
        v30 = __rev16(*(unsigned __int16 *)(v28 + 4));
        if (objc_msgSend(a4, "length") < (unint64_t)(v30 + 6))
        {
          v31 = mcdpc_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = objc_msgSend(a4, "length");
            v33 = self->_inputStream;
            v34 = self->_outputStream;
            v35 = self->_remoteServiceName;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v94 = v30;
            *(_WORD *)&v94[4] = 1024;
            *(_DWORD *)&v94[6] = v32;
            *(_WORD *)v95 = 2048;
            *(_QWORD *)&v95[2] = self;
            *(_WORD *)&v95[10] = 2048;
            *(_QWORD *)&v95[12] = v33;
            *(_WORD *)&v95[20] = 2048;
            *(_QWORD *)&v95[22] = v34;
            *(_WORD *)&v95[30] = 2112;
            *(_QWORD *)&v95[32] = v35;
            v36 = "Hello body not enough for service name: %u+6 > %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
            v37 = v31;
            v38 = 54;
LABEL_28:
            _os_log_error_impl(&dword_20DC1A000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
            goto LABEL_62;
          }
          goto LABEL_62;
        }
        if (!v30)
        {
          v74 = mcdpc_log();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:].cold.2();
          goto LABEL_62;
        }
        v45 = v28 + 6;
        if (*(_BYTE *)(objc_msgSend(a4, "length") + v28 + 6 - 7))
        {
          v46 = objc_msgSend(a4, "length") - 12;
          v47 = mcdpc_log();
          v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
          if (v46 > 0xFFFFFFFFFFFFFFFALL || v30 < 4)
          {
            if (v48)
              -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:].cold.3();
            goto LABEL_62;
          }
          if (v48)
          {
            v49 = *(char *)(v28 + 6);
            v50 = *(char *)(v28 + 7);
            v51 = *(char *)(v28 + 8);
            v52 = *(char *)(v45 + v30 - 3);
            v53 = *(char *)(v45 + v30 - 2);
            v54 = *(char *)(v45 + v30 - 1);
            v55 = self->_inputStream;
            v56 = self->_outputStream;
            v57 = self->_remoteServiceName;
            *(_DWORD *)buf = 67111682;
            *(_DWORD *)v94 = v49;
            *(_WORD *)&v94[4] = 1024;
            *(_DWORD *)&v94[6] = v50;
            *(_WORD *)v95 = 1024;
            *(_DWORD *)&v95[2] = v51;
            *(_WORD *)&v95[6] = 1024;
            *(_DWORD *)&v95[8] = v52;
            *(_WORD *)&v95[12] = 1024;
            *(_DWORD *)&v95[14] = v53;
            *(_WORD *)&v95[18] = 1024;
            *(_DWORD *)&v95[20] = v54;
            *(_WORD *)&v95[24] = 1024;
            *(_DWORD *)&v95[26] = v30;
            *(_WORD *)&v95[30] = 2048;
            *(_QWORD *)&v95[32] = self;
            *(_WORD *)&v95[40] = 2048;
            *(_QWORD *)&v95[42] = v55;
            v96 = 2048;
            v97 = v56;
            v98 = 2112;
            v99 = v57;
            v36 = "Remote name [%c%c%c..%c%c%c] not properly terminated at length=%u - ptr [%p] inputStream [%p] outputSt"
                  "ream [%p] remote [%@].";
            v37 = v47;
            v38 = 84;
            goto LABEL_28;
          }
LABEL_62:
          -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
          goto LABEL_63;
        }
        -[MCNearbyDiscoveryPeerConnection setRemoteServiceName:](self, "setRemoteServiceName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28 + 6));
        v75 = -[MCNearbyDiscoveryPeerConnection shouldDecideAboutConnection](self, "shouldDecideAboutConnection");
        v76 = mcdpc_log();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          v77 = self->_inputStream;
          v78 = self->_outputStream;
          v79 = self->_remoteServiceName;
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v94 = bswap32(v29);
          *(_WORD *)&v94[4] = 1024;
          *(_DWORD *)&v94[6] = v75;
          *(_WORD *)v95 = 2048;
          *(_QWORD *)&v95[2] = self;
          *(_WORD *)&v95[10] = 2048;
          *(_QWORD *)&v95[12] = v77;
          *(_WORD *)&v95[20] = 2048;
          *(_QWORD *)&v95[22] = v78;
          *(_WORD *)&v95[30] = 2112;
          *(_QWORD *)&v95[32] = v79;
          _os_log_impl(&dword_20DC1A000, v76, OS_LOG_TYPE_DEFAULT, "Got Hello (flags = %08x) shouldDecide (%d) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x36u);
        }
        -[MCNearbyDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2000, v5);
        if (v75)
        {
          v80 = MEMORY[0x24BDAC760];
          v91[0] = MEMORY[0x24BDAC760];
          v91[1] = 3221225472;
          v91[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke;
          v91[3] = &unk_24C840BE0;
          v91[4] = self;
          v81 = (id)objc_msgSend(v91, "copy");
          connectedHandler = self->_connectedHandler;
          if (connectedHandler)
          {
            self->_connectedHandler = 0;
            v18 = self->_targetQueue;
            if (!v18)
              v18 = MEMORY[0x24BDAC9B8];
            v90[0] = v80;
            v90[1] = 3221225472;
            v90[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3;
            v90[3] = &unk_24C840C08;
            v90[4] = self;
            v90[5] = connectedHandler;
            v90[6] = v81;
            v19 = v90;
LABEL_13:
            dispatch_async(v18, v19);

            goto LABEL_63;
          }
        }
        goto LABEL_63;
      }
      v27 = mcdpc_log();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_63;
      if (a3)
        v69 = "?";
      else
        v69 = "Invalid";
      v70 = objc_msgSend(a4, "length");
      v71 = self->_inputStream;
      v72 = self->_outputStream;
      v73 = self->_remoteServiceName;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v94 = v69;
      *(_WORD *)&v94[8] = 1024;
      *(_DWORD *)v95 = v70;
      *(_WORD *)&v95[4] = 2048;
      *(_QWORD *)&v95[6] = self;
      *(_WORD *)&v95[14] = 2048;
      *(_QWORD *)&v95[16] = v71;
      *(_WORD *)&v95[24] = 2048;
      *(_QWORD *)&v95[26] = v72;
      *(_WORD *)&v95[34] = 2112;
      *(_QWORD *)&v95[36] = v73;
      v62 = "Unrecognized message %s (body size=%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
      v63 = v27;
      v64 = 58;
    }
    _os_log_impl(&dword_20DC1A000, v63, OS_LOG_TYPE_DEFAULT, v62, buf, v64);
    goto LABEL_63;
  }
  v11 = mcdpc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_inputStream;
    v13 = self->_outputStream;
    v14 = self->_remoteServiceName;
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)v94 = self;
    *(_WORD *)&v94[8] = 2048;
    *(_QWORD *)v95 = v12;
    *(_WORD *)&v95[8] = 2048;
    *(_QWORD *)&v95[10] = v13;
    *(_WORD *)&v95[18] = 2112;
    *(_QWORD *)&v95[20] = v14;
    _os_log_impl(&dword_20DC1A000, v11, OS_LOG_TYPE_DEFAULT, "Got Accept - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
  }
  -[MCNearbyDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:](self, "syncSendMessageReceipt:sequenceNumber:", 2200, v5);
  v15 = MEMORY[0x24BDAC760];
  v83[0] = MEMORY[0x24BDAC760];
  v83[1] = 3221225472;
  v83[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_26;
  v83[3] = &unk_24C840BE0;
  v83[4] = self;
  v16 = (id)objc_msgSend(v83, "copy");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_connectedHandler = 0;
    v18 = self->_targetQueue;
    if (!v18)
      v18 = MEMORY[0x24BDAC9B8];
    v82[0] = v15;
    v82[1] = 3221225472;
    v82[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4;
    v82[3] = &unk_24C840C08;
    v82[4] = self;
    v82[5] = connectedHandler;
    v82[6] = v16;
    v19 = v82;
    goto LABEL_13;
  }
LABEL_63:
  objc_autoreleasePoolPop(v9);
}

void __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _QWORD *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = mcdpc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "declines";
    v6 = *(_QWORD **)(a1 + 32);
    v7 = v6[5];
    v8 = v6[6];
    if (a2)
      v5 = "approves";
    v9 = v6[1];
    v10 = "close connection";
    *(_DWORD *)buf = 136316418;
    if (a2)
      v10 = "accept connection";
    v19 = v5;
    v20 = 2080;
    v21 = v10;
    v22 = 2048;
    v23 = v6;
    v24 = 2048;
    v25 = v7;
    v26 = 2048;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Peer %s. Will %s - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x3Eu);
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 136);
  if (a2)
  {
    v17 = MEMORY[0x24BDAC760];
    v13 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_21;
    v14 = &v17;
  }
  else
  {
    v16 = MEMORY[0x24BDAC760];
    v13 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2;
    v14 = &v16;
  }
  if (v12)
    v15 = v12;
  else
    v15 = MEMORY[0x24BDAC9B8];
  v14[1] = 3221225472;
  v14[2] = (uint64_t)v13;
  v14[3] = (uint64_t)&unk_24C8407E8;
  v14[4] = v11;
  dispatch_async(v15, v14);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_21(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncSendAccept");
  return objc_msgSend(*(id *)(a1 + 32), "syncAcceptedConnection");
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(a1[4] + 8), 0, a1[6], 0);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_23(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 40), 0);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_26(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 136);
  if (a2)
  {
    v8 = MEMORY[0x24BDAC760];
    v4 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_27;
    v5 = &v8;
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v4 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_28;
    v5 = &v7;
  }
  if (v3)
    v6 = v3;
  else
    v6 = MEMORY[0x24BDAC9B8];
  v5[1] = 3221225472;
  v5[2] = (uint64_t)v4;
  v5[3] = (uint64_t)&unk_24C8407E8;
  v5[4] = v2;
  dispatch_async(v6, v5);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncAcceptedConnection");
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(a1[4] + 8), 1, a1[6], 0);
}

- (void)syncReceivedData:(id)a3 error:(id)a4
{
  uint64_t v7;
  void *v8;
  unsigned __int16 *v9;
  unsigned int v10;
  NSUInteger v11;
  NSObject *v12;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSString *remoteServiceName;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  NSMutableArray **p_messageReceiptHandlerList;
  uint64_t (**v25)(id, _QWORD);
  char v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSMutableArray **p_messageReceiptHandlerHoldingQueue;
  void *context;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  MCNearbyDiscoveryPeerConnection *v40;
  __int16 v41;
  NSInputStream *v42;
  __int16 v43;
  NSOutputStream *v44;
  __int16 v45;
  NSString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x212BB19AC](self, a2);
  v8 = (void *)v7;
  if (a3)
  {
    context = (void *)v7;
    -[NSMutableData appendData:](self->_dataReceived, "appendData:", a3);
    v9 = (unsigned __int16 *)-[NSMutableData bytes](self->_dataReceived, "bytes");
    v10 = -[NSMutableData length](self->_dataReceived, "length");
    if (v10 < 0x10)
    {
LABEL_3:
      v11 = -[NSMutableData length](self->_dataReceived, "length", p_messageReceiptHandlerHoldingQueue);
      v8 = context;
      if (v11 != v10)
        -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, v11 - v10, 0, 0);
      goto LABEL_34;
    }
    p_messageReceiptHandlerHoldingQueue = &self->_messageReceiptHandlerHoldingQueue;
    while (1)
    {
      v16 = bswap32(*((_DWORD *)v9 + 1));
      if (v16 >= 0x5000001)
      {
        v27 = mcdpc_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.1();
        goto LABEL_33;
      }
      if (v16 > v10 - 16)
        goto LABEL_3;
      v17 = *((unsigned __int8 *)v9 + 12);
      v18 = (*((unsigned __int8 *)v9 + 15) | (*((unsigned __int8 *)v9 + 13) << 16) | (*((unsigned __int8 *)v9 + 14) << 8)) & 0xFFFFFF | (v17 << 24);
      if (v17 << 24 < 0)
      {
        v28 = mcdpc_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.7();
        goto LABEL_33;
      }
      v19 = *v9;
      v20 = *((_BYTE *)v9 + 3);
      v21 = *((_DWORD *)v9 + 2);
      if ((v20 & 1) != 0)
      {
        if ((_DWORD)v16)
          break;
      }
      *((_DWORD *)v9 + 2) = 0;
      v22 = v16 + 16;
      if (bswap32(v21) != crc32(0, (const Bytef *)v9, (int)v16 + 16))
      {
        v30 = mcdpc_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.6();
LABEL_33:
        -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow", p_messageReceiptHandlerHoldingQueue);
        v8 = context;
        goto LABEL_34;
      }
      v23 = __rev16(v19);
      if ((v20 & 1) != 0)
      {
        if (((_DWORD)v23 != 2100
           || (p_messageReceiptHandlerList = p_messageReceiptHandlerHoldingQueue,
               !-[NSMutableArray count](*p_messageReceiptHandlerHoldingQueue, "count")))
          && (p_messageReceiptHandlerList = &self->_messageReceiptHandlerList,
              !-[NSMutableArray count](self->_messageReceiptHandlerList, "count", p_messageReceiptHandlerHoldingQueue))
          || (v25 = (uint64_t (**)(id, _QWORD))(id)-[NSMutableArray objectAtIndex:](*p_messageReceiptHandlerList, "objectAtIndex:", 0, p_messageReceiptHandlerHoldingQueue), -[NSMutableArray removeObjectAtIndex:](*p_messageReceiptHandlerList, "removeObjectAtIndex:", 0), !v25))
        {
          v31 = mcdpc_log();
          v8 = context;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.3();
          goto LABEL_7;
        }
        v26 = v25[2](v25, v18);

        if ((v26 & 1) == 0)
        {
          v33 = mcdpc_log();
          v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
          v8 = context;
          if (v34)
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.4();
          goto LABEL_7;
        }
      }
      else
      {
        -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:](self, "syncProcessMessage:data:sequenceNumber:", v23, objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9 + 8, v16), v18);
        if (self->_connectionClosed)
        {
          v32 = mcdpc_log();
          v8 = context;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.5();
          goto LABEL_34;
        }
      }
      v9 = (unsigned __int16 *)((char *)v9 + v22);
      v10 -= v22;
      if (v10 <= 0xF)
        goto LABEL_3;
    }
    v29 = mcdpc_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.2();
    goto LABEL_33;
  }
  v12 = mcdpc_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    inputStream = self->_inputStream;
    outputStream = self->_outputStream;
    remoteServiceName = self->_remoteServiceName;
    *(_DWORD *)buf = 138413314;
    v38 = a4;
    v39 = 2048;
    v40 = self;
    v41 = 2048;
    v42 = inputStream;
    v43 = 2048;
    v44 = outputStream;
    v45 = 2112;
    v46 = remoteServiceName;
    _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "End of stream, error: %@ - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x34u);
  }
LABEL_7:
  -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
LABEL_34:
  objc_autoreleasePoolPop(v8);
}

- (void)syncCloseConnectionNow
{
  NSObject *v3;
  NSInputStream *inputStream;
  NSOutputStream *outputStream;
  NSString *remoteServiceName;
  uint64_t v7;
  NSMutableArray *messageReceiptHandlerList;
  NSMutableArray *messageReceiptHandlerHoldingQueue;
  id connectedHandler;
  NSObject *targetQueue;
  _QWORD block[5];
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  MCNearbyDiscoveryPeerConnection *v16;
  __int16 v17;
  NSInputStream *v18;
  __int16 v19;
  NSOutputStream *v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = mcdpc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    inputStream = self->_inputStream;
    outputStream = self->_outputStream;
    remoteServiceName = self->_remoteServiceName;
    *(_DWORD *)buf = 134218754;
    v16 = self;
    v17 = 2048;
    v18 = inputStream;
    v19 = 2048;
    v20 = outputStream;
    v21 = 2112;
    v22 = remoteServiceName;
    _os_log_impl(&dword_20DC1A000, v3, OS_LOG_TYPE_DEFAULT, "Closing connection - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
  }
  *(_WORD *)&self->_connected = 256;
  -[NSInputStream close](self->_inputStream, "close");
  -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", 0);

  self->_inputStream = 0;
  -[NSOutputStream close](self->_outputStream, "close");
  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0);

  self->_outputStream = 0;
  self->_remoteServiceName = 0;
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, -[NSMutableData length](self->_dataReceived, "length"), 0, 0);
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSendHoldingQueue, "replaceBytesInRange:withBytes:length:", 0, -[NSMutableData length](self->_dataToSendHoldingQueue, "length"), 0, 0);
  v7 = MEMORY[0x24BDAC760];
  messageReceiptHandlerList = self->_messageReceiptHandlerList;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke;
  v14[3] = &unk_24C840C58;
  v14[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](messageReceiptHandlerList, "enumerateObjectsUsingBlock:", v14);
  messageReceiptHandlerHoldingQueue = self->_messageReceiptHandlerHoldingQueue;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_30;
  v13[3] = &unk_24C840C58;
  v13[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](messageReceiptHandlerHoldingQueue, "enumerateObjectsUsingBlock:", v13);
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_messageReceiptHandlerHoldingQueue, "removeAllObjects");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_connectedHandler = 0;
    if (self->_targetQueue)
      targetQueue = self->_targetQueue;
    else
      targetQueue = MEMORY[0x24BDAC9B8];
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_32;
    block[3] = &unk_24C840A18;
    block[4] = connectedHandler;
    dispatch_async(targetQueue, block);

  }
  else if (self->_receiveDataHandler)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCNearbyDiscoveryPeerConnection"), -4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Connection closed"), *MEMORY[0x24BDD0FC8]));
    (*((void (**)(void))self->_receiveDataHandler + 2))();
  }
}

void __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD block[5];
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    else
      v3 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2;
    block[3] = &unk_24C840A18;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else
  {
    v4 = mcdpc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[5];
      v7 = v5[6];
      v8 = v5[1];
      *(_DWORD *)buf = 134218754;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "ReceiptHander should not be nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
    }
  }
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_30(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD block[5];
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    else
      v3 = MEMORY[0x24BDAC9B8];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_31;
    block[3] = &unk_24C840A18;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else
  {
    v4 = mcdpc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[5];
      v7 = v5[6];
      v8 = v5[1];
      *(_DWORD *)buf = 134218754;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "ReceiptHandler should not be nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
    }
  }
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_32(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCNearbyDiscoveryPeerConnection"), -3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unable to connect"), *MEMORY[0x24BDD0FC8]));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  if (!syncQueue)
    syncQueue = MEMORY[0x24BDAC9B8];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__MCNearbyDiscoveryPeerConnection_invalidate__block_invoke;
  block[3] = &unk_24C8407E8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __45__MCNearbyDiscoveryPeerConnection_invalidate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseConnectionNow");
}

- (void)dealloc
{
  id connectedHandler;
  id receiveDataHandler;
  NSObject *syncQueue;
  NSObject *targetQueue;
  objc_super v7;

  -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
  connectedHandler = self->_connectedHandler;
  if (connectedHandler)

  receiveDataHandler = self->_receiveDataHandler;
  if (receiveDataHandler)

  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_release(targetQueue);
  v7.receiver = self;
  v7.super_class = (Class)MCNearbyDiscoveryPeerConnection;
  -[MCNearbyDiscoveryPeerConnection dealloc](&v7, sel_dealloc);
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  NSObject *syncQueue;
  NSObject *v9;
  _QWORD block[7];

  if (a3)
  {
    if (objc_msgSend(a3, "length") > 0x1400000)
    {
      v9 = mcdpc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MCNearbyDiscoveryPeerConnection sendData:withCompletionHandler:].cold.1();
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCNearbyDiscoveryPeerConnection"), -5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Message is too big to send"), *MEMORY[0x24BDD0FC8])));
    }
    else
    {
      v7 = (id)objc_msgSend(a4, "copy");
      syncQueue = MEMORY[0x24BDAC9B8];
      if (self->_syncQueue)
        syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__MCNearbyDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke;
      block[3] = &unk_24C840978;
      block[4] = self;
      block[5] = a3;
      block[6] = v7;
      dispatch_async(syncQueue, block);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __66__MCNearbyDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncSendMessage:data:withCompletionHandler:", 2100, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)stringForStreamEventCode:(unint64_t)a3
{
  id result;

  result = CFSTR("None");
  switch(a3)
  {
    case 1uLL:
      result = CFSTR("Open Completed");
      break;
    case 2uLL:
      result = CFSTR("Has Bytes Available");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      result = CFSTR("Has Space Available");
      break;
    case 8uLL:
      result = CFSTR("Error Occured");
      break;
    default:
      if (a3 == 16)
        result = CFSTR("End Encountered");
      break;
  }
  return result;
}

- (void)syncReadFromInputStream
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DC1A000, log, OS_LOG_TYPE_ERROR, "Read failed.", v1, 2u);
}

- (int)socketForStream:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BDBD5D8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length") == 4)
    return *(_DWORD *)objc_msgSend(v3, "bytes");
  else
    return -1;
}

- (void)syncHandleStreamEventOpenCompleted:(id)a3
{
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  socklen_t v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  sockaddr v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = -[MCNearbyDiscoveryPeerConnection socketForStream:](self, "socketForStream:");
  if (v4 == -1)
  {
    v10 = mcdpc_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    v7 = "Failed get socket for stream [%p].";
    v8 = v10;
    v9 = 12;
    goto LABEL_32;
  }
  v5 = v4;
  v16 = 0;
  if (SocketGetInterfaceInfo())
  {
    v6 = mcdpc_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 134218240;
    v18 = a3;
    v19 = 1024;
    v20 = v5;
    v7 = "SocketGetInterfaceInfo failed for stream=%p socket=%d.";
    v8 = v6;
    v9 = 18;
    goto LABEL_32;
  }
  *(_QWORD *)&v29.sa_len = 0;
  *(_QWORD *)&v29.sa_data[6] = 0;
  v15 = 16;
  if (getsockname(v5, &v29, &v15) == -1)
  {
    v12 = mcdpc_log();
    v11 = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v18 = a3;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get port for stream=%p socket=%d.", buf, 0x12u);
      v11 = 0;
    }
  }
  else
  {
    v11 = bswap32(*(unsigned __int16 *)v29.sa_data) >> 16;
  }
  v13 = mcdpc_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)v16 <= 31)
    {
      v14 = "Enet";
      switch((int)v16)
      {
        case 1:
          goto LABEL_31;
        case 2:
          v14 = "WiFi";
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_24;
        case 4:
          v14 = "AWDL";
          break;
        case 8:
          v14 = "USB";
          break;
        default:
          if ((_DWORD)v16 != 16)
            goto LABEL_24;
          v14 = "Direct";
          break;
      }
      goto LABEL_31;
    }
    if ((int)v16 > 127)
    {
      if ((_DWORD)v16 == 128)
      {
        v14 = "NAN";
        goto LABEL_31;
      }
      if ((_DWORD)v16 == 256)
      {
        v14 = "IPsecBT";
        goto LABEL_31;
      }
    }
    else
    {
      if ((_DWORD)v16 == 32)
      {
        v14 = "BTLE";
        goto LABEL_31;
      }
      if ((_DWORD)v16 == 64)
      {
        v14 = "WFD";
LABEL_31:
        *(_DWORD *)buf = 134219266;
        v18 = a3;
        v19 = 1024;
        v20 = v5;
        v21 = 1024;
        v22 = v11;
        v23 = 2080;
        v24 = &v30;
        v25 = 1024;
        v26 = HIDWORD(v16);
        v27 = 2080;
        v28 = v14;
        v7 = "Stream [%p] info: socket=%d port=%d interfaceName=%s interfaceIndex=%d transportType=%s.";
        v8 = v13;
        v9 = 50;
LABEL_32:
        _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        return;
      }
    }
LABEL_24:
    v14 = "?";
    if ((_DWORD)v16 == 512)
      v14 = "IPSecWiFi";
    goto LABEL_31;
  }
}

- (void)syncHandleInputStreamEvent:(unint64_t)a3
{
  NSObject *v4;
  NSInputStream *inputStream;
  NSObject *v6;
  NSInputStream *v7;
  NSObject *v8;
  NSInputStream *v9;
  NSInputStream *v10;
  NSObject *v11;
  int v12;
  NSInputStream *v13;
  __int16 v14;
  NSInputStream *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1uLL:
      v4 = mcdpc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        v12 = 138412290;
        v13 = inputStream;
        _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Stream %@ opened.", (uint8_t *)&v12, 0xCu);
      }
      -[MCNearbyDiscoveryPeerConnection syncHandleStreamEventOpenCompleted:](self, "syncHandleStreamEventOpenCompleted:", self->_inputStream);
      break;
    case 2uLL:
      -[MCNearbyDiscoveryPeerConnection syncReadFromInputStream](self, "syncReadFromInputStream");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      v8 = mcdpc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[MCNearbyDiscoveryPeerConnection stringForStreamEventCode:](self, "stringForStreamEventCode:", 4);
        v10 = self->_inputStream;
        v12 = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected event (%@) for input stream %@.", (uint8_t *)&v12, 0x16u);
      }
      break;
    case 8uLL:
      v11 = mcdpc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MCNearbyDiscoveryPeerConnection syncHandleInputStreamEvent:].cold.1((uint64_t)self);
      break;
    default:
      if (a3 == 16)
      {
        v6 = mcdpc_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = self->_inputStream;
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "End for stream %@.", (uint8_t *)&v12, 0xCu);
        }
        -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
      }
      break;
  }
}

- (void)syncHandleOutputStreamEvent:(unint64_t)a3
{
  NSObject *v4;
  NSOutputStream *outputStream;
  NSObject *v6;
  NSOutputStream *v7;
  NSObject *v8;
  NSOutputStream *v9;
  NSOutputStream *v10;
  NSObject *v11;
  int v12;
  NSOutputStream *v13;
  __int16 v14;
  NSOutputStream *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1uLL:
      v4 = mcdpc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        outputStream = self->_outputStream;
        v12 = 138412290;
        v13 = outputStream;
        _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Stream %@ opened.", (uint8_t *)&v12, 0xCu);
      }
      -[MCNearbyDiscoveryPeerConnection syncHandleStreamEventOpenCompleted:](self, "syncHandleStreamEventOpenCompleted:", self->_outputStream);
      break;
    case 2uLL:
      v8 = mcdpc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[MCNearbyDiscoveryPeerConnection stringForStreamEventCode:](self, "stringForStreamEventCode:", 2);
        v10 = self->_outputStream;
        v12 = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected event (%@) for output stream %@.", (uint8_t *)&v12, 0x16u);
      }
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      -[MCNearbyDiscoveryPeerConnection syncSendData](self, "syncSendData");
      break;
    case 8uLL:
      v11 = mcdpc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MCNearbyDiscoveryPeerConnection syncHandleOutputStreamEvent:].cold.1((uint64_t)self);
      break;
    default:
      if (a3 == 16)
      {
        v6 = mcdpc_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = self->_outputStream;
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "End for stream %@", (uint8_t *)&v12, 0xCu);
        }
        -[MCNearbyDiscoveryPeerConnection syncCloseConnectionNow](self, "syncCloseConnectionNow");
      }
      break;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSObject *v7;
  NSObject *syncQueue;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = mcdpc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = a3;
    v13 = 2112;
    v14 = -[MCNearbyDiscoveryPeerConnection stringForStreamEventCode:](self, "stringForStreamEventCode:", a4);
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Stream [%p] event [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (self->_syncQueue)
    syncQueue = self->_syncQueue;
  else
    syncQueue = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_V2(syncQueue);
  if (self->_inputStream == a3)
  {
    -[MCNearbyDiscoveryPeerConnection syncHandleInputStreamEvent:](self, "syncHandleInputStreamEvent:", a4);
  }
  else if (self->_outputStream == a3)
  {
    -[MCNearbyDiscoveryPeerConnection syncHandleOutputStreamEvent:](self, "syncHandleOutputStreamEvent:", a4);
  }
  else
  {
    v9 = mcdpc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[MCNearbyDiscoveryPeerConnection stringForStreamEventCode:](self, "stringForStreamEventCode:", a4);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Unknown stream - ignoring event [%@].", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (NSString)remoteServiceName
{
  return self->_remoteServiceName;
}

- (void)setRemoteServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localServiceName
{
  return self->_localServiceName;
}

- (void)setLocalServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (id)connectedHandler
{
  return self->_connectedHandler;
}

- (void)setConnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)shouldDecideAboutConnection
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[22];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7_0();
  v6 = 2048;
  v7 = v0;
  v8 = 2048;
  v9 = v1;
  v10 = 2048;
  v11 = v2;
  OUTLINED_FUNCTION_8_0(&dword_20DC1A000, v3, v4, "Local [%@] and remote [%@] service name are equal - this should NOT happen. ptr [%p] inputStream [%p] outputStream [%p].", v5);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncSendMessage:(int)a1 data:(_QWORD *)a2 withCompletionHandler:(NSObject *)a3 .cold.1(int a1, _QWORD *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  _QWORD *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2[5];
  v4 = a2[6];
  v5 = "?";
  if (a1 == 2000)
    v5 = "Hello";
  if (a1 == 2100)
    v5 = "Data";
  v6 = a2[1];
  v7 = 136316162;
  if (!a1)
    v5 = "Invalid";
  v8 = v5;
  v9 = 2048;
  v10 = a2;
  v11 = 2048;
  v12 = v3;
  v13 = 2048;
  v14 = v4;
  v15 = 2112;
  v16 = v6;
  OUTLINED_FUNCTION_8_0(&dword_20DC1A000, a3, (uint64_t)a3, "Can't send bad message type [%s] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)&v7);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncProcessMessage:(void *)a1 data:(_QWORD *)a2 sequenceNumber:(NSObject *)a3 .cold.1(void *a1, _QWORD *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "length");
  v6 = a2[5];
  v7 = a2[6];
  v8 = a2[1];
  v9[0] = 67110146;
  v9[1] = v5;
  v10 = 2048;
  v11 = a2;
  v12 = 2048;
  v13 = v6;
  v14 = 2048;
  v15 = v7;
  v16 = 2112;
  v17 = v8;
  _os_log_error_impl(&dword_20DC1A000, a3, OS_LOG_TYPE_ERROR, "Hello body too short: %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v9, 0x30u);
}

- (void)syncProcessMessage:data:sequenceNumber:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_20DC1A000, v0, v1, "serviceNameLength cannot be 0 - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncProcessMessage:data:sequenceNumber:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "Remote name not property terminated at length=%u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.1()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  v6[0] = 67110402;
  v6[1] = v0;
  v7 = 1024;
  v8 = 83886080;
  v9 = 2048;
  v10 = v1;
  v11 = 2048;
  v12 = v2;
  v13 = 2048;
  v14 = v3;
  v15 = 2112;
  v16 = v4;
  _os_log_error_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_ERROR, "Message too big %u > %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v6, 0x36u);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "Receipt has body size %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_20DC1A000, v0, v1, "Message receipt has no matching handler - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "Unexpected sequence number [%d] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_20DC1A000, v0, v1, "Connection closed after processing message - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0(&dword_20DC1A000, v0, v1, "Invalid checksum - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)syncReceivedData:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "InvalidSequenceNumber [%u] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)sendData:withCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_20DC1A000, v0, v1, "Message too big to send (length=%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
  OUTLINED_FUNCTION_4_0();
}

- (void)syncHandleInputStreamEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 40), "streamError");
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v1, v2, "Stream error occurred: %@.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleOutputStreamEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 48), "streamError");
  OUTLINED_FUNCTION_6_0(&dword_20DC1A000, v1, v2, "Stream error occurred: %@.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

@end
