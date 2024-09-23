@implementation CRKRequestPerformerBackedIDSPrimitives

- (CRKRequestPerformerBackedIDSPrimitives)initWithRequestPerformer:(id)a3 operationQueue:(id)a4
{
  id v7;
  id v8;
  CRKRequestPerformerBackedIDSPrimitives *v9;
  CRKRequestPerformerBackedIDSPrimitives *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKRequestPerformerBackedIDSPrimitives;
  v9 = -[CRKRequestPerformerBackedIDSPrimitives init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationQueue, a4);
    objc_storeStrong((id *)&v10->_requestPerformer, a3);
  }

  return v10;
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
  -[CRKRequestPerformerBackedIDSPrimitives sendMessage:destinationAddress:sourceAppleID:options:completion:](self, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v13, v12, v11, v14, v10);

}

- (void)sendMessage:(id)a3 destinationAddress:(id)a4 sourceAppleID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setDestinationAddress:", v15);

  objc_msgSend(v17, "setSourceAppleID:", v14);
  objc_msgSend(v17, "setMessage:", v16);

  objc_msgSend(v17, "setOptions:", v13);
  -[CRKRequestPerformerBackedIDSPrimitives requestPerformer](self, "requestPerformer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operationForRequest:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD1478];
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __106__CRKRequestPerformerBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke;
  v30 = &unk_24D9C6E88;
  v31 = v19;
  v32 = v12;
  v21 = v19;
  v22 = v12;
  objc_msgSend(v20, "blockOperationWithBlock:", &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addDependency:", v21, v27, v28, v29, v30);
  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addOperations:waitUntilFinished:", v25, 0);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOperation:", v23);

}

void __106__CRKRequestPerformerBackedIDSPrimitives_sendMessage_destinationAddress_sourceAppleID_options_completion___block_invoke(uint64_t a1)
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
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CRKOperationBackedIDSMessageSubscription *v11;
  CRKWaitForProgressOperation *v12;
  void *v13;
  CRKWaitForProgressOperation *v14;
  void *v15;
  CRKOperationBackedIDSMessageSubscription *v16;
  id v17;
  CRKWaitForProgressOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  CRKWaitForProgressOperation *v24;
  CRKOperationBackedIDSMessageSubscription *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setHandlesNotifications:", 1);
  -[CRKRequestPerformerBackedIDSPrimitives requestPerformer](self, "requestPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "operationForRequest:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CRKOperationBackedIDSMessageSubscription initWithListenOperation:handler:]([CRKOperationBackedIDSMessageSubscription alloc], "initWithListenOperation:handler:", v10, v7);
  objc_msgSend(v10, "setNotificationDelegate:", v11);
  v12 = [CRKWaitForProgressOperation alloc];
  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CRKWaitForProgressOperation initWithOperationQueue:operation:expectedCompletedUnitCount:expectedTotalUnitCount:](v12, "initWithOperationQueue:operation:expectedCompletedUnitCount:expectedTotalUnitCount:", v13, v10, 1, 2);

  v15 = (void *)MEMORY[0x24BDD1478];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __84__CRKRequestPerformerBackedIDSPrimitives_subscribeToMessagesWithHandler_completion___block_invoke;
  v23[3] = &unk_24D9C6D98;
  v25 = v11;
  v26 = v6;
  v24 = v14;
  v16 = v11;
  v17 = v6;
  v18 = v14;
  objc_msgSend(v15, "blockOperationWithBlock:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addDependency:", v18);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addOperation:", v19);

  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperations:waitUntilFinished:", v22, 0);

}

void __84__CRKRequestPerformerBackedIDSPrimitives_subscribeToMessagesWithHandler_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
}

- (NSDictionary)debugInfo
{
  objc_class *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Class");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)fetchFirewallAllowedAppleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAction:", 0);
  -[CRKRequestPerformerBackedIDSPrimitives requestPerformer](self, "requestPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationForRequest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1478];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __71__CRKRequestPerformerBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke;
  v17 = &unk_24D9C6F90;
  v18 = v7;
  v19 = v4;
  v9 = v4;
  v10 = v7;
  objc_msgSend(v8, "blockOperationWithBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDependency:", v10, v14, v15, v16, v17);
  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v10);

  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v11);

}

void __71__CRKRequestPerformerBackedIDSPrimitives_fetchFirewallAllowedAppleIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "resultObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "allowedAppleIDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

}

- (void)addAllowedAppleIDsToFirewall:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAction:", 1);
  objc_msgSend(v8, "setAllowedAppleIDs:", v7);

  -[CRKRequestPerformerBackedIDSPrimitives requestPerformer](self, "requestPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "operationForRequest:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1478];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __82__CRKRequestPerformerBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke;
  v20 = &unk_24D9C6E88;
  v21 = v10;
  v22 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v11, "blockOperationWithBlock:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDependency:", v12, v17, v18, v19, v20);
  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v12);

  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v14);

}

void __82__CRKRequestPerformerBackedIDSPrimitives_addAllowedAppleIDsToFirewall_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)removeAllowedAppleIDsFromFirewall:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAction:", 2);
  objc_msgSend(v8, "setAllowedAppleIDs:", v7);

  -[CRKRequestPerformerBackedIDSPrimitives requestPerformer](self, "requestPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "operationForRequest:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1478];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __87__CRKRequestPerformerBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke;
  v20 = &unk_24D9C6E88;
  v21 = v10;
  v22 = v6;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v11, "blockOperationWithBlock:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDependency:", v12, v17, v18, v19, v20);
  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v12);

  -[CRKRequestPerformerBackedIDSPrimitives operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v14);

}

void __87__CRKRequestPerformerBackedIDSPrimitives_removeAllowedAppleIDsFromFirewall_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (CRKRequestPerformingProtocol)requestPerformer
{
  return self->_requestPerformer;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_requestPerformer, 0);
}

@end
