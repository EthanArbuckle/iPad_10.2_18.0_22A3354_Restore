@implementation BKExtendEnrollTouchIDOperation

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  BKIdentity *identity;
  void *v13;
  void *v14;
  NSData *credentialSet;
  BiometricKitXPCClient *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v24 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E5F8D310);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  if (identity)
  {
    v21 = CFSTR("BKFilterIdentity");
    -[BKIdentity serverIdentity](identity, "serverIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  credentialSet = self->_credentialSet;
  if (credentialSet)
    objc_msgSend(v11, "setObject:forKey:", credentialSet, CFSTR("BKOptionAuthWithCredentialSet"));
  v16 = self->super._xpcClient;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__BKExtendEnrollTouchIDOperation_startBioOperation_reply___block_invoke;
  v19[3] = &unk_1E5F83DE0;
  v17 = v6;
  v20 = v17;
  -[BiometricKitXPCClient match:withOptions:async:withReply:](v16, "match:withOptions:async:withReply:", v14, v11, v4, v19);

  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __58__BKExtendEnrollTouchIDOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    +[BKErrorHelper errorWithOSStatus:](BKErrorHelper, "errorWithOSStatus:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  kdebug_trace();
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v22 = v7;
    v23 = 2112;
    v24 = v7;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult:withDictionary: %p(%@) %p)\n", buf, 0x20u);
  }
  -[BKOperation delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v9;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[BKOperation delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 1024;
      LODWORD(v26) = v7 != 0;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult: %p(%@) hasUpdated: %u\n", buf, 0x1Cu);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__BKExtendEnrollTouchIDOperation_matchResult_details_client___block_invoke;
    v19[3] = &unk_1E5F843D0;
    v19[4] = self;
    v20 = v7 != 0;
    dispatch_async(v17, v19);

  }
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v9;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult:withDictionary: -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __61__BKExtendEnrollTouchIDOperation_matchResult_details_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendEnroll:hasUpdated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  objc_super v19;
  _QWORD block[6];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v5;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: %u\n", buf, 8u);
  }
  v9 = __statusToFingerprintCaptureError(v5);
  if (v9)
  {
    v10 = v9;
    -[BKOperation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v7;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[BKOperation delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2048;
        v26 = v10;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__BKExtendEnrollTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E5F83C10;
      block[4] = self;
      block[5] = v10;
      dispatch_async(v17, block);

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)BKExtendEnrollTouchIDOperation;
  -[BKOperation statusMessage:client:](&v19, sel_statusMessage_client_, v5, a4);
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __55__BKExtendEnrollTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerprintCaptureOperation:encounteredCaptureError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)homeButtonPressed:(unint64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed\n", buf, 2u);
  }
  -[BKOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[BKOperation delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed: %p(%@) homeButtonPressedInEnrollOperation\n", buf, 0x16u);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__BKExtendEnrollTouchIDOperation_homeButtonPressed___block_invoke;
    block[3] = &unk_1E5F83D50;
    block[4] = self;
    dispatch_async(v12, block);

  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v4;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed: -> void\n", buf, 2u);
  }
}

void __52__BKExtendEnrollTouchIDOperation_homeButtonPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchIDButtonPressedInOperation:", *(_QWORD *)(a1 + 32));

}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
