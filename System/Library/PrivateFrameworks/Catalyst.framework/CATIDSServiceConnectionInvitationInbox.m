@implementation CATIDSServiceConnectionInvitationInbox

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->mAcknowledgeTimersByInvitationID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CATIDSServiceConnectionInvitationInbox;
  -[CATIDSServiceConnectionInvitationInbox dealloc](&v8, sel_dealloc);
}

- (CATIDSServiceConnectionInvitationInbox)initWithTimerSource:(id)a3 assertionProvider:(id)a4 workQueue:(id)a5 acknowledgeTimeout:(double)a6
{
  id v11;
  id v12;
  id v13;
  CATIDSServiceConnectionInvitationInbox *v14;
  CATIDSServiceConnectionInvitationInbox *v15;
  uint64_t v16;
  NSMutableDictionary *mInvitationsByInvitationID;
  uint64_t v18;
  NSMutableDictionary *mAcknowledgeTimersByInvitationID;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CATIDSServiceConnectionInvitationInbox;
  v14 = -[CATIDSServiceConnectionInvitationInbox init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mTimerSource, a3);
    objc_storeStrong((id *)&v15->mAssertionProvider, a4);
    objc_storeStrong((id *)&v15->mWorkQueue, a5);
    v15->mAcknowledgeTimeout = a6;
    v16 = objc_opt_new();
    mInvitationsByInvitationID = v15->mInvitationsByInvitationID;
    v15->mInvitationsByInvitationID = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    mAcknowledgeTimersByInvitationID = v15->mAcknowledgeTimersByInvitationID;
    v15->mAcknowledgeTimersByInvitationID = (NSMutableDictionary *)v18;

  }
  return v15;
}

- (void)receiveInvitationWithIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  CATIDSServiceConnectionInvitation *v17;
  OS_dispatch_queue *v18;
  void *v19;
  void *v20;
  OS_dispatch_queue *v21;
  id v22;
  id v23;
  CATIDSServiceConnectionInvitation *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  OS_dispatch_queue *v30;
  id v31;
  id v32;
  CATIDSServiceConnectionInvitation *v33;
  id v34;
  id v35;
  id v36;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[CATAssertionProviding acquireAssertion](self->mAssertionProvider, "acquireAssertion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v14;
  v28 = v15;
  v17 = -[CATIDSServiceConnectionInvitation initWithSenderAppleID:senderAddress:assertion:messagingVersion:userInfo:]([CATIDSServiceConnectionInvitation alloc], "initWithSenderAppleID:senderAddress:assertion:messagingVersion:userInfo:", v13, v14, v16, a6, v15);
  objc_initWeak(&location, self);
  v18 = self->mWorkQueue;
  -[CATIDSServiceConnectionInvitationInbox delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnectionInvitation connectionIdentifier](v17, "connectionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke;
  v29[3] = &unk_24C1C5AB0;
  v21 = v18;
  v30 = v21;
  objc_copyWeak(&v36, &location);
  v22 = v16;
  v31 = v22;
  v23 = v12;
  v32 = v23;
  v24 = v17;
  v33 = v24;
  v25 = v13;
  v34 = v25;
  v26 = v27;
  v35 = v26;
  objc_msgSend(v19, "connectionInvitationInbox:shouldConnectToAppleID:connectionIdentifier:userInfo:responseHandler:", self, v25, v20, v28, v29);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;

  v5 = a3;
  CATAssertIsQueue(*(dispatch_queue_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v8 = (void *)WeakRetained[1];
      objc_msgSend((id)objc_opt_class(), "acknowledgeTimerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *((double *)v7 + 4);
      v11 = *(_QWORD *)(a1 + 32);
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke_2;
      v22 = &unk_24C1C5A88;
      objc_copyWeak(&v24, (id *)(a1 + 80));
      v23 = *(id *)(a1 + 48);
      objc_msgSend(v8, "scheduleOneShotTimerWithIdentifier:timeInterval:queue:fireHandler:", v9, v11, &v19, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*((id *)v7 + 5), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v19, v20, v21, v22);
      objc_msgSend(*((id *)v7 + 6), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 48));
      objc_msgSend(v7, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "connectionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "connectionInvitationInbox:wantsToAcceptInvitation:connectionIdentifier:destinationAddress:", v7, v14, v15, *(_QWORD *)(a1 + 72));

      objc_destroyWeak(&v24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "cancel");
      objc_msgSend(v7, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "connectionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "connectionInvitationInbox:rejectedInvitation:connectionIdentifier:appleID:address:error:", v7, v17, v18, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5);

    }
  }

}

void __128__CATIDSServiceConnectionInvitationInbox_receiveInvitationWithIdentifier_senderAppleID_senderAddress_messagingVersion_userInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "acknowledgeTimerFiredWithInvitationIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)receiveAcknowledgeForInvitationIdentifier:(id)a3 connectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationsByInvitationID, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    _CATLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CATIDSServiceConnectionInvitationInbox receiveAcknowledgeForInvitationIdentifier:connectionIdentifier:].cold.1((uint64_t)v6, (uint64_t)v7, v19);
    goto LABEL_8;
  }
  objc_msgSend(v8, "connectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v7);

  if ((v11 & 1) == 0)
  {
    _CATLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "connectionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v6;
      v23 = 2114;
      v24 = v7;
      v25 = 2114;
      v26 = v20;
      _os_log_error_impl(&dword_209592000, v19, OS_LOG_TYPE_ERROR, "Found mismatch connection identifier for invitation %{public}@. Received %{public}@ but expected %{public}@", buf, 0x20u);

    }
LABEL_8:

    goto LABEL_9;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->mAcknowledgeTimersByInvitationID, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mAcknowledgeTimersByInvitationID, "setObject:forKeyedSubscript:", 0, v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInvitationsByInvitationID, "setObject:forKeyedSubscript:", 0, v6);
  -[CATIDSServiceConnectionInvitationInbox delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "senderAppleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "senderAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "messagingVersion");
  objc_msgSend(v9, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectionInvitationInbox:foundConection:senderAppleID:senderAddress:assertion:messagingVersion:userInfo:", self, v7, v14, v15, v16, v17, v18);

LABEL_9:
}

- (void)acknowledgeTimerFiredWithInvitationIdentifier:(id)a3
{
  NSObject *mWorkQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  mWorkQueue = self->mWorkQueue;
  v5 = a3;
  CATAssertIsQueue(mWorkQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInvitationsByInvitationID, "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mAcknowledgeTimersByInvitationID, "setObject:forKeyedSubscript:", 0, v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInvitationsByInvitationID, "setObject:forKeyedSubscript:", 0, v5);
  -[CATIDSServiceConnectionInvitationInbox delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "senderAppleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionInvitatioInbox:timeoutOutForInvitation:connectionIdentifier:senderAppleID:userInfo:", self, v5, v8, v9, v10);

}

+ (id)acknowledgeTimerIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-AcknowledgeTimer"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CATIDSServiceConnectionInvitationInboxDelegate)delegate
{
  return (CATIDSServiceConnectionInvitationInboxDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mAcknowledgeTimersByInvitationID, 0);
  objc_storeStrong((id *)&self->mInvitationsByInvitationID, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mAssertionProvider, 0);
  objc_storeStrong((id *)&self->mTimerSource, 0);
}

- (void)receiveAcknowledgeForInvitationIdentifier:(os_log_t)log connectionIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_209592000, log, OS_LOG_TYPE_ERROR, "Found acknowledge for unexpected invitation %{public}@ with connection identifier %{public}@.", (uint8_t *)&v3, 0x16u);
}

@end
