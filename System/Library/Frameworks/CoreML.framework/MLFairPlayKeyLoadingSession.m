@implementation MLFairPlayKeyLoadingSession

- (MLFairPlayKeyLoadingSession)init
{
  MLFairPlayKeyLoadingSession *v2;
  MLFairPlayKeyLoadingSession *v3;
  NSString *keyIdentifier;
  $8D16E72C621A2E7E101564C362693498 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLFairPlayKeyLoadingSession;
  v2 = -[MLFairPlayKeyLoadingSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sessionID = -1;
    keyIdentifier = v2->_keyIdentifier;
    v2->_keyIdentifier = (NSString *)CFSTR("Uninitialized");

    v5 = ($8D16E72C621A2E7E101564C362693498 *)malloc_type_calloc(1uLL, 0x11D0uLL, 0x1000040CE5F979FuLL);
    v3->_sessionContext = v5;
    *(_QWORD *)&v5->var0 = 0x1411000001000000;
    v5->var2 = -1342177280;
  }
  return v3;
}

- (void)dealloc
{
  unsigned int sessionID;
  int v4;
  int v5;
  NSObject *v6;
  $8D16E72C621A2E7E101564C362693498 *sessionContext;
  NSString *keyIdentifier;
  objc_super v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sessionID = self->_sessionID;
  if (sessionID != -1)
  {
    TCvO8ZqLN8g(sessionID);
    if (v4)
    {
      v5 = v4;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        keyIdentifier = self->_keyIdentifier;
        *(_DWORD *)buf = 138412546;
        v11 = keyIdentifier;
        v12 = 1024;
        v13 = v5;
        _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "Failed to destroy FairPlay session for %@ : error=%d", buf, 0x12u);
      }

    }
  }
  sessionContext = self->_sessionContext;
  if (sessionContext)
    free(sessionContext);
  v9.receiver = self;
  v9.super_class = (Class)MLFairPlayKeyLoadingSession;
  -[MLFairPlayKeyLoadingSession dealloc](&v9, sel_dealloc);
}

- (id)transformKeyIdentifier:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithUUIDString:", v7);

  if (v8)
  {
    v15[0] = 0;
    v15[1] = 0;
    objc_msgSend(v8, "getUUIDBytes:", v15);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((unint64_t)objc_msgSend(v9, "length") < 0x11)
      {
        v11 = v10;
        goto LABEL_13;
      }
      if (a4)
      {
        +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Key identifier (%lu) is larger than supported size (%d)"), objc_msgSend(v10, "length"), 16);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
    else if (a4)
    {
      -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Failed to transform key identifier (%@) to data"), v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
    goto LABEL_13;
  }
  if (a4)
  {
    -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionKeyFetchErrorWithUnderlyingError:format:", 0, CFSTR("Key identifier (%@) is not in the UUID format. Make sure .mlmodelkey file was not modified before it was used for encrypting the model."), v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (id)generateKeyRequestForKeyIdentifier:(id)a3 teamIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  $8D16E72C621A2E7E101564C362693498 *v15;
  $8D16E72C621A2E7E101564C362693498 *v16;
  $8D16E72C621A2E7E101564C362693498 *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MLFairPlayKeyLoadingSession sessionID](self, "sessionID") == -1)
  {
    -[MLFairPlayKeyLoadingSession transformKeyIdentifier:error:](self, "transformKeyIdentifier:error:", v8, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[MLFairPlayKeyLoadingSession sessionContext](self, "sessionContext");
      v10 = objc_retainAutorelease(v14);
      *(_OWORD *)v15->var4.var0 = *(_OWORD *)-[NSObject bytes](v10, "bytes");
      v16 = -[MLFairPlayKeyLoadingSession sessionContext](self, "sessionContext");
      *(_QWORD *)&v16->var4.var1[8] = 0;
      *(_QWORD *)v16->var4.var1 = 0;
      *(_BYTE *)(-[MLFairPlayKeyLoadingSession sessionContext](self, "sessionContext") + 4400) = 1;
      v17 = -[MLFairPlayKeyLoadingSession sessionContext](self, "sessionContext") + 4432;
      v18 = objc_msgSend(v9, "getCString:maxLength:encoding:", v17, 128, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v9;
          _os_log_debug_impl(&dword_19C486000, v20, OS_LOG_TYPE_DEBUG, "Set sessionContext->keyRequestContext.teamID to: %@.", buf, 0xCu);
        }

        -[MLFairPlayKeyLoadingSession sessionContext](self, "sessionContext");
        xTQjDN5HCIo();
        if (!(_DWORD)v21)
        {
          -[MLFairPlayKeyLoadingSession setSessionID:](self, "setSessionID:", 0);
          -[MLFairPlayKeyLoadingSession setKeyIdentifier:](self, "setKeyIdentifier:", v8);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
        v22 = v21;
        if (a5)
        {
          +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Failed to generate key request for %@ with error: %d"), v8, v21);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v8;
          v27 = 1024;
          v28 = v22;
          _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Failed to generate key request for %@ with error: %d", buf, 0x12u);
        }

      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v9;
          _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Team identifier exceeds maximum allowed string length: %@.", buf, 0xCu);
        }

      }
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v8;
        _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "Cannot transform key identifier (%@) to data.", buf, 0xCu);
      }

      v10 = 0;
    }
  }
  else
  {
    if (a5)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Cannot generate key request at this time for %@. Session %d in progress."), v8, -[MLFairPlayKeyLoadingSession sessionID](self, "sessionID"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 1024;
      v28 = -[MLFairPlayKeyLoadingSession sessionID](self, "sessionID");
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Cannot generate key request at this time for %@. Session %d in progress.", buf, 0x12u);
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)generatePersistentKeyBlobFromKeyResponse:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  unsigned int v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[MLFairPlayKeyLoadingSession sessionID](self, "sessionID") == -1)
  {
    if (a4)
    {
      -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Cannot process key response for %@ at this time. No active session."), v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    v14 = "Cannot process key response for %@ at this time. No active session.";
    v15 = v12;
    v16 = 12;
    goto LABEL_14;
  }
  v21 = 0;
  v20 = 0;
  v7 = -[MLFairPlayKeyLoadingSession sessionID](self, "sessionID");
  v8 = objc_retainAutorelease(v6);
  v9 = T8HkBFEVEnY(v7, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (uint64_t)&v21, (uint64_t)&v20);
  if (!(_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v10 = v9;
  if (a4)
  {
    -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("Failed to process key response for %@ : error=%d"), v11, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[MLFairPlayKeyLoadingSession keyIdentifier](self, "keyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v13;
    v24 = 1024;
    v25 = v10;
    v14 = "Failed to process key response for %@ : error=%d";
    v15 = v12;
    v16 = 18;
LABEL_14:
    _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);

  }
LABEL_10:

  v18 = 0;
LABEL_12:

  return v18;
}

- (NSString)keyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- ($8D16E72C621A2E7E101564C362693498)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id *)a3
{
  self->_sessionContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
