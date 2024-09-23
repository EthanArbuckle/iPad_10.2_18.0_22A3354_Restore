@implementation LNEmbeddedApplicationConnection

+ (Class)connectionOptionsClass
{
  return (Class)objc_opt_class();
}

- (BOOL)refreshWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LNEmbeddedApplicationConnection;
  v5 = -[LNConnection refreshWithOptions:](&v16, sel_refreshWithOptions_, v4);
  if (v5)
  {
    -[LNConnection queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = v4;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    getLNLogCategoryConnection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_INFO, "%{public}@ refreshWithOptions: %{public}@", buf, 0x16u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke;
    v14[3] = &unk_1E45DDE40;
    v14[4] = self;
    v15 = v9;
    v12 = v9;
    -[LNEmbeddedApplicationConnection enqueueOpenApplicationOperation:](self, "enqueueOpenApplicationOperation:", v14);

  }
  return v5;
}

void __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_msgSend(v3, "newConnectionAction");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke_2;
  v5[3] = &unk_1E45DC5C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "openApplicationWithOptions:connectionAction:completionHandler:", v3, v4, v5);

}

- (void)openApplicationWithOptions:(id)a3 connectionAction:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  LNEmbeddedApplicationConnection *v16;
  id v17;
  void (**v18)(void *, _QWORD, id);
  id v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  LNEmbeddedApplicationConnection *v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  int v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  LNOpenApplicationConnectionOperation *v51;
  uint64_t v52;
  void *v53;
  LNOpenApplicationConnectionOperation *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  LNOpenApplicationConnectionOperation *v68;
  void *v69;
  LNEmbeddedApplicationConnection *v70;
  id v71;
  void (**v72)(void *, _QWORD, id);
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  _QWORD v77[5];
  LNEmbeddedApplicationConnection *v78;
  LNOpenApplicationConnectionOperation *v79;
  id v80;
  _QWORD v81[5];
  void (**v82)(void *, _QWORD, id);
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  _QWORD aBlock[5];
  LNEmbeddedApplicationConnection *v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  LNEmbeddedApplicationConnection *v94;
  __int16 v95;
  id v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v73 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEmbeddedApplicationConnection.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[LNConnection queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Open App Request ID: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke;
  aBlock[3] = &unk_1E45DC618;
  aBlock[4] = self;
  v16 = v14;
  v89 = v16;
  v17 = v10;
  v90 = v17;
  v18 = (void (**)(void *, _QWORD, id))_Block_copy(aBlock);
  v76 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v9, "sceneless"))
  {
    v19 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[LNConnection bundleIdentifier](self, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0;
    v21 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:allowPlaceholder:error:", v20, 0, &v87);
    v22 = v87;

    if (v22)
    {
      v18[2](v18, 0, v22);
LABEL_11:

      v29 = v73;
      goto LABEL_44;
    }
    v25 = v15;
    -[LNEmbeddedApplicationConnection preflightManager](self, "preflightManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "requiresPreflightForApplicationRecord:", v21);

    if (v27)
    {
      LNConnectionErrorWithCode(1700);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v28);

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v21, "supportsMultiwindow"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKeyedSubscript:", v47, *MEMORY[0x1E0DAB8A8]);

    v15 = v25;
    goto LABEL_29;
  }
  v23 = objc_msgSend(v9, "actionSource");
  if (v23 == 7)
  {
    v24 = (_QWORD *)MEMORY[0x1E0DAB818];
  }
  else
  {
    if (v23 != 6)
      goto LABEL_14;
    v24 = (_QWORD *)MEMORY[0x1E0DAB800];
  }
  objc_msgSend(v76, "setObject:forKeyedSubscript:", *v24, *MEMORY[0x1E0D22D58]);
LABEL_14:
  if ((objc_msgSend(v9, "activateSuspended") & 1) == 0)
  {
    v71 = v17;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[LNConnection executors](self, "executors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "keyEnumerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    if (v32)
    {
      v33 = v32;
      v72 = v18;
      v34 = self;
      v70 = v16;
      v35 = *(_QWORD *)v84;
      v75 = *MEMORY[0x1E0DAB820];
      v74 = *MEMORY[0x1E0D22D58];
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v84 != v35)
            objc_enumerationMutation(v21);
          v37 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
          -[LNConnection executors](v34, "executors");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "delegate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_opt_respondsToSelector();

          if ((v41 & 1) != 0)
          {
            objc_msgSend(v39, "delegate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "progressIsPersistentInSystemApertureForExecutor:", v39);

            if (v43)
              objc_msgSend(v76, "setObject:forKeyedSubscript:", v75, v74);
          }
          objc_msgSend(v39, "delegate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_opt_respondsToSelector();

          if ((v45 & 1) != 0)
          {
            objc_msgSend(v39, "delegate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "executorWillLaunchApplicationInForeground:", v39);

          }
        }
        v33 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      }
      while (v33);
      v16 = v70;
      v17 = v71;
      v18 = v72;
      self = v34;
      v15 = MEMORY[0x1E0C809B0];
    }
LABEL_29:

  }
  v48 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v76, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAB870]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "activateSuspended"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setObject:forKeyedSubscript:", v49, *MEMORY[0x1E0D22D00]);

  objc_msgSend(v76, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D22DA8]);
  objc_msgSend(v76, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D22D88]);
  if (objc_msgSend(v9, "sceneless"))
    v50 = &unk_1E45FA598;
  else
    v50 = &unk_1E45FA5B0;
  objc_msgSend(v76, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D22D50]);
  if (objc_msgSend(v9, "isCameraCaptureAction"))
    objc_msgSend(v76, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("__LaunchCameraCapture"));
  v51 = [LNOpenApplicationConnectionOperation alloc];
  v52 = objc_msgSend(v9, "openApplicationPriority");
  -[LNConnection queue](self, "queue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v15;
  v81[1] = 3221225472;
  v81[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_41;
  v81[3] = &unk_1E45DC640;
  v81[4] = self;
  v82 = v18;
  v54 = -[LNOpenApplicationConnectionOperation initWithPriority:queue:completionHandler:](v51, "initWithPriority:queue:completionHandler:", v52, v53, v81);

  if (v73)
  {
    -[LNEmbeddedApplicationConnection linkConnectionActionWithOpenApplicationIdentifier:connectionAction:connectionOperation:](self, "linkConnectionActionWithOpenApplicationIdentifier:connectionAction:connectionOperation:", v16, v73, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D22CE0]);

  }
  objc_msgSend(v9, "actionSourceOverride");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    getLNLogCategoryConnection();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionSourceOverride");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = v59;
      v93 = 2114;
      v94 = self;
      v95 = 2114;
      v96 = v60;
      _os_log_impl(&dword_1A18F6000, v58, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Overriding launch origin: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v9, "actionSourceOverride");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0D22D58]);

  }
  v62 = v15;
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v76);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  getLNLogCategoryConnection();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v92 = v65;
    v93 = 2114;
    v94 = v16;
    v95 = 2114;
    v96 = v76;
    _os_log_impl(&dword_1A18F6000, v64, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Opening app using FBSOpenApplicationService with options: %{public}@", buf, 0x20u);

  }
  -[LNEmbeddedApplicationConnection openApplicationService](self, "openApplicationService");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v62;
  v77[1] = 3221225472;
  v77[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_44;
  v77[3] = &unk_1E45DC690;
  v77[4] = self;
  v78 = v16;
  v79 = v54;
  v29 = v73;
  v80 = v73;
  v68 = v54;
  objc_msgSend(v66, "openApplication:withOptions:completion:", v67, v63, v77);

LABEL_44:
}

- (PDCPreflightManager)preflightManager
{
  return self->_preflightManager;
}

- (FBSOpenApplicationService)openApplicationService
{
  return self->_openApplicationService;
}

uint64_t __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    getLNLogCategoryConnection();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "logPrefix");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v32 = v3;
      v33 = 2114;
      v34 = v4;
      v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Failed to open app with error: %{public}@", buf, 0x20u);

    }
    v6 = *(void **)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v6, "finishWithActionResponse:error:", 0, v7);
  }
  getLNLogCategoryConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v32 = v10;
    v33 = 2114;
    v34 = v11;
    v35 = 2114;
    v36 = v12;
    _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Successfully opened app with process handle %{public}@", buf, 0x20u);

  }
  v13 = *(_QWORD *)(a1 + 72);
  getLNLogCategoryConnection();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 48), "logPrefix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v32 = v21;
      v33 = 2114;
      v34 = v22;
      _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Completing with nil response because connection action wasn't provided", buf, 0x16u);

    }
    v6 = *(void **)(a1 + 64);
    v7 = 0;
    return objc_msgSend(v6, "finishWithActionResponse:error:", 0, v7);
  }
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 48), "logPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138543874;
    v32 = v16;
    v33 = 2114;
    v34 = v17;
    v35 = 2114;
    v36 = v18;
    _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Completion will be handled by UILinkConnectionActionResponse to UILinkConnectionAction(%{public}@)", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "auditToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "realToken");
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  v23 = *(void **)(a1 + 48);
  v28[0] = v29;
  v28[1] = v30;
  objc_msgSend(v23, "setAuditToken:", v28);

  getLNLogCategoryConnection();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "logPrefix");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 56);
    v27 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v32 = v25;
    v33 = 2114;
    v34 = v26;
    v35 = 2114;
    v36 = v27;
    _os_log_impl(&dword_1A18F6000, v24, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Enqueuing %{public}@ in order to acquire an assertion", buf, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 48), "enqueueConnectionOperation:", *(_QWORD *)(a1 + 64));
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getLNLogCategoryConnection();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v16 = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v5;
      v11 = "%{public}@ %{public}@ completed with response: %{public}@";
      v12 = v8;
      v13 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A18F6000, v12, v13, v11, (uint8_t *)&v16, 0x20u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v9;
    v18 = 2114;
    v19 = v14;
    v20 = 2114;
    v21 = v6;
    v11 = "%{public}@ %{public}@ completed with error: %{public}@";
    v12 = v8;
    v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v15);
  objc_msgSend(*(id *)(a1 + 32), "resumeOpenApplicationOperationQueue");

}

void __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
      objc_msgSend(v7, "handleConnectionActionResponse:", v5);
    else
      objc_msgSend(v7, "setDisconnectedWithError:", v6);
  }
  else
  {
    getLNLogCategoryConnection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "state");
      if ((unint64_t)(v10 - 1) > 2)
        v11 = CFSTR("Not Connected");
      else
        v11 = off_1E45DDF80[v10 - 1];
      v12 = v11;
      v13 = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v12;

    }
  }

}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_44(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void (**v10)(void *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend(a1[4], "activity");
  v7 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v7, &state);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2_45;
  v15[3] = &unk_1E45DC668;
  v15[4] = a1[4];
  v8 = v6;
  v16 = v8;
  v9 = v5;
  v17 = v9;
  v18 = a1[5];
  v19 = a1[6];
  v20 = a1[7];
  v10 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(v15);
  v10[2](v10, v11, v12, v13, v14);

  os_activity_scope_leave(&state);
}

- (void)connectWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LNEmbeddedApplicationConnection;
  -[LNConnection connectWithOptions:](&v14, sel_connectWithOptions_, v4);
  -[LNConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  getLNLogCategoryConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_INFO, "%{public}@ connectWithOptions: %{public}@", buf, 0x16u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__LNEmbeddedApplicationConnection_connectWithOptions___block_invoke;
  v12[3] = &unk_1E45DDE40;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  -[LNEmbeddedApplicationConnection enqueueOpenApplicationOperation:](self, "enqueueOpenApplicationOperation:", v12);

}

- (void)enqueueOpenApplicationOperation:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEmbeddedApplicationConnection.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  objc_msgSend((id)objc_opt_class(), "sharedOpenApplicationOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__LNEmbeddedApplicationConnection_enqueueOpenApplicationOperation___block_invoke;
  v9[3] = &unk_1E45DD1E0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v9);
  objc_msgSend(v6, "setSuspended:", 1);

}

- (void)resumeOpenApplicationOperationQueue
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "sharedOpenApplicationOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspended:", 0);

}

+ (NSOperationQueue)sharedOpenApplicationOperationQueue
{
  if (sharedOpenApplicationOperationQueue_onceToken != -1)
    dispatch_once(&sharedOpenApplicationOperationQueue_onceToken, &__block_literal_global_3191);
  return (NSOperationQueue *)(id)sharedOpenApplicationOperationQueue_operationQueue;
}

void __67__LNEmbeddedApplicationConnection_enqueueOpenApplicationOperation___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
}

- (LNEmbeddedApplicationConnection)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 appIntentsEnabledOnly:(BOOL)a7 userIdentity:(id)a8 error:(id *)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LNEmbeddedApplicationConnection *v20;
  uint64_t v21;
  FBSOpenApplicationService *openApplicationService;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  PDCPreflightManager *preflightManager;
  LNEmbeddedApplicationConnection *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 buf;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v10 = a7;
  v41 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LNEmbeddedApplicationConnection;
  v20 = -[LNApplicationConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:](&v32, sel_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error_, v15, v16, v17, v18, v10, v19, a9);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v21 = objc_claimAutoreleasedReturnValue();
    openApplicationService = v20->_openApplicationService;
    v20->_openApplicationService = (FBSOpenApplicationService *)v21;

    if (!v20->_openApplicationService)
    {
      getLNLogCategoryConnection();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[LNConnection logPrefix](v20, "logPrefix");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_1A18F6000, v23, OS_LOG_TYPE_ERROR, "%{public}@ openApplicationService failed to initialize", (uint8_t *)&buf, 0xCu);

      }
    }
    dispatch_get_global_queue(17, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v26 = (void *)getPDCPreflightManagerClass_softClass;
    v36 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v38 = __getPDCPreflightManagerClass_block_invoke;
      v39 = &unk_1E45DDB30;
      v40 = &v33;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)&buf);
      v26 = (void *)v34[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v33, 8);
    v28 = objc_msgSend([v27 alloc], "initWithTargetQueue:", v25);
    preflightManager = v20->_preflightManager;
    v20->_preflightManager = (PDCPreflightManager *)v28;

    v30 = v20;
  }

  return v20;
}

- (id)linkConnectionActionWithOpenApplicationIdentifier:(id)a3 connectionAction:(id)a4 connectionOperation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v11 = (void *)getUILinkConnectionActionClass_softClass;
  v30 = getUILinkConnectionActionClass_softClass;
  if (!getUILinkConnectionActionClass_softClass)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __getUILinkConnectionActionClass_block_invoke;
    v26[3] = &unk_1E45DDB30;
    v26[4] = &v27;
    __getUILinkConnectionActionClass_block_invoke((uint64_t)v26);
    v11 = (void *)v28[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v27, 8);
  v13 = objc_msgSend(v12, "instancesRespondToSelector:", sel_initWithAction_responseQueue_responseHandler_);
  v14 = objc_alloc((Class)v12);
  if (v13)
  {
    -[LNConnection queue](self, "queue");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke;
    v23[3] = &unk_1E45DC6B8;
    v23[4] = self;
    v24 = v8;
    v25 = v10;
    v16 = v10;
    v17 = v8;
    v18 = (void *)objc_msgSend(v14, "initWithAction:responseQueue:responseHandler:", v9, v15, v23);

  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_50;
    v20[3] = &unk_1E45DC6B8;
    v20[4] = self;
    v21 = v8;
    v22 = v10;
    v17 = v10;
    v15 = v8;
    v18 = (void *)objc_msgSend(v14, "initWithAction:responseHandler:", v9, v20);

  }
  return v18;
}

void __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v4, &v8);

  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Received UILinkConnectionActionResponse callback on the response queue with action response: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithActionResponse:error:", v3, 0);
  os_activity_scope_leave(&v8);

}

void __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v4, &state);

  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v3;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Received UILinkConnectionActionResponse callback with action response: %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_51;
  v10[3] = &unk_1E45DDE40;
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v9 = v3;
  dispatch_async(v8, v10);

  os_activity_scope_leave(&state);
}

uint64_t __122__LNEmbeddedApplicationConnection_linkConnectionActionWithOpenApplicationIdentifier_connectionAction_connectionOperation___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithActionResponse:error:", *(_QWORD *)(a1 + 40), 0);
}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2;
  block[3] = &unk_1E45DE0A0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_2_45(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__LNEmbeddedApplicationConnection_openApplicationWithOptions_connectionAction_completionHandler___block_invoke_3;
  v5[3] = &unk_1E45DC668;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  dispatch_async(v2, v5);

}

uint64_t __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_2;
  v4[3] = &unk_1E45DC5C8;
  v4[4] = v2;
  return objc_msgSend(v2, "openApplicationWithOptions:connectionAction:completionHandler:", v1, 0, v4);
}

void __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _BYTE location[12];
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDisconnectedWithError:", v6);
    }
    else
    {
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v11 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_12;
      v13[3] = &unk_1E45DC5F0;
      objc_copyWeak(&v15, (id *)location);
      v14 = 0;
      objc_msgSend(v11, "setUpConnectionContextWithAssertions:completionHandler:", 0, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    getLNLogCategoryConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 32), "state");
      if ((unint64_t)(v9 - 1) > 2)
        v10 = CFSTR("Not Connected");
      else
        v10 = off_1E45DDF80[v9 - 1];
      v12 = v10;
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v8;
      v17 = 2114;
      v18 = v12;

    }
  }

}

void __54__LNEmbeddedApplicationConnection_refreshWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    getLNLogCategoryConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "Failed to set connection context: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v5, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v5, "setDisconnectedWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "setConnected");
  }

}

+ (id)optionsForAction:(id)a3 interactionMode:(int64_t)a4 source:(unsigned __int16)a5 sourceOverride:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v21;

  v7 = a5;
  v10 = a3;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___LNEmbeddedApplicationConnection;
  v11 = a6;
  objc_msgSendSuper2(&v21, sel_optionsForAction_interactionMode_source_sourceOverride_, v10, a4, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "presentationStyle", v21.receiver, v21.super_class);
  if ((unint64_t)(v13 - 1) >= 2)
  {
    if (!v13)
    {
      objc_msgSend(v12, "setOpenApplicationPriority:", 1);
      objc_msgSend(v12, "setSceneless:", 1);
      objc_msgSend(v10, "systemProtocols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D43E18], "pushToTalkTransmissionProtocol");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v16)
        objc_msgSend(v12, "setOpenApplicationPriority:", 3);
    }
  }
  else
  {
    objc_msgSend(v12, "setOpenApplicationPriority:", 2);
    objc_msgSend(v12, "setSceneless:", 0);
  }
  if ((_DWORD)v7 == 3)
    objc_msgSend(v12, "setAllowsForegroundAppLaunchWhileInCarPlay:", 0);
  objc_msgSend(v10, "systemProtocols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "cameraCaptureProtocol");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  if (v19)
    objc_msgSend(v12, "setIsCameraCaptureAction:", 1);
  objc_msgSend(v12, "setActionSource:", v7);
  objc_msgSend(v12, "setActionSourceOverride:", v11);

  return v12;
}

uint64_t __70__LNEmbeddedApplicationConnection_sharedOpenApplicationOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedOpenApplicationOperationQueue_operationQueue;
  sharedOpenApplicationOperationQueue_operationQueue = (uint64_t)v0;

  return objc_msgSend((id)sharedOpenApplicationOperationQueue_operationQueue, "setMaxConcurrentOperationCount:", 1);
}

@end
