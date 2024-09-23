@implementation CRKWaitForKeyValueChangeOperation

- (CRKWaitForKeyValueChangeOperation)initWithObject:(id)a3 keyPaths:(id)a4 conditionEvaluator:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKWaitForKeyValueChangeOperation *v12;
  CRKWaitForKeyValueChangeOperation *v13;
  uint64_t v14;
  NSSet *keyPaths;
  uint64_t v16;
  id conditionEvaluator;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKWaitForKeyValueChangeOperation;
  v12 = -[CRKWaitForKeyValueChangeOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_object, a3);
    v14 = objc_msgSend(v10, "copy");
    keyPaths = v13->_keyPaths;
    v13->_keyPaths = (NSSet *)v14;

    v16 = MEMORY[0x219A226E8](v11);
    conditionEvaluator = v13->_conditionEvaluator;
    v13->_conditionEvaluator = (id)v16;

  }
  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKWaitForKeyValueChangeOperation;
  -[CRKWaitForKeyValueChangeOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CRKWaitForKeyValueChangeOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __43__CRKWaitForKeyValueChangeOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "endObservingObject");
    objc_msgSend(*(id *)(a1 + 32), "setConditionEvaluator:", 0);
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
}

- (void)main
{
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[CRKWaitForKeyValueChangeOperation isExecuting](self, "isExecuting"))
    {
      -[CRKWaitForKeyValueChangeOperation beginObservingObject](self, "beginObservingObject");
      -[CRKWaitForKeyValueChangeOperation evaluateConditions](self, "evaluateConditions");
    }
  }
  else
  {
    -[CRKWaitForKeyValueChangeOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)beginObservingObject
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[CRKWaitForKeyValueChangeOperation isObserving](self, "isObserving"))
  {
    -[CRKWaitForKeyValueChangeOperation setObserving:](self, "setObserving:", 1);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CRKWaitForKeyValueChangeOperation keyPaths](self, "keyPaths", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          -[CRKWaitForKeyValueChangeOperation object](self, "object");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 0, CFSTR("WaitForKeyValueChangeOperationObservationContext"));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)endObservingObject
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[CRKWaitForKeyValueChangeOperation isObserving](self, "isObserving"))
  {
    -[CRKWaitForKeyValueChangeOperation setObserving:](self, "setObserving:", 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CRKWaitForKeyValueChangeOperation keyPaths](self, "keyPaths", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          -[CRKWaitForKeyValueChangeOperation object](self, "object");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("WaitForKeyValueChangeOperationObservationContext"));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("WaitForKeyValueChangeOperationObservationContext"))
  {
    -[CRKWaitForKeyValueChangeOperation evaluateConditions](self, "evaluateConditions", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKWaitForKeyValueChangeOperation;
    -[CRKWaitForKeyValueChangeOperation observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)evaluateConditions
{
  uint64_t (**v4)(void);
  int v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[CRKWaitForKeyValueChangeOperation isExecuting](self, "isExecuting"))
    {
      -[CRKWaitForKeyValueChangeOperation conditionEvaluator](self, "conditionEvaluator");
      v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v5 = v4[2]();

      if (v5)
      {
        -[CRKWaitForKeyValueChangeOperation endObservingObject](self, "endObservingObject");
        -[CRKWaitForKeyValueChangeOperation setConditionEvaluator:](self, "setConditionEvaluator:", 0);
        -[CRKWaitForKeyValueChangeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      }
    }
  }
  else
  {
    -[CRKWaitForKeyValueChangeOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (NSObject)object
{
  return self->_object;
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (id)conditionEvaluator
{
  return self->_conditionEvaluator;
}

- (void)setConditionEvaluator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conditionEvaluator, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end
