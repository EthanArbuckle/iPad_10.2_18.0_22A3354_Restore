@implementation CATIDSServiceConnectionTerminal

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 timerSource:(id)a5 workQueue:(id)a6 delegateQueue:(id)a7 sourceAppleID:(id)a8 connectionConfiguration:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  CATIDSServiceConnectionTerminal *v20;
  CATIDSServiceConnectionTerminal *v21;
  uint64_t v22;
  NSString *mSourceAppleID;
  CATIDSServiceConnectionInvitationInbox *v24;
  CATTimerSource *mTimerSource;
  uint64_t v26;
  CATIDSServiceConnectionInvitationInbox *mInvitationInbox;
  CATIDSServiceConnectionInvitationOutbox *v28;
  CATIDSServiceConnectionInvitationOutbox *mInvitationOutbox;
  uint64_t v30;
  NSHashTable *mBroadcastHandlers;
  void *v33;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v16 = a4;
  v36 = a5;
  v17 = a6;
  v35 = a7;
  v18 = a8;
  v19 = a9;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATIDSServiceConnectionTerminal.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAppleID"));

  }
  v38.receiver = self;
  v38.super_class = (Class)CATIDSServiceConnectionTerminal;
  v20 = -[CATIDSServiceConnectionTerminal init](&v38, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->mIDSPrimitives, a3);
    objc_storeStrong((id *)&v21->mTimerSource, a5);
    objc_storeStrong((id *)&v21->mWorkQueue, a6);
    objc_storeStrong((id *)&v21->mDelegateQueue, a7);
    v22 = objc_msgSend(v18, "copy");
    mSourceAppleID = v21->mSourceAppleID;
    v21->mSourceAppleID = (NSString *)v22;

    objc_storeStrong((id *)&v21->mConnectionConfiguration, a9);
    v24 = [CATIDSServiceConnectionInvitationInbox alloc];
    mTimerSource = v21->mTimerSource;
    objc_msgSend(v19, "invitationAcknowledgeTimeout");
    v26 = -[CATIDSServiceConnectionInvitationInbox initWithTimerSource:assertionProvider:workQueue:acknowledgeTimeout:](v24, "initWithTimerSource:assertionProvider:workQueue:acknowledgeTimeout:", mTimerSource, v16, v17);
    mInvitationInbox = v21->mInvitationInbox;
    v21->mInvitationInbox = (CATIDSServiceConnectionInvitationInbox *)v26;

    v28 = -[CATIDSServiceConnectionInvitationOutbox initWithAssertionProvider:workQueue:]([CATIDSServiceConnectionInvitationOutbox alloc], "initWithAssertionProvider:workQueue:", v16, v17);
    mInvitationOutbox = v21->mInvitationOutbox;
    v21->mInvitationOutbox = v28;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v30 = objc_claimAutoreleasedReturnValue();
    mBroadcastHandlers = v21->mBroadcastHandlers;
    v21->mBroadcastHandlers = (NSHashTable *)v30;

    -[CATIDSServiceConnectionInvitationInbox setDelegate:](v21->mInvitationInbox, "setDelegate:", v21);
    -[CATIDSServiceConnectionInvitationOutbox setDelegate:](v21->mInvitationOutbox, "setDelegate:", v21);
    v21->mIsActive = 0;
  }

  return v21;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 networkPowerPrimitives:(id)a4 sourceAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  CATNetworkPowerPrimitivesBackedAssertionProvider *v11;
  CATIDSServiceConnectionTerminal *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CATNetworkPowerPrimitivesBackedAssertionProvider initWithNetworkPowerPrimitives:]([CATNetworkPowerPrimitivesBackedAssertionProvider alloc], "initWithNetworkPowerPrimitives:", v9);

  v12 = -[CATIDSServiceConnectionTerminal initWithIDSPrimitives:assertionProvider:sourceAppleID:](self, "initWithIDSPrimitives:assertionProvider:sourceAppleID:", v10, v11, v8);
  return v12;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CATIDSServiceConnectionTerminal *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[CATIDSServiceConnectionTerminal initWithIDSPrimitives:assertionProvider:sourceAppleID:connectionConfiguration:](self, "initWithIDSPrimitives:assertionProvider:sourceAppleID:connectionConfiguration:", v10, v9, v8, v11);

  return v12;
}

- (CATIDSServiceConnectionTerminal)initWithIDSPrimitives:(id)a3 assertionProvider:(id)a4 sourceAppleID:(id)a5 connectionConfiguration:(id)a6
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  dispatch_queue_t v19;
  void *v20;
  void *v21;
  CATIDSServiceConnectionTerminal *v22;

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (void *)MEMORY[0x24BDD1880];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Catalyst.IDSServiceConnection.%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_retainAutorelease(v17);
  v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), 0);
  CATGetCatalystQueue();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v22 = -[CATIDSServiceConnectionTerminal initWithIDSPrimitives:assertionProvider:timerSource:workQueue:delegateQueue:sourceAppleID:connectionConfiguration:](self, "initWithIDSPrimitives:assertionProvider:timerSource:workQueue:delegateQueue:sourceAppleID:connectionConfiguration:", v15, v14, v21, v19, v20, v13, v12);

  return v22;
}

- (void)resume
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *v4;
  uint64_t v5;
  OS_dispatch_queue *v6;
  _QWORD *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  _QWORD v10[5];
  OS_dispatch_queue *v11;
  OS_dispatch_queue *v12;
  id v13;
  id location;
  _QWORD block[4];
  id v16;

  objc_initWeak(&location, self);
  v3 = self->mWorkQueue;
  v4 = self->mDelegateQueue;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke;
  v10[3] = &unk_24C1C6130;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_copyWeak(&v13, &location);
  v12 = v4;
  v7 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v16 = v7;
  v8 = v6;
  v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88))
  {
    _CATLogGeneral_5();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v3;
      _os_log_impl(&dword_209592000, v2, OS_LOG_TYPE_INFO, "%{public}@ resuming", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_15;
    v10[3] = &unk_24C1C60E0;
    v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_3;
    v6[3] = &unk_24C1C6108;
    v7 = *(id *)(a1 + 40);
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "addMessageHandler:completion:", v10, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);

  }
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_2;
  v17[3] = &unk_24C1C60B8;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v23 = v12;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v13, block);

  objc_destroyWeak(&v21);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "processMessage:senderAppleID:senderAddress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4;
  v13[3] = &unk_24C1C60B8;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 40);
  v9 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v19 = v9;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, block);

  objc_destroyWeak(&v17);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 88))
    {
      v4 = (id *)(a1 + 40);
      if (*(_QWORD *)(a1 + 40))
      {
        _CATLogGeneral_5();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4_cold_1((uint64_t)v3, v4, v5);
      }
      else
      {
        objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 32));
        objc_msgSend(v3[8], "resume");
        v6 = MEMORY[0x24BDAC760];
        v7 = *(void **)(a1 + 48);
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __41__CATIDSServiceConnectionTerminal_resume__block_invoke_18;
        v9[3] = &unk_24C1C5A60;
        v9[4] = v3;
        v8 = v9;
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __CATPerformBlock_block_invoke_12;
        block[3] = &unk_24C1C5998;
        v11 = v8;
        v5 = v7;
        dispatch_async(v5, block);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cancel");
    }
  }

}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_18(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceConnectionTerminalDidResume:", *(_QWORD *)(a1 + 32));

}

- (void)suspend
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;

  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__CATIDSServiceConnectionTerminal_suspend__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

void __42__CATIDSServiceConnectionTerminal_suspend__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88))
  {
    _CATLogGeneral_5();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_209592000, v2, OS_LOG_TYPE_INFO, "%{public}@ suspending", (uint8_t *)&v6, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cancel");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "suspend");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

  }
}

- (id)inviteAppleIDToConnect:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *mWorkQueue;
  id v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _BYTE buf[24];
  void *v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CATLogGeneral_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v25 = v7;
    _os_log_impl(&dword_209592000, v8, OS_LOG_TYPE_INFO, "%{public}@ inviting appleID %{public}@ with userInfo %{public}@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  mWorkQueue = self->mWorkQueue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__CATIDSServiceConnectionTerminal_inviteAppleIDToConnect_userInfo___block_invoke;
  v20[3] = &unk_24C1C6158;
  v20[4] = self;
  v12 = v9;
  v21 = v12;
  v22 = v6;
  v23 = v7;
  v13 = v20;
  *(_QWORD *)buf = v10;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __CATPerformBlock_block_invoke_12;
  v25 = &unk_24C1C5998;
  v26 = v13;
  v14 = mWorkQueue;
  v15 = v7;
  v16 = v6;
  dispatch_async(v14, buf);

  v17 = v23;
  v18 = v12;

  return v18;
}

uint64_t __67__CATIDSServiceConnectionTerminal_inviteAppleIDToConnect_userInfo___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 64), "beginInvitationWithIdentifier:appleID:userInfo:", a1[5], a1[6], a1[7]);
}

- (void)cancelInvitationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *mWorkQueue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _BYTE buf[24];
  void *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CATLogGeneral_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_209592000, v5, OS_LOG_TYPE_INFO, "%{public}@ canceling invitation with identifier %{public}@", buf, 0x16u);
  }

  mWorkQueue = self->mWorkQueue;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__CATIDSServiceConnectionTerminal_cancelInvitationWithIdentifier___block_invoke;
  v11[3] = &unk_24C1C5C00;
  v11[4] = self;
  v12 = v4;
  v8 = v11;
  *(_QWORD *)buf = v7;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __CATPerformBlock_block_invoke_12;
  v14 = &unk_24C1C5998;
  v15 = v8;
  v9 = mWorkQueue;
  v10 = v4;
  dispatch_async(v9, buf);

}

uint64_t __66__CATIDSServiceConnectionTerminal_cancelInvitationWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cancelInvitationWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)cancelAllInvitations
{
  NSObject *v3;
  uint64_t v4;
  OS_dispatch_queue *mWorkQueue;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[5];
  __int128 buf;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _CATLogGeneral_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_209592000, v3, OS_LOG_TYPE_INFO, "%{public}@ canceling all invitations", (uint8_t *)&buf, 0xCu);
  }

  v4 = MEMORY[0x24BDAC760];
  mWorkQueue = self->mWorkQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__CATIDSServiceConnectionTerminal_cancelAllInvitations__block_invoke;
  v8[3] = &unk_24C1C5A60;
  v8[4] = self;
  v6 = v8;
  *(_QWORD *)&buf = v4;
  *((_QWORD *)&buf + 1) = 3221225472;
  v10 = __CATPerformBlock_block_invoke_12;
  v11 = &unk_24C1C5998;
  v12 = v6;
  v7 = mWorkQueue;
  dispatch_async(v7, &buf);

}

uint64_t __55__CATIDSServiceConnectionTerminal_cancelAllInvitations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cancelAllInvitations");
}

- (void)connectionInvitationInbox:(id)a3 shouldConnectToAppleID:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 responseHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CATIDSServiceConnectionMetadata *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *mDelegateQueue;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  id v21;
  OS_dispatch_queue *v22;
  CATIDSServiceConnectionMetadata *v23;
  _QWORD v24[5];
  CATIDSServiceConnectionMetadata *v25;
  OS_dispatch_queue *v26;
  id v27;
  _QWORD block[4];
  id v29;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = -[CATIDSServiceConnectionMetadata initWithConnectionIdentifier:destinationAppleID:userInfo:]([CATIDSServiceConnectionMetadata alloc], "initWithConnectionIdentifier:destinationAppleID:userInfo:", v13, v14, v12);

  v16 = self->mWorkQueue;
  mDelegateQueue = self->mDelegateQueue;
  v18 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke;
  v24[3] = &unk_24C1C61D0;
  v24[4] = self;
  v25 = v15;
  v26 = v16;
  v27 = v11;
  v19 = v24;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v29 = v19;
  v20 = mDelegateQueue;
  v21 = v11;
  v22 = v16;
  v23 = v15;
  dispatch_async(v20, block);

}

void __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_2;
  v5[3] = &unk_24C1C61A8;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "serviceConnectionTerminal:shouldEstablishConnection:responseHandler:", v3, v4, v5);

}

void __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD block[4];
  id v17;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_3;
  v12[3] = &unk_24C1C6180;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v15 = a2;
  v13 = v5;
  v14 = v8;
  v9 = v12;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v17 = v9;
  v10 = v7;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __130__CATIDSServiceConnectionTerminal_connectionInvitationInbox_shouldConnectToAppleID_connectionIdentifier_userInfo_responseHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)connectionInvitationInbox:(id)a3 wantsToAcceptInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6
{
  id v9;
  id v10;
  id v11;
  CATInitializingIDSServiceConnectionContentAccept *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[CATInitializingIDSServiceConnectionContentAccept initWithConnectionIdentifier:]([CATInitializingIDSServiceConnectionContentAccept alloc], "initWithConnectionIdentifier:", v10);

  -[CATIDSServiceConnectionTerminal sendContent:toAddress:forInvitation:](self, "sendContent:toAddress:forInvitation:", v12, v9, v11);
}

- (void)connectionInvitatioInbox:(id)a3 timeoutOutForInvitation:(id)a4 connectionIdentifier:(id)a5 senderAppleID:(id)a6 userInfo:(id)a7
{
  id v10;
  id v11;
  id v12;
  CATIDSServiceConnectionMetadata *v13;
  OS_dispatch_queue *mDelegateQueue;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  CATIDSServiceConnectionMetadata *v18;
  _QWORD v19[5];
  CATIDSServiceConnectionMetadata *v20;
  _QWORD block[4];
  id v22;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = -[CATIDSServiceConnectionMetadata initWithConnectionIdentifier:destinationAppleID:userInfo:]([CATIDSServiceConnectionMetadata alloc], "initWithConnectionIdentifier:destinationAppleID:userInfo:", v12, v11, v10);

  mDelegateQueue = self->mDelegateQueue;
  v15 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __128__CATIDSServiceConnectionTerminal_connectionInvitatioInbox_timeoutOutForInvitation_connectionIdentifier_senderAppleID_userInfo___block_invoke;
  v19[3] = &unk_24C1C5C00;
  v19[4] = self;
  v20 = v13;
  v16 = v19;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v22 = v16;
  v17 = mDelegateQueue;
  v18 = v13;
  dispatch_async(v17, block);

}

void __128__CATIDSServiceConnectionTerminal_connectionInvitatioInbox_timeoutOutForInvitation_connectionIdentifier_senderAppleID_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceConnectionTerminal:timedOutOnInvitationWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionInvitationInbox:(id)a3 foundConection:(id)a4 senderAppleID:(id)a5 senderAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CATIDSServiceConnectionMetadata *v20;
  void *v21;
  void *v22;
  CATIDSServiceConnectionCapabilities *v23;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v23 = -[CATIDSServiceConnectionCapabilities initWithMessagingVersion:]([CATIDSServiceConnectionCapabilities alloc], "initWithMessagingVersion:", a8);
  v20 = -[CATIDSServiceConnectionMetadata initWithConnectionIdentifier:destinationAppleID:userInfo:]([CATIDSServiceConnectionMetadata alloc], "initWithConnectionIdentifier:destinationAppleID:userInfo:", v19, v18, v15);

  +[CATIDSServiceConnection connectionWithMetadata:configuration:capabilities:IDSPrimitives:messageBroadcaster:timerSource:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:](CATIDSServiceConnection, "connectionWithMetadata:configuration:capabilities:IDSPrimitives:messageBroadcaster:timerSource:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:", v20, self->mConnectionConfiguration, v23, self->mIDSPrimitives, self, self->mTimerSource, v16, self->mWorkQueue, self->mDelegateQueue, v17, self->mSourceAppleID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATIDSServiceConnectionTerminal delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "serviceConnectionTerminal:establishedConnection:", self, v21);

}

- (void)connectionInvitationInbox:(id)a3 rejectedInvitation:(id)a4 connectionIdentifier:(id)a5 appleID:(id)a6 address:(id)a7 error:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  CATInitializingIDSServiceConnectionContentReject *v16;

  v12 = a8;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = -[CATInitializingIDSServiceConnectionContentReject initWithConnectionIdentifier:error:]([CATInitializingIDSServiceConnectionContentReject alloc], "initWithConnectionIdentifier:error:", v14, v12);

  -[CATIDSServiceConnectionTerminal sendContent:toAddress:forInvitation:](self, "sendContent:toAddress:forInvitation:", v16, v13, v15);
}

- (void)connectionInvitationOutbox:(id)a3 wantsToSendInvitation:(id)a4 destinationAppleID:(id)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CATInitializingIDSServiceConnectionContentInvite *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = -[CATInitializingIDSServiceConnectionContentInvite initWithUserInfo:]([CATInitializingIDSServiceConnectionContentInvite alloc], "initWithUserInfo:", v9);

  -[CATIDSPrimitives addressForAppleID:](self->mIDSPrimitives, "addressForAppleID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATIDSServiceConnectionTerminal sendContent:toAddress:forInvitation:](self, "sendContent:toAddress:forInvitation:", v13, v12, v11);
}

- (void)connectionInvitationOutbox:(id)a3 wantsToAcknowledgeInvitation:(id)a4 connectionIdentifier:(id)a5 destinationAddress:(id)a6
{
  id v9;
  id v10;
  id v11;
  CATInitializingIDSServiceConnectionContentAcknowledge *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[CATInitializingIDSServiceConnectionContentAcknowledge initWithConnectionIdentifier:]([CATInitializingIDSServiceConnectionContentAcknowledge alloc], "initWithConnectionIdentifier:", v10);

  -[CATIDSServiceConnectionTerminal sendContent:toAddress:forInvitation:](self, "sendContent:toAddress:forInvitation:", v12, v9, v11);
}

- (void)connectionInvitationOutbox:(id)a3 foundConnection:(id)a4 destinationAppleID:(id)a5 destinationAddress:(id)a6 assertion:(id)a7 messagingVersion:(unint64_t)a8 userInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CATIDSServiceConnectionCapabilities *v20;
  CATIDSServiceConnectionMetadata *v21;
  void *v22;
  OS_dispatch_queue *mDelegateQueue;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[4];
  id v31;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = -[CATIDSServiceConnectionCapabilities initWithMessagingVersion:]([CATIDSServiceConnectionCapabilities alloc], "initWithMessagingVersion:", a8);
  v21 = -[CATIDSServiceConnectionMetadata initWithConnectionIdentifier:destinationAppleID:userInfo:]([CATIDSServiceConnectionMetadata alloc], "initWithConnectionIdentifier:destinationAppleID:userInfo:", v19, v18, v15);

  +[CATIDSServiceConnection connectionWithMetadata:configuration:capabilities:IDSPrimitives:messageBroadcaster:timerSource:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:](CATIDSServiceConnection, "connectionWithMetadata:configuration:capabilities:IDSPrimitives:messageBroadcaster:timerSource:assertion:workQueue:delegateQueue:destinationAddress:sourceAppleID:", v21, self->mConnectionConfiguration, v20, self->mIDSPrimitives, self, self->mTimerSource, v16, self->mWorkQueue, self->mDelegateQueue, v17, self->mSourceAppleID);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  mDelegateQueue = self->mDelegateQueue;
  v24 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __152__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_foundConnection_destinationAppleID_destinationAddress_assertion_messagingVersion_userInfo___block_invoke;
  v28[3] = &unk_24C1C5C00;
  v28[4] = self;
  v29 = v22;
  v25 = v28;
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v31 = v25;
  v26 = mDelegateQueue;
  v27 = v22;
  dispatch_async(v26, block);

}

void __152__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_foundConnection_destinationAppleID_destinationAddress_assertion_messagingVersion_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceConnectionTerminal:establishedConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionInvitationOutbox:(id)a3 receivedARejectionFrom:(id)a4 connectionIdentifier:(id)a5 userInfo:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  CATIDSServiceConnectionMetadata *v15;
  OS_dispatch_queue *mDelegateQueue;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  CATIDSServiceConnectionMetadata *v21;
  _QWORD v22[5];
  CATIDSServiceConnectionMetadata *v23;
  id v24;
  _QWORD block[4];
  id v26;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = -[CATIDSServiceConnectionMetadata initWithConnectionIdentifier:destinationAppleID:userInfo:]([CATIDSServiceConnectionMetadata alloc], "initWithConnectionIdentifier:destinationAppleID:userInfo:", v13, v14, v12);

  mDelegateQueue = self->mDelegateQueue;
  v17 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __121__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_receivedARejectionFrom_connectionIdentifier_userInfo_error___block_invoke;
  v22[3] = &unk_24C1C5A10;
  v22[4] = self;
  v23 = v15;
  v24 = v11;
  v18 = v22;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_12;
  block[3] = &unk_24C1C5998;
  v26 = v18;
  v19 = mDelegateQueue;
  v20 = v11;
  v21 = v15;
  dispatch_async(v19, block);

}

void __121__CATIDSServiceConnectionTerminal_connectionInvitationOutbox_receivedARejectionFrom_connectionIdentifier_userInfo_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceConnectionTerminal:receivedRejectionWithMetadata:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)addBroadcastHandler:(id)a3
{
  -[NSHashTable addObject:](self->mBroadcastHandlers, "addObject:", a3);
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  OS_dispatch_queue *v17;
  uint64_t v18;
  OS_dispatch_queue *mDelegateQueue;
  _QWORD *v20;
  NSObject *v21;
  OS_dispatch_queue *v22;
  _QWORD v23[5];
  id v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (self->mIsActive)
  {
    v11 = (void *)-[NSHashTable copy](self->mBroadcastHandlers, "copy");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v11, "objectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "processMessage:senderAppleID:senderAddress:", v8, v9, v10);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v14);
    }

    v17 = self->mWorkQueue;
    v18 = MEMORY[0x24BDAC760];
    mDelegateQueue = self->mDelegateQueue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke;
    v23[3] = &unk_24C1C61F8;
    v23[4] = self;
    v24 = v9;
    v25 = v17;
    v26 = v8;
    v27 = v10;
    v20 = v23;
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_12;
    block[3] = &unk_24C1C5998;
    v33 = v20;
    v21 = mDelegateQueue;
    v22 = v17;
    dispatch_async(v21, block);

  }
}

void __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceConnectionTerminal:shouldTrustAppleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke_2;
    v10[3] = &unk_24C1C6158;
    v5 = *(void **)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 40);
    v8 = v10;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_12;
    block[3] = &unk_24C1C5998;
    v16 = v8;
    v9 = v5;
    dispatch_async(v9, block);

  }
}

void __78__CATIDSServiceConnectionTerminal_processMessage_senderAppleID_senderAddress___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  +[CATIDSMessagePayload instanceWithDictionary:](CATIDSMessagePayload, "instanceWithDictionary:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v61 = v2;
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "messageType");

    v2 = v61;
    if (v4 == 101)
    {
      objc_msgSend(v61, "message");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("CATIDSServiceConnectionTerminal.m"), 461, CFSTR("expected %@, got %@"), v28, v30);

      }
      objc_msgSend(v5, "content");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "contentType");

      switch(v7)
      {
        case 1:
          v8 = *(void **)(a1[5] + 56);
          objc_msgSend(v5, "invitationIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = a1 + 6;
          v10 = a1[6];
          v11 = v12[1];
          objc_msgSend(v61, "metadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "messagingVersion");
          objc_msgSend(v5, "content");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("CATIDSServiceConnectionTerminal.m"), 477, CFSTR("expected %@, got %@"), v56, v33);

          }
          objc_msgSend(v15, "userInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "receiveInvitationWithIdentifier:senderAppleID:senderAddress:messagingVersion:userInfo:", v9, v11, v10, v14, v16);

          goto LABEL_20;
        case 2:
          v17 = *(void **)(a1[5] + 64);
          objc_msgSend(v5, "invitationIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "content");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("CATIDSServiceConnectionTerminal.m"), 466, CFSTR("expected %@, got %@"), v37, v39);

          }
          objc_msgSend(v13, "connectionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = a1[6];
          objc_msgSend(v61, "metadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "receiveAcceptForInvitation:connectionIdentifier:senderAddress:messagingVersion:", v9, v15, v18, objc_msgSend(v19, "messagingVersion"));

          goto LABEL_20;
        case 3:
          v20 = *(void **)(a1[5] + 64);
          objc_msgSend(v5, "invitationIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "content");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("CATIDSServiceConnectionTerminal.m"), 489, CFSTR("expected %@, got %@"), v43, v45);

          }
          objc_msgSend(v13, "connectionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = a1[6];
          objc_msgSend(v5, "content");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("CATIDSServiceConnectionTerminal.m"), 492, CFSTR("expected %@, got %@"), v58, v49);

          }
          objc_msgSend(v22, "error");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "receiveRejectForInvitation:connectionIdentifier:senderAddress:error:", v9, v15, v21, v23);

          goto LABEL_20;
        case 4:
          v24 = *(void **)(a1[5] + 56);
          objc_msgSend(v5, "invitationIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "content");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionTerminal processMessage:senderAppleID:senderAddress:]_block_invoke_2");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (objc_class *)objc_opt_class();
            NSStringFromClass(v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (objc_class *)objc_opt_class();
            NSStringFromClass(v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("CATIDSServiceConnectionTerminal.m"), 483, CFSTR("expected %@, got %@"), v53, v55);

          }
          objc_msgSend(v13, "connectionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "receiveAcknowledgeForInvitationIdentifier:connectionIdentifier:", v9, v15);
LABEL_20:

          break;
        default:
          break;
      }

      v2 = v61;
    }
  }

}

- (void)sendContent:(id)a3 toAddress:(id)a4 forInvitation:(id)a5
{
  id v8;
  id v9;
  id v10;
  CATInitializingServiceConnectionIDSMessage *v11;
  CATIDSMessagePayload *v12;
  void *v13;
  void *v14;
  CATIDSPrimitives *mIDSPrimitives;
  NSString *mSourceAppleID;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CATInitializingServiceConnectionIDSMessage initWithInvitationIdentifier:content:]([CATInitializingServiceConnectionIDSMessage alloc], "initWithInvitationIdentifier:content:", v9, v10);

  v12 = -[CATIDSMessagePayload initWithMessage:]([CATIDSMessagePayload alloc], "initWithMessage:", v11);
  -[CATIDSMessagePayload dictionaryValue](v12, "dictionaryValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setDeliveryTimeout:", &unk_24C1D8E18);
  mIDSPrimitives = self->mIDSPrimitives;
  mSourceAppleID = self->mSourceAppleID;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke;
  v19[3] = &unk_24C1C6220;
  v19[4] = self;
  v20 = v8;
  v21 = v13;
  v17 = v13;
  v18 = v8;
  -[CATIDSPrimitives sendMessage:toAddress:fromID:options:completion:](mIDSPrimitives, "sendMessage:toAddress:fromID:options:completion:", v17, v18, mSourceAppleID, v14, v19);

}

void __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CATLogGeneral_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke_cold_1(a1, v3, v4);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p { sourceAppleID = %@ }>"), objc_opt_class(), self, self->mSourceAppleID);
}

- (CATIDSServiceConnectionTerminalDelegate)delegate
{
  return (CATIDSServiceConnectionTerminalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mMessageSubscription, 0);
  objc_storeStrong((id *)&self->mBroadcastHandlers, 0);
  objc_storeStrong((id *)&self->mInvitationOutbox, 0);
  objc_storeStrong((id *)&self->mInvitationInbox, 0);
  objc_storeStrong((id *)&self->mConnectionConfiguration, 0);
  objc_storeStrong((id *)&self->mSourceAppleID, 0);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
  objc_storeStrong((id *)&self->mIDSPrimitives, 0);
}

void __41__CATIDSServiceConnectionTerminal_resume__block_invoke_4_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_209592000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to begin listeneing for IDS messages. Error: %{public}@.", (uint8_t *)&v6, 0x16u);

}

void __71__CATIDSServiceConnectionTerminal_sendContent_toAddress_forInvitation___block_invoke_cold_1(_QWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(a2, "verboseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  v12 = 2114;
  v13 = v6;
  v14 = 2114;
  v15 = v7;
  _os_log_error_impl(&dword_209592000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to send IDS message %{public}@ to address %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x2Au);

}

@end
