@implementation CATIDSServiceConnectionInvitationOutbox

- (void)dealloc
{
  objc_super v3;

  -[CATIDSServiceConnectionInvitationOutbox cancelAllPowerAssertions](self, "cancelAllPowerAssertions");
  v3.receiver = self;
  v3.super_class = (Class)CATIDSServiceConnectionInvitationOutbox;
  -[CATIDSServiceConnectionInvitationOutbox dealloc](&v3, sel_dealloc);
}

- (CATIDSServiceConnectionInvitationOutbox)initWithAssertionProvider:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  CATIDSServiceConnectionInvitationOutbox *v9;
  CATIDSServiceConnectionInvitationOutbox *v10;
  uint64_t v11;
  NSMutableDictionary *mInFlightInvitationRequestsByInvitationID;
  uint64_t v13;
  NSMutableArray *mInvitationRequestQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CATIDSServiceConnectionInvitationOutbox;
  v9 = -[CATIDSServiceConnectionInvitationOutbox init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mAssertionProvider, a3);
    objc_storeStrong((id *)&v10->mWorkQueue, a4);
    v11 = objc_opt_new();
    mInFlightInvitationRequestsByInvitationID = v10->mInFlightInvitationRequestsByInvitationID;
    v10->mInFlightInvitationRequestsByInvitationID = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    mInvitationRequestQueue = v10->mInvitationRequestQueue;
    v10->mInvitationRequestQueue = (NSMutableArray *)v13;

  }
  return v10;
}

- (void)beginInvitationWithIdentifier:(id)a3 appleID:(id)a4 userInfo:(id)a5
{
  NSObject *mWorkQueue;
  id v9;
  id v10;
  id v11;
  CATIDSServiceConnectionInvitationRequest *v12;
  id v13;

  mWorkQueue = self->mWorkQueue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  CATAssertIsQueue(mWorkQueue);
  -[CATAssertionProviding acquireAssertion](self->mAssertionProvider, "acquireAssertion");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[CATIDSServiceConnectionInvitationRequest initWithInvitationIdentifier:appleID:assertion:userInfo:]([CATIDSServiceConnectionInvitationRequest alloc], "initWithInvitationIdentifier:appleID:assertion:userInfo:", v11, v10, v13, v9);

  -[NSMutableArray addObject:](self->mInvitationRequestQueue, "addObject:", v12);
  -[CATIDSServiceConnectionInvitationOutbox serviceInvitationQueue](self, "serviceInvitationQueue");

}

- (void)resume
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  self->mIsActive = 1;
  -[CATIDSServiceConnectionInvitationOutbox serviceInvitationQueue](self, "serviceInvitationQueue");
}

- (void)suspend
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  self->mIsActive = 0;
  -[CATIDSServiceConnectionInvitationOutbox cancelAllInvitations](self, "cancelAllInvitations");
}

- (void)receiveAcceptForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 messagingVersion:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInFlightInvitationRequestsByInvitationID, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CATAssertionProviding acquireAssertion](self->mAssertionProvider, "acquireAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATIDSServiceConnectionInvitationOutbox delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "connectionInvitationOutbox:wantsToAcknowledgeInvitation:connectionIdentifier:destinationAddress:", self, v10, v11, v12);

    -[CATIDSServiceConnectionInvitationOutbox delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connectionInvitationOutbox:foundConnection:destinationAppleID:destinationAddress:assertion:messagingVersion:userInfo:", self, v11, v17, v12, v14, a6, v18);

  }
  else
  {
    _CATLogGeneral_7();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_209592000, v19, OS_LOG_TYPE_INFO, "Found unexpected accept for invitation %{public}@ from %{public}@ with connection %{public}@", buf, 0x20u);
    }

  }
}

- (void)receiveRejectForInvitation:(id)a3 connectionIdentifier:(id)a4 senderAddress:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInFlightInvitationRequestsByInvitationID, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[CATIDSServiceConnectionInvitationOutbox delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "connectionInvitationOutbox:receivedARejectionFrom:connectionIdentifier:userInfo:error:", self, v16, v11, v17, v13);

  }
  else
  {
    _CATLogGeneral_7();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_209592000, v18, OS_LOG_TYPE_INFO, "Found unexpected rejection for invitation %{public}@ from %{public}@", (uint8_t *)&v19, 0x16u);
    }

  }
}

- (void)cancelInvitationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *mInvitationRequestQueue;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mInFlightInvitationRequestsByInvitationID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInFlightInvitationRequestsByInvitationID, "setObject:forKeyedSubscript:", 0, v4);
  mInvitationRequestQueue = self->mInvitationRequestQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__CATIDSServiceConnectionInvitationOutbox_cancelInvitationWithIdentifier___block_invoke;
  v9[3] = &unk_24C1C6288;
  v10 = v4;
  v8 = v4;
  -[NSMutableArray cat_removeFirstObjectMatching:](mInvitationRequestQueue, "cat_removeFirstObjectMatching:", v9);

}

uint64_t __74__CATIDSServiceConnectionInvitationOutbox_cancelInvitationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "invitationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)cancelAllInvitations
{
  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  -[CATIDSServiceConnectionInvitationOutbox cancelAllPowerAssertions](self, "cancelAllPowerAssertions");
  -[NSMutableArray removeAllObjects](self->mInvitationRequestQueue, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mInFlightInvitationRequestsByInvitationID, "removeAllObjects");
}

- (void)serviceInvitationQueue
{
  NSMutableDictionary *mInFlightInvitationRequestsByInvitationID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  CATAssertIsQueue((dispatch_queue_t)self->mWorkQueue);
  if (self->mIsActive)
  {
    if (-[NSMutableArray count](self->mInvitationRequestQueue, "count"))
    {
      -[NSMutableArray firstObject](self->mInvitationRequestQueue, "firstObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->mInvitationRequestQueue, "removeObjectAtIndex:", 0);
      mInFlightInvitationRequestsByInvitationID = self->mInFlightInvitationRequestsByInvitationID;
      objc_msgSend(v9, "invitationIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](mInFlightInvitationRequestsByInvitationID, "setObject:forKeyedSubscript:", v9, v4);

      -[CATIDSServiceConnectionInvitationOutbox delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invitationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectionInvitationOutbox:wantsToSendInvitation:destinationAppleID:userInfo:", self, v6, v7, v8);

      -[CATIDSServiceConnectionInvitationOutbox serviceInvitationQueue](self, "serviceInvitationQueue");
    }
  }
}

- (void)cancelAllPowerAssertions
{
  NSMutableArray *mInvitationRequestQueue;
  void *v3;
  id v4;

  mInvitationRequestQueue = self->mInvitationRequestQueue;
  -[NSMutableDictionary allValues](self->mInFlightInvitationRequestsByInvitationID, "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray arrayByAddingObjectsFromArray:](mInvitationRequestQueue, "arrayByAddingObjectsFromArray:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cat_forEach:", &__block_literal_global_20);

}

void __67__CATIDSServiceConnectionInvitationOutbox_cancelAllPowerAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "assertion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (CATIDSServiceConnectionInvitationOutboxDelegate)delegate
{
  return (CATIDSServiceConnectionInvitationOutboxDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mInvitationRequestQueue, 0);
  objc_storeStrong((id *)&self->mInFlightInvitationRequestsByInvitationID, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
  objc_storeStrong((id *)&self->mAssertionProvider, 0);
}

@end
