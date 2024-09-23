@implementation ATXAppInfoManager

void __36___ATXAppInfoManager_sharedInstance__block_invoke()
{
  void *v0;
  _ATXAppInfoManager *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = [_ATXAppInfoManager alloc];
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_ATXAppInfoManager initWithDataStore:](v1, "initWithDataStore:", v2);
  v4 = (void *)sharedInstance__pasExprOnceResult_37;
  sharedInstance__pasExprOnceResult_37 = v3;

  objc_autoreleasePoolPop(v0);
}

void __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_app_install();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_cold_1(v2, v4);

  }
}

uint64_t __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  _ATXAppLaunch *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _ATXAppLaunch *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v3 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0xF4241)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    v12 = objc_msgSend(v6, "starting");

    if ((v12 & 1) != 0)
      goto LABEL_15;
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v13)
    {
      objc_msgSend(v13, "bundleID");
      v14 = (_ATXAppLaunch *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[_ATXAppLaunch isEqualToString:](v14, "isEqualToString:", v16) & 1) == 0)
      {

        goto LABEL_12;
      }
      objc_msgSend(v3, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extensionHostID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = [_ATXAppLaunch alloc];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "absoluteTimestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "eventBody");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "absoluteTimestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "launchReason");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:](v19, "initWithBundleId:startDate:endDate:timeZone:reason:", v20, v21, v23, 0, v24);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
LABEL_12:

      }
    }
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "extensionHostID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v3, "eventBody");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
LABEL_14:

  }
LABEL_15:

  return 1;
}

void __70___ATXAppInfoManager_computeAverageAndMedianSecondsBetweenAppLaunches__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "_ATXAppInfoManager: Can't read App.InFocus stream with error: %@", (uint8_t *)&v4, 0xCu);

}

@end
