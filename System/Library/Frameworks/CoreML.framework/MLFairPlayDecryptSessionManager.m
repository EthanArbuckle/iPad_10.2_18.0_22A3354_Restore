@implementation MLFairPlayDecryptSessionManager

- (MLFairPlayDecryptSessionManager)init
{
  MLFairPlayDecryptSessionManager *v2;
  uint64_t v3;
  NSMutableDictionary *modelPathToSessionID;
  $8D16E72C621A2E7E101564C362693498 *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *syncQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLFairPlayDecryptSessionManager;
  v2 = -[MLFairPlayDecryptSessionManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    modelPathToSessionID = v2->_modelPathToSessionID;
    v2->_modelPathToSessionID = (NSMutableDictionary *)v3;

    v5 = ($8D16E72C621A2E7E101564C362693498 *)malloc_type_calloc(1uLL, 0x11D0uLL, 0x1000040CE5F979FuLL);
    v2->_sessionContext = v5;
    *(_QWORD *)&v5->var0 = 0x1411000001000000;
    v5->var2 = 0;
    v6 = dispatch_queue_create("com.apple.coreml.DecrptSessionManager", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  $8D16E72C621A2E7E101564C362693498 *sessionContext;
  __int128 v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  _BYTE v24[14];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_modelPathToSessionID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 67109378;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_modelPathToSessionID, "objectForKeyedSubscript:", v9, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");

        TCvO8ZqLN8g(v11);
        v13 = v12;
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v24 = v9;
            *(_WORD *)&v24[8] = 1024;
            *(_DWORD *)&v24[10] = v13;
            _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to destroy decrypt session for %@. error=%d", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v17;
          *(_DWORD *)v24 = v11;
          *(_WORD *)&v24[4] = 2112;
          *(_QWORD *)&v24[6] = v9;
          _os_log_debug_impl(&dword_19C486000, v15, OS_LOG_TYPE_DEBUG, "Successfully destroyed decrypt session (id: %u) for %@", buf, 0x12u);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  sessionContext = self->_sessionContext;
  if (sessionContext)
    free(sessionContext);
  v18.receiver = self;
  v18.super_class = (Class)MLFairPlayDecryptSessionManager;
  -[MLFairPlayDecryptSessionManager dealloc](&v18, sel_dealloc);
}

- (BOOL)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 teamIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v21;
  uint64_t block;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  MLFairPlayDecryptSessionManager *v26;
  id v27;
  id v28;
  id v29;
  __int128 *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint8_t buf[4];
  _BYTE v37[14];
  __int128 v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Model path is nil"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Model path is nil", (uint8_t *)&v38, 2u);
    }
    goto LABEL_24;
  }
  if (!v11)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Key blob is nil"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Key blob is nil", (uint8_t *)&v38, 2u);
    }
    goto LABEL_24;
  }
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x1000)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Invalid model path length (%ld)"), objc_msgSend(v10, "length"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v38) = 134217984;
      *(_QWORD *)((char *)&v38 + 4) = objc_msgSend(v10, "length");
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Invalid model path length (%ld)", (uint8_t *)&v38, 0xCu);
    }
LABEL_24:

    v14 = 0;
    goto LABEL_25;
  }
  if ((unint64_t)objc_msgSend(v11, "length") >= 0x89)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Invalid key blob length (%ld)"), objc_msgSend(v11, "length"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v38) = 134217984;
      *(_QWORD *)((char *)&v38 + 4) = objc_msgSend(v11, "length");
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Invalid key blob length (%ld)", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_24;
  }
  *(_QWORD *)&v38 = 0;
  *((_QWORD *)&v38 + 1) = &v38;
  v39 = 0x2020000000;
  v40 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  -[MLFairPlayDecryptSessionManager syncQueue](self, "syncQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __98__MLFairPlayDecryptSessionManager_startDecryptionOfModelAtPath_usingKeyBlob_teamIdentifier_error___block_invoke;
  v25 = &unk_1E3D660B8;
  v26 = self;
  v17 = v10;
  v27 = v17;
  v28 = v11;
  v29 = v12;
  v30 = &v38;
  v31 = &v32;
  dispatch_sync(v16, &block);

  v18 = *(unsigned int *)(*((_QWORD *)&v38 + 1) + 24);
  v14 = (_DWORD)v18 == 0;
  if ((_DWORD)v18)
  {
    if (a6)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Failed to set up decrypt context for %@. error:%d"), v17, v18, block, v23, v24, v25, v26, v27, v28);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_DWORD *)(*((_QWORD *)&v38 + 1) + 24);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v37 = v17;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v20;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to set up decrypt context for %@. error:%d", buf, 0x12u);
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = *((_DWORD *)v33 + 6);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v37 = v21;
      *(_WORD *)&v37[4] = 2112;
      *(_QWORD *)&v37[6] = v17;
      _os_log_debug_impl(&dword_19C486000, v19, OS_LOG_TYPE_DEBUG, "Successfully created decrypt session (id: %u) for %@", buf, 0x12u);
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
LABEL_25:

  return v14;
}

- (int)stopDecryptionOfModelAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  _BYTE v15[14];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLFairPlayDecryptSessionManager modelPathToSessionID](self, "modelPathToSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7)
  {
    -[MLFairPlayDecryptSessionManager modelPathToSessionID](self, "modelPathToSessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

    TCvO8ZqLN8g(v7);
    v10 = v9;
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412546;
        *(_QWORD *)v15 = v4;
        *(_WORD *)&v15[8] = 1024;
        *(_DWORD *)&v15[10] = v10;
        _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Failed to destroy decrypt session for %@. error=%d", (uint8_t *)&v14, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109378;
        *(_DWORD *)v15 = v7;
        *(_WORD *)&v15[4] = 2112;
        *(_QWORD *)&v15[6] = v4;
        _os_log_debug_impl(&dword_19C486000, v12, OS_LOG_TYPE_DEBUG, "Successfully destroyed decrypt session (id: %u) for %@", (uint8_t *)&v14, 0x12u);
      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)stopDecryptionOfModelAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD block[5];
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Model path is nil"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Model path is nil", (uint8_t *)&buf, 2u);
    }
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x1000)
  {
    if (a4)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Invalid model path length (%ld)"), objc_msgSend(v7, "length"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v7, "length");
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Invalid model path length (%ld)", (uint8_t *)&buf, 0xCu);
    }
LABEL_12:

    v9 = 0;
    goto LABEL_17;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 0;
  -[MLFairPlayDecryptSessionManager syncQueue](self, "syncQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MLFairPlayDecryptSessionManager_stopDecryptionOfModelAtPath_error___block_invoke;
  block[3] = &unk_1E3D66E70;
  p_buf = &buf;
  block[4] = self;
  v11 = v7;
  v15 = v11;
  dispatch_sync(v10, block);

  v12 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
  v9 = (_DWORD)v12 == 0;
  if (a4 && (_DWORD)v12)
  {
    +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Failed to destroy decrypt session for %@. error=%d"), v11, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&buf, 8);
LABEL_17:

  return v9;
}

- (NSMutableDictionary)modelPathToSessionID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- ($8D16E72C621A2E7E101564C362693498)sessionContext
{
  return self->_sessionContext;
}

- (OS_dispatch_queue)syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_modelPathToSessionID, 0);
}

uint64_t __69__MLFairPlayDecryptSessionManager_stopDecryptionOfModelAtPath_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stopDecryptionOfModelAtPath:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __98__MLFairPlayDecryptSessionManager_startDecryptionOfModelAtPath_usingKeyBlob_teamIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopDecryptionOfModelAtPath:", *(_QWORD *)(a1 + 40));
  bzero((void *)(objc_msgSend(*(id *)(a1 + 32), "sessionContext") + 12), 0x1114uLL);
  memcpy((void *)(objc_msgSend(*(id *)(a1 + 32), "sessionContext") + 160), (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), objc_msgSend(*(id *)(a1 + 40), "length"));
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionContext");
  *(_BYTE *)(v2 + objc_msgSend(*(id *)(a1 + 40), "length") + 160) = 47;
  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 40), "length") + 1;
  *(_DWORD *)(objc_msgSend(*(id *)(a1 + 32), "sessionContext") + 156) = v2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "length") <= 0x87)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "sessionContext");
    *(_OWORD *)(v3 + 20) = 0u;
    *(_OWORD *)(v3 + 36) = 0u;
    *(_OWORD *)(v3 + 52) = 0u;
    *(_OWORD *)(v3 + 68) = 0u;
    *(_OWORD *)(v3 + 84) = 0u;
    *(_OWORD *)(v3 + 100) = 0u;
    *(_OWORD *)(v3 + 116) = 0u;
    *(_OWORD *)(v3 + 132) = 0u;
    *(_QWORD *)(v3 + 148) = 0;
  }
  v4 = (void *)(objc_msgSend(*(id *)(a1 + 32), "sessionContext") + 20);
  v5 = (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "length") > 0x87)
    v6 = 136;
  else
    v6 = objc_msgSend(*(id *)(a1 + 48), "length");
  memcpy(v4, v5, v6);
  v7 = *(void **)(a1 + 56);
  v8 = objc_msgSend(*(id *)(a1 + 32), "sessionContext") + 4256;
  LOBYTE(v8) = objc_msgSend(v7, "getCString:maxLength:encoding:", v8, 128, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_debug_impl(&dword_19C486000, v10, OS_LOG_TYPE_DEBUG, "Set sessionContext->decryptContext.teamID to: %@.", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    objc_msgSend(*(id *)(a1 + 32), "sessionContext");
    xTQjDN5HCIo();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelPathToSessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Team identifier exceeds maximum allowed string length: %@.", buf, 0xCu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -1;
  }
}

@end
