@implementation FPUpdateIgnoreStateOperation

- (id)replicateForItems:(id)a3
{
  id v4;
  FPUpdateIgnoreStateOperation *v5;
  _BOOL8 ignoreState;
  void *v7;
  FPUpdateIgnoreStateOperation *v8;

  v4 = a3;
  v5 = [FPUpdateIgnoreStateOperation alloc];
  ignoreState = self->_ignoreState;
  -[FPActionOperation action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPUpdateIgnoreStateOperation initWithItems:ignoreState:action:](v5, "initWithItems:ignoreState:action:", v4, ignoreState, v7);

  return v8;
}

- (FPUpdateIgnoreStateOperation)initWithItems:(id)a3 ignoreState:(BOOL)a4 action:(id)a5
{
  id v9;
  FPUpdateIgnoreStateOperation *v10;
  FPUpdateIgnoreStateOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPUpdateIgnoreStateOperation;
  v10 = -[FPActionOperation initWithItemsOfDifferentProviders:action:](&v13, sel_initWithItemsOfDifferentProviders_action_, v9, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_items, a3);
    v11->_ignoreState = a4;
    -[FPActionOperation setSetupRemoteOperationService:](v11, "setSetupRemoteOperationService:", 1);
  }

  return v11;
}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  NSArray *items;
  void *v6;
  _QWORD v7[5];

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FPUpdateIgnoreStateOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E444D648;
  v7[4] = self;
  objc_msgSend(v4, "transformItems:handler:", items, v7);

  -[FPActionOperation stitcher](self, "stitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flush");

}

uint64_t __52__FPUpdateIgnoreStateOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setExcludedFromSync:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 456));
}

- (void)actionMain
{
  void *v3;
  void *v4;
  _BOOL8 ignoreState;
  _QWORD v6[5];

  -[NSArray fp_map:](self->_items, "fp_map:", &__block_literal_global_440);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ignoreState = self->_ignoreState;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2;
  v6[3] = &unk_1E444CF78;
  v6[4] = self;
  objc_msgSend(v4, "updateIgnoreStateOfItemWithIdentifiers:ignoreState:completionHandler:", v3, ignoreState, v6);

}

uint64_t __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemIdentifier");
}

void __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
LABEL_6:
      __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2_cold_1();
  }
  else
  {
    if (!objc_msgSend(v8, "count"))
      goto LABEL_8;
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
  }

LABEL_8:
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v11, "completedWithResult:error:", v12, v9);
  }
  else
  {
    objc_msgSend(v8, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completedWithResult:error:", v12, v14);

  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithItems:error:", v7, v6);

  v9.receiver = self;
  v9.super_class = (Class)FPUpdateIgnoreStateOperation;
  -[FPActionOperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

void __42__FPUpdateIgnoreStateOperation_actionMain__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v0, (uint64_t)v0, "[ERROR] couldn't %signore items: %@", v1);
  OUTLINED_FUNCTION_3();
}

@end
