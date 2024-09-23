@implementation CRKLocalBackedIDSPrimitives

- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRKLocalBackedIDSPrimitives *v10;

  v6 = (void *)MEMORY[0x24BE2C758];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "crk_backgroundQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKLocalBackedIDSPrimitives initWithIDSLocalPrimitives:IDSReadinessEvaluator:operationQueue:](self, "initWithIDSLocalPrimitives:IDSReadinessEvaluator:operationQueue:", v8, v7, v9);

  return v10;
}

- (CRKLocalBackedIDSPrimitives)initWithIDSLocalPrimitives:(id)a3 IDSReadinessEvaluator:(id)a4 operationQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKLocalBackedIDSPrimitives *v12;
  CRKLocalBackedIDSPrimitives *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKLocalBackedIDSPrimitives;
  v12 = -[CRKLocalBackedIDSPrimitives init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_IDSLocalPrimitives, a3);
    objc_storeStrong((id *)&v13->_IDSReadinessEvaluator, a4);
    objc_storeStrong((id *)&v13->_operationQueue, a5);
  }

  return v13;
}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 completion:(id)a6
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
  v14 = (id)objc_opt_new();
  -[CRKLocalBackedIDSPrimitives sendMessage:destinationAddress:sourceAppleID:options:completion:](self, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v13, v12, v11, v14, v10);

}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRKIDSWaitAndSendIDSMessageOperation *v17;
  void *v18;
  void *v19;
  CRKIDSWaitAndSendIDSMessageOperation *v20;
  void *v21;
  CRKIDSWaitAndSendIDSMessageOperation *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  CRKIDSWaitAndSendIDSMessageOperation *v31;
  id v32;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [CRKIDSWaitAndSendIDSMessageOperation alloc];
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKLocalBackedIDSPrimitives IDSReadinessEvaluator](self, "IDSReadinessEvaluator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CRKIDSWaitAndSendIDSMessageOperation initWithIDSLocalPrimitives:IDSReadinessEvaluator:message:destinationAddress:sourceAppleID:options:](v17, "initWithIDSLocalPrimitives:IDSReadinessEvaluator:message:destinationAddress:sourceAppleID:options:", v18, v19, v16, v15, v14, v13);

  v21 = (void *)MEMORY[0x24BDD1478];
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __95__CRKLocalBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v30 = &unk_24D9C6E88;
  v31 = v20;
  v32 = v12;
  v22 = v20;
  v23 = v12;
  objc_msgSend(v21, "blockOperationWithBlock:", &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addDependency:", v22, v27, v28, v29, v30);
  -[CRKLocalBackedIDSPrimitives operationQueue](self, "operationQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addOperation:", v22);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOperation:", v24);

}

void __95__CRKLocalBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)subscribeToMessagesWithHandler:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = a3;
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeToMessageReceivesWithHandler:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9, 0);
  objc_msgSend(v9, "resume");

}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("Operations");
  -[CRKLocalBackedIDSPrimitives operationDebugInfo](self, "operationDebugInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("LocalPrimitives");
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("IDSReadinessEvaluator");
  -[CRKLocalBackedIDSPrimitives IDSReadinessEvaluator](self, "IDSReadinessEvaluator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (id)operationDebugInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[CRKLocalBackedIDSPrimitives operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crk_mapUsingBlock:", &__block_literal_global_75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__CRKLocalBackedIDSPrimitives_operationDebugInfo__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (void)fetchFirewallAllowedAppleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__CRKLocalBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke;
  v7[3] = &unk_24D9C99A8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchFirewallWithCompletion:", v7);

}

uint64_t __60__CRKLocalBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    return objc_msgSend(a2, "fetchAllowedAppleIDsWithCompletion:", v2);
  else
    return (*(uint64_t (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
}

- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__CRKLocalBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke;
  v11[3] = &unk_24D9C99D0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fetchFirewallWithCompletion:", v11);

}

uint64_t __71__CRKLocalBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "addAllowedAppleIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CRKLocalBackedIDSPrimitives IDSLocalPrimitives](self, "IDSLocalPrimitives");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__CRKLocalBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke;
  v11[3] = &unk_24D9C99D0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fetchFirewallWithCompletion:", v11);

}

uint64_t __76__CRKLocalBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "removeAllowedAppleIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (CRKIDSReadinessEvaluating)IDSReadinessEvaluator
{
  return self->_IDSReadinessEvaluator;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_IDSReadinessEvaluator, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
}

@end
