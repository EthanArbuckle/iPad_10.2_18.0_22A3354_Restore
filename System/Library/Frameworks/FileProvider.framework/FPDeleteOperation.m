@implementation FPDeleteOperation

- (id)replicateForItems:(id)a3
{
  id v3;
  FPDeleteOperation *v4;

  v3 = a3;
  v4 = -[FPDeleteOperation initWithItems:]([FPDeleteOperation alloc], "initWithItems:", v3);

  return v4;
}

- (FPDeleteOperation)initWithItems:(id)a3
{
  id v5;
  FPDeleteOperation *v6;
  FPDeleteOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDeleteOperation;
  v6 = -[FPActionOperation initWithItemsOfDifferentProviders:action:](&v9, sel_initWithItemsOfDifferentProviders_action_, v5, CFSTR("Delete"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    -[FPActionOperation setSetupRemoteOperationService:](v7, "setSetupRemoteOperationService:", 1);
  }

  return v7;
}

- (void)actionMain
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[NSArray fp_map:](self->_items, "fp_map:", &__block_literal_global_290);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray fp_itemIDs](self->_items, "fp_itemIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__FPDeleteOperation_actionMain__block_invoke_2;
  v6[3] = &unk_1E444A598;
  v6[4] = self;
  objc_msgSend(v5, "deleteItemsWithIDs:baseVersions:options:reply:", v4, v3, -2147483647, v6);

}

uint64_t __31__FPDeleteOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemVersion");
}

void __31__FPDeleteOperation_actionMain__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __31__FPDeleteOperation_actionMain__block_invoke_2_cold_1(v3, v4);

    v5 = *(void **)(a1 + 32);
    v6 = v3;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = 0;
  }
  objc_msgSend(v5, "completedWithResult:error:", 0, v6);

}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  id v5;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteItems:", self->_items);

  -[FPActionOperation stitcher](self, "stitcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithItem:error:", v7, v6);

  objc_msgSend(v6, "fp_annotatedErrorWithItems:variant:", self->_items, CFSTR("Remove"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)FPDeleteOperation;
  -[FPActionOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

void __31__FPDeleteOperation_actionMain__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] couldn't delete items: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

@end
