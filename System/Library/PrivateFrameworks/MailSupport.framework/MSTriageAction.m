@implementation MSTriageAction

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MSTriageAction_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (id)log_log_3;
}

void __21__MSTriageAction_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (MSTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  id v12;
  id v13;
  MSTriageAction *v14;
  MSTriageAction *v15;
  void *v16;
  void *v18;
  objc_super v19;

  v12 = a3;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MSTriageAction;
  v14 = -[MSTriageAction init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_messageListItemSelection, a3);
    v15->_origin = a4;
    v15->_actor = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    -[MSTriageAction messageRepository](v15, "messageRepository");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("MSTriageAction.m"), 32, CFSTR("messageRepository cannot be nil. Either pass non-nil delegate or have selection.messageListItems not be empty."));

    }
  }

  return v15;
}

- (MSTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  EMQuery *v11;
  id v12;
  MSTriageAction *v13;
  MSTriageAction *v14;
  void *v15;
  void *v17;
  objc_super v18;

  v11 = (EMQuery *)a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MSTriageAction;
  v13 = -[MSTriageAction init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_actor = a5;
    v13->_query = v11;
    v13->_origin = a4;
    objc_storeWeak((id *)&v13->_delegate, v12);
    -[MSTriageAction messageRepository](v14, "messageRepository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("MSTriageAction.m"), 45, CFSTR("messageRepository cannot be nil. Either pass non-nil delegate or have selection.messageListItems not be empty."));

    }
  }

  return v14;
}

- (BOOL)isUndoSupported
{
  return 1;
}

- (EMMessageRepository)messageRepository
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSTriageAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "messageRepositoryForTriageAction:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSTriageAction.m"), 62, CFSTR("Expected messageRepository to be an EMMessageRepository, but was %@"), objc_opt_class());

  }
  return (EMMessageRepository *)v7;
}

- (id)_changeAction
{
  -[MSTriageAction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MSTriageAction _changeAction]", "MSTriageAction.m", 67, "0");
}

- (EFFuture)changeActionFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1EEC0];
  -[MSTriageAction _changeAction](self, "_changeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v4;
}

- (void)performWithUndoManager:(id)a3 actionName:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  +[MSTriageAction _performAction:undoManager:actionName:](MSTriageAction, "_performAction:undoManager:actionName:", self, v10, v8);
  if (v9)
    v9[2](v9);

}

+ (void)_performAction:(id)a3 undoManager:(id)a4 actionName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MSTriageAction log](MSTriageAction, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1B9D1A000, v11, OS_LOG_TYPE_DEFAULT, "%@: Request to perform action: %{public}@", buf, 0x16u);
  }

  +[MSTriageAction _performAction:actionName:](MSTriageAction, "_performAction:actionName:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      if ((objc_msgSend(v12, "isValid") & 1) != 0)
      {
        +[MSTriageAction log](MSTriageAction, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v8;
          v24 = 2114;
          v25 = v10;
          _os_log_impl(&dword_1B9D1A000, v14, OS_LOG_TYPE_DEFAULT, "%@: Register undo change action: %{public}@", buf, 0x16u);
        }

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__MSTriageAction__performAction_undoManager_actionName___block_invoke;
        v18[3] = &unk_1E716E438;
        v19 = v13;
        v15 = v9;
        v20 = v15;
        v16 = v10;
        v21 = v16;
        objc_msgSend(v15, "registerUndoWithTarget:handler:", a1, v18);
        if (v16 && (objc_msgSend(v15, "isUndoing") & 1) == 0)
          objc_msgSend(v15, "setActionName:", v16);

        v17 = v19;
      }
      else
      {
        +[MSTriageAction log](MSTriageAction, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[MSTriageAction _performAction:undoManager:actionName:].cold.2();
      }
    }
    else
    {
      +[MSTriageAction log](MSTriageAction, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[MSTriageAction _performAction:undoManager:actionName:].cold.1();
    }

  }
}

void __56__MSTriageAction__performAction_undoManager_actionName___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = a1[4];
  v2 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Undo] %@"), a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MSTriageAction _performAction:undoManager:actionName:](MSTriageAction, "_performAction:undoManager:actionName:", v1, v2);

}

+ (id)_performAction:(id)a3 actionName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MSTriageUndoAction *v16;
  void *v17;
  MSTriageUndoAction *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeActionFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__MSTriageAction__performAction_actionName___block_invoke;
  v22[3] = &unk_1E716E460;
  v11 = v5;
  v23 = v11;
  v12 = v6;
  v24 = v12;
  v13 = v8;
  v25 = v13;
  v14 = v7;
  v26 = v14;
  objc_msgSend(v9, "addSuccessBlock:", v22);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __44__MSTriageAction__performAction_actionName___block_invoke_20;
  v20[3] = &unk_1E716E488;
  v15 = v11;
  v21 = v15;
  objc_msgSend(v9, "addFailureBlock:", v20);
  v16 = [MSTriageUndoAction alloc];
  objc_msgSend(v14, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MSTriageUndoAction initWithChangeActionFuture:messageRepository:](v16, "initWithChangeActionFuture:messageRepository:", v17, v13);

  return v18;
}

void __44__MSTriageAction__performAction_actionName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MSTriageAction log](MSTriageAction, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1B9D1A000, v4, OS_LOG_TYPE_DEFAULT, "%@: Performing change action: %{public}@ (%{public}@)", (uint8_t *)&v11, 0x20u);

  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "isUndoSupported");
  v9 = *(void **)(a1 + 48);
  if (v8)
  {
    objc_msgSend(v9, "performMessageChangeActionReturningUndoAction:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "finishWithFuture:", v10);

  }
  else
  {
    objc_msgSend(v9, "performMessageChangeAction:", v3);
  }

}

void __44__MSTriageAction__performAction_actionName___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MSTriageAction log](MSTriageAction, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __44__MSTriageAction__performAction_actionName___block_invoke_20_cold_1(v5, v6, (uint64_t)v7, v4);
  }

}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  self->_query = (EMQuery *)a3;
}

- (MSTriageActionDelegate)delegate
{
  return (MSTriageActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MSMessageListItemSelection)messageListItemSelection
{
  return self->_messageListItemSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListItemSelection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)_performAction:undoManager:actionName:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B9D1A000, v0, (uint64_t)v0, "%@: Unable to register undo action (%{public}@) - undo manager is nil", v1);
}

+ (void)_performAction:undoManager:actionName:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B9D1A000, v0, (uint64_t)v0, "%@: Unable to register undo action (%{public}@) - undo action is invalid", v1);
}

void __44__MSTriageAction__performAction_actionName___block_invoke_20_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B9D1A000, a4, a3, "%@: Getting change action failed with error: %{public}@", (uint8_t *)a3);

}

@end
