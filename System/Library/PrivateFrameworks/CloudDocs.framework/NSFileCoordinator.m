@implementation NSFileCoordinator

void __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"+[NSFileCoordinator(BRAdditions) br_boostFilePresenter:]_block_invoke", 22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedItemURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fp_obfuscatedPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed boosting file presenter at %@ - %@%@", (uint8_t *)&v9, 0x20u);

    }
  }

}

uint64_t __56__NSFileCoordinator_BRAdditions__br_boostFilePresenter___block_invoke_1(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", 0, a2);
}

@end
