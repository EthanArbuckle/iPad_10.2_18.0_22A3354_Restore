@implementation MSASProtocol

- (MSASProtocol)initWithPersonID:(id)a3
{
  id v5;
  MSASProtocol *v6;
  MSASProtocol *v7;
  void *v8;
  uint64_t v9;
  NSURL *baseURL;
  dispatch_queue_t v11;
  OS_dispatch_queue *pendingConnectionsQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *memberQueue;
  dispatch_group_t v17;
  OS_dispatch_group *pendingConnectionsGroup;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  NSString *headerVersion;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSASProtocol;
  v6 = -[MSASProtocol init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personID, a3);
    MSASPlatform();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseSharingURLForPersonID:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    baseURL = v7->_baseURL;
    v7->_baseURL = (NSURL *)v9;

    v11 = dispatch_queue_create("MSASProtocol connections queue", 0);
    pendingConnectionsQueue = v7->_pendingConnectionsQueue;
    v7->_pendingConnectionsQueue = (OS_dispatch_queue *)v11;

    dispatch_set_target_queue((dispatch_object_t)v7->_pendingConnectionsQueue, MEMORY[0x1E0C80D38]);
    v13 = dispatch_queue_create("MSASProtocol work queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("MSASProtocol member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v7->_memberQueue;
    v7->_memberQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_group_create();
    pendingConnectionsGroup = v7->_pendingConnectionsGroup;
    v7->_pendingConnectionsGroup = (OS_dispatch_group *)v17;

    MSASPlatform();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      MSASPlatform();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sharedStreamsProtocolVersionString");
      v22 = objc_claimAutoreleasedReturnValue();
      headerVersion = v7->_headerVersion;
      v7->_headerVersion = (NSString *)v22;

    }
    if (!v7->_headerVersion)
      v7->_headerVersion = (NSString *)CFSTR("6oWcrYvjLx0f");
  }

  return v7;
}

- (id)shutDownError
{
  if (shutDownError_onceToken != -1)
    dispatch_once(&shutDownError_onceToken, &__block_literal_global_7150);
  return (id)shutDownError_error;
}

- (id)stoppingError
{
  if (stoppingError_onceToken != -1)
    dispatch_once(&stoppingError_onceToken, &__block_literal_global_140);
  return (id)stoppingError_error;
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v4 = a3;
  -[MSASProtocol memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSASProtocol_shutDownCompletionBlock___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_barrier_async(v5, block);

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__MSASProtocol_shutDownCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E95BCF98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)stopCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v4 = a3;
  -[MSASProtocol memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MSASProtocol_stopCompletionBlock___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_barrier_async(v5, block);

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __36__MSASProtocol_stopCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E95BCF98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (id)stopHandlerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__MSASProtocol_stopHandlerBlock__block_invoke;
  v3[3] = &unk_1E95BC9B8;
  v3[4] = self;
  return (id)MEMORY[0x1D8255DD0](v3, a2);
}

- (void)sendURLRequest:(id)a3 bodyObj:(id)a4 completionBlock:(id)a5
{
  -[MSASProtocol sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:](self, "sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:", a3, CFSTR("POST"), a4, 1, a5);
}

- (void)sendURLRequest:(id)a3 method:(id)a4 bodyObj:(id)a5 checkServerSideConfigVersion:(BOOL)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *pendingConnectionsGroup;
  NSObject *pendingConnectionsQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  pendingConnectionsQueue = self->_pendingConnectionsQueue;
  pendingConnectionsGroup = self->_pendingConnectionsGroup;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke;
  v22[3] = &unk_1E95BC9E0;
  v25 = v13;
  v26 = v15;
  v22[4] = self;
  v23 = v14;
  v24 = v12;
  v27 = a6;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  v21 = v15;
  dispatch_group_async(pendingConnectionsGroup, pendingConnectionsQueue, v22);

}

- (void)_sendOneURLRequest:(id)a3 checkServerSideConfigVersion:(BOOL)a4 retryCount:(unint64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  BOOL v22;
  _QWORD block[5];

  v10 = a3;
  v11 = a6;
  -[MSASProtocol memberQueue](self, "memberQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_barrier_sync(v12, block);

  -[MSASProtocol _prepareHeadersForRequest:](self, "_prepareHeadersForRequest:", v10);
  v14 = (void *)MEMORY[0x1E0C92C58];
  v15 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_2;
  v18[3] = &unk_1E95BCA58;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = a5;
  v22 = a4;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v14, "sendAsynchronousRequest:queue:completionHandler:", v16, v15, v18);

}

- (void)_prepareHeadersForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFData *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  MSASProtocol *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  __CFString *v32;
  id v33;
  void *v34;
  MSASProtocol *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  MSASProtocol *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSProtocolUtilities deviceInfoDictForPersonID:](MSProtocolUtilities, "deviceInfoDictForPersonID:", self->_personID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self->_headerVersion, CFSTR("x-apple-mme-sharedstreams-version"));
  objc_msgSend(v6, "objectForKey:", CFSTR("pushToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "MSHexString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("x-apple-mme-sharedstreams-client-token"));

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("authToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v8;
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_personID, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v15 = (__CFString *)MSPCUCreateBase64StringFromData(v14);
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("authorization"));

    }
    v8 = v11;
    v10 = v12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("clientInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("x-mme-client-info"));
  objc_msgSend(v5, "setObject:forKey:", CFSTR("text/plist"), CFSTR("Content-Type"));
  +[MSProtocolUtilities appleIDSession](MSProtocolUtilities, "appleIDSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appleIDHeadersForRequest:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __42__MSASProtocol__prepareHeadersForRequest___block_invoke;
  v45[3] = &unk_1E95BCA98;
  v20 = v5;
  v46 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v45);
  objc_msgSend(v4, "setAllHTTPHeaderFields:", v20);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = self;
    v50 = 2114;
    v51 = v21;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending request to %{public}@.", buf, 0x16u);

  }
  MSASPlatform();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldLogAtLevel:", 7);

  if (v23)
  {
    v36 = v19;
    v37 = v17;
    v38 = v10;
    v39 = v8;
    v40 = v4;
    objc_msgSend(v4, "allHTTPHeaderFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (MSASProtocol *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v31, "compare:options:", CFSTR("x-apple-mme-sharedstreams-client-token"), 1)
            && objc_msgSend(v31, "compare:options:", CFSTR("x-apple-mme-streams-client-udid"), 1)
            && objc_msgSend(v31, "compare:options:", CFSTR("authorization"), 1))
          {
            objc_msgSend(v26, "objectForKey:", v31);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = CFSTR("[present]");
          }
          -[MSASProtocol setObject:forKey:](v25, "setObject:forKey:", v32, v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v28);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v25;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Headers: %{public}@", buf, 0xCu);
    }
    v33 = objc_alloc(MEMORY[0x1E0CB3940]);
    v4 = v40;
    objc_msgSend(v40, "HTTPBody");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (MSASProtocol *)objc_msgSend(v33, "initWithData:encoding:", v34, 4);

    v17 = v37;
    v10 = v38;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v35;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }

    v8 = v39;
    v19 = v36;
  }

}

- (id)HTTPErrorWithStatusCode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0C930A8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_HTTP_ERROR_P_CODE"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MSErrorWithDomain:code:description:", v5, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)errorFromStandardProcessingOnResponse:(id)a3 responseObject:(id)a4 checkServerSideConfigVersion:(BOOL)a5 error:(id)a6 body:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  id v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  MSASProtocol *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v9 = a5;
  v73 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v11)
  {
    v23 = v13;
    goto LABEL_57;
  }
  v55 = v14;
  objc_msgSend(v11, "allHeaderFields");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("Retry-After")))
        {
          objc_msgSend(v16, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MSProtocolUtilities retryAfterDateBasedOnRetryAfterHeaderString:](MSProtocolUtilities, "retryAfterDateBasedOnRetryAfterHeaderString:", v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend(v11, "statusCode") != 200 && objc_msgSend(v11, "statusCode") != 207)
  {
    v54 = v17;
    if (objc_msgSend(v11, "statusCode") == 403)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("code"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("code"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

        if ((unint64_t)objc_msgSend(v22, "length") >= 4)
        {
          objc_msgSend(v22, "substringToIndex:", 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("401"));

          if (v37)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v66 = self;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Visitor authentication has failed. Client must reauth.", buf, 0xCu);
            }
            v38 = (void *)MEMORY[0x1E0CB35C8];
            v28 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_VISITOR_AUTH_FAILURE"));
            -[MSASProtocol HTTPErrorWithStatusCode:](self, "HTTPErrorWithStatusCode:", objc_msgSend(v11, "statusCode"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 18, v28, v39);
            v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_47:
            goto LABEL_48;
          }
        }

      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v53 = objc_msgSend(v11, "statusCode");
      *(_DWORD *)buf = 138543618;
      v66 = self;
      v67 = 2048;
      v68 = v53;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting response code %ld", buf, 0x16u);
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = (void *)MEMORY[0x1E0CB3940];
    v42 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_HTTP_ERROR_P_CODE"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "statusCode"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASProtocol HTTPErrorWithStatusCode:](self, "HTTPErrorWithStatusCode:", objc_msgSend(v11, "statusCode"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 4, v44, v45);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x1E0CB35C8];
    v28 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_CANNOT_CONTINUE"));
    objc_msgSend(v46, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 3, v28, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (v9)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = v16;
    v23 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    if (!v23)
    {
LABEL_49:

      goto LABEL_50;
    }
    v54 = v17;
    v24 = *(_QWORD *)v58;
    while (2)
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
        if (!objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("x-apple-mme-sharedstreams-config-version")))
        {
          objc_msgSend(v22, "objectForKey:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSASProtocol serverSideConfigVersion](self, "serverSideConfigVersion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", v28);

          if ((v30 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v66 = self;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Server side config version has changed.", buf, 0xCu);
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              -[MSASProtocol serverSideConfigVersion](self, "serverSideConfigVersion");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v66 = self;
              v67 = 2114;
              v68 = (uint64_t)v31;
              v69 = 2114;
              v70 = v28;
              _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Our version string: %{public}@, server’s version string: %{public}@", buf, 0x20u);

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0C99D80];
            -[MSASProtocol personID](self, "personID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "dictionaryWithObjectsAndKeys:", v34, CFSTR("personID"), 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("MSASPServerSideConfigurationDidChangeNotification"), self, v35);

          }
          v23 = 0;
          goto LABEL_47;
        }
      }
      v23 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
      if (v23)
        continue;
      break;
    }
LABEL_48:
    v17 = v54;
    goto LABEL_49;
  }
  v23 = 0;
LABEL_50:

  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[MSASProtocol personID](self, "personID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v66 = self;
      v67 = 2114;
      v68 = (uint64_t)v17;
      v69 = 2112;
      v70 = v47;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Posting retry-after date of %{public}@ for person ID %@.", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASProtocol personID](self, "personID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      -[MSASProtocol personID](self, "personID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKey:", v50, CFSTR("personID"));

    }
    objc_msgSend(v48, "setObject:forKey:", v17, CFSTR("retryAfterDate"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "postNotificationName:object:userInfo:", CFSTR("MSASPDidReceiveRetryAfterNotification"), self, v48);

  }
  v15 = v55;
LABEL_57:

  return v23;
}

- (id)_createAlbumURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("createalbum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_updateAlbumURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("updatealbum"));
}

- (id)_putAssetsURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("putassets"));
}

- (id)_getUploadTokensURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("getuploadtokens"));
}

- (id)_getVideoURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("getvideourl"));
}

- (id)_uploadCompleteURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("uploadcomplete"));
}

- (id)_shareURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_unshareURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("unshare"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addCommentURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("addcomment"));
}

- (id)_enablePublicAccessURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("setalbumpublic"));
}

- (id)_enableMultipleContributorsURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("setallowcontributions"));
}

- (id)_deleteURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("deletealbum"));
}

- (id)_deleteAssetsURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("deleteassets"));
}

- (id)_deleteCommentURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("deletecomment"));
}

- (id)_getChangesURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("getchanges"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sharingInfoURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("sharinginfo"));
}

- (id)_albumSummaryURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("albumsummary"));
}

- (id)_getAssetsURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("getassets"));
}

- (id)_getTokensURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("gettokens"));
}

- (id)_validateInvitationURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("validateinvitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subscribeURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("subscribe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_unsubscribeURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("unsubscribe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_reportSpamURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("reportspam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getCommentsURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("getcomments"));
}

- (id)_setCommentPositionURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("setcommentposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_albumStateURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("albumstate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_setAssetStateURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("setassetstate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_setAlbumStateURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("setalbumstate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_serverSideConfigURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getAlbumURL
{
  void *v2;
  void *v3;

  -[MSASProtocol baseURL](self, "baseURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("albumurl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)createAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  MSASProtocol *v22;
  id v23;
  uint8_t buf[4];
  MSASProtocol *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _createAlbumURL](self, "_createAlbumURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("albumguid"));

  }
  if (v11)
    objc_msgSend(v13, "setValue:forKey:", v11, CFSTR("attributes"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Creating album %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__MSASProtocol_createAlbum_completionBlock___block_invoke;
  v19[3] = &unk_1E95BCAC8;
  v20 = v6;
  v21 = v12;
  v22 = self;
  v23 = v7;
  v16 = v7;
  v17 = v12;
  v18 = v6;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v13, v19);

}

- (void)updateAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  MSASProtocol *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _updateAlbumURLWithBaseURL:](self, "_updateAlbumURLWithBaseURL:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "GUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("albumguid"));

  }
  objc_msgSend(v8, "ctag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v8, "ctag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("albumctag"));

  }
  if (v15)
    objc_msgSend(v16, "setValue:forKey:", v15, CFSTR("attributes"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Updating album %{public}@", buf, 0x16u);
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__MSASProtocol_updateAlbum_albumURLString_completionBlock___block_invoke;
  v22[3] = &unk_1E95BCC00;
  v22[4] = self;
  v23 = v10;
  v21 = v10;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v14, v16, v22);

}

- (void)putAssetCollections:(id)a3 intoAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  MSASProtocol *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  MSASProtocol *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32 = v12;
  if (v12)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C92C28];
  v31 = (void *)v14;
  -[MSASProtocol _putAssetsURLWithBaseURL:](self, "_putAssetsURLWithBaseURL:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestWithURL:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "GUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("albumguid"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "MSASPProtocolDictionary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v22);
  }

  objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("assets"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 138543874;
    v43 = self;
    v44 = 2048;
    v45 = v26;
    v46 = 2114;
    v47 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending metadata for %ld photos into album %{public}@.", buf, 0x20u);
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __77__MSASProtocol_putAssetCollections_intoAlbum_albumURLString_completionBlock___block_invoke;
  v33[3] = &unk_1E95BCAC8;
  v34 = v20;
  v35 = self;
  v36 = v11;
  v37 = v13;
  v27 = v13;
  v28 = v11;
  v29 = v20;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v30, v17, v33);

}

- (void)getUploadTokens:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  MSASProtocol *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  MSASProtocol *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v38 = a4;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = MEMORY[0x1E0C81028];
    v17 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v19, "MMCSAccessHeader");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            continue;
          objc_msgSend(v19, "MMCSAccessHeader");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = self;
          v50 = 2114;
          v51 = (uint64_t)v19;
          v52 = 2114;
          v53 = v21;
          _os_log_error_impl(&dword_1D3E94000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Requesting MMCS upload token for asset %{public}@ that already has token %{public}@. Ignoring the request.", buf, 0x20u);
          goto LABEL_11;
        }
        objc_msgSend(v19, "MMCSHash");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v19, "MMCSHash");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "MSHexString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v19, v23);

LABEL_11:
          continue;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v49 = self;
          v50 = 2114;
          v51 = (uint64_t)v19;
          _os_log_error_impl(&dword_1D3E94000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Empty MMCS hash for asset %{public}@ requesting upload token. Ignoring the request.", buf, 0x16u);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
  {
    v24 = v38;
    v25 = v36;
    if (v36)
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v36);
    else
      -[MSASProtocol baseURL](self, "baseURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v37;
    v29 = (void *)MEMORY[0x1E0C92C28];
    -[MSASProtocol _getUploadTokensURLWithBaseURL:](self, "_getUploadTokensURLWithBaseURL:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requestWithURL:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v37, CFSTR("albumguid"));
    objc_msgSend(v32, "setObject:forKey:", v38, CFSTR("assetguid"));
    objc_msgSend(v12, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v33, CFSTR("checksums"));

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543874;
      v49 = self;
      v50 = 2048;
      v51 = v34;
      v52 = 2114;
      v53 = v38;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting upload tokens for %ld assets of asset collection with GUID %{public}@.", buf, 0x20u);
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __106__MSASProtocol_getUploadTokens_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke;
    v40[3] = &unk_1E95BCB00;
    v41 = v12;
    v42 = self;
    v26 = v35;
    v43 = v35;
    -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v31, v32, v40);

  }
  else
  {
    v24 = v38;
    v26 = v35;
    v25 = v36;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      v50 = 2114;
      v51 = (uint64_t)v13;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Assets %{public}@ already have upload tokens. Ignoring the request.", buf, 0x16u);
    }
    (*((void (**)(id, _QWORD))v35 + 2))(v35, 0);
    v27 = v37;
  }

}

- (void)getVideoURL:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  MSASProtocol *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v15)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _getVideoURLWithBaseURL:](self, "_getVideoURLWithBaseURL:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestWithURL:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v14;
  objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("albumguid"));
  objc_msgSend(v21, "setObject:forKey:", v13, CFSTR("assetguid"));
  objc_msgSend(v12, "MMCSHash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "MSHexString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("checksum"));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v33 = self;
    v34 = 2114;
    v35 = v12;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset %{public}@.", buf, 0x16u);
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __102__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke;
  v28[3] = &unk_1E95BCAC8;
  v28[4] = self;
  v29 = v13;
  v30 = v12;
  v31 = v16;
  v24 = v16;
  v25 = v12;
  v26 = v13;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v20, v21, v28);

}

- (BOOL)responseDict:(id)a3 containsLimitErrorCode:(id)a4 outMaxAllowed:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char isKindOfClass;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("code"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("code"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14 || !objc_msgSend(v14, "isEqualToString:", v8))
      {
        isKindOfClass = 0;
        goto LABEL_16;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("maxallowed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("maxallowed"));
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (a5 && v12)
        {
          v12 = objc_retainAutorelease(v12);
          *a5 = v12;
        }
      }
      else
      {

        v12 = 0;
      }
    }
    else
    {
      v14 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  isKindOfClass = 0;
LABEL_17:

  return isKindOfClass & 1;
}

- (void)sendUploadCompleteSuccessfulAssetCollections:(id)a3 failedAssetCollections:(id)a4 album:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  MSASProtocol *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  MSASProtocol *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v55 = a4;
  v11 = a5;
  v57 = a6;
  objc_msgSend(v11, "URLString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v11, "URLString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MSASProtocol baseURL](self, "baseURL");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v59 = v11;

  v16 = (void *)MEMORY[0x1E0C92C28];
  v58 = (void *)v15;
  -[MSASProtocol _uploadCompleteURLWithBaseURL:](self, "_uploadCompleteURLWithBaseURL:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requestWithURL:", v17);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v10;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != (id)v63; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v61)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v19, "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("pendingUploadGUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v68, "setObject:forKey:", v19, v21);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v21;
          objc_msgSend(v22, "setObject:forKey:", v21, CFSTR("pendinguploadid"));
          objc_msgSend(v22, "setObject:forKey:", CFSTR("1"), CFSTR("promote"));
          v23 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v19, "assets");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "isVideo"))
            objc_msgSend(v22, "setObject:forKey:", CFSTR("video"), CFSTR("mediaAssetType"));
          v66 = i;
          if (objc_msgSend(v19, "isPhotoIris"))
            objc_msgSend(v22, "setObject:forKey:", CFSTR("videoCompl"), CFSTR("mediaAssetType"));
          v64 = v22;
          v79 = 0u;
          v80 = 0u;
          v78 = 0u;
          v77 = 0u;
          objc_msgSend(v19, "assets");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v78;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v78 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                objc_msgSend(v31, "MMCSReceipt");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "metadataValueForKey:", CFSTR("MSAssetMetadataFileSize"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "MMCSReceipt");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "setObject:forKey:", v35, CFSTR("receipt"));

                  if (v34)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v34, "unsignedLongLongValue"), v55);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setObject:forKey:", v36, CFSTR("size"));

                  }
                  objc_msgSend(v31, "MMCSHash");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v37)
                  {
                    objc_msgSend(v31, "MMCSHash");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "MSHexString");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setObject:forKey:", v39, CFSTR("checksum"));

                  }
                  objc_msgSend(v25, "addObject:", v33);

                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
            }
            while (v28);
          }

          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(v64, "setObject:forKey:", v25, CFSTR("files"));
            objc_msgSend(v62, "addObject:", v64);
          }

          v21 = v65;
          i = v66;
        }

      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    }
    while (v63);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v67 = v55;
  v40 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v74 != v42)
          objc_enumerationMutation(v67);
        v44 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
        objc_msgSend(v44, "metadata");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKey:", CFSTR("pendingUploadGUID"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v68, "setObject:forKey:", v44, v46);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKey:", v46, CFSTR("pendinguploadid"));
          objc_msgSend(v47, "setObject:forKey:", CFSTR("0"), CFSTR("promote"));
          objc_msgSend(v62, "addObject:", v47);

        }
      }
      v41 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    }
    while (v41);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKey:", v62, CFSTR("assets"));
  objc_msgSend(v59, "GUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v59, "GUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v50, CFSTR("albumguid"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v51 = objc_msgSend(obj, "count");
    v52 = objc_msgSend(v67, "count");
    *(_DWORD *)buf = 138543874;
    v86 = self;
    v87 = 2048;
    v88 = v51;
    v89 = 2048;
    v90 = v52;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending upload complete with %ld successful uploads and %ld failed uploads.", buf, 0x20u);
  }
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __106__MSASProtocol_sendUploadCompleteSuccessfulAssetCollections_failedAssetCollections_album_completionBlock___block_invoke;
  v69[3] = &unk_1E95BCB00;
  v70 = v68;
  v71 = self;
  v72 = v57;
  v53 = v57;
  v54 = v68;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v56, v48, v69);

}

- (void)addSharingRelationships:(id)a3 toAlbum:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  MSASProtocol *v38;
  void *v39;
  void *v40;
  id obj;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v35 = a5;
  v10 = (void *)MEMORY[0x1E0C92C28];
  v38 = self;
  -[MSASProtocol _shareURL](self, "_shareURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v9, "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("albumguid"));

  }
  objc_msgSend(v9, "ctag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v9, "ctag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("albumctag"));

  }
  v36 = v9;
  v37 = v13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v50;
    v40 = v18;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v19);
        objc_msgSend(*(id *)(v12 + 3592), "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "GUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("invitationguid"));
          objc_msgSend(v42, "addObject:", v22);
        }
        objc_msgSend(v20, "phones");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "emails");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 && objc_msgSend(v23, "count"))
          objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("phonenumbers"));
        if (v24 && objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "objectAtIndex:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("email"));
          if ((unint64_t)objc_msgSend(v24, "count") >= 2)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v25);
            if (objc_msgSend(v26, "count"))
            {
              objc_msgSend(v26, "allObjects");
              v27 = v12;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("alternateemails"));

              v12 = v27;
              v18 = v40;
            }

          }
        }
        else
        {
          objc_msgSend(v20, "email");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("email"));
        }

        objc_msgSend(v20, "firstName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v21, "setObject:forKey:", v29, CFSTR("firstname"));
        objc_msgSend(v20, "lastName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v21, "setObject:forKey:", v30, CFSTR("lastname"));
        objc_msgSend(v20, "fullName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("fullname"));
        objc_msgSend(v18, "addObject:", v21);

        ++v19;
      }
      while (v44 != v19);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v44);
  }

  objc_msgSend(v37, "setObject:forKey:", v18, CFSTR("invitations"));
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke;
  v45[3] = &unk_1E95BCAC8;
  v45[4] = v38;
  v46 = v36;
  v47 = v42;
  v48 = v35;
  v32 = v35;
  v33 = v42;
  v34 = v36;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](v38, "sendURLRequest:bodyObj:completionBlock:", v39, v37, v45);

}

- (void)removeSharingRelationships:(id)a3 fromAlbum:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  MSASProtocol *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C92C28];
  v29 = self;
  -[MSASProtocol _unshareURL](self, "_unshareURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithURL:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v9, "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("albumguid"));

  }
  objc_msgSend(v9, "ctag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v9, "ctag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("albumctag"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v24, "GUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v24, "GUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("invitations"));
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69__MSASProtocol_removeSharingRelationships_fromAlbum_completionBlock___block_invoke;
  v30[3] = &unk_1E95BCB78;
  v31 = v10;
  v27 = v10;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](v29, "sendURLRequest:bodyObj:completionBlock:", v28, v13, v30);

}

- (void)addComment:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v15)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C92C28];
  v38 = (void *)v17;
  -[MSASProtocol _addCommentURLWithBaseURL:](self, "_addCommentURLWithBaseURL:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestWithURL:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "GUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v14, "GUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("albumguid"));

  }
  objc_msgSend(v13, "GUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v13, "GUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("assetguid"));

  }
  objc_msgSend(v12, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "timestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%f"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v30, CFSTR("commenttimestamp"));

  }
  if (objc_msgSend(v12, "isBatchComment"))
    v31 = CFSTR("1");
  else
    v31 = CFSTR("0");
  objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("isbatchcomment"));
  if (objc_msgSend(v12, "isLike"))
  {
    objc_msgSend(v21, "setObject:forKey:", CFSTR("1"), CFSTR("commenttype"));
    v32 = v38;
  }
  else
  {
    objc_msgSend(v21, "setObject:forKey:", CFSTR("0"), CFSTR("commenttype"));
    objc_msgSend(v12, "content");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v38;
    if (v33)
    {
      objc_msgSend(v12, "content");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v34, CFSTR("comment"));

    }
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __84__MSASProtocol_addComment_toAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke;
  v39[3] = &unk_1E95BCAC8;
  v39[4] = self;
  v40 = v14;
  v41 = v13;
  v42 = v16;
  v35 = v16;
  v36 = v13;
  v37 = v14;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v20, v21, v39);

}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "URLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "URLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MSASProtocol baseURL](self, "baseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _enablePublicAccessURLWithBaseURL:](self, "_enablePublicAccessURLWithBaseURL:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("albumguid"));

  }
  if (v6)
    v20 = CFSTR("1");
  else
    v20 = CFSTR("0");
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("ispublic"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__MSASProtocol_setPublicAccessEnabled_forAlbum_completionBlock___block_invoke;
  v22[3] = &unk_1E95BCB78;
  v23 = v9;
  v21 = v9;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v16, v17, v22);

}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "URLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "URLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MSASProtocol baseURL](self, "baseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _enableMultipleContributorsURLWithBaseURL:](self, "_enableMultipleContributorsURLWithBaseURL:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("albumguid"));

  }
  if (v6)
    v20 = CFSTR("1");
  else
    v20 = CFSTR("0");
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("allowcontributions"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__MSASProtocol_setMultipleContributorsEnabled_forAlbum_completionBlock___block_invoke;
  v22[3] = &unk_1E95BCB78;
  v23 = v9;
  v21 = v9;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v16, v17, v22);

}

- (void)deleteAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  MSASProtocol *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "URLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MSASProtocol baseURL](self, "baseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v12 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _deleteURLWithBaseURL:](self, "_deleteURLWithBaseURL:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "GUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("albumguid"));

  }
  objc_msgSend(v6, "ctag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "ctag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("albumctag"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete album %{public}@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__MSASProtocol_deleteAlbum_completionBlock___block_invoke;
  v21[3] = &unk_1E95BCB78;
  v22 = v7;
  v20 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v14, v15, v21);

}

- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  MSASProtocol *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = a5;
  objc_msgSend(v9, "URLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "URLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MSASProtocol baseURL](self, "baseURL");
    v13 = objc_claimAutoreleasedReturnValue();
  }

  v14 = (void *)MEMORY[0x1E0C92C28];
  v32 = (void *)v13;
  -[MSASProtocol _deleteAssetsURLWithBaseURL:](self, "_deleteAssetsURLWithBaseURL:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v23, "GUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v23, "GUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v17, CFSTR("assets"));
  objc_msgSend(v9, "GUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v9, "GUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("albumguid"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v29 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 138543618;
    v40 = self;
    v41 = 2048;
    v42 = v29;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete %ld photos.", buf, 0x16u);
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __63__MSASProtocol_deleteAssetCollections_inAlbum_completionBlock___block_invoke;
  v33[3] = &unk_1E95BCB78;
  v34 = v31;
  v30 = v31;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v16, v26, v33);

}

- (void)deleteComment:(id)a3 fromAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  MSASProtocol *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v15)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASProtocol _deleteCommentURLWithBaseURL:](self, "_deleteCommentURLWithBaseURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "GUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v14, "GUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("albumguid"));

  }
  objc_msgSend(v13, "GUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v13, "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v24, CFSTR("assetguid"));

  }
  v31 = v13;
  if ((objc_msgSend(v12, "ID") & 0x80000000) != 0)
  {
    objc_msgSend(v12, "timestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_13;
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "timestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%f"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v29, CFSTR("commenttimestamp"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v12, "ID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v25, CFSTR("commentposition"));
  }

LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v35 = self;
    v36 = 2114;
    v37 = v12;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete comment %{public}@", buf, 0x16u);
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __89__MSASProtocol_deleteComment_fromAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke;
  v32[3] = &unk_1E95BCB78;
  v33 = v16;
  v30 = v16;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v19, v20, v32);

}

- (void)getChangesRootCtag:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MSASProtocol *v17;
  id v18;
  uint8_t buf[4];
  MSASProtocol *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _getChangesURL](self, "_getChangesURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
    objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("rootctag"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting changes since root ctag %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__MSASProtocol_getChangesRootCtag_completionBlock___block_invoke;
  v15[3] = &unk_1E95BCB00;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v12, v15);

}

- (void)getSharingInfoForAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  MSASProtocol *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASProtocol _sharingInfoURLWithBaseURL:](self, "_sharingInfoURLWithBaseURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "GUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("albumguid"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting sharing relationships for album %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__MSASProtocol_getSharingInfoForAlbum_albumURLString_completionBlock___block_invoke;
  v19[3] = &unk_1E95BCC00;
  v20 = v8;
  v21 = v10;
  v17 = v10;
  v18 = v8;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v13, v14, v19);

}

- (void)albumSummaryAlbum:(id)a3 albumURLString:(id)a4 resetSync:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  MSASProtocol *v26;
  id v27;
  uint8_t buf[4];
  MSASProtocol *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASProtocol _albumSummaryURLWithBaseURL:](self, "_albumSummaryURLWithBaseURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v16 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "useForeignCtag"))
      objc_msgSend(v10, "foreignCtag");
    else
      objc_msgSend(v10, "ctag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "GUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v10, "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("albumguid"));

  }
  if (v16)
    objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("albumctag"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting summary of changes for album %{public}@.", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke;
  v23[3] = &unk_1E95BCAC8;
  v24 = v10;
  v25 = v16;
  v26 = self;
  v27 = v12;
  v20 = v12;
  v21 = v16;
  v22 = v10;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v15, v17, v23);

}

- (void)getAssetCollections:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  MSASProtocol *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  MSASProtocol *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33 = a6;
  v36 = v12;
  if (v12)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASProtocol _getAssetsURLWithBaseURL:](self, "_getAssetsURLWithBaseURL:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "GUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v11, "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("albumguid"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v24, "GUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v24, "GUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v24, v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v21);
  }

  objc_msgSend(v18, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v27, CFSTR("assets"));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v28 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 138543874;
    v48 = self;
    v49 = 2048;
    v50 = v28;
    v51 = 2114;
    v52 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Requesting metadata for %ld photos in album %{public}@.", buf, 0x20u);
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __75__MSASProtocol_getAssetCollections_inAlbum_albumURLString_completionBlock___block_invoke;
  v37[3] = &unk_1E95BCBA0;
  v38 = v19;
  v39 = v18;
  v40 = self;
  v41 = v11;
  v42 = v33;
  v29 = v33;
  v30 = v11;
  v31 = v18;
  v32 = v19;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v34, v15, v37);

}

- (id)_couldNotReauthorizeError
{
  if (_couldNotReauthorizeError_onceToken != -1)
    dispatch_once(&_couldNotReauthorizeError_onceToken, &__block_literal_global_394);
  return (id)_couldNotReauthorizeError_error;
}

- (void)getTokensForAssets:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  MSASProtocol *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  MSASProtocol *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = a6;
  if (v12)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  -[MSASProtocol _getTokensURLWithBaseURL:](self, "_getTokensURLWithBaseURL:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "GUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("albumguid"));

  }
  v30 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v23, "assetCollectionGUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v23, "assetCollectionGUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v20);
  }

  objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("assets"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 138543874;
    v45 = self;
    v46 = 2048;
    v47 = v26;
    v48 = 2114;
    v49 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting tokens for %ld assets from album %{public}@", buf, 0x20u);
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __74__MSASProtocol_getTokensForAssets_inAlbum_albumURLString_completionBlock___block_invoke;
  v35[3] = &unk_1E95BCAC8;
  v36 = v30;
  v37 = self;
  v38 = v11;
  v39 = v31;
  v27 = v31;
  v28 = v11;
  v29 = v30;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v32, v15, v35);

}

- (void)subscribeToAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  MSASProtocol *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _subscribeURL](self, "_subscribeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("albumguid"));

  }
  objc_msgSend(v6, "ctag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "ctag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("albumctag"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Subscribing to album %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__MSASProtocol_subscribeToAlbum_completionBlock___block_invoke;
  v17[3] = &unk_1E95BCC00;
  v17[4] = self;
  v18 = v7;
  v16 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v11, v17);

}

- (void)unsubscribeFromAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  MSASProtocol *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _unsubscribeURL](self, "_unsubscribeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("albumguid"));

  }
  objc_msgSend(v6, "ctag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "ctag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("albumctag"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Unsubscribing from album %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__MSASProtocol_unsubscribeFromAlbum_completionBlock___block_invoke;
  v17[3] = &unk_1E95BCB78;
  v18 = v7;
  v16 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v11, v17);

}

- (void)markAsSpamInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  MSASProtocol *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _reportSpamURL](self, "_reportSpamURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("albumguid"));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Marking as spam invitation for album %{public}@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__MSASProtocol_markAsSpamInvitationForAlbum_completionBlock___block_invoke;
  v14[3] = &unk_1E95BCB78;
  v15 = v7;
  v13 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v11, v14);

}

- (void)markAsSpamInvitationForToken:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  MSASProtocol *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _reportSpamURL](self, "_reportSpamURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("invitationtoken"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Marking as spam invitation with token %{public}@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__MSASProtocol_markAsSpamInvitationForToken_completionBlock___block_invoke;
  v13[3] = &unk_1E95BCB78;
  v14 = v7;
  v12 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v11, v13);

}

- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  MSASProtocol *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _subscribeURL](self, "_subscribeURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
    objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("invitationtoken"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Accepting invitation using token.", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__MSASProtocol_acceptInvitationWithToken_completionBlock___block_invoke;
  v14[3] = &unk_1E95BCB78;
  v15 = v7;
  v13 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v12, v14);

}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  MSASProtocol *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _validateInvitationURL](self, "_validateInvitationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataValueForKey:", CFSTR("phoneInvitationToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("invitationtoken"));
  objc_msgSend(v6, "metadataValueForKey:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("albumname"));
  objc_msgSend(v6, "metadataValueForKey:", CFSTR("inviterAddress"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("idsfromid"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Validating invitation token %@ for album %@.", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__MSASProtocol_validateInvitationForAlbum_completionBlock___block_invoke;
  v17[3] = &unk_1E95BCC00;
  v18 = v12;
  v19 = v7;
  v15 = v12;
  v16 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v11, v17);

}

- (void)getCommentChanges:(id)a3 inAlbumWithGUID:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  MSASProtocol *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  else
    -[MSASProtocol baseURL](self, "baseURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASProtocol _getCommentsURLWithBaseURL:](self, "_getCommentsURLWithBaseURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v11)
    objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("albumguid"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__MSASProtocol_getCommentChanges_inAlbumWithGUID_albumURLString_completionBlock___block_invoke;
  v25[3] = &unk_1E95BCA98;
  v21 = v19;
  v26 = v21;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v25);
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("assets"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v28 = self;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retrieving comments for asset collections %{public}@ in album %{public}@", buf, 0x20u);
  }
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __81__MSASProtocol_getCommentChanges_inAlbumWithGUID_albumURLString_completionBlock___block_invoke_407;
  v23[3] = &unk_1E95BCC00;
  v23[4] = self;
  v24 = v13;
  v22 = v13;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v16, v18, v23);

}

- (void)getAlbumSyncedStateForAlbum:(id)a3 assetCollectionStateBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  MSASProtocol *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MSASProtocol _albumStateURL](self, "_albumStateURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "GUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("albumguid"));

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Getting synced state for album %{public}@.", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__MSASProtocol_getAlbumSyncedStateForAlbum_assetCollectionStateBlock_completionBlock___block_invoke;
  v18[3] = &unk_1E95BCC28;
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v12, v13, v18);

}

- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 assetCollectionStateCtag:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  MSASProtocol *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  -[MSASProtocol _setAssetStateURL](self, "_setAssetStateURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "GUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v14, "GUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("albumguid"));

  }
  objc_msgSend(v13, "GUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v13, "GUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v23, CFSTR("assetguid"));

  }
  if (v15)
    v24 = v15;
  else
    v24 = &stru_1E95BDC28;
  objc_msgSend(v19, "setObject:forKey:", v24, CFSTR("assetstatectag"));
  if (v12)
    objc_msgSend(v19, "setObject:forKey:", v12, CFSTR("state"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v29 = self;
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = v14;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for asset collection %{public}@ in album %{public}@", buf, 0x20u);
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __114__MSASProtocol_setAssetCollectionSyncedState_forAssetCollection_inAlbum_assetCollectionStateCtag_completionBlock___block_invoke;
  v26[3] = &unk_1E95BCB78;
  v27 = v16;
  v25 = v16;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v18, v19, v26);

}

- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 albumStateCtag:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  MSASProtocol *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MSASProtocol _setAlbumStateURL](self, "_setAlbumStateURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "GUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "GUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("albumguid"));

  }
  if (v12)
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("albumstatectag"));
  if (v10)
    objc_msgSend(v16, "setObject:forKey:", v10, CFSTR("state"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for album %{public}@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__MSASProtocol_setAlbumSyncedState_forAlbum_albumStateCtag_completionBlock___block_invoke;
  v20[3] = &unk_1E95BCB78;
  v21 = v13;
  v19 = v13;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v15, v16, v20);

}

- (void)getServerSideConfigCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  MSASProtocol *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _serverSideConfigURL](self, "_serverSideConfigURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Refreshing server-side configuration.", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__MSASProtocol_getServerSideConfigCompletionBlock___block_invoke;
  v9[3] = &unk_1E95BCB78;
  v10 = v4;
  v8 = v4;
  -[MSASProtocol sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:](self, "sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:", v7, CFSTR("GET"), 0, 0, v9);

}

- (void)getAlbumURLForAlbumWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  MSASProtocol *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C92C28];
  -[MSASProtocol _getAlbumURL](self, "_getAlbumURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retrieving new album URL for album with GUID %{public}@.", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
    objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("albumguid"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__MSASProtocol_getAlbumURLForAlbumWithGUID_completionBlock___block_invoke;
  v14[3] = &unk_1E95BCB78;
  v15 = v7;
  v13 = v7;
  -[MSASProtocol sendURLRequest:bodyObj:completionBlock:](self, "sendURLRequest:bodyObj:completionBlock:", v10, v12, v14);

}

- (MSASPConnectionGate)gate
{
  return self->_gate;
}

- (void)setGate:(id)a3
{
  objc_storeStrong((id *)&self->_gate, a3);
}

- (OS_dispatch_queue)pendingConnectionsQueue
{
  return self->_pendingConnectionsQueue;
}

- (void)setPendingConnectionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConnectionsQueue, a3);
}

- (OS_dispatch_group)pendingConnectionsGroup
{
  return self->_pendingConnectionsGroup;
}

- (void)setPendingConnectionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConnectionsGroup, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)serverSideConfigVersion
{
  return self->_serverSideConfigVersion;
}

- (void)setServerSideConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_serverSideConfigVersion, a3);
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (NSString)headerVersion
{
  return self->_headerVersion;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_headerVersion, 0);
  objc_storeStrong((id *)&self->_serverSideConfigVersion, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_pendingConnectionsGroup, 0);
  objc_storeStrong((id *)&self->_pendingConnectionsQueue, 0);
  objc_storeStrong((id *)&self->_gate, 0);
}

void __60__MSASProtocol_getAlbumURLForAlbumWithGUID_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "objectForKey:", CFSTR("albumlocation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("albumlocation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__MSASProtocol_getServerSideConfigCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v7 = v8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__MSASProtocol_setAlbumSyncedState_forAlbum_albumStateCtag_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "objectForKey:", CFSTR("albumstatectag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("albumstatectag"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __114__MSASProtocol_setAssetCollectionSyncedState_forAssetCollection_inAlbum_assetCollectionStateCtag_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) == 0;
  v8 = v10;
  if (v7)
    v8 = 0;
  objc_msgSend(v8, "objectForKey:", CFSTR("assetstatectag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__MSASProtocol_getAlbumSyncedStateForAlbum_assetCollectionStateBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v10, "objectForKey:", CFSTR("assetstates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("assetstates"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v10;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "objectForKey:", CFSTR("assetstatectag"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("assetstatectag"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = 0;
          }

          objc_msgSend(v17, "objectForKey:", CFSTR("assetguid"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("assetguid"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 && v21)
            {
              v20 = (void *)objc_msgSend(v17, "mutableCopy");
              objc_msgSend(v20, "removeObjectForKey:", CFSTR("assetstatectag"));
              objc_msgSend(v20, "removeObjectForKey:", CFSTR("assetguid"));
              (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
              goto LABEL_22;
            }
          }
          else
          {
            v21 = 0;
LABEL_22:

          }
          continue;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(v23, "objectForKey:", CFSTR("albumstatectag"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "objectForKey:", CFSTR("albumstatectag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v5 = 0;

  v8 = (void *)objc_msgSend(v23, "mutableCopy");
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("assetstates"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("albumguid"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("albumstatectag"));

LABEL_30:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__MSASProtocol_getCommentChanges_inAlbumWithGUID_albumURLString_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = objc_msgSend(a3, "intValue");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("assetguid"));

  if ((v6 & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("commentposition"));

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __81__MSASProtocol_getCommentChanges_inAlbumWithGUID_albumURLString_completionBlock___block_invoke_407(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MSASCommentChange *v30;
  MSASCommentChange *v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  MSASCommentChange *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v44 = a2;
  v7 = a3;
  v8 = a4;
  v43 = v8;
  if (!v7)
  {
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v42 = v10;
    objc_msgSend(v42, "objectForKey:", CFSTR("assets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v42, "objectForKey:", CFSTR("assets"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v7;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (!v12)
    {
LABEL_59:

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = 0;
      goto LABEL_60;
    }
    v13 = v12;
    v14 = *(_QWORD *)v60;
    v50 = a1;
    v45 = *(_QWORD *)v60;
LABEL_10:
    v15 = 0;
    v47 = v13;
    while (1)
    {
      if (*(_QWORD *)v60 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v15);
      objc_msgSend(v16, "objectForKey:", CFSTR("assetguid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_56;
      objc_msgSend(v16, "objectForKey:", CFSTR("assetguid"));
      v18 = objc_claimAutoreleasedReturnValue();

      v51 = (void *)v18;
      if (v18)
        break;
LABEL_57:
      if (++v15 == v13)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (!v13)
          goto LABEL_59;
        goto LABEL_10;
      }
    }
    objc_msgSend(v16, "objectForKey:", CFSTR("comments"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "objectForKey:", CFSTR("comments"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v56;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v56 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v25);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v26, "objectForKey:", CFSTR("commenttype"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v26, "objectForKey:", CFSTR("commenttype"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v28 = 0;
            }

            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("0")) & 1) != 0
              || objc_msgSend(v28, "isEqualToString:", CFSTR("1")))
            {
              +[MSASComment MSASPCommentFromProtocolDictionary:](MSASComment, "MSASPCommentFromProtocolDictionary:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = objc_alloc_init(MSASCommentChange);
                -[MSASCommentChange setComment:](v30, "setComment:", v29);
                objc_msgSend(v54, "addObject:", v30);

              }
            }
            else if (objc_msgSend(v28, "isEqualToString:", CFSTR("99")))
            {
              v31 = objc_alloc_init(MSASCommentChange);
              -[MSASCommentChange setType:](v31, "setType:", 1);
              objc_msgSend(v26, "objectForKey:", CFSTR("commentposition"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v26, "objectForKey:", CFSTR("commentposition"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v34;
              }
              else
              {
                v34 = 0;
              }
              -[MSASCommentChange setDeletionIndex:](v31, "setDeletionIndex:", objc_msgSend(v34, "intValue"));
              if ((isKindOfClass & 1) != 0)

              objc_msgSend(v54, "addObject:", v31);
            }
            else if (objc_msgSend(v28, "isEqualToString:", CFSTR("89")))
            {
              +[MSASComment MSASPCommentFromProtocolDictionary:](MSASComment, "MSASPCommentFromProtocolDictionary:", v26);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                v36 = objc_alloc_init(MSASCommentChange);
                -[MSASCommentChange setComment:](v36, "setComment:", v35);
                -[MSASCommentChange setType:](v36, "setType:", 2);
                objc_msgSend(v26, "objectForKey:", CFSTR("deletedcommentposition"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v38 = objc_opt_isKindOfClass();
                if ((v38 & 1) != 0)
                {
                  objc_msgSend(v26, "objectForKey:", CFSTR("deletedcommentposition"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v39;
                }
                else
                {
                  v39 = 0;
                }
                -[MSASCommentChange setDeletionIndex:](v36, "setDeletionIndex:", objc_msgSend(v39, "intValue"));
                if ((v38 & 1) != 0)

                objc_msgSend(v54, "addObject:", v36);
              }

            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v40 = *(_QWORD *)(v50 + 32);
              *(_DWORD *)buf = 138543618;
              v64 = v40;
              v65 = 2114;
              v66 = v28;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unknown comment type: %{public}@. Ignoring", buf, 0x16u);
            }

          }
          ++v25;
        }
        while (v23 != v25);
        v41 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        v23 = v41;
      }
      while (v41);
    }

    v17 = v51;
    objc_msgSend(v46, "setObject:forKey:", v54, v51);

    v15 = v49;
    a1 = v50;
    v13 = v47;
    v14 = v45;
LABEL_56:

    goto LABEL_57;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_60:

}

void __59__MSASProtocol_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v13;
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "objectForKey:", CFSTR("isvalid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("invitationtoken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v9))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MODEL_INVALID_INVITATION"));
      objc_msgSend(v10, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASModelErrorDomain"), 5, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __58__MSASProtocol_acceptInvitationWithToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__MSASProtocol_markAsSpamInvitationForToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__MSASProtocol_markAsSpamInvitationForAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__MSASProtocol_unsubscribeFromAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__MSASProtocol_subscribeToAlbum_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v16 = 0;
  v8 = objc_msgSend(v7, "responseDict:containsLimitErrorCode:outMaxAllowed:", a4, CFSTR("4033"), &v16);
  v9 = v16;
  v10 = v6;
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_SUBSCRIPTIONS_P_COUNT"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 15, v15, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__MSASProtocol_getTokensForAssets_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v57 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "setObject:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v12);
    }
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v7;
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend(v16, "objectForKey:", CFSTR("contenturl"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "objectForKey:", CFSTR("contenturl"));
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v63 = v20;
        v64 = 2114;
        v65 = v19;
        v66 = 2114;
        v67 = v21;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Using contentURL %{public}@ for album %{public}@", buf, 0x20u);
      }
      goto LABEL_19;
    }
  }
  else
  {

    v18 = 0;
  }
  v19 = 0;
LABEL_19:
  v42 = (void *)v18;
  v43 = v7;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  obj = v22;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v53;
    v44 = *(_QWORD *)v53;
    v45 = v9;
    do
    {
      v26 = 0;
      v46 = v24;
      do
      {
        if (*(_QWORD *)v53 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v26);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(obj, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(obj, "objectForKey:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = 0;
          }

          objc_msgSend(v27, "MSHexData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(*(id *)(a1 + 32), "count");
          if (v31 - 1 >= 0)
          {
            do
            {
              objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", --v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "MMCSHash");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqualToData:", v30);

              if (v34)
              {
                objc_msgSend(v32, "setMMCSAccessHeader:", v29);
                if (v19)
                  objc_msgSend(v32, "setMMCSURL:", v19);
                objc_msgSend(v8, "addObject:", v32);
                objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v31);
              }

            }
            while (v31 > 0);
          }

          v25 = v44;
          v9 = v45;
          v24 = v46;
        }
        ++v26;
      }
      while (v26 != v24);
      v22 = obj;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v24);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v35 = *(id *)(a1 + 32);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "_couldNotReauthorizeError");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v41, v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v37);
  }

  v7 = v43;
  v6 = 0;
  v10 = obj;
LABEL_45:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __41__MSASProtocol__couldNotReauthorizeError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_NOT_REAUTHED"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 11, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_couldNotReauthorizeError_error;
  _couldNotReauthorizeError_error = v1;

}

void __75__MSASProtocol_getAssetCollections_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id obj;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  id v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (_QWORD *)a1;
  v58 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v10 = 0;
  if (!v6)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("albumctag"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("albumctag"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v9, "objectForKey:", CFSTR("contenturl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = (void *)v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("contenturl"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v54 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("contenttokens"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("contenttokens"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = v17;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v77 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(obj, "objectForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "MSHexData");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v24, v25);

          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      }
      while (v20);
    }

    objc_msgSend(v9, "objectForKey:", CFSTR("assets"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("assets"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v63 = v27;
    v28 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v73;
      v60 = *(_QWORD *)v73;
      do
      {
        v31 = 0;
        v62 = v29;
        do
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(v63);
          v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v31);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v32, "objectForKey:", CFSTR("assetctag"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v32, "objectForKey:", CFSTR("assetctag"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v67 = 0;
            }

            +[MSASAssetCollection MSASPAssetCollectionFromProtocolDictionary:](MSASAssetCollection, "MSASPAssetCollectionFromProtocolDictionary:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              v66 = v34;
              objc_msgSend(v34, "setCtag:", v67);
              objc_msgSend(v32, "objectForKey:", CFSTR("hascomments"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v32, "objectForKey:", CFSTR("hascomments"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v37 = 0;
              }

              v64 = v37;
              objc_msgSend(v66, "setHasComments:", (int)objc_msgSend(v37, "intValue") > 0);
              objc_msgSend(v61, "addObject:", v66);
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              objc_msgSend(v66, "assets");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v40; ++j)
                  {
                    if (*(_QWORD *)v69 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                    objc_msgSend(v43, "setMMCSURL:", v15);
                    objc_msgSend(v43, "MMCSHash");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectForKey:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setMMCSAccessHeader:", v45);

                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v68, v90, 16);
                }
                while (v40);
              }

              v35 = v66;
              objc_msgSend(v66, "GUID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = v60;
              if (v46)
              {
                v47 = (void *)v59[5];
                objc_msgSend(v66, "GUID");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKey:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                if (v49)
                  objc_msgSend(v58, "removeObject:", v49);

                v35 = v66;
              }

            }
            v29 = v62;
          }
          ++v31;
        }
        while (v31 != v29);
        v29 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
      }
      while (v29);
    }

    v7 = v57;
    v6 = 0;
    v10 = v55;
    v9 = v56;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v50 = v59[6];
    v51 = objc_msgSend(v61, "count");
    v52 = objc_msgSend(v58, "count");
    v53 = v59[7];
    *(_DWORD *)buf = 138544386;
    v81 = v50;
    v82 = 2048;
    v83 = v51;
    v84 = 2048;
    v85 = v52;
    v86 = 2114;
    v87 = v53;
    v88 = 2114;
    v89 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished receiving metadata for %ld assets and skipped %ld assets, in album %{public}@. Error: %{public}@", buf, 0x34u);
  }
  (*(void (**)(void))(v59[8] + 16))();

}

void __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  MSASAssetCollectionChange *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char isKindOfClass;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id obj;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v61 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  if (v7)
  {
    v11 = 0;
    v12 = 0;
    v63 = 0;
    goto LABEL_58;
  }
  +[MSASAlbum albumWithAlbum:](MSASAlbum, "albumWithAlbum:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("albumctag"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("albumctag"));
    v58 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addEntriesFromDictionary:", v15);

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("attributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("attributes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addEntriesFromDictionary:", v17);

  }
  else
  {
    objc_msgSend(v60, "addEntriesFromDictionary:", 0);
  }

  objc_msgSend(v12, "setMetadata:", v60);
  objc_msgSend(v10, "objectForKey:", CFSTR("publicurl"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("publicurl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  if (objc_msgSend(v19, "length"))
    v20 = v19;
  else
    v20 = 0;
  objc_msgSend(v12, "setPublicURLString:", v20);
  objc_msgSend(v10, "objectForKey:", CFSTR("isfamilysharealbum"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("isfamilysharealbum"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 && (objc_msgSend(v22, "isEqualToString:", CFSTR("1")) & 1) != 0)
    {
      v23 = 1;
      goto LABEL_26;
    }
  }
  else
  {

    v22 = 0;
  }
  v23 = 0;
LABEL_26:
  objc_msgSend(v12, "setIsFamilySharedAlbum:", v23);
  objc_msgSend(v10, "objectForKey:", CFSTR("ctagrespected"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("ctagrespected"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  v56 = v25;
  objc_msgSend(v25, "isEqualToString:", CFSTR("0"));
  objc_msgSend(v10, "objectForKey:", CFSTR("assets"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("assets"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v57 = v22;

  v55 = v27;
  if (objc_msgSend(v27, "count"))
  {
    v51 = v19;
    v52 = v12;
    v53 = v10;
    v54 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v27;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v65 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          v33 = objc_alloc_init(MSASAssetCollectionChange);
          objc_msgSend(v32, "objectForKey:", CFSTR("assetguid"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v32, "objectForKey:", CFSTR("assetguid"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAssetCollectionChange setGUID:](v33, "setGUID:", v35);

          }
          else
          {
            -[MSASAssetCollectionChange setGUID:](v33, "setGUID:", 0);
          }

          objc_msgSend(v32, "objectForKey:", CFSTR("assetctag"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v32, "objectForKey:", CFSTR("assetctag"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAssetCollectionChange setCtag:](v33, "setCtag:", v37);

          }
          else
          {
            -[MSASAssetCollectionChange setCtag:](v33, "setCtag:", 0);
          }

          objc_msgSend(v32, "objectForKey:", CFSTR("delete"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v32, "objectForKey:", CFSTR("delete"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v40;
          }
          else
          {
            v40 = 0;
          }
          -[MSASAssetCollectionChange setWasDeleted:](v33, "setWasDeleted:", objc_msgSend(v40, "BOOLValue"));
          if ((isKindOfClass & 1) != 0)

          objc_msgSend(v63, "addObject:", v33);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v29);
    }

    v41 = v7;
    v8 = v54;
    v12 = v52;
    v10 = v53;
    v42 = v51;
  }
  else
  {
    v41 = 0;
    v63 = 0;
    v42 = v19;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("sharinginfochanged"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = (void *)v58;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_56;
  objc_msgSend(v10, "objectForKey:", CFSTR("sharinginfochanged"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v43 = v44;
    objc_msgSend(v44, "isEqualToString:", CFSTR("1"));
LABEL_56:

  }
  v7 = v41;
LABEL_58:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v45 = v10;
    v46 = v12;
    v47 = v11;
    v48 = *(_QWORD *)(a1 + 48);
    v49 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "MSVerboseDescription");
    v59 = v7;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v69 = v48;
    v11 = v47;
    v12 = v46;
    v10 = v45;
    v70 = 2114;
    v71 = v49;
    v72 = 2114;
    v73 = v50;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished retrieving album summary for album %{public}@. Error: %{public}@", buf, 0x20u);

    v7 = v59;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__MSASProtocol_getSharingInfoForAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_opt_class();
    v24 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "objectForKey:", CFSTR("sharinginfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("sharinginfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v10;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;
          v20 = v19;
          +[MSASSharingRelationship MSASPSharingRelationshipFromProtocolDictionary:](MSASSharingRelationship, "MSASPSharingRelationshipFromProtocolDictionary:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(*(id *)(a1 + 32), "GUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setAlbumGUID:", v22);

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v21;
              _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Found sharing relationship: %@", buf, 0xCu);
            }
            objc_msgSend(v8, "addObject:", v21);
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v15);
    }

    v7 = v24;
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__MSASProtocol_getChangesRootCtag_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char isKindOfClass;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  MSASAlbumChange *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t j;
  MSASAlbumChange *v55;
  MSASAlbumChange *v56;
  MSASAlbumChange *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t k;
  MSASAlbumChange *v66;
  MSASAlbumChange *v67;
  MSASAlbumChange *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t m;
  void *v74;
  MSASAlbumChange *v75;
  MSASAlbumChange *v76;
  MSASAlbumChange *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  id obj;
  id obja;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  MSASAlbumChange *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = 0;
    v92 = 0;
    obj = 0;
    v88 = 0;
    goto LABEL_115;
  }
  v84 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "objectForKey:", CFSTR("rootctag"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("rootctag"));
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v15;

  objc_msgSend(v12, "objectForKey:", CFSTR("ctagrespected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("ctagrespected"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  v18 = (objc_msgSend(v17, "isEqualToString:", CFSTR("0")) & 1) != 0 || a1[4] == 0;
  v89 = v18;
  objc_msgSend(v12, "objectForKey:", CFSTR("albums"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("albums"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  v85 = a1;
  v86 = v20;
  v87 = v12;
  v83 = v17;
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    obja = v20;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v108 != v23)
            objc_enumerationMutation(obja);
          v25 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = objc_alloc_init(MSASAlbumChange);
            objc_msgSend(v25, "objectForKey:", CFSTR("albumguid"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("albumguid"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setGUID:](v26, "setGUID:", v28);

            }
            else
            {
              -[MSASAlbumChange setGUID:](v26, "setGUID:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("delete"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v30 = objc_opt_isKindOfClass();
            if ((v30 & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("delete"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = v31;
            }
            else
            {
              v31 = 0;
            }
            -[MSASAlbumChange setWasDeleted:](v26, "setWasDeleted:", objc_msgSend(v31, "intValue") != 0);
            if ((v30 & 1) != 0)

            objc_msgSend(v25, "objectForKey:", CFSTR("albumlocation"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("albumlocation"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setURLString:](v26, "setURLString:", v33);

            }
            else
            {
              -[MSASAlbumChange setURLString:](v26, "setURLString:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("name"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("name"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setName:](v26, "setName:", v35);

            }
            else
            {
              -[MSASAlbumChange setName:](v26, "setName:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("email"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("email"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setOwnerEmail:](v26, "setOwnerEmail:", v37);

            }
            else
            {
              -[MSASAlbumChange setOwnerEmail:](v26, "setOwnerEmail:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("personid"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("personid"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setOwnerPersonID:](v26, "setOwnerPersonID:", v39);

            }
            else
            {
              -[MSASAlbumChange setOwnerPersonID:](v26, "setOwnerPersonID:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("firstname"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("firstname"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setOwnerFirstName:](v26, "setOwnerFirstName:", v41);

            }
            else
            {
              -[MSASAlbumChange setOwnerFirstName:](v26, "setOwnerFirstName:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("lastname"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("lastname"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setOwnerLastName:](v26, "setOwnerLastName:", v43);

            }
            else
            {
              -[MSASAlbumChange setOwnerLastName:](v26, "setOwnerLastName:", 0);
            }

            objc_msgSend(v25, "objectForKey:", CFSTR("fullname"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("fullname"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[MSASAlbumChange setOwnerFullName:](v26, "setOwnerFullName:", v45);

            }
            else
            {
              -[MSASAlbumChange setOwnerFullName:](v26, "setOwnerFullName:", 0);
            }

            +[MSASInvitation MSASPInvitationFromProtocolDictionary:](MSASInvitation, "MSASPInvitationFromProtocolDictionary:", v25);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSASAlbumChange setInvitation:](v26, "setInvitation:", v46);

            objc_msgSend(v92, "addObject:", v26);
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v26;
              _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Album change received: %{public}@", buf, 0xCu);
            }

          }
        }
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
      }
      while (v22);
    }

    a1 = v85;
  }
  else
  {
    v92 = 0;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("sharinginfochanges"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("sharinginfochanges"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = 0;
  }

  v90 = v48;
  if (objc_msgSend(v48, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v48, "count"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v104;
      v53 = MEMORY[0x1E0C81028];
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v104 != v52)
            objc_enumerationMutation(v49);
          v55 = *(MSASAlbumChange **)(*((_QWORD *)&v103 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v56 = v55;
          else
            v56 = 0;
          v57 = v56;
          if (v57)
          {
            objc_msgSend(obj, "addObject:", v57);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v55;
              _os_log_debug_impl(&dword_1D3E94000, v53, OS_LOG_TYPE_DEBUG, "Sharing info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
      }
      while (v51);
    }

    a1 = v85;
    v12 = v87;
  }
  else
  {
    obj = 0;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("albumstatechanges"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("albumstatechanges"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
  }

  if (objc_msgSend(v59, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v60 = v59;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
    if (v61)
    {
      v62 = v61;
      v82 = v59;
      v63 = *(_QWORD *)v100;
      v64 = MEMORY[0x1E0C81028];
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v100 != v63)
            objc_enumerationMutation(v60);
          v66 = *(MSASAlbumChange **)(*((_QWORD *)&v99 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v67 = v66;
          else
            v67 = 0;
          v68 = v67;
          if (v68)
          {
            objc_msgSend(v10, "addObject:", v68);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v66;
              _os_log_debug_impl(&dword_1D3E94000, v64, OS_LOG_TYPE_DEBUG, "Key-Value info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }

        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
      }
      while (v62);
LABEL_112:
      a1 = v85;
      v59 = v82;
    }
    goto LABEL_113;
  }
  if (!v89)
  {
    v10 = 0;
    goto LABEL_114;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v59, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v60 = v86;
  v69 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
  if (v69)
  {
    v70 = v69;
    v82 = v59;
    v71 = *(_QWORD *)v96;
    v72 = MEMORY[0x1E0C81028];
    while (1)
    {
      for (m = 0; m != v70; ++m)
      {
        if (*(_QWORD *)v96 != v71)
          objc_enumerationMutation(v60);
        v74 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v74, "objectForKey:", CFSTR("albumguid"));
          v75 = (MSASAlbumChange *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v74, "objectForKey:", CFSTR("albumguid"));
            v76 = (MSASAlbumChange *)objc_claimAutoreleasedReturnValue();

            if (!v76)
              continue;
            objc_msgSend(v10, "addObject:", v76);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v76;
              _os_log_debug_impl(&dword_1D3E94000, v72, OS_LOG_TYPE_DEBUG, "Key-Value info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            v76 = v75;
          }

        }
      }
      v70 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
      if (!v70)
        goto LABEL_112;
    }
  }
LABEL_113:

LABEL_114:
  v8 = 0;
  v7 = v84;

LABEL_115:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v77 = (MSASAlbumChange *)a1[5];
    v78 = objc_msgSend(v92, "count");
    v79 = objc_msgSend(obj, "count");
    v80 = objc_msgSend(v10, "count");
    objc_msgSend(v8, "MSVerboseDescription");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v112 = v77;
    v113 = 2048;
    v114 = v78;
    v115 = 2048;
    v116 = v79;
    v117 = 2048;
    v118 = v80;
    v119 = 2114;
    v120 = v81;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Received changes for %ld albums, sharing info changes for %ld albums, KV changes for %ld albums. Error: %{public}@", buf, 0x34u);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __89__MSASProtocol_deleteComment_fromAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__MSASProtocol_deleteAssetCollections_inAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__MSASProtocol_deleteAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__MSASProtocol_setMultipleContributorsEnabled_forAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__MSASProtocol_setPublicAccessEnabled_forAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__MSASProtocol_addComment_toAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("commentposition"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("commentposition"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[7] + 16))(a1[7], 0, objc_msgSend(v11, "intValue"));
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
    v26 = a1[7];
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (id)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COMMENT_NO_INDEX"));
    objc_msgSend(v27, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 12, v11, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v28, 0);

    goto LABEL_23;
  }
  if (objc_msgSend(v8, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 403))
  {
    v11 = v8;
    v12 = (void *)a1[4];
    v38 = 0;
    v13 = objc_msgSend(v12, "responseDict:containsLimitErrorCode:outMaxAllowed:", v10, CFSTR("4034"), &v38);
    v14 = v38;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = a1[5];
      if (v17)
        objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("album"));
      v36 = v7;
      v18 = a1[6];
      if (v18)
        objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("assetCollection"));
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_COMMENTS_P_COUNT"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "MSErrorWithDomain:code:description:underlyingError:additionalUserInfo:", CFSTR("MSASProtocolErrorDomain"), 16, v22, v11, v16);
      v23 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v21;
      v24 = v14;
    }
    else
    {
      v29 = (void *)a1[4];
      v37 = v14;
      v30 = objc_msgSend(v29, "responseDict:containsLimitErrorCode:outMaxAllowed:", v10, CFSTR("4035"), &v37);
      v24 = v37;

      if (!v30)
      {
LABEL_22:
        (*(void (**)(void))(a1[7] + 16))();

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v31;
      v32 = a1[5];
      if (v32)
        objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("album"));
      v36 = v7;
      v33 = a1[6];
      if (v33)
        objc_msgSend(v16, "setObject:forKey:", v33, CFSTR("assetCollection"));
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v20 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_COMMENT_LENGTH"));
      objc_msgSend(v34, "MSErrorWithDomain:code:description:underlyingError:additionalUserInfo:", CFSTR("MSASProtocolErrorDomain"), 17, v20, v11, v16);
      v23 = objc_claimAutoreleasedReturnValue();
    }

    v11 = (id)v23;
    v7 = v36;
    goto LABEL_22;
  }
  (*(void (**)(void))(a1[7] + 16))();
LABEL_24:

}

uint64_t __69__MSASProtocol_removeSharingRelationships_fromAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__6975;
  v38[4] = __Block_byref_object_dispose__6976;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v9;
    else
      v20 = 0;
    v21 = v20;
    v16 = v21;
    if (!v21)
    {
      v13 = 0;
      v19 = 0;
LABEL_19:

      v23 = v13;
      goto LABEL_20;
    }
    -[__CFString objectForKey:](v21, "objectForKey:", CFSTR("sharinginfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFString objectForKey:](v16, "objectForKey:", CFSTR("sharinginfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__6975;
    v34[4] = __Block_byref_object_dispose__6976;
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke_2;
    v29[3] = &unk_1E95BCB50;
    v32 = v34;
    v30 = *(id *)(a1 + 40);
    v31 = *(id *)(a1 + 48);
    v33 = v38;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v29);

    _Block_object_dispose(v34, 8);
    v13 = 0;
    v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v10, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 403))
  {
    v11 = *(void **)(a1 + 32);
    v37 = 0;
    v12 = objc_msgSend(v11, "responseDict:containsLimitErrorCode:outMaxAllowed:", v9, CFSTR("4031"), &v37);
    v13 = v37;
    if (v12)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_SUBSCRIBERS_P_COUNT"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "intValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 19, v18, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    v24 = *(void **)(a1 + 32);
    v36 = v13;
    v25 = objc_msgSend(v24, "responseDict:containsLimitErrorCode:outMaxAllowed:", v9, CFSTR("4033"), &v36);
    v23 = v36;

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = (void *)MEMORY[0x1E0CB3940];
      v16 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_INVITATIONS_P_COUNT"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "intValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v16, v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 20, v28, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v23;
      goto LABEL_18;
    }
  }
  else
  {
    v23 = 0;
  }
  v19 = v10;
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(v38, 8);

}

void __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "objectForKey:", CFSTR("sharingtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("sharingtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "isEqualToString:", CFSTR("owned")))
    {
      +[MSASInvitation MSASPInvitationFromProtocolDictionary:](MSASInvitation, "MSASPInvitationFromProtocolDictionary:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(*(id *)(a1 + 32), "setOwnerFullName:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "email");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(*(id *)(a1 + 32), "setOwnerEmail:", v12);

      goto LABEL_33;
    }
  }
  else
  {

    v7 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("invitationguid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("invitationguid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("phonenumbers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("phonenumbers"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v27 = v14;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                objc_msgSend(v22, "objectForKey:", CFSTR("phonenumber"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKey:", CFSTR("invitationtoken"));
                v24 = objc_claimAutoreleasedReturnValue();
                v25 = (void *)v24;
                if (v23)
                  v26 = v24 == 0;
                else
                  v26 = 1;
                if (!v26)
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v24, v23);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v19);
          }

          v14 = v27;
        }
      }
      else
      {

      }
    }
  }
  else
  {

    v14 = 0;
  }

LABEL_33:
}

void __106__MSASProtocol_sendUploadCompleteSuccessfulAssetCollections_failedAssetCollections_album_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  id v53;
  void *v54;
  __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  CFStringRef v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v65 = v7;
      v9 = v7;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      if (!v10)
        goto LABEL_53;
      v11 = v10;
      v74 = *(_QWORD *)v80;
      v12 = 0x1E0CB3000uLL;
      v71 = v9;
      v72 = a1;
      while (1)
      {
        v13 = 0;
        v73 = v11;
        do
        {
          if (*(_QWORD *)v80 != v74)
            objc_enumerationMutation(v9);
          v14 = v8;
          v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v13);
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v23 = (void *)MEMORY[0x1E0CB35C8];
              v24 = *(void **)(v12 + 2368);
              v17 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
              objc_msgSend(v24, "stringWithFormat:", v17, CFSTR("pending upload ID"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_47;
            }
          }
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (__CFString *)v16;
            objc_msgSend(v9, "objectForKey:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v18, "objectForKey:", CFSTR("assetguid"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v30 = v12;
                  v31 = (void *)MEMORY[0x1E0CB35C8];
                  v32 = *(void **)(v30 + 2368);
                  v20 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
                  objc_msgSend(v32, "stringWithFormat:", v20, CFSTR("assetguid"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v21);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_42;
                }
              }
              objc_msgSend(v18, "objectForKey:", CFSTR("assetctag"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v33 = v12;
                  v34 = (void *)MEMORY[0x1E0CB35C8];
                  v35 = *(void **)(v33 + 2368);
                  v21 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
                  objc_msgSend(v35, "stringWithFormat:", v21, CFSTR("assetctag"));
                  v36 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v36);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = (void *)v36;
                  goto LABEL_41;
                }
              }
              objc_msgSend(v18, "objectForKey:", CFSTR("success"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v67 = (void *)MEMORY[0x1E0CB35C8];
                  v44 = *(void **)(v12 + 2368);
                  v70 = MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
                  objc_msgSend(v44, "stringWithFormat:", v70, CFSTR("success"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v45);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  v37 = (void *)v70;
                  goto LABEL_41;
                }
              }
              v66 = objc_msgSend(v21, "intValue");
              objc_msgSend(v18, "objectForKey:", CFSTR("assetnumber"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v18, "objectForKey:", CFSTR("assetnumber"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v69 = 0;
              }

              -[__CFString GUID](v17, "GUID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToString:", v19);

              if ((v39 & 1) != 0)
              {
                if (v66)
                {
                  if (v20)
                    -[__CFString setCtag:](v17, "setCtag:", v20);
                  v37 = v69;
                  if (v69)
                  {
                    -[__CFString setPhotoNumber:](v17, "setPhotoNumber:", objc_msgSend(v69, "longLongValue"));
                    v37 = v69;
                  }
                  v26 = 0;
LABEL_41:

LABEL_42:
LABEL_43:

                  if (v26)
                    objc_msgSend(v14, "setObject:forKey:", v26, v17);
                  else
                    objc_msgSend(v68, "addObject:", v17);
                  v9 = v71;
                  a1 = v72;
                  v11 = v73;
                  objc_msgSend(*(id *)(v72 + 32), "removeObjectForKey:", v15);
LABEL_47:

                  if (v26)
                  {
                    v8 = v14;
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      v47 = *(_QWORD *)(a1 + 40);
                      *(_DWORD *)buf = 138543618;
                      v85 = v47;
                      v86 = 2114;
                      v87 = (uint64_t)v26;
                      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Skipping asset collection in response. Error: %{public}@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v8 = v14;
                  }
                  goto LABEL_51;
                }
                v46 = (void *)MEMORY[0x1E0CB35C8];
                v41 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COLL_REJECTED"));
                v42 = v46;
                v43 = 8;
              }
              else
              {
                v40 = (void *)MEMORY[0x1E0CB35C8];
                v41 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_MISMATCHED_COLLECTION"));
                v42 = v40;
                v43 = 6;
              }
              objc_msgSend(v42, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), v43, v41);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = v69;
              goto LABEL_41;
            }
            v27 = v12;
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v29 = *(void **)(v27 + 2368);
            v19 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
            objc_msgSend(v29, "stringWithFormat:", v19, v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v48 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v85 = v48;
            v86 = 2114;
            v87 = (uint64_t)v15;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Ignoring unknown pending upload ID %{public}@", buf, 0x16u);
          }
          v26 = 0;
LABEL_51:

          ++v13;
          v12 = 0x1E0CB3000;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (!v11)
        {
LABEL_53:

          v6 = 0;
          v7 = v65;
          goto LABEL_55;
        }
      }
    }
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_BAD_FIELD_P_FIELD"));
    objc_msgSend(v50, "stringWithFormat:", v51, CFSTR("response body"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 10, v52);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_55:
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v53 = v7;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v63 = *(_QWORD *)(a1 + 40);
      v64 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138543618;
      v85 = v63;
      v86 = 2048;
      v87 = v64;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned asset collections.", buf, 0x16u);
    }
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v55 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COLL_IGNORED"));
    objc_msgSend(v54, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 9, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v57 = *(id *)(a1 + 32);
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v76 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v56, v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v59);
    }

    v7 = v53;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __102__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CFStringRef v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint32_t v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  __CFString *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  __CFString *v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6975;
  v71 = __Block_byref_object_dispose__6976;
  v11 = v8;
  v72 = v11;
  if (v11)
  {
    if (objc_msgSend(v7, "statusCode") == 400)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v74 = v12;
        v75 = 2114;
        v76 = v11;
        v13 = MEMORY[0x1E0C81028];
        v14 = "%{public}@: Bad request to server. Error: %{public}@";
LABEL_18:
        v28 = 22;
LABEL_19:
        _os_log_error_impl(&dword_1D3E94000, v13, OS_LOG_TYPE_ERROR, v14, buf, v28);
      }
    }
    else if (objc_msgSend(v7, "statusCode") == 404)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v74 = v16;
        v75 = 2114;
        v76 = v11;
        v13 = MEMORY[0x1E0C81028];
        v14 = "%{public}@: Album does not exist on server. Error: %{public}@";
        goto LABEL_18;
      }
    }
    else if (objc_msgSend(v7, "statusCode") == 412)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v74 = v27;
        v75 = 2114;
        v76 = v11;
        v13 = MEMORY[0x1E0C81028];
        v14 = "%{public}@: Precondition failed. Error: %{public}@";
        goto LABEL_18;
      }
    }
    else
    {
      v30 = objc_msgSend(v7, "statusCode");
      v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v30 == 509)
      {
        if (v31)
        {
          v57 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v74 = v57;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Bandwidth Limit Exceeded", buf, 0xCu);
        }
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v33 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_BANDWIDTH"));
        objc_msgSend(v32, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 21, v33, v11);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v68[5];
        v68[5] = v34;

        goto LABEL_34;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v74 = v11;
        v13 = MEMORY[0x1E0C81028];
        v14 = "Unknown server error response %{public}@";
        v28 = 12;
        goto LABEL_19;
      }
    }
LABEL_34:
    v25 = 0;
    goto LABEL_49;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("assetguid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("assetguid"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = 0;
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v60) & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_MISMATCHED_COLLECTION"));
    objc_msgSend(v22, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 6, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v23;
    v25 = 0;
    v26 = (void *)v68[5];
    v68[5] = v24;
    goto LABEL_48;
  }
  objc_msgSend(*(id *)(a1 + 48), "MMCSHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "MSHexString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "MMCSHash");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "MSHexString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v21);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = 0;
  }

  if (v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v10, "addObject:", v29);
      goto LABEL_38;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v56 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v74 = v56;
      v75 = 2114;
      v76 = v59;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to create URL with server url string %{public}@", buf, 0x16u);
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = (void *)MEMORY[0x1E0CB3940];
    v42 = (__CFString *)MSCFCopyLocalizedString(CFSTR("RROR_SHARING_BAD_FIELD_P_FIELD"));
    objc_msgSend(v41, "stringWithFormat:", v42, v59);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "HTTPErrorWithStatusCode:", objc_msgSend(v7, "statusCode"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 4, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v68[5];
    v68[5] = v45;

    v29 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "MMCSHash");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "MSHexString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "MMCSHash");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "MSHexString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }

    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __102__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke_295;
    v61[3] = &unk_1E95BCB28;
    v47 = v10;
    v48 = *(_QWORD *)(a1 + 32);
    v62 = v47;
    v63 = v48;
    v64 = 0;
    v66 = &v67;
    v65 = v7;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v61);

    v42 = v62;
  }

LABEL_38:
  objc_msgSend(v9, "objectForKey:", CFSTR("url_expiry"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_43;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("url_expiry"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
LABEL_43:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v55 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v74 = v55;
      v75 = 2114;
      v76 = v10;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Server does not return expiry for URLs %{public}@.", buf, 0x16u);
    }
    v26 = 0;
    goto LABEL_46;
  }
  v50 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v50, "setLocale:", v51);
  objc_msgSend(v50, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTimeZone:", v52);

  objc_msgSend(v50, "dateFromString:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1200.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v54 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v74 = v54;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Setting to expire in 20 minutes.", buf, 0xCu);
    }
  }
LABEL_48:

LABEL_49:
  v53 = *(_QWORD *)(a1 + 56);
  if (v53)
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v53 + 16))(v53, v68[5], v10, v25);
  _Block_object_dispose(&v67, 8);

}

void __102__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke_295(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Unable to create URL with server url string %{public}@", buf, 0x16u);
    }
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (__CFString *)MSCFCopyLocalizedString(CFSTR("RROR_SHARING_BAD_FIELD_P_FIELD"));
    objc_msgSend(v5, "stringWithFormat:", v6, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "HTTPErrorWithStatusCode:", objc_msgSend(*(id *)(a1 + 56), "statusCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 4, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __106__MSASProtocol_getUploadTokens_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    goto LABEL_28;
  objc_msgSend(v7, "objectForKey:", CFSTR("contenturl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("contenturl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(v8, "objectForKey:", CFSTR("assetguid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("assetguid"));
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("contenttokens"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v28 = v10;
      v29 = v8;
      v27 = (void *)v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("contenttokens"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v17)
      {
        v18 = v17;
        v19 = MEMORY[0x1E0C81028];
        v20 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v22, v27);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v16, "objectForKey:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setMMCSAccessHeader:", v24);
              objc_msgSend(v23, "setMMCSURL:", v11);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v25 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 138543874;
                v35 = v25;
                v36 = 2114;
                v37 = v24;
                v38 = 2114;
                v39 = v23;
                _os_log_error_impl(&dword_1D3E94000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Obtained upload token %{public}@ for asset %{public}@.", buf, 0x20u);
              }

            }
            else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v26 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v35 = v26;
              v36 = 2114;
              v37 = v22;
              _os_log_error_impl(&dword_1D3E94000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Did not find asset matching hash %{public}@ when requesting upload token.", buf, 0x16u);
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        }
        while (v18);
      }

      v8 = v29;
      v6 = 0;
      v10 = v28;
    }
  }
  else
  {

  }
LABEL_28:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __77__MSASProtocol_putAssetCollections_intoAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  __CFString *v77;
  id v78;
  uint64_t v79;
  void *m;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id obj;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t v135[128];
  uint8_t buf[4];
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  void *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v95 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("contenturl"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("contenturl"));
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v91 = (id)v23;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v23);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else
    {

    }
    v91 = 0;
    v94 = 0;
LABEL_11:
    objc_msgSend(v7, "objectForKey:", CFSTR("assets"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("assets"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v90 = v7;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v134 = 0u;
        v26 = *(id *)(a1 + 32);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v132;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v132 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
              objc_msgSend(v31, "GUID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "setObject:forKey:", v31, v32);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
          }
          while (v28);
        }

        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        obj = v25;
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
        if (v99)
        {
          v98 = *(_QWORD *)v128;
          v101 = a1;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v128 != v98)
                objc_enumerationMutation(obj);
              v102 = v33;
              v34 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v33);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v34, "objectForKey:", CFSTR("assetguid"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_78;
                objc_msgSend(v34, "objectForKey:", CFSTR("assetguid"));
                v36 = objc_claimAutoreleasedReturnValue();

                if (!v36)
                  goto LABEL_79;
                v96 = (void *)v36;
                objc_msgSend(v100, "objectForKey:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v37)
                  goto LABEL_77;
                objc_msgSend(v34, "objectForKey:", CFSTR("success"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v34, "objectForKey:", CFSTR("success"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "intValue");

                }
                else
                {
                  v40 = objc_msgSend(0, "intValue");
                }

                if (v40)
                {
                  v105 = v37;
                  objc_msgSend(v34, "objectForKey:", CFSTR("pendinguploadid"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v34, "objectForKey:", CFSTR("pendinguploadid"));
                    v42 = objc_claimAutoreleasedReturnValue();

                    v43 = v94;
                    if (v42)
                    {
                      objc_msgSend(v105, "setMetadataValue:forKey:", v42, CFSTR("pendingUploadGUID"));
                      v41 = (void *)v42;
                      goto LABEL_40;
                    }
                  }
                  else
                  {
                    v43 = v94;
LABEL_40:

                  }
                  v125 = 0u;
                  v126 = 0u;
                  v123 = 0u;
                  v124 = 0u;
                  objc_msgSend(v105, "assets");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = *(_QWORD *)v124;
                    do
                    {
                      for (j = 0; j != v53; ++j)
                      {
                        if (*(_QWORD *)v124 != v54)
                          objc_enumerationMutation(v51);
                        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "setMMCSURL:", v43);
                      }
                      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
                    }
                    while (v53);
                  }

                  objc_msgSend(v34, "objectForKey:", CFSTR("contenttokens"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v34, "objectForKey:", CFSTR("contenttokens"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v57 = 0;
                  }
                  v37 = v105;

                  v121 = 0u;
                  v122 = 0u;
                  v119 = 0u;
                  v120 = 0u;
                  v58 = v57;
                  v107 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
                  if (v107)
                  {
                    v106 = *(_QWORD *)v120;
                    v104 = v58;
                    do
                    {
                      v59 = 0;
                      do
                      {
                        if (*(_QWORD *)v120 != v106)
                          objc_enumerationMutation(v58);
                        v109 = v59;
                        v60 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v59);
                        objc_msgSend(v58, "objectForKey:", v60);
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        v108 = (uint64_t)v60;
                        objc_msgSend(v60, "MSHexData");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        v115 = 0u;
                        v116 = 0u;
                        v117 = 0u;
                        v118 = 0u;
                        objc_msgSend(v37, "assets");
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, v144, 16);
                        if (!v64)
                        {

LABEL_68:
                          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                          {
                            v72 = *(_QWORD *)(v101 + 40);
                            *(_DWORD *)buf = 138543618;
                            v137 = v72;
                            v138 = 2114;
                            v139 = v108;
                            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not find matching asset for MMCS hash %{public}@.", buf, 0x16u);
                          }
                          goto LABEL_70;
                        }
                        v65 = v64;
                        v66 = 0;
                        v67 = *(_QWORD *)v116;
                        do
                        {
                          for (k = 0; k != v65; ++k)
                          {
                            if (*(_QWORD *)v116 != v67)
                              objc_enumerationMutation(v63);
                            v69 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
                            objc_msgSend(v69, "MMCSHash");
                            v70 = (void *)objc_claimAutoreleasedReturnValue();
                            v71 = objc_msgSend(v70, "isEqualToData:", v62);

                            if (v71)
                            {
                              objc_msgSend(v69, "setMMCSAccessHeader:", v61);
                              v66 = 1;
                            }
                          }
                          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v115, v144, 16);
                        }
                        while (v65);

                        v58 = v104;
                        v37 = v105;
                        if ((v66 & 1) == 0)
                          goto LABEL_68;
LABEL_70:

                        v59 = v109 + 1;
                      }
                      while (v109 + 1 != v107);
                      v107 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
                    }
                    while (v107);
                  }

                  objc_msgSend(v93, "addObject:", v37);
                  a1 = v101;
LABEL_76:

                  objc_msgSend(v95, "removeObject:", v37);
LABEL_77:

                  v35 = v96;
LABEL_78:

                  goto LABEL_79;
                }
                objc_msgSend(v34, "objectForKey:", CFSTR("reason"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v34, "objectForKey:", CFSTR("reason"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v45, "isEqual:", CFSTR("ASSET_ALREADY_EXISTS"));

                  if ((v46 & 1) == 0)
                    goto LABEL_38;
LABEL_74:
                  v74 = (void *)MEMORY[0x1E0CB35C8];
                  v48 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COLL_ALREADY_EXISTS"));
                  v49 = v74;
                  v50 = 7;
                }
                else
                {
                  v73 = objc_msgSend(0, "isEqual:", CFSTR("ASSET_ALREADY_EXISTS"));

                  if (v73)
                    goto LABEL_74;
LABEL_38:
                  v47 = (void *)MEMORY[0x1E0CB35C8];
                  v48 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COLL_REJECTED"));
                  v49 = v47;
                  v50 = 8;
                }
                objc_msgSend(v49, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), v50, v48);
                v75 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v103, "setObject:forKey:", v75, v37);
                v58 = (id)v75;
                goto LABEL_76;
              }
LABEL_79:
              v33 = v102 + 1;
            }
            while (v102 + 1 != v99);
            v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
          }
          while (v99);
        }

        v7 = v90;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v95, "count"))
    {
      v21 = 0;
      goto LABEL_97;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v86 = *(_QWORD *)(a1 + 40);
      v87 = objc_msgSend(v95, "count");
      v88 = objc_msgSend(*(id *)(a1 + 32), "count");
      v89 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v137 = v86;
      v138 = 2048;
      v139 = v87;
      v140 = 2048;
      v141 = v88;
      v142 = 2114;
      v143 = v89;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Server did not respond to %ld assets out of %ld in a putasset request into album %{public}@.", buf, 0x2Au);
    }
    v76 = (void *)MEMORY[0x1E0CB35C8];
    v77 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_COLL_IGNORED"));
    objc_msgSend(v76, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 9, v77);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v16 = v95;
    v21 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v135, 16);
    if (v21)
    {
      v78 = v7;
      v79 = *(_QWORD *)v112;
      do
      {
        for (m = 0; m != v21; m = (char *)m + 1)
        {
          if (*(_QWORD *)v112 != v79)
            objc_enumerationMutation(v16);
          objc_msgSend(v103, "setObject:forKey:", v15, *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)m));
        }
        v21 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v135, 16);
      }
      while (v21);
      v7 = v78;
    }
LABEL_94:

LABEL_97:
    v11 = v91;
    v8 = v92;
    goto LABEL_98;
  }
  if (!objc_msgSend(v8, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 403))
  {
    v94 = 0;
    v21 = v8;
    goto LABEL_99;
  }
  v9 = *(void **)(a1 + 40);
  v110 = 0;
  v10 = objc_msgSend(v9, "responseDict:containsLimitErrorCode:outMaxAllowed:", v7, CFSTR("4036"), &v110);
  v11 = v110;
  v94 = 0;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = v7;
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_PHOTOS_P_COUNT"));
    v91 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(*(id *)(a1 + 48), "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, CFSTR("albumGUID"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MSErrorWithDomain:code:description:underlyingError:additionalUserInfo:", CFSTR("MSASProtocolErrorDomain"), 14, v17, v8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v8;

    v7 = v13;
    v94 = 0;
    goto LABEL_94;
  }
  v21 = v8;
LABEL_98:

LABEL_99:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v81 = v7;
    v82 = *(_QWORD *)(a1 + 40);
    v83 = objc_msgSend(*(id *)(a1 + 32), "count");
    v84 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v21, "MSVerboseDescription");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v137 = v82;
    v7 = v81;
    v138 = 2048;
    v139 = v83;
    v140 = 2114;
    v141 = v84;
    v142 = 2114;
    v143 = v85;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished sending metadata for %ld photos into album %{public}@. Error: %{public}@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __59__MSASProtocol_updateAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "MSVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished updating album. Error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44__MSASProtocol_createAlbum_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0C930A8], 403))
    {
      v12 = *(void **)(a1 + 48);
      v32 = 0;
      v13 = objc_msgSend(v12, "responseDict:containsLimitErrorCode:outMaxAllowed:", v9, CFSTR("4032"), &v32);
      v14 = v32;
      v15 = v11;
      if (v13)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_LIMIT_ALBUMS_P_COUNT"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 13, v20, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v21 = 0;
    }
    else
    {
      v21 = 0;
      v15 = v11;
    }
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("albumguid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("albumguid"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("albumctag"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("albumctag"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v11 = 0;
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = (void *)MEMORY[0x1E0CB3940];
      v26 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_CANNOT_CREATE_ALBUM"));
      objc_msgSend(v28, "stringWithFormat:", v26, *(_QWORD *)(a1 + 40));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 5, v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }

    v15 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "MSVerboseDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v30;
    v35 = 2114;
    v36 = v31;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Finished creating album. Error: %{public}@", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __42__MSASProtocol__prepareHeadersForRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  +[MSASPConnectionGate gate](MSASPConnectionGate, "gate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setGate:", v2);

}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  id v62;
  char v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  _QWORD block[6];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__6975;
  v72 = __Block_byref_object_dispose__6976;
  v73 = 0;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_155;
  block[3] = &unk_1E95BCEF8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v68;
  dispatch_barrier_sync(v11, block);

  objc_msgSend((id)v69[5], "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v46 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v75 = v46;
      v76 = 2114;
      v77 = (uint64_t)v9;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Transaction terminated with error: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_156;
    v64[3] = &unk_1E95BCA08;
    v65 = *(id *)(a1 + 48);
    v66 = &v68;
    dispatch_async(v13, v64);

  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v47 = *(void **)(a1 + 32);
      v48 = objc_msgSend(v10, "statusCode");
      *(_DWORD *)buf = 138543618;
      v75 = v47;
      v76 = 2048;
      v77 = v48;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Received response code %ld", buf, 0x16u);
    }

    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v49 = *(void **)(a1 + 32);
      objc_msgSend(v10, "allHeaderFields");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v49;
      v76 = 2112;
      v77 = (uint64_t)v50;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Headers: %@", buf, 0x16u);

    }
    if (objc_msgSend(v8, "length"))
    {
      MSASPlatform();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "shouldLogAtLevel:", 7);

      if (v19)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v20;
          _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v63 = 0;
    +[MSProtocolUtilities appleIDSession](MSProtocolUtilities, "appleIDSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleResponse:forRequest:shouldRetry:", v10, *(_QWORD *)(a1 + 40), &v63);

    if (v63 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v22 = *(void **)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v75 = v22;
      v76 = 2112;
      v77 = v23;
      v78 = 2112;
      v79 = v10;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Will retry request %@ with response %@ due to AuthKit error", buf, 0x20u);
    }
    if (objc_msgSend(v10, "statusCode") == 330)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v24 = *(void **)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v75 = v24;
        v76 = 2112;
        v77 = v25;
        v78 = 2112;
        v79 = v10;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Will retry request %@ with response %@ due to partition move", buf, 0x20u);
      }
      objc_msgSend(v10, "allHeaderFields");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("X-Apple-MMe-Host"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27 && objc_msgSend(v27, "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "URL");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v54, "scheme");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v29, "initWithScheme:host:path:", v30, v28, v31);

        objc_msgSend(*(id *)(a1 + 40), "setURL:", v53);
        v32 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v54, "scheme");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithScheme:host:path:", v33, v28, CFSTR("/"));

        objc_msgSend(*(id *)(a1 + 32), "personID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "URLByAppendingPathComponent:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "URLByAppendingPathComponent:", CFSTR("sharedstreams"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(*(id *)(a1 + 32), "setBaseURL:", v37);
        v63 = 1;

      }
    }
    if (v63)
    {
      v38 = *(_QWORD *)(a1 + 56);
      if (v38 > 9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v51 = *(void **)(a1 + 32);
          v52 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v75 = v51;
          v76 = 2112;
          v77 = v52;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Exceeded max retry attempts for request %@, giving up", buf, 0x16u);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v39 = *(void **)(a1 + 32);
          v40 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v75 = v39;
          v76 = 2112;
          v77 = v40;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retrying request %@", buf, 0x16u);
          v38 = *(_QWORD *)(a1 + 56);
        }
        objc_msgSend(*(id *)(a1 + 32), "_sendOneURLRequest:checkServerSideConfigVersion:retryCount:completionBlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), v38 + 1, *(_QWORD *)(a1 + 48));
      }
    }
    else
    {
      if (v8)
      {
        v62 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v62);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v62;
        if (v42 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v43 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v75 = v43;
          v76 = 2114;
          v77 = (uint64_t)v42;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot unserialize server's response. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        v42 = 0;
        v41 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v44 = objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_163;
      v55[3] = &unk_1E95BCA30;
      v55[4] = *(_QWORD *)(a1 + 32);
      v56 = v10;
      v57 = v41;
      v61 = *(_BYTE *)(a1 + 64);
      v58 = v9;
      v60 = *(id *)(a1 + 48);
      v59 = v56;
      v45 = v41;
      dispatch_async(v44, v55);

    }
  }
  _Block_object_dispose(&v68, 8);

}

uint64_t __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_155(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "gate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setGate:", 0);
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_156(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_163(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "errorFromStandardProcessingOnResponse:responseObject:checkServerSideConfigVersion:error:body:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));

}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_2;
  block[3] = &unk_1E95BCEF8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v25;
  dispatch_sync(v2, block);

  if (!*((_BYTE *)v26 + 24))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 100, 0, &v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v21;
      if (v9)
      {
        v10 = v9;
        v11 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "MSVerboseDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v16;
          v31 = 2114;
          v32 = v17;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot encode object to send to server. Error: %{public}@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v18[0] = v3;
        v18[1] = 3221225472;
        v18[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_150;
        v18[3] = &unk_1E95BCF98;
        v14 = *(id *)(a1 + 64);
        v19 = v10;
        v20 = v14;
        v15 = v10;
        dispatch_async(v13, v18);

        goto LABEL_5;
      }
      objc_msgSend(*(id *)(a1 + 48), "setHTTPBody:", v7);

    }
    objc_msgSend(*(id *)(a1 + 48), "setHTTPMethod:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_sendOneURLRequest:checkServerSideConfigVersion:retryCount:completionBlock:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), 0, *(_QWORD *)(a1 + 64));
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v30 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Not making request because we're shutting down.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_148;
  v22[3] = &unk_1E95BCF98;
  v6 = *(id *)(a1 + 64);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v6;
  dispatch_async(v5, v22);

  v7 = v23;
LABEL_5:

LABEL_13:
  _Block_object_dispose(&v25, 8);
}

uint64_t __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "gate");
  if (objc_claimAutoreleasedReturnValue())
    __assert_rtn("-[MSASProtocol sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:]_block_invoke_2", "MSASProtocol.m", 672, "!self.gate");
  result = objc_msgSend(*(id *)(a1 + 32), "isShuttingDown");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_148(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "shutDownError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_150(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v5 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_CANNOT_ENCODE"));
  objc_msgSend(v3, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 2, v5, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v2 + 16))(v2, 0, v4, 0);

}

void __32__MSASProtocol_stopHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MSASProtocol_stopHandlerBlock__block_invoke_2;
  v6[3] = &unk_1E95BCFC0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_barrier_async(v4, v6);

}

void __32__MSASProtocol_stopHandlerBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "gate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v1);

}

void __36__MSASProtocol_stopCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setIsShuttingDown:", 1);
  objc_msgSend(*(id *)(a1 + 32), "stoppingError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

uint64_t __36__MSASProtocol_stopCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v3);
  objc_msgSend(*(id *)(a1 + 32), "setIsShuttingDown:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __40__MSASProtocol_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setIsShuttingDown:", 1);
  objc_msgSend(*(id *)(a1 + 32), "shutDownError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

uint64_t __40__MSASProtocol_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v3 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __29__MSASProtocol_stoppingError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_STOPPING"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 1, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stoppingError_error;
  stoppingError_error = v1;

}

void __29__MSASProtocol_shutDownError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v0 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_MSAS_PROT_SHUTTING_DOWN"));
  objc_msgSend(v0, "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 0, v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)shutDownError_error;
  shutDownError_error = v1;

}

@end
