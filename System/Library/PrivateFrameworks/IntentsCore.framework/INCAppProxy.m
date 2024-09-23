@implementation INCAppProxy

- (id)_initWithConnection:(id)a3
{
  id v4;
  INCAppProxy *v5;
  INCAppProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INCAppProxy;
  v5 = -[INCAppProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_connection, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

- (void)launchAppInBackground:(BOOL)a3 completionHandler:(id)a4
{
  -[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:completionHandler:](self, "launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:completionHandler:", a3, 0, 0, a4);
}

- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  unsigned int (*v11)(void);
  uint64_t v12;
  _Unwind_Exception *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v9 = a5;
  v10 = a6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v11 = (unsigned int (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  v18 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke;
    v14[3] = &unk_1E6BC4BF8;
    v14[4] = &v15;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke((uint64_t)v14);
    v11 = (unsigned int (*)(void))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v11)
  {
    dlerror();
    v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v13);
  }
  if (v11())
    v12 = _os_feature_enabled_impl();
  else
    v12 = 0;
  -[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:](self, "launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:", v7, 0, 0, v12, v10);

}

- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 retainsSiri:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  id v12;
  void (**v13)(id, _QWORD, id);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  INCAppLaunchRequest *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_t loga;
  os_log_t logb;
  NSObject *log;
  id v40;
  _QWORD v41[4];
  INCAppLaunchRequest *v42;
  void (**v43)(id, _QWORD, id);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_t v50;
  _BYTE buf[24];
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a7;
  -[INCAppProxy _connection](self, "_connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_transaction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "currentIntent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "intentResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v16, v18);
  if (v12)
  {
    objc_msgSend(v15, "userActivityWithIdentifier:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSir"
                             "i:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v12;
        _os_log_error_impl(&dword_1B727D000, v21, OS_LOG_TYPE_ERROR, "%s Unable to find user activity for identifier %{public}@", buf, 0x16u);
      }
      v20 = 0;
    }
  }
  else
  {
    objc_msgSend(v15, "currentUserActivity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = 0;
  v22 = -[INCAppLaunchRequest initWithInteraction:userActivity:inBackground:retainsSiri:error:]([INCAppLaunchRequest alloc], "initWithInteraction:userActivity:inBackground:retainsSiri:error:", v19, v20, v10, v8, &v44);
  v40 = v44;
  if (!v22)
  {
    v30 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:"
                           "completionHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v40;
      _os_log_error_impl(&dword_1B727D000, v30, OS_LOG_TYPE_ERROR, "%s Unable to construct launch request: %{public}@", buf, 0x16u);
      if (!v13)
        goto LABEL_30;
    }
    else if (!v13)
    {
      goto LABEL_30;
    }
    v13[2](v13, 0, v40);
    goto LABEL_30;
  }
  if (!v9 || v10)
    goto LABEL_13;
  v23 = (void *)objc_msgSend(objc_alloc((Class)getCARSessionStatusClass()), "initAndWaitUntilSessionUpdated");
  objc_msgSend(v23, "currentSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 || -[INCAppLaunchRequest isSupportedInCarPlay](v22, "isSupportedInCarPlay"))
  {

LABEL_13:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x2050000000;
      v25 = (void *)getTUCallCenterClass_softClass;
      v48 = getTUCallCenterClass_softClass;
      if (!getTUCallCenterClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getTUCallCenterClass_block_invoke;
        v52 = &unk_1E6BC4BF8;
        v53 = &v45;
        __getTUCallCenterClass_block_invoke((uint64_t)buf);
        v25 = (void *)v46[3];
      }
      v26 = objc_retainAutorelease(v25);
      _Block_object_dispose(&v45, 8);
      objc_msgSend(v26, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v16, v18);
      objc_msgSend(v27, "applicationWillLaunchForStartCallInteraction:", v28);

    }
    v29 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:"
                           "completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_1B727D000, v29, OS_LOG_TYPE_INFO, "%s Performing launch request: %@", buf, 0x16u);
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke;
    v41[3] = &unk_1E6BC43D8;
    v42 = v22;
    v43 = v13;
    -[INCAppLaunchRequest performWithCompletionHandler:](v42, "performWithCompletionHandler:", v41);

    goto LABEL_30;
  }
  v31 = (void *)*MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    log = v31;
    -[INCAppLaunchRequest bundleIdentifier](v22, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:co"
                         "mpletionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v34;
    _os_log_error_impl(&dword_1B727D000, log, OS_LOG_TYPE_ERROR, "%s Refusing to launch \"%{public}@\" while CarPlay is active because it is not available in CarPlay", buf, 0x16u);

  }
  if (v13)
  {
    loga = (os_log_t)MEMORY[0x1E0CB3940];
    -[INCAppLaunchRequest bundleIdentifier](v22, "bundleIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringWithFormat:](loga, "stringWithFormat:", CFSTR("Cannot launch \"%@\" while CarPlay is active because it is not available in CarPlay"), v32);
    logb = (os_log_t)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2938];
    v50 = logb;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1319, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v36);
  }

LABEL_30:
}

- (INCExtensionConnection)_connection
{
  return (INCExtensionConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

void __112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CBD670];
  v7 = *MEMORY[0x1E0CBD670];
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 136315394;
      v12 = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandl"
            "er:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Successfully performed launch request %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 136315650;
    v12 = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:]_block_invoke";
    v13 = 2112;
    v14 = v10;
    v15 = 2114;
    v16 = v5;
    _os_log_error_impl(&dword_1B727D000, v6, OS_LOG_TYPE_ERROR, "%s Failed to perform launch request %@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

+ (BOOL)shouldLaunchAppInBackgroundWithIntent:(id)a3 intentResponse:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void *v35;
  uint64_t v37;
  NSObject *v38;
  unint64_t v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE buf[24];
  void *v47;
  uint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
    _os_log_impl(&dword_1B727D000, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)getCARSessionStatusClass()), "initAndWaitUntilSessionUpdated");
  objc_msgSend(v8, "currentSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  if ((INIsDeviceLocked() | v10) == 1)
  {
    v11 = v5;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v39 = v12;

      v13 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      v16 = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v15 = 0;
      v39 = 0;
      v17 = 0;
    }
    v18 = v17;

    if (!(v39 | v15) && !v18)
    {
      LOBYTE(v10) = 0;
LABEL_47:

      goto LABEL_48;
    }
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v19 = (void *)getTUCallProviderManagerClass_softClass;
    v45 = getTUCallProviderManagerClass_softClass;
    v20 = MEMORY[0x1E0C809B0];
    if (!getTUCallProviderManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getTUCallProviderManagerClass_block_invoke;
      v47 = &unk_1E6BC4BF8;
      v48 = &v42;
      __getTUCallProviderManagerClass_block_invoke((uint64_t)buf);
      v19 = (void *)v43[3];
    }
    v21 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v42, 8);
    v22 = objc_alloc_init(v21);
    objc_msgSend(v11, "_intents_bundleIdForLaunching");
    v40[0] = v20;
    v40[1] = 3221225472;
    v40[2] = __68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke;
    v40[3] = &unk_1E6BC4400;
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v23;
    objc_msgSend(v22, "providersPassingTest:", v40);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v26 = *MEMORY[0x1E0CBD670];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_FAULT))
        goto LABEL_46;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      v27 = "%s Calling intent has an unknown call provider (%{public}@), preventing us from determining if the app shoul"
            "d be launched in the background";
      v28 = v26;
      v29 = 22;
LABEL_26:
      _os_log_fault_impl(&dword_1B727D000, v28, OS_LOG_TYPE_FAULT, v27, buf, v29);
      goto LABEL_46;
    }
    if ((objc_msgSend(v25, "isSystemProvider") & 1) != 0)
    {
LABEL_23:
      LOBYTE(v10) = 1;
LABEL_46:

      goto LABEL_47;
    }
    if (objc_msgSend(v6, "_intentResponseCode") == 6)
    {
      v30 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
        _os_log_impl(&dword_1B727D000, v30, OS_LOG_TYPE_INFO, "%s Call intent failed requiring app launch, launching app in the foreground", buf, 0xCu);
      }
      LOBYTE(v10) = 0;
      goto LABEL_46;
    }
    if (v39 | v15)
    {
      if (v39)
        v31 = (void *)v39;
      else
        v31 = (void *)v15;
      v32 = objc_msgSend(v31, "destinationType");
      v33 = v32;
      if (v32 == 3)
      {
        v34 = objc_msgSend(v25, "supportsVoicemail");
        goto LABEL_45;
      }
      if (v32 == 2)
      {
        v34 = objc_msgSend(v25, "supportsEmergency");
LABEL_45:
        LOBYTE(v10) = v34;
        goto LABEL_46;
      }
      if (v39)
      {
        v37 = objc_msgSend((id)v39, "callCapability");
        v35 = (void *)v37;
        if (v37 != 2)
        {
          if (v37 != 1)
            goto LABEL_42;
          goto LABEL_54;
        }
LABEL_55:
        v34 = objc_msgSend(v25, "supportsAudioAndVideo");
        goto LABEL_45;
      }
      if (v15)
      {
LABEL_54:
        if ((objc_msgSend(v25, "supportsAudioOnly") & 1) != 0)
          goto LABEL_23;
        goto LABEL_55;
      }
    }
    else
    {
      v33 = 0;
    }
    if (!v18)
    {
      v35 = 0;
LABEL_42:
      v38 = *MEMORY[0x1E0CBD670];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_FAULT))
        goto LABEL_46;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2048;
      v47 = v35;
      v27 = "%s Calling intent had an unknown call destination (%lu) and/or an unknown call capability (%lu), preventing "
            "us from determining if the app should be launched in the background.";
      v28 = v38;
      v29 = 32;
      goto LABEL_26;
    }
    goto LABEL_55;
  }
  LOBYTE(v10) = 0;
LABEL_48:

  return v10;
}

uint64_t __68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
