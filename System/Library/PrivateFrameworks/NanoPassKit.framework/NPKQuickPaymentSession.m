@implementation NPKQuickPaymentSession

+ (NPKQuickPaymentSession)sessionWithQueue:(id)a3
{
  id v3;
  __objc2_class **v4;
  void *v5;

  v3 = a3;
  v4 = off_24CFE52C8;
  if ((NPKIsRunningInUIOnlyDemoMode() & 1) == 0 && !NPKIsRunningInStoreDemoMode())
    v4 = off_24CFE5FC0;
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithQueue:", v3);

  return (NPKQuickPaymentSession *)v5;
}

+ (id)_outstandingSessionHashTable
{
  if (_outstandingSessionHashTable_onceToken != -1)
    dispatch_once(&_outstandingSessionHashTable_onceToken, &__block_literal_global_15);
  return (id)_outstandingSessionHashTable_hashTable;
}

void __54__NPKQuickPaymentSession__outstandingSessionHashTable__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_outstandingSessionHashTable_hashTable;
  _outstandingSessionHashTable_hashTable = v0;

}

+ (BOOL)hasOutstandingSessions
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_outstandingSessionHashTable");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        pk_Payment_log();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

        if (v8)
        {
          pk_Payment_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = objc_msgSend(v6, "isDeactivated");
            *(_DWORD *)buf = 138412546;
            v17 = v6;
            v18 = 1024;
            v19 = v10;
            _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: session: %@ deactivated %d", buf, 0x12u);
          }

        }
        if (v6 && !objc_msgSend(v6, "isDeactivated"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_16:

  return v3;
}

+ (void)_handleNewContactlessSession:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling new contactless session: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(a1, "_outstandingSessionHashTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (NPKQuickPaymentSession)initWithQueue:(id)a3
{
  id v5;
  NPKQuickPaymentSession *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *paymentSessionQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKQuickPaymentSession;
  v6 = -[NPKQuickPaymentSession init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("NPKQuickPaymentSessionInternalQueue", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("NPKQuickPaymentSessionQueue", v7);
    paymentSessionQueue = v6->_paymentSessionQueue;
    v6->_paymentSessionQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v6->_requireFirstInQueue = 1;
    v6->_endSessionWhenAuthorizationIsConsumed = 1;
    atomic_store(0, &v6->_atomicIsSwitchingSessionTypeCount);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lifecycleState");

  if (v5 != 2)
  {
    -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateSessionWithCompletion:", &__block_literal_global_72);

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v7.receiver = self;
  v7.super_class = (Class)NPKQuickPaymentSession;
  -[NPKQuickPaymentSession dealloc](&v7, sel_dealloc);
}

void __33__NPKQuickPaymentSession_dealloc__block_invoke()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_Payment_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_DEFAULT, "Warning: Quick payment session: invalidated session we left open", v3, 2u);
    }

  }
}

- (BOOL)startSession
{
  return -[NPKQuickPaymentSession startSessionWithCompletion:](self, "startSessionWithCompletion:", 0);
}

- (BOOL)isSwitchingSessionType
{
  unsigned int v2;

  v2 = atomic_load(&self->_atomicIsSwitchingSessionTypeCount);
  return v2 != 0;
}

- (BOOL)startSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *paymentSessionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  objc_msgSend((id)objc_opt_class(), "_handleNewContactlessSession:", self);
  paymentSessionQueue = self->_paymentSessionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke;
  block[3] = &unk_24CFEA488;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(paymentSessionQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_2;
  v5[3] = &unk_24CFEA460;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:", v5);

}

void __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "currentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
  if (objc_msgSend(*(id *)(a1 + 32), "inServiceMode"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 64);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_3;
    block[3] = &unk_24CFE7998;
    block[4] = v3;
    dispatch_async(v4, block);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

uint64_t __53__NPKQuickPaymentSession_startSessionWithCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enablePersistentCardEmulation");
}

- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Authorizing ISO18013 Request with dataToRelease:%@ credential:%@", buf, 0x16u);
    }

  }
  -[NPKQuickPaymentSession paymentSessionQueue](self, "paymentSessionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__NPKQuickPaymentSession_authorize18013RequestWithDataToRelease_credential___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

}

void __76__NPKQuickPaymentSession_authorize18013RequestWithDataToRelease_credential___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contactlessSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorize18013RequestWithDataToRelease:credential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)executeRKEActionForPass:(id)a3 function:(id)a4 action:(id)a5 withCompletion:(id)a6
{
  char *v10;
  char *v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  id v21;
  id v22;
  char *v23;
  _QWORD v24[5];
  char *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)a3;
  v11 = (char *)a4;
  v12 = a5;
  v13 = a6;
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)MEMORY[0x2199B6780](v13);
      *(_DWORD *)buf = 138413058;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = (uint64_t)v12;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Executing RKE action for pass:%@ function:%@ action:%@ with completion:%@", buf, 0x2Au);

    }
  }
  if (-[NPKQuickPaymentSession requireFirstInQueue](self, "requireFirstInQueue"))
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v29 = "-[NPKQuickPaymentSession executeRKEActionForPass:function:action:withCompletion:]";
        v30 = 2082;
        v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKQuickPaymentSession.m";
        v32 = 2048;
        v33 = 233;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: We don't need to require first in queue when executing RKE actions.)", buf, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke;
  v24[3] = &unk_24CFEA500;
  v24[4] = self;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v21 = v13;
  v22 = v12;
  v23 = v11;
  -[NPKQuickPaymentSession startSessionWithCompletion:](self, "startSessionWithCompletion:", v24);

}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v3 + 64);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_2;
    v7[3] = &unk_24CFE86A0;
    v7[4] = v3;
    v8 = v4;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    dispatch_async(v5, v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "contactlessSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_3;
  v5[3] = &unk_24CFEA4D8;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "sendRKEFunction:action:withAuthorization:completion:", v3, v4, 0, v5);

}

void __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_3(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_4;
  v5[3] = &unk_24CFEA4B0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __81__NPKQuickPaymentSession_executeRKEActionForPass_function_action_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)setCurrentPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment session: setting current pass to %@", buf, 0xCu);

    }
  }
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke;
  v11[3] = &unk_24CFE7E40;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(internalQueue, v11);

}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  _BYTE v32[24];
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = NPKQuickPaymentSessionTypeForPass(*(void **)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = NPKQuickPaymentSessionTypeForPass(*(void **)(a1 + 40));
  v5 = v4;
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = v2 != 1 || v3 != 1 || v3 != v4;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKQuickPaymentSessionType(v2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKQuickPaymentSessionType(v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKQuickPaymentSessionType(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) != 0;
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v32 = v9;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v13;
      *(_WORD *)&v32[14] = 2112;
      *(_QWORD *)&v32[16] = v14;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v16;
      v37 = 1024;
      v38 = v17;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Needs to refresh session:%d, current pass sessionType:%@ current session:%@ expected:%@ currentPass:%@ hasContactLessSession:%d", buf, 0x36u);

    }
  }
  v18 = *(unsigned int **)(a1 + 32);
  if (v9)
  {
    v19 = v18 + 4;
    do
    {
      v20 = __ldaxr(v19);
      v21 = v20 + 1;
    }
    while (__stlxr(v21, v19));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 0;
    pk_Payment_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uniqueID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v32 = v25;
        *(_WORD *)&v32[8] = 2048;
        *(_QWORD *)&v32[10] = v21;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: refreshing session for pass with uniqueID:%@ count:%lu", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateSessionWithCompletion:", &__block_literal_global_78);
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_setCurrentPass:", *(_QWORD *)(a1 + 40));
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    v28 = *(NSObject **)(v26 + 64);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_79;
    v29[3] = &unk_24CFE7E40;
    v29[4] = v26;
    v30 = v27;
    dispatch_async(v28, v29);

  }
  else
  {
    objc_msgSend(v18, "_internalQueue_setCurrentPass:", *(_QWORD *)(a1 + 40));
  }
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_77()
{
  NSObject *v0;
  _BOOL4 v1;
  NSObject *v2;
  uint8_t v3[16];

  pk_Payment_log();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213518000, v2, OS_LOG_TYPE_DEFAULT, "Notice: Old session deactivated", v3, 2u);
    }

  }
}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_79(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_2;
  v2[3] = &unk_24CFE7E40;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:", v2);

}

void __41__NPKQuickPaymentSession_setCurrentPass___block_invoke_2(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 16);
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: finish refresh session count:%lu", (uint8_t *)&v8, 0xCu);
    }

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
}

- (void)_internalQueue_setCurrentPass:(id)a3
{
  PKPass *v5;
  PKPass *currentPass;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *callbackQueue;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NPKQuickPaymentSession *v18;
  PKPass *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  PKPass *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (PKPass *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  currentPass = self->_currentPass;
  objc_storeStrong((id *)&self->_currentPass, a3);
  if (currentPass != v5)
  {
    v7 = NPKQuickPaymentSessionTypeForPass(v5);
    if (-[NPKQuickPaymentSession sessionStarted](self, "sessionStarted"))
    {
      if (v7 != self->_sessionType)
      {
        pk_General_log();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

        if (v9)
        {
          pk_General_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            NSStringFromNPKQuickPaymentSessionType(v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromNPKQuickPaymentSessionType(self->_sessionType);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v21 = v11;
            v22 = 2112;
            v23 = v5;
            v24 = 2112;
            v25 = v12;
            _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: expected session type:%@ for pass:%@, current session type:%@ doesn't match. Expect bad thing to happen.", buf, 0x20u);

          }
        }
      }
    }
    callbackQueue = self->_callbackQueue;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __56__NPKQuickPaymentSession__internalQueue_setCurrentPass___block_invoke;
    v17 = &unk_24CFE7E40;
    v18 = self;
    v19 = v5;
    dispatch_async(callbackQueue, &v14);
    if (self->_contactlessSession)
      -[NPKQuickPaymentSession _internalQueue_updateSessionWithCurrentPassAndLoyaltyState](self, "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState", v14, v15, v16, v17, v18);

  }
}

void __56__NPKQuickPaymentSession__internalQueue_setCurrentPass___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didMakePassCurrent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setVasPasses:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NPKQuickPaymentSession_setVasPasses___block_invoke;
  block[3] = &unk_24CFE7E40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

_QWORD *__39__NPKQuickPaymentSession_setVasPasses___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  result = *(_QWORD **)(a1 + 32);
  if (result[12])
    return (_QWORD *)objc_msgSend(result, "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
  return result;
}

- (void)setCredential:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  NPKQuickPaymentSession *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: requested to set credential:%@", buf, 0xCu);
    }

  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__NPKQuickPaymentSession_setCredential___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v11 = v4;
  v12 = self;
  v9 = v4;
  dispatch_async(internalQueue, v10);

}

void __40__NPKQuickPaymentSession_setCredential___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: setting credential:%@", buf, 0xCu);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), *(id *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend((id)v6, "_updateSessionWithCredentialAndActivate");
    v6 = *(_QWORD *)(a1 + 40);
  }
  v7 = *(NSObject **)(v6 + 80);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NPKQuickPaymentSession_setCredential___block_invoke_82;
  block[3] = &unk_24CFE7998;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __40__NPKQuickPaymentSession_setCredential___block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: paymentSessionDidReceiveCredential callback", v8, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentSessionDidReceiveCredential:", *(_QWORD *)(a1 + 32));

  }
}

- (void)confirmSessionExpectingCredential:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__NPKQuickPaymentSession_confirmSessionExpectingCredential___block_invoke;
  v4[3] = &unk_24CFE7D78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __60__NPKQuickPaymentSession_confirmSessionExpectingCredential___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(v1 + 24);
  *(_BYTE *)(v1 + 24) = 1;
  if (!v2 && (*(_QWORD *)(*(_QWORD *)(result + 32) + 8) || !*(_BYTE *)(result + 40)))
    return objc_msgSend(*(id *)(result + 32), "_updateSessionWithCredentialAndActivate");
  return result;
}

- (NSDictionary)vasPasses
{
  return self->_vasPasses;
}

- (void)setDeferAuthorization:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *internalQueue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("no");
      if (v3)
        v8 = CFSTR("yes");
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Setting defer authorization on quick payment session: %@", buf, 0xCu);
    }

  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__NPKQuickPaymentSession_setDeferAuthorization___block_invoke;
  v10[3] = &unk_24CFE7D78;
  v10[4] = self;
  v11 = v3;
  dispatch_sync(internalQueue, v10);
}

void __48__NPKQuickPaymentSession_setDeferAuthorization___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = *(_BYTE *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 128);
  if (*(_BYTE *)(a1 + 40))
  {
    if (!v2)
    {
      v4 = objc_alloc_init(MEMORY[0x24BE6EB20]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 128);
      *(_QWORD *)(v5 + 128) = v4;

    }
  }
  else if (v2)
  {
    *(_QWORD *)(v1 + 128) = 0;

  }
}

- (BOOL)deferAuthorization
{
  return self->_deferAuthorization;
}

- (BOOL)sessionStarted
{
  return self->_contactlessSession != 0;
}

- (void)setInServiceMode:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke;
  v4[3] = &unk_24CFE7D78;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(internalQueue, v4);
}

void __43__NPKQuickPaymentSession_setInServiceMode___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD block[5];

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 22))
  {
    *(_BYTE *)(v2 + 22) = v1;
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(NSObject **)(v3 + 64);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_2;
      block[3] = &unk_24CFE7998;
      block[4] = v3;
      dispatch_async(v4, block);
    }
    else
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        pk_Payment_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Cannot disable persistent card emulation on a session!", v8, 2u);
        }

      }
    }
  }
}

void __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_enablePersistentCardEmulation"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_3;
    block[3] = &unk_24CFE7998;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  else
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Failed to enable service mode!", v7, 2u);
      }

    }
  }
}

uint64_t __43__NPKQuickPaymentSession_setInServiceMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
}

- (void)_updateSessionWithCredentialAndActivate
{
  NSObject *internalQueue;
  _QWORD block[5];

  kdebug_trace();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 25);
  *(_BYTE *)(v2 + 25) = 1;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = &stru_24CFF06D8;
      if (!v3)
        v7 = CFSTR(" (first activation)");
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: updating session%@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "contactlessSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "deferAuthorization");
  v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_94;
  v12[3] = &unk_24CFEA598;
  v14 = v3 ^ 1;
  v12[4] = v10;
  v13 = v8;
  v15 = v9;
  v11 = v8;
  objc_msgSend(v10, "_internalQueue_getContactlessAndAuthorizationValidityAndPerformWork:", v12);

}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD block[5];

  v6 = MEMORY[0x24BDAC760];
  if (!*(_BYTE *)(a1 + 48))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = v7;
    dispatch_async(v8, block);
  }
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_3;
  v13[3] = &unk_24CFEA570;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  v15 = v12;
  v16 = a2;
  v17 = a3;
  v18 = *(_BYTE *)(a1 + 49);
  dispatch_async(v10, v13);

}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "currentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentSession:willActivatePass:", v4, v5);

  }
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Confirm or renew quick payment session state is %u", buf, 8u);
    }

  }
  if ((unint64_t)(v2 - 1) <= 1)
    objc_msgSend(*(id *)(a1 + 40), "_checkContactlessValidity:authorizationValidity:performWork:");
}

void __65__NPKQuickPaymentSession__updateSessionWithCredentialAndActivate__block_invoke_97(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "contactlessSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activatedPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "_sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:", v5 != 0, *(unsigned __int8 *)(a1 + 48));

    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "currentPass");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:invokeOnSuccess:contactlessValidity:forPass:", v6, 1, v7, v9);

  }
}

- (void)deactivateSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *callbackQueue;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: deactivating session", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x2020000000;
  v19 = 0;
  -[NPKQuickPaymentSession internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke;
  block[3] = &unk_24CFEA488;
  v15 = buf;
  block[4] = self;
  v10 = v4;
  v14 = v10;
  dispatch_sync(v8, block);

  if (!v17[24])
  {
    callbackQueue = self->_callbackQueue;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke_2;
    v12[3] = &unk_24CFE7998;
    v12[4] = self;
    dispatch_async(callbackQueue, v12);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  char v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDeactivating") & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(*(id *)(a1 + 32), "isDeactivated");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateSessionWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__NPKQuickPaymentSession_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 1, 0, 1);
}

- (void)_internalQueue_deactivateSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKQuickPaymentSession internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v13 = -[NPKQuickPaymentSession isDeactivating](self, "isDeactivating");
      v14 = 1024;
      v15 = -[NPKQuickPaymentSession isDeactivated](self, "isDeactivated");
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Deactivate quick payment session: deactivating %d deactivated %d", buf, 0xEu);
    }

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke;
  v10[3] = &unk_24CFEA5C0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[NPKQuickPaymentSession _internalQueue_updateContactlessValidityAndPerformWork:](self, "_internalQueue_updateContactlessValidityAndPerformWork:", v10);

}

void __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "contactlessSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactlessSessionHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "deactivationCompletionBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setDeactivationCompletionBlocks:", v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "deactivationCompletionBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "addObject:", v7);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isDeactivating") & 1) == 0)
  {
    v8 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2;
    v18[3] = &unk_24CFE7E40;
    v18[4] = *(_QWORD *)(a1 + 32);
    v9 = v2;
    v19 = v9;
    v10 = (void *)MEMORY[0x2199B6780](v18);
    kdebug_trace();
    if (v9)
    {
      v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      v12 = v8;
      v13 = 3221225472;
      v14 = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2_101;
      v15 = &unk_24CFE7E90;
      v16 = v9;
      v17 = v10;
      dispatch_async(v11, &v12);

    }
    else
    {
      objc_msgSend(v3, "invalidateSessionWithCompletion:", v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "setContactlessSessionHandle:", 0, v12, v13, v14, v15);
    objc_msgSend(*(id *)(a1 + 32), "setContactlessSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setFieldDetector:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDeactivating:", 1);

  }
}

void __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  kdebug_trace();
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deactivate quick payment session: underlying session deactivated", buf, 2u);
    }

  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_100;
  v9[3] = &unk_24CFE7E40;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  dispatch_async(v6, v9);

}

uint64_t __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_100(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setDeactivating:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setDeactivated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "_internalQueue_invokeDeactivationCompletionBlocks");
}

uint64_t __73__NPKQuickPaymentSession__internalQueue_deactivateSessionWithCompletion___block_invoke_2_101(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateSessionWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_internalQueue_updateContactlessSessionForPass:(id)a3 vasPasses:(id)a4 deferAuthorization:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NPKQuickPaymentSession *v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_104);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Internal queue: updating contactless session for pass %@ auto-select VAS passes %@", buf, 0x16u);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_107;
  v17[3] = &unk_24CFEA658;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = a5;
  v15 = v9;
  v16 = v8;
  -[NPKQuickPaymentSession _internalQueue_updateContactlessValidityAndPerformWork:](self, "_internalQueue_updateContactlessValidityAndPerformWork:", v17);

}

id __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "passTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_107(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  objc_msgSend(*(id *)(a1 + 32), "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "npkPreferredContactlessPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_2;
  v10[3] = &unk_24CFEA630;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v6 + 64);
  v10[1] = 3221225472;
  v10[4] = v6;
  v14 = a2;
  v11 = v7;
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v15 = *(_BYTE *)(a1 + 56);
  v9 = v5;
  dispatch_async(v8, v10);

}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v2 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_3;
  v8[3] = &unk_24CFEA608;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v14 = *(_BYTE *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v13 = v7;
  objc_msgSend(v3, "_checkContactlessValidity:performWork:", v2, v8);

}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  void *v22;
  _BOOL8 v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD block[5];
  id v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "paymentPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    if (!v3
      || (objc_msgSend(*(id *)(a1 + 32), "paymentPass"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "contactlessActivationState"),
          v5,
          v3,
          !v6))
    {
      v8 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = *(NSObject **)(v7 + 80);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_4;
      block[3] = &unk_24CFE7E40;
      block[4] = v7;
      v30 = v8;
      dispatch_async(v9, block);

    }
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v10 + 72);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_5;
    v24[3] = &unk_24CFE8318;
    v24[4] = v10;
    v24[5] = &v25;
    dispatch_sync(v11, v24);
    v12 = objc_msgSend(*(id *)(a1 + 40), "_sessionQueue_updateContactlessSessionForPass:paymentApplication:vasPasses:sessionConfirmed:deferAuthorization:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *((unsigned __int8 *)v26 + 24), *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "contactlessSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activatedPaymentApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "contactlessSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activatedValueAddedServicePasses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "count") != 0;

    }
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *((unsigned __int8 *)v26 + 24);
        *(_DWORD *)buf = 67109632;
        v32 = v12;
        v33 = 1024;
        v34 = v15;
        v35 = 1024;
        v36 = v21;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Internal queue update contactless session: success %d now activated %d session confirmed %d", buf, 0x14u);
      }

      v22 = *(void **)(a1 + 40);
      if (!v15)
        goto LABEL_12;
    }
    else
    {
      v22 = *(void **)(a1 + 40);
      if (!v15)
      {
LABEL_12:
        v23 = 0;
LABEL_15:
        objc_msgSend(v22, "_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:invokeOnSuccess:contactlessValidity:forPass:", v12, v23, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
        _Block_object_dispose(&v25, 8);
        return;
      }
    }
    v23 = *((_BYTE *)v26 + 24) != 0;
    goto LABEL_15;
  }
}

void __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_4(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:willActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __102__NPKQuickPaymentSession__internalQueue_updateContactlessSessionForPass_vasPasses_deferAuthorization___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isConfirmed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_sessionQueue_updateContactlessSessionForPass:(id)a3 paymentApplication:(id)a4 vasPasses:(id)a5 sessionConfirmed:(BOOL)a6 deferAuthorization:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  int v38;
  void *v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _BOOL4 v47;
  id v48;
  _BOOL4 v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  _BYTE v55[10];
  void *v56;
  uint64_t v57;

  v7 = a7;
  v8 = a6;
  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  pk_Payment_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uniqueID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pk_arrayByApplyingBlock:", &__block_literal_global_108);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v18;
      v54 = 2112;
      *(_QWORD *)v55 = v19;
      *(_WORD *)&v55[8] = 2112;
      v56 = v20;
      _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Session queue update contactless session: pass %@ auto-select VAS passes %@ (session %@)", buf, 0x20u);

    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  objc_msgSend(v12, "paymentPass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    LOBYTE(v26) = 1;
    goto LABEL_38;
  }
  v23 = (void *)MEMORY[0x24BDBD1A8];
  if (v14)
    v23 = v14;
  v24 = v23;
  v47 = v7;
  if (!v12)
    goto LABEL_15;
  if (!v21)
  {
    objc_msgSend(v12, "nfcPayload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v51 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
      v28 = objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v24 = (id)v28;
      goto LABEL_16;
    }
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v21, "contactlessActivationState"))
    goto LABEL_15;
  v25 = v13;
LABEL_16:
  pk_Payment_log();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    pk_Payment_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "pk_arrayByApplyingBlock:", &__block_literal_global_111);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v32;
      _os_log_impl(&dword_213518000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Using VAS passes when updating contactless session: %@", buf, 0xCu);

    }
  }
  v48 = v12;
  v49 = v8;
  v50 = v14;
  v33 = v13;
  kdebug_trace();
  -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activatedValueAddedServicePasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = PKEqualObjects();

  v37 = v24;
  if ((v36 & 1) != 0)
    v38 = 1;
  else
    v38 = objc_msgSend(v34, "activateValueAddedServicePasses:", v24);
  if (v25)
    v39 = v21;
  else
    v39 = 0;
  v40 = objc_msgSend(v34, "activatePaymentApplication:forPaymentPass:", v25, v39);
  kdebug_trace();
  pk_Payment_log();
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

  if (v42)
  {
    pk_Payment_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v53 = v34;
      v54 = 1024;
      *(_DWORD *)v55 = v38;
      *(_WORD *)&v55[4] = 1024;
      *(_DWORD *)&v55[6] = v40;
      LOWORD(v56) = 1024;
      *(_DWORD *)((char *)&v56 + 2) = v49;
      _os_log_impl(&dword_213518000, v43, OS_LOG_TYPE_DEFAULT, "Notice: Session queue update contactless session::%@ VAS success %d payment success %d session confirmed %d", buf, 0x1Eu);
    }

  }
  v26 = v38 | v40;
  v13 = v33;
  if (v26 == 1)
  {
    v14 = v50;
    v44 = v37;
    v12 = v48;
    if (v49)
    {
      if (v25 || objc_msgSend(v44, "count"))
      {
        objc_msgSend(v34, "activatedPaymentApplication");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v26) = -[NPKQuickPaymentSession _sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:](self, "_sessionQueue_authorizeWithUseCredential:deferAuthorizationIfCredentialUsed:", v45 != 0, v47);

      }
      else
      {
        LOBYTE(v26) = 1;
      }
    }
  }
  else
  {
    v14 = v50;
    v44 = v37;
    v12 = v48;
  }

LABEL_38:
  return v26;
}

uint64_t __137__NPKQuickPaymentSession__sessionQueue_updateContactlessSessionForPass_paymentApplication_vasPasses_sessionConfirmed_deferAuthorization___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __137__NPKQuickPaymentSession__sessionQueue_updateContactlessSessionForPass_paymentApplication_vasPasses_sessionConfirmed_deferAuthorization___block_invoke_110(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

- (void)_sessionQueue_invokeAppropriateCallbackForActivationWithSuccess:(BOOL)a3 invokeOnSuccess:(BOOL)a4 contactlessValidity:(unint64_t)a5 forPass:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *callbackQueue;
  id v15;
  _QWORD v16[5];
  id v17;
  unint64_t v18;
  BOOL v19;
  BOOL v20;
  uint8_t buf[4];
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v7 = a4;
  v8 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      v22 = v8;
      v23 = 1024;
      v24 = v7;
      v25 = 1024;
      v26 = a5;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Invoking callback for activation: success %d invokeOnSuccess %d contactlessValidity %u pass %@", buf, 0x1Eu);
    }

  }
  callbackQueue = self->_callbackQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke;
  v16[3] = &unk_24CFEA6E8;
  v19 = v8;
  v20 = v7;
  v17 = v10;
  v18 = a5;
  v16[4] = self;
  v15 = v10;
  dispatch_async(callbackQueue, v16);

}

void __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke(uint64_t a1)
{
  char v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  v1 = *(_BYTE *)(a1 + 56);
  if (v1)
  {
    if (*(_BYTE *)(a1 + 57))
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke_2;
      v4[3] = &unk_24CFEA6C0;
      v7 = v1;
      v2 = *(void **)(a1 + 40);
      v3 = *(_QWORD *)(a1 + 48);
      v5 = *(id *)(a1 + 32);
      v6 = v2;
      objc_msgSend(v5, "_checkContactlessValidity:performWork:", v3, v4);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));
  }
}

void __134__NPKQuickPaymentSession__sessionQueue_invokeAppropriateCallbackForActivationWithSuccess_invokeOnSuccess_contactlessValidity_forPass___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  id v5;

  if (a2 && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentSession:didActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

- (BOOL)_sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  BOOL result;
  _QWORD v11[7];
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Starting contactless session on session queue", buf, 2u);
    }

  }
  v8 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__11;
  v12[4] = __Block_byref_object_dispose__11;
  v12[5] = 0;
  dispatch_group_enter(v8);
  dispatch_group_enter(v8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke;
  v11[3] = &unk_24CFEA710;
  v11[5] = buf;
  v11[6] = v12;
  v11[4] = v8;
  MEMORY[0x2199B6780](v11);
  dispatch_get_global_queue(33, 0);
  objc_claimAutoreleasedReturnValue();
  v9 = (char *)sub_2135E4E0C + 4 * byte_213772128[NPKQuickPaymentSessionTypeForPass(self->_currentPass)];
  __asm { BR              X9 }
  return result;
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_116(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionIsWaitingToStart:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContactlessSessionHandle:", *(_QWORD *)(a1 + 40));
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_119(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeactivating:", 1);
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_2_120(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v2, "setContactlessSession:");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
      if (!*(_BYTE *)(a1 + 65))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(NSObject **)(v3 + 80);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_3;
        block[3] = &unk_24CFE7998;
        block[4] = v3;
        dispatch_async(v4, block);
      }
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(void))(v5 + 16))();
    }
    else
    {
      objc_msgSend(v2, "_internalQueue_deactivateSessionWithCompletion:", 0);
    }
  }
  else
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: No contactless session; marking as deactivated (error: %@)",
          buf,
          0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setContactlessSession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setContactlessSessionHandle:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setFieldDetector:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDeactivating:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDeactivated:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    if (*(_BYTE *)(a1 + 64))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(NSObject **)(v10 + 80);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_123;
      v12[3] = &unk_24CFE7998;
      v12[4] = v10;
      dispatch_async(v11, v12);
    }
  }
}

void __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidStart:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __103__NPKQuickPaymentSession__sessionQueue_startContactlessSessionWithSuccessfulCompletionOnInternalQueue___block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, 1);
}

- (BOOL)_sessionQueue_enablePersistentCardEmulation
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  char v8;
  uint8_t v10[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_paymentSessionQueue);
  -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Enabling persistent card emulation", buf, 2u);
      }

    }
    -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject queuePersistentCardEmulation](v7, "queuePersistentCardEmulation");
  }
  else
  {
    if (!v5)
      return 1;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: No contactless session; not yet enabling persistent card emulation",
        v10,
        2u);
    }
    v8 = 1;
  }

  return v8;
}

- (BOOL)_sessionQueue_authorizeWithUseCredential:(BOOL)a3 deferAuthorizationIfCredentialUsed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSObject *internalQueue;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  _QWORD block[8];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a4;
  v5 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (a3)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__NPKQuickPaymentSession__sessionQueue_authorizeWithUseCredential_deferAuthorizationIfCredentialUsed___block_invoke;
    block[3] = &unk_24CFEA760;
    block[4] = self;
    block[5] = &v25;
    block[6] = v24;
    block[7] = &v20;
    v19 = a4;
    dispatch_sync(internalQueue, block);
    if (*((_BYTE *)v21 + 24))
    {
      if (!v26[5] && self->_sessionType == 1)
      {
        pk_Payment_log();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

        if (v9)
        {
          pk_Payment_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: No credential to activate: setting deferAuthorization to NO to present VAS pass", buf, 2u);
          }

        }
        v4 = 0;
      }
    }
  }
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v26[5];
      *(_DWORD *)buf = 67109634;
      v32 = v4;
      v33 = 1024;
      v34 = v5;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Authorizing deferred authorization: %d use credential: %d credential: %@", buf, 0x18u);
    }

  }
  kdebug_trace();
  -[NPKQuickPaymentSession contactlessSession](self, "contactlessSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "authorizeAndStartCardEmulationWithCredential:deferAuthorization:", v26[5], v4);

  kdebug_trace();
  -[NPKQuickPaymentSession _updateAuthorizationValidity](self, "_updateAuthorizationValidity");
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __102__NPKQuickPaymentSession__sessionQueue_authorizeWithUseCredential_deferAuthorizationIfCredentialUsed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") != 0;
  if (!*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = 0;

  }
}

- (void)_internalQueue_updateSessionWithCurrentPassAndLoyaltyState
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PKPass *currentPass;
  void *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: updating with current pass and loyalty state", v8, 2u);
    }

  }
  currentPass = self->_currentPass;
  -[NSDictionary allValues](self->_vasPasses, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKQuickPaymentSession _internalQueue_updateContactlessSessionForPass:vasPasses:deferAuthorization:](self, "_internalQueue_updateContactlessSessionForPass:vasPasses:deferAuthorization:", currentPass, v7, -[NPKQuickPaymentSession deferAuthorization](self, "deferAuthorization"));

}

- (void)_internalQueue_updateContactlessValidityAndPerformWork:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v4 = v5;
  ++self->_contactlessValidity;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)_updateAuthorizationValidity
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKQuickPaymentSession__updateAuthorizationValidity__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __54__NPKQuickPaymentSession__updateAuthorizationValidity__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)_internalQueue_getContactlessAndAuthorizationValidityAndPerformWork:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, unint64_t, unint64_t))v5 + 2))(v5, self->_contactlessValidity, self->_authorizationValidity);
    v4 = v5;
  }

}

- (void)_checkContactlessValidity:(unint64_t)a3 performWork:(id)a4
{
  void (**v6)(id, _QWORD);
  NSObject *internalQueue;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__NPKQuickPaymentSession__checkContactlessValidity_performWork___block_invoke;
    block[3] = &unk_24CFEA788;
    block[5] = &v9;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(internalQueue, block);
    v6[2](v6, *((unsigned __int8 *)v10 + 24));
    _Block_object_dispose(&v9, 8);
  }

}

_QWORD *__64__NPKQuickPaymentSession__checkContactlessValidity_performWork___block_invoke(_QWORD *result)
{
  if (result[6] == *(_QWORD *)(result[4] + 104))
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  return result;
}

- (void)_checkContactlessValidity:(unint64_t)a3 authorizationValidity:(unint64_t)a4 performWork:(id)a5
{
  void (**v8)(id, _QWORD);
  NSObject *internalQueue;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __86__NPKQuickPaymentSession__checkContactlessValidity_authorizationValidity_performWork___block_invoke;
    v10[3] = &unk_24CFEA7B0;
    v10[6] = a3;
    v10[7] = a4;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(internalQueue, v10);
    v8[2](v8, *((unsigned __int8 *)v12 + 24));
    _Block_object_dispose(&v11, 8);
  }

}

_QWORD *__86__NPKQuickPaymentSession__checkContactlessValidity_authorizationValidity_performWork___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (result[6] == *(_QWORD *)(v1 + 104) && result[7] == *(_QWORD *)(v1 + 112))
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  return result;
}

- (void)contactlessInterfaceSessionDidEnterField:(id)a3 withProperties:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *callbackQueue;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  __CFString *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD block[5];
  uint8_t buf[8];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did enter field", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  -[NPKQuickPaymentSession currentPass](self, "currentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "style") != 8)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F078], *MEMORY[0x24BE6F018]);
    v11 = v10;
    v12 = v9;
    v13 = v12;
    if (!v12 || !v11)
    {
LABEL_32:

      v36 = (void *)MEMORY[0x24BE6E9C8];
      v37 = *MEMORY[0x24BE6F178];
      v41[0] = *MEMORY[0x24BE6F158];
      v41[1] = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "subjects:sendEvent:", v38, v11);

      goto LABEL_33;
    }
    v14 = objc_msgSend(v12, "passType");
    v15 = (id *)MEMORY[0x24BE6F148];
    if ((unint64_t)(v14 + 1) >= 3)
      v16 = (__CFString *)(id)*MEMORY[0x24BE6F148];
    else
      v16 = off_24CFEA8D0[v14 + 1];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE6F118]);

    v17 = objc_msgSend(v13, "style");
    if (v17 < 0xD && ((0x13FFu >> v17) & 1) != 0)
      v18 = off_24CFEA8E8[v17];
    else
      v18 = (__CFString *)*v15;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE6F110]);

    objc_msgSend(v13, "nfcPayload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE6F0F8]);

    v21 = v13;
    if (objc_msgSend(v21, "passType") == 1)
    {
      objc_msgSend(v21, "secureElementPass");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "cardType");
      if (v23 <= 4)
        v20 = (__CFString *)**((id **)&unk_24CFEA950 + v23);

    }
    else
    {
      v20 = CFSTR("other");
    }

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE6F108]);
    objc_msgSend(v21, "secureElementPass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isIdentityPass"))
    {
      v25 = objc_msgSend(v24, "identityType");
      if ((unint64_t)(v25 - 1) < 3)
      {
        v26 = off_24CFEA978[v25 - 1];
        goto LABEL_27;
      }
    }
    else if (objc_msgSend(v24, "isAccessPass"))
    {
      v27 = objc_msgSend(v24, "accessType");
      if (v27 < 7)
      {
        v26 = off_24CFEA990[v27];
        goto LABEL_27;
      }
    }
    v26 = (__CFString *)*v15;
LABEL_27:

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE6F100]);
    objc_msgSend(v21, "secureElementPass");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "devicePaymentApplications");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE6EFE0]);
    objc_msgSend(v21, "secureElementPass");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *v15;
    objc_msgSend(v31, "organizationName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
    {
      v34 = objc_msgSend(v31, "cardType");
      if (v34 == 4 || v34 == 2)
      {
        v35 = v33;

        v32 = v35;
      }
    }

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE6F0C0]);
    goto LABEL_32;
  }
LABEL_33:

}

void __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidEnterField:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSessionDidExitField:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *callbackQueue;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD block[5];
  uint8_t buf[8];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did exit field", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidExitField___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  -[NPKQuickPaymentSession currentPass](self, "currentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "style") != 8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x24BE6F080], *MEMORY[0x24BE6F018]);
    v10 = v9;
    v11 = v8;
    v12 = v11;
    if (!v11 || !v10)
    {
LABEL_32:

      v35 = (void *)MEMORY[0x24BE6E9C8];
      v36 = *MEMORY[0x24BE6F178];
      v40[0] = *MEMORY[0x24BE6F158];
      v40[1] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "subjects:sendEvent:", v37, v10);

      goto LABEL_33;
    }
    v13 = objc_msgSend(v11, "passType");
    v14 = (id *)MEMORY[0x24BE6F148];
    if ((unint64_t)(v13 + 1) >= 3)
      v15 = (__CFString *)(id)*MEMORY[0x24BE6F148];
    else
      v15 = off_24CFEA8D0[v13 + 1];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE6F118]);

    v16 = objc_msgSend(v12, "style");
    if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0)
      v17 = off_24CFEA8E8[v16];
    else
      v17 = (__CFString *)*v14;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE6F110]);

    objc_msgSend(v12, "nfcPayload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE6F0F8]);

    v20 = v12;
    if (objc_msgSend(v20, "passType") == 1)
    {
      objc_msgSend(v20, "secureElementPass");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "cardType");
      if (v22 <= 4)
        v19 = (__CFString *)**((id **)&unk_24CFEA950 + v22);

    }
    else
    {
      v19 = CFSTR("other");
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE6F108]);
    objc_msgSend(v20, "secureElementPass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isIdentityPass"))
    {
      v24 = objc_msgSend(v23, "identityType");
      if ((unint64_t)(v24 - 1) < 3)
      {
        v25 = off_24CFEA978[v24 - 1];
        goto LABEL_27;
      }
    }
    else if (objc_msgSend(v23, "isAccessPass"))
    {
      v26 = objc_msgSend(v23, "accessType");
      if (v26 < 7)
      {
        v25 = off_24CFEA990[v26];
        goto LABEL_27;
      }
    }
    v25 = (__CFString *)*v14;
LABEL_27:

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE6F100]);
    objc_msgSend(v20, "secureElementPass");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "devicePaymentApplications");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE6EFE0]);
    objc_msgSend(v20, "secureElementPass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *v14;
    objc_msgSend(v30, "organizationName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
    {
      v33 = objc_msgSend(v30, "cardType");
      if (v33 == 4 || v33 == 2)
      {
        v34 = v32;

        v31 = v34;
      }
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE6F0C0]);
    goto LABEL_32;
  }
LABEL_33:

}

void __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidExitField___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidExitField:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSessionDidFailTransaction:(id)a3 forPaymentApplication:(id)a4 paymentPass:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "applicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did fail transaction for AID %@ and pass with unique ID %@", buf, 0x16u);

    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

uint64_t __106__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailTransaction_forPaymentApplication_paymentPass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));
}

- (void)contactlessInterfaceSessionDidTimeout:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "pk_createArrayByApplyingBlock:", &__block_literal_global_131);
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Session timed out for AID(s) %@ and pass with unique ID %@", buf, 0x16u);

    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_132;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);

}

uint64_t __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationIdentifier");
}

void __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_132(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 22))
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring timeout for service mode (should get persistent card emulation event instead)", buf, 2u);
      }

    }
  }
  else
  {
    v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_133;
    block[3] = &unk_24CFE7998;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

uint64_t __123__NPKQuickPaymentSession_contactlessInterfaceSessionDidTimeout_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 2, 0, objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));
}

- (void)contactlessInterfaceSessionDidFail:(id)a3 forPaymentApplications:(id)a4 paymentPass:(id)a5 valueAddedServicePasses:(id)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "pk_createArrayByApplyingBlock:", &__block_literal_global_134);
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Session failed for AID(s) %@ and pass with unique ID %@", buf, 0x16u);

    }
  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_135;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

uint64_t __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationIdentifier");
}

uint64_t __120__NPKQuickPaymentSession_contactlessInterfaceSessionDidFail_forPaymentApplications_paymentPass_valueAddedServicePasses___block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, 1);
}

- (void)contactlessInterfaceSessionDidStartTransaction:(id)a3 withContext:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received Start Transaction", buf, 2u);
    }

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 22))
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In service mode; ignoring Start Transaction",
          buf,
          2u);
      }

    }
  }
  else
  {
    v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke_136;
    block[3] = &unk_24CFE7998;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

void __85__NPKQuickPaymentSession_contactlessInterfaceSessionDidStartTransaction_withContext___block_invoke_136(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidReceiveStartTransaction:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *callbackQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: did received ISO18013 Requests %@", buf, 0xCu);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__NPKQuickPaymentSession_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  dispatch_async(callbackQueue, block);

}

void __92__NPKQuickPaymentSession_contactlessInterfaceSession_didReceive18013Request_readerAuthInfo___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 48));
    objc_msgSend(v4, "paymentSession:didReceive18013Request:readerAuthInfo:", a1[4], a1[5], a1[6]);

  }
}

- (void)contactlessInterfaceSessionDidReceiveActivityTimeout:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received activity timeout", buf, 2u);
    }

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 22))
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In service mode; ignoring activity timeout",
          buf,
          2u);
      }

    }
  }
  else
  {
    v5 = *(NSObject **)(v1 + 80);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke_141;
    block[3] = &unk_24CFE7998;
    block[4] = v1;
    dispatch_async(v5, block);
  }
}

void __79__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveActivityTimeout___block_invoke_141(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidReceiveActivityTimeout:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Received Finish Transaction", (uint8_t *)&v23, 2u);
    }

  }
  objc_msgSend(v5, "transitHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "transaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        pk_Payment_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v16 = "Notice: Handling truth-on-card transit transaction";
          goto LABEL_19;
        }
LABEL_20:

      }
LABEL_21:
      -[NPKQuickPaymentSession _handleTransactionCompleteWithContext:](self, "_handleTransactionCompleteWithContext:", v5, v23);
      goto LABEL_22;
    }
  }
  objc_msgSend(v5, "paymentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isTransitPass");

  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v16 = "Notice: Handling transit transaction";
LABEL_19:
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v14)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Handling conventional transaction", (uint8_t *)&v23, 2u);
    }

  }
  -[NPKQuickPaymentSession _handleConventionalTransactionWithContext:](self, "_handleConventionalTransactionWithContext:", v5);
LABEL_22:
  v20 = (void *)MEMORY[0x24BE6E9C8];
  v21 = *MEMORY[0x24BE6F158];
  v24 = *MEMORY[0x24BE6F0D0];
  v25[0] = *MEMORY[0x24BE6F0D8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subject:sendEvent:", v21, v22);

}

- (void)contactlessInterfaceSessionDidReceiveUntrustedTerminal:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *callbackQueue;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidReceiveUntrustedTerminal:%@", buf, 0xCu);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
  v9 = (void *)MEMORY[0x24BE6E9C8];
  v10 = *MEMORY[0x24BE6F158];
  v18[0] = *MEMORY[0x24BE6F178];
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE6F000];
  v16[0] = *MEMORY[0x24BE6F018];
  v16[1] = v12;
  v13 = *MEMORY[0x24BE6F010];
  v17[0] = *MEMORY[0x24BE6F098];
  v17[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subjects:sendEvent:", v11, v14);

}

uint64_t __81__NPKQuickPaymentSession_contactlessInterfaceSessionDidReceiveUntrustedTerminal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 10, 0, 1);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *callbackQueue;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidTerminate:%@ with error code:%lu", buf, 0x16u);
    }

  }
  callbackQueue = self->_callbackQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke;
  v11[3] = &unk_24CFE8238;
  v11[4] = self;
  v11[5] = a4;
  dispatch_async(callbackQueue, v11);

}

uint64_t __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate_withErrorCode___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(v3 + 8);
  v4 = 5;
  if (v2 == 2)
    v4 = 9;
  if (v2 == 1)
    v5 = 8;
  else
    v5 = v4;
  return objc_msgSend(v1, "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", v5, 0, 1);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: contactlessInterfaceSessionDidTerminate:%@", buf, 0xCu);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

uint64_t __66__NPKQuickPaymentSession_contactlessInterfaceSessionDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 5, 0, 1);
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: ended persistent card emulation", v12, 2u);
    }

  }
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKQuickPaymentSession contactlessInterfaceSession:didFinishTransactionWithContext:](self, "contactlessInterfaceSession:didFinishTransactionWithContext:", v7, v11);

}

- (void)contactlessInterfaceSessionDidSelectPayment:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: selected payment", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectPayment___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __70__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectPayment___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidSelectPayment:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSessionDidSelectValueAddedService:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: selected VAS", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectValueAddedService___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __80__NPKQuickPaymentSession_contactlessInterfaceSessionDidSelectValueAddedService___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidSelectValueAddedService:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactlessInterfaceSessionDidFailDeferredAuthorization:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: failed deferred authorization", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __82__NPKQuickPaymentSession_contactlessInterfaceSessionDidFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 4, 0, 1);
}

- (void)contactlessInterfaceSessionHasPendingServerRequest:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: has pending server request, sending timeout event", buf, 2u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__NPKQuickPaymentSession_contactlessInterfaceSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

uint64_t __77__NPKQuickPaymentSession_contactlessInterfaceSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 2, 0, 1);
}

- (void)_handleTransactionCompleteWithContext:(id)a3
{
  id v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__NPKQuickPaymentSession__handleTransactionCompleteWithContext___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

uint64_t __64__NPKQuickPaymentSession__handleTransactionCompleteWithContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callbackQueue_invokeDidCompleteForReason:withTransactionContext:shouldCleanupSession:", 3, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));
}

- (void)_handleConventionalTransactionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *callbackQueue;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD v23[5];
  _BYTE buf[24];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "paymentApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueAddedServicePasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueAddedServiceTransactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "applicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v7;
      v30 = 1024;
      v31 = objc_msgSend(v4, "success");
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Transaction: %@ AID: %@ UniqueID: %@ valueAddedServiceTransactions: %@ valueAddedServicePasses: %@ success: %u", buf, 0x3Au);

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = MEMORY[0x24BDAC760];
  LOBYTE(v25) = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke;
  v23[3] = &unk_24CFE9A90;
  v23[4] = buf;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v23);
  objc_msgSend(v4, "paymentPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isAccessPass"))
    v16 = objc_msgSend(v4, "success");
  else
    v16 = 0;

  if (v6 || (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) ? (v17 = 1) : (v17 = v16), v17 == 1))
  {
    kdebug_trace();
    -[NPKQuickPaymentSession _handleTransactionCompleteWithContext:](self, "_handleTransactionCompleteWithContext:", v4);
  }
  else
  {
    kdebug_trace();
    callbackQueue = self->_callbackQueue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke_2;
    block[3] = &unk_24CFE8288;
    block[4] = self;
    v21 = v8;
    v22 = v7;
    dispatch_async(callbackQueue, block);

  }
  _Block_object_dispose(buf, 8);

}

uint64_t __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "didSucceed");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

void __68__NPKQuickPaymentSession__handleConventionalTransactionWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "currentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentSession:didFailTransactionForPass:withValueAddedServiceTransactions:forValueAddedServicePasses:", v4, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_loyaltyEngineConfigurationChanged:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__NPKQuickPaymentSession__loyaltyEngineConfigurationChanged___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __61__NPKQuickPaymentSession__loyaltyEngineConfigurationChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Quick payment session: Loyalty engine configuration changed", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateSessionWithCurrentPassAndLoyaltyState");
}

- (void)_callbackQueue_invokeDidCompleteForReason:(unint64_t)a3 withTransactionContext:(id)a4 shouldCleanupSession:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  if (a3 - 1 <= 9 && ((0x39Fu >> (a3 - 1)) & 1) != 0)
    kdebug_trace();
  if (!-[NPKQuickPaymentSession _invokeStateUpdateForReason:shouldCleanupSession:](self, "_invokeStateUpdateForReason:shouldCleanupSession:", a3, v5))
  {
    -[NPKQuickPaymentSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[NPKQuickPaymentSession delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paymentSession:didCompleteTransactionForReason:withTransactionContext:shouldCleanupSession:", self, a3, v11, v5);

    }
  }

}

- (BOOL)_invokeStateUpdateForReason:(unint64_t)a3 shouldCleanupSession:(BOOL)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  if (a4)
    return 0;
  switch(a3)
  {
    case 2uLL:
      -[NPKQuickPaymentSession delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[NPKQuickPaymentSession delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "paymentSessionDidReceiveAuthorizationTimeout:", self);
        goto LABEL_12;
      }
      break;
    case 4uLL:
      -[NPKQuickPaymentSession delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[NPKQuickPaymentSession delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "paymentSessionDidReceiveActivationError:", self);
        goto LABEL_12;
      }
      break;
    case 5uLL:
      -[NPKQuickPaymentSession delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[NPKQuickPaymentSession delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "paymentSessionDidReceiveTransactionError:", self);
LABEL_12:

        return 1;
      }
      break;
  }
  return 0;
}

- (void)_internalQueue_invokeDeactivationCompletionBlocks
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKQuickPaymentSession deactivationCompletionBlocks](self, "deactivationCompletionBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__NPKQuickPaymentSession__internalQueue_invokeDeactivationCompletionBlocks__block_invoke;
  v5[3] = &unk_24CFEA838;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  -[NPKQuickPaymentSession deactivationCompletionBlocks](self, "deactivationCompletionBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

void __75__NPKQuickPaymentSession__internalQueue_invokeDeactivationCompletionBlocks__block_invoke(uint64_t a1, void *a2)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 80), a2);
}

- (NPKQuickPaymentSessionDelegate)delegate
{
  return (NPKQuickPaymentSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (BOOL)requireFirstInQueue
{
  return self->_requireFirstInQueue;
}

- (void)setRequireFirstInQueue:(BOOL)a3
{
  self->_requireFirstInQueue = a3;
}

- (BOOL)inServiceMode
{
  return self->_inServiceMode;
}

- (BOOL)endSessionWhenAuthorizationIsConsumed
{
  return self->_endSessionWhenAuthorizationIsConsumed;
}

- (void)setEndSessionWhenAuthorizationIsConsumed:(BOOL)a3
{
  self->_endSessionWhenAuthorizationIsConsumed = a3;
}

- (OS_dispatch_queue)paymentSessionQueue
{
  return self->_paymentSessionQueue;
}

- (void)setPaymentSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSessionQueue, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (PKPaymentSessionHandle)contactlessSessionHandle
{
  return self->_contactlessSessionHandle;
}

- (void)setContactlessSessionHandle:(id)a3
{
  objc_storeStrong((id *)&self->_contactlessSessionHandle, a3);
}

- (PKContactlessInterfaceSession)contactlessSession
{
  return self->_contactlessSession;
}

- (void)setContactlessSession:(id)a3
{
  objc_storeStrong((id *)&self->_contactlessSession, a3);
}

- (unint64_t)contactlessValidity
{
  return self->_contactlessValidity;
}

- (void)setContactlessValidity:(unint64_t)a3
{
  self->_contactlessValidity = a3;
}

- (unint64_t)authorizationValidity
{
  return self->_authorizationValidity;
}

- (void)setAuthorizationValidity:(unint64_t)a3
{
  self->_authorizationValidity = a3;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)hasPerformedFirstActivation
{
  return self->_performedFirstActivation;
}

- (void)setPerformedFirstActivation:(BOOL)a3
{
  self->_performedFirstActivation = a3;
}

- (BOOL)isDeactivating
{
  return self->_deactivating;
}

- (void)setDeactivating:(BOOL)a3
{
  self->_deactivating = a3;
}

- (BOOL)isDeactivated
{
  return self->_deactivated;
}

- (void)setDeactivated:(BOOL)a3
{
  self->_deactivated = a3;
}

- (NSMutableArray)deactivationCompletionBlocks
{
  return self->_deactivationCompletionBlocks;
}

- (void)setDeactivationCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_deactivationCompletionBlocks, a3);
}

- (PKFieldDetector)fieldDetector
{
  return self->_fieldDetector;
}

- (void)setFieldDetector:(id)a3
{
  objc_storeStrong((id *)&self->_fieldDetector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetector, 0);
  objc_storeStrong((id *)&self->_deactivationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_contactlessSession, 0);
  objc_storeStrong((id *)&self->_contactlessSessionHandle, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_paymentSessionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vasPasses, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
