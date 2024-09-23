@implementation ADStatusConditionsImpl

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void (**v10)(id, _QWORD);
  void (**v11)(id, _QWORD);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD);
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[ADStatusConditionsImpl isConditionRateLimited:onOperation:](self, "isConditionRateLimited:onOperation:", v6, 0))
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[ADStatusConditionsImpl setupXPCConnection](self, "setupXPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke;
    v19[3] = &unk_24CF505F8;
    v19[4] = self;
    v10 = v7;
    v20 = v10;
    objc_msgSend(v8, "setInvalidationHandler:", v19);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_2;
    v17[3] = &unk_24CF505F8;
    v17[4] = self;
    v11 = v10;
    v18 = v11;
    objc_msgSend(v8, "setInterruptionHandler:", v17);
    objc_msgSend(v8, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_3;
    v14[3] = &unk_24CF50620;
    v15 = v8;
    v16 = v11;
    v13 = v8;
    objc_msgSend(v12, "setStatusCondition:completionHandler:", v6, v14);

  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection invalidated. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  objc_msgSend(*(id *)(a1 + 32), "initializeRateLimitingBuffer");
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was invalidated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection interrupted. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  objc_msgSend(*(id *)(a1 + 32), "initializeRateLimitingBuffer");
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was interrupted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  }
}

void __63__ADStatusConditionsImpl_setStatusCondition_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
    ADLOG(CFSTR("ERROR: Failed to set the status condition due to error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void (**v10)(id, _QWORD);
  void (**v11)(id, _QWORD);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD);
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[ADStatusConditionsImpl isConditionRateLimited:onOperation:](self, "isConditionRateLimited:onOperation:", v6, 1))
  {
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[ADStatusConditionsImpl setupXPCConnection](self, "setupXPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke;
    v19[3] = &unk_24CF505F8;
    v19[4] = self;
    v10 = v7;
    v20 = v10;
    objc_msgSend(v8, "setInvalidationHandler:", v19);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_2;
    v17[3] = &unk_24CF505F8;
    v17[4] = self;
    v11 = v10;
    v18 = v11;
    objc_msgSend(v8, "setInterruptionHandler:", v17);
    objc_msgSend(v8, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_3;
    v14[3] = &unk_24CF50620;
    v15 = v8;
    v16 = v11;
    v13 = v8;
    objc_msgSend(v12, "clearStatusCondition:completionHandler:", v6, v14);

  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection invalidated. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  objc_msgSend(*(id *)(a1 + 32), "initializeRateLimitingBuffer");
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was invalidated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection interrupted. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  objc_msgSend(*(id *)(a1 + 32), "initializeRateLimitingBuffer");
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was interrupted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

  }
}

void __65__ADStatusConditionsImpl_clearStatusCondition_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
    ADLOG(CFSTR("ERROR: Failed to clear the status condition due to error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ADStatusConditionsImpl setupXPCConnection](self, "setupXPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_24CF50648;
  v13 = v8;
  v24 = v13;
  objc_msgSend(v11, "setInvalidationHandler:", v23);
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_2;
  v21[3] = &unk_24CF50648;
  v14 = v13;
  v22 = v14;
  objc_msgSend(v11, "setInterruptionHandler:", v21);
  objc_msgSend(v11, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_3;
  v18[3] = &unk_24CF50670;
  v19 = v11;
  v20 = v14;
  v16 = v11;
  v17 = v14;
  objc_msgSend(v15, "isStatusConditionRegistered:bundleIdentifier:completionHandler:", v10, v9, v18);

}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection invalidated. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was invalidated.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);

  }
}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  ADLOG(CFSTR("ADStatusConditions XPC connection interrupted. Lost connection."), a2, a3, a4, a5, a6, a7, a8, v13);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("A serious error occurred. The XPC connection was interrupted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ADStatusConditionsErrorDomain"), -1101, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);

  }
}

void __89__ADStatusConditionsImpl_isStatusConditionRegistered_bundleIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  v13 = CFSTR("has not");
  if ((_DWORD)a2)
    v13 = CFSTR("has");
  v22 = v5;
  ADLOG(CFSTR("The status condition %@ been registered."), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
  if (v22)
    ADLOG(CFSTR("ERROR: Failed to read the status condition due to error: %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v22);
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, a2, v22);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (BOOL)isConditionRateLimited:(id)a3 onOperation:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  __CFString *v24;
  _QWORD block[5];

  v6 = a3;
  -[ADStatusConditionsImpl cleanupExpiredConditionsInBuffer](self, "cleanupExpiredConditionsInBuffer");
  v14 = CFSTR("Clear");
  if (!a4)
    v14 = CFSTR("Set");
  ADLOG(CFSTR("ADStatusConditions %@ called. Checking rate limiting."), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ADStatusConditionsImpl_isConditionRateLimited_onOperation___block_invoke;
  block[3] = &unk_24CF50698;
  block[4] = self;
  if (isConditionRateLimited_onOperation__onceToken != -1)
    dispatch_once(&isConditionRateLimited_onOperation__onceToken, block);
  v15 = -[ADStatusConditionsImpl operationWithCondition:forType:](self, "operationWithCondition:forType:", v6, a4);

  v23 = CFSTR("CLEAR");
  if (!a4)
    v23 = CFSTR("SET");
  if (v15)
    v24 = CFSTR("This is a duplicate %@ call which will be rate limited");
  else
    v24 = CFSTR("This is a new %@ call which will execute.");
  ADLOG(v24, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
  return v15;
}

uint64_t __61__ADStatusConditionsImpl_isConditionRateLimited_onOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeRateLimitingBuffer");
}

- (BOOL)operationWithCondition:(id)a3 forType:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  ADStatusConditionRateLimitedObject *v17;
  void *v18;
  id v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (id)ringBuffer;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "statusCondition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v5))
        {
          v13 = objc_msgSend(v11, "operation");

          if (v13 == a4)
          {
            v20 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  v14 = (void *)MEMORY[0x24BDD1758];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __57__ADStatusConditionsImpl_operationWithCondition_forType___block_invoke;
  v22[3] = &unk_24CF506C0;
  v15 = v5;
  v23 = v15;
  objc_msgSend(v14, "predicateWithBlock:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ringBuffer, "filterUsingPredicate:", v16);
  v17 = [ADStatusConditionRateLimitedObject alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ADStatusConditionRateLimitedObject init:at:kind:](v17, "init:at:kind:", v15, v18, a4);

  objc_msgSend((id)ringBuffer, "addObject:", v19);
  v20 = 0;
  v6 = v23;
LABEL_13:

  return v20;
}

uint64_t __57__ADStatusConditionsImpl_operationWithCondition_forType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "statusCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return a1 ^ 1;
}

- (void)cleanupExpiredConditionsInBuffer
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  -[ADStatusConditionsImpl capped:to:](self, "capped:to:", ringBuffer, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = (void *)ringBuffer;
  ringBuffer = v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__ADStatusConditionsImpl_cleanupExpiredConditionsInBuffer__block_invoke;
  v9[3] = &unk_24CF506C0;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "predicateWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ringBuffer, "filterUsingPredicate:", v8);

}

BOOL __58__ADStatusConditionsImpl_cleanupExpiredConditionsInBuffer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "setTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  return (int)v5 < 86400;
}

- (id)capped:(id)a3 to:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 <= a4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)initializeRateLimitingBuffer
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ringBuffer;
  ringBuffer = v2;

}

- (id)setupXPCConnection
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1988]);
  v3 = (void *)objc_msgSend(v2, "initWithMachServiceName:options:", CFSTR("com.apple.ap.adservicesd.statusconditionservice"), *MEMORY[0x24BE02130]);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B7D6F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "resume");
  return v3;
}

@end
