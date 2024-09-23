@implementation CNCoreSpotlightSearch

+ (id)executeQuery:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 fetchAttributes:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x19400675C]();
  getCSSearchQueryContextClass[0]();
  v16 = (void *)objc_opt_new();
  v26[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProtectionClasses:", v17);

  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBundleIDs:", v18);

  objc_msgSend(v16, "setFetchAttributes:", v14);
  v19 = (void *)objc_msgSend(objc_alloc((Class)getCSSearchQueryClass[0]()), "initWithQueryString:context:", v11, v16);
  if (v19)
  {
    v24 = 0;
    +[CNCoreSpotlightSearch _runQuery:timeout:error:](CNCoreSpotlightSearch, "_runQuery:timeout:error:", v19, &v24, 120.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
  }
  else
  {
    v21 = 0;
    v20 = 0;
  }

  objc_autoreleasePoolPop(v15);
  if (v21)
  {
    v22 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v21);
  }
  else
  {
    v22 = v20;
  }

  return v22;
}

+ (id)_runQuery:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v7;
  void *v8;
  dispatch_group_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = dispatch_group_create();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17;
  v27 = __Block_byref_object_dispose__17;
  v28 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke;
  v21[3] = &unk_1E29FAAD0;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v7, "setFoundItemsHandler:", v21);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke_2;
  v18[3] = &unk_1E29FAAF8;
  v20 = &v23;
  v12 = v9;
  v19 = v12;
  objc_msgSend(v7, "setCompletionHandler:", v18);
  dispatch_group_enter(v12);
  objc_msgSend(v7, "start");
  v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  if (dispatch_group_wait(v12, v13))
  {
    objc_msgSend(v7, "cancel");
    CNSetError(a5, 1001, 0);
  }
  else if (a5)
  {
    v17 = (void *)v24[5];
    if (v17)
      *a5 = (id)objc_msgSend(v17, "copy");
  }
  v14 = v19;
  v15 = v11;

  _Block_object_dispose(&v23, 8);
  return v15;
}

uint64_t __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __49__CNCoreSpotlightSearch__runQuery_timeout_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
