@implementation NPKQuickPaymentSessionSource

- (NPKQuickPaymentSessionSource)initWithDelegate:(id)a3 buttonListener:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPKQuickPaymentSessionSource *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *callbackQueue;
  NSObject *v14;
  OS_dispatch_queue *sessionSourceQueue;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKQuickPaymentSessionSource;
  v11 = -[NPKQuickPaymentSessionSource init](&v20, sel_init);
  if (v11)
  {
    if (v10)
    {
      v12 = (OS_dispatch_queue *)v10;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callbackQueue = v11->_callbackQueue;
    v11->_callbackQueue = v12;

    v14 = NPKElevatedPriorityDispatchQueueCreate("NPKQuickPaymentSessionSource", 0);
    sessionSourceQueue = v11->_sessionSourceQueue;
    v11->_sessionSourceQueue = (OS_dispatch_queue *)v14;

    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_initWeak(&location, v11);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke;
    v17[3] = &unk_24CFE8A00;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "setButtonHandler:", v17);
    objc_storeStrong((id *)&v11->_buttonListener, a4);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke_2;
    v6[3] = &unk_24CFE8238;
    v7 = WeakRetained;
    v8 = a2;
    dispatch_async(v5, v6);

  }
}

uint64_t __78__NPKQuickPaymentSessionSource_initWithDelegate_buttonListener_callbackQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthIntentEventFromSource:", *(_QWORD *)(a1 + 40));
}

- (void)setDelegateHandlingButtonEvents:(BOOL)a3
{
  NSObject *sessionSourceQueue;
  _QWORD v4[5];
  BOOL v5;

  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__NPKQuickPaymentSessionSource_setDelegateHandlingButtonEvents___block_invoke;
  v4[3] = &unk_24CFE7D78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __64__NPKQuickPaymentSessionSource_setDelegateHandlingButtonEvents___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setDeferAuthorization:(BOOL)a3
{
  NSObject *sessionSourceQueue;
  _QWORD v4[5];
  BOOL v5;

  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__NPKQuickPaymentSessionSource_setDeferAuthorization___block_invoke;
  v4[3] = &unk_24CFE7D78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __54__NPKQuickPaymentSessionSource_setDeferAuthorization___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRequireFirstInQueue:(BOOL)a3
{
  NSObject *sessionSourceQueue;
  _QWORD v4[5];
  BOOL v5;

  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__NPKQuickPaymentSessionSource_setRequireFirstInQueue___block_invoke;
  v4[3] = &unk_24CFE7D78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __55__NPKQuickPaymentSessionSource_setRequireFirstInQueue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 42) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setPreconditionState:(unint64_t)a3
{
  NSObject *sessionSourceQueue;
  _QWORD v4[6];

  sessionSourceQueue = self->_sessionSourceQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__NPKQuickPaymentSessionSource_setPreconditionState___block_invoke;
  v4[3] = &unk_24CFE8238;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(sessionSourceQueue, v4);
}

uint64_t __53__NPKQuickPaymentSessionSource_setPreconditionState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setInitialPass:(id)a3
{
  id v4;
  NSObject *sessionSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__NPKQuickPaymentSessionSource_setInitialPass___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionSourceQueue, v7);

}

void __47__NPKQuickPaymentSessionSource_setInitialPass___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)setVasPasses:(id)a3
{
  id v4;
  NSObject *sessionSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__NPKQuickPaymentSessionSource_setVasPasses___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionSourceQueue, v7);

}

void __45__NPKQuickPaymentSessionSource_setVasPasses___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (void)setLocalAuthenticationCoordinator:(id)a3
{
  id v4;
  NSObject *sessionSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionSourceQueue = self->_sessionSourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__NPKQuickPaymentSessionSource_setLocalAuthenticationCoordinator___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionSourceQueue, v7);

}

void __66__NPKQuickPaymentSessionSource_setLocalAuthenticationCoordinator___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (void)_handleAuthIntentEventFromSource:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  _BOOL4 v11;
  unint64_t preconditionState;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const __CFString *v16;
  id WeakRetained;
  int v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  NSObject *v37;
  _BOOL4 v38;
  _BOOL4 v39;
  NPKQuickPaymentSessionLocalAuthenticationCoordinator *localAuthenticationCoordinator;
  NSObject *v41;
  int v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  NPKQuickPaymentSessionSource *v54;
  unint64_t v55;
  _QWORD v56[5];
  NSObject *v57;
  id v58;
  unint64_t v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  id v63;
  unint64_t v64;
  _QWORD v65[5];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  _BOOL4 v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (!v11)
      goto LABEL_11;
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v9 = "Notice: Session source received an assistive touch gesture event";
    goto LABEL_9;
  }
  if (!a3)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      v9 = "Notice: Session source received PMU button event";
LABEL_9:
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_10;
    }
  }
LABEL_11:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionSourceQueue);
  preconditionState = self->_preconditionState;
  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (preconditionState - 1 > 7)
        v16 = CFSTR("Proceed");
      else
        v16 = off_24CFE8A48[preconditionState - 1];
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v16;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Session source initial precondition state is %@", buf, 0xCu);
    }

  }
  if (preconditionState == 6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_msgSend(WeakRetained, "paymentSessionSourceIsWalletInstalledRequiredToStartPaymentSession:", self);

    if (v18)
    {
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke;
      v65[3] = &unk_24CFE7998;
      v65[4] = self;
      v19 = v65;
LABEL_74:
      -[NPKQuickPaymentSessionSource _performDelegateCallback:](self, "_performDelegateCallback:", v19, v50, v51, v52, v53, v54, v55);
      goto LABEL_75;
    }
  }
  v20 = NPKIsAssistiveTouchEnabled();
  v21 = v20;
  if (!self->_delegateHandlingButtonEvents)
  {
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      pk_Payment_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Session source is NOT delegating auth intent event", buf, 2u);
      }

    }
    if (v21 != a3)
    {
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_54;
      v60[3] = &unk_24CFE7998;
      v60[4] = self;
      v19 = v60;
      goto LABEL_74;
    }
    if (+[NPKQuickPaymentSession hasOutstandingSessions](NPKQuickPaymentSession, "hasOutstandingSessions"))
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (!v29)
        goto LABEL_75;
      pk_Payment_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v31 = "Notice: Outstanding payment sessions; ignoring";
        v32 = v30;
        v33 = 2;
LABEL_48:
        _os_log_impl(&dword_213518000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
LABEL_49:

      goto LABEL_75;
    }
    if (!preconditionState)
    {
      if (self->_initialPass)
      {
        localAuthenticationCoordinator = self->_localAuthenticationCoordinator;
        if (localAuthenticationCoordinator)
          -[NPKQuickPaymentSessionLocalAuthenticationCoordinator beginLocalAuthenticationWithCompletion:](localAuthenticationCoordinator, "beginLocalAuthenticationWithCompletion:", 0);
        +[NPKQuickPaymentSession sessionWithQueue:](NPKQuickPaymentSession, "sessionWithQueue:", MEMORY[0x24BDAC9B8]);
        v41 = objc_claimAutoreleasedReturnValue();
        -[NSObject setCurrentPass:](v41, "setCurrentPass:", self->_initialPass);
        -[NSObject setVasPasses:](v41, "setVasPasses:", self->_vasPasses);
        -[NSObject setRequireFirstInQueue:](v41, "setRequireFirstInQueue:", self->_requireFirstInQueue);
        if (self->_deferAuthorization)
          -[NSObject setDeferAuthorization:](v41, "setDeferAuthorization:", 1);
        v42 = -[NSObject startSession](v41, "startSession");
        pk_Payment_log();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

        if (v42)
        {
          if (v44)
          {
            pk_Payment_log();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_213518000, v45, OS_LOG_TYPE_DEFAULT, "Notice: Session source providing session to delegate", buf, 2u);
            }

          }
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_56;
          v56[3] = &unk_24CFE8A28;
          v56[4] = self;
          v57 = v41;
          v58 = v5;
          v59 = a3;
          v46 = v41;
          -[NPKQuickPaymentSessionSource _performDelegateCallback:](self, "_performDelegateCallback:", v56);

          goto LABEL_75;
        }
        if (v44)
        {
          pk_Payment_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v49, OS_LOG_TYPE_DEFAULT, "Notice: Payment session failed to start; session source reporting busy",
              buf,
              2u);
          }

        }
        -[NPKQuickPaymentSessionLocalAuthenticationCoordinator invalidateLocalAuthenticationContexts](self->_localAuthenticationCoordinator, "invalidateLocalAuthenticationContexts");
        preconditionState = 7;
      }
      else
      {
        pk_Payment_log();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

        if (!v48)
        {
          preconditionState = 3;
          goto LABEL_73;
        }
        pk_Payment_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v41, OS_LOG_TYPE_DEFAULT, "Notice: No initial pass; session source reporting no cards",
            buf,
            2u);
        }
        preconditionState = 3;
      }

    }
LABEL_73:
    v50 = MEMORY[0x24BDAC760];
    v51 = 3221225472;
    v52 = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_57;
    v53 = &unk_24CFE8238;
    v54 = self;
    v55 = preconditionState;
    v19 = &v50;
    goto LABEL_74;
  }
  if (v20 == a3)
  {
    pk_Payment_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Session source is delegating auth intent event", buf, 2u);
      }

    }
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_52;
    v62[3] = &unk_24CFE83A8;
    v62[4] = self;
    v63 = v5;
    v64 = a3;
    -[NPKQuickPaymentSessionSource _performDelegateCallback:](self, "_performDelegateCallback:", v62);

    goto LABEL_75;
  }
  if (a3 == 1)
  {
    pk_Payment_log();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

    if (!v38)
      goto LABEL_75;
    pk_Payment_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v39 = NPKIsAssistiveTouchEnabled();
      *(_DWORD *)buf = 134218240;
      v67 = 1;
      v68 = 1024;
      v69 = v39;
      v31 = "Warning: Received unexpected auth intent source: %lu, is double click disabled: %i";
      v32 = v30;
      v33 = 18;
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  if (!a3)
  {
    pk_Payment_log();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      pk_Payment_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Session source is requesting AssistiveTouch enabled alert presentation", buf, 2u);
      }

    }
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_53;
    v61[3] = &unk_24CFE7998;
    v61[4] = self;
    v19 = v61;
    goto LABEL_74;
  }
LABEL_75:

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
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
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@ Declining to handle button event. Wallet is not installed", (uint8_t *)&v7, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "paymentSessionSource:declinedToStartPaymentSessionDueToPreconditionState:", *(_QWORD *)(a1 + 32), 6);

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_52(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "paymentSessionSource:receivedDelegatedButtonEventAtDate:authIntentSource:", a1[4], a1[5], a1[6]);

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_53(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "paymentSessionSourceRequestsAssistiveTouchAlertPresentation:", *(_QWORD *)(a1 + 32));

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "paymentSessionSourceRequestsAssistiveTouchAlertPresentation:", *(_QWORD *)(a1 + 32));

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_56(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "paymentSessionSource:startedPaymentSession:dueToButtonEventAtDate:authIntentSource:", a1[4], a1[5], a1[6], a1[7]);

}

void __65__NPKQuickPaymentSessionSource__handleAuthIntentEventFromSource___block_invoke_57(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "paymentSessionSource:declinedToStartPaymentSessionDueToPreconditionState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_vasPasses, 0);
  objc_storeStrong((id *)&self->_initialPass, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionSourceQueue, 0);
  objc_storeStrong((id *)&self->_buttonListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
