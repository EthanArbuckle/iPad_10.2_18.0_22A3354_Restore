@implementation MCResourceDownloader

- (MCResourceDownloader)initWithSession:(id)a3 resourceUrl:(id)a4 name:(id)a5 peerID:(id)a6
{
  MCResourceDownloader *v10;
  MCResourceDownloader *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCResourceDownloader;
  v10 = -[MCResourceDownloader init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MCResourceDownloader setSession:](v10, "setSession:", a3);
    -[MCResourceDownloader setResourceName:](v11, "setResourceName:", a5);
    -[MCResourceDownloader setPeerID:](v11, "setPeerID:", a6);
    v12 = objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", a4);
    -[MCResourceDownloader setUrlSession:](v11, "setUrlSession:", objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", objc_msgSend(MEMORY[0x24BDB74B8], "defaultSessionConfiguration"), v11, 0));
    -[MCResourceDownloader setUrlTask:](v11, "setUrlTask:", -[NSURLSession dataTaskWithRequest:](v11->_urlSession, "dataTaskWithRequest:", v12));
    -[NSURLSessionDataTask resume](v11->_urlTask, "resume");
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_session, 0);
  _Block_release(self->_urlResponseHandler);
  v3.receiver = self;
  v3.super_class = (Class)MCResourceDownloader;
  -[MCResourceDownloader dealloc](&v3, sel_dealloc);
}

- (MCSession)session
{
  return (MCSession *)objc_loadWeak((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void)syncCloseStreamForSession:(id)a3 withError:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];

  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "peerStates"), "objectForKey:", self->_peerID);
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "outgoingStreams"), "objectForKey:", self->_resourceName);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a3, "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", -[MCPeerID pid](self->_peerID, "pid"), objc_msgSend(v8, "streamID"), 2 * (a4 != 0));
    objc_msgSend(a3, "syncCloseOutgoingStream:forPeer:state:error:shouldTriggerCancelProgress:", v9, self->_peerID, v7, a4, 0);
  }
  else
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(v7, "outgoingStreamRequests"), "objectForKey:", self->_resourceName);
    if (objc_msgSend(v10, "completionHandler"))
    {
      v11 = objc_msgSend(a3, "callbackQueue");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __60__MCResourceDownloader_syncCloseStreamForSession_withError___block_invoke;
      v12[3] = &unk_24C840658;
      v12[4] = v10;
      v12[5] = a4;
      dispatch_async(v11, v12);
    }
    objc_msgSend((id)objc_msgSend(v7, "outgoingStreamRequests"), "removeObjectForKey:", self->_resourceName);
  }
}

uint64_t __60__MCResourceDownloader_syncCloseStreamForSession_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  MCSession *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[7];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = -[MCResourceDownloader session](self, "session", a3, a4);
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = a3;
    v14 = 2112;
    v15 = a5;
    _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "URL session[%@] did complete with error [%@].", buf, 0x16u);
  }
  if (a5)
  {
    if (v8)
    {
      v10 = -[MCSession syncQueue](v8, "syncQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__MCResourceDownloader_URLSession_task_didCompleteWithError___block_invoke;
      block[3] = &unk_24C840680;
      block[4] = self;
      block[5] = v8;
      block[6] = a5;
      dispatch_async(v10, block);
    }
  }
}

void __61__MCResourceDownloader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  MCSession *v11;
  MCSession *v12;
  NSObject *v13;
  _QWORD block[9];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = mcs_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = a4;
    v17 = 2112;
    v18 = a5;
    _os_log_impl(&dword_20DC1A000, v10, OS_LOG_TYPE_DEFAULT, "URLSession received task[%@] response[%@].", buf, 0x16u);
  }
  v11 = -[MCResourceDownloader session](self, "session");
  if (v11)
  {
    v12 = v11;
    v13 = -[MCSession syncQueue](v11, "syncQueue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    block[3] = &unk_24C8406A8;
    block[4] = v12;
    block[5] = self;
    block[7] = a4;
    block[8] = a6;
    block[6] = a5;
    dispatch_async(v13, block);
  }
}

void __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerStates"), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = objc_msgSend(v3, "name");
    v16 = 1024;
    v17 = objc_msgSend(v3, "streamID");
    _os_log_impl(&dword_20DC1A000, v4, OS_LOG_TYPE_DEFAULT, "Streaming: received HTTP response [%@] stream name [%@] streamID [%08X].", buf, 0x1Cu);
  }
  v6 = objc_msgSend(*(id *)(a1 + 48), "statusCode");
  v7 = *(void (***)(_QWORD, _QWORD))(a1 + 64);
  if (v6 == 200)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = _Block_copy(v7);
    if (!objc_msgSend(*(id *)(a1 + 56), "countOfBytesExpectedToReceive"))
      objc_msgSend(v3, "setProgressUnbounded:", 1);
    objc_msgSend((id)objc_msgSend(v3, "progress"), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 56), "countOfBytesExpectedToReceive"));
    objc_msgSend(*(id *)(a1 + 32), "syncStartStreamWithName:toPeer:mcFD:isResource:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), 0xFFFFFFFFLL, 1);
  }
  else
  {
    v7[2](v7, 0);
    v8 = objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v6);
    v9 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 6, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]));
    if (objc_msgSend(v3, "completionHandler"))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_168;
      v11[3] = &unk_24C840658;
      v11[4] = v3;
      v11[5] = v9;
      dispatch_async(v10, v11);
    }
    objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  }

}

uint64_t __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_168(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSObject *v8;
  MCSession *v9;
  MCSession *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = mcs_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = a4;
    v16 = 1024;
    v17 = objc_msgSend(a5, "length");
    _os_log_impl(&dword_20DC1A000, v8, OS_LOG_TYPE_DEFAULT, "URLSession received task[%@] bytes[%d].", buf, 0x12u);
  }
  -[NSURLSessionDataTask suspend](self->_urlTask, "suspend");
  v9 = -[MCResourceDownloader session](self, "session");
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(a5, "length"))
    {
      -[MCResourceDownloader sendData:fromByteOffset:](self, "sendData:fromByteOffset:", a5, 0);
    }
    else
    {
      v12 = -[MCSession syncQueue](v10, "syncQueue");
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __59__MCResourceDownloader_URLSession_dataTask_didReceiveData___block_invoke;
      v13[3] = &unk_24C840658;
      v13[4] = self;
      v13[5] = v10;
      dispatch_async(v12, v13);
    }
  }
  else
  {
    v11 = mcs_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MCResourceDownloader URLSession:dataTask:didReceiveData:].cold.1();
    -[NSURLSessionDataTask cancel](self->_urlTask, "cancel");
  }
}

void __59__MCResourceDownloader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("No data."), *MEMORY[0x24BDD0FC8])));

}

- (void)sendData:(id)a3 fromByteOffset:(unint64_t)a4
{
  MCSession *v7;
  MCSession *v8;
  void *v9;
  UInt8 *v10;
  size_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[2];
  _QWORD block[6];
  _QWORD v23[11];
  unsigned int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  size_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = -[MCResourceDownloader session](self, "session");
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[MCSession peerStates](v7, "peerStates"), "objectForKey:", self->_peerID), "outgoingStreams"), "objectForKey:", self->_resourceName);
    objc_msgSend(v9, "setSourceSuspended:", 1);
    v21[1] = v21;
    v10 = (UInt8 *)v21 - ((AGPSessionMaximumSegmentSize(1) + 15) & 0x1FFFFFFF0);
    *(_DWORD *)v10 = bswap32(objc_msgSend(v9, "streamID"));
    LODWORD(v11) = AGPSessionMaximumSegmentSize(1) - 4;
    v12 = objc_msgSend(a3, "length");
    v13 = v12 - a4;
    if (v12 - a4 >= (int)v11)
      v11 = (int)v11;
    else
      v11 = v12 - a4;
    memcpy(v10 + 4, (const void *)(objc_msgSend(a3, "bytes") + a4), v11);
    v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v9, "name");
      *(_DWORD *)buf = 138412802;
      v26 = v15;
      v27 = 2048;
      v28 = v11;
      v29 = 2048;
      v30 = v13;
      _os_log_impl(&dword_20DC1A000, v14, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing HTTP download stream segment [%@]: %ld bytes to send (total %ld).", buf, 0x20u);
    }
    *(_DWORD *)buf = 0;
    v24 = -[MCPeerID pid](self->_peerID, "pid");
    v16 = -[MCSession agpSession](v8, "agpSession");
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke;
    v23[3] = &unk_24C8406D0;
    v23[8] = v11;
    v23[9] = v13;
    v23[4] = v9;
    v23[5] = self;
    v23[10] = a4;
    v23[6] = a3;
    v23[7] = v8;
    if (AGPSessionSendTo(v16, (int *)&v24, 1, v10, (int)v11 + 4, (uint64_t)buf, 0, 0xAu, 1, v23))
    {
      v18 = mcs_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MCResourceDownloader sendData:fromByteOffset:].cold.2();
      v19 = -[MCSession syncQueue](v8, "syncQueue");
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_171;
      block[3] = &unk_24C840658;
      block[4] = self;
      block[5] = v8;
      dispatch_async(v19, block);
    }
  }
  else
  {
    v20 = mcs_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MCResourceDownloader URLSession:dataTask:didReceiveData:].cold.1();
    -[NSURLSessionDataTask cancel](self->_urlTask, "cancel");
  }
}

void __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[6];

  if (objc_msgSend(*(id *)(a1 + 32), "progress"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "progressUnbounded");
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "progress");
    v4 = v3;
    if (v2)
    {
      v5 = objc_msgSend(v3, "totalUnitCount");
      v6 = v5 - objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
      v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "progress");
      v7 = (uint64_t)((double)objc_msgSend(v4, "completedUnitCount") + (double)v6 * 0.05);
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 64) + objc_msgSend(v3, "completedUnitCount");
    }
    objc_msgSend(v4, "setCompletedUnitCount:", v7);
  }
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(id **)(a1 + 40);
  if (*(_QWORD *)(a1 + 72) == v8)
  {
    if (objc_msgSend(v9[2], "state") == 3)
    {
      v10 = objc_msgSend(*(id *)(a1 + 56), "syncQueue");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_2;
      v12[3] = &unk_24C840658;
      v11 = *(_QWORD *)(a1 + 56);
      v12[4] = *(_QWORD *)(a1 + 40);
      v12[5] = v11;
      dispatch_async(v10, v12);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "resume");
      objc_msgSend(*(id *)(a1 + 32), "setSourceSuspended:", 0);
    }
  }
  else
  {
    objc_msgSend(v9, "sendData:fromByteOffset:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80) + v8);
  }

}

uint64_t __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(_QWORD *)(a1 + 40), 0);
}

void __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_171(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCSession"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Send failure."), *MEMORY[0x24BDD0FC8])));

}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSURLSessionDataTask)urlTask
{
  return self->_urlTask;
}

- (void)setUrlTask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)urlResponseHandler
{
  return self->_urlResponseHandler;
}

- (void)setUrlResponseHandler:(id)a3
{
  self->_urlResponseHandler = a3;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_20DC1A000, v0, v1, "No MCSession for this resource send.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendData:fromByteOffset:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_3(&dword_20DC1A000, v0, v1, "AGPSendTo failed with status: %08X, error: %d.", 67109376, v2);
  OUTLINED_FUNCTION_6();
}

@end
