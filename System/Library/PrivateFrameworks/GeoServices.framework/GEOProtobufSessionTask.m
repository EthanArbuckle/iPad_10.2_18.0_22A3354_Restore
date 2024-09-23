@implementation GEOProtobufSessionTask

uint64_t __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    -[GEOProtobufSessionTask completeWithCancelled:error:response:](*(_QWORD *)(a1 + 32), 0, v2, *(void **)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOProtobufSessionTask completeWithCancelled:error:response:](v3, 0, v4, *(void **)(a1 + 56));

  }
}

- (void)completeWithCancelled:(void *)a3 error:(void *)a4 response:
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    GEOGetDataSessionProtobufLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138413058;
      v16 = a1;
      v17 = 1024;
      v18 = a2;
      v19 = 1024;
      v20 = v8 != 0;
      v21 = 1024;
      v22 = v9 != 0;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Protobuf task %@ completed (cancelled %d, error %d, response %d)", (uint8_t *)&v15, 0x1Eu);
    }

    objc_msgSend((id)a1, "dataTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientMetricsIfSupported:", v12);

    *(_BYTE *)(a1 + 88) = a2;
    objc_storeStrong((id *)(a1 + 48), a3);
    objc_storeStrong((id *)(a1 + 56), a4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      v14 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v14, "protobufSession:didCompleteTask:", WeakRetained, a1);

    }
  }

}

- (PBCodable)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)completedAsCancelled
{
  return self->_completedAsCancelled;
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  GEOProtobufSessionTask *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GEOGetDataSessionProtobufLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Protobuf task %@ cancel", (uint8_t *)&v5, 0xCu);
  }

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (GEOClientMetrics)clientMetrics
{
  void *v2;
  void *v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOClientMetrics *)v3;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  GEODataRequestThrottlerToken *v5;
  void *v6;
  GEOApplicationAuditToken *auditToken;
  char v8;
  GEODataRequestThrottlerToken *v9;
  GEODataRequestThrottlerToken *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *delegateQueue;
  _QWORD v19[5];
  id v20;
  id v21;
  GEODataRequestThrottlerToken *v22;
  _QWORD block[5];
  uint8_t buf[4];
  GEOProtobufSessionTask *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_requestKind;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  GEOGetDataSessionProtobufLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v25 = self;
    v26 = 1040;
    v27 = 8;
    v28 = 2096;
    p_requestKind = &self->_requestKind;
    v30 = 1024;
    v31 = -[GEOProtobufSessionTask requestTypeCode](self, "requestTypeCode");
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Protobuf task %@ start %{geo:DataRequestKind}.*P %#x", buf, 0x22u);
  }

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = self->_throttleToken;
    +[GEOThrottlerRequester sharedRequester](GEOThrottlerRequester, "sharedRequester");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    auditToken = self->_auditToken;
    v21 = 0;
    v22 = v5;
    v8 = objc_msgSend(v6, "allowRequest:forClient:throttlerToken:error:", *(_QWORD *)&self->_requestKind, auditToken, &v22, &v21);
    v9 = v22;
    v10 = v22;

    v11 = v21;
    if ((v8 & 1) != 0)
    {
      objc_storeStrong((id *)&self->_throttleToken, v9);
      -[GEOProtobufSessionTask dataTask](self, "dataTask");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "start");
    }
    else
    {
      if (v11)
      {
        v14 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -3);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      -[GEOProtobufSessionTask dataTask](self, "dataTask");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestCounterTicket");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "requestCompleted:", v15);

      delegateQueue = self->_delegateQueue;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __31__GEOProtobufSessionTask_start__block_invoke_2;
      v19[3] = &unk_1E1C00738;
      v19[4] = self;
      v20 = v15;
      v12 = v15;
      dispatch_async(delegateQueue, v19);

    }
  }
  else
  {
    if (self)
      v13 = self->_delegateQueue;
    else
      v13 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__GEOProtobufSessionTask_start__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(v13, block);
  }
}

- (GEODataURLSessionTask)dataTask
{
  return self->_dataTask;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  NSObject *delegateQueue;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  uint8_t buf[4];
  GEOProtobufSessionTask *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self)
    delegateQueue = self->_delegateQueue;
  else
    delegateQueue = 0;
  dispatch_assert_queue_V2(delegateQueue);
  GEOGetDataSessionProtobufLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Protobuf task %@ completed %@", buf, 0x16u);
  }

  if (objc_msgSend(v5, "failedDueToCancel"))
  {
    if (self)
      v8 = self->_delegateQueue;
    else
      v8 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (self)
        v10 = self->_delegateQueue;
      else
        v10 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_2;
      v14[3] = &unk_1E1C00738;
      v14[4] = self;
      v15 = v5;
      dispatch_async(v10, v14);
      v11 = v15;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_3;
      v12[3] = &unk_1E1C0F5D8;
      v12[4] = self;
      v13 = v5;
      -[GEOProtobufSessionTask _decodeResponseFromTask:completion:](self, "_decodeResponseFromTask:completion:", v13, v12);
      v11 = v13;
    }

  }
}

- (void)_decodeResponseFromTask:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  GEOProtobufSessionTask *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "receivedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetDataSessionProtobufLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2048;
    v17 = objc_msgSend(v8, "length");
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "Protobuf task %@ got data (length %{bytes}zu)", (uint8_t *)&v14, 0x16u);
  }

  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v6, "protocolBufferHasPreamble"))
    {
      -[GEOProtobufSessionTask parseInnerProtobufFromData:](self, "parseInnerProtobufFromData:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8;
    }
    v11 = v10;
    if (v10)
    {
      -[GEOProtobufSessionTask parseResponseFromResponseData:](self, "parseResponseFromResponseData:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        GEOGetDataSessionProtobufLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = 138412290;
          v15 = self;
          _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "Protobuf task %@ decoded data", (uint8_t *)&v14, 0xCu);
        }

        v7[2](v7, v12, 0);
      }
      else
      {
        v7[2](v7, 0, 2);
      }

    }
    else
    {
      v7[2](v7, 0, 1);
    }

  }
  else
  {
    v7[2](v7, 0, 3);
  }

}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(NSObject **)(v6 + 40);
  else
    v7 = 0;
  dispatch_assert_queue_V2(v7);
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = a3;
LABEL_5:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("GEOProtobufSession"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = 4;
    goto LABEL_5;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    WeakRetained = objc_loadWeakRetained((id *)(v11 + 32));
  else
    WeakRetained = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v14 = objc_loadWeakRetained((id *)(v13 + 24));
    else
      v14 = 0;
    objc_msgSend(WeakRetained, "protobufSession:validateResponse:", v14, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

LABEL_16:
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v16 = *(NSObject **)(v15 + 40);
  else
    v16 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_4;
  v19[3] = &unk_1E1C00898;
  v19[4] = v15;
  v20 = v10;
  v21 = *(id *)(a1 + 40);
  v22 = v5;
  v17 = v5;
  v18 = v10;
  dispatch_async(v16, v19);

}

- (id)parseResponseFromResponseData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *responseClass;
  id v9;
  char v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_requestKind;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D82B90];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);
  v7 = objc_msgSend(v5, "length");

  if (v7)
  {
    if (self)
    {
      if ((-[objc_class isValid:](self->_responseClass, "isValid:", v6) & 1) != 0)
      {
        responseClass = self->_responseClass;
LABEL_5:
        v9 = objc_alloc_init(responseClass);
        objc_msgSend(v9, "readFrom:", v6);
        goto LABEL_10;
      }
    }
    else
    {
      v10 = objc_msgSend(0, "isValid:", v6);
      responseClass = 0;
      if ((v10 & 1) != 0)
        goto LABEL_5;
    }
  }
  GEOGetDataSessionProtobufLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v13[0] = 68157954;
    v13[1] = 8;
    v14 = 2098;
    p_requestKind = &self->_requestKind;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_FAULT, "Failed to decode protobuf response for %{public, geo:DataRequestKind}.*P", (uint8_t *)v13, 0x12u);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (id)parseInnerProtobufFromData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_requestKind;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D82B90];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  if (-[GEOProtobufSessionTask parsePreambleWithReader:](self, "parsePreambleWithReader:", v6))
  {
    objc_msgSend(v6, "readProtoBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      GEOGetDataSessionProtobufLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v12[0] = 68157954;
        v12[1] = 8;
        v13 = 2098;
        p_requestKind = &self->_requestKind;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "Failed to decode inner protobuf for %{public, geo:DataRequestKind}.*P", (uint8_t *)v12, 0x12u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)parsePreambleWithReader:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[GEOProtobufSessionTask parseProtocolVersionWithReader:](self, "parseProtocolVersionWithReader:", v4))
    v5 = -[GEOProtobufSessionTask parseResponseTypeWithReader:](self, "parseResponseTypeWithReader:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)parseResponseTypeWithReader:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v12;
  int v13;
  __int16 v14;
  _BYTE v15[10];
  __int16 v16;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_requestKind;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "readBigEndianFixed32");
  v6 = objc_msgSend(v4, "hasError");

  if (v6)
  {
    GEOGetDataSessionProtobufLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v12 = 68157954;
      v13 = 8;
      v14 = 2098;
      *(_QWORD *)v15 = &self->_requestKind;
      v8 = "Failed to decode response type in protobuf for %{public, geo:DataRequestKind}.*P";
      v9 = v7;
      v10 = 18;
LABEL_8:
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (v5 == -[GEOProtobufSessionTask requestTypeCode](self, "requestTypeCode"))
      return 1;
    GEOGetDataSessionProtobufLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v12 = 67109890;
      v13 = v5;
      v14 = 1024;
      *(_DWORD *)v15 = -[GEOProtobufSessionTask requestTypeCode](self, "requestTypeCode");
      *(_WORD *)&v15[4] = 1040;
      *(_DWORD *)&v15[6] = 8;
      v16 = 2098;
      p_requestKind = &self->_requestKind;
      v8 = "Incorrect response type %u (expected %u) in protobuf for %{public, geo:DataRequestKind}.*P";
      v9 = v7;
      v10 = 30;
      goto LABEL_8;
    }
  }

  return 0;
}

- (BOOL)parseProtocolVersionWithReader:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v12;
  int v13;
  __int16 v14;
  _BYTE v15[10];
  __int16 v16;
  $7466BF22B2A7275A1F5DB80FF4552E0B *p_requestKind;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "readBigEndianFixed16");
  v6 = objc_msgSend(v4, "hasError");

  if (v6)
  {
    GEOGetDataSessionProtobufLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v12 = 68157954;
      v13 = 8;
      v14 = 2098;
      *(_QWORD *)v15 = &self->_requestKind;
      v8 = "Failed to decode protocol version in protobuf for %{public, geo:DataRequestKind}.*P";
      v9 = v7;
      v10 = 18;
LABEL_8:
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (v5 == 1)
      return 1;
    GEOGetDataSessionProtobufLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v12 = 67109890;
      v13 = v5;
      v14 = 1024;
      *(_DWORD *)v15 = 1;
      *(_WORD *)&v15[4] = 1040;
      *(_DWORD *)&v15[6] = 8;
      v16 = 2098;
      p_requestKind = &self->_requestKind;
      v8 = "Incorrect protocol version %u (expected %u) in protobuf for %{public, geo:DataRequestKind}.*P";
      v9 = v7;
      v10 = 30;
      goto LABEL_8;
    }
  }

  return 0;
}

- (unsigned)requestTypeCode
{
  return self->_requestTypeCode;
}

void __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
    WeakRetained = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke_2;
  v7[3] = &unk_1E1C0F600;
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "protobufSession:willSendRequest:forTask:completionHandler:", WeakRetained, v6, v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (void)dataURLSession:(id)a3 willSendRequest:(id)a4 forTask:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  NSObject *delegateQueue;
  _QWORD v16[4];
  id v17;
  GEOProtobufSessionTask *v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self)
      delegateQueue = self->_delegateQueue;
    else
      delegateQueue = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__GEOProtobufSessionTask_DataTask__dataURLSession_willSendRequest_forTask_completionHandler___block_invoke;
    v16[3] = &unk_1E1C01268;
    v17 = WeakRetained;
    v18 = self;
    v19 = v11;
    v20 = v13;
    dispatch_async(delegateQueue, v16);

  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v11);
  }

}

- (GEOProtobufSessionTask)init
{

  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PBT %p> {%@}"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t requestKind;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  Class responseClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    requestKind = (uint64_t)self->_requestKind;
  else
    requestKind = 0;
  GEODataRequestKindAsString(requestKind);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" kind: %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" requestType: %x"), -[GEOProtobufSessionTask requestTypeCode](self, "requestTypeCode"));
  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" data task: <%@: %p>"), v7, v8);

  -[GEOProtobufSessionTask response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GEOProtobufSessionTask response](self, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    -[GEOProtobufSessionTask response](self, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" response: <%@: %p>"), v11, v12);

  }
  else
  {
    if (self)
      responseClass = self->_responseClass;
    else
      responseClass = 0;
    objc_msgSend(v3, "appendFormat:", CFSTR(" response class: %@"), responseClass);
  }
  -[GEOProtobufSessionTask error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[GEOProtobufSessionTask error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOProtobufSessionTask error](self, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" error: %@ (%u)"), v16, objc_msgSend(v17, "code"));

    -[GEOProtobufSessionTask error](self, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "appendString:", CFSTR(" \"));
      -[GEOProtobufSessionTask error](self, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v21);

      objc_msgSend(v3, "appendString:", CFSTR("\"));
    }
  }
  return (NSString *)v3;
}

void __31__GEOProtobufSessionTask_start__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("No data task"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](*(_QWORD *)(a1 + 32), 0, v2, 0);

}

void __31__GEOProtobufSessionTask_start__block_invoke_2(uint64_t a1)
{
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40), 0);
}

- (unint64_t)outgoingPayloadSize
{
  void *v2;
  unint64_t v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outgoingPayloadSize");

  return v3;
}

- (unint64_t)incomingPayloadSize
{
  void *v2;
  unint64_t v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "incomingPayloadSize");

  return v3;
}

- (NSString)remoteAddressAndPort
{
  void *v2;
  void *v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteAddressAndPort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)requestedMultipathServiceType
{
  void *v2;
  unint64_t v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestedMultipathServiceType");

  return v3;
}

- (BOOL)mptcpNegotiated
{
  void *v2;
  char v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mptcpNegotiated");

  return v3;
}

- (BOOL)receivedRNFNotification
{
  void *v2;
  char v3;

  -[GEOProtobufSessionTask dataTask](self, "dataTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "receivedRNFNotification");

  return v3;
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke(uint64_t a1)
{
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](*(_QWORD *)(a1 + 32), 1, 0, 0);
}

void __67__GEOProtobufSessionTask_DataTask__dataURLSession_didCompleteTask___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOProtobufSessionTask completeWithCancelled:error:response:](v1, 0, v2, 0);

}

- (void)completeWithErrorCode:(int64_t)a3
{
  GEOProtobufSessionTask *v4;
  id v5;

  v4 = self;
  if (self)
    self = (GEOProtobufSessionTask *)self->_delegateQueue;
  dispatch_assert_queue_V2(&self->super);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GEOProtobufSession"), a3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOProtobufSessionTask completeWithCancelled:error:response:]((uint64_t)v4, 0, v5, 0);

}

@end
