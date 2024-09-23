@implementation CMLUseCaseGroupManager

+ (CMLUseCaseGroupManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CMLUseCaseGroupManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (CMLUseCaseGroupManager *)(id)sharedManager_sharedManager;
}

void __39__CMLUseCaseGroupManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (id)listUseCaseGroupsWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  v22 = 0;
  v23 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  +[CMLXPC createConnection](CMLXPC, "createConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v5, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLLog client](CMLLog, "client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    _os_log_impl(&dword_237BC8000, v7, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__CMLUseCaseGroupManager_listUseCaseGroupsWithError___block_invoke;
  v16[3] = &unk_2509A80E0;
  v16[4] = &v24;
  v16[5] = &v17;
  objc_msgSend(v6, "listUseCaseGroupsWithReply:", v16);
  if (a3)
  {
    v9 = v23;
    if (!v23)
      v9 = (id)v18[5];
    *a3 = objc_retainAutorelease(v9);
  }
  +[CMLLog client](CMLLog, "client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25[5] != 0;
    v13 = v18[5];
    *(_DWORD *)buf = 138412802;
    v31 = v11;
    v32 = 1026;
    v33 = v12;
    v34 = 2114;
    v35 = v13;
    _os_log_impl(&dword_237BC8000, v10, OS_LOG_TYPE_DEFAULT, "%@ Request complete data:%{public}d error:%{public}@", buf, 0x1Cu);

  }
  objc_msgSend(v5, "invalidate");
  v14 = (id)v25[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __53__CMLUseCaseGroupManager_listUseCaseGroupsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1300, v6, CFSTR("Unable to list use-case groups"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (BOOL)configureGroupWithName:(id)a3 useCaseGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  +[CMLXPC createConnection](CMLXPC, "createConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v10, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLLog client](CMLLog, "client");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v13;
    _os_log_impl(&dword_237BC8000, v12, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __68__CMLUseCaseGroupManager_configureGroupWithName_useCaseGroup_error___block_invoke;
  v20[3] = &unk_2509A8108;
  v20[4] = &v21;
  objc_msgSend(v11, "configureUseCaseGroupWithName:useCaseGroup:reply:", v8, v9, v20);
  if (a5)
  {
    v14 = v27;
    if (!v27)
      v14 = (id)v22[5];
    *a5 = objc_retainAutorelease(v14);
  }
  +[CMLLog client](CMLLog, "client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22[5];
    *(_DWORD *)buf = 138412546;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_237BC8000, v15, OS_LOG_TYPE_DEFAULT, "%@ Request complete error:%{public}@", buf, 0x16u);

  }
  objc_msgSend(v10, "invalidate");
  v18 = v22[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v18;
}

void __68__CMLUseCaseGroupManager_configureGroupWithName_useCaseGroup_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1400, a2, CFSTR("Unable to configure use-case group"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
