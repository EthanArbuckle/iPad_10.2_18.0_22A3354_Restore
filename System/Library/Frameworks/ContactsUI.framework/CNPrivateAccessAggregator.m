@implementation CNPrivateAccessAggregator

- (CNPrivateAccessAggregator)init
{
  CNPrivateAccessAggregator *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CNPrivateAccessAggregator *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNPrivateAccessAggregator;
  v2 = -[CNPrivateAccessAggregator init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    -[CNPrivateAccessAggregator setFileCoordinator:](v2, "setFileCoordinator:", v3);

    -[CNPrivateAccessAggregator fileURLToPrivateAccessAggregator](v2, "fileURLToPrivateAccessAggregator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPrivateAccessAggregator setPrivateAccessAggregatorURL:](v2, "setPrivateAccessAggregatorURL:", v4);

    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPrivateAccessAggregator setSupportedClasses:](v2, "setSupportedClasses:", v10);

    v11 = v2;
  }

  return v2;
}

- (id)applicationGroupContainerURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.contacts.private-access"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "Container URL: %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Unable to get container URL. %{public}@", (uint8_t *)&v12, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

- (id)fileURLToPrivateAccessAggregator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNPrivateAccessAggregator applicationGroupContainerURL](self, "applicationGroupContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContactsPickerView.privateaccess"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)readBundleIdentifiersFromURLAccessor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  char isKindOfClass;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "length"))
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v9 = (void *)MEMORY[0x1E0CB3710];
  -[CNPrivateAccessAggregator supportedClasses](self, "supportedClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v10, v8, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (!v11 && v12)
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v12;
      _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);
    }

    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v11 = 0;
      *a4 = v12;
      goto LABEL_10;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEFAULT, "Current format is missing last access time. Lets ignore", buf, 2u);
      }

      goto LABEL_16;
    }
  }
LABEL_10:

  return v11;
}

- (id)filterExpiredPrivateAccessEntries:(id)a3
{
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(a3, "_cn_filter:", &__block_literal_global_18_30414);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSupportedOnThisPlatform
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isiOSAppOnMac") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMacCatalystApp");

    v3 = v5 ^ 1;
  }

  return v3;
}

- (void)updateAggregatorWithBundleID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  char v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _BYTE *v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  _BYTE *v29;
  id v30[2];
  id location;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CNPrivateAccessAggregator isSupportedOnThisPlatform](self, "isSupportedOnThisPlatform"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30378;
    v37 = __Block_byref_object_dispose__30379;
    v38 = 0;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entitlementVerifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D137A0];
    v9 = (id *)(v34 + 5);
    obj = (id)v34[5];
    v10 = objc_msgSend(v7, "currentProcessHasBooleanEntitlement:error:", v8, &obj);
    objc_storeStrong(v9, obj);

    if ((v10 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v40 = 0;
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke;
      aBlock[3] = &unk_1E204BC30;
      objc_copyWeak(v30, &location);
      v12 = v5;
      v30[1] = (id)a2;
      v28 = v12;
      v29 = buf;
      v13 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "schedulerProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backgroundScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_30;
      v22[3] = &unk_1E204BC58;
      objc_copyWeak(&v26, &location);
      v24 = &v33;
      v17 = v13;
      v23 = v17;
      v25 = buf;
      objc_msgSend(v16, "performBlock:qualityOfService:", v22, 4);

      objc_destroyWeak(&v26);
      objc_destroyWeak(v30);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "mainBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v34[5];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Current process(%{public}@) is not entitled to record private access to contacts (error: %@)", buf, 0x16u);

      }
    }
    _Block_object_dispose(&v33, 8);

  }
}

- (id)bundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;
  void *v10;
  uint64_t v11;
  id obj;
  _QWORD aBlock[8];
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[CNPrivateAccessAggregator isSupportedOnThisPlatform](self, "isSupportedOnThisPlatform"))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__30378;
    v32[4] = __Block_byref_object_dispose__30379;
    v33 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__30378;
    v30 = __Block_byref_object_dispose__30379;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__30378;
    v20 = __Block_byref_object_dispose__30379;
    v21 = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CNPrivateAccessAggregator_bundleIdentifiers__block_invoke;
    aBlock[3] = &unk_1E204BC80;
    objc_copyWeak(&v14, &location);
    aBlock[4] = v32;
    aBlock[5] = &v16;
    aBlock[6] = &v22;
    aBlock[7] = &v26;
    v3 = _Block_copy(aBlock);
    -[CNPrivateAccessAggregator fileCoordinator](self, "fileCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPrivateAccessAggregator privateAccessAggregatorURL](self, "privateAccessAggregatorURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(v17 + 5);
    obj = (id)v17[5];
    objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 0, &obj, v3);
    objc_storeStrong(v6, obj);

    if (!*((_BYTE *)v23 + 24) || v17[5])
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        -[CNPrivateAccessAggregator privateAccessAggregatorURL](self, "privateAccessAggregatorURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v17[5];
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        v36 = 2112;
        v37 = v11;
        _os_log_fault_impl(&dword_18AC56000, v7, OS_LOG_TYPE_FAULT, "Unable to read from Private access aggregator (%@), error: %@", buf, 0x16u);

      }
    }
    v8 = (id)v27[5];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)resetLoggedIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  __int128 *p_buf;
  id v21;
  _QWORD aBlock[5];
  id location;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 buf;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[CNPrivateAccessAggregator isSupportedOnThisPlatform](self, "isSupportedOnThisPlatform"))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__30378;
    v29 = __Block_byref_object_dispose__30379;
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entitlementVerifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D137D0];
    v6 = (id *)(v26 + 5);
    obj = (id)v26[5];
    v7 = objc_msgSend(v4, "currentProcessHasBooleanEntitlement:error:", v5, &obj);
    objc_storeStrong(v6, obj);

    if ((v7 & 1) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v32 = 0x2020000000;
      v33 = 0;
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke;
      aBlock[3] = &unk_1E204BCA8;
      aBlock[4] = &buf;
      v9 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "schedulerProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "backgroundScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke_32;
      v17[3] = &unk_1E204BC58;
      objc_copyWeak(&v21, &location);
      v19 = &v25;
      v13 = v9;
      v18 = v13;
      p_buf = &buf;
      objc_msgSend(v12, "performBlock:qualityOfService:", v17, 4);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mainBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_18AC56000, v14, OS_LOG_TYPE_ERROR, "%{public}@ is not entitled to reset private contact access records", (uint8_t *)&buf, 0xCu);

      }
    }
    _Block_object_dispose(&v25, 8);

  }
}

- (BOOL)shouldShowPrivacyTipInPickerForBundleIdentifier:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  uint64_t v15;
  id obj;
  _QWORD aBlock[4];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  id v23[2];
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__30378;
  v35[4] = __Block_byref_object_dispose__30379;
  v36 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__30378;
  v29 = __Block_byref_object_dispose__30379;
  v30 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E204BCF8;
  objc_copyWeak(v23, &location);
  v19 = v35;
  v20 = &v25;
  v21 = &v31;
  v6 = v5;
  v23[1] = (id)a2;
  v18 = v6;
  v22 = &v37;
  v7 = _Block_copy(aBlock);
  -[CNPrivateAccessAggregator fileCoordinator](self, "fileCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPrivateAccessAggregator privateAccessAggregatorURL](self, "privateAccessAggregatorURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v26 + 5);
  obj = (id)v26[5];
  objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", v9, 0, &obj, v7);
  objc_storeStrong(v10, obj);

  if (!*((_BYTE *)v32 + 24) || v26[5])
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      -[CNPrivateAccessAggregator privateAccessAggregatorURL](self, "privateAccessAggregatorURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26[5];
      *(_DWORD *)buf = 138412546;
      v42 = v14;
      v43 = 2112;
      v44 = v15;
      _os_log_fault_impl(&dword_18AC56000, v11, OS_LOG_TYPE_FAULT, "Unable to read from Private access aggregator (%@), error: %@", buf, 0x16u);

    }
  }
  v12 = *((_BYTE *)v38 + 24) != 0;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v12;
}

- (void)privacyTipDismissedByUserForBundleIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  _QWORD *v20;
  id v21[2];
  id location;
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];
  char v26;

  v5 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__30378;
  v23[4] = __Block_byref_object_dispose__30379;
  v24 = 0;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E204BC30;
  objc_copyWeak(v21, &location);
  v7 = v5;
  v21[1] = (id)a2;
  v19 = v7;
  v20 = v25;
  v8 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "schedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_34;
  v13[3] = &unk_1E204BC58;
  objc_copyWeak(&v17, &location);
  v15 = v23;
  v12 = v8;
  v14 = v12;
  v16 = v25;
  objc_msgSend(v11, "performBlock:qualityOfService:", v13, 4);

  objc_destroyWeak(&v17);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (void)setFileCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinator, a3);
}

- (NSURL)privateAccessAggregatorURL
{
  return self->_privateAccessAggregatorURL;
}

- (void)setPrivateAccessAggregatorURL:(id)a3
{
  objc_storeStrong((id *)&self->_privateAccessAggregatorURL, a3);
}

- (NSSet)supportedClasses
{
  return self->_supportedClasses;
}

- (void)setSupportedClasses:(id)a3
{
  objc_storeStrong((id *)&self->_supportedClasses, a3);
}

- (NSMutableArray)privateAccessClients
{
  return self->_privateAccessClients;
}

- (void)setPrivateAccessClients:(id)a3
{
  objc_storeStrong((id *)&self->_privateAccessClients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAccessClients, 0);
  objc_storeStrong((id *)&self->_supportedClasses, 0);
  objc_storeStrong((id *)&self->_privateAccessAggregatorURL, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
}

void __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CNPrivateAccessEntry *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v33 = 0;
  objc_msgSend(WeakRetained, "readBundleIdentifiersFromURLAccessor:error:", v6, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v33;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
    v29 = v5;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v9)
  {
    v29 = v5;
    v11 = 0;
LABEL_3:
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_33;
    v31[3] = &unk_1E204BC08;
    v32 = *(id *)(a1 + 32);
    -[NSObject objectsPassingTest:](v11, "objectsPassingTest:", v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "count"))
    {
      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
      {
        +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v35 = v24;
          v36 = 2112;
          v37 = v25;
          _os_log_fault_impl(&dword_18AC56000, v14, OS_LOG_TYPE_FAULT, "%@: more than 1 entry found for %@; Defaulting to first",
            buf,
            0x16u);

        }
      }
      objc_msgSend(v13, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v16, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v16, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v28, WeakRetained, CFSTR("CNPrivateAccessAggregator.m"), 387, CFSTR("Existing entry is for %@ but the given bundleID is %@"), v27, *(_QWORD *)(a1 + 32));

      }
      -[NSObject removeObject:](v11, "removeObject:", v16);

    }
    v17 = -[CNPrivateAccessEntry initWithBundleIdentifier:privateAccessTipDismissedByUser:]([CNPrivateAccessEntry alloc], "initWithBundleIdentifier:privateAccessTipDismissedByUser:", *(_QWORD *)(a1 + 32), 1);
    -[NSObject addObject:](v11, "addObject:", v17);
    if (v11)
    {
      -[NSObject allObjects](v11, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v18);

    }
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v30;
    v21 = v20;
    if (v19 || !v20)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v19, "writeToURL:atomically:", v29, 1);
    }
    else
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        v36 = 2112;
        v37 = v21;
        _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Unable to archive contents (%@). Error: %@", buf, 0x16u);
      }

    }
    v5 = v29;
    goto LABEL_24;
  }
  +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v23;
    v36 = 2112;
    v37 = v9;
    _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);

  }
LABEL_24:

}

void __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_34(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "fileCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v3, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v4, 0, v5, 0, &obj, v6);
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_fault_impl(&dword_18AC56000, v8, OS_LOG_TYPE_FAULT, "Unable to read from / write to Private access aggregator (%@), error: %@", buf, 0x16u);

    }
  }

}

uint64_t __74__CNPrivateAccessAggregator_privacyTipDismissedByUserForBundleIdentifier___block_invoke_33(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "obj = %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = objc_msgSend(v5, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)v7)
    *a3 = 1;

  return v7;
}

void __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id obj;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 72);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(WeakRetained, "readBundleIdentifiersFromURLAccessor:error:", v4, &obj);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  else
  {
    v10 = 0;
  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke_2;
  v22 = &unk_1E204BCD0;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v10, "_cn_filter:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v26 = v15;
        _os_log_fault_impl(&dword_18AC56000, v13, OS_LOG_TYPE_FAULT, "Hmmm.. more then one entry is found for %@; Defaulting to first",
          buf,
          0xCu);
      }

    }
    objc_msgSend(v12, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 80);
      objc_msgSend(v14, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v17, WeakRetained, CFSTR("CNPrivateAccessAggregator.m"), 335, CFSTR("Existing entry is for %@ but the given bundleID is %@"), v18, *(_QWORD *)(a1 + 32), v19, v20, v21, v22);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v14, "isPrivateAccessTipDismissedByUser") ^ 1;

  }
}

uint64_t __77__CNPrivateAccessAggregator_shouldShowPrivacyTipInPickerForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

void __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", MEMORY[0x1E0C9AA60], 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "writeToURL:atomically:", v3, 1);
  }
  else
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Unable to reset logged identifiers. Error: %@", buf, 0xCu);
    }

  }
}

void __51__CNPrivateAccessAggregator_resetLoggedIdentifiers__block_invoke_32(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "fileCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v3, "coordinateWritingItemAtURL:options:error:byAccessor:", v4, 0, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_18AC56000, v7, OS_LOG_TYPE_ERROR, "Unable to reset Private access aggregator (%@), error: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileManager");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "removeItemAtURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v12, "BOOLValue");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v11, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v11, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "code");

        if (v15 != 4)
        {
          +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v11, "error");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v22 = v19;
            _os_log_fault_impl(&dword_18AC56000, v16, OS_LOG_TYPE_FAULT, "Unable to delete the Private access aggregator file, error: %@", buf, 0xCu);

          }
        }
      }
    }

  }
}

void __46__CNPrivateAccessAggregator_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id obj;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(WeakRetained, "readBundleIdentifiersFromURLAccessor:error:", v3, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(WeakRetained, "filterExpiredPrivateAccessEntries:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v12 = 0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "bundleIdentifier", (_QWORD)v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v15);
  }

}

void __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CNPrivateAccessEntry *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v31 = 0;
  objc_msgSend(WeakRetained, "readBundleIdentifiersFromURLAccessor:error:", v6, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v31;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
    v27 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v9)
  {
    v27 = 0;
    v11 = 0;
LABEL_3:
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_21;
    v29[3] = &unk_1E204BC08;
    v30 = *(id *)(a1 + 32);
    -[NSObject objectsPassingTest:](v11, "objectsPassingTest:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v15, "bundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v26, WeakRetained, CFSTR("CNPrivateAccessAggregator.m"), 165, CFSTR("Existing entry is for %@ but the given bundleID is %@"), v25, *(_QWORD *)(a1 + 32));

      }
      v16 = objc_msgSend(v15, "isPrivateAccessTipDismissedByUser");
      -[NSObject removeObject:](v11, "removeObject:", v15);

    }
    else
    {
      v16 = 0;
    }
    v17 = -[CNPrivateAccessEntry initWithBundleIdentifier:privateAccessTipDismissedByUser:]([CNPrivateAccessEntry alloc], "initWithBundleIdentifier:privateAccessTipDismissedByUser:", *(_QWORD *)(a1 + 32), v16);
    -[NSObject addObject:](v11, "addObject:", v17);
    if (v11)
    {
      -[NSObject allObjects](v11, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v18);

    }
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v28;
    v21 = v20;
    if (v19 || !v20)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v19, "writeToURL:atomically:", v5, 1);
    }
    else
    {
      +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v10;
        v34 = 2112;
        v35 = v21;
        _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Unable to archive contents (%@). Error: %@", buf, 0x16u);
      }

    }
    v9 = v27;
    goto LABEL_21;
  }
  +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v23;
    v34 = 2112;
    v35 = v9;
    _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Unable to read contents from Private access aggregator (%@). Error: %@", buf, 0x16u);

  }
LABEL_21:

}

void __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_30(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "fileCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v3, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v4, 0, v5, 0, &obj, v6);
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(WeakRetained, "privateAccessAggregatorURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_fault_impl(&dword_18AC56000, v8, OS_LOG_TYPE_FAULT, "Unable to read from / write to Private access aggregator (%@), error: %@", buf, 0x16u);

    }
  }

}

uint64_t __58__CNPrivateAccessAggregator_updateAggregatorWithBundleID___block_invoke_21(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "obj = %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = objc_msgSend(v5, "isForClientWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)v7)
    *a3 = 1;

  return v7;
}

uint64_t __63__CNPrivateAccessAggregator_filterExpiredPrivateAccessEntries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExpired") ^ 1;
}

+ (id)log
{
  if (log_cn_once_token_1_30442 != -1)
    dispatch_once(&log_cn_once_token_1_30442, &__block_literal_global_30443);
  return (id)log_cn_once_object_1_30444;
}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_2 != -1)
    dispatch_once(&sharedInstance_cn_once_token_2, &__block_literal_global_4_30441);
  return (id)sharedInstance_cn_once_object_2;
}

+ (void)recordAccessForBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CNPrivateAccessAggregator sharedInstance](CNPrivateAccessAggregator, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAggregatorWithBundleID:", v3);

}

+ (id)allLoggedBundledIdentifiers
{
  void *v2;
  void *v3;

  +[CNPrivateAccessAggregator sharedInstance](CNPrivateAccessAggregator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)resetLog
{
  id v2;

  +[CNPrivateAccessAggregator sharedInstance](CNPrivateAccessAggregator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetLoggedIdentifiers");

}

+ (BOOL)shouldShowPickerTipForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    +[CNPrivateAccessAggregator sharedInstance](CNPrivateAccessAggregator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowPrivacyTipInPickerForBundleIdentifier:", v3);

    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEFAULT, "Should show limited picker tip: %i", (uint8_t *)v8, 8u);
    }

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (void)recordPickerTipDismissalForBundleIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[CNPrivateAccessAggregator log](CNPrivateAccessAggregator, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Recording limited picker tip dismissal for %@", (uint8_t *)&v6, 0xCu);
    }

    +[CNPrivateAccessAggregator sharedInstance](CNPrivateAccessAggregator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privacyTipDismissedByUserForBundleIdentifier:", v3);

  }
}

void __43__CNPrivateAccessAggregator_sharedInstance__block_invoke()
{
  CNPrivateAccessAggregator *v0;
  void *v1;

  v0 = objc_alloc_init(CNPrivateAccessAggregator);
  v1 = (void *)sharedInstance_cn_once_object_2;
  sharedInstance_cn_once_object_2 = (uint64_t)v0;

}

void __32__CNPrivateAccessAggregator_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "PrivateAccess");
  v1 = (void *)log_cn_once_object_1_30444;
  log_cn_once_object_1_30444 = (uint64_t)v0;

}

@end
