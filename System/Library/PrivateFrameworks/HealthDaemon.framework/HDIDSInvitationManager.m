@implementation HDIDSInvitationManager

- (HDIDSInvitationManager)initWithServiceIdentifier:(id)a3 messageClass:(Class)a4 schema:(id)a5
{
  id v8;
  id v9;
  HDIDSInvitationManager *v10;
  HDIDSInvitationManager *v11;
  uint64_t v12;
  NSString *schema;
  uint64_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  OS_dispatch_queue *IDSDelegateQueue;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDIDSInvitationManager;
  v10 = -[HDIDSInvitationManager init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageClass, a4);
    v12 = objc_msgSend(v9, "copy");
    schema = v11->_schema;
    v11->_schema = (NSString *)v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    IDSDelegateQueue = v11->_IDSDelegateQueue;
    v11->_IDSDelegateQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34320]), "initWithServiceIdentifier:", v8);
    -[HDIDSInvitationManager setInvitationManager:](v11, "setInvitationManager:", v18);

    -[HDIDSInvitationManager invitationManager](v11, "invitationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:queue:", v11, v11->_IDSDelegateQueue);

  }
  return v11;
}

- (void)sendInvitationToIdentifier:(id)a3 expirationDate:(id)a4 codableObject:(id)a5 serverAcknowledgedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  HDIDSInvitationManager *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__HDIDSInvitationManager_sendInvitationToIdentifier_expirationDate_codableObject_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E6CF74B0;
  v20 = v12;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v24 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v12;
  dispatch_sync(queue, block);

}

void __106__HDIDSInvitationManager_sendInvitationToIdentifier_expirationDate_codableObject_serverAcknowledgedBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("ObjectDataKey");
  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D342D0]), "initWithDictionary:schema:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(*(id *)(a1 + 40), "invitationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendInvitationToDestination:expirationDate:context:serverAcknowledgedBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, *(_QWORD *)(a1 + 64));

}

- (void)rescindInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1[4], "invitationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2;
  v10[3] = &unk_1E6D0EEE0;
  v11 = a1[5];
  objc_msgSend(v3, "hk_anyObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[4], "invitationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3;
    v8[3] = &unk_1E6CF7CA8;
    v9 = a1[6];
    objc_msgSend(v6, "cancelInvitation:serverAcknowledgedBlock:", v5, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Invitation not found"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();

  }
}

uint64_t __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __76__HDIDSInvitationManager_rescindInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)acceptInvitationWithUUID:(id)a3 codableObject:(id)a4 serverAcknowledgedBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E6CED498;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(queue, block);

}

void __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "invitationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_2;
  v12[3] = &unk_1E6D0EF08;
  v13 = a1[5];
  objc_msgSend(v3, "hk_anyObjectPassingTest:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = CFSTR("ObjectDataKey");
    objc_msgSend(a1[6], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D342D0]), "initWithDictionary:schema:", v7, *((_QWORD *)a1[4] + 5));
    objc_msgSend(a1[4], "invitationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_3;
    v10[3] = &unk_1E6CF7CA8;
    v11 = a1[7];
    objc_msgSend(v9, "acceptInvitation:withContext:serverAcknowledgedBlock:", v5, v8, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Invitation not found"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[7] + 2))();
  }

}

uint64_t __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __89__HDIDSInvitationManager_acceptInvitationWithUUID_codableObject_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)declineInvitationWithUUID:(id)a3 serverAcknowledgedBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1[4], "invitationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2;
  v10[3] = &unk_1E6D0EF08;
  v11 = a1[5];
  objc_msgSend(v3, "hk_anyObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[4], "invitationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3;
    v8[3] = &unk_1E6CF7CA8;
    v9 = a1[6];
    objc_msgSend(v6, "declineInvitation:serverAcknowledgedBlock:", v5, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 118, CFSTR("Invitation not found"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();

  }
}

uint64_t __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __76__HDIDSInvitationManager_declineInvitationWithUUID_serverAcknowledgedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDIDSInvitation *v12;
  void *v13;
  HDIDSInvitation *v14;
  id WeakRetained;
  id v16;

  v5 = a4;
  objc_msgSend(v5, "context");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(self->_messageClass), "initWithData:", v7);
  objc_msgSend(v5, "fromID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stripPotentialTokenURIWithToken:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stripFZIDPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HDIDSInvitation alloc];
  objc_msgSend(v5, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HDIDSInvitation initWithUUID:fromID:codableObject:](v12, "initWithUUID:fromID:codableObject:", v13, v11, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationManager:didReceiveInvitation:", self, v14);

}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDIDSInvitation *v12;
  void *v13;
  HDIDSInvitation *v14;
  id WeakRetained;
  id v16;

  v5 = a4;
  objc_msgSend(v5, "context");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(self->_messageClass), "initWithData:", v7);
  objc_msgSend(v5, "fromID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stripPotentialTokenURIWithToken:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stripFZIDPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HDIDSInvitation alloc];
  objc_msgSend(v5, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HDIDSInvitation initWithUUID:fromID:codableObject:](v12, "initWithUUID:fromID:codableObject:", v13, v11, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationManager:didRescindInvitation:", self, v14);

}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HDIDSInvitation *v9;
  void *v10;
  HDIDSInvitation *v11;
  id WeakRetained;
  id v13;

  v5 = a4;
  objc_msgSend(v5, "context");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(self->_messageClass), "initWithData:", v7);
  v9 = [HDIDSInvitation alloc];
  objc_msgSend(v5, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDIDSInvitation initWithUUID:fromID:codableObject:](v9, "initWithUUID:fromID:codableObject:", v10, 0, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationManager:didAcceptInvitation:", self, v11);

}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HDIDSInvitation *v9;
  void *v10;
  HDIDSInvitation *v11;
  id WeakRetained;
  id v13;

  v5 = a4;
  objc_msgSend(v5, "context");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(self->_messageClass), "initWithData:", v7);
  v9 = [HDIDSInvitation alloc];
  objc_msgSend(v5, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDIDSInvitation initWithUUID:fromID:codableObject:](v9, "initWithUUID:fromID:codableObject:", v10, 0, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationManager:didDeclineInvitation:", self, v11);

}

- (HDIDSInvitationManagerDelegate)delegate
{
  return (HDIDSInvitationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invitationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_IDSDelegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
