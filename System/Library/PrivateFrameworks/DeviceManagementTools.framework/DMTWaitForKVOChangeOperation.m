@implementation DMTWaitForKVOChangeOperation

- (DMTWaitForKVOChangeOperation)initWithObservedObject:(id)a3 keyPath:(id)a4 expectedValue:(id)a5 requireExpectedValue:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  DMTWaitForKVOChangeOperation *v14;
  DMTWaitForKVOChangeOperation *v15;
  uint64_t v16;
  NSString *keyPath;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMTWaitForKVOChangeOperation;
  v14 = -[DMTWaitForKVOChangeOperation init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_observedObject, a3);
    v16 = objc_msgSend(v12, "copy");
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v16;

    objc_storeStrong((id *)&v15->_expectedValue, a5);
    v15->_requireExpectedValue = a6;
  }

  return v15;
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
  v4.super_class = (Class)DMTWaitForKVOChangeOperation;
  -[DMTWaitForKVOChangeOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DMTWaitForKVOChangeOperation_cancel__block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__DMTWaitForKVOChangeOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
}

- (void)main
{
  id v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[DMTWaitForKVOChangeOperation isExecuting](self, "isExecuting"))
    {
      if (-[DMTWaitForKVOChangeOperation isCancelled](self, "isCancelled"))
      {
        CATErrorWithCodeAndUserInfo();
        v4 = (id)objc_claimAutoreleasedReturnValue();
        -[DMTWaitForKVOChangeOperation endOperationWithError:](self, "endOperationWithError:", v4);

      }
      else
      {
        -[DMTWaitForKVOChangeOperation beginObserving](self, "beginObserving");
      }
    }
  }
  else
  {
    -[DMTWaitForKVOChangeOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)beginObserving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DMTWaitForKVOChangeOperation observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTWaitForKVOChangeOperation keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTWaitForKVOChangeOperation setInitialValue:](self, "setInitialValue:", v5);

  -[DMTWaitForKVOChangeOperation setObserving:](self, "setObserving:", 1);
  -[DMTWaitForKVOChangeOperation observedObject](self, "observedObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DMTWaitForKVOChangeOperation keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, v6, 4, CFSTR("WaitForKVOChangeContext"));

}

- (void)endObservingIfNeeded
{
  void *v3;
  void *v4;

  if (-[DMTWaitForKVOChangeOperation isObserving](self, "isObserving"))
  {
    -[DMTWaitForKVOChangeOperation observedObject](self, "observedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMTWaitForKVOChangeOperation keyPath](self, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, CFSTR("WaitForKVOChangeContext"));

    -[DMTWaitForKVOChangeOperation setObserving:](self, "setObserving:", 0);
  }
}

- (void)handleKVOChangeWithValueOfKeyPath:(id)a3
{
  void *v3;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    -[DMTWaitForKVOChangeOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v10, 0);
LABEL_14:
    v9 = v10;
    goto LABEL_15;
  }
  -[DMTWaitForKVOChangeOperation initialValue](self, "initialValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v10)
  {

    goto LABEL_14;
  }
  if (!v10)
  {
    -[DMTWaitForKVOChangeOperation initialValue](self, "initialValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {

      goto LABEL_14;
    }
  }
  -[DMTWaitForKVOChangeOperation initialValue](self, "initialValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEqual:", v7);

  if (!v10)
  v9 = v10;
  if ((v8 & 1) == 0)
  {
    if (-[DMTWaitForKVOChangeOperation requireExpectedValue](self, "requireExpectedValue"))
      -[DMTWaitForKVOChangeOperation compareExpectedValueWithChangedValue:](self, "compareExpectedValueWithChangedValue:", v10);
    else
      -[DMTWaitForKVOChangeOperation endOperationAndTearDownWithError:resultObject:](self, "endOperationAndTearDownWithError:resultObject:", 0, 0);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)compareExpectedValueWithChangedValue:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    -[DMTWaitForKVOChangeOperation expectedValue](self, "expectedValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_7;
  }
  -[DMTWaitForKVOChangeOperation expectedValue](self, "expectedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v5)
  {

    if ((v7 & 1) == 0)
    {
      v13[0] = CFSTR("DMTWaitForKVOChangeOperationUnexpectedValue");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_7:
    -[DMTWaitForKVOChangeOperation endOperationAndTearDownWithError:resultObject:](self, "endOperationAndTearDownWithError:resultObject:", 0, 0);
    goto LABEL_16;
  }
  if (v7)
    goto LABEL_7;
  v13[0] = CFSTR("DMTWaitForKVOChangeOperationUnexpectedValue");
  v8 = v5;
LABEL_9:
  v13[1] = CFSTR("kDMTWaitForKVOChangeOperationExpectedValue");
  v14[0] = v8;
  -[DMTWaitForKVOChangeOperation expectedValue](self, "expectedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v5)
  DMTErrorWithCodeAndUserInfo(3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTWaitForKVOChangeOperation endOperationAndTearDownWithError:resultObject:](self, "endOperationAndTearDownWithError:resultObject:", v12, 0);

LABEL_16:
}

- (void)endOperationAndTearDownWithError:(id)a3 resultObject:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[DMTWaitForKVOChangeOperation endObservingIfNeeded](self, "endObservingIfNeeded");
  if (v7)
    -[DMTWaitForKVOChangeOperation endOperationWithError:](self, "endOperationWithError:", v7);
  else
    -[DMTWaitForKVOChangeOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  if (a6 == CFSTR("WaitForKVOChangeContext"))
  {
    -[DMTWaitForKVOChangeOperation keyPath](self, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v13)
    {
      objc_msgSend(v11, "valueForKeyPath:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTWaitForKVOChangeOperation handleKVOChangeWithValueOfKeyPath:](self, "handleKVOChangeWithValueOfKeyPath:", v14);

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DMTWaitForKVOChangeOperation;
    -[DMTWaitForKVOChangeOperation observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

- (NSObject)observedObject
{
  return self->_observedObject;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)expectedValue
{
  return self->_expectedValue;
}

- (BOOL)requireExpectedValue
{
  return self->_requireExpectedValue;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSObject)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
  objc_storeStrong((id *)&self->_initialValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_expectedValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_observedObject, 0);
}

@end
