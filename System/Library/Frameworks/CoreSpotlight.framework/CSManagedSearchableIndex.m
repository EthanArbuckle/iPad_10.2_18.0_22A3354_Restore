@implementation CSManagedSearchableIndex

+ (id)defaultSearchableIndex
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSManagedSearchableIndex_defaultSearchableIndex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSearchableIndex_onceToken_632 != -1)
    dispatch_once(&defaultSearchableIndex_onceToken_632, block);
  return (id)defaultSearchableIndex_sDefaultInstance_631;
}

void __50__CSManagedSearchableIndex_defaultSearchableIndex__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithName:protectionClass:bundleIdentifier:options:disableBatching:", CFSTR("CSSearchableIndexShared"), 0, 0, 0, 1);
  v2 = (void *)defaultSearchableIndex_sDefaultInstance_631;
  defaultSearchableIndex_sDefaultInstance_631 = v1;

}

- (const)defaultIndexPath
{
  void *v2;
  id v3;
  const char *v4;

  -[CSSearchableIndex bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CSManagedIndexDefaultPath(v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (id)initialConnection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[CSUnhousedSearchableIndex resolvedIndexPath](self, "resolvedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CSUnhousedIndexConnection unhousedIndexConnectionForToken:](CSManagedIndexConnection, "unhousedIndexConnectionForToken:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return addExtensionToken(a3, a4, a5);
}

- (void)setUISearchEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v6 = a4;
  v7 = CFSTR("0");
  if (v4)
    v7 = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setUISearchEnabled:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke;
  v10[3] = &unk_1E24023B8;
  v11 = v6;
  v9 = v6;
  -[CSSearchableIndex _issueCommand:completionHandler:](self, "_issueCommand:completionHandler:", v8, v10);

}

void __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "Error setting managed index UI search enablement: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
