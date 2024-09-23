@implementation BKEnrollOperation

- (BKEnrollOperation)initWithDevice:(id)a3
{
  BKEnrollOperation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKEnrollOperation;
  v3 = -[BKOperation initWithDevice:](&v5, sel_initWithDevice_, a3);
  if (v3)
    v3->_userID = getCurrentUserID();
  return v3;
}

- (void)operationInterrupted
{
  objc_super v3;

  -[BKEnrollOperation processEnrollFailReason:](self, "processEnrollFailReason:", 2);
  v3.receiver = self;
  v3.super_class = (Class)BKEnrollOperation;
  -[BKOperation operationInterrupted](&v3, sel_operationInterrupted);
}

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSData *credentialSet;
  BKAccessoryGroup *accessoryGroup;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  credentialSet = self->_credentialSet;
  if (credentialSet)
    objc_msgSend(v4, "setObject:forKey:", credentialSet, CFSTR("BKOptionAuthWithCredentialSet"));
  accessoryGroup = self->_accessoryGroup;
  if (accessoryGroup)
  {
    -[BKAccessoryGroup serverAccessoryGroup](accessoryGroup, "serverAccessoryGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("BKOptionEnrollAccessoryGroup"));

  }
  return v5;
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
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  BiometricKitXPCClient *v17;
  uint64_t userID;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
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
    v25 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);

  }
  -[BKOperation device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  v23 = 0;
  -[BKEnrollOperation optionsDictionaryWithError:](self, "optionsDictionaryWithError:", &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;
  if (v14)
  {
    if (v13 == 2)
      v16 = 4;
    else
      v16 = 1;
    v17 = self->super._xpcClient;
    userID = self->_userID;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45__BKEnrollOperation_startBioOperation_reply___block_invoke;
    v21[3] = &unk_1E5F83DE0;
    v22 = v6;
    -[BiometricKitXPCClient enroll:forUser:withOptions:async:withReply:](v17, "enroll:forUser:withOptions:async:withReply:", v16, userID, v14, v4, v21);

  }
  else
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v7;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "options";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      v29 = &unk_1AF575226;
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v32 = 1024;
      v33 = 556;
      _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v15);
  }
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v7;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __45__BKEnrollOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  BKEnrollResultInfo *v8;
  void *v9;
  BKEnrollResultInfo *v10;

  v6 = a4;
  v7 = a3;
  v8 = [BKEnrollResultInfo alloc];
  -[BKOperation device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKEnrollResultInfo initWithServerIdentity:details:device:](v8, "initWithServerIdentity:details:device:", v7, v6, v9);

  return v10;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  BKEnrollOperation *v25;
  id v26;
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 134218242;
    v30 = v7;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::enrollResult %p(%@)\n", buf, 0x16u);
  }
  -[BKOperation delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  v13 = MEMORY[0x1E0C809B0];
  if ((v12 & 1) != 0)
  {
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __49__BKEnrollOperation_enrollResult_details_client___block_invoke;
    block[3] = &unk_1E5F84358;
    block[4] = self;
    v28 = v7;
    dispatch_async(v14, block);

  }
  -[BKOperation delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[BKEnrollOperation enrollResultInfoWithServerIdentity:details:](self, "enrollResultInfoWithServerIdentity:details:", v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v21 = v13;
    v22 = 3221225472;
    v23 = __49__BKEnrollOperation_enrollResult_details_client___block_invoke_2;
    v24 = &unk_1E5F84358;
    v25 = self;
    v26 = v17;
    v19 = v17;
    dispatch_async(v18, &v21);

  }
  -[BKOperation operationEndsWithReason:](self, "operationEndsWithReason:", 1, v21, v22, v23, v24, v25);
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v9;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::enrollResult -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __49__BKEnrollOperation_enrollResult_details_client___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BKIdentity *v3;
  uint64_t v4;
  void *v5;
  BKIdentity *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = [BKIdentity alloc];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKIdentity initWithServerIdentity:device:](v3, "initWithServerIdentity:device:", v4, v5);
  objc_msgSend(v7, "enrollOperation:finishedWithIdentity:", v2, v6);

}

void __49__BKEnrollOperation_enrollResult_details_client___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:finishedWithEnrollResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)processEnrollFailReason:(int64_t)a3
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
      _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::processEnrollFailReason: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__BKEnrollOperation_processEnrollFailReason___block_invoke;
    v12[3] = &unk_1E5F83C10;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v11, v12);

  }
}

void __45__BKEnrollOperation_processEnrollFailReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:failedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  -[BKEnrollOperation statusMessage:details:client:](self, "statusMessage:details:client:", *(_QWORD *)&a3, 0, a4);
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  void *v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;
  BKAccessory *v25;
  void *v26;
  BKAccessory *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  objc_super v31;
  _QWORD v32[5];
  BKAccessory *v33;
  _QWORD block[6];
  uint8_t buf[4];
  _BYTE v36[18];
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v6 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  kdebug_trace();
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v36 = v6;
    *(_WORD *)&v36[4] = 2048;
    *(_QWORD *)&v36[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: %u (_cid %lu)\n", buf, 0x12u);

  }
  if ((v6 - 100) > 0xFF)
  {
    v15 = 1;
    switch((int)v6)
    {
      case 'B':
        goto LABEL_25;
      case 'C':
        v15 = 2;
        goto LABEL_25;
      case 'D':
        v15 = 3;
LABEL_25:
        -[BKEnrollOperation processEnrollFailReason:](self, "processEnrollFailReason:", v15);
        goto LABEL_26;
      case 'E':
        goto LABEL_26;
      case 'F':
        goto LABEL_16;
      default:
        if ((_DWORD)v6 == 501)
        {
          -[BKOperation delegate](self, "delegate", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_opt_respondsToSelector();

          if ((v23 & 1) != 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKAuthRequiredForAccessory"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = [BKAccessory alloc];
              -[BKOperation device](self, "device");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[BKAccessory initWithServerAccessory:device:](v25, "initWithServerAccessory:device:", v24, v26);

              if (v27)
              {
                -[BKOperation dispatchQueue](self, "dispatchQueue");
                v28 = objc_claimAutoreleasedReturnValue();
                v32[0] = MEMORY[0x1E0C809B0];
                v32[1] = 3221225472;
                v32[2] = __50__BKEnrollOperation_statusMessage_details_client___block_invoke_158;
                v32[3] = &unk_1E5F84358;
                v32[4] = self;
                v33 = v27;
                dispatch_async(v28, v32);

              }
              else
              {
                if (__osLog)
                  v30 = __osLog;
                else
                  v30 = v9;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(_QWORD *)v36 = "accessory";
                  *(_WORD *)&v36[8] = 2048;
                  *(_QWORD *)&v36[10] = 0;
                  v37 = 2080;
                  v38 = &unk_1AF575226;
                  v39 = 2080;
                  v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
                  v41 = 1024;
                  v42 = 676;
                  _os_log_impl(&dword_1AF533000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }

            }
          }
        }
        else
        {
LABEL_26:
          v31.receiver = self;
          v31.super_class = (Class)BKEnrollOperation;
          -[BKOperation statusMessage:client:](&v31, sel_statusMessage_client_, v6, a5);
        }
        break;
    }
  }
  else
  {
    -[BKOperation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v16 = ((100 * (_WORD)v6 - 10000) & 0xFFFCu) / 0xFF;
      if (__osLog)
        v17 = __osLog;
      else
        v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        -[BKOperation delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v36 = v19;
        *(_WORD *)&v36[8] = 2112;
        *(_QWORD *)&v36[10] = v20;
        v37 = 2048;
        v38 = (void *)v16;
        _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: %p(%@) percentCompleted: %ld\n", buf, 0x20u);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__BKEnrollOperation_statusMessage_details_client___block_invoke;
      block[3] = &unk_1E5F83C10;
      block[4] = self;
      block[5] = v16;
      dispatch_async(v21, block);

    }
LABEL_16:
    -[BiometricKitXPCClient enrollContinue](self->super._xpcClient, "enrollContinue", v15);
  }
  if (__osLogTrace)
    v29 = __osLogTrace;
  else
    v29 = v9;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v29, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __50__BKEnrollOperation_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:percentCompleted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50__BKEnrollOperation_statusMessage_details_client___block_invoke_158(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:requiredAuthorizationForAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (void)setAccessoryGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_credentialSet, 0);
}

@end
