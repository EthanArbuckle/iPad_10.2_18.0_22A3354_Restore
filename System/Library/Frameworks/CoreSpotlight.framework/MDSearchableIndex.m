@implementation MDSearchableIndex

- (void)indexSearchableItems:(id)a3 stateInfo:(id)a4 completionHandler:(id)a5
{
  -[CSSearchableIndex indexSearchableItems:completionHandler:](self, "indexSearchableItems:completionHandler:", a3, a5);
}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSearchableIndex *v11;
  void *v12;
  void *v13;
  MDSearchableIndex *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  MDSearchableIndex *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "jobOptions"))
  {
    v11 = [CSSearchableIndex alloc];
    -[CSSearchableIndex name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableIndex bundleIdentifier](self, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:](v11, "_initWithName:protectionClass:bundleIdentifier:options:", v12, v9, v13, objc_msgSend(v8, "jobOptions"));

  }
  else
  {
    v14 = self;
  }
  if (objc_msgSend(v8, "jobType") == 1)
  {
    -[CSSearchableIndex indexDelegate](self, "indexDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      logForCSLogCategoryIndex();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v8;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_18C42F000, v17, OS_LOG_TYPE_DEFAULT, "deprecated - reindexSearchableItemsWithIdentifiers, job:%@, index:%@", buf, 0x16u);
      }

      -[CSSearchableIndex indexDelegate](self, "indexDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifiersToReindex");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
      v27[3] = &unk_1E2401190;
      v28 = v10;
      objc_msgSend(v18, "index:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v14, v19, v27);

      v20 = v28;
      goto LABEL_12;
    }
LABEL_13:
    v24.receiver = self;
    v24.super_class = (Class)MDSearchableIndex;
    -[CSSearchableIndex performIndexJob:protectionClass:acknowledgementHandler:](&v24, sel_performIndexJob_protectionClass_acknowledgementHandler_, v8, v9, v10);
    goto LABEL_14;
  }
  if (objc_msgSend(v8, "jobType") != 2)
    goto LABEL_13;
  -[CSSearchableIndex indexDelegate](self, "indexDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) == 0)
    goto LABEL_13;
  -[CSSearchableIndex indexDelegate](self, "indexDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2;
  v25[3] = &unk_1E2401190;
  v26 = v10;
  objc_msgSend(v23, "reindexAllSearchableItemsForIndex:acknowledgementHandler:", v14, v25);

  v20 = v26;
LABEL_12:

LABEL_14:
}

uint64_t __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MDSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
