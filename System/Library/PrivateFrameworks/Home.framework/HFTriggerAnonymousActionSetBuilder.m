@implementation HFTriggerAnonymousActionSetBuilder

- (HFTriggerAnonymousActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  HFTriggerAnonymousActionSetBuilder *v4;
  HFTriggerAnonymousActionSetBuilder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
  v4 = -[HFAbstractBaseActionSetBuilder initWithExistingObject:inHome:](&v7, sel_initWithExistingObject_inHome_, a3, a4);
  v5 = v4;
  if (v4)
    -[HFTriggerAnonymousActionSetBuilder setActionSetType:](v4, "setActionSetType:", 0);
  return v5;
}

- (BOOL)hasActions
{
  void *v2;
  BOOL v3;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)shortcutsComponentActionSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemBuilder home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_shortcutsComponentActionSetWithActions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    NSLog(CFSTR("Failed to create shortcutsComponentActionSet in %@"), self);

  return v8;
}

uint64_t __65__HFTriggerAnonymousActionSetBuilder_shortcutsComponentActionSet__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __65__HFTriggerAnonymousActionSetBuilder_shortcutsComponentActionSet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)getOrCreateActionSet
{
  void *v3;

  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[HFTriggerAnonymousActionSetBuilder shortcutsComponentActionSet](self, "shortcutsComponentActionSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)addAction:(id)a3 actionSetType:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[HFTriggerAnonymousActionSetBuilder actionSetType](self, "actionSetType") == a4)
  {
    if (-[HFTriggerAnonymousActionSetBuilder actionSetType](self, "actionSetType") != 1)
      goto LABEL_6;
  }
  else
  {
    -[HFTriggerAnonymousActionSetBuilder setActionSetType:](self, "setActionSetType:", a4);
  }
  -[HFAbstractBaseActionSetBuilder removeAllActions](self, "removeAllActions");
LABEL_6:
  -[HFAbstractBaseActionSetBuilder addAction:](self, "addAction:", v6);

}

- (void)updateActionBuildersDiff:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "mutableCopyWithZone:", MEMORY[0x1DF0DA77C]());

  -[HFAbstractBaseActionSetBuilder setActionBuilders:](self, "setActionBuilders:", v5);
}

- (void)updateAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAbstractBaseActionSetBuilder existingActionBuilder:inSet:](self, "existingActionBuilder:inSet:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_3;
  objc_msgSend(0, "updateWithActionBuilder:", v4);
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAbstractBaseActionSetBuilder existingActionBuilder:inSet:](self, "existingActionBuilder:inSet:", v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_3:
    v10.receiver = self;
    v10.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
    -[HFAbstractBaseActionSetBuilder updateAction:](&v10, sel_updateAction_, v4);

  }
}

- (id)deleteActionSet
{
  -[HFAbstractBaseActionSetBuilder removeAllActions](self, "removeAllActions");
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)createActionSetBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[HFTriggerAnonymousActionSetBuilder containingTrigger](self, "containingTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "triggerOwnedActionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAbstractBaseActionSetBuilder updateActionsInBuilder:](self, "updateActionsInBuilder:", v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)useActionSetBuilder
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  objc_opt_class();
  -[HFTriggerAnonymousActionSetBuilder containingTrigger](self, "containingTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  -[HFItemBuilder home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areAutomationBuildersSupported");
  if (v4)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)commitItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[5];
  _QWORD v29[4];
  __CFString *v30;
  HFTriggerAnonymousActionSetBuilder *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  -[HFTriggerAnonymousActionSetBuilder containingTrigger](self, "containingTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    NSLog(CFSTR("Can't commit a HFTriggerAnonymousActionSetBuilder without a containing trigger"));
  -[HFTriggerAnonymousActionSetBuilder containingTrigger](self, "containingTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v24 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    return v5;
  }
  if (!-[HFTriggerAnonymousActionSetBuilder useActionSetBuilder](self, "useActionSetBuilder")
    || (-[HFTriggerAnonymousActionSetBuilder createActionSetBuilder](self, "createActionSetBuilder"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HFAbstractBaseActionSetBuilder actions](self, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HFOperationEditTrigger;
      if (!v9)
        v10 = HFOperationAddTrigger;
      v11 = *v10;

      -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = MEMORY[0x1E0C809B0];
      if (!v12)
      {
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2;
        v35[3] = &unk_1EA7268F0;
        v35[4] = self;
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_3;
        v34[3] = &unk_1EA726940;
        v34[4] = self;
        objc_msgSend(v14, "flatMap:", v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v33[0] = v13;
        v33[1] = 3221225472;
        v33[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_5;
        v33[3] = &unk_1EA726338;
        v33[4] = self;
        v16 = (id)objc_msgSend(v15, "addSuccessBlock:", v33);
        v32[0] = v13;
        v32[1] = 3221225472;
        v32[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_19;
        v32[3] = &unk_1EA726968;
        v32[4] = self;
        v17 = (id)objc_msgSend(v15, "addFailureBlock:", v32);
        v8 = v15;
      }
      v18 = (void *)MEMORY[0x1E0D519C0];
      v37[0] = v8;
      -[HFAbstractBaseActionSetBuilder lazilyUpdateActions](self, "lazilyUpdateActions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "chainFutures:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v13;
      v29[1] = 3221225472;
      v29[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_22;
      v29[3] = &unk_1EA726990;
      v30 = v11;
      v31 = self;
      v22 = v11;
      objc_msgSend(v21, "recover:", v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2_24;
      v28[3] = &unk_1EA726940;
      v28[4] = self;
      objc_msgSend(v23, "flatMap:", v28);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke;
      v36[3] = &unk_1EA7268C8;
      v36[4] = self;
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v36);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v26;
  }
  return v5;
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "containingTrigger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeActionSet:completionHandler:", v5, v4);

}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "containingTrigger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActionSetOfType:completionHandler:", *MEMORY[0x1E0CB8230], v3);

}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_4;
  v7[3] = &unk_1EA726918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v7, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containingTrigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateTrigger:", v3, v4);

  }
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "containingTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Created anonoymous action set for trigger: %@.", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setActionSet:", v3);

}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "containingTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to create anonoymous action set for trigger: %@. Error: %@", (uint8_t *)&v7, 0x16u);

  }
}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_22(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "containingTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_naturalLanguageNameWithHome:type:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_errorWithOperationType:failedItemName:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "futureWithError:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2_24(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
  v4 = -[HFAbstractBaseActionSetBuilder copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HFTriggerAnonymousActionSetBuilder containingTrigger](self, "containingTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainingTrigger:", v5);

  objc_msgSend(v4, "setActionSetType:", -[HFTriggerAnonymousActionSetBuilder actionSetType](self, "actionSetType"));
  return v4;
}

- (HMTrigger)containingTrigger
{
  return self->_containingTrigger;
}

- (void)setContainingTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_containingTrigger, a3);
}

- (unint64_t)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(unint64_t)a3
{
  self->_actionSetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingTrigger, 0);
}

@end
