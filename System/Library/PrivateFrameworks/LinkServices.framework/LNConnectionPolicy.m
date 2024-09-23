@implementation LNConnectionPolicy

+ (id)policyWithActionMetadata:(id)a3 signals:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v63 = 0;
  v64 = 0;
  v61 = 0;
  v62 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v64, &v63, &v62, &v61, v6, v7);
  v8 = v64;
  v9 = v63;
  v10 = v62;
  v11 = v61;
  if (!v11)
  {
    if (v8 && !v9 && !v10)
    {
      getLNLogCategoryPolicy();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v20;
        v67 = 2114;
        v68 = (uint64_t)v21;

      }
      objc_msgSend(v8, "bundleIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v8;
      goto LABEL_23;
    }
    if (v9 && !v8 && !v10)
    {
      getLNLogCategoryPolicy();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v23;
        v67 = 2114;
        v68 = (uint64_t)v24;

      }
      objc_msgSend(0, "bundleIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v9;
      goto LABEL_23;
    }
    if (v10 && !v8 && !v9)
    {
      getLNLogCategoryPolicy();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v26;
        v67 = 2114;
        v68 = (uint64_t)v27;

      }
      objc_msgSend(0, "bundleIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v10;
      goto LABEL_23;
    }
    v60 = 0;
    v30 = objc_msgSend(a1, "shouldExecuteActionOnApplicationWithActionMetadata:signals:reason:", v6, v7, &v60);
    v15 = v60;
    if (v30)
    {
      getLNLogCategoryPolicy();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "bundleIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v32;
        v67 = 2114;
        v68 = (uint64_t)v15;

      }
LABEL_46:

      objc_msgSend(v8, "bundleIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = a1;
      v50 = v6;
      v51 = v8;
LABEL_54:
      objc_msgSend(v49, "policyWithActionMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v50, v51, v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_24;
    }
    objc_msgSend(v7, "preferredBundleIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_43;
    v58 = v33;
    objc_msgSend(v9, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredBundleIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v36 = v56;
    if (v35 == v36)
    {

    }
    else
    {
      v37 = v36;
      if (!v35 || !v36)
      {

        v41 = v58;
LABEL_42:

        goto LABEL_43;
      }
      v57 = objc_msgSend(v35, "isEqualToString:", v36);

      if ((v57 & 1) == 0)
      {
LABEL_43:
        objc_msgSend(v8, "bundleIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(a1, "shouldExecuteActionOnApplicationWithBundleIdentifier:", v44);

        if (v45)
        {
          getLNLogCategoryPolicy();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "bundleIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "identifier");
            v46 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = v59;
            v67 = 2114;
            v68 = v46;
            v47 = (void *)v46;

          }
          goto LABEL_46;
        }
LABEL_47:
        getLNLogCategoryPolicy();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v53)
          {
            objc_msgSend(v6, "identifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = v10;
            v67 = 2114;
            v68 = (uint64_t)v54;

          }
          objc_msgSend(v8, "bundleIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = a1;
          v50 = v6;
          v51 = v10;
        }
        else
        {
          if (v53)
          {
            objc_msgSend(v6, "identifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = v9;
            v67 = 2114;
            v68 = (uint64_t)v55;

          }
          objc_msgSend(v8, "bundleIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = a1;
          v50 = v6;
          v51 = v9;
        }
        goto LABEL_54;
      }
    }
    objc_msgSend(v8, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(a1, "bundleLinkedOnOrAfter2024:", v38);

    getLNLogCategoryPolicy();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "preferredBundleIdentifier");
        v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v43;

        v41 = v42;
      }

      goto LABEL_47;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v41, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_42;
  }
  getLNLogCategoryPolicy();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v66 = v13;
    v67 = 2114;
    v68 = (uint64_t)v14;

  }
  objc_msgSend(v7, "preferredBundleIdentifier");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  v17 = v6;
  v18 = v11;
LABEL_23:
  objc_msgSend(v16, "policyWithActionMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v17, v18, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v28;
}

+ (id)policyWithActionMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  LNAppIntentConnectionPolicy *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[LNAppIntentConnectionPolicy initWithAppIntentMetadata:effectiveBundleIdentifier:appBundleIdentifier:]([LNAppIntentConnectionPolicy alloc], "initWithAppIntentMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v9, v8, v7);

  return v10;
}

+ (BOOL)shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  BOOL v12;
  int v14;
  NSObject *v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0D87DB8], "statesForPredicate:withDescriptor:error:", v4, v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (!v7)
  {
    if (!objc_msgSend(v6, "count"))
    {
      getLNLogCategoryPolicy();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      v9 = "Failed to find process state for application bundle; will use extension if available. bundle=%@";
      goto LABEL_10;
    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      getLNLogCategoryPolicy();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      v9 = "Found multiple process states for application bundle; will use extension if available. bundle=%@";
LABEL_10:
      v10 = v8;
      v11 = 12;
      goto LABEL_11;
    }
    objc_msgSend(v6, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject taskState](v8, "taskState");
    if (v14 == 4)
    {
      getLNLogCategoryPolicy();
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v3;
        v16 = "Found process state running scheduled for application bundle; will use application if available. bundle=%@";
        goto LABEL_20;
      }
    }
    else
    {
      if (v14 != 3)
      {
        getLNLogCategoryPolicy();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v3;
          _os_log_impl(&dword_1A18F6000, v15, OS_LOG_TYPE_INFO, "Found process state other than running scheduled or suspended for application bundle; will use extension if "
            "available. bundle=%@",
            buf,
            0xCu);
        }
        v12 = 0;
        goto LABEL_24;
      }
      getLNLogCategoryPolicy();
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v3;
        v16 = "Found process state running suspended for application bundle; will use application if available. bundle=%@";
LABEL_20:
        _os_log_impl(&dword_1A18F6000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
LABEL_24:

    goto LABEL_13;
  }
  getLNLogCategoryPolicy();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v3;
    v20 = 2112;
    v21 = v7;
    v9 = "Failed to determine process state for application bundle; will use extension if available. bundle=%@; %@";
    v10 = v8;
    v11 = 22;
LABEL_11:
    _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
  }
LABEL_12:
  v12 = 0;
LABEL_13:

  return v12;
}

+ (BOOL)shouldHandleInProcessWithMangledTypeName:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  char v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNConnectionPolicy.m"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mangledTypeName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNConnectionPolicy.m"), 534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__LNConnectionPolicy_shouldHandleInProcessWithMangledTypeName_bundleIdentifier___block_invoke;
  v16[3] = &unk_1E45DD250;
  v17 = v9;
  v10 = v9;
  v11 = +[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", CFSTR("com.apple.private.appintents-handle-in-process"), v16);

  if (v11)
    v12 = objc_msgSend(a1, "_typeExistsWithMangledTypeName:", v7);
  else
    v12 = 0;

  return v12;
}

uint64_t __80__LNConnectionPolicy_shouldHandleInProcessWithMangledTypeName_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  if (!v3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
LABEL_6:
  v6 = v4;
LABEL_8:

  return v6;
}

+ (id)policyWithBundleIdentifier:(id)a3
{
  id v3;
  LNBundleConnectionPolicy *v4;

  v3 = a3;
  v4 = -[LNBundleConnectionPolicy initWithBundleIdentifier:appBundleIdentifier:]([LNBundleConnectionPolicy alloc], "initWithBundleIdentifier:appBundleIdentifier:", v3, 0);

  return v4;
}

+ (id)policyWithActionMetadata:(id)a3
{
  return (id)objc_msgSend(a1, "policyWithActionMetadata:signals:", a3, 0);
}

+ (BOOL)_typeExistsWithMangledTypeName:(id)a3
{
  BOOL v3;

  sub_1A19B2C00();
  v3 = static LNConnectionPolicy._typeExists(mangledTypeName:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)policyWithEntityMetadata:(id)a3
{
  return (id)objc_msgSend(a1, "policyWithEntityMetadata:signals:", a3, 0);
}

+ (id)policyWithEntityMetadata:(id)a3 signals:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v49;
  char v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v54, &v53, &v52, &v51, v6, v7);
  v8 = v54;
  v9 = v53;
  v10 = v52;
  v11 = v51;
  if (!v11)
  {
    if (v8 && !v9 && !v10)
    {
      getLNLogCategoryPolicy();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        objc_msgSend(v8, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a1;
        v17 = v6;
        v18 = v8;
        goto LABEL_48;
      }
      objc_msgSend(v6, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v20;
      v57 = 2114;
      v58 = v21;
LABEL_10:
      _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

      goto LABEL_11;
    }
    if (v9 && !v8 && !v10)
    {
      getLNLogCategoryPolicy();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v24;
        v57 = 2114;
        v58 = v25;

      }
      v26 = 0;
LABEL_18:
      objc_msgSend(v26, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v9;
      goto LABEL_48;
    }
    if (v10 && !v8 && !v9)
    {
      getLNLogCategoryPolicy();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v28;
        v57 = 2114;
        v58 = v29;

      }
      v30 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v7, "preferredBundleIdentifier");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_40;
    v32 = v31;
    objc_msgSend(v9, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    v36 = v34;
    if (v35 == v36)
    {

    }
    else
    {
      v37 = v36;
      if (!v35 || !v36)
      {

LABEL_39:
        goto LABEL_40;
      }
      v50 = objc_msgSend(v35, "isEqualToString:", v36);

      if ((v50 & 1) == 0)
      {
LABEL_40:
        objc_msgSend(v8, "bundleIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(a1, "shouldExecuteActionOnApplicationWithBundleIdentifier:", v42);

        if (v43)
        {
          getLNLogCategoryPolicy();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            goto LABEL_11;
          objc_msgSend(v8, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v20;
          v57 = 2114;
          v58 = v21;
          goto LABEL_10;
        }
        goto LABEL_43;
      }
    }
    objc_msgSend(v8, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(a1, "bundleLinkedOnOrAfter2024:", v38);

    getLNLogCategoryPolicy();
    v40 = objc_claimAutoreleasedReturnValue();
    v32 = v40;
    if (v39)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "preferredBundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v41;

      }
LABEL_43:
      getLNLogCategoryPolicy();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v45)
        {
          objc_msgSend(v6, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v9;
          v57 = 2114;
          v58 = v49;

        }
        v26 = v8;
        goto LABEL_18;
      }
      if (v45)
      {
        objc_msgSend(v6, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v10;
        v57 = 2114;
        v58 = v46;

      }
      v30 = v8;
LABEL_47:
      objc_msgSend(v30, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v10;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v32, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_39;
  }
  getLNLogCategoryPolicy();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v13;
    v57 = 2114;
    v58 = v14;

  }
  objc_msgSend(v7, "preferredBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  v17 = v6;
  v18 = v11;
LABEL_48:
  objc_msgSend(v16, "policyWithEntityMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v17, v18, v15);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (id)policyWithEntityQueryMetadata:(id)a3
{
  return (id)objc_msgSend(a1, "policyWithEntityQueryMetadata:signals:", a3, 0);
}

+ (id)policyWithEntityQueryMetadata:(id)a3 signals:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v55, &v54, &v53, &v52, v6, v7);
  v8 = v55;
  v9 = v54;
  v10 = v53;
  v11 = v52;
  if (v11)
  {
    getLNLogCategoryPolicy();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      v58 = 2114;
      v59 = v14;

    }
    objc_msgSend(v7, "preferredBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1;
    v17 = v6;
    v18 = v11;
    goto LABEL_12;
  }
  if (!v8 || v9 || v10)
  {
    if (v9 && !v8 && !v10)
    {
      getLNLogCategoryPolicy();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v26;
        v58 = 2114;
        v59 = v27;

      }
      v28 = a1;
      v29 = v6;
      v30 = v9;
LABEL_26:
      objc_msgSend(v28, "policyWithQueryMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v29, v30, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v10 && !v8 && !v9)
    {
      getLNLogCategoryPolicy();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v32;
        v58 = 2114;
        v59 = v33;

      }
      v28 = a1;
      v29 = v6;
      v30 = v10;
      goto LABEL_26;
    }
    objc_msgSend(v7, "preferredBundleIdentifier");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
      goto LABEL_42;
    v35 = v34;
    objc_msgSend(v9, "bundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredBundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v36;
    v39 = v37;
    if (v38 == v39)
    {

    }
    else
    {
      v40 = v39;
      if (!v38 || !v39)
      {

LABEL_41:
        goto LABEL_42;
      }
      v51 = objc_msgSend(v38, "isEqualToString:", v39);

      if ((v51 & 1) == 0)
      {
LABEL_42:
        objc_msgSend(v8, "bundleIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(a1, "shouldExecuteActionOnApplicationWithBundleIdentifier:", v45);

        if (v46)
        {
          getLNLogCategoryPolicy();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            goto LABEL_11;
          objc_msgSend(v8, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v20;
          v58 = 2114;
          v59 = v21;
          goto LABEL_10;
        }
LABEL_45:
        getLNLogCategoryPolicy();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v48)
          {
            objc_msgSend(v6, "identifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v10;
            v58 = 2114;
            v59 = v49;

          }
          objc_msgSend(v8, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = a1;
          v17 = v6;
          v18 = v10;
        }
        else
        {
          if (v48)
          {
            objc_msgSend(v6, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v9;
            v58 = 2114;
            v59 = v50;

          }
          objc_msgSend(v8, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = a1;
          v17 = v6;
          v18 = v9;
        }
        goto LABEL_12;
      }
    }
    objc_msgSend(v8, "bundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(a1, "bundleLinkedOnOrAfter2024:", v41);

    getLNLogCategoryPolicy();
    v43 = objc_claimAutoreleasedReturnValue();
    v35 = v43;
    if (v42)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "preferredBundleIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v44;

      }
      goto LABEL_45;
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v35, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_41;
  }
  getLNLogCategoryPolicy();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v20;
    v58 = 2114;
    v59 = v21;
LABEL_10:
    _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

  }
LABEL_11:

  objc_msgSend(v8, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  v17 = v6;
  v18 = v8;
LABEL_12:
  objc_msgSend(v16, "policyWithQueryMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v17, v18, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v23;
}

+ (id)policyWithEnumMetadata:(id)a3
{
  return (id)objc_msgSend(a1, "policyWithEnumMetadata:signals:", a3, 0);
}

+ (id)policyWithEnumMetadata:(id)a3 signals:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v49;
  char v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0;
  LNConnectionPolicyEffectiveBundleIdentifiers(&v54, &v53, &v52, &v51, v6, v7);
  v8 = v54;
  v9 = v53;
  v10 = v52;
  v11 = v51;
  if (!v11)
  {
    if (v8 && !v9 && !v10)
    {
      getLNLogCategoryPolicy();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        objc_msgSend(v8, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a1;
        v17 = v6;
        v18 = v8;
        goto LABEL_48;
      }
      objc_msgSend(v6, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v20;
      v57 = 2114;
      v58 = v21;
LABEL_10:
      _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

      goto LABEL_11;
    }
    if (v9 && !v8 && !v10)
    {
      getLNLogCategoryPolicy();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v24;
        v57 = 2114;
        v58 = v25;

      }
      v26 = 0;
LABEL_18:
      objc_msgSend(v26, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v9;
      goto LABEL_48;
    }
    if (v10 && !v8 && !v9)
    {
      getLNLogCategoryPolicy();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v28;
        v57 = 2114;
        v58 = v29;

      }
      v30 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v7, "preferredBundleIdentifier");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_40;
    v32 = v31;
    objc_msgSend(v9, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    v36 = v34;
    if (v35 == v36)
    {

    }
    else
    {
      v37 = v36;
      if (!v35 || !v36)
      {

LABEL_39:
        goto LABEL_40;
      }
      v50 = objc_msgSend(v35, "isEqualToString:", v36);

      if ((v50 & 1) == 0)
      {
LABEL_40:
        objc_msgSend(v8, "bundleIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(a1, "shouldExecuteActionOnApplicationWithBundleIdentifier:", v42);

        if (v43)
        {
          getLNLogCategoryPolicy();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            goto LABEL_11;
          objc_msgSend(v8, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v20;
          v57 = 2114;
          v58 = v21;
          goto LABEL_10;
        }
        goto LABEL_43;
      }
    }
    objc_msgSend(v8, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(a1, "bundleLinkedOnOrAfter2024:", v38);

    getLNLogCategoryPolicy();
    v40 = objc_claimAutoreleasedReturnValue();
    v32 = v40;
    if (v39)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "preferredBundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v41;

      }
LABEL_43:
      getLNLogCategoryPolicy();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v45)
        {
          objc_msgSend(v6, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v9;
          v57 = 2114;
          v58 = v49;

        }
        v26 = v8;
        goto LABEL_18;
      }
      if (v45)
      {
        objc_msgSend(v6, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v10;
        v57 = 2114;
        v58 = v46;

      }
      v30 = v8;
LABEL_47:
      objc_msgSend(v30, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1;
      v17 = v6;
      v18 = v10;
      goto LABEL_48;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v32, OS_LOG_TYPE_DEFAULT, "Client requested running using the preferred bundle identifier, but it is linked prior to 2024 so ignoring", buf, 2u);
    }
    goto LABEL_39;
  }
  getLNLogCategoryPolicy();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v13;
    v57 = 2114;
    v58 = v14;

  }
  objc_msgSend(v7, "preferredBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a1;
  v17 = v6;
  v18 = v11;
LABEL_48:
  objc_msgSend(v16, "policyWithEnumMetadata:effectiveBundleIdentifier:appBundleIdentifier:", v17, v18, v15);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

+ (id)policyWithEntityMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  LNAppEntityConnectionPolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  LNAppEntityConnectionPolicy *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [LNAppEntityConnectionPolicy alloc];
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mangledTypeNameForBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[LNAppEntityConnectionPolicy initWithAppEntityIdentifier:appEntityMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:](v10, "initWithAppEntityIdentifier:appEntityMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:", v11, v13, v8, v7);
  return v14;
}

+ (id)policyWithQueryMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  LNEntityQueryConnectionPolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  LNEntityQueryConnectionPolicy *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [LNEntityQueryConnectionPolicy alloc];
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mangledTypeNameForBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[LNEntityQueryConnectionPolicy initWithEntityQueryIdentifier:entityQueryMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:](v10, "initWithEntityQueryIdentifier:entityQueryMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:", v11, v13, v8, v7);
  return v14;
}

+ (id)policyWithEnumMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  LNAppEnumConnectionPolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  LNAppEnumConnectionPolicy *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [LNAppEnumConnectionPolicy alloc];
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mangledTypeNameForBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[LNAppEnumConnectionPolicy initWithAppEnumIdentifier:appEnumMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:](v10, "initWithAppEnumIdentifier:appEnumMangledTypeName:effectiveBundleIdentifier:appBundleIdentifier:", v11, v13, v8, v7);
  return v14;
}

+ (BOOL)bundleLinkedOnOrAfter2024:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  _BYTE buf[32];
  __int128 v23;
  __int128 v24;
  uint8_t v25[40];
  _QWORD v26[10];
  _QWORD v27[11];

  v27[10] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (!v4)
  {
    getLNLogCategoryPolicy();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 138543618;
      *(_QWORD *)&v25[4] = v3;
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v5;
      v14 = "Unable to create a bundle record for %{public}@: %{public}@";
      v15 = v7;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
LABEL_11:
      _os_log_impl(&dword_1A18F6000, v15, v16, v14, v25, v17);
    }
LABEL_12:
    v13 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v4, "SDKVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    getLNLogCategoryPolicy();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v3;
      v14 = "No SDKVersion for %{public}@";
      v15 = v7;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v26[0] = &unk_1E45FA4A8;
  v26[1] = &unk_1E45FA4C0;
  v27[0] = CFSTR("15.0");
  v27[1] = CFSTR("18.0");
  v26[2] = &unk_1E45FA4D8;
  v26[3] = &unk_1E45FA4F0;
  v27[2] = CFSTR("18.0");
  v27[3] = CFSTR("18.0");
  v26[4] = &unk_1E45FA508;
  v26[5] = &unk_1E45FA520;
  v27[4] = CFSTR("18.0");
  v27[5] = CFSTR("18.0");
  v26[6] = &unk_1E45FA538;
  v26[7] = &unk_1E45FA550;
  v27[6] = CFSTR("18.0");
  v27[7] = CFSTR("18.0");
  v26[8] = &unk_1E45FA568;
  v26[9] = &unk_1E45FA580;
  v27[8] = CFSTR("2.0");
  v27[9] = CFSTR("2.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 10);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "platform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    memset(v25, 0, 32);
    objc_msgSend(v4, "SDKVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1B0F0EC](v25);

    v23 = 0u;
    v24 = 0u;
    MEMORY[0x1A1B0F0EC](&v23, v9);
    getLNLogCategoryPolicy();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "SDKVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1A18F6000, v11, OS_LOG_TYPE_INFO, "Comparing %{public}@ to %{public}@", buf, 0x16u);

    }
    *(_OWORD *)buf = *(_OWORD *)v25;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v25[16];
    v20 = v23;
    v21 = v24;
    v13 = _LSVersionNumberCompare() != -1;
  }
  else
  {
    v13 = 1;
  }

LABEL_15:
  return v13;
}

+ (BOOL)shouldExecuteActionOnApplicationWithActionMetadata:(id)a3 signals:(id)a4 reason:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "shouldExecuteActionOnApplicationBasedOnMetadata") & 1) == 0)
  {
    getLNLogCategoryPolicy();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_DEFAULT, "Policy signals dictate that this app intent should not run in the app based on the provided metadata", buf, 2u);
    }

  }
  else
  {
    if (objc_msgSend(v7, "openAppWhenRun"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v17 = 1;
      goto LABEL_18;
    }
    objc_msgSend(v7, "systemProtocols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E18], "audioStartingProtocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(v7, "systemProtocols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E18], "sessionStartingProtocol");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(v7, "systemProtocols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E18], "foregroundContinuableProtocol");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "containsObject:", v23);

    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(v7, "systemProtocols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E18], "pushToTalkTransmissionProtocol");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "containsObject:", v27);

    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  v17 = 0;
LABEL_18:

  return v17;
}

@end
