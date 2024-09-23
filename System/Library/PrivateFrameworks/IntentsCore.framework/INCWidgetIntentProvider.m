@implementation INCWidgetIntentProvider

- (void)provideIntentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  INCIntentDefaultValueProvider *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  _QWORD v96[4];
  void (**v97)(id, _QWORD, id);
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  id v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = (os_log_t *)MEMORY[0x1E0CBD670];
  v9 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    objc_msgSend(v6, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v103 = "-[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:]";
    v104 = 2114;
    v105 = v11;
    v106 = 2114;
    v107 = v12;
    _os_log_impl(&dword_1B727D000, v10, OS_LOG_TYPE_INFO, "%s Providing intent for chrono with options: extensionBundleIdentifier = %{public}@, intentType = %{public}@", buf, 0x20u);

  }
  objc_msgSend(v6, "intentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("appintent:"));

  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0CBD760];
    v100 = *MEMORY[0x1E0CBD398];
    v101 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "optionsWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOptions:", v17);
    v19 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v6, "extensionBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0;
    v21 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:error:", v20, &v99);
    v22 = v99;

    if (!v21)
    {
      v25 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v88 = v25;
        objc_msgSend(v6, "extensionBundleIdentifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v103 = "-[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:]";
        v104 = 2114;
        v105 = v89;
        v106 = 2114;
        v107 = v22;
        _os_log_error_impl(&dword_1B727D000, v88, OS_LOG_TYPE_ERROR, "%s No chrono extension found with identifier: %{public}@. Error: %{public}@", buf, 0x20u);

      }
      v7[2](v7, 0, v22);
      goto LABEL_43;
    }
    objc_msgSend(v21, "containingBundleRecord");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v26 = v24;
    objc_msgSend(v6, "intentType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v22;
    v95 = v21;
    -[INCWidgetIntentProvider intentsExtensionForExtension:compatibleWithIntent:error:](self, "intentsExtensionForExtension:compatibleWithIntent:error:", v21, v27, &v98);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v98;

    if (v28)
    {
      v92 = v29;
      v93 = v26;
      v94 = v23;
      v91 = v17;
      v30 = v28;
      objc_msgSend(v28, "bundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc(MEMORY[0x1E0CBD980]);
      objc_msgSend(v6, "intentType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "initWithIntentClassName:extensionBundleId:", v33, v31);
    }
    else
    {
      if (!v26)
      {
        v63 = *MEMORY[0x1E0CBD670];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v103 = "-[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:]";
          v104 = 2114;
          v105 = v29;
          _os_log_error_impl(&dword_1B727D000, v63, OS_LOG_TYPE_ERROR, "%s No intents extension found in same bundle as chrono extension. %{public}@", buf, 0x16u);
        }
        v7[2](v7, 0, v29);
        goto LABEL_42;
      }
      v30 = 0;
      v91 = v17;
      v92 = v29;
      v93 = v26;
      v94 = v23;
      objc_msgSend(v26, "bundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc(MEMORY[0x1E0CBD980]);
      objc_msgSend(v6, "intentType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v35, "initWithIntentClassName:launchableAppBundleId:", v33, v31);
    }
    v36 = (void *)v34;

    v90 = v18;
    objc_msgSend(v18, "resolvedIntentMatchingDescriptor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "intentDefinitionURLs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allValues");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v41 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v95, "intentDefinitionURLs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allValues");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setWithArray:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_alloc(MEMORY[0x1E0CBDB38]);
      objc_msgSend(v95, "bundleIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v46, "_initWithContentsOfURLs:bundleIdentifier:", v45, v47);

      if (v48)
        goto LABEL_31;
    }
    objc_msgSend(v37, "bundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v50 = (void *)MEMORY[0x1E0CA5898];
      objc_msgSend(v37, "bundleIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v51, 0, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "intentDefinitionURLs");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "allValues");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55)
      {
        v56 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v52, "intentDefinitionURLs");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "allValues");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setWithArray:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "allObjects");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = objc_alloc(MEMORY[0x1E0CBDB38]);
        objc_msgSend(v52, "bundleIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v61, "_initWithContentsOfURLs:bundleIdentifier:", v60, v62);

        if (v48)
        {
LABEL_31:
          v78 = objc_alloc(MEMORY[0x1E0CBD970]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "UUIDString");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "intentType");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (void *)objc_msgSend(v78, "_initWithIdentifier:schema:name:data:", v80, v48, v81, 0);

          if (v82)
          {
            objc_msgSend(v37, "bundleIdentifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_setLaunchId:", v83);

            objc_msgSend(v37, "extensionBundleIdentifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_setExtensionBundleId:", v84);

            v85 = -[INCIntentDefaultValueProvider initWithIntent:]([INCIntentDefaultValueProvider alloc], "initWithIntent:", v82);
            v96[0] = MEMORY[0x1E0C809B0];
            v96[1] = 3221225472;
            v96[2] = __70__INCWidgetIntentProvider_provideIntentWithOptions_completionHandler___block_invoke;
            v96[3] = &unk_1E6BC4B80;
            v97 = v7;
            -[INCIntentDefaultValueProvider loadDefaultValuesWithCompletionHandler:](v85, "loadDefaultValuesWithCompletionHandler:", v96);

          }
          else
          {
            v86 = *MEMORY[0x1E0CBD670];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v103 = "-[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:]";
              _os_log_error_impl(&dword_1B727D000, v86, OS_LOG_TYPE_ERROR, "%s Unable to create intent from schema.", buf, 0xCu);
            }
            v7[2](v7, 0, 0);
          }
          v18 = v90;
          v17 = v91;

LABEL_41:
          v26 = v93;
          v23 = v94;
          v29 = v92;

          v28 = v30;
LABEL_42:

          v22 = v29;
          v21 = v95;
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v37, "extensionBundleIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = (void *)MEMORY[0x1E0CA5898];
      objc_msgSend(v37, "extensionBundleIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v66, 0, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v67, "intentDefinitionURLs");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "allValues");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "count");

      if (v70)
      {
        v71 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v67, "intentDefinitionURLs");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "allValues");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setWithArray:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "allObjects");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = objc_alloc(MEMORY[0x1E0CBDB38]);
        objc_msgSend(v67, "bundleIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v76, "_initWithContentsOfURLs:bundleIdentifier:", v75, v77);

        if (v48)
          goto LABEL_31;
      }
      else
      {

      }
    }
    v87 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v103 = "-[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:]";
      _os_log_error_impl(&dword_1B727D000, v87, OS_LOG_TYPE_ERROR, "%s No intent definitions found in extensions.", buf, 0xCu);
    }
    v7[2](v7, 0, 0);
    v17 = v91;
    goto LABEL_41;
  }
  -[INCWidgetIntentProvider provideAppIntentWithOptions:completionHandler:](self, "provideAppIntentWithOptions:completionHandler:", v6, v7);
LABEL_44:

}

- (void)provideAppIntentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__INCWidgetIntentProvider_provideAppIntentWithOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E6BC4BA8;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1BCCA5FB8](v12);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v10);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)_provideAppIntentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE buf[24];
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v6 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v5, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:error:", v7, &v42);
  v33 = v42;

  if (v8)
  {
    objc_msgSend(v8, "containingBundleRecord");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v32 = v10;

    objc_msgSend(v32, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v8, "entitlements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("com.apple.private.appintents.attribution.bundle-identifier"), objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_16;
      }

      objc_msgSend(v8, "bundleIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v14;
LABEL_16:

    objc_msgSend(v5, "intentType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(":"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v20 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass;
    v46 = getLNFullyQualifiedActionIdentifierClass_softClass;
    v21 = MEMORY[0x1E0C809B0];
    if (!getLNFullyQualifiedActionIdentifierClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLNFullyQualifiedActionIdentifierClass_block_invoke;
      v48 = &unk_1E6BC4BF8;
      v49 = &v43;
      __getLNFullyQualifiedActionIdentifierClass_block_invoke((uint64_t)buf);
      v20 = (void *)v44[3];
    }
    v22 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v43, 8);
    v23 = (void *)objc_msgSend([v22 alloc], "initWithActionIdentifier:bundleIdentifier:", v19, v16);
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v24 = (void *)getLNActionDefaultValueProviderClass_softClass;
    v46 = getLNActionDefaultValueProviderClass_softClass;
    if (!getLNActionDefaultValueProviderClass_softClass)
    {
      *(_QWORD *)buf = v21;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLNActionDefaultValueProviderClass_block_invoke;
      v48 = &unk_1E6BC4BF8;
      v49 = &v43;
      __getLNActionDefaultValueProviderClass_block_invoke((uint64_t)buf);
      v24 = (void *)v44[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v43, 8);
    v35[0] = v21;
    v35[1] = 3221225472;
    v35[2] = __74__INCWidgetIntentProvider__provideAppIntentWithOptions_completionHandler___block_invoke;
    v35[3] = &unk_1E6BC4BD0;
    v36 = v23;
    v37 = (id)objc_msgSend([v25 alloc], "initWithActionIdentifier:actionMetadata:", v23, 0);
    v38 = v19;
    v41 = v34;
    v39 = v16;
    v40 = v5;
    v26 = v16;
    v27 = v19;
    v28 = v37;
    v29 = v23;
    objc_msgSend(v28, "loadDefaultValuesWithCompletionHandler:", v35);

    goto LABEL_21;
  }
  v11 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v30 = v11;
    objc_msgSend(v5, "extensionBundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[INCWidgetIntentProvider _provideAppIntentWithOptions:completionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2114;
    v48 = v33;
    _os_log_error_impl(&dword_1B727D000, v30, OS_LOG_TYPE_ERROR, "%s No chrono extension found with identifier: %{public}@. Error: %{public}@", buf, 0x20u);

  }
  (*((void (**)(id, _QWORD, id))v34 + 2))(v34, 0, v33);
LABEL_21:

}

- (id)intentsExtensionForExtension:(id)a3 compatibleWithIntent:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "compatibilityObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "if_isSystem");

  if (!v10
    || (objc_msgSend(v7, "infoDictionary"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:ofClass:", *MEMORY[0x1E0CBDDB8], objc_opt_class()),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12)
    || (v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v12, a5),
        v12,
        !v13))
  {
    objc_msgSend(v7, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v15, 0, 1, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v37 = v15;
      v38 = v7;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v36 = v17;
      obj = v17;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v44;
        v42 = *MEMORY[0x1E0CBD4B8];
        v40 = *MEMORY[0x1E0CBD3F0];
        v21 = v8;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            v24 = (void *)MEMORY[0x1BCCA5E44]();
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithURL:error:", v23, 0);
            if (v25)
            {
              v26 = v25;
              objc_msgSend(v25, "extensionPointRecord");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToString:", v42);

              if (v29)
              {
                objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("."));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "lastObject");
                v8 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "infoDictionary");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "if_extensionAttributesDictionary");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "objectForKeyedSubscript:", v40);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if ((v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                   || (v33,
                       objc_msgSend(v31, "objectForKey:ofClass:", v40, objc_opt_class()),
                       (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                  && objc_msgSend(v33, "containsObject:", v8))
                {
                  v39 = v26;
                  v34 = 1;
                }
                else
                {
                  v34 = 3;
                }

                v21 = v8;
              }
              else
              {
                v34 = 3;
                v8 = v21;
              }

              objc_autoreleasePoolPop(v24);
              if (v34 != 3)
                goto LABEL_27;
            }
            else
            {
              objc_autoreleasePoolPop(v24);
            }
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v19);
        v39 = 0;
        v8 = v21;
      }
      else
      {
        v39 = 0;
      }
LABEL_27:

      v15 = v37;
      v7 = v38;
      v17 = v36;
      v13 = v39;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

void __74__INCWidgetIntentProvider__provideAppIntentWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void (*WFLinkActionSerializedParametersForLNActionSymbolLoc)(id, id);
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (!WorkflowKitLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E6BC4C30;
      *(_QWORD *)&buf[16] = 0;
      WorkflowKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (WorkflowKitLibraryCore_frameworkLibrary && getWFLinkActionSerializedParametersForLNActionSymbolLoc())
    {
      objc_msgSend(*(id *)(a1 + 40), "actionMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v5;
      v9 = v7;
      WFLinkActionSerializedParametersForLNActionSymbolLoc = (void (*)(id, id))getWFLinkActionSerializedParametersForLNActionSymbolLoc();
      if (!WFLinkActionSerializedParametersForLNActionSymbolLoc)
      {
        dlerror();
        abort_report_np();
      }
      WFLinkActionSerializedParametersForLNActionSymbolLoc(v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        v13 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[INCWidgetIntentProvider _provideAppIntentWithOptions:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v22 = v11;
        _os_log_impl(&dword_1B727D000, v12, OS_LOG_TYPE_INFO, "%s Fetched serialized parameters for %@: %@", buf, 0x20u);
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD738]), "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v11);
      objc_msgSend(*(id *)(a1 + 64), "extensionBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setExtensionBundleId:", v15);

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      v16 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_FAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[INCWidgetIntentProvider _provideAppIntentWithOptions:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_fault_impl(&dword_1B727D000, v16, OS_LOG_TYPE_FAULT, "%s Failed to load serialization method - %@", buf, 0x16u);
      }
      v17 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3587, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v11);
    }

  }
  else
  {
    v18 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[INCWidgetIntentProvider _provideAppIntentWithOptions:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1B727D000, v18, OS_LOG_TYPE_ERROR, "%s Failed to load default values for %@ widget intent: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __73__INCWidgetIntentProvider_provideAppIntentWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_provideAppIntentWithOptions:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__INCWidgetIntentProvider_provideIntentWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
