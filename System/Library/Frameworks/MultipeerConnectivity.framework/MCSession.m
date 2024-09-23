@implementation MCSession

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (MCSessionPrivateDelegate)privateDelegate
{
  return (MCSessionPrivateDelegate *)objc_loadWeak((id *)&self->_privateDelegate);
}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privateDelegate, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  MCPeerID *v6;
  NSArray *v7;
  id v8;
  NSArray *v9;
  objc_class *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[MCSession myPeerID](self, "myPeerID");
  v7 = -[MCSession securityIdentity](self, "securityIdentity");
  v8 = -[MCSession stringForEncryptionPreference:](self, "stringForEncryptionPreference:", -[MCSession encryptionPreference](self, "encryptionPreference"));
  v9 = -[MCSession connectedPeers](self, "connectedPeers");
  -[MCSession delegate](self, "delegate");
  v10 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p MyPeerID = %@ SecurityIdentity = %@ EncryptionPreference = %@ ConnectedPeers = %@ Delegate = <%@: %p>>"), v5, self, v6, v7, v8, v9, NSStringFromClass(v10), -[MCSession delegate](self, "delegate"));
}

- (id)stringForEncryptionPreference:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("?");
  else
    return (id)*((_QWORD *)&off_24C840B20 + a3);
}

- (void)syncHandleXDataDataPacket:(char *)a3 packetSize:(int)a4 forPeer:(id)a5 state:(id)a6
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (a4 - 4);
  if (a4 <= 4)
  {
    v7 = mcs_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v17[0]) = 0;
    v8 = "No content.";
    v9 = v7;
    v10 = 2;
LABEL_11:
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)v17, v10);
    return;
  }
  v12 = bswap32(*(_DWORD *)a3);
  v13 = (void *)objc_msgSend(a6, "incomingStreams");
  v14 = (void *)objc_msgSend(v13, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12));
  if (!v14)
  {
    v16 = mcs_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      return;
    v17[0] = 67109120;
    v17[1] = v12;
    v8 = "Stream %u not found.";
    v9 = v16;
    v10 = 8;
    goto LABEL_11;
  }
  v15 = v14;
  if (objc_msgSend(v14, "state") == 2 || objc_msgSend(v15, "state") == 3)
  {
    objc_msgSend((id)objc_msgSend(v15, "incomingBuffer"), "appendBytes:length:", a3 + 4, v6);
    if (objc_msgSend(v15, "sourceSuspended"))
    {
      objc_msgSend(v15, "setSourceSuspended:", 0);
      dispatch_resume((dispatch_object_t)objc_msgSend(v15, "source"));
    }
  }
}

- (void)syncSendXDataStreamOpenResponseToPID:(unsigned int)a3 withRequestID:(unsigned int)a4 streamID:(unsigned int)a5
{
  NSObject *v9;
  UInt8 *v10;
  UInt8 *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = a3;
    v24 = 1024;
    v25 = a4;
    v26 = 1024;
    v27 = a5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamOpenResponse to peer[%08X] requestID[%08X] streamID[%08X].", buf, 0x14u);
  }
  v10 = (UInt8 *)malloc_type_malloc(0xCuLL, 0x5816FAD4uLL);
  if (v10)
  {
    v11 = v10;
    *(_DWORD *)v10 = 201326741;
    v10[4] = HIBYTE(a4);
    v10[5] = BYTE2(a4);
    v10[6] = BYTE1(a4);
    v10[7] = a4;
    v10[8] = HIBYTE(a5);
    v10[9] = BYTE2(a5);
    v10[10] = BYTE1(a5);
    v10[11] = a5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, v10, 12, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
    }
    free(v11);
  }
  else
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), 12);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (void)syncSendXDataStreamCloseFromSenderToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5
{
  int v5;
  NSObject *v9;
  UInt8 *v10;
  UInt8 *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = a3;
    v24 = 1024;
    v25 = a4;
    v26 = 1024;
    v27 = v5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamCloseFromSender to peer[%08X] streamID[%08X] closeReason[%d].", buf, 0x14u);
  }
  v10 = (UInt8 *)malloc_type_malloc(0xAuLL, 0x4B2E9658uLL);
  if (v10)
  {
    v11 = v10;
    *(_DWORD *)v10 = 167772318;
    v10[4] = HIBYTE(a4);
    v10[5] = BYTE2(a4);
    v10[6] = BYTE1(a4);
    v10[7] = a4;
    v10[8] = BYTE1(v5);
    v10[9] = v5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, v10, 10, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
    }
    free(v11);
  }
  else
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), 10);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (void)syncSendXDataStreamCloseFromReceiverToPID:(unsigned int)a3 streamID:(unsigned int)a4 closeReason:(unsigned __int16)a5
{
  int v5;
  NSObject *v9;
  UInt8 *v10;
  UInt8 *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = a3;
    v24 = 1024;
    v25 = a4;
    v26 = 1024;
    v27 = v5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Streaming: sending XDataStreamCloseFromReceiver to peer[%08X] streamID[%08X] closeReason[%d].", buf, 0x14u);
  }
  v10 = (UInt8 *)malloc_type_malloc(0xAuLL, 0x404C8D92uLL);
  if (v10)
  {
    v11 = v10;
    *(_DWORD *)v10 = 167772319;
    v10[4] = HIBYTE(a4);
    v10[5] = BYTE2(a4);
    v10[6] = BYTE1(a4);
    v10[7] = a4;
    v10[8] = BYTE1(v5);
    v10[9] = v5;
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v21, 1, v10, 10, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v12 = mcs_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
    }
    free(v11);
  }
  else
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), 10);
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (void)syncSendXDataPeerIDPushToPID:(unsigned int)a3
{
  NSObject *v5;
  id v6;
  unsigned __int16 v7;
  UInt8 *v8;
  UInt8 *v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v12;
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v5 = mcs_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a3;
    _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "XData: pushing own peerID to non-neighbor peer[%08X].", buf, 8u);
  }
  v6 = -[MCPeerID serializedRepresentation](-[MCSession myPeerID](self, "myPeerID"), "serializedRepresentation");
  v7 = objc_msgSend(v6, "length") + 4;
  v8 = (UInt8 *)malloc_type_malloc(v7, 0x4F1A29A4uLL);
  if (v8)
  {
    v9 = v8;
    *(_WORD *)v8 = 168;
    v8[2] = HIBYTE(v7);
    v8[3] = v7;
    memcpy(v8 + 4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v12, 1, v9, v7, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v10 = mcs_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
    }
    free(v9);
  }
  else
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), v7);
    v11 = mcs_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataPeerIDPushToPID:].cold.1();
  }
}

- (void)syncSendXDataConnectionBlobPushToPID:(unsigned int)a3 connectionBlob:(id)a4
{
  NSObject *v7;
  unsigned __int16 v8;
  UInt8 *v9;
  UInt8 *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v13;
  uint8_t buf[4];
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v7 = mcs_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = a3;
    _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "XData: pushing connection data to non-neighbor peer[%08X].", buf, 8u);
  }
  v8 = objc_msgSend(a4, "length") + 4;
  v9 = (UInt8 *)malloc_type_malloc(v8, 0x95ACD640uLL);
  if (v9)
  {
    v10 = v9;
    *(_WORD *)v9 = 169;
    v9[2] = HIBYTE(v8);
    v9[3] = v8;
    memcpy(v9 + 4, (const void *)objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
    *(_DWORD *)buf = 0;
    if (AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v13, 1, v10, v8, (uint64_t)buf, 0, 0xAu, 1, 0))
    {
      v11 = mcs_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
    }
    free(v10);
  }
  else
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), v8);
    v12 = mcs_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataPeerIDPushToPID:].cold.1();
  }
}

- (void)syncCloseIncomingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 reason:(int)a7 shouldTriggerCancelProgress:(BOOL)a8
{
  _BOOL4 v8;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *callbackQueue;
  void *v23;
  _QWORD block[9];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v8 = a8;
  v33 = *MEMORY[0x24BDAC8D0];
  v15 = mcs_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = a3;
    v27 = 2112;
    v28 = a4;
    v29 = 2112;
    v30 = a5;
    v31 = 2112;
    v32 = a6;
    _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Close incoming stream[%@] peer[%@] peerState[%@] error[%@].", buf, 0x2Au);
  }
  objc_msgSend(a3, "setState:", 4);
  if (objc_msgSend(a3, "source"))
  {
    if (objc_msgSend(a3, "sourceSuspended"))
      dispatch_resume((dispatch_object_t)objc_msgSend(a3, "source"));
    dispatch_source_cancel((dispatch_source_t)objc_msgSend(a3, "source"));
  }
  if (objc_msgSend(a3, "url"))
  {
    if (v8)
      objc_msgSend((id)objc_msgSend(a3, "progress"), "cancel");
    if (!a6)
    {
      if (a7 == 1)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Resource transfer cancelled."), *MEMORY[0x24BDD0FC8]);
        v19 = v17;
        v20 = 5;
      }
      else
      {
        if (!a7)
        {
          objc_msgSend((id)objc_msgSend(a3, "progress"), "setCompletedUnitCount:", objc_msgSend((id)objc_msgSend(a3, "progress"), "totalUnitCount"));
          v16 = (id)objc_msgSend(a3, "url");
          a6 = 0;
LABEL_18:
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __92__MCSession_syncCloseIncomingStream_forPeer_state_error_reason_shouldTriggerCancelProgress___block_invoke;
          block[3] = &unk_24C8406F8;
          block[4] = self;
          block[5] = a3;
          block[6] = a4;
          block[7] = v16;
          block[8] = a6;
          dispatch_async(callbackQueue, block);
          objc_msgSend((id)objc_msgSend(a3, "observer"), "invalidate");
          objc_msgSend(a3, "setObserver:", 0);
          goto LABEL_19;
        }
        v21 = (void *)MEMORY[0x24BDD1540];
        v18 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Resource transfer interrupted."), *MEMORY[0x24BDD0FC8]);
        v19 = v21;
        v20 = 0;
      }
      a6 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("MCSession"), v20, v18);
    }
    v16 = 0;
    goto LABEL_18;
  }
LABEL_19:
  v23 = (void *)objc_msgSend(a5, "incomingStreams");
  objc_msgSend(v23, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(a3, "streamID")));
  objc_msgSend((id)objc_msgSend(a5, "incomingStreams"), "removeObjectForKey:", objc_msgSend(a3, "name"));
}

void __92__MCSession_syncCloseIncomingStream_forPeer_state_error_reason_shouldTriggerCancelProgress___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:propagate:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "name"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v7);
  if (v7)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "name"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
    v5 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138413314;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 1024;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Resource from [%@]. Interrupted callback pd(%@) d(%@) prop(%d) error[%@].", buf, 0x30u);
  }
}

- (void)syncCloseOutgoingStream:(id)a3 forPeer:(id)a4 state:(id)a5 error:(id)a6 shouldTriggerCancelProgress:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  NSObject *callbackQueue;
  void *v14;
  _QWORD v15[6];

  v7 = a7;
  objc_msgSend(a3, "setState:", 4, a4);
  if (objc_msgSend(a3, "url"))
  {
    if (v7)
      objc_msgSend((id)objc_msgSend(a3, "progress"), "cancel");
    if (objc_msgSend(a3, "completionHandler"))
    {
      v12 = (id)objc_msgSend(a3, "completionHandler");
      objc_msgSend(a3, "setCompletionHandler:", 0);
      callbackQueue = self->_callbackQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __85__MCSession_syncCloseOutgoingStream_forPeer_state_error_shouldTriggerCancelProgress___block_invoke;
      v15[3] = &unk_24C840720;
      v15[4] = a6;
      v15[5] = v12;
      dispatch_async(callbackQueue, v15);
    }
    if (objc_msgSend(a3, "urlDownloader"))
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "urlDownloader"), "urlTask"), "state") != 3)
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "urlDownloader"), "urlTask"), "cancel");
      objc_msgSend(a3, "setUrlDownloader:", 0);
    }
    objc_msgSend((id)objc_msgSend(a3, "observer"), "invalidate");
    objc_msgSend(a3, "setObserver:", 0);
  }
  else if (objc_msgSend(a3, "source"))
  {
    if (objc_msgSend(a3, "sourceSuspended"))
      dispatch_resume((dispatch_object_t)objc_msgSend(a3, "source"));
    dispatch_source_cancel((dispatch_source_t)objc_msgSend(a3, "source"));
  }
  v14 = (void *)objc_msgSend(a5, "outgoingStreams");
  objc_msgSend(v14, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(a3, "streamID")));
  objc_msgSend((id)objc_msgSend(a5, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(a3, "name"));
}

void __85__MCSession_syncCloseOutgoingStream_forPeer_state_error_shouldTriggerCancelProgress___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)syncCloseStreamsForPeer:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend((id)objc_msgSend(v5, "incomingStreams"), "allKeys");
    v8 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Peer no longer connected."), *MEMORY[0x24BDD0FC8]));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_msgSend((id)objc_msgSend(v6, "incomingStreams"), "objectForKey:", v13);
            if (v14)
              -[MCSession syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:](self, "syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:", v14, a3, v6, v8, 2, 1);
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }
    v15 = (void *)objc_msgSend((id)objc_msgSend(v6, "outgoingStreams"), "allKeys");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = objc_msgSend((id)objc_msgSend(v6, "incomingStreams"), "objectForKey:", v20);
            if (v21)
              -[MCSession syncCloseOutgoingStream:forPeer:state:error:shouldTriggerCancelProgress:](self, "syncCloseOutgoingStream:forPeer:state:error:shouldTriggerCancelProgress:", v21, a3, v6, v8, 1);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }
  }
  else
  {
    v22 = mcs_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = objc_msgSend(a3, "displayName");
      _os_log_impl(&dword_20DC1A000, v22, OS_LOG_TYPE_DEFAULT, "No peerState object for peer [%@].", buf, 0xCu);
    }
  }
}

- (id)syncDetailedDescription
{
  const __CFString *v3;
  NSArray *v4;
  const char *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  CFMutableStringRef v11;
  CFMutableStringRef v12;
  CFMutableStringRef v13;
  CFMutableStringRef v14;
  const __CFString *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  NSAppendPrintF();
  NSAppendPrintF();
  NSAppendPrintF();
  if (-[MCSession sessionID](self, "sessionID"))
    v3 = -[MCSession sessionID](self, "sessionID");
  else
    v3 = &stru_24C841670;
  v16 = v3;
  NSAppendPrintF();
  v17 = -[MCPeerID displayNameAndPID](-[MCSession myPeerID](self, "myPeerID", v16), "displayNameAndPID");
  NSAppendPrintF();
  v18 = -[MCSession stringForEncryptionPreference:](self, "stringForEncryptionPreference:", -[MCSession encryptionPreference](self, "encryptionPreference", v17));
  NSAppendPrintF();
  v4 = -[MCSession securityIdentity](self, "securityIdentity", v18);
  v5 = "yes";
  if (!v4)
    v5 = "no";
  v19 = v5;
  NSAppendPrintF();
  v20 = -[NSMutableDictionary count](-[MCSession peerStates](self, "peerStates", v19), "count");
  NSAppendPrintF();
  v21 = -[MCSession syncConnectedPeersCount](self, "syncConnectedPeersCount", v20);
  NSAppendPrintF();
  v22 = -[MCSession maxPeers](self, "maxPeers", v21);
  NSAppendPrintF();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = -[MCSession peerStates](self, "peerStates", v22);
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v23 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[MCSession peerStates](self, "peerStates", v23), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)), "description");
        NSAppendPrintF();
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v23);
    }
    while (v8);
  }
  -[MCSession gckSession](self, "gckSession");
  v11 = GCKSessionCopyDetailedDescription();
  if (v11)
  {
    v12 = v11;
    NSAppendPrintF();
    v23 = (uint64_t)v12;
    NSAppendPrintF();
    CFRelease(v12);
  }
  -[MCSession agpSession](self, "agpSession", v23);
  v13 = AGPSessionCopyDetailedDescription();
  if (v13)
  {
    v14 = v13;
    NSAppendPrintF();
    NSAppendPrintF();
    CFRelease(v14);
  }
  return v28;
}

- (os_state_data_s)syncStateCapture
{
  id v2;
  void *v3;
  void *v4;
  size_t v5;
  os_state_data_s *v6;
  os_state_data_s *v7;

  v2 = -[MCSession syncDetailedDescription](self, "syncDetailedDescription");
  if (!v2)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_msgSend(v3, "length");
  v6 = (os_state_data_s *)malloc_type_calloc(1uLL, v5 + 200, 0x1B503FBFuLL);
  v7 = v6;
  if (v6)
  {
    v6->var0 = 1;
    v6->var1.var1 = v5;
    __strlcpy_chk();
    memcpy(v7->var4, (const void *)objc_msgSend(v4, "bytes"), v5);
  }
  return v7;
}

- (void)startConnectionWithIndirectPID:(unsigned int)a3
{
  uint64_t v5;
  id v6;
  NSObject *syncQueue;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];
  unsigned int v17;
  int v18;
  void *v19;

  v19 = 0;
  v18 = 1350;
  v5 = GCKSessionPrepareConnection((uint64_t)self->_gckSession, a3);
  if ((v5 & 0x80000000) != 0)
  {
    v8 = v5;
    v9 = mcs_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MCSession startConnectionWithIndirectPID:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v6 = +[MCSessionPeerConnectionData connectionDataSegmentWithEncryptionPreference:identitySet:gckSessionConnectionDataBytes:gckSessionConnectionDataLength:](MCSessionPeerConnectionData, "connectionDataSegmentWithEncryptionPreference:identitySet:gckSessionConnectionDataBytes:gckSessionConnectionDataLength:", -[MCSession encryptionPreference](self, "encryptionPreference"), -[MCSession securityIdentity](self, "securityIdentity") != 0, v19, v18);
    free(v19);
    syncQueue = self->_syncQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__MCSession_startConnectionWithIndirectPID___block_invoke;
    v16[3] = &unk_24C840748;
    v17 = a3;
    v16[4] = self;
    v16[5] = v6;
    dispatch_async(syncQueue, v16);
  }
}

uint64_t __44__MCSession_startConnectionWithIndirectPID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncSendXDataConnectionBlobPushToPID:connectionBlob:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)syncCancelIncomingStream:(id)a3 fromPeer:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Resource transfer cancelled."), *MEMORY[0x24BDD0FC8]));
  v8 = -[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:", a4);
  -[MCSession syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", objc_msgSend(a4, "pid"), objc_msgSend(a3, "streamID"), 1);
  -[MCSession syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:](self, "syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:", a3, a4, v8, v7, 1, 0);
}

- (void)cancelIncomingStream:(id)a3 fromPeer:(id)a4
{
  NSObject *syncQueue;
  _QWORD block[7];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MCSession_cancelIncomingStream_fromPeer___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

uint64_t __43__MCSession_cancelIncomingStream_fromPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCancelIncomingStream:fromPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)syncCancelOutgoingStream:(id)a3 toPeer:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Resource transfer cancelled."), *MEMORY[0x24BDD0FC8]));
  v8 = -[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:", a4);
  -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", objc_msgSend(a4, "pid"), objc_msgSend(a3, "streamID"), 1);
  -[MCSession syncCloseOutgoingStream:forPeer:state:error:shouldTriggerCancelProgress:](self, "syncCloseOutgoingStream:forPeer:state:error:shouldTriggerCancelProgress:", a3, a4, v8, v7, 0);
}

- (void)cancelOutgoingStream:(id)a3 toPeer:(id)a4
{
  NSObject *syncQueue;
  _QWORD block[7];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__MCSession_cancelOutgoingStream_toPeer___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

uint64_t __41__MCSession_cancelOutgoingStream_toPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCancelOutgoingStream:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (unint64_t)syncConnectedPeersCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)-[NSMutableDictionary allValues](self->_peerStates, "allValues");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "state") == 2)
        ++v5;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (void)syncPeer:(id)a3 changeStateTo:(int64_t)a4 shouldForceCallback:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *callbackQueue;
  _QWORD v18[8];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "state");
    v12 = mcs_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = objc_msgSend(a3, "displayName");
      v21 = 2112;
      v22 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", v11);
      v23 = 2112;
      v24 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", a4);
      _os_log_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEFAULT, "PeerID [%@] change state from [%@] to [%@].", buf, 0x20u);
    }
    if (v11 != a4)
      goto LABEL_8;
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", a4);
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v14;
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Peer already in state [%@]", buf, 0xCu);
    }
    if (v5)
    {
LABEL_8:
      if (a4)
      {
        objc_msgSend(v10, "setState:", a4);
      }
      else
      {
        v16 = a3;
        -[NSMutableDictionary removeObjectForKey:](self->_peerIDMap, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "pid")));
        -[NSMutableDictionary removeObjectForKey:](self->_peerStates, "removeObjectForKey:", a3);
      }
LABEL_15:
      callbackQueue = self->_callbackQueue;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __56__MCSession_syncPeer_changeStateTo_shouldForceCallback___block_invoke;
      v18[3] = &unk_24C840770;
      v18[4] = self;
      v18[5] = a3;
      v18[6] = a4;
      v18[7] = v11;
      dispatch_async(callbackQueue, v18);
      if (a4)
      {
        if (a4 == 2)
        {
          -[MCSession setMaxPeers:](self, "setMaxPeers:", -[MCSession maxPeers](self, "maxPeers") + 1);
          -[MCSession syncLogConnectedPeers](self, "syncLogConnectedPeers");
        }
      }
      else if (!-[MCSession syncConnectedPeersCount](self, "syncConnectedPeersCount"))
      {
        -[MCSession syncLogMaxConnectedPeers](self, "syncLogMaxConnectedPeers");
        -[MCSession setMaxPeers:](self, "setMaxPeers:", 0);
      }
    }
  }
  else
  {
    if (v5)
    {
      v11 = 0;
      goto LABEL_15;
    }
    v15 = mcs_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = objc_msgSend(a3, "displayName");
      v21 = 2112;
      v22 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", a4);
      _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "No peerState for peerID [%@], newState [%@]. Will not callback.", buf, 0x16u);
    }
  }
}

void __56__MCSession_syncPeer_changeStateTo_shouldForceCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:peer:didChangeState:propagate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v8);
  if (v8)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:peer:didChangeState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", *(_QWORD *)(a1 + 56));
    v5 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", *(_QWORD *)(a1 + 48));
    v6 = objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
    v7 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    *(_DWORD *)buf = 138413570;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] changed state from [%@] to [%@]; pd(%@) d(%@) prop(%d).",
      buf,
      0x3Au);
  }
}

- (void)syncHandleNetworkEvent:(id *)a3 pid:(unsigned int)a4 freeEventWhenDone:(BOOL *)a5
{
  uint64_t v6;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  OS_dispatch_queue *callbackQueue;
  _QWORD *v15;
  NSObject *v16;
  uint64_t v17;
  int *p_var2;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t var0;
  const char *v24;
  void *v25;
  char *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  int var2;
  unsigned int var3;
  char *var1;
  signed int v34;
  NSObject *v35;
  int v36;
  NSObject *global_queue;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  NSObject *v50;
  uint64_t v51;
  const char *v52;
  unsigned int v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  int v58;
  const char *v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  void (**v63)(id, uint64_t);
  MCPeerID *v64;
  MCSessionPeerState *v65;
  NSObject *v66;
  int v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  unsigned int v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  unsigned int v86;
  __int16 v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  MCSessionPeerConnectionData *v97;
  BOOL v98;
  NSObject *v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  _QWORD *v106;
  BOOL v107;
  NSObject *v108;
  NSObject *v109;
  uint64_t v110;
  int v111;
  _QWORD *v112;
  int v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  NSObject *v121;
  const __CFString *v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  uint64_t v128;
  NSObject *v129;
  NSObject *v130;
  NSString *v131;
  char *v132;
  char *v133;
  NSObject *v134;
  int v135;
  MCSessionStream *v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  void *v144;
  int v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  MCResourceProgressObserver *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  MCResourceProgressObserver *v154;
  NSObject *v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  int v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  NSObject *v164;
  uint64_t v165;
  unsigned int v166;
  unsigned int v167;
  uint64_t v168;
  id v169;
  _QWORD v170[8];
  _QWORD v171[7];
  _QWORD v172[6];
  int v173;
  BOOL v174;
  _QWORD v175[6];
  _QWORD v176[5];
  _QWORD handler[6];
  int v178;
  int v179;
  _QWORD v180[5];
  _QWORD v181[8];
  int v182;
  _QWORD v183[8];
  _QWORD v184[8];
  _QWORD v185[7];
  _QWORD block[7];
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[5];
  int v196;
  int v197[2];
  _BYTE v198[30];
  _BYTE v199[10];
  uint64_t v200;
  __int16 v201;
  uint64_t v202;
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v6 = *(_QWORD *)&a4;
  v205 = *MEMORY[0x24BDAC8D0];
  v9 = 0x24BDD1000uLL;
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v11 = (void *)-[NSMutableDictionary objectForKey:](self->_peerIDMap, "objectForKey:", v10);
  v12 = mcs_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    var0 = a3->var0;
    if (var0 > 6)
      v24 = "?";
    else
      v24 = off_24C840B38[var0];
    var2 = a3->var2;
    var3 = a3->var3;
    *(_DWORD *)v198 = 136316162;
    *(_QWORD *)&v198[4] = v24;
    *(_WORD *)&v198[12] = 1024;
    *(_DWORD *)&v198[14] = var2;
    *(_WORD *)&v198[18] = 1024;
    *(_DWORD *)&v198[20] = var3;
    *(_WORD *)&v198[24] = 1024;
    *(_DWORD *)&v198[26] = v6;
    *(_WORD *)v199 = 2112;
    *(_QWORD *)&v199[2] = objc_msgSend(v11, "displayNameAndPID");
    _os_log_debug_impl(&dword_20DC1A000, v12, OS_LOG_TYPE_DEBUG, "Got GCK event [%s] size=%d status=%d from %08X (peer[%@]).", v198, 0x28u);
    v9 = 0x24BDD1000;
    if (v11)
      goto LABEL_3;
LABEL_24:
    if (!-[NSMutableDictionary objectForKey:](self->_connectionPendingPeerEvents, "objectForKey:", v10))
    {
      v36 = a3->var0;
      if (a3->var0 != 5)
      {
        if (v36 == 2)
        {
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            return;
          *(_DWORD *)v198 = 67109120;
          *(_DWORD *)&v198[4] = v6;
          v47 = "No peerID, no event queue for participant [%08X], peer is already disconnected.Ignoring this disconnect event.";
          goto LABEL_49;
        }
        if (v36)
        {
          v50 = mcs_log();
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            return;
          v51 = a3->var0;
          if (v51 > 6)
            v52 = "?";
          else
            v52 = off_24C840B38[v51];
          *(_DWORD *)v198 = 67109378;
          *(_DWORD *)&v198[4] = v6;
          *(_WORD *)&v198[8] = 2080;
          *(_QWORD *)&v198[10] = v52;
          v47 = "No peerID, no event queue for participant [%08X]. %s is unexpected at this point - please file a bug in "
                "\"MultipeerConnectivity\" if you see this message and something goes wrong.";
          v48 = v50;
          v49 = 18;
          goto LABEL_91;
        }
      }
      -[NSMutableDictionary setObject:forKey:](self->_connectionPendingPeerEvents, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"), v10);
      -[MCSession syncSendXDataPeerIDPushToPID:](self, "syncSendXDataPeerIDPushToPID:", v6);
      if (-[MCPeerID pid](self->_myPeerID, "pid") > v6)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        v195[0] = MEMORY[0x24BDAC760];
        v195[1] = 3221225472;
        v195[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke;
        v195[3] = &unk_24C840798;
        v195[4] = self;
        v196 = v6;
        dispatch_async(global_queue, v195);
      }
    }
    if (a3->var0 == 2)
    {
      v38 = (void *)-[NSMutableDictionary objectForKey:](self->_connectionPendingPeerEvents, "objectForKey:", v10);
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v187, v203, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v188;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v188 != v40)
              objc_enumerationMutation(v38);
            free((void *)objc_msgSend(*(id *)(*((_QWORD *)&v187 + 1) + 8 * i), "pointerValue"));
          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v187, v203, 16);
        }
        while (v39);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_connectionPendingPeerEvents, "removeObjectForKey:", v10);
    }
    else if (a3->var0 == 5)
    {
      var1 = a3->var1;
      if (*var1 == 168)
      {
        v34 = a3->var2;
        if (v34 > 3)
        {
          v53 = *((unsigned __int16 *)var1 + 1);
          v54 = __rev16(v53);
          if (v34 >= bswap32(v53) >> 16)
          {
            v64 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", var1 + 4, v54 - 4, 0));
            -[NSMutableDictionary setObject:forKey:](self->_peerIDMap, "setObject:forKey:", v64, v10);
            v65 = -[MCSessionPeerState initWithPeer:]([MCSessionPeerState alloc], "initWithPeer:", v64);
            -[MCSessionPeerState setCertificateDecision:](v65, "setCertificateDecision:", 2);
            -[NSMutableDictionary setObject:forKey:](self->_peerStates, "setObject:forKey:", v65, v64);
            v66 = mcs_log();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = -[MCSessionPeerState state](v65, "state");
              *(_DWORD *)v198 = 67109120;
              *(_DWORD *)&v198[4] = v67;
              _os_log_impl(&dword_20DC1A000, v66, OS_LOG_TYPE_DEFAULT, "Indirectly connected - dipatching callback (current state = %d).", v198, 8u);
            }
            v68 = (void *)-[NSMutableDictionary objectForKey:](self->_connectionPendingPeerEvents, "objectForKey:", v10);
            v69 = mcs_log();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              v70 = objc_msgSend(v68, "count");
              *(_DWORD *)v198 = 134218240;
              *(_QWORD *)&v198[4] = v70;
              *(_WORD *)&v198[12] = 1024;
              *(_DWORD *)&v198[14] = v6;
              _os_log_impl(&dword_20DC1A000, v69, OS_LOG_TYPE_DEFAULT, "Processing %lu saved events for pid[%08X].", v198, 0x12u);
            }
            v193 = 0u;
            v194 = 0u;
            v191 = 0u;
            v192 = 0u;
            v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v191, v204, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v192;
              do
              {
                for (j = 0; j != v71; ++j)
                {
                  if (*(_QWORD *)v192 != v72)
                    objc_enumerationMutation(v68);
                  v74 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * j), "pointerValue");
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:](self, "syncHandleNetworkEvent:pid:freeEventWhenDone:", v74, v6, 0);
                  free(v74);
                }
                v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v191, v204, 16);
              }
              while (v71);
            }
            -[NSMutableDictionary removeObjectForKey:](self->_connectionPendingPeerEvents, "removeObjectForKey:", v10);
          }
          else
          {
            v55 = mcs_log();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.2();
          }
        }
        else
        {
          v35 = mcs_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.1();
        }
      }
    }
    else
    {
      v42 = (void *)-[NSMutableDictionary objectForKey:](self->_connectionPendingPeerEvents, "objectForKey:", v10);
      objc_msgSend(v42, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3));
      v43 = mcs_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = a3->var0;
        if (v44 > 6)
          v45 = "?";
        else
          v45 = off_24C840B38[v44];
        v56 = objc_msgSend(v42, "count");
        *(_DWORD *)v198 = 136315906;
        *(_QWORD *)&v198[4] = v45;
        *(_WORD *)&v198[12] = 2048;
        *(_QWORD *)&v198[14] = a3;
        *(_WORD *)&v198[22] = 1024;
        *(_DWORD *)&v198[24] = v6;
        *(_WORD *)&v198[28] = 2048;
        *(_QWORD *)v199 = v56;
        _os_log_impl(&dword_20DC1A000, v43, OS_LOG_TYPE_DEFAULT, "Saved GCK event [%s] ([%p]) from pid[%08X] (%lu total saved).", v198, 0x26u);
      }
      if (a5)
        *a5 = 0;
    }
    return;
  }
  if (!v11)
    goto LABEL_24;
LABEL_3:
  switch(a3->var0)
  {
    case 0:
      -[MCSession syncPeer:changeStateTo:shouldForceCallback:](self, "syncPeer:changeStateTo:shouldForceCallback:", v11, 2, 0);
      return;
    case 1:
      -[MCSession syncPeer:changeStateTo:shouldForceCallback:](self, "syncPeer:changeStateTo:shouldForceCallback:", v11, 0, 0);
      return;
    case 2:
      -[MCSession syncCloseStreamsForPeer:](self, "syncCloseStreamsForPeer:", v11);
      -[MCSession syncPeer:changeStateTo:shouldForceCallback:](self, "syncPeer:changeStateTo:shouldForceCallback:", v11, 0, 0);
      return;
    case 3:
      v13 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3->var1, a3->var2);
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_378;
      block[3] = &unk_24C840680;
      block[4] = self;
      block[5] = v13;
      block[6] = v11;
      v15 = block;
      v16 = callbackQueue;
      goto LABEL_8;
    case 5:
      v17 = -[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:", v11);
      p_var2 = &a3->var2;
      if (a3->var2 <= 3)
      {
        v19 = mcs_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.4();
        return;
      }
      v25 = (void *)v17;
      v26 = a3->var1;
      v27 = *v26;
      if ((v27 & 0x80000000) == 0)
      {
        -[MCSession syncHandleXDataDataPacket:packetSize:forPeer:state:](self, "syncHandleXDataDataPacket:packetSize:forPeer:state:", v26);
        return;
      }
      v57 = mcs_log();
      v58 = v27 & 0x7F;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v59 = XDataControlTypeName(v58);
        *(_DWORD *)v198 = 136315138;
        *(_QWORD *)&v198[4] = v59;
        _os_log_impl(&dword_20DC1A000, v57, OS_LOG_TYPE_DEFAULT, "Xdata type %s.", v198, 0xCu);
      }
      if (v58 > 30)
      {
        if (v58 != 31)
        {
          if (v58 == 40)
          {
            v79 = mcs_log();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.20();
            return;
          }
          if (v58 == 41)
          {
            if (*p_var2 > 3)
            {
              v82 = *((unsigned __int16 *)v26 + 1);
              v83 = __rev16(v82);
              if (*p_var2 >= bswap32(v82) >> 16)
              {
                v97 = -[MCSessionPeerConnectionData initWithConnectionDataBlob:]([MCSessionPeerConnectionData alloc], "initWithConnectionDataBlob:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v26 + 4, v83 - 4, 0));
                if (v97)
                {
                  v98 = -[MCSession encryptionPreference](self, "encryptionPreference") != MCEncryptionNone
                     && -[MCSessionPeerConnectionData encryptionPreference](v97, "encryptionPreference") != 2;
                  v16 = dispatch_get_global_queue(0, 0);
                  v172[0] = MEMORY[0x24BDAC760];
                  v172[1] = 3221225472;
                  v172[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_400;
                  v172[3] = &unk_24C840888;
                  v173 = v6;
                  v172[4] = self;
                  v172[5] = v97;
                  v174 = v98;
                  v15 = v172;
LABEL_8:
                  dispatch_async(v16, v15);
                }
                else
                {
                  v124 = mcs_log();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
                    -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.23();
                }
              }
              else
              {
                v84 = mcs_log();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.22();
              }
            }
            else
            {
              v75 = mcs_log();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.21();
            }
            return;
          }
LABEL_110:
          v80 = mcs_log();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.5();
          return;
        }
        if (*p_var2 <= 9)
        {
          v78 = mcs_log();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.17();
          return;
        }
        if (*p_var2 < bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
        {
          v90 = mcs_log();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.18();
          return;
        }
        v116 = bswap32(*((_DWORD *)v26 + 1));
        v117 = objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", v116);
        v118 = (void *)objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "objectForKey:", v117);
        v119 = v118;
        if (v118)
        {
          if ((_DWORD)v116 != objc_msgSend(v118, "streamID"))
          {
            v130 = mcs_log();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.19(v119, v116, v130);
            return;
          }
          v120 = __rev16(*((unsigned __int16 *)v26 + 4));
          if (objc_msgSend(v119, "state") == 3)
          {
            objc_msgSend(v119, "setState:", 4);
            v121 = mcs_log();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v198 = 67109120;
              *(_DWORD *)&v198[4] = v120;
              _os_log_impl(&dword_20DC1A000, v121, OS_LOG_TYPE_DEFAULT, "Stream close done reason(%d).", v198, 8u);
            }
            if (objc_msgSend(v119, "url") && objc_msgSend(v119, "completionHandler"))
            {
              if ((_DWORD)v120)
              {
                if ((_DWORD)v120 == 1)
                {
                  v122 = CFSTR("Resource transfer cancelled.");
                  v123 = 5;
                }
                else
                {
                  v123 = 0;
                  v122 = CFSTR("Resource transfer interrupted.");
                }
                objc_msgSend((id)objc_msgSend(v119, "progress"), "cancel");
                v162 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), v123, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v122, *MEMORY[0x24BDD0FC8]));
              }
              else
              {
                v162 = 0;
              }
              v163 = (id)objc_msgSend(v119, "completionHandler");
              objc_msgSend(v119, "setCompletionHandler:", 0);
              if (v163)
              {
                v164 = self->_callbackQueue;
                v175[0] = MEMORY[0x24BDAC760];
                v175[1] = 3221225472;
                v175[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_399;
                v175[3] = &unk_24C840720;
                v175[4] = v162;
                v175[5] = v163;
                dispatch_async(v164, v175);
              }
            }
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", v117);
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(v119, "name"));
            return;
          }
          if (objc_msgSend(v119, "state") == 2)
          {
            objc_msgSend(v119, "setState:", 3);
            -[MCSession syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", v6, v116, v120);
            v138 = mcs_log();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
            {
              v139 = objc_msgSend(v119, "name");
              *(_DWORD *)v198 = 138412546;
              *(_QWORD *)&v198[4] = v139;
              *(_WORD *)&v198[12] = 1024;
              *(_DWORD *)&v198[14] = v116;
              _os_log_impl(&dword_20DC1A000, v138, OS_LOG_TYPE_DEFAULT, "Streaming: Got close from receiver for stream[%@] id[%08X].", v198, 0x12u);
            }
            if (objc_msgSend(v119, "sourceSuspended"))
              dispatch_resume((dispatch_object_t)objc_msgSend(v119, "source"));
            dispatch_source_cancel((dispatch_source_t)objc_msgSend(v119, "source"));
            objc_msgSend(v119, "setState:", 4);
            if (objc_msgSend(v119, "progress"))
              objc_msgSend((id)objc_msgSend(v119, "progress"), "cancel");
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", v117);
            objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "removeObjectForKey:", objc_msgSend(v119, "name"));
            return;
          }
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            return;
          v142 = objc_msgSend(v119, "state");
          *(_DWORD *)v198 = 67109120;
          *(_DWORD *)&v198[4] = v142;
          v47 = "Can't close outgoing stream with state %u != open.";
        }
        else
        {
          v46 = mcs_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            return;
          *(_DWORD *)v198 = 67109120;
          *(_DWORD *)&v198[4] = v116;
          v47 = "Can't close nonexistent outgoing stream [%08X].";
        }
LABEL_49:
        v48 = v46;
        v49 = 8;
LABEL_91:
        _os_log_impl(&dword_20DC1A000, v48, OS_LOG_TYPE_DEFAULT, v47, v198, v49);
        return;
      }
      if (v58 == 20)
      {
        if (*p_var2 <= 12)
        {
          v76 = mcs_log();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.6();
          return;
        }
        v85 = bswap32(*((_DWORD *)v26 + 1));
        v86 = *((unsigned __int16 *)v26 + 1);
        v87 = __rev16(v86);
        if (*p_var2 >= bswap32(v86) >> 16)
        {
          v167 = *((_DWORD *)v26 + 2);
          v169 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v26 + 12, (unsigned __int16)(v87 - 12), 4);
          if (!objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "objectForKey:", v169))
          {
            if ((v26[1] & 1) != 0)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v131 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("resource.XXXXXXXXXXXXXXXX"));
              v132 = strdup(-[NSString UTF8String](v131, "UTF8String"));
              if (!v132)
              {
                v148 = mcs_log();
                if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.9((uint64_t)v131, (uint64_t)v169, v148);
                return;
              }
              v133 = v132;
              v166 = mkstemp(v132);
              v165 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v133), 0);
              free(v133);
              v134 = mcs_log();
              if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v198 = 138412290;
                *(_QWORD *)&v198[4] = v165;
                _os_log_impl(&dword_20DC1A000, v134, OS_LOG_TYPE_DEFAULT, "Got resource (temp url = %@).", v198, 0xCu);
              }
              if (v166 == -1)
              {
                v149 = mcs_log();
                if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.10();
                return;
              }
              v135 = fcntl(v166, 3, 0);
              if (v135 != -1)
                fcntl(v166, 4, v135 | 4u);
              fcntl(v166, 73, 1);
              v136 = objc_alloc_init(MCSessionStream);
              -[MCSessionStream setName:](v136, "setName:", v169);
              -[MCSessionStream setState:](v136, "setState:", 2);
              -[MCSessionStream setPeerID:](v136, "setPeerID:", v11);
              -[MCSessionStream setStreamID:](v136, "setStreamID:", objc_msgSend(v25, "newStreamID"));
              -[MCSessionStream setFd:](v136, "setFd:", v166);
              -[MCSessionStream setUrl:](v136, "setUrl:", v165);
              if (bswap32(v167))
              {
                v137 = objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:");
              }
              else
              {
                -[MCSessionStream setProgressUnbounded:](v136, "setProgressUnbounded:", 1);
                v137 = objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 10000);
              }
              -[MCSessionStream setProgress:](v136, "setProgress:", v137);
              -[NSProgress setPausable:](-[MCSessionStream progress](v136, "progress"), "setPausable:", 0);
              v150 = [MCResourceProgressObserver alloc];
              v151 = -[MCSessionStream name](v136, "name");
              v152 = -[MCSessionStream progress](v136, "progress");
              v153 = MEMORY[0x24BDAC760];
              v185[0] = MEMORY[0x24BDAC760];
              v185[1] = 3221225472;
              v185[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_390;
              v185[3] = &unk_24C840680;
              v185[4] = self;
              v185[5] = v136;
              v185[6] = v11;
              v154 = -[MCResourceProgressObserver initWithName:progress:cancelHandler:](v150, "initWithName:progress:cancelHandler:", v151, v152, v185);
              -[MCSessionStream setObserver:](v136, "setObserver:", v154);

              -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:](self, "syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:", v6, v85, -[MCSessionStream streamID](v136, "streamID"));
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v136, v169);
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v136, objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", -[MCSessionStream streamID](v136, "streamID")));
              v155 = mcs_log();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
              {
                v168 = -[MCSessionStream progress](v136, "progress");
                v156 = -[MCSessionStream progress](v136, "progress");
                v157 = -[NSProgress totalUnitCount](-[MCSessionStream progress](v136, "progress"), "totalUnitCount");
                *(_DWORD *)v198 = 67110402;
                *(_DWORD *)&v198[4] = v85;
                *(_WORD *)&v198[8] = 2112;
                *(_QWORD *)&v198[10] = v169;
                *(_WORD *)&v198[18] = 2112;
                *(_QWORD *)&v198[20] = v11;
                *(_WORD *)&v198[28] = 2112;
                *(_QWORD *)v199 = v168;
                *(_WORD *)&v199[8] = 2048;
                v200 = v156;
                v201 = 2048;
                v202 = v157;
                _os_log_impl(&dword_20DC1A000, v155, OS_LOG_TYPE_DEFAULT, "Stream open request [%u] resource [%@] peer[%@] progress[%@]@[%p] size(%lld) - dispatching callback.", v198, 0x3Au);
              }
              v158 = self->_callbackQueue;
              v184[0] = v153;
              v184[1] = 3221225472;
              v184[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_391;
              v184[3] = &unk_24C8407C0;
              v184[4] = self;
              v184[5] = v169;
              v184[6] = v11;
              v184[7] = v136;
              dispatch_async(v158, v184);
            }
            else
            {
              if (pipe(v197))
              {
                v125 = mcs_log();
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                  -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.8();
                -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:](self, "syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:", v6, v85, 0x80000000);
                return;
              }
              v143 = v197[1];
              v144 = (void *)_CFReadStreamCreateFromFileDescriptor();
              v145 = fcntl(v143, 3, 0);
              if (v145 != -1)
                fcntl(v143, 4, v145 | 4u);
              fcntl(v143, 73, 1);
              v136 = objc_alloc_init(MCSessionStream);
              -[MCSessionStream setName:](v136, "setName:", v169);
              -[MCSessionStream setState:](v136, "setState:", 2);
              -[MCSessionStream setPeerID:](v136, "setPeerID:", v11);
              -[MCSessionStream setStreamID:](v136, "setStreamID:", objc_msgSend(v25, "newStreamID"));
              -[MCSessionStream setFd:](v136, "setFd:", v143);
              -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:](self, "syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:", v6, v85, -[MCSessionStream streamID](v136, "streamID"));
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v136, v169);
              objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "setObject:forKey:", v136, objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", -[MCSessionStream streamID](v136, "streamID")));
              v146 = mcs_log();
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v198 = 67109634;
                *(_DWORD *)&v198[4] = v85;
                *(_WORD *)&v198[8] = 2112;
                *(_QWORD *)&v198[10] = v169;
                *(_WORD *)&v198[18] = 2112;
                *(_QWORD *)&v198[20] = v11;
                _os_log_impl(&dword_20DC1A000, v146, OS_LOG_TYPE_DEFAULT, "Stream open request [%u] stream [%@] peer[%@]. Dispatching callback.", v198, 0x1Cu);
              }
              v147 = self->_callbackQueue;
              v183[0] = MEMORY[0x24BDAC760];
              v183[1] = 3221225472;
              v183[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_392;
              v183[3] = &unk_24C8407C0;
              v183[4] = self;
              v183[5] = v144;
              v183[6] = v169;
              v183[7] = v11;
              dispatch_async(v147, v183);

            }
            v159 = -[MCSessionStream fd](v136, "fd");
            v136->_source = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA30], v159, 0, (dispatch_queue_t)self->_syncQueue);
            -[MCSessionStream setIncomingBuffer:](v136, "setIncomingBuffer:", objc_msgSend(MEMORY[0x24BDBCEC8], "data"));
            v160 = -[MCSessionStream source](v136, "source");
            v161 = MEMORY[0x24BDAC760];
            v181[0] = MEMORY[0x24BDAC760];
            v181[1] = 3221225472;
            v181[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_393;
            v181[3] = &unk_24C840810;
            v181[4] = v136;
            v181[5] = self;
            v182 = v6;
            v181[6] = v11;
            v181[7] = v25;
            dispatch_source_set_event_handler(v160, v181);
            v180[0] = v161;
            v180[1] = 3221225472;
            v180[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_394;
            v180[3] = &unk_24C8407E8;
            v180[4] = v136;
            dispatch_source_set_cancel_handler((dispatch_source_t)-[MCSessionStream source](v136, "source"), v180);
            -[MCSessionStream setSourceSuspended:](v136, "setSourceSuspended:", 1);
            return;
          }
          v99 = mcs_log();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
          {
            v100 = objc_msgSend(v169, "UTF8String");
            *(_DWORD *)v198 = 136315138;
            *(_QWORD *)&v198[4] = v100;
            _os_log_impl(&dword_20DC1A000, v99, OS_LOG_TYPE_DEFAULT, "Stream open request - stream already exists %s.", v198, 0xCu);
          }
        }
        else
        {
          v88 = mcs_log();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.7();
        }
        -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:](self, "syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:", v6, v85, 0x80000000);
        return;
      }
      if (v58 == 21)
      {
        if (*p_var2 > 11)
        {
          if (*p_var2 >= bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
          {
            v101 = *((_DWORD *)v26 + 2);
            v102 = objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", bswap32(*((_DWORD *)v26 + 1)));
            v103 = bswap32(v101);
            v104 = objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", v103);
            v105 = (_QWORD *)objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "objectForKey:", v102);
            v106 = v105;
            if (v105)
            {
              v107 = objc_msgSend(v105, "state") == 1;
              v108 = mcs_log();
              v109 = v108;
              if (v107)
              {
                if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                {
                  v110 = objc_msgSend(v106, "name");
                  v111 = objc_msgSend(v106, "streamID");
                  *(_DWORD *)v198 = 138412546;
                  *(_QWORD *)&v198[4] = v110;
                  *(_WORD *)&v198[12] = 1024;
                  *(_DWORD *)&v198[14] = v111;
                  _os_log_impl(&dword_20DC1A000, v109, OS_LOG_TYPE_DEFAULT, "Streaming: Got open response stream[%@] id[%08X].", v198, 0x12u);
                }
                v112 = v106;
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "removeObjectForKey:", v102);
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreamRequests"), "removeObjectForKey:", objc_msgSend(v106, "name"));
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "setObject:forKey:", v106, v104);
                objc_msgSend((id)objc_msgSend(v25, "outgoingStreams"), "setObject:forKey:", v106, objc_msgSend(v106, "name"));
                objc_msgSend(v106, "setState:", 2);
                objc_msgSend(v106, "setStreamID:", v103);
                if (objc_msgSend(v106, "url") && (objc_msgSend((id)objc_msgSend(v106, "url"), "isFileURL") & 1) == 0)
                {
                  v141 = objc_msgSend((id)objc_msgSend(v106, "urlDownloader"), "urlResponseHandler");
                  (*(void (**)(uint64_t, uint64_t))(v141 + 16))(v141, 1);
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v106, "urlDownloader"), "urlTask"), "resume");
                }
                else
                {
                  v113 = objc_msgSend(v106, "fd");
                  v106[1] = dispatch_source_create(MEMORY[0x24BDACA00], v113, 0, (dispatch_queue_t)self->_syncQueue);
                  v114 = objc_msgSend(v106, "source");
                  v115 = MEMORY[0x24BDAC760];
                  handler[0] = MEMORY[0x24BDAC760];
                  handler[1] = 3221225472;
                  handler[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395;
                  handler[3] = &unk_24C840860;
                  handler[4] = v106;
                  handler[5] = self;
                  v178 = v6;
                  v179 = v103;
                  dispatch_source_set_event_handler(v114, handler);
                  v176[0] = v115;
                  v176[1] = 3221225472;
                  v176[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_398;
                  v176[3] = &unk_24C8407E8;
                  v176[4] = v106;
                  dispatch_source_set_cancel_handler((dispatch_source_t)objc_msgSend(v106, "source"), v176);
                  dispatch_resume((dispatch_object_t)objc_msgSend(v106, "source"));
                  objc_msgSend(v106, "setSourceSuspended:", 0);
                }
              }
              else if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              {
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.14(v106, v109);
              }
            }
            else
            {
              v126 = mcs_log();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.13();
            }
          }
          else
          {
            v89 = mcs_log();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.12();
          }
        }
        else
        {
          v77 = mcs_log();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.11();
        }
        return;
      }
      if (v58 != 30)
        goto LABEL_110;
      if (*p_var2 <= 9)
      {
        v60 = mcs_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.15();
        return;
      }
      if (*p_var2 < bswap32(*((unsigned __int16 *)v26 + 1)) >> 16)
      {
        v81 = mcs_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          -[MCSession syncHandleNetworkEvent:pid:freeEventWhenDone:].cold.16();
        return;
      }
      v91 = bswap32(*((_DWORD *)v26 + 1));
      v92 = objc_msgSend(*(id *)(v9 + 1760), "numberWithUnsignedLong:", v91);
      v93 = (void *)objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "objectForKey:", v92);
      v94 = v93;
      if (!v93)
      {
        v46 = mcs_log();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v198 = 67109120;
        *(_DWORD *)&v198[4] = v91;
        v47 = "Can't close nonexistent incoming stream %u.";
        goto LABEL_49;
      }
      v95 = __rev16(*((unsigned __int16 *)v26 + 4));
      if (objc_msgSend(v93, "state") == 3)
      {
        objc_msgSend(v94, "setState:", 4);
        v96 = mcs_log();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v198 = 67109120;
          *(_DWORD *)&v198[4] = v95;
          _os_log_impl(&dword_20DC1A000, v96, OS_LOG_TYPE_DEFAULT, "Stream close done reason(%d).", v198, 8u);
        }
        objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "removeObjectForKey:", v92);
        objc_msgSend((id)objc_msgSend(v25, "incomingStreams"), "removeObjectForKey:", objc_msgSend(v94, "name"));
        return;
      }
      if (objc_msgSend(v94, "state") != 2)
      {
        v46 = mcs_log();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          return;
        v140 = objc_msgSend(v94, "state");
        *(_DWORD *)v198 = 67109120;
        *(_DWORD *)&v198[4] = v140;
        v47 = "Can't close incoming stream with state %u != open.";
        goto LABEL_49;
      }
      objc_msgSend(v94, "setState:", 3);
      -[MCSession syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:](self, "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", objc_msgSend(v11, "pid"), objc_msgSend(v94, "streamID"), v95);
      v127 = mcs_log();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        v128 = objc_msgSend(v94, "name");
        *(_DWORD *)v198 = 138412546;
        *(_QWORD *)&v198[4] = v128;
        *(_WORD *)&v198[12] = 1024;
        *(_DWORD *)&v198[14] = v91;
        _os_log_impl(&dword_20DC1A000, v127, OS_LOG_TYPE_DEFAULT, "Streaming: Got close from sender for stream[%@] id[%08X].", v198, 0x12u);
      }
      if (!objc_msgSend((id)objc_msgSend(v94, "incomingBuffer"), "length") || (_DWORD)v95)
      {
        -[MCSession syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:](self, "syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:", v94, v11, v25, 0, v95, 0);
        return;
      }
      v129 = mcs_log();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v198 = 0;
        v47 = "XDataStreamCloseFromSender received but have more bytes to write.";
        v48 = v129;
        v49 = 2;
        goto LABEL_91;
      }
      return;
    case 6:
      v20 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:", v11);
      if (a3->var1)
      {
        *(_QWORD *)v198 = 0;
        __memcpy_chk();
        v21 = *(void **)v198;
        v22 = *(id *)v198;
      }
      else
      {
        v21 = 0;
      }
      v28 = mcs_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(v11, "displayName");
        if (v21)
          v30 = objc_msgSend(v21, "count");
        else
          v30 = 0;
        v61 = objc_msgSend(v20, "certificateDecision");
        *(_DWORD *)v198 = 138412802;
        *(_QWORD *)&v198[4] = v29;
        *(_WORD *)&v198[12] = 1024;
        *(_DWORD *)&v198[14] = v30;
        *(_WORD *)&v198[18] = 1024;
        *(_DWORD *)&v198[20] = v61;
        _os_log_impl(&dword_20DC1A000, v28, OS_LOG_TYPE_DEFAULT, "Remote certificate event for peer [%@] - certificate length [%d], certificateDecision state [%d].", v198, 0x18u);
      }
      v62 = MEMORY[0x24BDAC760];
      v171[0] = MEMORY[0x24BDAC760];
      v171[1] = 3221225472;
      v171[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_401;
      v171[3] = &unk_24C8408D8;
      v171[4] = self;
      v171[5] = v20;
      v171[6] = v11;
      v63 = (void (**)(id, uint64_t))(id)objc_msgSend(v171, "copy");
      if (objc_msgSend(v20, "certificateDecision") == 2)
      {
        v63[2](v63, 1);
        return;
      }
      if (objc_msgSend(v20, "certificateDecision") == 3)
      {
        v63[2](v63, 0);
        return;
      }
      if (objc_msgSend(v20, "certificateDecision"))
        return;
      objc_msgSend(v20, "setCertificateDecision:", 1);
      v16 = self->_callbackQueue;
      v170[0] = v62;
      v170[1] = 3221225472;
      v170[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_406;
      v170[3] = &unk_24C840900;
      v170[4] = self;
      v170[5] = v21;
      v170[6] = v11;
      v170[7] = v63;
      v15 = v170;
      goto LABEL_8;
    default:
      return;
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startConnectionWithIndirectPID:", *(unsigned int *)(a1 + 40));
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_378(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveData:fromPeer:propagate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v7);
  if (v7)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveData:fromPeer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 40), "length");
    v5 = objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
    v6 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    *(_DWORD *)buf = 138413314;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Incoming packet from [%@] (%lu) - done callback pd(%@) d(%@) prop(%d).", buf, 0x30u);
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_390(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelIncomingStream:fromPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_391(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didStartReceivingResourceWithName:fromPeer:withProgress:propagate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "progress"), &v6);
  if (v6)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStartReceivingResourceWithName:fromPeer:withProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "progress"));
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
    v5 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    *(_DWORD *)buf = 138413058;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Did start receiving resource for peer [%@] dispatched. Callback pd(%@) d(%@) prop(%d).", buf, 0x26u);
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_392(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveStream:withName:fromPeer:propagate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v7);
  if (v7)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveStream:withName:fromPeer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v5 = objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
    v6 = objc_msgSend(*(id *)(a1 + 32), "delegate");
    *(_DWORD *)buf = 138413314;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Did receive stream for peer [%@] with name [%@] dispatched. Callback pd(%@) d(%@) prop(%d).", buf, 0x30u);
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_393(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  int v23;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v26[20];
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2
    || objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    v2 = write(objc_msgSend(*(id *)(a1 + 32), "fd"), (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "bytes"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "length"));
    if (v2)
    {
      if ((v2 & 0x80000000) != 0)
      {
        if (*__error() == 35 || *__error() == 4 || *__error() == 36)
        {
          dispatch_suspend((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
          objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 1);
          v4 = dispatch_time(0, 1000000000);
          v5 = *(_QWORD *)(a1 + 32);
          v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 96);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2;
          block[3] = &unk_24C8407E8;
          block[4] = v5;
          dispatch_after(v4, v6, block);
        }
        else
        {
          v20 = mcs_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *__error();
            v22 = objc_msgSend(*(id *)(a1 + 32), "name");
            v23 = objc_msgSend(*(id *)(a1 + 32), "streamID");
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v26 = v21;
            *(_WORD *)&v26[4] = 2112;
            *(_QWORD *)&v26[6] = v22;
            *(_WORD *)&v26[14] = 1024;
            *(_DWORD *)&v26[16] = v23;
            _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "Incoming stream: error(%d) stream[%@] %08X.", buf, 0x18u);
          }
          objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
          dispatch_source_cancel((dispatch_source_t)objc_msgSend(*(id *)(a1 + 32), "source"));
          objc_msgSend(*(id *)(a1 + 40), "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", *(unsigned int *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "streamID"), 2);
        }
      }
      else
      {
        v3 = v2;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "replaceBytesInRange:withBytes:length:", 0, v2, 0, 0);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "incomingBuffer"), "length"))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
          {
            objc_msgSend(*(id *)(a1 + 40), "syncCloseIncomingStream:forPeer:state:error:reason:shouldTriggerCancelProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0, 0);
            return;
          }
          dispatch_suspend((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
          objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 1);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "progress"))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "progressUnbounded");
          v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "progress");
          v9 = v8;
          if (v7)
          {
            v10 = objc_msgSend(v8, "totalUnitCount");
            v11 = v10 - objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "progress");
            v13 = (uint64_t)((double)objc_msgSend(v12, "completedUnitCount") + (double)v11 * 0.05);
            v14 = v12;
          }
          else
          {
            v13 = objc_msgSend(v8, "completedUnitCount") + v3;
            v14 = v9;
          }
          objc_msgSend(v14, "setCompletedUnitCount:", v13);
          v15 = mcs_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount");
            v18 = (double)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
            v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount");
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)v26 = v16;
            *(_WORD *)&v26[8] = 2048;
            *(_QWORD *)&v26[10] = v17;
            *(_WORD *)&v26[18] = 2048;
            v27 = v18 / (double)v19;
            _os_log_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_DEFAULT, "Incoming stream - progress update (%lld / %lld = %.3lf).", buf, 0x20u);
          }
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
      dispatch_source_cancel((dispatch_source_t)objc_msgSend(*(id *)(a1 + 32), "source"));
      objc_msgSend(*(id *)(a1 + 40), "syncSendXDataStreamCloseFromReceiverToPID:streamID:closeReason:", *(unsigned int *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "streamID"), 1);
    }
  }
  else
  {
    dispatch_suspend((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
    objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 1);
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result == 2)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "sourceSuspended");
    if ((_DWORD)result)
    {
      dispatch_resume((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
      return objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 0);
    }
  }
  return result;
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_394(uint64_t a1)
{
  close(objc_msgSend(*(id *)(a1 + 32), "fd"));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "setSource:", 0);
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395(uint64_t a1)
{
  UInt8 *v2;
  int v3;
  int v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  unsigned int v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[6];
  int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  dispatch_suspend((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
  objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = (UInt8 *)v22 - ((AGPSessionMaximumSegmentSize(1) + 15) & 0x1FFFFFFF0);
    v3 = objc_msgSend(*(id *)(a1 + 32), "fd");
    v4 = AGPSessionMaximumSegmentSize(1);
    v5 = read(v3, v2 + 4, v4 - 4);
    if (v5)
    {
      v6 = mcs_log();
      v7 = v6;
      if ((v5 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395_cold_1(v5, v7);
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend(*(id *)(a1 + 32), "name");
          v9 = v5 + 4;
          *(_DWORD *)buf = 138412802;
          v28 = v8;
          v29 = 1024;
          v30 = v5;
          v31 = 1024;
          v32 = v5 + 4;
          _os_log_impl(&dword_20DC1A000, v7, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing stream [%@]: read %d bytes to send (total %d).", buf, 0x18u);
        }
        else
        {
          v9 = v5 + 4;
        }
        v16 = objc_msgSend(*(id *)(a1 + 32), "streamID");
        *(_DWORD *)v2 = bswap32(v16);
        *(_DWORD *)buf = 0;
        v26 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "pid");
        v22[0] = MEMORY[0x24BDAC760];
        v22[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_396;
        v22[3] = &unk_24C840838;
        v18 = *(_QWORD *)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(v17 + 80);
        v22[1] = 3221225472;
        v23 = v26;
        v24 = v5;
        v22[4] = v17;
        v22[5] = v18;
        v25 = v16;
        if (AGPSessionSendTo(v19, &v26, 1, v2, v9, (uint64_t)buf, 0, 0xAu, 1, v22))
        {
          v20 = mcs_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395_cold_2();
        }
        if (objc_msgSend(*(id *)(a1 + 32), "progress"))
        {
          v21 = (void *)objc_msgSend(*(id *)(a1 + 32), "progress");
          objc_msgSend(v21, "setCompletedUnitCount:", objc_msgSend(v21, "completedUnitCount") + v5);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
      dispatch_resume((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
      dispatch_source_cancel((dispatch_source_t)objc_msgSend(*(id *)(a1 + 32), "source"));
      objc_msgSend(*(id *)(a1 + 40), "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), 0);
      v13 = mcs_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(*(id *)(a1 + 32), "name");
        v15 = objc_msgSend(*(id *)(a1 + 32), "streamID");
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        v29 = 1024;
        v30 = v15;
        _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Streaming: closing stream[%@] %08X.", buf, 0x12u);
      }
    }
  }
  else
  {
    v10 = mcs_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "name");
      v12 = objc_msgSend(*(id *)(a1 + 32), "streamID");
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      v29 = 1024;
      v30 = v12;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "Streaming: stream not open for sending [%@] %08X.", buf, 0x12u);
    }
  }
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_396(int8x16_t *a1)
{
  int8x16_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  int8x16_t v5;
  uint64_t v6;
  __int32 v7;

  v4[1] = 3221225472;
  v6 = a1[3].i64[0];
  v1 = vextq_s8(a1[2], a1[2], 8uLL);
  v2 = a1[2].i64[0];
  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_397;
  v4[3] = &unk_24C840838;
  v3 = *(NSObject **)(v2 + 96);
  v5 = v1;
  v7 = a1[3].i32[2];
  dispatch_async(v3, v4);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_397(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t result;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v4 = *(_DWORD *)(a1 + 52) + 4;
    v5 = objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = objc_msgSend(*(id *)(a1 + 32), "state");
    v9[0] = 67109890;
    v9[1] = v3;
    v10 = 1024;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 1024;
    v15 = v6;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing stream source to participant [%08X]: segment (%d) put on wire for stream [%@] state [%d].", (uint8_t *)v9, 0x1Eu);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "progress")
    && (v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount"),
        v7 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "totalUnitCount")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    dispatch_resume((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
    dispatch_source_cancel((dispatch_source_t)objc_msgSend(*(id *)(a1 + 32), "source"));
    return objc_msgSend(*(id *)(a1 + 40), "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "source");
    if (result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "state");
      if ((_DWORD)result == 2)
      {
        dispatch_resume((dispatch_object_t)objc_msgSend(*(id *)(a1 + 32), "source"));
        return objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 0);
      }
    }
  }
  return result;
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_398(uint64_t a1)
{
  close(objc_msgSend(*(id *)(a1 + 32), "fd"));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "setSource:", 0);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_399(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_400(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 48);
  if (v2 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pid"))
    objc_msgSend(*(id *)(a1 + 32), "startConnectionWithIndirectPID:", *(unsigned int *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v4 = *(_DWORD *)(a1 + 48);
  v5 = objc_msgSend(*(id *)(a1 + 40), "hasIdentitySet");
  v6 = *(unsigned __int8 *)(a1 + 52);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gckSessionConnectionData"), "bytes");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gckSessionConnectionData"), "length");
  v7 = GCKSessionEstablishConnection(v3, v4, v5, v6);
  if (v7 < 0)
  {
    v8 = v7;
    v9 = mcs_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Mesh establishment failed (%08lX).", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_401(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  _QWORD v10[5];
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_402;
  v10[3] = &unk_24C8408B0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  v10[1] = 3221225472;
  v10[4] = v4;
  v11 = a2;
  dispatch_async(v5, v10);
  v6 = mcs_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(a1 + 48), "displayName");
    v8 = "NOT accepted";
    if (a2)
      v8 = "accepted";
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_20DC1A000, v6, OS_LOG_TYPE_DEFAULT, "Certificate from peer [%@] is %s.", buf, 0x16u);
  }
  return GCKSessionCertificateDecision(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), objc_msgSend(*(id *)(a1 + 48), "pid"), a2);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_2_402(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 2;
  else
    v1 = 3;
  return objc_msgSend(*(id *)(a1 + 32), "setCertificateDecision:", v1);
}

uint64_t __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_406(uint64_t a1)
{
  uint64_t result;
  char v3;

  v3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "privateDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "privateDelegate"), "session:didReceiveCertificate:fromPeer:certificateHandler:propagate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v3), v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReceiveCertificate:fromPeer:certificateHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    else
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  return result;
}

- (MCSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCSession;
  -[MCSession doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCSession)initWithPeer:(MCPeerID *)myPeerID
{
  return -[MCSession initWithPeer:securityIdentity:encryptionPreference:](self, "initWithPeer:securityIdentity:encryptionPreference:", myPeerID, 0, dyld_get_program_sdk_version() >> 16 > 8);
}

- (MCSession)initWithPeer:(MCPeerID *)myPeerID securityIdentity:(NSArray *)identity encryptionPreference:(MCEncryptionPreference)encryptionPreference
{
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  objc_class *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)MCSession;
  v8 = -[MCSession init](&v26, sel_init);
  if (!v8)
    return (MCSession *)v8;
  if (!myPeerID)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = (objc_class *)objc_opt_class();
    objc_msgSend(v9, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("A nil %@ object passed to %@"), v11, NSStringFromClass(v12));
  }
  *((_QWORD *)v8 + 9) = 0xFFFFFFFFLL;
  *((_QWORD *)v8 + 10) = 0xFFFFFFFFLL;
  *((_QWORD *)v8 + 17) = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "UUIDString");
  v13 = -[MCPeerID pid](myPeerID, "pid");
  *((_DWORD *)v8 + 10) = v13;
  if (GCKSessionCreate(v13, identity, (uint64_t)GCKEventListenerForMCSession, (uint64_t)v8, *((const void **)v8 + 17), (_QWORD *)v8 + 9))
  {
    v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:].cold.3();
LABEL_13:
    if (*((_QWORD *)v8 + 10) != 0xFFFFFFFFLL)
      AGPSessionRelease();
    if (*((_QWORD *)v8 + 9) != 0xFFFFFFFFLL)
      GCKSessionRelease();
    v17 = *((_QWORD *)v8 + 12);
    if (v17)
      dispatch_release(v17);
    v18 = *((_QWORD *)v8 + 15);
    if (v18)
      dispatch_release(v18);

    return 0;
  }
  *((_QWORD *)v8 + 12) = dispatch_queue_create("com.apple.MCSession.syncQueue", 0);
  *((_QWORD *)v8 + 15) = dispatch_queue_create("com.apple.MCSession.callbackQueue", 0);
  if (AGPSessionCreate(*((_QWORD *)v8 + 9), *((_DWORD *)v8 + 10), (uint64_t)AGPEventListenerForMCSession, (uint64_t)v8, (uint64_t *)v8 + 10))
  {
    v15 = mcs_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:].cold.2();
    goto LABEL_13;
  }
  if (GCKSessionStartEventCallbacks())
  {
    v16 = mcs_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MCSession initWithPeer:securityIdentity:encryptionPreference:].cold.1();
    goto LABEL_13;
  }
  *((_QWORD *)v8 + 6) = -[MCPeerID copy](myPeerID, "copy");
  *((_QWORD *)v8 + 7) = -[NSArray copy](identity, "copy");
  *((_QWORD *)v8 + 8) = encryptionPreference;
  *((_QWORD *)v8 + 11) = objc_alloc_init(MEMORY[0x24BDBCED8]);
  *((_QWORD *)v8 + 13) = objc_alloc_init(MEMORY[0x24BDBCED8]);
  *((_QWORD *)v8 + 14) = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = mcs_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *((_QWORD *)v8 + 17);
    v22 = objc_msgSend(*((id *)v8 + 6), "displayNameAndPID");
    if (*((_QWORD *)v8 + 7))
      v23 = "yes";
    else
      v23 = "no";
    v24 = objc_msgSend(v8, "stringForEncryptionPreference:", *((_QWORD *)v8 + 8));
    *(_DWORD *)buf = 136316418;
    v28 = "Aug  3 2024";
    v29 = 2080;
    v30 = "10:07:59";
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    v35 = 2080;
    v36 = v23;
    v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, "MCSession init done! [MCS: %s - %s, sessionID=%@ peerID=%@ securityIdentity=%s encryptionPreference=%@].", buf, 0x3Eu);
  }
  objc_initWeak((id *)buf, v8);
  objc_copyWeak(&v25, (id *)buf);
  *((_QWORD *)v8 + 16) = os_state_add_handler();
  objc_msgSend(v8, "logSessionInfo");
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
  return (MCSession *)v8;
}

uint64_t __64__MCSession_initWithPeer_securityIdentity_encryptionPreference___block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "syncStateCapture");
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_agpSession != (OpaqueAGPSession *)0xFFFFFFFFLL)
    AGPSessionRelease();
  if (self->_gckSession != (OpaqueGCKSession *)0xFFFFFFFFLL)
    GCKSessionRelease();
  v3 = (void *)-[NSMutableDictionary allValues](self->_peerStates, "allValues");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[MCSession syncCloseStreamsForPeer:](self, "syncCloseStreamsForPeer:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "peerID"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_privateDelegate, 0);
  v8.receiver = self;
  v8.super_class = (Class)MCSession;
  -[MCSession dealloc](&v8, sel_dealloc);
}

- (void)syncGetConnectionDataForPeerState:(id)a3 completionHandler:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  NSObject *callbackQueue;
  _QWORD block[7];
  int v12;
  void *v13;

  v13 = 0;
  v12 = 1350;
  if ((GCKSessionPrepareConnection((uint64_t)self->_gckSession, objc_msgSend((id)objc_msgSend(a3, "peerID"), "pid")) & 0x80000000) == 0)
  {
    v7 = +[MCSessionPeerConnectionData connectionDataSegmentWithEncryptionPreference:identitySet:gckSessionConnectionDataBytes:gckSessionConnectionDataLength:](MCSessionPeerConnectionData, "connectionDataSegmentWithEncryptionPreference:identitySet:gckSessionConnectionDataBytes:gckSessionConnectionDataLength:", -[MCSession encryptionPreference](self, "encryptionPreference"), -[MCSession securityIdentity](self, "securityIdentity") != 0, v13, v12);
    free(v13);
LABEL_4:
    objc_msgSend(a3, "setNearbyConnectionData:", v7);
    v8 = 0;
    v9 = v7;
    goto LABEL_5;
  }
  v8 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unable to create connection data."), *MEMORY[0x24BDD0FC8]));
  v7 = 0;
  v9 = 0;
  if (!v8)
    goto LABEL_4;
LABEL_5:
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__MCSession_syncGetConnectionDataForPeerState_completionHandler___block_invoke;
  block[3] = &unk_24C840950;
  block[5] = v8;
  block[6] = a4;
  block[4] = v9;
  dispatch_async(callbackQueue, block);
}

uint64_t __65__MCSession_syncGetConnectionDataForPeerState_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)nearbyConnectionDataForPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler
{
  id v6;
  NSObject *syncQueue;
  _QWORD block[7];

  v6 = (id)objc_msgSend(completionHandler, "copy");
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke;
  block[3] = &unk_24C840978;
  block[4] = self;
  block[5] = peerID;
  block[6] = v6;
  dispatch_async(syncQueue, block);
}

void __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke(uint64_t a1)
{
  MCSessionPeerState *v2;
  MCSessionPeerState *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = (MCSessionPeerState *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    if (-[MCSessionPeerState nearbyConnectionData](v2, "nearbyConnectionData"))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke_2;
      v6[3] = &unk_24C840720;
      v5 = *(_QWORD *)(a1 + 48);
      v6[4] = v3;
      v6[5] = v5;
      dispatch_async(v4, v6);
      return;
    }
  }
  else
  {
    v3 = -[MCSessionPeerState initWithPeer:]([MCSessionPeerState alloc], "initWithPeer:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 40), "pid")));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "syncPeer:changeStateTo:shouldForceCallback:", *(_QWORD *)(a1 + 40), 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "syncGetConnectionDataForPeerState:completionHandler:", v3, *(_QWORD *)(a1 + 48));
}

uint64_t __63__MCSession_nearbyConnectionDataForPeer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "nearbyConnectionData"), 0);
}

- (BOOL)isEncryptionPreferenceCompatible:(int64_t)a3
{
  MCEncryptionPreference v5;
  MCEncryptionPreference v7;

  v5 = -[MCSession encryptionPreference](self, "encryptionPreference");
  if (a3 == 1 && v5 == MCEncryptionNone)
    return 0;
  v7 = -[MCSession encryptionPreference](self, "encryptionPreference");
  return a3 != 2 || v7 != MCEncryptionRequired;
}

- (void)syncConnectPeer:(id)a3 withConnectionData:(id)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  MCSessionPeerConnectionData *v11;
  MCSessionPeerConnectionData *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  OpaqueGCKSession *gckSession;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:");
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "state") != 1)
    {
      v9 = mcs_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v28) = 0;
      v10 = "Peer needs to be in Connecting state to connect.";
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "connectPeerCalled"))
    {
      v9 = mcs_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v28) = 0;
      v10 = "ConnectPeer already called.";
LABEL_12:
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v28, 2u);
      return;
    }
  }
  v11 = -[MCSessionPeerConnectionData initWithConnectionDataBlob:]([MCSessionPeerConnectionData alloc], "initWithConnectionDataBlob:", a4);
  if (v11)
  {
    v12 = v11;
    if (-[MCSession isEncryptionPreferenceCompatible:](self, "isEncryptionPreferenceCompatible:", -[MCSessionPeerConnectionData encryptionPreference](v11, "encryptionPreference")))
    {
      v13 = -[MCSession encryptionPreference](self, "encryptionPreference") != MCEncryptionNone
         && -[MCSessionPeerConnectionData encryptionPreference](v12, "encryptionPreference") != 2;
      gckSession = self->_gckSession;
      v17 = objc_msgSend(a3, "pid");
      v18 = -[MCSessionPeerConnectionData hasIdentitySet](v12, "hasIdentitySet");
      -[NSData bytes](-[MCSessionPeerConnectionData gckSessionConnectionData](v12, "gckSessionConnectionData"), "bytes");
      -[NSData length](-[MCSessionPeerConnectionData gckSessionConnectionData](v12, "gckSessionConnectionData"), "length");
      v19 = GCKSessionEstablishConnection((uint64_t)gckSession, v17, v18, v13);
      if ((v19 & 0x80000000) == 0)
      {
        objc_msgSend(v8, "setConnectPeerCalled:", 1);
        return;
      }
      v20 = v19;
      v21 = mcs_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MCSession syncConnectPeer:withConnectionData:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      v15 = mcs_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v28 = 138412546;
        v29 = objc_msgSend(a3, "displayName");
        v30 = 2112;
        v31 = -[MCSession stringForEncryptionPreference:](self, "stringForEncryptionPreference:", -[MCSessionPeerConnectionData encryptionPreference](v12, "encryptionPreference"));
        _os_log_error_impl(&dword_20DC1A000, v15, OS_LOG_TYPE_ERROR, "Peer [%@] has incompatible encryption preference [%@].", (uint8_t *)&v28, 0x16u);
      }
    }
  }
  else
  {
    v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MCSession syncConnectPeer:withConnectionData:].cold.1(a3, v14);
  }
  -[MCSession syncPeer:changeStateTo:shouldForceCallback:](self, "syncPeer:changeStateTo:shouldForceCallback:", a3, 0, 0);
}

- (void)connectPeer:(MCPeerID *)peerID withNearbyConnectionData:(NSData *)data
{
  void *v6;
  NSObject *syncQueue;
  _QWORD block[7];

  v6 = (void *)-[NSData copy](data, "copy");
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__MCSession_connectPeer_withNearbyConnectionData___block_invoke;
  block[3] = &unk_24C840680;
  block[4] = self;
  block[5] = peerID;
  block[6] = v6;
  dispatch_async(syncQueue, block);

}

uint64_t __50__MCSession_connectPeer_withNearbyConnectionData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncConnectPeer:withConnectionData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)cancelConnectPeer:(MCPeerID *)peerID
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__MCSession_cancelConnectPeer___block_invoke;
  v4[3] = &unk_24C840658;
  v4[4] = self;
  v4[5] = peerID;
  dispatch_async(syncQueue, v4);
}

uint64_t __31__MCSession_cancelConnectPeer___block_invoke(uint64_t a1)
{
  return GCKSessionDisposeConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), objc_msgSend(*(id *)(a1 + 40), "pid"));
}

- (void)syncSendData:(id)a3 toPeers:(id)a4 withDataMode:(int64_t)a5
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v18 = a5;
  v7 = a5 == 1;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v20 = 0;
        LODWORD(v20) = objc_msgSend(v12, "pid");
        v13 = mcs_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(a3, "length");
          *(_DWORD *)buf = 134218496;
          v26 = v14;
          v27 = 1024;
          v28 = v20;
          v29 = 1024;
          v30 = v18;
          _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Sending %ld bytes of data to participant %u, mode=%d.", buf, 0x18u);
        }
        v15 = AGPSessionSendTo((uint64_t)self->_agpSession, (int *)&v20, 1, (UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), (uint64_t)&v20 + 4, v7, 5u, 1, 0);
        if (v15)
        {
          v16 = v15;
          v17 = mcs_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v26) = v16;
            _os_log_error_impl(&dword_20DC1A000, v17, OS_LOG_TYPE_ERROR, "AGPSendTo failed with status=%08X.", buf, 8u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }
}

- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peerIDs withMode:(MCSessionSendDataMode)mode error:(NSError *)error
{
  uint64_t v10;
  void *v11;
  NSObject *syncQueue;
  uint64_t v13;
  BOOL v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  NSObject *v23;
  _QWORD v25[8];
  _QWORD block[8];
  uint8_t v27[8];
  uint8_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = -[NSData copy](data, "copy");
  if (v10)
  {
    v11 = (void *)v10;
    if (-[NSArray count](peerIDs, "count"))
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      *(_QWORD *)v27 = 0;
      v28 = v27;
      v29 = 0x3052000000;
      v30 = __Block_byref_object_copy_;
      v31 = __Block_byref_object_dispose_;
      v32 = 0;
      v32 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      syncQueue = self->_syncQueue;
      v13 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__MCSession_sendData_toPeers_withMode_error___block_invoke;
      block[3] = &unk_24C8409A0;
      block[4] = peerIDs;
      block[5] = self;
      block[6] = &v33;
      block[7] = v27;
      dispatch_sync(syncQueue, block);
      v14 = *((_BYTE *)v34 + 24) == 0;
      if (*((_BYTE *)v34 + 24))
      {
        if (error)
        {
          v15 = (void *)MEMORY[0x24BDD17C8];
          if ((unint64_t)objc_msgSend(*((id *)v28 + 5), "count") <= 1)
            v16 = CFSTR("Peers");
          else
            v16 = CFSTR("Peer");
          v17 = objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@ not connected"), v16, objc_msgSend((id)objc_msgSend(*((id *)v28 + 5), "valueForKey:", CFSTR("displayName")), "componentsJoinedByString:", CFSTR(", ")));
          *error = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v17, *MEMORY[0x24BDD0FC8]));
        }
        v18 = mcs_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend((id)objc_msgSend(*((id *)v28 + 5), "valueForKey:", CFSTR("displayName")), "componentsJoinedByString:", CFSTR(", "));
          *(_DWORD *)buf = 138412290;
          v38 = v19;
          _os_log_impl(&dword_20DC1A000, v18, OS_LOG_TYPE_DEFAULT, "Failed to send data because recipients %@ are not connected.", buf, 0xCu);
        }

      }
      else
      {
        v22 = -[NSArray copyDeep_MC](peerIDs, "copyDeep_MC");
        v23 = self->_syncQueue;
        v25[0] = v13;
        v25[1] = 3221225472;
        v25[2] = __45__MCSession_sendData_toPeers_withMode_error___block_invoke_439;
        v25[3] = &unk_24C8409C8;
        v25[4] = self;
        v25[5] = v11;
        v25[6] = v22;
        v25[7] = mode;
        dispatch_async(v23, v25);

      }
      _Block_object_dispose(v27, 8);
      _Block_object_dispose(&v33, 8);
      return v14;
    }
    if (error)
      *error = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Invalid peerIDs parameter."), *MEMORY[0x24BDD0FC8]));

    v20 = mcs_log();
    v14 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      v21 = "Failed to send data because no recipients are specified.";
      goto LABEL_20;
    }
  }
  else
  {
    if (error)
      *error = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Invalid data parameter."), *MEMORY[0x24BDD0FC8]));
    v20 = mcs_log();
    v14 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      v21 = "Failed to send data because data is nil.";
LABEL_20:
      _os_log_impl(&dword_20DC1A000, v20, OS_LOG_TYPE_DEFAULT, v21, v27, 2u);
      return 0;
    }
  }
  return v14;
}

uint64_t __45__MCSession_sendData_toPeers_withMode_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)a1[4];
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 104), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6)), "state") != 2)
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", a1[4]);
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __45__MCSession_sendData_toPeers_withMode_error___block_invoke_439(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncSendData:toPeers:withDataMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (NSArray)connectedPeers
{
  NSArray *v3;
  NSObject *syncQueue;
  _QWORD v6[6];

  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__MCSession_connectedPeers__block_invoke;
  v6[3] = &unk_24C840658;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(syncQueue, v6);
  return v3;
}

uint64_t __27__MCSession_connectedPeers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (objc_msgSend(v7, "state") == 2)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(v7, "peerID"));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (NSProgress)sendResourceAtURL:(NSURL *)resourceURL withName:(NSString *)resourceName toPeer:(MCPeerID *)peerID withCompletionHandler:(void *)completionHandler
{
  MCSessionStream *v11;
  NSObject *syncQueue;
  uint64_t v13;
  NSObject *v14;
  NSObject *callbackQueue;
  NSObject *v16;
  _QWORD *v17;
  NSObject *v18;
  NSObject *v19;
  NSProgress *v20;
  void *v22;
  NSObject *v23;
  NSProgress *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[7];
  _QWORD v29[5];
  _QWORD v30[8];
  _QWORD v31[9];
  _QWORD v32[7];
  _QWORD v33[5];
  _QWORD v34[7];
  _QWORD v35[5];
  _QWORD block[10];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v11 = objc_alloc_init(MCSessionStream);
  -[MCSessionStream setProgress:](v11, "setProgress:", objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 0));
  -[MCSessionStream setUrl:](v11, "setUrl:", resourceURL);
  -[MCSessionStream setName:](v11, "setName:", resourceName);
  syncQueue = self->_syncQueue;
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke;
  block[3] = &unk_24C8409F0;
  block[4] = self;
  block[5] = peerID;
  block[8] = &v41;
  block[9] = &v37;
  block[6] = resourceName;
  block[7] = v11;
  dispatch_sync(syncQueue, block);
  if (*((_BYTE *)v42 + 24))
  {
    v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:].cold.3();
    callbackQueue = self->_callbackQueue;
    v35[0] = v13;
    v35[1] = 3221225472;
    v35[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_440;
    v35[3] = &unk_24C840A18;
    v35[4] = completionHandler;
    dispatch_async(callbackQueue, v35);
    v16 = self->_syncQueue;
    v34[0] = v13;
    v34[1] = 3221225472;
    v34[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2;
    v34[3] = &unk_24C840680;
    v34[4] = self;
    v34[5] = peerID;
    v34[6] = resourceName;
    v17 = v34;
  }
  else
  {
    if (!*((_BYTE *)v38 + 24))
    {
      if (-[NSURL isFileURL](resourceURL, "isFileURL"))
      {
        v22 = (void *)-[NSString copy](resourceName, "copy");
        -[MCSessionStream setCompletionHandler:](v11, "setCompletionHandler:", completionHandler);
        v23 = self->_syncQueue;
        v31[0] = v13;
        v31[1] = 3221225472;
        v31[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3;
        v31[3] = &unk_24C8406F8;
        v31[4] = resourceURL;
        v31[5] = self;
        v31[6] = v11;
        v31[7] = v22;
        v31[8] = peerID;
        dispatch_async(v23, v31);

        v24 = -[MCSessionStream progress](v11, "progress");
      }
      else
      {
        if (!-[NSString hasPrefix:](-[NSURL scheme](resourceURL, "scheme"), "hasPrefix:", CFSTR("http"))
          && !-[NSString hasPrefix:](-[NSURL scheme](resourceURL, "scheme"), "hasPrefix:", CFSTR("https")))
        {
          v26 = mcs_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:].cold.1();
          v27 = self->_callbackQueue;
          v29[0] = v13;
          v29[1] = 3221225472;
          v29[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_460;
          v29[3] = &unk_24C840A18;
          v29[4] = completionHandler;
          dispatch_async(v27, v29);
          v16 = self->_syncQueue;
          v28[0] = v13;
          v28[1] = 3221225472;
          v28[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_463;
          v28[3] = &unk_24C840680;
          v28[4] = self;
          v28[5] = peerID;
          v28[6] = resourceName;
          v17 = v28;
          goto LABEL_9;
        }
        -[MCSessionStream setCompletionHandler:](v11, "setCompletionHandler:", completionHandler);
        v25 = self->_syncQueue;
        v30[0] = v13;
        v30[1] = 3221225472;
        v30[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_458;
        v30[3] = &unk_24C8407C0;
        v30[4] = self;
        v30[5] = resourceURL;
        v30[6] = v11;
        v30[7] = peerID;
        dispatch_async(v25, v30);
        v24 = -[MCSessionStream progress](v11, "progress");
      }
      v20 = v24;
      goto LABEL_10;
    }
    v18 = mcs_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:].cold.2();
    v19 = self->_callbackQueue;
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_443;
    v33[3] = &unk_24C840A18;
    v33[4] = completionHandler;
    dispatch_async(v19, v33);
    v16 = self->_syncQueue;
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_446;
    v32[3] = &unk_24C840680;
    v32[4] = self;
    v32[5] = peerID;
    v32[6] = resourceName;
    v17 = v32;
  }
LABEL_9:
  dispatch_async(v16, v17);
  v20 = 0;
LABEL_10:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  return v20;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  result = objc_msgSend(v2, "state");
  if (result != 2)
  {
    v4 = a1[8];
    goto LABEL_6;
  }
  result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreams"), "objectForKey:", a1[6]);
  if (result || (result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", a1[6])) != 0)
  {
    v4 = a1[9];
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
    return result;
  }
  return objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "setObject:forKey:", a1[7], a1[6]);
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_440(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Peer not connected."), *MEMORY[0x24BDD0FC8]));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests"), "removeObjectForKey:", a1[6]);
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_443(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Resource with same name already exists."), *MEMORY[0x24BDD0FC8]));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_446(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests"), "removeObjectForKey:", a1[6]);
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  MCResourceProgressObserver *v16;
  uint64_t v17;
  uint64_t v18;
  MCResourceProgressObserver *v19;
  _QWORD v20[4];
  __int128 v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD block[5];
  stat v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = open((const char *)objc_msgSend(*(id *)(a1 + 32), "fileSystemRepresentation"), 0);
  v4 = MEMORY[0x24BDAC760];
  if ((_DWORD)v3 == -1)
  {
    v13 = mcs_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_1(v2, v13);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_450;
    v23[3] = &unk_24C8407E8;
    v23[4] = v14;
    dispatch_async(v15, v23);
  }
  else
  {
    v5 = v3;
    memset(&v25, 0, sizeof(v25));
    if (fstat(v3, &v25) == -1)
    {
      close(v5);
      v6 = mcs_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_2(v6);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_447;
      block[3] = &unk_24C8407E8;
      block[4] = v7;
      dispatch_async(v8, block);
    }
    v9 = fcntl(v5, 3, 0);
    if (v9 != -1)
      fcntl(v5, 4, v9 | 4u);
    fcntl(v5, 73, 1);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "progress"), "setTotalUnitCount:", v25.st_size);
    v10 = mcs_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "progress"), "totalUnitCount");
      *(_DWORD *)buf = 138412546;
      v27 = v11;
      v28 = 2048;
      v29 = v12;
      _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "About to send file [%@] of size [%lld].", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "syncStartStreamWithName:toPeer:mcFD:isResource:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5, 1);
  }
  v16 = [MCResourceProgressObserver alloc];
  v17 = objc_msgSend(*(id *)(a1 + 48), "name");
  v18 = objc_msgSend(*(id *)(a1 + 48), "progress");
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_453;
  v20[3] = &unk_24C840680;
  v21 = *(_OWORD *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 64);
  v19 = -[MCResourceProgressObserver initWithName:progress:cancelHandler:](v16, "initWithName:progress:cancelHandler:", v17, v18, v20);
  objc_msgSend(*(id *)(a1 + 48), "setObserver:", v19);

}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_447(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Failed to stat file."), *MEMORY[0x24BDD0FC8]));
  result = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  if (result)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
    return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_450(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Cannot open file."), *MEMORY[0x24BDD0FC8]));
  result = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  if (result)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
    return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_453(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelOutgoingStream:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_458(uint64_t a1)
{
  MCResourceProgressObserver *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 48), "setUrlDownloader:", -[MCResourceDownloader initWithSession:resourceUrl:name:peerID:]([MCResourceDownloader alloc], "initWithSession:resourceUrl:name:peerID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "name"), *(_QWORD *)(a1 + 56)));
  v2 = [MCResourceProgressObserver alloc];
  v3 = objc_msgSend(*(id *)(a1 + 48), "name");
  v4 = objc_msgSend(*(id *)(a1 + 48), "progress");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_24C840680;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 48), "setObserver:", -[MCResourceProgressObserver initWithName:progress:cancelHandler:](v2, "initWithName:progress:cancelHandler:", v3, v4, v6));
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelOutgoingStream:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_460(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 3, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unsupported resource type."), *MEMORY[0x24BDD0FC8]));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

uint64_t __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_2_463(_QWORD *a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]), "outgoingStreamRequests"), "removeObjectForKey:", a1[6]);
}

- (void)disconnect
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = mcs_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20DC1A000, v2, OS_LOG_TYPE_DEFAULT, "Disconnecting from session.", v3, 2u);
  }
  GCKSessionDisposeAllConnections();
}

- (void)syncStartStreamWithName:(id)a3 toPeer:(id)a4 mcFD:(int)a5 isResource:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  unsigned __int16 v18;
  char *v19;
  char *v20;
  MCSessionStream *v21;
  NSObject *v22;
  MCSessionStream *v23;
  unsigned int v24;
  char v25;
  NSObject *v26;
  unsigned int v27;
  NSObject *v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  id v36;
  uint64_t v37;

  v6 = a6;
  v37 = *MEMORY[0x24BDAC8D0];
  v11 = -[NSMutableDictionary objectForKey:](self->_peerStates, "objectForKey:", a4);
  if (!v11)
  {
    NSLog(CFSTR("Unknown peer [%@]."), a4);
    v17 = mcs_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MCSession syncStartStreamWithName:toPeer:mcFD:isResource:].cold.1();
    goto LABEL_13;
  }
  v12 = (void *)v11;
  v13 = (const char *)objc_msgSend(a3, "UTF8String");
  v14 = strlen(v13);
  v15 = v14;
  if (v14 >= 0x8000)
  {
    NSLog(CFSTR("Stream name [%@] too long."), a3);
    v16 = mcs_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v34 = a3;
      _os_log_impl(&dword_20DC1A000, v16, OS_LOG_TYPE_DEFAULT, "Stream name [%@] too long.", buf, 0xCu);
    }
LABEL_12:
    objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "removeObjectForKey:", a3);
LABEL_13:
    close(a5);
    return;
  }
  v18 = v14 + 12;
  v19 = (char *)malloc_type_malloc((unsigned __int16)(v14 + 12), 0x384BA6EFuLL);
  if (!v19)
  {
    NSLog(CFSTR("Out of memory (allocating %u bytes)."), v18);
    v22 = mcs_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataPeerIDPushToPID:].cold.1();
    goto LABEL_12;
  }
  v20 = v19;
  v30 = a5;
  if (v6)
    v21 = (MCSessionStream *)objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "objectForKey:", a3);
  else
    v21 = objc_alloc_init(MCSessionStream);
  v23 = v21;
  *v20 = -108;
  v20[1] = v6;
  v29 = v18;
  v20[2] = HIBYTE(v18);
  v20[3] = v18;
  v24 = objc_msgSend(v12, "newStreamOpenRequestID");
  *((_DWORD *)v20 + 1) = bswap32(v24);
  if (v6)
  {
    v20[8] = -[NSProgress totalUnitCount](-[MCSessionStream progress](v23, "progress"), "totalUnitCount") >> 24;
    v20[9] = -[NSProgress totalUnitCount](-[MCSessionStream progress](v23, "progress"), "totalUnitCount") >> 16;
    v20[10] = (unsigned __int16)-[NSProgress totalUnitCount](-[MCSessionStream progress](v23, "progress"), "totalUnitCount") >> 8;
    v25 = -[NSProgress totalUnitCount](-[MCSessionStream progress](v23, "progress"), "totalUnitCount");
  }
  else
  {
    v25 = 0;
    v20[10] = 0;
    *((_WORD *)v20 + 4) = 0;
  }
  v20[11] = v25;
  memcpy(v20 + 12, v13, v15);
  v32 = 0;
  v31 = objc_msgSend(a4, "pid");
  if (AGPSessionSendTo((uint64_t)self->_agpSession, &v31, 1, (UInt8 *)v20, v29, (uint64_t)&v32, 0, 0xAu, 1, 0))
  {
    v26 = mcs_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MCSession syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:].cold.2();
  }
  -[MCSessionStream setName:](v23, "setName:", a3);
  -[MCSessionStream setPeerID:](v23, "setPeerID:", a4);
  -[MCSessionStream setState:](v23, "setState:", 1);
  -[MCSessionStream setFd:](v23, "setFd:", v30);
  v27 = v24;
  objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "setObject:forKey:", v23, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v24));
  objc_msgSend((id)objc_msgSend(v12, "outgoingStreamRequests"), "setObject:forKey:", v23, a3);
  v28 = mcs_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v34 = v27;
    *(_WORD *)&v34[4] = 2112;
    *(_QWORD *)&v34[6] = a3;
    v35 = 2112;
    v36 = a4;
    _os_log_impl(&dword_20DC1A000, v28, OS_LOG_TYPE_DEFAULT, "Streaming: sent open request: requestID[%u] stream[%@] peer[%@].", buf, 0x1Cu);
  }
  free(v20);
}

- (NSOutputStream)startStreamWithName:(NSString *)streamName toPeer:(MCPeerID *)peerID error:(NSError *)error
{
  NSObject *v9;
  NSOutputStream *v10;
  NSObject *syncQueue;
  uint64_t v12;
  NSObject *v13;
  NSError *v14;
  NSObject *v15;
  NSObject *v16;
  int *v17;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSError *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[7];
  int v27;
  _QWORD block[9];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  NSString *v38;
  __int16 v39;
  MCPeerID *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  int v45[2];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (streamName
    && peerID
    && -[NSString length](streamName, "length")
    && -[NSString lengthOfBytesUsingEncoding:](streamName, "lengthOfBytesUsingEncoding:", 4) < 0x8000)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    syncQueue = self->_syncQueue;
    v12 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__MCSession_startStreamWithName_toPeer_error___block_invoke;
    block[3] = &unk_24C840A40;
    block[4] = self;
    block[5] = peerID;
    block[6] = streamName;
    block[7] = &v33;
    block[8] = &v29;
    dispatch_sync(syncQueue, block);
    if (*((_BYTE *)v34 + 24))
    {
      v13 = mcs_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MCSession sendResourceAtURL:withName:toPeer:withCompletionHandler:].cold.3();
      if (error)
      {
        v14 = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Peer not connected."), *MEMORY[0x24BDD0FC8]));
LABEL_25:
        v10 = 0;
        *error = v14;
LABEL_27:
        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v33, 8);
        return v10;
      }
      goto LABEL_26;
    }
    if (*((_BYTE *)v30 + 24))
    {
      v15 = mcs_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MCSession startStreamWithName:toPeer:error:].cold.4();
      if (error)
      {
        v14 = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Stream with same name already exists."), *MEMORY[0x24BDD0FC8]));
        goto LABEL_25;
      }
LABEL_26:
      v10 = 0;
      goto LABEL_27;
    }
    if (pipe(v45))
    {
      v16 = mcs_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        -[MCSession startStreamWithName:toPeer:error:].cold.3(v17, (uint64_t)buf, v16);
      }
      if (error)
      {
        v14 = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Cannot create pipe."), *MEMORY[0x24BDD0FC8]));
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    v19 = v45[0];
    fcntl(v45[1], 73, 1);
    v20 = (void *)_CFWriteStreamCreateFromFileDescriptor();
    if (v20)
    {
      v21 = (void *)-[NSString copy](streamName, "copy");
      v22 = self->_syncQueue;
      v26[0] = v12;
      v26[1] = 3221225472;
      v26[2] = __46__MCSession_startStreamWithName_toPeer_error___block_invoke_475;
      v26[3] = &unk_24C840A68;
      v27 = v19;
      v26[4] = self;
      v26[5] = v21;
      v26[6] = peerID;
      dispatch_async(v22, v26);

      if (!error)
      {
LABEL_37:
        v25 = mcs_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v38 = streamName;
          v39 = 2112;
          v40 = peerID;
          v41 = 2048;
          v42 = v20;
          v43 = 2112;
          v44 = v20;
          _os_log_impl(&dword_20DC1A000, v25, OS_LOG_TYPE_DEFAULT, "Stream (%@) started with peer (%@) [%p / %@].", buf, 0x2Au);
        }
        v10 = v20;
        goto LABEL_27;
      }
      v23 = 0;
    }
    else
    {
      v24 = mcs_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[MCSession startStreamWithName:toPeer:error:].cold.2();
      if (!error)
        goto LABEL_37;
      v23 = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Cannot create NSOutputStream."), *MEMORY[0x24BDD0FC8]));
    }
    *error = v23;
    goto LABEL_37;
  }
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MCSession startStreamWithName:toPeer:error:].cold.1();
  v10 = 0;
  if (error)
    *error = (NSError *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Invalid parameter."), *MEMORY[0x24BDD0FC8]));
  return v10;
}

uint64_t __46__MCSession_startStreamWithName_toPeer_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  result = objc_msgSend(v2, "state");
  if (result != 2)
  {
    v4 = a1[7];
    goto LABEL_6;
  }
  result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreams"), "objectForKey:", a1[6]);
  if (result || (result = objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", a1[6])) != 0)
  {
    v4 = a1[8];
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
    return result;
  }
  v5 = (void *)objc_msgSend(v2, "outgoingStreamRequests");
  return objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"), a1[6]);
}

uint64_t __46__MCSession_startStreamWithName_toPeer_error___block_invoke_475(uint64_t a1)
{
  int v2;

  v2 = fcntl(*(_DWORD *)(a1 + 56), 3, 0);
  if (v2 != -1)
    fcntl(*(_DWORD *)(a1 + 56), 4, v2 | 4u);
  fcntl(*(_DWORD *)(a1 + 56), 73, 1);
  return objc_msgSend(*(id *)(a1 + 32), "syncStartStreamWithName:toPeer:mcFD:isResource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), 0);
}

- (void)logSessionInfo
{
  const __CFString *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("sid");
  if (-[MCSession sessionID](self, "sessionID"))
    v3 = -[MCSession sessionID](self, "sessionID");
  else
    v3 = &stru_24C841670;
  v5[0] = v3;
  v4[1] = CFSTR("localPeer");
  v5[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[MCSession gckPID](self, "gckPID"));
  v4[2] = CFSTR("auth");
  v5[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[MCSession securityIdentity](self, "securityIdentity") != 0);
  v4[3] = CFSTR("cryptPref");
  v5[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MCSession encryptionPreference](self, "encryptionPreference"));
  MCDashboardLogJSON(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 4), 0, CFSTR("SessionInfo"));
}

- (void)syncLogConnectedPeers
{
  const __CFString *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("sid");
  if (-[MCSession sessionID](self, "sessionID"))
    v3 = -[MCSession sessionID](self, "sessionID");
  else
    v3 = &stru_24C841670;
  v4[1] = CFSTR("peersCnt");
  v5[0] = v3;
  v5[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MCSession syncConnectedPeersCount](self, "syncConnectedPeersCount") + 1);
  MCDashboardLogJSON(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2), 0, CFSTR("ConnectedPeers"));
}

- (void)syncLogMaxConnectedPeers
{
  const __CFString *v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("sid");
  if (-[MCSession sessionID](self, "sessionID"))
    v3 = -[MCSession sessionID](self, "sessionID");
  else
    v3 = &stru_24C841670;
  v5[1] = CFSTR("maxPeersCnt");
  v6[0] = v3;
  v6[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MCSession maxPeers](self, "maxPeers"));
  v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  MCMetricsLog(CFSTR("com.apple.multipeerconnectivity.mcsession.maxconnectedpeers"), v4, 0);
  MCDashboardLogJSON(v4, 0, CFSTR("MaxConnectedPeers"));
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (NSArray)securityIdentity
{
  return self->_securityIdentity;
}

- (MCEncryptionPreference)encryptionPreference
{
  return self->_encryptionPreference;
}

- (OpaqueGCKSession)gckSession
{
  return self->_gckSession;
}

- (void)setGckSession:(OpaqueGCKSession *)a3
{
  self->_gckSession = a3;
}

- (OpaqueAGPSession)agpSession
{
  return self->_agpSession;
}

- (void)setAgpSession:(OpaqueAGPSession *)a3
{
  self->_agpSession = a3;
}

- (unsigned)gckPID
{
  return self->_gckPID;
}

- (void)setGckPID:(unsigned int)a3
{
  self->_gckPID = a3;
}

- (NSMutableDictionary)peerIDMap
{
  return self->_peerIDMap;
}

- (void)setPeerIDMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableDictionary)peerStates
{
  return self->_peerStates;
}

- (void)setPeerStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSMutableDictionary)connectionPendingPeerEvents
{
  return self->_connectionPendingPeerEvents;
}

- (void)setConnectionPendingPeerEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (unint64_t)maxPeers
{
  return self->_maxPeers;
}

- (void)setMaxPeers:(unint64_t)a3
{
  self->_maxPeers = a3;
}

+ (id)stringForSessionState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("?");
  else
    return off_24C840B70[a3];
}

+ (id)stringForMCSessionSendDataMode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("?");
  if (a3 == 1)
    v3 = CFSTR("Unreliable");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Reliable");
}

- (void)peerDidDeclineInvitation:(id)a3
{
  NSObject *v5;
  NSObject *syncQueue;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = mcs_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = objc_msgSend(a3, "displayName");
    _os_log_impl(&dword_20DC1A000, v5, OS_LOG_TYPE_DEFAULT, "Peer [%@] declined invitation.", buf, 0xCu);
  }
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__MCSession_Private__peerDidDeclineInvitation___block_invoke;
  v7[3] = &unk_24C840658;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(syncQueue, v7);
}

uint64_t __47__MCSession_Private__peerDidDeclineInvitation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 32), "syncPeer:changeStateTo:shouldForceCallback:", *(_QWORD *)(a1 + 40), 0, 1);
  result = objc_msgSend(v2, "state");
  if (result != 2)
    return objc_msgSend(*(id *)(a1 + 32), "syncPeer:changeStateTo:shouldForceCallback:", *(_QWORD *)(a1 + 40), 0, 1);
  return result;
}

- (int64_t)connectedInterfacesForPeer:(id)a3
{
  NSObject *syncQueue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MCSession_Private__connectedInterfacesForPeer___block_invoke;
  block[3] = &unk_24C840A90;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(syncQueue, block);
  v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __49__MCSession_Private__connectedInterfacesForPeer___block_invoke(uint64_t a1)
{
  return GCKSessionGetInterfacesForParticipant(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), objc_msgSend(*(id *)(a1 + 40), "pid"), (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

- (void)setHeartbeatTimeout:(unint64_t)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__MCSession_Private__setHeartbeatTimeout___block_invoke;
  v4[3] = &unk_24C840AB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __42__MCSession_Private__setHeartbeatTimeout___block_invoke(uint64_t a1)
{
  return GCKSessionSetHeartbeatTimeout(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_DWORD *)(a1 + 40));
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  self->_AWDLDisabled = a3;
  GCKSessionSetAWDLDisabled((uint64_t)self->_gckSession, a3);
  v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "no";
    if (v3)
      v5 = "yes";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "AWDLDisabled set to %s.", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)preferNCMOverEthernet
{
  return self->_preferNCMOverEthernet;
}

- (void)setPreferNCMOverEthernet:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  self->_preferNCMOverEthernet = a3;
  GCKSessionSetPreferNCMOverEthernet((uint64_t)self->_gckSession, a3);
  v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "no";
    if (v3)
      v5 = "yes";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Prefer NCM over Ethernet set to %s.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setICETimeoutForced:(BOOL)a3
{
  NSObject *syncQueue;
  _QWORD v4[5];
  BOOL v5;

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__MCSession_Testing__setICETimeoutForced___block_invoke;
  v4[3] = &unk_24C8408B0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __42__MCSession_Testing__setICETimeoutForced___block_invoke(uint64_t a1)
{
  return GCKSessionSetICETimeoutForced(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(unsigned __int8 *)(a1 + 40));
}

- (void)closeDirectConnectionsWithPeer:(id)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__MCSession_Testing__closeDirectConnectionsWithPeer___block_invoke;
  v4[3] = &unk_24C840658;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

uint64_t __53__MCSession_Testing__closeDirectConnectionsWithPeer___block_invoke(uint64_t a1)
{
  return GCKSessionCloseDirectConnectionsWithPeer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), objc_msgSend(*(id *)(a1 + 40), "pid"));
}

- (void)syncSendXDataStreamOpenResponseToPID:(uint64_t)a3 withRequestID:(uint64_t)a4 streamID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a1, a3, "Streaming: Out of memory (allocating %u bytes).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)syncSendXDataStreamOpenResponseToPID:withRequestID:streamID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "AGPSendTo failed with status=%08X.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncSendXDataStreamCloseFromSenderToPID:(uint64_t)a3 streamID:(uint64_t)a4 closeReason:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DC1A000, a1, a3, "Out of memory (allocating %u bytes).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)syncSendXDataPeerIDPushToPID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Out of memory (allocating %u bytes).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startConnectionWithIndirectPID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_20DC1A000, a2, a3, "Mesh establishment: failed to get connection data (%08lX).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "PeerID push is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "PeerID push - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:(uint64_t)a2 freeEventWhenDone:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_begin_catch(a1);
  objc_end_catch();
  v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = a3;
    OUTLINED_FUNCTION_7(&dword_20DC1A000, v4, v5, "PeerID push - failed to create peerID from data [%@].", (uint8_t *)&v6);
  }
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "Incoming xdata is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Xdata unexpected type %d.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Stream open request is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "Stream open request - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18(&dword_20DC1A000, v0, v1, "Cannot create pipe for outgoing stream [%@], error (%d).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleNetworkEvent:(uint64_t)a1 pid:(uint64_t)a2 freeEventWhenDone:(NSObject *)a3 .cold.9(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl(&dword_20DC1A000, a3, OS_LOG_TYPE_ERROR, "Strdup failed for path[%@] stream[%@] (%d).", (uint8_t *)&v7, 0x1Cu);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_18(&dword_20DC1A000, v0, v1, "Failed to open file for stream[%@] (%d).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Stream open response is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.12()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "Stream open response - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Stream request doesn't exist [%08X].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:(NSObject *)a2 freeEventWhenDone:.cold.14(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 138412802;
  v5 = objc_msgSend(a1, "name");
  v6 = 1024;
  v7 = objc_msgSend(a1, "streamID");
  v8 = 1024;
  v9 = objc_msgSend(a1, "state");
  _os_log_error_impl(&dword_20DC1A000, a2, OS_LOG_TYPE_ERROR, "Stream[%@] id[%08X] si invalid state (%d).", (uint8_t *)&v4, 0x18u);
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Stream close from sender is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.16()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "Stream close from sender - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Stream close from receiver is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.18()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "Stream close from receiver - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:(void *)a1 pid:(int)a2 freeEventWhenDone:(NSObject *)a3 .cold.19(void *a1, int a2, NSObject *a3)
{
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109376;
  v5[1] = a2;
  v6 = 1024;
  v7 = objc_msgSend(a1, "streamID");
  OUTLINED_FUNCTION_9(&dword_20DC1A000, a3, v4, "StreamID mismatch [%08X] != [%08X].", (uint8_t *)v5);
  OUTLINED_FUNCTION_10();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "PeerID push - should not happen any more (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_20DC1A000, v0, v1, "Connection data push is too small (%u).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.22()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "Connection data - size mismatch (%u < %u).", v2, v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncHandleNetworkEvent:pid:freeEventWhenDone:.cold.23()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_20DC1A000, v0, v1, "Connection data parse error [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395_cold_1(int a1, NSObject *a2)
{
  uint64_t v4;
  _DWORD v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  __error();
  v5[0] = 67109376;
  v5[1] = a1;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9(&dword_20DC1A000, a2, v4, "Outgoing stream source: read error [%d, %d].", (uint8_t *)v5);
  OUTLINED_FUNCTION_10();
}

void __58__MCSession_syncHandleNetworkEvent_pid_freeEventWhenDone___block_invoke_395_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "AGPSendTo failed with status=%08X, error (%d).", 67109376, v2);
  OUTLINED_FUNCTION_6();
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "GCKSessionStartEventCallbacks failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "AGPSessionCreate failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithPeer:securityIdentity:encryptionPreference:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "GCKSessionCreate failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)syncConnectPeer:(void *)a1 withConnectionData:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, v3, "Peer [%@] has incompatible connection data.", v4);
  OUTLINED_FUNCTION_10();
}

- (void)syncConnectPeer:(uint64_t)a3 withConnectionData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_20DC1A000, a2, a3, "GCKSessionEstablishConnection failed (%08lX).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "Send non-file resource not supported yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_20DC1A000, v0, v1, "Resource with name [%@] already exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)sendResourceAtURL:withName:toPeer:withCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_20DC1A000, v0, v1, "Peer[%@] not connected.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "fileSystemRepresentation");
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20DC1A000, a2, v3, "Cannot open file [%s].", v4);
  OUTLINED_FUNCTION_10();
}

void __69__MCSession_sendResourceAtURL_withName_toPeer_withCompletionHandler___block_invoke_3_cold_2(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  __error();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1(&dword_20DC1A000, a1, v2, "Failed to stat file (%d).", v3);
  OUTLINED_FUNCTION_6();
}

- (void)syncStartStreamWithName:toPeer:mcFD:isResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_20DC1A000, v0, v1, "Unknown peer [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)startStreamWithName:toPeer:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v1, (uint64_t)v1, "Bad name[%@] or id[%@].", v2);
  OUTLINED_FUNCTION_6();
}

- (void)startStreamWithName:toPeer:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "Cannot create output stream.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startStreamWithName:(int *)a1 toPeer:(uint64_t)a2 error:(NSObject *)a3 .cold.3(int *a1, uint64_t a2, NSObject *a3)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_1(&dword_20DC1A000, a3, (uint64_t)a3, "Cannot create pipe (%d).", (uint8_t *)a2);
}

- (void)startStreamWithName:toPeer:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5(&dword_20DC1A000, v0, v1, "Stream with name [%@] already exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
