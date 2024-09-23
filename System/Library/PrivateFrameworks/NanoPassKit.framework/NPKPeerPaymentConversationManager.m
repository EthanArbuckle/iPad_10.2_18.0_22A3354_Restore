@implementation NPKPeerPaymentConversationManager

- (NPKPeerPaymentConversationManager)init
{
  NPKPeerPaymentConversationManager *v2;
  NPKPeerPaymentConversationManager *v3;
  NPKPeerPaymentConversationContext *conversationContext;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  PKPeerPaymentService *v7;
  PKPeerPaymentService *peerPaymentService;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NPKPeerPaymentConversationManager;
  v2 = -[NPKPeerPaymentConversationManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    conversationContext = v2->_conversationContext;
    v2->_conversationContext = 0;

    v5 = dispatch_queue_create("com.apple.passkit.peerpayment.conversationmanager", 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = (PKPeerPaymentService *)objc_alloc_init(MEMORY[0x24BE6EDF0]);
    peerPaymentService = v3->_peerPaymentService;
    v3->_peerPaymentService = v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__accountDidChange, *MEMORY[0x24BE6F798], v3->_peerPaymentService);

  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_23);
  return (id)sharedInstance_sharedInstance_4;
}

void __51__NPKPeerPaymentConversationManager_sharedInstance__block_invoke()
{
  NPKPeerPaymentConversationManager *v0;
  void *v1;

  v0 = objc_alloc_init(NPKPeerPaymentConversationManager);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (void)setActiveConversation:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__NPKPeerPaymentConversationManager_setActiveConversation___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __59__NPKPeerPaymentConversationManager_setActiveConversation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != *(_QWORD *)(a1 + 40))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 40);
        objc_msgSend(v5, "senderAddress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "recipientAddresses");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v5;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Set new conversation:%@ sender address:%@ recipient addresses:%@", (uint8_t *)&v14, 0x20u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    if ((v10 & 1) == 0)
    {
      v11 = *(void **)(a1 + 32);
      recipientPhoneOrEmailWithConversation(*(void **)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "senderAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", v12, v13);

    }
  }
}

- (MSConversation)activeConversation
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  v10 = __Block_byref_object_dispose__19;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__NPKPeerPaymentConversationManager_activeConversation__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MSConversation *)v3;
}

void __55__NPKPeerPaymentConversationManager_activeConversation__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)senderPhoneOrEmail
{
  void *v2;
  void *v3;

  -[NPKPeerPaymentConversationManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "senderAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recipientPhoneOrEmail
{
  void *v2;
  void *v3;

  -[NPKPeerPaymentConversationManager activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  recipientPhoneOrEmailWithConversation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recipientDisplayName
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[NPKPeerPaymentConversationManager _newPeerPaymentController](self, "_newPeerPaymentController");
  -[NPKPeerPaymentConversationManager recipientPhoneOrEmail](self, "recipientPhoneOrEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameForRecipientAddress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)recipientFoundInContacts
{
  id v3;
  void *v4;
  id v5;
  BOOL v7;

  v7 = 0;
  v3 = -[NPKPeerPaymentConversationManager _newPeerPaymentController](self, "_newPeerPaymentController");
  -[NPKPeerPaymentConversationManager recipientPhoneOrEmail](self, "recipientPhoneOrEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "displayNameForRecipientAddress:foundInContacts:", v4, &v7);

  return v7;
}

- (PKPeerPaymentRecipient)recipient
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  v10 = __Block_byref_object_dispose__19;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__NPKPeerPaymentConversationManager_recipient__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PKPeerPaymentRecipient *)v3;
}

void __46__NPKPeerPaymentConversationManager_recipient__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)lookupRecipientInformationIfNecessary
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NPKPeerPaymentConversationManager_lookupRecipientInformationIfNecessary__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __74__NPKPeerPaymentConversationManager_lookupRecipientInformationIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Requested Lookup recipient Information if necessary", v9, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 24))
  {
    v6 = *(id *)(v5 + 16);
    recipientPhoneOrEmailWithConversation(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "senderAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", v7, v8);

  }
}

- (void)performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__NPKPeerPaymentConversationManager_performPaymentWithAmount_requestToken_completion___block_invoke;
  v15[3] = &unk_24CFE86A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

uint64_t __86__NPKPeerPaymentConversationManager_performPaymentWithAmount_requestToken_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_performPaymentWithAmount:requestToken:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_internalQueue_performPaymentWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  NPKRemoteInterfacePresenter *v13;
  NPKRemoteInterfacePresenter *v14;
  id v15;
  id v16;
  void *v17;
  MSConversation *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  id v24;
  id v25;
  NPKRemoteInterfacePresenter *v26;
  id v27;
  MSConversation *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  NPKPeerPaymentConversationManager *v36;
  id v37;
  NPKRemoteInterfacePresenter *v38;
  id v39;
  MSConversation *v40;
  id v41;
  id v42;
  uint8_t *v43;
  _QWORD v44[5];
  NPKRemoteInterfacePresenter *v45;
  id v46;
  id v47;
  uint8_t *v48;
  uint8_t buf[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v32 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKPeerPaymentConversationManager currentPeerPaymentController](self, "currentPeerPaymentController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: We already have a current peer payment controller. Resetting.", buf, 2u);
      }

    }
    objc_msgSend(v33, "reset");
  }
  v12 = -[NPKPeerPaymentConversationManager _newPeerPaymentControllerWithQueue:](self, "_newPeerPaymentControllerWithQueue:", self->_internalQueue);
  -[NPKPeerPaymentConversationManager setCurrentPeerPaymentController:](self, "setCurrentPeerPaymentController:", v12);
  v13 = objc_alloc_init(NPKRemoteInterfacePresenter);
  *(_QWORD *)buf = 0;
  v50 = buf;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__19;
  v53 = __Block_byref_object_dispose__19;
  v54 = 0;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke;
  v44[3] = &unk_24CFEC148;
  v44[4] = self;
  v48 = buf;
  v14 = v13;
  v45 = v14;
  v15 = v8;
  v47 = v15;
  v16 = v12;
  v46 = v16;
  v17 = (void *)MEMORY[0x2199B6780](v44);
  v18 = self->_activeConversation;
  recipientPhoneOrEmailWithConversation(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSConversation senderAddress](v18, "senderAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_General_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 138413058;
      v56 = v31;
      v57 = 2112;
      v58 = v32;
      v59 = 2112;
      v60 = v19;
      v61 = 2112;
      v62 = v20;
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: perform Payment with amount:%@ requestToken:%@, recipient:%@, sender:%@", v55, 0x2Au);
    }

  }
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_49;
  v34[3] = &unk_24CFEC210;
  v24 = v16;
  v43 = buf;
  v35 = v24;
  v36 = self;
  v25 = v31;
  v37 = v25;
  v26 = v14;
  v38 = v26;
  v27 = v32;
  v39 = v27;
  v28 = v18;
  v40 = v28;
  v29 = v17;
  v42 = v29;
  v30 = v19;
  v41 = v30;
  objc_msgSend(v24, "identifyRecipientWithAddress:senderAddress:completion:", v30, v20, v34);

  _Block_object_dispose(buf, 8);
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_displayableErrorWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "clearInAppInterfaceForSkeletonPeerPaymentQuote:withError:", v11, v10);
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v12 + 16))(v12, a2, v13, v9, v10);
  objc_msgSend(*(id *)(a1 + 48), "reset");

}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _BYTE *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  _BYTE *v50;
  _QWORD *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  NSObject *v55;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a2 == 1)
  {
    v9 = dispatch_group_create();
    objc_msgSend(v7, "receiveCurrency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentBalance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currency");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqual:", v13);

    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      if (v16)
      {
        pk_Payment_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Send and receive currencies match. Showing skeleton peer payment quote", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "_skeletonPeerPaymentQuoteWithPeerPaymentController:selectedAmount:recipient:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v7);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      dispatch_group_enter(v9);
      v21 = *(void **)(a1 + 56);
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_50;
      v54[3] = &unk_24CFE9828;
      v55 = v9;
      objc_msgSend(v21, "showInAppInterfaceWithSkeletonPeerPaymentQuote:completion:", v22, v54);
      v23 = v55;
    }
    else
    {
      if (!v16)
      {
LABEL_17:
        dispatch_group_enter(v9);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v57 = __Block_byref_object_copy__19;
        v58 = __Block_byref_object_dispose__19;
        v59 = 0;
        v52[0] = 0;
        v52[1] = v52;
        v52[2] = 0x3032000000;
        v52[3] = __Block_byref_object_copy__19;
        v52[4] = __Block_byref_object_dispose__19;
        v53 = 0;
        objc_msgSend(*(id *)(a1 + 32), "selectMode:", 1);
        v32 = MEMORY[0x24BDAC760];
        v33 = *(void **)(a1 + 32);
        v34 = *(_QWORD *)(a1 + 48);
        v35 = *(_QWORD *)(a1 + 64);
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_52;
        v48[3] = &unk_24CFEC170;
        v50 = buf;
        v51 = v52;
        v36 = v9;
        v49 = v36;
        objc_msgSend(v33, "quoteWithAmount:source:requestToken:completion:", v34, 1, v35, v48);
        v38 = *(void **)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 40);
        v39 = *(NSObject **)(v37 + 8);
        v40[0] = v32;
        v40[1] = 3221225472;
        v40[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_2;
        v40[3] = &unk_24CFEC1E8;
        v46 = buf;
        v40[4] = v37;
        v41 = v38;
        v42 = *(id *)(a1 + 48);
        v43 = *(id *)(a1 + 64);
        v44 = *(id *)(a1 + 72);
        v45 = *(id *)(a1 + 88);
        v47 = v52;
        dispatch_group_notify(v36, v39, v40);

        _Block_object_dispose(v52, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_18;
      }
      pk_Payment_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "account");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "currentBalance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "currency");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "receiveCurrency");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Send and receive currencies differ (%@ vs %@). Not using skeleton peer payment quote.", buf, 0x16u);

      }
    }

    goto LABEL_17;
  }
  pk_General_log();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

  if (v25)
  {
    pk_General_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_ERROR, "Error: Could not identify recipient %@ with error %@", buf, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_18:

}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_50(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v13 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentPeerPaymentController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 == *(void **)(a1 + 40))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "riskLevel"))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_3;
        v23[3] = &unk_24CFEC1C0;
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(id *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 80);
        v24 = v13;
        v29 = v14;
        v25 = *(id *)(a1 + 48);
        v26 = *(id *)(a1 + 56);
        v27 = *(id *)(a1 + 64);
        v28 = *(id *)(a1 + 72);
        objc_msgSend(v11, "peerPaymentConversationManager:shouldDisplayRiskAlertWithCompletion:", v12, v23);

        v15 = v24;
      }
      else
      {
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_55;
        v18[3] = &unk_24CFEC198;
        v17 = *(void **)(a1 + 40);
        v19 = *(id *)(a1 + 48);
        v20 = *(id *)(a1 + 56);
        v21 = *(id *)(a1 + 64);
        v22 = *(id *)(a1 + 72);
        objc_msgSend(v17, "performQuote:completion:", v16, v18);

        v15 = v19;
      }

    }
    else
    {
      pk_General_log();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

      if (v4)
      {
        pk_General_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v31 = v2;
          v32 = 2112;
          v33 = v6;
          _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Not performing payment because we are no longer the current peer payment controller (current %@ vs ours %@)", buf, 0x16u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v31 = v10;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Error fetching quote: %@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  if (a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_4;
    v9[3] = &unk_24CFEC198;
    v4 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v4, "performQuote:completion:", v3, v9);

  }
  else
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Not performing payment because non-zero risk level detected for payment, user chose to cancel transaction.", v8, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_4(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v13 = a1[5];
      v14 = a1[6];
      v15 = 138413570;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 1024;
      v26 = a2;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform Payment with amount:%@ requestToken:%@, conversation:%@ response:%@, error:%@ success:%d", (uint8_t *)&v15, 0x3Au);
    }

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __101__NPKPeerPaymentConversationManager__internalQueue_performPaymentWithAmount_requestToken_completion___block_invoke_55(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v13 = a1[5];
      v14 = a1[6];
      v15 = 138413570;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 1024;
      v26 = a2;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform Payment with amount:%@ requestToken:%@, conversation:%@ response:%@, error:%@ success:%d", (uint8_t *)&v15, 0x3Au);
    }

  }
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__NPKPeerPaymentConversationManager_lookupRecipientInformationWithAddress_senderAddress___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __89__NPKPeerPaymentConversationManager_lookupRecipientInformationWithAddress_senderAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_internalQueue_lookupRecipientInformationWithAddress:(id)a3 senderAddress:(id)a4
{
  id v6;
  PKPeerPaymentRecipient *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  PKPeerPaymentRecipient *recipient;
  PKPeerPaymentRecipient *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  PKPeerPaymentRecipient *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (PKPeerPaymentRecipient *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKPeerPaymentConversationManager currentRecipientAddressLookup](self, "currentRecipientAddressLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "isEqualToString:", v6))
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v6;
        v13 = "Notice: Currently performing a look up for given recipient address:%@";
        v14 = v12;
        v15 = 12;
LABEL_20:
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    -[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v6);

    if (v17)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        pk_General_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          recipient = self->_recipient;
          *(_DWORD *)buf = 138412546;
          v30 = v6;
          v31 = 2112;
          v32 = recipient;
          _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: We already lookup for recipient with address:%@ recipient:%@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[NPKPeerPaymentConversationManager setCurrentRecipientAddressLookup:](self, "setCurrentRecipientAddressLookup:", v6);
      v22 = self->_recipient;
      self->_recipient = 0;

      pk_General_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        if (v24)
        {
          pk_General_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v6;
            v31 = 2112;
            v32 = v7;
            _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Start lookup recipient information with with recipientAddress:%@ senderAddress:%@", buf, 0x16u);
          }

        }
        v26 = -[NPKPeerPaymentConversationManager _newPeerPaymentControllerWithQueue:](self, "_newPeerPaymentControllerWithQueue:", self->_internalQueue);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke;
        v27[3] = &unk_24CFEC238;
        v27[4] = self;
        v28 = v6;
        objc_msgSend(v26, "identifyRecipientWithAddress:senderAddress:completion:", v28, v7, v27);

      }
      else if (v24)
      {
        pk_General_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = "Notice: Will not lookup recipient information with nil recipient Address";
          v14 = v12;
          v15 = 2;
          goto LABEL_20;
        }
LABEL_21:

      }
    }
  }

}

void __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[2] = __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  block[1] = 3221225472;
  v16 = v7;
  v20 = a2;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 32);
  v17 = v11;
  v18 = v12;
  v19 = v8;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, block);

}

uint64_t __104__NPKPeerPaymentConversationManager__internalQueue_lookupRecipientInformationWithAddress_senderAddress___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
      PKPeerPaymentRecipientStatusToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finish lookup information with recipient:%@ status:%@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "phoneOrEmail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "setPhoneOrEmail:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 24), *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "_postNotificationWithRecipient:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "setCurrentRecipientAddressLookup:", 0);
}

- (void)_internalQueue_forceLookupRecipientInformation
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  MSConversation *activeConversation;
  PKPeerPaymentRecipient *recipient;
  PKPeerPaymentRecipient *v8;
  MSConversation *v9;
  void *v10;
  void *v11;
  int v12;
  MSConversation *v13;
  __int16 v14;
  PKPeerPaymentRecipient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      activeConversation = self->_activeConversation;
      recipient = self->_recipient;
      v12 = 138412546;
      v13 = activeConversation;
      v14 = 2112;
      v15 = recipient;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forcing recipient lookup (conversation %@ current recipient %@)", (uint8_t *)&v12, 0x16u);
    }

  }
  -[NPKPeerPaymentConversationManager setCurrentRecipientAddressLookup:](self, "setCurrentRecipientAddressLookup:", 0);
  v8 = self->_recipient;
  self->_recipient = 0;

  v9 = self->_activeConversation;
  recipientPhoneOrEmailWithConversation(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSConversation senderAddress](v9, "senderAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentConversationManager _internalQueue_lookupRecipientInformationWithAddress:senderAddress:](self, "_internalQueue_lookupRecipientInformationWithAddress:senderAddress:", v10, v11);

}

- (void)performRequestWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NPKPeerPaymentConversationManager_performRequestWithAmount_completion___block_invoke;
  block[3] = &unk_24CFE84E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __73__NPKPeerPaymentConversationManager_performRequestWithAmount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_performRequestWithAmount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_internalQueue_performRequestWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  MSConversation *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  id v23;
  MSConversation *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  MSConversation *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NPKPeerPaymentConversationManager currentPeerPaymentController](self, "currentPeerPaymentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: We already have a current peer payment controller. Resetting.", buf, 2u);
      }

    }
    objc_msgSend(v8, "reset");
  }
  v12 = -[NPKPeerPaymentConversationManager _newPeerPaymentControllerWithQueue:](self, "_newPeerPaymentControllerWithQueue:", self->_internalQueue);
  -[NPKPeerPaymentConversationManager setCurrentPeerPaymentController:](self, "setCurrentPeerPaymentController:", v12);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke;
  v33[3] = &unk_24CFEC260;
  v33[4] = self;
  v13 = v7;
  v35 = v13;
  v14 = v12;
  v34 = v14;
  v15 = (void *)MEMORY[0x2199B6780](v33);
  v16 = self->_activeConversation;
  recipientPhoneOrEmailWithConversation(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSConversation senderAddress](v16, "senderAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    pk_General_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v6;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v18;
      _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: perform Request with amount:%@, recipient:%@, sender:%@", buf, 0x20u);
    }

  }
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_58;
  v27[3] = &unk_24CFEC2B0;
  v28 = v14;
  v29 = v6;
  v31 = v17;
  v32 = v15;
  v30 = v16;
  v22 = v17;
  v23 = v15;
  v24 = v16;
  v25 = v6;
  v26 = v14;
  objc_msgSend(v26, "identifyRecipientWithAddress:senderAddress:completion:", v22, v18, v27);

}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_displayableErrorWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id, id, void *))(v11 + 16))(v11, a2, v12, v9, v10);
  objc_msgSend(*(id *)(a1 + 40), "reset");

}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_58(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectMode:", 3);
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_2;
    v13[3] = &unk_24CFEC288;
    v14 = v7;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v8, "formalRequestTokenForAmount:source:completion:", v14, 2, v13);

  }
  else
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
        v12 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: Could not identify request recipient %@ with error %@", buf, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __88__NPKPeerPaymentConversationManager__internalQueue_performRequestWithAmount_completion___block_invoke_2(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      v13 = a1[5];
      v14 = 138413570;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      v24 = 1024;
      v25 = a2;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Finish perform request with amount:%@ requestToken:%@, conversation:%@ requestToken:%@, error:%@ success:%d", (uint8_t *)&v14, 0x3Au);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)_accountDidChange
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKPeerPaymentConversationManager__accountDidChange__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__NPKPeerPaymentConversationManager__accountDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "role") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_forceLookupRecipientInformation");

}

- (id)_displayableErrorWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x24BE6F7B0];
    objc_msgSend(v4, "npk_errorWithDomain:code:", *MEMORY[0x24BE6F7B0], 40316);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NPKPeerPaymentConversationManager _negativeBalanceErrorWithUnderlyingError:](self, "_negativeBalanceErrorWithUnderlyingError:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = (void *)v8;

      v5 = v12;
      return v5;
    }
    objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 40312);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NPKPeerPaymentConversationManager _ambiguousSenderAddressErrorWithUnderlyingError:](self, "_ambiguousSenderAddressErrorWithUnderlyingError:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 40309);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NPKPeerPaymentConversationManager _lockedOrRestrictedAccountErrorWithUnderlyingError:](self, "_lockedOrRestrictedAccountErrorWithUnderlyingError:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v5, "npk_errorWithDomain:code:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NPKPeerPaymentConversationManager _unknownPaymentErrorWithUnderlyingError:](self, "_unknownPaymentErrorWithUnderlyingError:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  return v5;
}

- (id)_negativeBalanceErrorWithUnderlyingError:(id)a3
{
  OS_dispatch_queue *internalQueue;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  internalQueue = self->_internalQueue;
  v5 = a3;
  v6 = -[NPKPeerPaymentConversationManager _newPeerPaymentControllerWithQueue:](self, "_newPeerPaymentControllerWithQueue:", internalQueue);
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 == -1)
  {
    objc_msgSend(v8, "currency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NPKPeerPaymentDecimalNumberFormatterForCurrencyCode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_BODY"), &stru_24CFF06D8, CFSTR("PeerPayment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "amount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromNumber:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_BODY_NO_VALUE"), &stru_24CFF06D8, CFSTR("PeerPayment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_TITLE"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_NEGATIVE_BALANCE_ERROR_COMPACT_BODY"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NPKDisplayableError(v21, v13, v23, v5, CFSTR("NPKPeerPaymentConversationManagerErrorDomain"), 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_ambiguousSenderAddressErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_UNAVAILABLE_ERROR_TITLE"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_SEND_ERROR_MESSAGE_AMBIGUOUS_SENDER_ADDRESS"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKPrimaryAppleAccountFormattedUsername();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NPKDisplayableError(v6, v11, &stru_24CFF06D8, v4, CFSTR("NPKPeerPaymentConversationManagerErrorDomain"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_lockedOrRestrictedAccountErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_SEND_ERROR_TITLE_CLOSED_OR_LOCKED"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PEER_PAYMENT_SEND_ERROR_MESSAGE_CLOSED_OR_LOCKED"), &stru_24CFF06D8, CFSTR("PeerPayment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NPKDisplayableError(v6, v8, &stru_24CFF06D8, v4, CFSTR("NPKPeerPaymentConversationManagerErrorDomain"), 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_unknownPaymentErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NPKDisplayableError(v4, v5, &stru_24CFF06D8, v3, CFSTR("NPKPeerPaymentConversationManagerErrorDomain"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_skeletonPeerPaymentQuoteWithPeerPaymentController:(id)a3 selectedAmount:(id)a4 recipient:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[7];
  _QWORD v59[7];
  _QWORD v60[10];
  _QWORD v61[10];
  _QWORD v62[13];
  _QWORD v63[15];

  v63[13] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v52 = a5;
  objc_msgSend(a3, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "amount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "countryCode");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currency");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v14;
  v16 = v15;
  v17 = v12;
  objc_msgSend(v8, "sendToUserFeatureDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "supportedNetworks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "merchantIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v18;
  objc_msgSend(v18, "merchantCapabilities");
  objc_msgSend(v7, "amount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentBalance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "amount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "compare:", v22);

  objc_msgSend(v8, "currentBalance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "amount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v25, "compare:", v26);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v16;
  v56 = v7;
  if (v23 == 1)
  {
    objc_msgSend(v7, "amount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentBalance");
    v48 = v27;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "amount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "decimalNumberBySubtracting:", v31);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = CFSTR("type");
    v33 = v16;
    PKPeerPaymentQuoteItemTypeToString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v34;
    v63[1] = v32;
    v62[1] = CFSTR("sendAmount");
    v62[2] = CFSTR("sendAmountCurrency");
    v63[2] = v33;
    v63[3] = v32;
    v62[3] = CFSTR("receiveAmount");
    v62[4] = CFSTR("receiveAmountCurrency");
    v63[4] = v33;
    v63[5] = v32;
    v62[5] = CFSTR("totalAmount");
    v62[6] = CFSTR("totalAmountCurrency");
    v63[6] = v33;
    v63[7] = CFSTR("0");
    v62[7] = CFSTR("fees");
    v62[8] = CFSTR("feesCurrency");
    v63[8] = v17;
    v63[9] = v57;
    v62[9] = CFSTR("countryCode");
    v62[10] = CFSTR("supportedNetworks");
    v63[10] = v19;
    v63[11] = v54;
    v62[11] = CFSTR("merchantIdentifier");
    v62[12] = CFSTR("merchantCapabilities");
    PKMerchantCapabilityToStrings();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v63[12] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v48;
    objc_msgSend(v48, "addObject:", v36);

    v28 = v47;
  }
  if (v49 == 1)
  {
    objc_msgSend(v56, "amount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "decimalNumberBySubtracting:", v28);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "stringValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = CFSTR("type");
    v40 = v16;
    PKPeerPaymentQuoteItemTypeToString();
    v41 = v27;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v42;
    v61[1] = v39;
    v60[1] = CFSTR("sendAmount");
    v60[2] = CFSTR("sendAmountCurrency");
    v61[2] = v40;
    v61[3] = v39;
    v60[3] = CFSTR("receiveAmount");
    v60[4] = CFSTR("receiveAmountCurrency");
    v61[4] = v40;
    v61[5] = v39;
    v60[5] = CFSTR("totalAmount");
    v60[6] = CFSTR("totalAmountCurrency");
    v61[6] = v40;
    v61[7] = CFSTR("0");
    v60[7] = CFSTR("fees");
    v60[8] = CFSTR("feesCurrency");
    v60[9] = CFSTR("countryCode");
    v61[8] = v17;
    v61[9] = v57;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v41;
    objc_msgSend(v41, "addObject:", v43);

  }
  v58[0] = CFSTR("currentBalance");
  v58[1] = CFSTR("currentBalanceCurrency");
  v59[0] = v53;
  v59[1] = v17;
  v58[2] = CFSTR("quoteItems");
  v58[3] = CFSTR("totalFees");
  v59[2] = v27;
  v59[3] = CFSTR("0");
  v58[4] = CFSTR("feesCurrency");
  v58[5] = CFSTR("totalReceiveAmount");
  v59[4] = v17;
  v59[5] = v51;
  v58[6] = CFSTR("totalReceiveAmountCurrency");
  v59[6] = v55;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EDE8]), "initWithDictionary:", v44);
  objc_msgSend(v45, "setRecipient:", v52);

  return v45;
}

- (void)_postNotificationWithRecipient:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  NPKPeerPaymentConversationManager *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__NPKPeerPaymentConversationManager__postNotificationWithRecipient_error___block_invoke;
  block[3] = &unk_24CFE8288;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__NPKPeerPaymentConversationManager__postNotificationWithRecipient_error___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = v2;
  v4 = a1[4];
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("kNPKPeerPaymentConversationManagerRecipient"));
  v5 = a1[5];
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kNPKPeerPaymentConversationManagerError"));
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[6];
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: %@: post Recipient Updated Notification notification", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("NPKPeerPaymentConversationManagerRecipientUpdatedNotification"), a1[6], v3);

}

- (id)_sharedPeerPaymentWebService
{
  return (id)objc_msgSend(MEMORY[0x24BE6EE00], "sharedService");
}

- (id)_newPeerPaymentController
{
  return -[NPKPeerPaymentConversationManager _newPeerPaymentControllerWithQueue:](self, "_newPeerPaymentControllerWithQueue:", MEMORY[0x24BDAC9B8]);
}

- (id)_newPeerPaymentControllerWithQueue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE6EDD0];
  v5 = a3;
  v6 = [v4 alloc];
  -[NPKPeerPaymentConversationManager _sharedPeerPaymentWebService](self, "_sharedPeerPaymentWebService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPeerPaymentWebService:queue:", v7, v5);

  return v8;
}

- (NPKPeerPaymentConversationManagerDelegate)delegate
{
  return (NPKPeerPaymentConversationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NPKPeerPaymentConversationContext)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
  objc_storeStrong((id *)&self->_conversationContext, a3);
}

- (NSString)currentRecipientAddressLookup
{
  return self->_currentRecipientAddressLookup;
}

- (void)setCurrentRecipientAddressLookup:(id)a3
{
  objc_storeStrong((id *)&self->_currentRecipientAddressLookup, a3);
}

- (PKPeerPaymentController)currentPeerPaymentController
{
  return (PKPeerPaymentController *)objc_loadWeakRetained((id *)&self->_currentPeerPaymentController);
}

- (void)setCurrentPeerPaymentController:(id)a3
{
  objc_storeWeak((id *)&self->_currentPeerPaymentController, a3);
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (void)setPeerPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_destroyWeak((id *)&self->_currentPeerPaymentController);
  objc_storeStrong((id *)&self->_currentRecipientAddressLookup, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
