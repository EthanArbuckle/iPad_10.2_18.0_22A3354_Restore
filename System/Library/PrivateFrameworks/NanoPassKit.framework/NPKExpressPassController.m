@implementation NPKExpressPassController

- (NPKExpressPassController)initWithPaymentService:(id)a3 passLibrary:(id)a4 distributedNotificationCenter:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NPKExpressPassController *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *internalQueue;
  const char *v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)NPKExpressPassController;
  v14 = -[NPKExpressPassController init](&v27, sel_init);
  if (v14)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.expressPassController.internalQueue", v15);
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v16;

    v14->_transactionStatus = 0;
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeWeak((id *)&v14->_distributedNotificationCenter, v12);
    objc_storeWeak((id *)&v14->_passLibrary, v11);
    objc_storeWeak((id *)&v14->_paymentService, v10);
    v14->_expressPassChangedNotifyToken = -1;
    objc_initWeak(&location, v14);
    v18 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6F268], "UTF8String");
    v19 = v14->_internalQueue;
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __102__NPKExpressPassController_initWithPaymentService_passLibrary_distributedNotificationCenter_delegate___block_invoke;
    v24 = &unk_24CFE78F0;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch(v18, &v14->_expressPassChangedNotifyToken, v19, &v21);
    -[NPKExpressPassController updateExpressPasses](v14, "updateExpressPasses", v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v14;
}

void __102__NPKExpressPassController_initWithPaymentService_passLibrary_distributedNotificationCenter_delegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Got express passes changed notification in express pass controller", v6, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_internalQueue_updateExpressPasses");

}

- (NPKExpressPassController)initWithDelegate:(id)a3
{
  return -[NPKExpressPassController initWithPaymentService:passLibrary:distributedNotificationCenter:delegate:](self, "initWithPaymentService:passLibrary:distributedNotificationCenter:delegate:", 0, 0, 0, a3);
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_expressPassChangedNotifyToken))
    notify_cancel(self->_expressPassChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)NPKExpressPassController;
  -[NPKExpressPassController dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__NPKExpressPassController_reset__block_invoke;
  v2[3] = &unk_24CFE7998;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

uint64_t __33__NPKExpressPassController_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 0, 0, 0);
}

- (id)paymentService
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentService);
  if (!WeakRetained)
    WeakRetained = objc_alloc_init(MEMORY[0x24BE6ED30]);
  return WeakRetained;
}

- (PKPassLibrary)passLibrary
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passLibrary);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PKPassLibrary *)WeakRetained;
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  NSDistributedNotificationCenter **p_distributedNotificationCenter;
  void *WeakRetained;

  p_distributedNotificationCenter = &self->_distributedNotificationCenter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_distributedNotificationCenter);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_distributedNotificationCenter, WeakRetained);
  }
  return (NSDistributedNotificationCenter *)WeakRetained;
}

- (void)_transitionToStatus:(unint64_t)a3 forExpressPass:(id)a4 paymentApplicationIdentifier:(id)a5
{
  id v9;
  id v10;
  unint64_t transactionStatus;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  NPKExpressPassController *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  NPKExpressPassController *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  transactionStatus = self->_transactionStatus;
  if (transactionStatus == a3)
    goto LABEL_33;
  if (v9 && self->_currentTransactionPass)
  {
    objc_msgSend(v9, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass uniqueID](self->_currentTransactionPass, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v14)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        pk_Payment_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[PKPass uniqueID](self->_currentTransactionPass, "uniqueID");
          v23 = (NPKExpressPassController *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uniqueID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v23;
          v35 = 2112;
          v36 = v24;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Warning: Accepting new express status because express transit pass changed from %@ to %@.", (uint8_t *)&v33, 0x16u);

        }
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    transactionStatus = self->_transactionStatus;
  }
  if (transactionStatus >= a3)
  {
    if (a3)
      goto LABEL_33;
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20)
      goto LABEL_19;
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v33) = 0;
    v18 = "Notice: Accepting reset of express status.";
    goto LABEL_14;
  }
  pk_Payment_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      goto LABEL_19;
    }
    LOWORD(v33) = 0;
    v18 = "Notice: Accepting new express status because it is greater than the previous express status.";
LABEL_14:
    _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v33, 2u);
    goto LABEL_18;
  }
LABEL_19:
  pk_General_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    pk_General_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      npk_stringWithExpressPassControllerStatus(self->_transactionStatus);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      npk_stringWithExpressPassControllerStatus(a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      v34 = self;
      v35 = 2112;
      v36 = v28;
      v37 = 2112;
      v38 = v29;
      _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: %@ transition from status %@ to %@", (uint8_t *)&v33, 0x20u);

    }
  }
  self->_transactionStatus = a3;
  objc_storeStrong((id *)&self->_currentTransactionPass, a4);
  -[NPKExpressPassController delegate](self, "delegate");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v9 && v30)
  {
    -[NPKExpressPassController _queue_siblingExpressPassesForExpressPass:applicationIdentifier:](self, "_queue_siblingExpressPassesForExpressPass:applicationIdentifier:", v9, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a3)
    {
      case 4uLL:
        objc_msgSend(v31, "expressPassController:didCompleteTransactionForPass:", self, v9);
        break;
      case 3uLL:
        objc_msgSend(v31, "expressPassController:didFailTransactionForPass:", self, v9);
        break;
      case 2uLL:
        objc_msgSend(v31, "expressPassController:didStartTransactionForPass:paymentApplicationIdentifier:siblingExpressPasses:", self, v9, v10, v32);
        break;
    }

  }
LABEL_33:

}

- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[NPKExpressPassController _canProceedWithTransactionForPass:selector:](self, "_canProceedWithTransactionForPass:selector:", v7, sel__transitionToStandaloneTransactionEvent_forExpressPass_))
  {
    -[NPKExpressPassController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v6)
      objc_msgSend(v6, "expressPassController:didCompleteStandaloneTransactionEvent:forPass:", self, a3, v7);

  }
}

- (void)_transitionToCompletedRKEAction:(id)a3 function:(id)a4 forExpressPass:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[NPKExpressPassController _canProceedWithTransactionForPass:selector:](self, "_canProceedWithTransactionForPass:selector:", v9, sel__transitionToCompletedRKEAction_function_forExpressPass_))
  {
    -[NPKExpressPassController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 && v10)
      objc_msgSend(v10, "expressPassController:didCompleteRKEAction:function:forPass:", self, v12, v8, v9);

  }
}

- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4 withExpressUWBInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[NPKExpressPassController _canProceedWithTransactionForPass:selector:](self, "_canProceedWithTransactionForPass:selector:", v11, sel__transitionToStandaloneTransactionEvent_forExpressPass_withExpressUWBInfo_))
  {
    -[NPKExpressPassController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && v9)
    {
      -[NPKExpressPassController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "expressPassController:didCompleteStandaloneTransactionEvent:forPass:withUWBTransactionInfo:", self, a3, v11, v8);

    }
  }

}

- (BOOL)_canProceedWithTransactionForPass:(id)a3 selector:(SEL)a4
{
  id v6;
  unint64_t transactionStatus;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  transactionStatus = self->_transactionStatus;
  if (transactionStatus)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        npk_stringWithExpressPassControllerStatus(self->_transactionStatus);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %@: We're in the middle of some other transaction (transactionStatus: %@). Suppressing event for pass %@.", (uint8_t *)&v15, 0x20u);

      }
    }
  }

  return transactionStatus == 0;
}

- (void)_startListeningForExpressNotifications
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __66__NPKExpressPassController__startListeningForExpressNotifications__block_invoke;
  v2[3] = &unk_24CFE7998;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

void __66__NPKExpressPassController__startListeningForExpressNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@ Start listening for express notifications", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_startListeningForGenericNotifications");
  objc_msgSend(*(id *)(a1 + 32), "_startListeningForCarKeyNotifications");
  objc_msgSend(*(id *)(a1 + 32), "_startListeningForHomeKeyNotifications");
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePassesLibraryChangedNotification_, *MEMORY[0x24BE6F580], 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePassesLibraryChangedNotification_, *MEMORY[0x24BE6F598], 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePassesLibraryChangedNotification_, *MEMORY[0x24BE6F590], 0);

}

- (void)_startListeningForGenericNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleEnterNearFieldNotification_, *MEMORY[0x24BE6F2C8], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleExpressTransactionStartNotification_, *MEMORY[0x24BE6F2F0], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleExpressTransactionTimeOutNotification_, *MEMORY[0x24BE6F2F8], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleExpressTransactionEndNotification_, *MEMORY[0x24BE6F2D8], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleExpressTransactionFailedNotification_, *MEMORY[0x24BE6F2E8], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleExpressTransactionFailedNotification_, *MEMORY[0x24BE6F2E0], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleExitNearFieldNotification_, *MEMORY[0x24BE6F2D0], 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleStandaloneTransactionDoneNotification_, CFSTR("NPKDistributedNotificationStandaloneTransactionDone"), 0);

}

- (void)_startListeningForCarKeyNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleCarKeyExpressEnteredNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.express.enter"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleCarKeyExpressExitedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.express.exit"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleCarKeySessionEndedNotification_, CFSTR("com.apple.secureelementservice.dck.event.session.did.end"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleCarKeySessionEndedWithErrorNotification_, CFSTR("com.apple.secureelementservice.dck.event.session.did.end.with.error"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleConnectedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.connect"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleDisconnectedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.disconnect"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleLockedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.lock"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleCarKeyVehicleUnlockedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.unlock"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleCarKeyRKEActionCompletedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.rke.action.complete"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__handleCarKeyRangingStartedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.ranging.start"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleCarKeyRangingEndedNotification_, CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.ranging.end"), 0);

}

- (void)_startListeningForHomeKeyNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleHomeKeyLockConnectedNotification_, CFSTR("com.apple.secureelementservice.acwg.event.did.connect"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleHomeKeyLockDisconnectedNotification_, CFSTR("com.apple.secureelementservice.acwg.event.did.disconnect"), 0);

  -[NPKExpressPassController distributedNotificationCenter](self, "distributedNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleHomeKeyLockStatusChangedNotification_, CFSTR("com.apple.secureelementservice.acwg.event.did.status.update"), 0);

}

- (void)_stopListeningForExpressNotifications
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__NPKExpressPassController__stopListeningForExpressNotifications__block_invoke;
  v2[3] = &unk_24CFE7998;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

void __65__NPKExpressPassController__stopListeningForExpressNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@ Stop listening for express notifications", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)_handleEnterNearFieldNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PKPassAutomaticSelectionTechnologyTypeForExpressEnteredObject();
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Received Enter Near Field Notification for automatic selection technology type %d", buf, 8u);
    }

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__NPKExpressPassController__handleEnterNearFieldNotification___block_invoke;
  v10[3] = &unk_24CFE8238;
  v10[4] = self;
  v10[5] = v6;
  NPKGuaranteeMainThread(v10);
}

void __62__NPKExpressPassController__handleEnterNearFieldNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  _BYTE v28[22];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_expressPassesInformationWithAutomaticSelectionTechnologyType:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "anyObject");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentTransactionExpressPassInformation:", v3);
LABEL_11:

    goto LABEL_12;
  }
  v4 = objc_msgSend(v2, "count");
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 < 2)
  {
    v11 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      pk_General_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v2;
      v8 = "Error: Received Enter Near Field Notification, but no express pass information: %@";
      v9 = v3;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v2;
      v8 = "Notice: More than one express pass for this technology type: %@";
      v9 = v3;
      v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_213518000, v9, v10, v8, v28, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_12:
  if (!objc_msgSend(*(id *)(a1 + 32), "_hasNoTransactionStartOrEndNotificationForTechnologyType:", *(_QWORD *)(a1 + 40), *(_OWORD *)v28))goto LABEL_27;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 134218242;
      *(_QWORD *)&v28[4] = v15;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v16;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Technology type: %ld detected. Express passes information: %@", v28, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "passUniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_27;
  objc_msgSend(*(id *)(a1 + 32), "expressPasses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {

LABEL_27:
    objc_msgSend(*(id *)(a1 + 32), "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 1, 0, 0);
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "paymentApplicationIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v23, "count") >= 2)
  {
    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      pk_Payment_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Warning: More than one express payment application identifier for a transit pass! This isn't supported.", v28, 2u);
      }

    }
  }
  objc_msgSend(v23, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentApplicationIdentifier:", v27);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSubCredentialIdentifier:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 2, v21, v27);

LABEL_28:
}

- (void)_handleExpressTransactionStartNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__NPKExpressPassController__handleExpressTransactionStartNotification___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  NPKGuaranteeMainThread(v6);

}

void __71__NPKExpressPassController__handleExpressTransactionStartNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v2, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v3, &v10, &v9);
  v4 = v10;
  v5 = v9;

  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Start Notification for application identifier: %@, application key identifier: %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionStartedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);

}

- (void)_handleExpressTransactionTimeOutNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  NPKGuaranteeMainThread(v6);

}

void __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[6];
  id v15;
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v18 + 5);
  v4 = (void *)v18[5];
  v15 = 0;
  obj = v4;
  objc_msgSend(v2, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v3, &obj, &v15);
  objc_storeStrong(v5, obj);
  v6 = v15;

  if (!v18[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentTransactionExpressPassInformation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke_88;
      v14[3] = &unk_24CFEB808;
      v14[4] = *(_QWORD *)(a1 + 32);
      v14[5] = &v17;
      objc_msgSend(v9, "enumerateCriteriaWithHandler:", v14);

    }
  }
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v18[5];
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Time Out Notification for application identifier %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionEndedWithApplicationIdentifier:applicationKeyIdentifier:", v18[5], v6);

  _Block_object_dispose(&v17, 8);
}

void __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke_88(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = a3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(a1 + 32), "_hasNoTransactionStartOrEndNotificationForTechnologyType:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "technologyType", (_QWORD)v14)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_handleExpressTransactionEndNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__NPKExpressPassController__handleExpressTransactionEndNotification___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  NPKGuaranteeMainThread(v6);

}

void __69__NPKExpressPassController__handleExpressTransactionEndNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v2, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v3, &v10, &v9);
  v4 = v10;
  v5 = v9;

  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction End Notification for application identifier %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionEndedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);

}

- (void)_handleExpressTransactionFailedNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__NPKExpressPassController__handleExpressTransactionFailedNotification___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  NPKGuaranteeMainThread(v6);

}

void __72__NPKExpressPassController__handleExpressTransactionFailedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v2, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v3, &v10, &v9);
  v4 = v10;
  v5 = v9;

  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Failed Notification for application identifier %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionFailedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);

}

- (void)_handleExitNearFieldNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PKPassAutomaticSelectionTechnologyTypeForExpressEnteredObject();
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Received Exit Near Field Notification for automatic selection technology type %d", buf, 8u);
    }

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__NPKExpressPassController__handleExitNearFieldNotification___block_invoke;
  v10[3] = &unk_24CFE7998;
  v10[4] = self;
  NPKGuaranteeMainThread(v10);
}

uint64_t __61__NPKExpressPassController__handleExitNearFieldNotification___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3] == 2)
  {
    objc_msgSend(v2, "currentApplicationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        pk_General_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "currentTransactionPass");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Exit Near Field Notification, but didn't finish transaction with applicationIdentifier:%@ assume it fails.", (uint8_t *)&v12, 0xCu);

        }
      }
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "currentApplicationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentSubCredentialIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_onqueue_transactionFailedWithApplicationIdentifier:applicationKeyIdentifier:", v9, v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransactionExpressPassInformation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentApplicationIdentifier:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSubCredentialIdentifier:", 0);
}

- (void)_onqueue_transactionStartedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKExpressPassController setCurrentApplicationIdentifier:](self, "setCurrentApplicationIdentifier:", v6);
  -[NPKExpressPassController setCurrentSubCredentialIdentifier:](self, "setCurrentSubCredentialIdentifier:", v7);
  -[NPKExpressPassController _queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:](self, "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKExpressPassController _transitionToStatus:forExpressPass:paymentApplicationIdentifier:](self, "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 2, v8, v6);
  if (!v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Started Notification for application identifier %@, but no pass.", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

- (void)_onqueue_transactionEndedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKExpressPassController currentApplicationIdentifier](self, "currentApplicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v8;
  v11 = v10;
  if (v10 == v9)
  {

  }
  else
  {
    if (!v9 || !v10)
    {

      goto LABEL_15;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_15;
  }
  if (objc_msgSend(v7, "length"))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[NPKExpressPassController currentSubCredentialIdentifier](self, "currentSubCredentialIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    -[NPKExpressPassController currentSubCredentialIdentifier](self, "currentSubCredentialIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();

    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKExpressPassController currentSubCredentialIdentifier](self, "currentSubCredentialIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412802;
        v25 = v19;
        v26 = 2112;
        v27 = v9;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Using the subcredential identifier (%@) from the start transaction event for %@ since the transaction end event didn't include it (%@)", (uint8_t *)&v24, 0x20u);

      }
    }
    v7 = (id)v15;
  }
LABEL_16:
  -[NPKExpressPassController _queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:](self, "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", v9, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKExpressPassController _transitionToStatus:forExpressPass:paymentApplicationIdentifier:](self, "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 4, v20, v9);
  if (!v20)
  {
    pk_General_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412290;
        v25 = v9;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Ended Notification for application identifier %@, but no pass.", (uint8_t *)&v24, 0xCu);
      }

    }
  }

}

- (void)_onqueue_transactionFailedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKExpressPassController _queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:](self, "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKExpressPassController _transitionToStatus:forExpressPass:paymentApplicationIdentifier:](self, "_transitionToStatus:forExpressPass:paymentApplicationIdentifier:", 3, v8, v6);
  if (!v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Failed Notification for application identifier %@, but no pass.", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

- (void)_handleCarKeyExpressEnteredNotification:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  kdebug_trace();
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Express Entered Notification: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_handleCarKeyExpressExitedNotification:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  kdebug_trace();
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Express Exited Notification: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_handleCarKeySessionEndedNotification:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Session Ended Notification: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_handleCarKeySessionEndedWithErrorNotification:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Session Ended with Error Notification: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_handleCarKeyVehicleConnectedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v12, &v11);
  v6 = v12;
  v7 = v11;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Connected Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
}

- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v12, &v11);
  v6 = v12;
  v7 = v11;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Disconnected Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
}

- (void)_handleCarKeyVehicleLockedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v17, &v16);
  v6 = v17;
  v7 = v16;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Locked Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__NPKExpressPassController__handleCarKeyVehicleLockedNotification___block_invoke;
  v13[3] = &unk_24CFE8288;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  NPKGuaranteeMainThread(v13);

}

uint64_t __67__NPKExpressPassController__handleCarKeyVehicleLockedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleCarKeyVehicleUnlockedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v17, &v16);
  v6 = v17;
  v7 = v16;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Unlocked Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__NPKExpressPassController__handleCarKeyVehicleUnlockedNotification___block_invoke;
  v13[3] = &unk_24CFE8288;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  NPKGuaranteeMainThread(v13);

}

uint64_t __69__NPKExpressPassController__handleCarKeyVehicleUnlockedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleStandaloneTransactionDoneNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v17, &v16);
  v6 = v17;
  v7 = v16;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Generic Transaction Done Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__NPKExpressPassController__handleStandaloneTransactionDoneNotification___block_invoke;
  v13[3] = &unk_24CFE8288;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  NPKGuaranteeMainThread(v13);

}

uint64_t __73__NPKExpressPassController__handleStandaloneTransactionDoneNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleCarKeyRKEActionCompletedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  NPKExpressPassController *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = 0;
  v31 = 0;
  v32 = 0;
  v29 = 0;
  v30 = 0;
  -[NPKExpressPassController _parseRKEActionNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:outFunctionNumber:outActionNumber:outExecutionStatusNumber:outErrorMessage:](self, "_parseRKEActionNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:outFunctionNumber:outActionNumber:outExecutionStatusNumber:outErrorMessage:", v5, &v34, &v33, &v32, &v31, &v30, &v29);
  v6 = v34;
  v7 = v33;
  v8 = v32;
  v9 = v31;
  v10 = v30;
  v11 = v29;

  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      v36 = v6;
      v37 = 2112;
      v38 = v7;
      v39 = 2112;
      v40 = v8;
      v41 = 2112;
      v42 = v9;
      v43 = 2112;
      v44 = v10;
      v45 = 2112;
      v46 = v11;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key RKE Action Completed Notification for...\nAID: %@\nkey ID: %@\nfunctionNumber: %@\nactionNumber: %@\nexecutionStatusNumber: %@\nerrorMessage: %@", buf, 0x3Eu);
    }

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __72__NPKExpressPassController__handleCarKeyRKEActionCompletedNotification___block_invoke;
  v21[3] = &unk_24CFEB830;
  v22 = v11;
  v23 = v10;
  v24 = self;
  v25 = v9;
  v26 = v8;
  v27 = v6;
  v28 = v7;
  v15 = v7;
  v16 = v6;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  NPKGuaranteeMainThread(v21);

}

void __72__NPKExpressPassController__handleCarKeyRKEActionCompletedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (!v3)
      return;
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v5 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v5;
    v6 = "Error: RKE action failed with error: %@";
    goto LABEL_10;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "isEqualToNumber:", v8);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "_onqueue_transactionCompletedForRKEAction:function:withApplicationIdentifier:applicationKeyIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    return;
  }
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (v10)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      return;
    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412290;
    v13 = v11;
    v6 = "Error: RKE action completed with unexpected execution status number! Received: %@; expected: 0";
LABEL_10:
    _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v12, 0xCu);
    goto LABEL_11;
  }
}

- (void)_handleCarKeyRangingStartedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v12, &v11);
  v6 = v12;
  v7 = v11;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Started Ranging Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
}

- (void)_handleCarKeyRangingEndedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  -[NPKExpressPassController _parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:](self, "_parseExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:", v5, &v12, &v11);
  v6 = v12;
  v7 = v11;

  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Ended Ranging Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }

  }
}

- (void)_handleHomeKeyLockConnectedNotification:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Received lock connected notification.", v6, 2u);
    }

  }
}

- (void)_handleHomeKeyLockDisconnectedNotification:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Received lock disconnected notification.", v6, 2u);
    }

  }
}

- (void)_handleHomeKeyLockStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  -[NPKExpressPassController _parseHomeKeyUWBExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:outReaderIdentifier:outTimestamp:outTransactionLockStatus:outLockOperationSource:](self, "_parseHomeKeyUWBExpressNotificationObject:outApplicationIdentifier:outApplicationKeyIdentifier:outReaderIdentifier:outTimestamp:outTransactionLockStatus:outLockOperationSource:", v5, &v33, &v32, &v31, &v30, &v29, &v28);
  v6 = v33;
  v7 = v32;
  v8 = v31;
  v9 = v30;
  v10 = v29;
  v11 = v28;

  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      v35 = v4;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = v8;
      v44 = 2112;
      v45 = v9;
      v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Received home key status changed notification: %@ for AID: %@ key ID: %@ lock status: %@ reader ID: %@ timestamp %@ operation source: %@", buf, 0x48u);
    }

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __72__NPKExpressPassController__handleHomeKeyLockStatusChangedNotification___block_invoke;
  v21[3] = &unk_24CFEB830;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  v24 = v8;
  v25 = v10;
  v26 = v9;
  v27 = v11;
  v15 = v11;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v19 = v7;
  v20 = v6;
  NPKGuaranteeMainThread(v21);

}

void __72__NPKExpressPassController__handleHomeKeyLockStatusChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NPKExpressUWBTransactionInfo *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NPKExpressUWBTransactionInfo initWithReaderID:lockStatus:timestamp:]([NPKExpressUWBTransactionInfo alloc], "initWithReaderID:lockStatus:timestamp:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v4 = objc_msgSend(*(id *)(a1 + 32), "_transactionEventFromLockStatus:", *(_QWORD *)(a1 + 64));
  v5 = objc_msgSend(*(id *)(a1 + 32), "_operationSourceFromRawValue:", *(_QWORD *)(a1 + 80));
  if (v4 == 1 && v5 == 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitionToStandaloneTransactionEvent:forExpressPass:withExpressUWBInfo:", 1, v2, v3);
  }
  else
  {
    v7 = v5;
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218240;
        v12 = v4;
        v13 = 2048;
        v14 = v7;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring UWB event %lu with operation source %lu", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)_onqueue_transactionCompletedForStandaloneTransactionEvent:(unint64_t)a3 withApplicationIdentifier:(id)a4 applicationKeyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKExpressPassController _queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:](self, "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", v9, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NPKExpressPassController _transitionToStandaloneTransactionEvent:forExpressPass:](self, "_transitionToStandaloneTransactionEvent:forExpressPass:", a3, v10);
}

- (void)_onqueue_transactionCompletedForRKEAction:(id)a3 function:(id)a4 withApplicationIdentifier:(id)a5 applicationKeyIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NPKExpressPassController _queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:](self, "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", v11, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[NPKExpressPassController _transitionToCompletedRKEAction:function:forExpressPass:](self, "_transitionToCompletedRKEAction:function:forExpressPass:", v13, v12, v14);
}

- (void)_handlePassesLibraryChangedNotification:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  NPKExpressPassController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Library Passes Changed Notification %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[NPKExpressPassController updateExpressPasses](self, "updateExpressPasses");
}

- (BOOL)_hasNoTransactionStartOrEndNotificationForTechnologyType:(int64_t)a3
{
  return a3 == 1 || a3 == 6;
}

- (id)_queue_expressPassForTransactionApplicationIdentifier:(id)a3 transactionApplicationKeyIdentifier:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  NPKExpressPassController *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v23 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15;
  v38 = __Block_byref_object_dispose__15;
  v39 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = self;
  -[NPKExpressPassController expressPassConfigurations](self, "expressPassConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    v9 = MEMORY[0x24BDAC760];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "passInformation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      v25[1] = 3221225472;
      v25[2] = __118__NPKExpressPassController__queue_expressPassForTransactionApplicationIdentifier_transactionApplicationKeyIdentifier___block_invoke;
      v25[3] = &unk_24CFEB858;
      v12 = v11;
      v26 = v12;
      v27 = v24;
      v28 = v23;
      v29 = &v34;
      objc_msgSend(v12, "enumerateCriteriaWithHandler:", v25);
      v13 = v35[5] == 0;

      if (!v13)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v35[5])
  {
    -[NPKExpressPassController expressPasses](v22, "expressPasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v35[5], "passUniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  pk_Payment_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v24;
      v42 = 2112;
      v43 = v20;
      _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Transaction application identifier: %@ express pass unique ID %@", buf, 0x16u);

    }
  }
  _Block_object_dispose(&v34, 8);

  return v16;
}

void __118__NPKExpressPassController__queue_expressPassForTransactionApplicationIdentifier_transactionApplicationKeyIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "paymentApplicationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "subcredentialCredentialIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!*(_QWORD *)(a1 + 48) || PKEqualObjects())
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
      *a4 = 1;
    }

  }
}

- (void)updateExpressPasses
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__NPKExpressPassController_updateExpressPasses__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __47__NPKExpressPassController_updateExpressPasses__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateExpressPasses");
}

- (void)updateExpressPassesSynchronous
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKExpressPassController_updateExpressPassesSynchronous__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __58__NPKExpressPassController_updateExpressPassesSynchronous__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateExpressPasses");
}

- (void)_internalQueue_updateExpressPasses
{
  NPKExpressPassController *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  NPKExpressPassController *v35;
  void *v36;
  void *v37;
  id obj;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKExpressPassController paymentService](v2, "paymentService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressPassConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKExpressPassController expressPassConfigurations](v2, "expressPassConfigurations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v4;
      v49 = 2112;
      v50 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Updating current express passes with new configurations: %@ (previous: %@)", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    -[NPKExpressPassController _stopListeningForExpressNotifications](v2, "_stopListeningForExpressNotifications");
LABEL_31:
    -[NPKExpressPassController _internalQueue_stopFieldDetector](v2, "_internalQueue_stopFieldDetector");
    goto LABEL_32;
  }
  -[NPKExpressPassController _startListeningForExpressNotifications](v2, "_startListeningForExpressNotifications");
  -[NPKExpressPassController passLibrary](v2, "passLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (!v11)
  {

    goto LABEL_31;
  }
  v12 = v11;
  obj = v10;
  v34 = v4;
  v35 = v2;
  v36 = v3;
  v13 = 0;
  v14 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v16, "passUniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v9, "passWithUniqueID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        pk_Payment_log();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          pk_Payment_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "uniqueID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v48 = v18;
            v49 = 2112;
            v50 = v22;
            v51 = 2112;
            v52 = v16;
            _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Fetched pass %@ with Unique Identifier %@ for express pass configuration %@", buf, 0x20u);

          }
        }
        objc_msgSend(v18, "paymentPass");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "cardType");

        if (v24 == 3)
          v13 = 1;
        if (v18)
        {
          objc_msgSend(v37, "setObject:forKey:", v18, v17);
        }
        else
        {
          pk_Payment_log();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

          if (v26)
          {
            pk_Payment_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v16;
              _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_ERROR, "Error: Express pass controller could not find pass for express pass configuration: %@", buf, 0xCu);
            }

          }
        }

      }
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  }
  while (v12);

  v2 = v35;
  v3 = v36;
  v4 = v34;
  if ((v13 & 1) == 0)
    goto LABEL_31;
  -[NPKExpressPassController _internalQueue_startFieldDetector](v35, "_internalQueue_startFieldDetector");
LABEL_32:
  v28 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v37, "allValues");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __62__NPKExpressPassController__internalQueue_updateExpressPasses__block_invoke;
  v39[3] = &unk_24CFE8D78;
  v39[4] = v2;
  v40 = v4;
  v41 = v30;
  v42 = v37;
  v31 = v37;
  v32 = v30;
  v33 = v4;
  NPKGuaranteeMainThread(v39);

}

void __62__NPKExpressPassController__internalQueue_updateExpressPasses__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "expressPassConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "expressPasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKEqualObjects();

  if ((v4 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setExpressPassConfigurations:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setExpressPasses:", *(_QWORD *)(a1 + 56));
  }
}

- (id)_expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKExpressPassController expressPassConfigurations](self, "expressPassConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke;
  v8[3] = &unk_24CFEB8A8;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "passInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke_2;
  v7[3] = &unk_24CFEB880;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateCriteriaWithHandler:", v7);

}

void __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (_QWORD)v15)
          && objc_msgSend(v11, "technologyType") == a1[6])
        {
          v12 = (void *)a1[4];
          v13 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
          objc_msgSend(v12, "passInformation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

          *a4 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)_queue_siblingExpressPassesForExpressPass:(id)a3 applicationIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  uint64_t m;
  id v53;
  NPKExpressPassController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__15;
  v83 = __Block_byref_object_dispose__15;
  v84 = 0;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v54 = self;
  -[NPKExpressPassController expressPassConfigurations](self, "expressPassConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v76;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v76 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "passInformation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v10;
        v71[1] = 3221225472;
        v71[2] = __92__NPKExpressPassController__queue_siblingExpressPassesForExpressPass_applicationIdentifier___block_invoke;
        v71[3] = &unk_24CFEB8D0;
        v13 = v12;
        v72 = v13;
        v73 = v53;
        v74 = &v79;
        objc_msgSend(v13, "enumerateCriteriaWithHandler:", v71);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v15 = (id)v80[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v68 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        if (objc_msgSend(v19, "supportsExpress")
          && objc_msgSend(v19, "supportsInSessionExpress"))
        {
          if (objc_msgSend(v19, "technologyType") != 4)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v19, "technologyType"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v23);
            goto LABEL_21;
          }
          objc_msgSend(v19, "TCIs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v19, "TCIs");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "unionSet:", v21);

          }
          objc_msgSend(v19, "primaryTCIs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v19, "primaryTCIs");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "unionSet:", v23);
LABEL_21:

            continue;
          }
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
    }
    while (v16);
  }

  -[NPKExpressPassController _expressPassesInformationWithTCIs:](v54, "_expressPassesInformationWithTCIs:", v48);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v24;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v64 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "passUniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v6, "uniqueID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isEqualToString:", v30);

          if ((v31 & 1) == 0)
          {
            -[NSDictionary objectForKey:](v54->_expressPasses, "objectForKey:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
              objc_msgSend(v25, "addObject:", v32);

          }
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
    }
    while (v26);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v47 = v14;
  v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v90, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(v47);
        v33 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
        -[NPKExpressPassController _expressPassInformationWithTechnologyType:](v54, "_expressPassInformationWithTechnologyType:", objc_msgSend(v33, "integerValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v89, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v56;
          do
          {
            for (n = 0; n != v36; ++n)
            {
              if (*(_QWORD *)v56 != v37)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * n), "passUniqueIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                objc_msgSend(v6, "uniqueID");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v39, "isEqualToString:", v40);

                if ((v41 & 1) == 0)
                {
                  pk_General_log();
                  v42 = objc_claimAutoreleasedReturnValue();
                  v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

                  if (v43)
                  {
                    pk_General_log();
                    v44 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v86 = v33;
                      v87 = 2112;
                      v88 = v39;
                      _os_log_impl(&dword_213518000, v44, OS_LOG_TYPE_DEFAULT, "Notice: Found technology type %@ sibling express pass %@", buf, 0x16u);
                    }

                  }
                  -[NSDictionary objectForKey:](v54->_expressPasses, "objectForKey:", v39);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v45)
                    objc_msgSend(v25, "addObject:", v45);

                }
              }

            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v89, 16);
          }
          while (v36);
        }

      }
      v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v90, 16);
    }
    while (v50);
  }

  _Block_object_dispose(&v79, 8);
  return v25;
}

void __92__NPKExpressPassController__queue_siblingExpressPassesForExpressPass_applicationIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "paymentApplicationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)_expressPassesInformationWithTCIs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15;
  v16 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKExpressPassController expressPassConfigurations](self, "expressPassConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke;
  v9[3] = &unk_24CFEB920;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(a2, "passInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke_2;
  v7[3] = &unk_24CFEB8F8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  objc_msgSend(v6, "enumerateCriteriaWithHandler:", v7);

}

void __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (_QWORD)v15) && objc_msgSend(v11, "technologyType") == 4)
        {
          objc_msgSend(v11, "TCIs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "intersectsSet:", a1[4]))
          {

LABEL_14:
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", a1[5]);
            *a4 = 1;
            goto LABEL_15;
          }
          objc_msgSend(v11, "primaryTCIs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intersectsSet:", a1[4]);

          if (v14)
            goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)_expressPassInformationWithTechnologyType:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKExpressPassController expressPassConfigurations](self, "expressPassConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke;
  v8[3] = &unk_24CFEB8A8;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a2, "passInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke_2;
  v6[3] = &unk_24CFEB880;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "enumerateCriteriaWithHandler:", v6);

}

void __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (_QWORD)v12)
          && objc_msgSend(v11, "technologyType") == a1[6])
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", a1[4]);
          *a4 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (unint64_t)_transactionEventFromLockStatus:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToNumber:", v7);

    if ((v8 & 1) == 0)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        pk_General_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v3;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: Got lock status changed for unexpected lock status: %@", (uint8_t *)&v13, 0xCu);
        }

      }
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)_operationSourceFromRawValue:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToNumber:", v7);

    if ((v8 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToNumber:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "isEqualToNumber:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = 4;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isEqualToNumber:", v13);

          if (v14)
            v6 = 5;
          else
            v6 = 0;
        }
      }
    }
  }

  return v6;
}

- (void)_parseExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v8, "lastObject");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v9;

    }
    else
    {
      *a5 = 0;
    }

  }
  else
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v13, 2u);
      }

    }
  }

}

- (void)_parseHomeKeyUWBExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outReaderIdentifier:(id *)a6 outTimestamp:(id *)a7 outTransactionLockStatus:(id *)a8 outLockOperationSource:(id *)a9
{
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        pk_General_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138412290;
          v26 = v15;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Will parse notification %@", (uint8_t *)&v25, 0xCu);
        }

      }
      if ((unint64_t)objc_msgSend(v15, "count") <= 5)
      {
        pk_General_log();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (!v24)
          goto LABEL_13;
        pk_General_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138412290;
          v26 = v15;
          _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Got malformed event from sesd. %@", (uint8_t *)&v25, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 2);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithHexEncodedString:", v19);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "integerValue"));
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v21, "integerValue"));
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v22, "integerValue"));
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_13:

    }
  }

}

- (void)_parseRKEActionNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outFunctionNumber:(id *)a6 outActionNumber:(id *)a7 outExecutionStatusNumber:(id *)a8 outErrorMessage:(id *)a9
{
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t v27[16];

  v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v15, "firstObject");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)-[NSObject count](v15, "count") <= 1)
      {
        *a5 = 0;
      }
      else
      {
        -[NSObject objectAtIndex:](v15, "objectAtIndex:", 1);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v16;

      }
      if ((unint64_t)-[NSObject count](v15, "count") >= 3)
      {
        -[NSObject objectAtIndex:](v15, "objectAtIndex:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = v19;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v19, "integerValue"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      if ((unint64_t)-[NSObject count](v15, "count") >= 4)
      {
        -[NSObject objectAtIndex:](v15, "objectAtIndex:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v21;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v21, "integerValue"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      if ((unint64_t)-[NSObject count](v15, "count") >= 5)
      {
        -[NSObject objectAtIndex:](v15, "objectAtIndex:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = v23;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v23, "integerValue"));
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      if ((unint64_t)-[NSObject count](v15, "count") < 6)
      {
        v25 = 0;
      }
      else
      {
        -[NSObject objectAtIndex:](v15, "objectAtIndex:", 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = objc_retainAutorelease(v25);
      *a9 = v26;

LABEL_22:
      goto LABEL_23;
    }
  }
  pk_Payment_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v27, 2u);
    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)_internalQueue_startFieldDetector
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PKFieldDetector *v6;
  PKFieldDetector *fieldDetector;
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
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Starting field detector for terminal-requested auth", v8, 2u);
    }

  }
  if (!self->_fieldDetector)
  {
    v6 = (PKFieldDetector *)objc_alloc_init(MEMORY[0x24BE6EB20]);
    fieldDetector = self->_fieldDetector;
    self->_fieldDetector = v6;

    -[PKFieldDetector registerObserver:](self->_fieldDetector, "registerObserver:", self);
  }
}

- (void)_internalQueue_stopFieldDetector
{
  PKFieldDetector *fieldDetector;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[PKFieldDetector unregisterObserver:](self->_fieldDetector, "unregisterObserver:", self);
  fieldDetector = self->_fieldDetector;
  self->_fieldDetector = 0;

}

- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NPKExpressPassController *v10;

  v5 = a4;
  -[NPKExpressPassController passLibrary](self, "passLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke;
  v8[3] = &unk_24CFEB948;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "getMetadataForFieldWithProperties:withHandler:", v7, v8);

}

void __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "shouldIgnoreField") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "authenticationRequired")
    && objc_msgSend(*(id *)(a1 + 32), "terminalType") == 3)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "TCIs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_expressPassesInformationWithTCIs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        pk_Payment_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (v11)
        {
          pk_Payment_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Multiple express passes match TCIs for transient authentication required field detect event", buf, 2u);
          }

        }
      }
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke_101;
      v18[3] = &unk_24CFE7E40;
      v13 = v9;
      v14 = *(_QWORD *)(a1 + 40);
      v19 = v13;
      v20 = v14;
      NPKGuaranteeMainThread(v18);
      v15 = v19;
    }
    else
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v17)
        goto LABEL_13;
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: No express passes match TCIs for transient authentication required field detect event", buf, 2u);
      }
    }

LABEL_13:
  }

}

void __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke_101(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "expressPasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "expressPassController:didReceiveAuthenticationRequestForPass:", *(_QWORD *)(a1 + 40), v5);

  }
  else
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "passUniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Got on-device authentication required for unique ID %@, but no express pass!", (uint8_t *)&v11, 0xCu);

      }
    }
  }

}

- (NPKExpressPassControllerDelegate)delegate
{
  return (NPKExpressPassControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPass)currentTransactionPass
{
  return self->_currentTransactionPass;
}

- (void)setCurrentTransactionPass:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransactionPass, a3);
}

- (NSSet)expressPassConfigurations
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpressPassConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)expressPasses
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpressPasses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PKExpressPassInformation)currentTransactionExpressPassInformation
{
  return self->_currentTransactionExpressPassInformation;
}

- (void)setCurrentTransactionExpressPassInformation:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransactionExpressPassInformation, a3);
}

- (NSString)currentApplicationIdentifier
{
  return self->_currentApplicationIdentifier;
}

- (void)setCurrentApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentApplicationIdentifier, a3);
}

- (NSString)currentSubCredentialIdentifier
{
  return self->_currentSubCredentialIdentifier;
}

- (void)setCurrentSubCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentSubCredentialIdentifier, a3);
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
  objc_storeStrong((id *)&self->_currentSubCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_currentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_currentTransactionExpressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPasses, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_distributedNotificationCenter);
  objc_destroyWeak((id *)&self->_passLibrary);
  objc_destroyWeak((id *)&self->_paymentService);
  objc_storeStrong((id *)&self->_currentTransactionPass, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
