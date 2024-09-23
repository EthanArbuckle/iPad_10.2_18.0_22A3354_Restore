@implementation HFTriggerBuilderPair

- (HFTriggerBuilderPair)initWithTrigger:(id)a3 builder:(id)a4
{
  id v8;
  id v9;
  HFTriggerBuilderPair *v10;
  HFTriggerBuilderPair *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder+AutomationBuilders.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HFTriggerBuilderPair;
  v10 = -[HFTriggerBuilderPair init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_trigger, a3);
    objc_storeStrong((id *)&v11->_builder, a4);
  }

  return v11;
}

+ (id)creatingTriggerWithBuilder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTrigger:builder:", 0, v4);

  return v5;
}

+ (id)updatingTrigger:(id)a3 withBuilder:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTrigger:builder:", v7, v6);

  return v8;
}

- (id)commitBuilderInHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[HFTriggerBuilderPair trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilderPair builder](self, "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "hf_updateWithBuilder:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke;
      v14[3] = &unk_1EA73C920;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v7, "addSuccessBlock:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBA920], "hf_newTriggerWithBuilder:inHome:", v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke_2;
      v12[3] = &unk_1EA73C920;
      v12[4] = self;
      v13 = v4;
      objc_msgSend(v7, "addSuccessBlock:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
    }

  }
  else
  {
    NSLog(CFSTR("Tried to commit a trigger builder pair with a nil builder"));
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfChangingTrigger:inHome:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __44__HFTriggerBuilderPair_commitBuilderInHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfAddingTrigger:inHome:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversOfAddingTrigger:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HFTriggerBuilderPair__notifyObserversOfAddingTrigger_inHome___block_invoke;
  v10[3] = &unk_1EA7277C8;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", v10, 0);

}

void __63__HFTriggerBuilderPair__notifyObserversOfAddingTrigger_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didAddTrigger:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversOfChangingTrigger:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HFTriggerBuilderPair__notifyObserversOfChangingTrigger_inHome___block_invoke;
  v10[3] = &unk_1EA7277C8;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", v10, 0);

}

void __65__HFTriggerBuilderPair__notifyObserversOfChangingTrigger_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateTrigger:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (HMTriggerBuilder)builder
{
  return self->_builder;
}

- (HMTrigger)trigger
{
  return self->_trigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
