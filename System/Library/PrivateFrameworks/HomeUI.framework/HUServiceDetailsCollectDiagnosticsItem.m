@implementation HUServiceDetailsCollectDiagnosticsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  HUServiceDetailsCollectDiagnosticsItem *v55;
  _QWORD v56[4];
  id v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  _BOOL4 v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    v10 = v9;

    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v55 = self;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

  objc_msgSend(v7, "supportedDiagnostics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportedTypes");

  v19 = v18 & 1;
  v20 = HFPreferencesBooleanValueForKey();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall") & 1) != 0 || v20 == 2)
    v21 = (v18 >> 1) & 1;
  else
    LODWORD(v21) = 0;
  if (v7)
    v22 = v16;
  else
    v22 = 0;
  if ((v18 & 1) != 0)
    v23 = 1;
  else
    v23 = v21;
  v24 = v22 & v23;
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    v63 = v24;
    v64 = 1024;
    v65 = v16;
    v66 = 1024;
    v67 = v7 != 0;
    v68 = 1024;
    v69 = v19;
    v70 = 1024;
    v71 = v21;
    v72 = 1024;
    v73 = v20 == 2;
    v74 = 1024;
    v75 = objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall");
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_INFO, "Showing Logs button: %{BOOL}d. isAdmin= %{BOOL}d, sourceAccessory= %{BOOL}d, manufacturerSnapshot= %{BOOL}d, adkSnapshot= %{BOOL}d, supportProfileInstalled= %{BOOL}d, isInternalInstall= %{BOOL}d", buf, 0x2Cu);
  }

  v26 = (void *)MEMORY[0x1E0D31578];
  v60[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsCollectDiagnosticsButton"), CFSTR("HUServiceDetailsCollectDiagnosticsButton"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v27;
  v28 = *MEMORY[0x1E0D30D70];
  v60[1] = *MEMORY[0x1E0D30D70];
  v29 = v24 ^ 1u;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v30;
  v60[2] = *MEMORY[0x1E0D30B80];
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outcomeWithResults:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v21 || (v29 & 1) != 0 || v20 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v33);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](v55, "sourceServiceItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    if (v36)
    {
      objc_msgSend(v36, "accessories");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0x1E0C99000;
      if (objc_msgSend(v37, "count") != 1)
        NSLog(CFSTR("Expected one accessory but found = %@"), v37);
      objc_msgSend(v37, "anyObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "services");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "na_firstObjectPassingTest:", &__block_literal_global_71);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "valueSource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HUServiceDetailsAbstractItem sourceServiceItem](v55, "sourceServiceItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "valueSource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUServiceDetailsAbstractItem sourceServiceItem](v55, "sourceServiceItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "services");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0x1E0C99000uLL;
    }

    v46 = objc_alloc(MEMORY[0x1E0D31800]);
    objc_msgSend(v42, "anyObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hf_serviceDescriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v46, "initWithValueSource:services:primaryServiceDescriptor:", v43, v42, v48);

    v50 = objc_alloc(MEMORY[0x1E0D31080]);
    v58 = v28;
    v59 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(*(id *)(v38 + 3456), "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v50, "initWithValueSource:displayResults:", v49, v51);

    objc_msgSend(v52, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke_2;
    v56[3] = &unk_1E6F52070;
    v57 = v33;
    objc_msgSend(v53, "flatMap:", v56);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v44;
}

uint64_t __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB99F8]);

  return v3;
}

id __70__HUServiceDetailsCollectDiagnosticsItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30550]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") & 2;
  if (!(v4 & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v3, "integerValue") & 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109376;
      v8[1] = 0;
      v9 = 1024;
      v10 = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_INFO, "Hiding Logs button. verboseLogging= %{BOOL}d, audioClips= %{BOOL}d", (uint8_t *)v8, 0xEu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
