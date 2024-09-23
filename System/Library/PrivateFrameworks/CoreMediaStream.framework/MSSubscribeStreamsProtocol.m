@implementation MSSubscribeStreamsProtocol

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeStreamsProtocol;
  -[MSStreamsProtocol delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeStreamsProtocol;
  -[MSStreamsProtocol setDelegate:](&v3, sel_setDelegate_, a3);
}

- (MSSubscribeStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSSubscribeStreamsProtocol *v7;
  MSSubscribeStreamsProtocol *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSubscribeStreamsProtocol;
  v7 = -[MSStreamsProtocol initWithPersonID:baseURL:](&v10, sel_initWithPersonID_baseURL_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_context.finishedCallback = _finishedCallback;
    v8->_context.gotDataChunkCallback = _gotDataChunkCallback;
    v8->_context.authFailedCallback = _authenticationFailedCallback;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _didReceiveServerSideConfigurationVersion;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate_951;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_parseContext);

  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeStreamsProtocol;
  -[MSSubscribeStreamsProtocol dealloc](&v3, sel_dealloc);
}

- (id)_pathToChunkIndex:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[MSStreamsProtocol personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathSubscribeProtocolDirForPersonID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chunk_%04d.plist"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pollForSubscriptionUpdatesWithAccountAnchors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __MSSSPCContext *p_context;
  NSURL *v12;
  const __CFDictionary *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Requesting subscription updates...", (uint8_t *)&v14, 0x16u);

  }
  -[MSStreamsProtocol personID](self, "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathSubscribeProtocolDirForPersonID(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtPath:error:", v9, 0);
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);
  self->_chunkIndex = 0;
  p_context = &self->_context;
  -[MSStreamsProtocol _refreshAuthTokenForContext:](self, "_refreshAuthTokenForContext:", &self->_context);
  v12 = -[MSStreamsProtocol getURL](self, "getURL");
  v13 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSSSPCGetMetadataAsync(p_context, (uint64_t)v12, v13, v4);

}

- (void)_coreProtocolDidFinishError:(id)a3
{
  void *v4;
  void *v5;
  MSSubscribeStreamsProtocol *v6;
  id v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[MSSubscribeStreamsProtocol delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = self;
    v7 = v8;
  }
  else
  {
    if (self->_chunkIndex >= 1)
    {
      -[MSSubscribeStreamsProtocol _parseChunks](self, "_parseChunks");
      goto LABEL_6;
    }
    -[MSSubscribeStreamsProtocol delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = self;
    v7 = 0;
  }
  objc_msgSend(v4, "subscribeStreamsProtocol:didFinishError:", v6, v7);

LABEL_6:
}

- (void)_coreProtocolDidGetDataChunk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Got chunk: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[MSSubscribeStreamsProtocol _pathToChunkIndex:](self, "_pathToChunkIndex:", self->_chunkIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToFile:atomically:", v6, 0);

  ++self->_chunkIndex;
}

- (void)_coreProtocolDidFailAuthentication:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStreamsProtocol personID](self, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MSPathSubscribeProtocolDirForPersonID(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtPath:error:", v8, 0);

  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribeStreamsProtocol:didReceiveAuthenticationError:", self, v5);

}

- (void)_parseChunks
{
  __MSSSPCChunkParsingContext *v3;
  __MSSSPCChunkParsingContext *parseContext;
  void *v5;
  id v6;
  void *v7;
  int chunkIndex;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__MSSSPCChunkParsingContext *)malloc_type_malloc(0x58uLL, 0x10E0040CFB3EB4CuLL);
  self->_parseContext = v3;
  v3->var0 = self;
  self->_parseContext->var1 = _chunkBeginStreamCallback;
  self->_parseContext->var2 = _chunkAssetCollectionsCallback;
  self->_parseContext->var3 = _chunkEndStreamCallback;
  self->_parseContext->var4 = _chunkSubscriptionSourceGoneCallback;
  self->_parseContext->var5 = _chunkSubscriptionSourceTemporarilyUnavailableCallback;
  parseContext = self->_parseContext;
  *(_OWORD *)&parseContext->var6 = 0u;
  *(_OWORD *)&parseContext->var8 = 0u;
  parseContext->var10 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    chunkIndex = self->_chunkIndex;
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 1024;
    v14 = chunkIndex;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Starting to parse %d chunks.", (uint8_t *)&v9, 0x1Cu);

  }
  -[MSSubscribeStreamsProtocol _parseNextChunk](self, "_parseNextChunk");
}

- (void)_parseNextChunk
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  const __CFData *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _BYTE buf[12];
  __int16 v24;
  void *v25;
  __int16 v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (self->_chunkIndex < 1)
  {
LABEL_10:
    v8 = 0;
  }
  else
  {
    v3 = 0;
    v4 = MEMORY[0x1E0C81028];
    while (1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        -[MSStreamsProtocol personID](self, "personID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v11;
        v24 = 2112;
        v25 = v13;
        v26 = 1024;
        LODWORD(v27[0]) = v3;
        _os_log_debug_impl(&dword_1D3E94000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Parsing chunk number %d.", buf, 0x1Cu);

      }
      v5 = objc_alloc(MEMORY[0x1E0C99D50]);
      -[MSSubscribeStreamsProtocol _pathToChunkIndex:](self, "_pathToChunkIndex:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (const __CFData *)objc_msgSend(v5, "initWithContentsOfFile:", v6);

      if (v7)
      {
        *(_QWORD *)buf = 0;
        MSSSPCChunkParsingParseNextChunk(&self->_parseContext->var0, v7, (CFErrorRef *)buf);
        v8 = *(void **)buf;
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_GET_CONNECTION_MISSING_CHUNK"));
        objc_msgSend(v9, "MSErrorWithDomain:code:description:", CFSTR("MSStreamsGetConnectionErrorDomain"), 4, v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v8)
        break;
      v3 = (v3 + 1);
      if ((int)v3 >= self->_chunkIndex)
        goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      -[MSStreamsProtocol personID](self, "personID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "MSVerboseDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v19;
      v24 = 2112;
      v25 = v21;
      v26 = 1024;
      LODWORD(v27[0]) = v3;
      WORD2(v27[0]) = 2114;
      *(_QWORD *)((char *)v27 + 6) = v22;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@- %@ Error found while parsing chunk number %d. Error: %{public}@", buf, 0x26u);

    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    -[MSStreamsProtocol personID](self, "personID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "MSVerboseDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v15;
    v24 = 2112;
    v25 = v17;
    v26 = 2114;
    v27[0] = v18;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished parsing all chunks. Error: %{public}@", buf, 0x20u);

  }
  _resetChunkContext(&self->_parseContext->var0);
  free(self->_parseContext);
  self->_parseContext = 0;
  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribeStreamsProtocol:didFinishError:", self, v8);

}

- (void)_chunkDidBeginStreamForPersonID:(id)a3 wasReset:(BOOL)a4 metadata:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSStreamsProtocol personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v8;
    v20 = 1024;
    v21 = v6;
    v22 = 2114;
    v23 = v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Begin stream for personID: %@ - was reset: %d\nMetadata: %{public}@", (uint8_t *)&v14, 0x30u);

  }
  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribeStreamsProtocol:willReceiveUpdatesForPersonID:wasReset:metadata:", self, v8, v6, v9);

}

- (void)_chunkDidParseAssetCollections:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    -[MSStreamsProtocol personID](self, "personID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v15;
    v21 = 2112;
    v22 = v17;
    v23 = 2114;
    v24 = v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Parsed asset collections: %{public}@", buf, 0x20u);

  }
  v18 = 0;
  -[MSSubscribeStreamsProtocol _assetCollectionsFromCoreArray:personID:outError:](self, "_assetCollectionsFromCoreArray:personID:outError:", v6, v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      -[MSStreamsProtocol personID](self, "personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MSVerboseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not create asset collections from response. Error: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    -[MSSubscribeStreamsProtocol delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subscribeStreamsProtocol:didReceiveAssetCollections:forPersonID:", self, v8, v7);

  }
}

- (void)_chunkDidEndStreamForPersonID:(id)a3 ctag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    -[MSStreamsProtocol personID](self, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@- %@ Finished stream for personID: %@", (uint8_t *)&v12, 0x20u);

  }
  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeStreamsProtocol:didFinishReceivingUpdatesForPersonID:ctag:", self, v6, v7);

}

- (void)_chunkDidFindSubscriptionGoneForPersonID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription is gone for person ID %@", (uint8_t *)&v9, 0x20u);

  }
  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeStreamsProtocol:didFindDisappearedSubscriptionForPersonID:", self, v4);

}

- (void)_chunkDidFindSubscriptionTemporarilyUnavailableForPersonID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription temporarily unavailable for person ID %@", (uint8_t *)&v9, 0x20u);

  }
  -[MSSubscribeStreamsProtocol delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeStreamsProtocol:didFindTemporarilyUnavailableSubscriptionForPersonID:", self, v4);

}

- (id)_invalidFieldErrorWithFieldName:(id)a3 suggestion:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_GET_CONNECTION_INVALID_FIELD_P_NAME"));
  objc_msgSend(v6, "stringWithFormat:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "MSErrorWithDomain:code:description:suggestion:", CFSTR("MSStreamsGetConnectionErrorDomain"), 2, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_invalidFieldErrorWithFieldName:(id)a3
{
  return -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:suggestion:](self, "_invalidFieldErrorWithFieldName:suggestion:", a3, 0);
}

- (id)_assetFromCoreDictionary:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[MSAsset asset](MSAsset, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("fileHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("fileHash"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_110;
    }
    objc_msgSend(v10, "setFileHash:", v11);
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("masterAssetHash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_7:
    objc_msgSend(v8, "objectForKey:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("type"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_108:

        goto LABEL_109;
      }
      objc_msgSend(v10, "setType:", v13);
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("MMCSAccessHeader"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("MMCSAccessHeader"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_107:

        goto LABEL_108;
      }
      objc_msgSend(v10, "setMMCSAccessHeader:", v14);
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("MMCSURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v15;
    if (v15)
    {
      v16 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("MMCSURL"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_106:

        goto LABEL_107;
      }
      objc_msgSend(v10, "setMMCSURL:", v16);
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("protocolFileSize"));
    v17 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)v17;
    if (v17)
    {
      v18 = (void *)v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("protocolFileSize"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_105:

        goto LABEL_106;
      }
      objc_msgSend(v10, "setProtocolFileSize:", objc_msgSend(v18, "unsignedLongLongValue"));
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("metadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v72 = v13;
      v20 = a5;
      v21 = v9;
      v22 = v14;
      v23 = v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v23;
        objc_msgSend(v23, "objectForKey:", CFSTR("fileSize"));
        v24 = objc_claimAutoreleasedReturnValue();
        v14 = v22;
        v9 = v21;
        a5 = v20;
        v13 = v72;
        v70 = (void *)v24;
        if (v24)
        {
          v25 = v24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("fileSize"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_103:

            v19 = v73;
            goto LABEL_104;
          }
          objc_msgSend(v71, "setObject:forKey:", v25, CFSTR("MSAssetMetadataFileSize"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("pixelWidth"));
        v26 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v26;
        if (v26)
        {
          v27 = v26;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("pixelWidth"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_102:

            goto LABEL_103;
          }
          objc_msgSend(v71, "setObject:forKey:", v27, CFSTR("MSAssetMetadataPixelWidth"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("pixelHeight"));
        v28 = objc_claimAutoreleasedReturnValue();
        v68 = (void *)v28;
        if (v28)
        {
          v29 = v28;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("pixelHeight"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_101:

            goto LABEL_102;
          }
          objc_msgSend(v71, "setObject:forKey:", v29, CFSTR("MSAssetMetadataPixelHeight"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("deviceID"));
        v30 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)v30;
        if (v30)
        {
          v31 = v30;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("deviceID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_100:

            goto LABEL_101;
          }
          objc_msgSend(v71, "setObject:forKey:", v31, CFSTR("MSAssetMetadataDeviceID"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("dateContentModified"));
        v32 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)v32;
        if (v32)
        {
          v33 = v32;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("dateContentModified"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_99:

            goto LABEL_100;
          }
          objc_msgSend(v71, "setObject:forKey:", v33, CFSTR("MSAssetMetadataDateContentModified"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("dateContentCreated"));
        v34 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v34;
        if (v34)
        {
          v35 = v34;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("dateContentCreated"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_98:

            goto LABEL_99;
          }
          objc_msgSend(v71, "setObject:forKey:", v35, CFSTR("MSAssetMetadataDateContentCreated"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceLibraryID"));
        v36 = objc_claimAutoreleasedReturnValue();
        v64 = (void *)v36;
        if (v36)
        {
          v37 = v36;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceLibraryID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_97:

            goto LABEL_98;
          }
          objc_msgSend(v71, "setObject:forKey:", v37, CFSTR("MSAssetMetadataSourceLibraryID"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceItemID"));
        v38 = objc_claimAutoreleasedReturnValue();
        v63 = (void *)v38;
        if (v38)
        {
          v39 = v38;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceItemID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_96:

            goto LABEL_97;
          }
          objc_msgSend(v71, "setObject:forKey:", v39, CFSTR("MSAssetMetadataSourceItemID"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceContainerType"));
        v40 = objc_claimAutoreleasedReturnValue();
        v62 = (void *)v40;
        if (v40)
        {
          v41 = v40;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceContainerType"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_95:

            goto LABEL_96;
          }
          objc_msgSend(v71, "setObject:forKey:", v41, CFSTR("MSAssetMetadataSourceContainerTypeKey"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceContainerID"));
        v42 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)v42;
        if (v42)
        {
          v43 = v42;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceContainerID"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_94:

            goto LABEL_95;
          }
          objc_msgSend(v71, "setObject:forKey:", v43, CFSTR("MSAssetMetadataSourceContainerIDKey"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceContainerDisplayName"));
        v44 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v44;
        if (v44)
        {
          v45 = v44;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceContainerDisplayName"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_93:

            goto LABEL_94;
          }
          objc_msgSend(v71, "setObject:forKey:", v45, CFSTR("MSAssetMetadataSourceContainerDisplayNameKey"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("deviceDisplayName"));
        v46 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v46;
        if (v46)
        {
          v47 = v46;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("deviceDisplayName"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_92:

            goto LABEL_93;
          }
          objc_msgSend(v71, "setObject:forKey:", v47, CFSTR("MSAssetMetadataDeviceDisplayNameKey"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("rasterToDisplayRotationAngle"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("rasterToDisplayRotationAngle"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_91:

            goto LABEL_92;
          }
          objc_msgSend(v71, "setObject:forKey:", v58, CFSTR("MSAssetMetadataRasterToDisplayRotationAngleKey"));
        }
        objc_msgSend(v73, "objectForKey:", CFSTR("sourceiCloudPhotoLibraryEnabled"));
        v48 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v48;
        if (v48)
        {
          v49 = v48;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("sourceiCloudPhotoLibraryEnabled"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_90:

            goto LABEL_91;
          }
          objc_msgSend(v71, "setObject:forKey:", v49, CFSTR("MSAssetMetadataSourceiCloudPhotoLibraryEnabledKey"));
        }
        if (v9)
          objc_msgSend(v71, "setObject:forKey:", v9, CFSTR("MSAssetMetadataStreamIDKey"));
        if (objc_msgSend(v71, "count"))
          objc_msgSend(v10, "setMetadata:", v71);
        v50 = 0;
        goto LABEL_90;
      }
      -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("metadata"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v23;
      v14 = v22;
      v9 = v21;
      a5 = v20;
      v13 = v72;
    }
    else
    {
      v50 = 0;
    }
LABEL_104:

    goto LABEL_105;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setMasterAssetHash:", v12);
    goto LABEL_7;
  }
  -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("masterAssetHash"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_109:

LABEL_110:
  if (!v50)
  {
    v51 = v10;
    goto LABEL_117;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v52 = (void *)objc_opt_class();
    v53 = v52;
    -[MSStreamsProtocol personID](self, "personID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "MSVerboseDescription");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v77 = v52;
    v78 = 2112;
    v79 = v54;
    v80 = 2114;
    v81 = v55;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot parse asset dictionary. Error: %{public}@", buf, 0x20u);

    if (a5)
      goto LABEL_113;
LABEL_116:
    v51 = 0;
    goto LABEL_117;
  }
  if (!a5)
    goto LABEL_116;
LABEL_113:
  v51 = 0;
  *a5 = objc_retainAutorelease(v50);
LABEL_117:

  return v51;
}

- (id)_assetCollectionsFromCoreArray:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = v7;
  v40 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (!v40)
  {

LABEL_37:
    v34 = v38;
    v35 = v38;
    v10 = 0;
    goto LABEL_39;
  }
  v10 = 0;
  v41 = *(_QWORD *)v56;
  v39 = v9;
  while (2)
  {
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v56 != v41)
        objc_enumerationMutation(v9);
      v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKey:", CFSTR("masterAsset"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("masterAsset"));
          v33 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v33;
          goto LABEL_34;
        }
      }
      v54 = v10;
      -[MSSubscribeStreamsProtocol _assetFromCoreDictionary:personID:outError:](self, "_assetFromCoreDictionary:personID:outError:", v13, v8, &v54);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v54;

      if (v15)
      {

        v10 = v15;
        goto LABEL_35;
      }
      v46 = v13;
      objc_msgSend(v12, "objectForKey:", CFSTR("fileName"));
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("collId"));
      v45 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("serverUploadedDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("derivedAssets"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v16;
      v48 = v14;
      v44 = v18;
      if (v18)
      {
        v19 = v18;
        v42 = v17;
        v43 = i;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v51;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v51 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              v49 = 0;
              -[MSSubscribeStreamsProtocol _assetFromCoreDictionary:personID:outError:](self, "_assetFromCoreDictionary:personID:outError:", v26, v8, &v49);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v49;
              if (v28)
              {
                v10 = v28;
                v29 = 4;
                v17 = v42;
                i = v43;
                v30 = (void *)v45;
                goto LABEL_26;
              }
              objc_msgSend(v20, "addObject:", v27);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            if (v23)
              continue;
            break;
          }
        }

        v17 = v42;
        i = v43;
        v14 = v48;
      }
      else
      {
        v20 = 0;
      }
      +[MSAssetCollection collectionWithMasterAsset:fileName:derivedAssets:](MSAssetCollection, "collectionWithMasterAsset:fileName:derivedAssets:", v14, v16, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("deleted"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v45;
      if (!v27)
        goto LABEL_24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "setWasDeleted:", 1);
LABEL_24:
        objc_msgSend(v21, "setAssetCollectionID:", v45);
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v31 / 1000.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setServerUploadedDate:", v32);
        objc_msgSend(v38, "addObject:", v21);

        v29 = 0;
        v10 = 0;
        goto LABEL_26;
      }
      -[MSSubscribeStreamsProtocol _invalidFieldErrorWithFieldName:](self, "_invalidFieldErrorWithFieldName:", CFSTR("deleted"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 4;
LABEL_26:

      if (v29)
      {
        v9 = v39;
        goto LABEL_34;
      }
      v9 = v39;
    }
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v40)
      continue;
    break;
  }
LABEL_34:

  if (!v10)
    goto LABEL_37;
LABEL_35:
  v34 = v38;
  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    v35 = 0;
    *a5 = v10;
  }
  else
  {
    v35 = 0;
  }
LABEL_39:

  return v35;
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
}

@end
