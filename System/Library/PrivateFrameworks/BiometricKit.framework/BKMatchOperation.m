@implementation BKMatchOperation

- (BKMatchOperation)initWithDevice:(id)a3
{
  BKMatchOperation *v3;
  BKMatchOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKMatchOperation;
  v3 = -[BKOperation initWithDevice:](&v6, sel_initWithDevice_, a3);
  v4 = v3;
  if (v3)
    v3->_purpose = 1;
  BKLogEvent(0x40000u);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  BKLogEvent(0x40002u);
  v3.receiver = self;
  v3.super_class = (Class)BKMatchOperation;
  -[BKOperation dealloc](&v3, sel_dealloc);
}

- (void)operationInterrupted
{
  objc_super v3;

  -[BKMatchOperation processMatchFailReason:](self, "processMatchFailReason:", 1);
  v3.receiver = self;
  v3.super_class = (Class)BKMatchOperation;
  -[BKOperation operationInterrupted](&v3, sel_operationInterrupted);
}

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSData *credentialSet;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(self->_purpose)
  {
    case 1:
      goto LABEL_24;
    case 2:
      credentialSet = (NSData *)MEMORY[0x1E0C9AAB0];
      v8 = CFSTR("BKOptionMatchForUnlock");
      goto LABEL_23;
    case 3:
      credentialSet = self->_credentialSet;
      if (credentialSet)
        goto LABEL_18;
      if (__osLog)
        v9 = __osLog;
      else
        v9 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136316162;
      v32 = "_credentialSet";
      v33 = 2048;
      v34 = 0;
      v35 = 2080;
      v36 = &unk_1AF575226;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v39 = 1024;
      v40 = 771;
      goto LABEL_8;
    case 4:
      if (self->_credentialSet)
      {
        objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchForUnlock"));
        credentialSet = self->_credentialSet;
LABEL_18:
        v8 = CFSTR("BKOptionMatchForCredentialSet");
LABEL_23:
        objc_msgSend(v6, "setObject:forKey:", credentialSet, v8);
LABEL_24:
        v11 = self->_useCase - 1;
        if (v11 <= 2)
          objc_msgSend(v6, "setObject:forKey:", *(&off_1E5F84558 + v11), CFSTR("BKOptionMatchUseCase"));
        if (self->_priority)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("BKOptionPriority"));

        }
        if (self->_stopOnSuccess)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("BKOptionMatchStopOnSuccess"));

        }
        if (!self->_selectedIdentities)
          goto LABEL_41;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v15 = self->_selectedIdentities;
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (!v16)
            goto LABEL_40;
          v17 = v16;
          v18 = *(_QWORD *)v27;
          while (1)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "serverIdentity", (_QWORD)v26);
              v20 = objc_claimAutoreleasedReturnValue();
              if (!v20)
              {
                if (__osLog)
                  v23 = __osLog;
                else
                  v23 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v32 = "serverIdentity";
                  v33 = 2048;
                  v34 = 0;
                  v35 = 2080;
                  v36 = &unk_1AF575226;
                  v37 = 2080;
                  v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
                  v39 = 1024;
                  v40 = 825;
                  _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
                setError((id)1, a3);

LABEL_48:
                goto LABEL_49;
              }
              v21 = (void *)v20;
              objc_msgSend(v14, "addObject:", v20);

            }
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (!v17)
            {
LABEL_40:

              objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("BKOptionMatchSelectedIdentities"));
LABEL_41:
              v22 = v6;
              goto LABEL_50;
            }
          }
        }
        if (__osLog)
          v25 = __osLog;
        else
          v25 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v32 = "serverIdentities";
          v33 = 2048;
          v34 = 0;
          v35 = 2080;
          v36 = &unk_1AF575226;
          v37 = 2080;
          v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
          v39 = 1024;
          v40 = 822;
          _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setError((id)1, a3);
        goto LABEL_48;
      }
      if (__osLog)
        v9 = __osLog;
      else
        v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v32 = "_credentialSet";
        v33 = 2048;
        v34 = 0;
        v35 = 2080;
        v36 = &unk_1AF575226;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
        v39 = 1024;
        v40 = 776;
LABEL_8:
        _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_9:
      setError((id)1, a3);
LABEL_49:
      v22 = 0;
LABEL_50:

      return v22;
    case 5:
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchForPreArm"));
      if (self->_captureOnly)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("BKOptionMatchCaptureOnly"));

      }
      goto LABEL_24;
    case 6:
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchBypassPasscodeBiolockout"));
      credentialSet = self->_credentialSet;
      if (!credentialSet)
        goto LABEL_24;
      v8 = CFSTR("BKOptionAuthWithCredentialSet");
      goto LABEL_23;
    default:
      if (__osLog)
        v9 = __osLog;
      else
        v9 = MEMORY[0x1E0C81028];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136316162;
      v32 = "0";
      v33 = 2048;
      v34 = 0;
      v35 = 2080;
      v36 = &unk_1AF575226;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v39 = 1024;
      v40 = 797;
      goto LABEL_8;
  }
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  id v12;
  NSNumber *userID;
  void *v14;
  BiometricKitXPCClient *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  const __CFString *v21;
  NSNumber *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
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
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);

  }
  v20 = 0;
  -[BKMatchOperation optionsDictionaryWithError:](self, "optionsDictionaryWithError:", &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v11)
  {
    userID = self->_userID;
    if (userID)
    {
      v21 = CFSTR("BKFilterUserID");
      v22 = userID;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v15 = self->super._xpcClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__BKMatchOperation_startBioOperation_reply___block_invoke;
    v18[3] = &unk_1E5F83DE0;
    v19 = v6;
    -[BiometricKitXPCClient match:withOptions:async:withReply:](v15, "match:withOptions:async:withReply:", v14, v11, v4, v18);

  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "options";
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v31 = 1024;
      v32 = 852;
      _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v12);
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __44__BKMatchOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  BKMatchResultInfo *v8;
  void *v9;
  BKMatchResultInfo *v10;

  v6 = a4;
  v7 = a3;
  v8 = [BKMatchResultInfo alloc];
  -[BKOperation device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKMatchResultInfo initWithServerIdentity:details:device:](v8, "initWithServerIdentity:details:device:", v7, v6, v9);

  return v10;
}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
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
    v11 = v10;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailLockoutState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v25, "intValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailUnlocked"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailCredentialAdded"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailResultIgnored"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");
    *(_DWORD *)buf = 134219522;
    v29 = v7;
    v30 = 2112;
    v31 = v7;
    v32 = 2048;
    v33 = v8;
    v34 = 1024;
    v35 = v12;
    v9 = MEMORY[0x1E0C81028];
    v36 = 1024;
    v37 = v14;
    v38 = 1024;
    v39 = v16;
    v40 = 1024;
    v41 = v18;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::matchResult:withDictionary: %p(%@) %p(LockoutState:%d,Unlocked:%d,CredentialAdded:%d,Ignored:%u)\n", buf, 0x38u);

  }
  -[BKOperation delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[BKMatchOperation matchResultInfoWithServerIdentity:details:](self, "matchResultInfoWithServerIdentity:details:", v7, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__BKMatchOperation_matchResult_details_client___block_invoke;
    block[3] = &unk_1E5F84358;
    block[4] = self;
    v27 = v21;
    v23 = v21;
    dispatch_async(v22, block);

  }
  if (__osLogTrace)
    v24 = __osLogTrace;
  else
    v24 = v9;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::matchResult:withDictionary: -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __47__BKMatchOperation_matchResult_details_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:matchedWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)processMatchFailReason:(int64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BKOperation delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[BKOperation delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::processMatchFailReason: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__BKMatchOperation_processMatchFailReason___block_invoke;
    v12[3] = &unk_1E5F83C10;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v11, v12);

  }
}

void __43__BKMatchOperation_processMatchFailReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:failedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v17;
  _QWORD block[6];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 67109376;
    v20 = v5;
    v21 = 2048;
    v22 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::statusMessage: %u (_cid %lu)\n", buf, 0x12u);

  }
  if ((int)v5 <= 91)
  {
    v11 = 2;
    switch((int)v5)
    {
      case 'P':
        v12 = 2;
        break;
      case 'Q':
        goto LABEL_18;
      case 'R':
        v11 = 3;
        goto LABEL_18;
      case 'S':
        v11 = 4;
        goto LABEL_18;
      default:
        if ((_DWORD)v5 != 51)
          goto LABEL_20;
        v12 = 1;
        break;
    }
LABEL_14:
    -[BKMatchOperation processMatchFailReason:](self, "processMatchFailReason:", v12);
    goto LABEL_20;
  }
  if ((_DWORD)v5 != 92)
  {
    if ((_DWORD)v5 != 502)
      goto LABEL_20;
    v12 = 8;
    goto LABEL_14;
  }
  v11 = 5;
LABEL_18:
  -[BKOperation delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__BKMatchOperation_statusMessage_client___block_invoke;
    block[3] = &unk_1E5F83C10;
    block[4] = self;
    block[5] = v11;
    dispatch_async(v15, block);

  }
LABEL_20:
  v17.receiver = self;
  v17.super_class = (Class)BKMatchOperation;
  -[BKOperation statusMessage:client:](&v17, sel_statusMessage_client_, v5, a4);
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::statusMessage: -> void\n", buf, 2u);
  }
}

void __41__BKMatchOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:presenceDetectedInLockout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (NSNumber)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (NSArray)selectedIdentities
{
  return self->_selectedIdentities;
}

- (void)setSelectedIdentities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int64_t)a3
{
  self->_useCase = a3;
}

- (BOOL)stopOnSuccess
{
  return self->_stopOnSuccess;
}

- (void)setStopOnSuccess:(BOOL)a3
{
  self->_stopOnSuccess = a3;
}

- (BOOL)captureOnly
{
  return self->_captureOnly;
}

- (void)setCaptureOnly:(BOOL)a3
{
  self->_captureOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_selectedIdentities, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
