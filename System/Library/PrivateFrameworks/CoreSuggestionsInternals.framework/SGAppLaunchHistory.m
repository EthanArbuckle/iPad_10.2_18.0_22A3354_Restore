@implementation SGAppLaunchHistory

- (unint64_t)launchCountForBundleId:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGAppLaunchHistory launchCountsForBundleIds:afterDate:limit:](self, "launchCountsForBundleIds:afterDate:limit:", v11, v9, a5, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countForObject:", v10);
  return v13;
}

- (id)launchCountsForBundleIds:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  unint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  unint64_t v35;
  _QWORD v36[4];
  id v37;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGAppLaunchHistory.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIds"));

  }
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v9, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "App");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "InFocus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0D026F0]);
    v17 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v18, 0, 0, 0);

    if (!v10)
    objc_msgSend(v15, "publisherWithUseCase:options:", CFSTR("SGAppLaunchHistory"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke;
    v36[3] = &unk_1E7DB11E8;
    v22 = v12;
    v37 = v22;
    objc_msgSend(v20, "filterWithIsIncluded:", v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_2;
    v32[3] = &unk_1E7DB1210;
    v33 = v9;
    v34 = v10;
    v35 = a5;
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_16;
    v28[3] = &unk_1E7DB1238;
    v30 = v22;
    v31 = a5;
    v29 = v11;
    v24 = v22;
    v25 = (id)objc_msgSend(v23, "sinkWithCompletion:shouldContinue:", v32, v28);

  }
  return v11;
}

uint64_t __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

void __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", CFSTR(","));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2048;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_fault_impl(&dword_1C3607000, v5, OS_LOG_TYPE_FAULT, "Error in launchCountsForBundleIds:%@ afterDate:%@ limit:%td %@", (uint8_t *)&v10, 0x2Au);

    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }

}

BOOL __63__SGAppLaunchHistory_launchCountsForBundleIds_afterDate_limit___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "countForObject:", v4) == *(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
  v5 = objc_msgSend(*(id *)(a1 + 40), "count") != 0;

  return v5;
}

@end
