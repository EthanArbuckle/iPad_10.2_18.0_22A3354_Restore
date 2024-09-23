@implementation FPItemOperationLocator

uint64_t __55__FPItemOperationLocator_Daemon__startAccessingLocator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
}

void __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke_cold_1(a1, (uint64_t)v5, v7);

  }
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asFPItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFileURL:", v8);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__FPItemOperationLocator_Daemon__annotateWithPersonaSandboxIfNeeded___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "asFPItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] can't get url for item %@, %@", (uint8_t *)&v6, 0x16u);

}

@end
