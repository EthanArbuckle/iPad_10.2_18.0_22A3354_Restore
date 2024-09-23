@implementation FPUntrashOperation

- (id)replicateForItems:(id)a3
{
  id v4;
  FPUntrashOperation *v5;

  v4 = a3;
  v5 = -[FPUntrashOperation initWithItems:restoreDirectory:]([FPUntrashOperation alloc], "initWithItems:restoreDirectory:", v4, self->_restoreDirectory);

  return v5;
}

- (FPUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4
{
  id v7;
  FPUntrashOperation *v8;
  FPUntrashOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPUntrashOperation;
  v8 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v11, sel_initWithItemsOfDifferentProviders_action_, a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_restoreDirectory, a4);
    -[FPActionOperation setSetupRemoteOperationService:](v9, "setSetupRemoteOperationService:", 1);
  }

  return v9;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t *p_restoreDirectory;
  FPItem *restoreDirectory;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  p_restoreDirectory = (uint64_t *)&self->_restoreDirectory;
  restoreDirectory = self->_restoreDirectory;
  if (restoreDirectory)
  {
    v16 = 0;
    +[FPProviderDomain providerDomainForItem:cachePolicy:error:](FPProviderDomain, "providerDomainForItem:cachePolicy:error:", restoreDirectory, 0, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v9)
    {
      fp_current_or_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FPUntrashOperation subclassPreflightWithCompletion:].cold.1(p_restoreDirectory, v9, v10);

      ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v9);
    }
    else
    {
      objc_msgSend((id)*p_restoreDirectory, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperation itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke;
      v13[3] = &unk_1E444EF78;
      v15 = v5;
      v13[4] = self;
      v14 = v8;
      objc_msgSend(v12, "fetchParentsForItemID:recursively:completionHandler:", v11, 1, v13);

    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isTrashed") & 1) != 0)
          {

            objc_msgSend(*(id *)(a1 + 32), "itemManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = *(void **)(a1 + 40);
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2;
            v16[3] = &unk_1E444C198;
            v17 = v14;
            v15 = *(id *)(a1 + 48);
            v18 = *(_QWORD *)(a1 + 32);
            v19 = v15;
            objc_msgSend(v13, "fetchRootItemForProviderDomain:completionHandler:", v17, v16);

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();
LABEL_14:

}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2_cold_1(a1, v10, v11);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 472), a2);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v9();

}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  FPItem *rootDirectory;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;

  v5 = a3;
  -[FPItem itemIdentifier](self->_restoreDirectory, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrashed:", 0);
  rootDirectory = self->_rootDirectory;
  if (rootDirectory)
  {
    -[FPItem itemIdentifier](rootDirectory, "itemIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FPUntrashOperation transformItem:atIndex:].cold.1();

    v6 = (void *)v8;
  }
  if (v6)
  {
    objc_msgSend(v5, "setParentItemIdentifier:", v6);
    v10 = 1073741828;
  }
  else
  {
    v10 = 0x40000000;
  }

  return v10;
}

- (void)postStitchingFinishWithResult:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[FPUntrashOperation untrashCompletionBlock](self, "untrashCompletionBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    -[FPUntrashOperation setUntrashCompletionBlock:](self, "setUntrashCompletionBlock:", 0);
  }

}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPTransformOperation items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteItems:", v5);

  -[FPActionOperation stitcher](self, "stitcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flush");

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("untrash %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)untrashCompletionBlock
{
  return self->_untrashCompletionBlock;
}

- (void)setUntrashCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_untrashCompletionBlock, 0);
  objc_storeStrong((id *)&self->_rootDirectory, 0);
  objc_storeStrong((id *)&self->_restoreDirectory, 0);
}

- (void)subclassPreflightWithCompletion:(NSObject *)a3 .cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v6, "[ERROR] Failed retrieving provider domain for restore directory %@ error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, a3, "[ERROR] untrash operation preflight failed because of failed fetch root item for domain %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)transformItem:atIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] Untrash moving item %@ to root because restore directory is trashed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
