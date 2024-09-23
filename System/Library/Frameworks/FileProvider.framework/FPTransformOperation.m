@implementation FPTransformOperation

- (FPTransformOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4
{
  id v6;
  FPTransformOperation *v7;
  uint64_t v8;
  NSArray *items;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTransformOperation;
  v7 = -[FPActionOperation initWithItemsOfDifferentProviders:action:](&v11, sel_initWithItemsOfDifferentProviders_action_, v6, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    items = v7->_items;
    v7->_items = (NSArray *)v8;

  }
  return v7;
}

+ (id)daemonConnection
{
  return +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
}

- (void)signalReindexItemsIfNeededForErrorsByItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke;
  v33[3] = &unk_1E444EF00;
  v6 = v5;
  v34 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v33);
  if (objc_msgSend(v6, "count"))
  {
    v26 = v4;
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[FPTransformOperation signalReindexItemsIfNeededForErrorsByItem:].cold.1();

    v8 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[FPTransformOperation items](self, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "itemIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "containsObject:", v16))
          {

          }
          else
          {
            objc_msgSend(v15, "formerIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v6, "containsObject:", v17);

            if (!v18)
              continue;
          }
          objc_msgSend(v15, "providerDomainID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v21 = (void *)objc_opt_new();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v19);

          }
          objc_msgSend(v8, "objectForKeyedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "coreSpotlightIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v12);
    }

    objc_msgSend((id)objc_opt_class(), "daemonConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_327;
    v27[3] = &unk_1E444A598;
    v28 = v8;
    v25 = v8;
    objc_msgSend(v24, "signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:", v25, 5, v27);

    v4 = v26;
  }

}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "fp_isFileProviderError:", -1005))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_327(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_327_cold_1(a1, v3, v4);

}

- (void)actionMain
{
  NSArray *items;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  items = self->_items;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__FPTransformOperation_actionMain__block_invoke;
  v11[3] = &unk_1E444EF28;
  v11[4] = self;
  v11[5] = &v12;
  -[NSArray fp_mapWithIndex:](items, "fp_mapWithIndex:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 1091, CFSTR("Transform didn't modify any field"));

  }
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13[3];
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__FPTransformOperation_actionMain__block_invoke_2;
  v10[3] = &unk_1E444CF78;
  v10[4] = self;
  objc_msgSend(v7, "bulkItemChanges:changedFields:completionHandler:", v6, v8, v10);

  _Block_object_dispose(&v12, 8);
}

id __34__FPTransformOperation_actionMain__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(a2, "strippedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "transformItem:atIndex:", v5, a3);
  return v5;
}

void __34__FPTransformOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __34__FPTransformOperation_actionMain__block_invoke_2_cold_1();

  }
  else if (objc_msgSend(v8, "count"))
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __34__FPTransformOperation_actionMain__block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "signalReindexItemsIfNeededForErrorsByItem:", v8);
  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v7, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v12, "completedWithResult:error:", v13, v9);
  }
  else
  {
    objc_msgSend(v8, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completedWithResult:error:", v13, v15);

  }
}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  NSArray *items;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[4];

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FPTransformOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E444EF50;
  v7[4] = self;
  v7[5] = v8;
  objc_msgSend(v4, "transformItems:handler:", items, v7);

  -[FPActionOperation stitcher](self, "stitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flush");

  _Block_object_dispose(v8, 8);
}

uint64_t __44__FPTransformOperation_presendNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformItem:atIndex:", a2, (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++);
}

- (id)finalItemsForStitcherForResult:(id)a3
{
  return a3;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[FPTransformOperation finalItemsForStitcherForResult:](self, "finalItemsForStitcherForResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation stitcher](self, "stitcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithItems:error:", v8, v7);

  -[FPTransformOperation postStitchingFinishWithResult:error:](self, "postStitchingFinishWithResult:error:", v6, v7);
  -[FPTransformOperation transformCompletionBlock](self, "transformCompletionBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v6, v7);
    -[FPTransformOperation setTransformCompletionBlock:](self, "setTransformCompletionBlock:", 0);
  }

  v12.receiver = self;
  v12.super_class = (Class)FPTransformOperation;
  -[FPActionOperation finishWithResult:error:](&v12, sel_finishWithResult_error_, v6, v7);

}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 1145, CFSTR("UNREACHABLE: this should be overriden by the concrete operation"));

  return 0;
}

- (id)fp_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("modify items %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)items
{
  return self->_items;
}

- (id)transformCompletionBlock
{
  return self->_transformCompletionBlock;
}

- (void)setTransformCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformCompletionBlock, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)signalReindexItemsIfNeededForErrorsByItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Index out of sync. Forcing reindex of %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_327_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v6, "[DEBUG] Did signal reindex items %@ with error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void __34__FPTransformOperation_actionMain__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_27_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v0, v3, "[ERROR] couldn't %@: %@", v4);

  OUTLINED_FUNCTION_7();
}

@end
