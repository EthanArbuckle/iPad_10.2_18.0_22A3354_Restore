@implementation EDMessageAuthenticator

void ___ef_log_EDMessageAuthenticator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDMessageAuthenticator");
  v1 = (void *)_ef_log_EDMessageAuthenticator_log;
  _ef_log_EDMessageAuthenticator_log = (uint64_t)v0;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EDMessageAuthenticator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_46 != -1)
    dispatch_once(&log_onceToken_46, block);
  return (OS_os_log *)(id)log_log_46;
}

void __29__EDMessageAuthenticator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_46;
  log_log_46 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EDMessageAuthenticator_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (OS_os_log *)(id)signpostLog_log_0;
}

void __37__EDMessageAuthenticator_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDMessageAuthenticator)initWithMessagePersistence:(id)a3 hookRegistry:(id)a4
{
  id v7;
  id v8;
  EDMessageAuthenticator *v9;
  EDMessageAuthenticator *v10;
  ECMessageAuthenticator *v11;
  ECMessageAuthenticator *authenticator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDMessageAuthenticator;
  v9 = -[EDMessageAuthenticator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    v11 = (ECMessageAuthenticator *)objc_alloc_init(MEMORY[0x1E0D1E758]);
    authenticator = v10->_authenticator;
    v10->_authenticator = v11;

    objc_msgSend(v8, "registerMessageChangeHookResponder:", v10);
  }

  return v10;
}

- (BOOL)authenticateMessage:(id)a3
{
  id v4;
  unint64_t v5;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[EDMessageAuthenticator _authenticationStateForMessage:]((unint64_t)self, v4);
  if (self)
    messagePersistence = self->_messagePersistence;
  else
    messagePersistence = 0;
  v7 = messagePersistence;
  v8 = -[EDMessagePersistence persistMessageAuthenticationState:forMessageWithGlobalMessageID:](v7, "persistMessageAuthenticationState:forMessageWithGlobalMessageID:", v5, objc_msgSend(v4, "globalMessageID"));

  _ef_log_EDMessageAuthenticator();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = v5;
      v14 = 2048;
      v15 = v5 & 0xE28;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Persisted message authentication state %lld (on-device: %lld) for message: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[EDMessageAuthenticator authenticateMessage:].cold.1(v5, (uint64_t)v4, v10);
  }

  return v8;
}

- (unint64_t)_authenticationStateForMessage:(unint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "senders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 39)
      && (objc_msgSend(*(id *)(a1 + 8), "fullDataIfAvailableForMessage:", v4),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      _ef_log_EDMessageAuthenticator();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v4;
        v9 = "Authenticating full data for message: %{public}@";
LABEL_9:
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v4, "headersIfAvailable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encodedHeaders");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      _ef_log_EDMessageAuthenticator();
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (!v7)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[EDMessageAuthenticator _authenticationStateForMessage:].cold.1((uint64_t)v4, v8, v12, v13, v14, v15, v16, v17);
        v7 = 0;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v4;
        v9 = "Authenticating header data for message: %{public}@";
        goto LABEL_9;
      }
    }
LABEL_13:

    EMRecodeDataToNetwork();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "authenticateMessageData:sender:", v18, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = -[EDMessageAuthenticator _messageAuthenticationStateForAuthenticationResult:](a1, v19);

  }
  return a1;
}

- (BOOL)authenticateMessages:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  EDMessagePersistence *messagePersistence;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[4];
  id v39;
  os_signpost_id_t v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[EDMessageAuthenticator signpostLog](EDMessageAuthenticator, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, (const void *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"));

  +[EDMessageAuthenticator signpostLog](EDMessageAuthenticator, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    v43 = objc_msgSend(v31, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDMessageAuthenticator", "Begin message authentication (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDMessageAuthenticator_authenticateMessages___block_invoke;
  aBlock[3] = &unk_1E949CFD8;
  v40 = v6;
  v9 = v31;
  v39 = v9;
  v29 = _Block_copy(aBlock);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v14 = -[EDMessageAuthenticator _authenticationStateForMessage:]((unint64_t)self, v13);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "globalMessageID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, v16);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v10);
  }

  if (self)
    messagePersistence = self->_messagePersistence;
  else
    messagePersistence = 0;
  v19 = -[EDMessagePersistence persistMessageAuthenticationStates:](messagePersistence, "persistMessageAuthenticationStates:", v33, v29);
  _ef_log_EDMessageAuthenticator();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = (uint64_t)v4;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Persisted message authentication states: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    -[EDMessageAuthenticator authenticateMessages:].cold.1((uint64_t)v4, v21, v22, v23, v24, v25, v26, v27);
  }

  v30[2](v30, objc_msgSend(v4, "count"));
  return v19;
}

void __47__EDMessageAuthenticator_authenticateMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EDMessageAuthenticator signpostLog](EDMessageAuthenticator, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134349312;
    v9 = v7;
    v10 = 2050;
    v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageAuthenticator", "Finish message authentication (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }

}

- (unint64_t)_messageAuthenticationStateForAuthenticationResult:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  char v16;
  unint64_t v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "dkimHasServerResult"))
    {
      if (objc_msgSend(v4, "dkimServerVerified"))
        v5 = 3;
      else
        v5 = 1;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v4, "dkimError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EDMessageAuthenticator _isTemporaryDKIMError:](a1, v6);

    if (!v7)
    {
      if (objc_msgSend(v4, "dkimAttemptedHeaderVerification"))
      {
        v8 = objc_msgSend(v4, "dkimHeadersVerified");
        v9 = 4;
        if (v8)
          v9 = 12;
        v5 |= v9;
      }
      if (objc_msgSend(v4, "dkimAttemptedBodyVerification"))
      {
        v10 = objc_msgSend(v4, "dkimBodyVerified");
        v11 = 16;
        if (v10)
          v11 = 48;
        v5 |= v11;
      }
      else
      {
        objc_msgSend(v4, "bestDKIMSignatureHeader");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bodyLength");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v5 |= 0x10uLL;
      }
    }
    v14 = objc_msgSend(v4, "dmarcServerStatus");
    v15 = objc_msgSend(v4, "dmarcStatus");
    v16 = objc_msgSend(v4, "dmarcIdentifierAlignment");
    v17 = v5 & 0xFFFFFFFFFFFF003FLL | ((v14 & 7) << 6) & 0x1FF | ((v15 & 7) << 9) & 0xFFF | ((v16 & 3) << 12) & 0x3FFF | ((objc_msgSend(v4, "dmarcReceiverPolicy") & 3) << 14);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isTemporaryDKIMError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D1E4C8]))
      v6 = objc_msgSend(v4, "code") == 0;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)persistenceWillAddNewMessages:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (_os_feature_enabled_impl())
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v11;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v9 = -[EDMessageAuthenticator _authenticationStateForMessage:]((unint64_t)self, v8);
          objc_msgSend(v8, "setAuthenticationState:", v9);
          _ef_log_EDMessageAuthenticator();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            v17 = v9;
            v18 = 2048;
            v19 = v9 & 0xE28;
            v20 = 2114;
            v21 = v8;
            _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Set message authentication state %lld (on-device: %lld) on message: %{public}@", buf, 0x20u);
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

- (void)authenticateMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 134218498;
  v4 = a1;
  v5 = 2048;
  v6 = a1 & 0xE28;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to persist message authentication state %lld (on-device: %lld) for message: %{public}@", (uint8_t *)&v3, 0x20u);
}

- (void)_authenticationStateForMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "No data to authenticate for message: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)authenticateMessages:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Failed to persist message authentication states: %{public}@", a5, a6, a7, a8, 2u);
}

@end
