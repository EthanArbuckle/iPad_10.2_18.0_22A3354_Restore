@implementation HUPreloadViewController

uint64_t ___HUPreloadViewController_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
  return 0;
}

id ___HUPreloadViewController_block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

id ___HUPreloadViewController_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "Preload for view controller: %@ failed with error: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
