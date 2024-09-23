@implementation FPDIterator

+ (id)iteratorForLocator:(id)a3 manager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FPDItemIterator *v14;
  void *v15;
  FPDItemIterator *v16;
  void *v17;
  FPDDiskIterator *v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isProviderItem")
    && (objc_msgSend(v5, "asFPItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "providerItemID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v5, "asFPItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "providerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerWithIdentifier:reason:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "asAppExtensionBackedProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [FPDItemIterator alloc];
    objc_msgSend(v5, "asFPItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPDItemIterator initWithItem:provider:](v14, "initWithItem:provider:", v15, v13);

  }
  else
  {
    if ((objc_msgSend(v5, "isProviderItem") & 1) != 0)
    {
      objc_msgSend(v5, "asFPItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "asURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = [FPDDiskIterator alloc];
    if ((objc_msgSend(v12, "fp_isFolder") & 1) != 0)
      v19 = 1;
    else
      v19 = objc_msgSend(v12, "fp_isPackage");
    v16 = -[FPDDiskIterator initWithURL:isDirectory:](v18, "initWithURL:isDirectory:", v12, v19);
  }

  return v16;
}

+ (id)iteratorForLocator:(id)a3 provider:(id)a4
{
  return +[FPDIterator iteratorForLocator:wantsDisk:provider:](FPDIterator, "iteratorForLocator:wantsDisk:provider:", a3, 0, a4);
}

+ (id)iteratorForLocator:(id)a3 wantsDisk:(BOOL)a4 provider:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  FPDDiskIterator *v14;
  uint64_t v15;
  FPDItemIterator *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isProviderItem"))
  {
    objc_msgSend(v7, "asFPItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[FPDIterator iteratorForLocator:wantsDisk:provider:].cold.1((uint64_t)v9, v11);

      v6 = 1;
    }
    objc_msgSend(v9, "fileURL");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (!v6 || !v12)
    {
      objc_msgSend(v8, "asAppExtensionBackedProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[FPDItemIterator initWithItem:provider:]([FPDItemIterator alloc], "initWithItem:provider:", v9, v17);

      goto LABEL_15;
    }

  }
  else
  {
    objc_msgSend(v7, "asURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      +[FPDIterator iteratorForLocator:wantsDisk:provider:].cold.2();
  }
  v14 = [FPDDiskIterator alloc];
  if ((objc_msgSend(v13, "fp_isFolder") & 1) != 0)
    v15 = 1;
  else
    v15 = objc_msgSend(v13, "fp_isPackage");
  v16 = -[FPDDiskIterator initWithURL:isDirectory:](v14, "initWithURL:isDirectory:", v13, v15);
LABEL_15:

  return v16;
}

+ (id)hybridIteratorForItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  FPDHybridIterator *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[FPDHybridIterator initWithItem:domain:enforceFPItem:]([FPDHybridIterator alloc], "initWithItem:domain:enforceFPItem:", v8, v7, v5);

  return v9;
}

- (id)nextWithError:(id *)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: missing override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_fault_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v5, 0xCu);
  }

  __assert_rtn("-[FPDIterator nextWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 70, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
}

- (id)nextItem
{
  uint64_t v3;

  v3 = 0;
  -[FPDIterator nextWithError:](self, "nextWithError:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)done
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: missing override"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDIterator done]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 82, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (unint64_t)numFoldersPopped
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: missing override"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDIterator numFoldersPopped]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 88, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)skipMaterializedTreeTraversal
{
  return self->_skipMaterializedTreeTraversal;
}

- (void)setSkipMaterializedTreeTraversal:(BOOL)a3
{
  self->_skipMaterializedTreeTraversal = a3;
}

- (BOOL)shouldDecorateItems
{
  return self->_shouldDecorateItems;
}

- (void)setShouldDecorateItems:(BOOL)a3
{
  self->_shouldDecorateItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (void)iteratorForLocator:(uint64_t)a1 wantsDisk:(NSObject *)a2 provider:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is a disk identifier, forcing disk enumeration", (uint8_t *)&v2, 0xCu);
}

+ (void)iteratorForLocator:wantsDisk:provider:.cold.2()
{
  __assert_rtn("+[FPDIterator iteratorForLocator:wantsDisk:provider:]", "FPDIterator.m", 57, "url");
}

@end
