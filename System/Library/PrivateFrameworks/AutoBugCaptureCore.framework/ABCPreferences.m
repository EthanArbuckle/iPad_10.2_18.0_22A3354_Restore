@implementation ABCPreferences

- (BOOL)optin_autobugcapture
{
  return self->_optin_autobugcapture;
}

- (ABCPreferences)init
{
  ABCPreferences *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)ABCPreferences;
  v2 = -[ABCPreferences init](&v12, sel_init);
  if (v2)
  {
    +[ManagedConfigurationUtils sharedInstance](ManagedConfigurationUtils, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("diagnosticsAndUsageEnabled"), 1, 0);
    -[ABCPreferences setDiagnosticsAndUsageEnabled:](v2, "setDiagnosticsAndUsageEnabled:", objc_msgSend(v3, "diagnosticsAndUsageEnabled"));
    if (!v2->_observedAutoBugCaptureUIPreference)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_settingsChanged, CFSTR("com.apple.autobugcapture.UserConsentYES"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_settingsChanged, CFSTR("com.apple.autobugcapture.UserConsentNO"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v2->_observedAutoBugCaptureUIPreference = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ABCPreferences initialValuesDictionary](ABCPreferences, "initialValuesDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerDefaults:", v7);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_internal_build"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("carrier_seed_flag"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("seed_flag"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("vendor_flag"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_autobugcapture"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("optin_autobugcapture"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("dut_flag"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("npi_flag"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("arbitrator_disable_dampening"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("arbitrator_daily_count_limit"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("ABCUserConsent"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("apns_enable"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("apns_dev_environment"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("max_upload_retries"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("arbitrator_dampened_ips_limit"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("dampening_restriction_factor"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("disable_api_rate_limit"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("api_rate_limit"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("api_limit_window"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("database_container_path"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("ignore_automated_device_group"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("autoFeedbackAssistantEnable"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_enable"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_sandbox_environment"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_upload_expiration_timeout"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_upload_connection_timeout"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_upload_max_fallback_log_count"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_container_identifier"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_inverness_service"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("cloudkit_prefers_anonymous"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("case_summary_maximum_per_submission"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("case_summary_submitted_retention_days"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("case_summary_unsubmitted_retention_days"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("case_summary_enable"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("diagnostic_pipeline_submission"), 5, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("diagnostic_pipeline_submission_rate"), 5, 0);
    configurationLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[ABCPreferences autoFeedbackAssistantEnable](v2, "autoFeedbackAssistantEnable");
      v10 = "off";
      if (v9)
        v10 = "on";
      *(_DWORD *)buf = 136446210;
      v14 = v10;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "autoFeedbackAssistantEnable setting is %{public}s", buf, 0xCu);
    }

  }
  return v2;
}

- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_diagnosticsAndUsageEnabled = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  const char *v23;
  void *v24;
  int v25;
  const char *v26;
  const char *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  int v32;
  void *v33;
  const char *v34;
  const char *v35;
  _BOOL4 v36;
  const char *v37;
  _BOOL4 v38;
  NSObject *v39;
  os_log_type_t v40;
  uint32_t v41;
  const char *v42;
  _BOOL4 v43;
  const char *v44;
  int v45;
  const char *v46;
  _BOOL4 v47;
  int64_t v48;
  const char *v49;
  _BOOL4 v50;
  const char *v51;
  _BOOL4 v52;
  unint64_t v53;
  unint64_t v54;
  _BOOL4 v55;
  unint64_t v56;
  const char *v57;
  _BOOL4 v58;
  unint64_t v59;
  unint64_t v60;
  const char *v61;
  _BOOL4 v62;
  const char *v63;
  _BOOL4 v64;
  const char *v65;
  _BOOL4 v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  const char *v70;
  _BOOL4 v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  const char *v75;
  _BOOL4 v76;
  const char *v77;
  _BOOL4 v78;
  unint64_t v79;
  NSObject *v80;
  const char *v81;
  _BOOL4 v82;
  void *v83;
  OS_dispatch_source *v84;
  OS_dispatch_source *checkProfilesTimer;
  NSObject *v86;
  dispatch_time_t v87;
  NSObject *v88;
  const char *v89;
  _BOOL4 v90;
  NSObject *v91;
  OS_dispatch_source *v92;
  _QWORD handler[5];
  uint8_t buf[4];
  unint64_t v95;
  __int16 v96;
  unint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v10;
  else
    v13 = 0;
  v14 = v13;
  configurationLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v95 = (unint64_t)v8;
    v96 = 2112;
    v97 = (unint64_t)v9;
    _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "%@ preference notification. change: %@ ", buf, 0x16u);
  }

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("disable_internal_build")))
  {
    if (v12)
    {
      -[ABCPreferences setDisable_internal_build:](self, "setDisable_internal_build:", objc_msgSend(v12, "BOOLValue"));
      configurationLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        goto LABEL_72;
      }
      if (-[ABCPreferences disable_internal_build](self, "disable_internal_build"))
        v17 = "YES";
      else
        v17 = "NO";
      v18 = -[ABCPreferences disable_internal_build](self, "disable_internal_build");
      *(_DWORD *)buf = 136315394;
      v95 = (unint64_t)v17;
      v96 = 2048;
      v97 = v18;
      v19 = "disable_internal_build override is %s (%ld)";
      v20 = v16;
      v21 = 22;
LABEL_16:
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      goto LABEL_41;
    }
    -[ABCPreferences setDisable_internal_build:](self, "setDisable_internal_build:", 0);
    configurationLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v30 = "disable_internal_build configured as default: NO";
LABEL_69:
      v39 = v29;
      v40 = OS_LOG_TYPE_INFO;
      v41 = 2;
LABEL_70:
      _os_log_impl(&dword_1DBAE1000, v39, v40, v30, buf, v41);
      goto LABEL_71;
    }
    goto LABEL_71;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("carrier_seed_flag")))
  {
    if (!v12)
    {
      -[ABCPreferences setCarrier_seed_flag:](self, "setCarrier_seed_flag:", 0);
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "carrier_seed_flag override not configured";
        goto LABEL_69;
      }
LABEL_71:

      goto LABEL_72;
    }
    -[ABCPreferences setCarrier_seed_flag:](self, "setCarrier_seed_flag:", v12);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences carrier_seed_flag](self, "carrier_seed_flag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "BOOLValue"))
      v23 = "YES";
    else
      v23 = "NO";
    -[ABCPreferences carrier_seed_flag](self, "carrier_seed_flag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v23;
    v96 = 1024;
    LODWORD(v97) = v25;
    v26 = "carrier_seed_flag override is %s (%d)";
LABEL_40:
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, v26, buf, 0x12u);

    goto LABEL_41;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("seed_flag")))
  {
    if (!v12)
    {
      -[ABCPreferences setSeed_flag:](self, "setSeed_flag:", 0);
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "seed_flag override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    -[ABCPreferences setSeed_flag:](self, "setSeed_flag:", v12);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences seed_flag](self, "seed_flag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "BOOLValue"))
      v27 = "YES";
    else
      v27 = "NO";
    -[ABCPreferences seed_flag](self, "seed_flag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v24, "BOOLValue");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v27;
    v96 = 1024;
    LODWORD(v97) = v28;
    v26 = "seed_flag override is %s (%d)";
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("vendor_flag")))
  {
    if (!v12)
    {
      -[ABCPreferences setVendor_flag:](self, "setVendor_flag:", 0);
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "vendor_flag override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    -[ABCPreferences setVendor_flag:](self, "setVendor_flag:", v12);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences vendor_flag](self, "vendor_flag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "BOOLValue"))
      v31 = "YES";
    else
      v31 = "NO";
    -[ABCPreferences vendor_flag](self, "vendor_flag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v24, "BOOLValue");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v31;
    v96 = 1024;
    LODWORD(v97) = v32;
    v26 = "vendor_flag override is %s (%d)";
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("database_container_path")))
  {
    if (!v14)
    {
      -[ABCPreferences setDatabase_container_path:](self, "setDatabase_container_path:", 0);
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "database_container_path override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    -[ABCPreferences setDatabase_container_path:](self, "setDatabase_container_path:", v14);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences database_container_path](self, "database_container_path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = (unint64_t)v33;
    v34 = "database_container_path override is %@";
LABEL_48:
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);

    goto LABEL_41;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("disable_autobugcapture")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setDisable_autobugcapture:](self, "setDisable_autobugcapture:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences disable_autobugcapture](self, "disable_autobugcapture"))
      v35 = "YES";
    else
      v35 = "NO";
    v36 = -[ABCPreferences disable_autobugcapture](self, "disable_autobugcapture");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v35;
    v96 = 1024;
    LODWORD(v97) = v36;
    v19 = "disable_autobugcapture configuration is %s (%d)";
LABEL_80:
    v20 = v16;
    v21 = 18;
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("optin_autobugcapture")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setOptin_autobugcapture:](self, "setOptin_autobugcapture:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences optin_autobugcapture](self, "optin_autobugcapture"))
      v37 = "YES";
    else
      v37 = "NO";
    v38 = -[ABCPreferences optin_autobugcapture](self, "optin_autobugcapture");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v37;
    v96 = 1024;
    LODWORD(v97) = v38;
    v19 = "optin_autobugcapture configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dut_flag")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setDut_flag:](self, "setDut_flag:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences dut_flag](self, "dut_flag"))
      v42 = "YES";
    else
      v42 = "NO";
    v43 = -[ABCPreferences dut_flag](self, "dut_flag");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v42;
    v96 = 1024;
    LODWORD(v97) = v43;
    v19 = "dut_flag configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("npi_flag")))
  {
    if (!v12)
    {
      -[ABCPreferences setNpi_flag:](self, "setNpi_flag:", 0);
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        goto LABEL_71;
      *(_WORD *)buf = 0;
      v30 = "npi_flag override not configured";
      goto LABEL_69;
    }
    -[ABCPreferences setNpi_flag:](self, "setNpi_flag:", v12);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences npi_flag](self, "npi_flag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "BOOLValue"))
      v44 = "YES";
    else
      v44 = "NO";
    -[ABCPreferences npi_flag](self, "npi_flag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v24, "BOOLValue");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v44;
    v96 = 1024;
    LODWORD(v97) = v45;
    v26 = "npi_flag override is %s (%d)";
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("arbitrator_disable_dampening")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setArbitrator_disable_dampening:](self, "setArbitrator_disable_dampening:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences arbitrator_disable_dampening](self, "arbitrator_disable_dampening"))
      v46 = "YES";
    else
      v46 = "NO";
    v47 = -[ABCPreferences arbitrator_disable_dampening](self, "arbitrator_disable_dampening");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v46;
    v96 = 1024;
    LODWORD(v97) = v47;
    v19 = "arbitrator_disable_dampening override is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("arbitrator_daily_count_limit")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setArbitrator_daily_count_limit:](self, "setArbitrator_daily_count_limit:", objc_msgSend(v12, "integerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v48 = -[ABCPreferences arbitrator_daily_count_limit](self, "arbitrator_daily_count_limit");
    *(_DWORD *)buf = 134217984;
    v95 = v48;
    v19 = "arbitrator_daily_count_limit configuration is %ld";
LABEL_99:
    v20 = v16;
    v21 = 12;
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("apns_enable")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setApns_enable:](self, "setApns_enable:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences apns_enable](self, "apns_enable"))
      v49 = "YES";
    else
      v49 = "NO";
    v50 = -[ABCPreferences apns_enable](self, "apns_enable");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v49;
    v96 = 1024;
    LODWORD(v97) = v50;
    v19 = "apns_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("apns_dev_environment")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setApns_dev_environment:](self, "setApns_dev_environment:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences apns_dev_environment](self, "apns_dev_environment"))
      v51 = "YES";
    else
      v51 = "NO";
    v52 = -[ABCPreferences apns_dev_environment](self, "apns_dev_environment");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v51;
    v96 = 1024;
    LODWORD(v97) = v52;
    v19 = "apns_dev_environment configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("max_upload_retries")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setMax_upload_retries:](self, "setMax_upload_retries:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v53 = -[ABCPreferences max_upload_retries](self, "max_upload_retries");
    *(_DWORD *)buf = 134217984;
    v95 = v53;
    v19 = "max_upload_retries configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("arbitrator_dampened_ips_limit")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setArbitrator_dampened_ips_limit:](self, "setArbitrator_dampened_ips_limit:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v54 = -[ABCPreferences arbitrator_dampened_ips_limit](self, "arbitrator_dampened_ips_limit");
    *(_DWORD *)buf = 134217984;
    v95 = v54;
    v19 = "arbitrator_dampened_ips_limit configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ABCUserConsent")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setABCUserConsent:](self, "setABCUserConsent:", objc_msgSend(v12, "unsignedIntegerValue") != 0);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v55 = -[ABCPreferences ABCUserConsent](self, "ABCUserConsent");
    *(_DWORD *)buf = 134217984;
    v95 = v55;
    v19 = "ABCUserConsent configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("dampening_restriction_factor")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setDampening_restriction_factor:](self, "setDampening_restriction_factor:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v56 = -[ABCPreferences dampening_restriction_factor](self, "dampening_restriction_factor");
    *(_DWORD *)buf = 134217984;
    v95 = v56;
    v19 = "dampening_restriction_factor configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("disable_api_rate_limit")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setDisable_api_rate_limit:](self, "setDisable_api_rate_limit:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences disable_api_rate_limit](self, "disable_api_rate_limit"))
      v57 = "YES";
    else
      v57 = "NO";
    v58 = -[ABCPreferences disable_api_rate_limit](self, "disable_api_rate_limit");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v57;
    v96 = 1024;
    LODWORD(v97) = v58;
    v19 = "disable_api_rate_limit override is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("api_rate_limit")))
  {
    if (!v12)
      goto LABEL_72;
    objc_msgSend(v12, "doubleValue");
    -[ABCPreferences setApi_rate_limit:](self, "setApi_rate_limit:");
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences api_rate_limit](self, "api_rate_limit");
    *(_DWORD *)buf = 134217984;
    v95 = v59;
    v19 = "api_rate_limit configuration is %.1lf";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("api_limit_window")))
  {
    if (!v12)
      goto LABEL_72;
    objc_msgSend(v12, "doubleValue");
    -[ABCPreferences setApi_limit_window:](self, "setApi_limit_window:");
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences api_limit_window](self, "api_limit_window");
    *(_DWORD *)buf = 134217984;
    v95 = v60;
    v19 = "api_limit_window configuration is %.1lf";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ignore_automated_device_group")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setIgnore_automated_device_group:](self, "setIgnore_automated_device_group:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences ignore_automated_device_group](self, "ignore_automated_device_group"))
      v61 = "YES";
    else
      v61 = "NO";
    v62 = -[ABCPreferences ignore_automated_device_group](self, "ignore_automated_device_group");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v61;
    v96 = 1024;
    LODWORD(v97) = v62;
    v19 = "ignore_automated_device_group override is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_enable")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_enable:](self, "setCloudkit_enable:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences cloudkit_enable](self, "cloudkit_enable"))
      v63 = "YES";
    else
      v63 = "NO";
    v64 = -[ABCPreferences cloudkit_enable](self, "cloudkit_enable");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v63;
    v96 = 1024;
    LODWORD(v97) = v64;
    v19 = "cloudkit_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_sandbox_environment")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_sandbox_environment:](self, "setCloudkit_sandbox_environment:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences cloudkit_sandbox_environment](self, "cloudkit_sandbox_environment"))
      v65 = "YES";
    else
      v65 = "NO";
    v66 = -[ABCPreferences cloudkit_sandbox_environment](self, "cloudkit_sandbox_environment");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v65;
    v96 = 1024;
    LODWORD(v97) = v66;
    v19 = "cloudkit_sandbox_environment override is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_container_identifier")))
  {
    if (!v14)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_container_identifier:](self, "setCloudkit_container_identifier:", v14);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences cloudkit_container_identifier](self, "cloudkit_container_identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = (unint64_t)v33;
    v34 = "cloudkit_container_identifier configuration is %@";
    goto LABEL_48;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_inverness_service")))
  {
    if (!v14)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_inverness_service:](self, "setCloudkit_inverness_service:", v14);
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences cloudkit_inverness_service](self, "cloudkit_inverness_service");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = (unint64_t)v33;
    v34 = "cloudkit_inverness_service configuration is %@";
    goto LABEL_48;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_upload_expiration_timeout")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_upload_expiration_timeout:](self, "setCloudkit_upload_expiration_timeout:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v67 = -[ABCPreferences cloudkit_upload_expiration_timeout](self, "cloudkit_upload_expiration_timeout");
    *(_DWORD *)buf = 134217984;
    v95 = v67;
    v19 = "cloudkit_upload_expiration_timeout configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_upload_connection_timeout")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_upload_connection_timeout:](self, "setCloudkit_upload_connection_timeout:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v68 = -[ABCPreferences cloudkit_upload_connection_timeout](self, "cloudkit_upload_connection_timeout");
    *(_DWORD *)buf = 134217984;
    v95 = v68;
    v19 = "cloudkit_upload_connection_timeout configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_upload_max_fallback_log_count")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_upload_max_fallback_log_count:](self, "setCloudkit_upload_max_fallback_log_count:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v69 = -[ABCPreferences cloudkit_upload_max_fallback_log_count](self, "cloudkit_upload_max_fallback_log_count");
    *(_DWORD *)buf = 134217984;
    v95 = v69;
    v19 = "cloudkit_upload_max_fallback_log_count configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("cloudkit_prefers_anonymous")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCloudkit_prefers_anonymous:](self, "setCloudkit_prefers_anonymous:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences cloudkit_prefers_anonymous](self, "cloudkit_prefers_anonymous"))
      v70 = "YES";
    else
      v70 = "NO";
    v71 = -[ABCPreferences cloudkit_prefers_anonymous](self, "cloudkit_prefers_anonymous");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v70;
    v96 = 1024;
    LODWORD(v97) = v71;
    v19 = "cloudkit_prefers_anonymous configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("case_summary_maximum_per_submission")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCase_summary_maximum_per_submission:](self, "setCase_summary_maximum_per_submission:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v72 = -[ABCPreferences case_summary_maximum_per_submission](self, "case_summary_maximum_per_submission");
    *(_DWORD *)buf = 134217984;
    v95 = v72;
    v19 = "case_summary_maximum_per_submission configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("case_summary_submitted_retention_days")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCase_summary_submitted_retention_days:](self, "setCase_summary_submitted_retention_days:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v73 = -[ABCPreferences case_summary_submitted_retention_days](self, "case_summary_submitted_retention_days");
    *(_DWORD *)buf = 134217984;
    v95 = v73;
    v19 = "case_summary_submitted_retention_days configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("case_summary_unsubmitted_retention_days")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCase_summary_unsubmitted_retention_days:](self, "setCase_summary_unsubmitted_retention_days:", objc_msgSend(v12, "unsignedIntegerValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v74 = -[ABCPreferences case_summary_unsubmitted_retention_days](self, "case_summary_unsubmitted_retention_days");
    *(_DWORD *)buf = 134217984;
    v95 = v74;
    v19 = "case_summary_unsubmitted_retention_days configuration is %ld";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("case_summary_enable")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setCase_summary_enable:](self, "setCase_summary_enable:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences case_summary_enable](self, "case_summary_enable"))
      v75 = "YES";
    else
      v75 = "NO";
    v76 = -[ABCPreferences case_summary_enable](self, "case_summary_enable");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v75;
    v96 = 1024;
    LODWORD(v97) = v76;
    v19 = "case_summary_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("diagnostic_pipeline_submission")))
  {
    if (!v12)
      goto LABEL_72;
    -[ABCPreferences setDiagnostic_pipeline_submission:](self, "setDiagnostic_pipeline_submission:", objc_msgSend(v12, "BOOLValue"));
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    if (-[ABCPreferences diagnostic_pipeline_submission](self, "diagnostic_pipeline_submission"))
      v77 = "YES";
    else
      v77 = "NO";
    v78 = -[ABCPreferences diagnostic_pipeline_submission](self, "diagnostic_pipeline_submission");
    *(_DWORD *)buf = 136315394;
    v95 = (unint64_t)v77;
    v96 = 1024;
    LODWORD(v97) = v78;
    v19 = "diagnostic_pipeline_submission configuration is %s (%d)";
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("diagnostic_pipeline_submission_rate")))
  {
    if (!v12)
      goto LABEL_72;
    objc_msgSend(v12, "doubleValue");
    -[ABCPreferences setDiagnostic_pipeline_submission_rate:](self, "setDiagnostic_pipeline_submission_rate:");
    configurationLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    -[ABCPreferences diagnostic_pipeline_submission_rate](self, "diagnostic_pipeline_submission_rate");
    *(_DWORD *)buf = 134217984;
    v95 = v79;
    v19 = "diagnostic_pipeline_submission_rate configuration is %.3lf";
    goto LABEL_99;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("autoFeedbackAssistantEnable")))
  {
    if (v12)
    {
      -[ABCPreferences setAutoFeedbackAssistantEnable:](self, "setAutoFeedbackAssistantEnable:", objc_msgSend(v12, "BOOLValue"));
      configurationLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        if (-[ABCPreferences autoFeedbackAssistantEnable](self, "autoFeedbackAssistantEnable"))
          v81 = "YES";
        else
          v81 = "NO";
        v82 = -[ABCPreferences autoFeedbackAssistantEnable](self, "autoFeedbackAssistantEnable");
        *(_DWORD *)buf = 136315394;
        v95 = (unint64_t)v81;
        v96 = 1024;
        LODWORD(v97) = v82;
        _os_log_impl(&dword_1DBAE1000, v80, OS_LOG_TYPE_DEFAULT, "autoFeedbackAssistantEnable configuration is %s (%d)", buf, 0x12u);
      }

      if (-[ABCPreferences autoFeedbackAssistantEnable](self, "autoFeedbackAssistantEnable")
        && !self->_observingInstalledProfiles)
      {
        +[ManagedConfigurationUtils sharedInstance](ManagedConfigurationUtils, "sharedInstance");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addObserver:forKeyPath:options:context:", self, CFSTR("installedVisibleProfileIdentifiers"), 1, 0);

        v84 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        checkProfilesTimer = self->_checkProfilesTimer;
        self->_checkProfilesTimer = v84;

        v86 = self->_checkProfilesTimer;
        v87 = dispatch_time(0, 120000000000);
        dispatch_source_set_timer(v86, v87, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v88 = self->_checkProfilesTimer;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __65__ABCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
        handler[3] = &unk_1EA3B4960;
        handler[4] = self;
        dispatch_source_set_event_handler(v88, handler);
        dispatch_resume((dispatch_object_t)self->_checkProfilesTimer);
        self->_observingInstalledProfiles = 1;
      }
    }
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("diagnosticsAndUsageEnabled")))
    {
      if (!v12)
        goto LABEL_72;
      -[ABCPreferences setDiagnosticsAndUsageEnabled:](self, "setDiagnosticsAndUsageEnabled:", objc_msgSend(v12, "BOOLValue"));
      configurationLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      if (-[ABCPreferences diagnosticsAndUsageEnabled](self, "diagnosticsAndUsageEnabled"))
        v89 = "YES";
      else
        v89 = "NO";
      v90 = -[ABCPreferences diagnosticsAndUsageEnabled](self, "diagnosticsAndUsageEnabled");
      *(_DWORD *)buf = 136315394;
      v95 = (unint64_t)v89;
      v96 = 1024;
      LODWORD(v97) = v90;
      v19 = "diagnosticsAndUsageEnabled configuration is %s (%d)";
      goto LABEL_80;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("installedVisibleProfileIdentifiers")))
    {
      configurationLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_71;
      *(_DWORD *)buf = 138412546;
      v95 = (unint64_t)v9;
      v96 = 2112;
      v97 = (unint64_t)v8;
      v30 = "Received an unexpected symptomsd-diag preference change: %@ for %@";
      v39 = v29;
      v40 = OS_LOG_TYPE_DEFAULT;
      v41 = 22;
      goto LABEL_70;
    }
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v91 = self->_checkProfilesTimer;
        if (v91)
        {
          dispatch_source_cancel(v91);
          v92 = self->_checkProfilesTimer;
          self->_checkProfilesTimer = 0;

        }
        -[ABCPreferences processInstalledVisibleProfileIdentifiers:](self, "processInstalledVisibleProfileIdentifiers:", v10);
      }
    }
  }
LABEL_72:

}

+ (id)initialValuesDictionary
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ABCUserConsent"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("disable_autobugcapture"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("optin_autobugcapture"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("dut_flag"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("arbitrator_disable_dampening"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB58, CFSTR("arbitrator_daily_count_limit"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("apns_enable"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("apns_dev_environment"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB70, CFSTR("max_upload_retries"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB88, CFSTR("arbitrator_dampened_ips_limit"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBA0, CFSTR("dampening_restriction_factor"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("disable_api_rate_limit"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBB8, CFSTR("api_rate_limit"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBD0, CFSTR("api_limit_window"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("ignore_automated_device_group"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("cloudkit_enable"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBE8, CFSTR("case_summary_enable"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("cloudkit_sandbox_environment"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFC00, CFSTR("cloudkit_upload_expiration_timeout"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFC18, CFSTR("cloudkit_upload_connection_timeout"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB70, CFSTR("cloudkit_upload_max_fallback_log_count"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.autobugcapture.devicediagnostics"), CFSTR("cloudkit_container_identifier"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("AbcDecision"), CFSTR("cloudkit_inverness_service"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBE8, CFSTR("cloudkit_prefers_anonymous"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFB40, CFSTR("autoFeedbackAssistantEnable"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFC30, CFSTR("case_summary_maximum_per_submission"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFC48, CFSTR("case_summary_submitted_retention_days"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFC60, CFSTR("case_summary_unsubmitted_retention_days"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3CFBE8, CFSTR("diagnostic_pipeline_submission"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA3D0188, CFSTR("diagnostic_pipeline_submission_rate"));
  return v2;
}

- (BOOL)is_automated_device_group
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if ((is_automated_device_group_foundAutomatedDeviceGroup & 1) != 0)
    {
      configurationLogHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        v3 = "Automated device group set. Skipping further OSAnalytics queries";
        v4 = v2;
        v5 = 2;
LABEL_8:
        _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v12, v5);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v8 = v7;

      if (v8 - *(double *)&is_automated_device_group_lastQueryTimestamp >= *(double *)&is_automated_device_group_queryHysteresis)
      {
        objc_msgSend(MEMORY[0x1E0D1BCE8], "automatedDeviceGroup", v8 - *(double *)&is_automated_device_group_lastQueryTimestamp);
        v2 = objc_claimAutoreleasedReturnValue();
        configurationLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v2)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v12 = 138412290;
            v13 = (uint64_t)v2;
            _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "AutomatedDeviceGroup is configured as: '%@'", (uint8_t *)&v12, 0xCu);
          }

          is_automated_device_group_foundAutomatedDeviceGroup = 1;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            LOWORD(v12) = 0;
            _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "This device is not in an automated test group", (uint8_t *)&v12, 2u);
          }

          is_automated_device_group_foundAutomatedDeviceGroup = 0;
          is_automated_device_group_queryHysteresis = fmin(*(double *)&is_automated_device_group_queryHysteresis+ *(double *)&is_automated_device_group_queryHysteresis, 3600.0);
        }
        is_automated_device_group_lastQueryTimestamp = *(_QWORD *)&v8;
        goto LABEL_17;
      }
      configurationLogHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = is_automated_device_group_lastQueryTimestamp;
        v3 = "Skipping this OSAnalytics query (last queried 'automatedDeviceGroup' at %.3lf)";
        v4 = v2;
        v5 = 12;
        goto LABEL_8;
      }
    }
LABEL_17:

  }
  return is_automated_device_group_foundAutomatedDeviceGroup;
}

- (BOOL)has_apple_email
{
  if (os_variant_has_internal_diagnostics() && has_apple_email_onceToken != -1)
    dispatch_once(&has_apple_email_onceToken, &__block_literal_global_10);
  return has_apple_email_foundAppleEmailAccount;
}

void __33__ABCPreferences_has_apple_email__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  unint64_t v4;
  uint64_t v5;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1BCE8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "internalKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  configurationLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      v7 = "Unable to fetch the internal key from OSASystemConfiguration";
      v8 = v3;
      v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
LABEL_14:

    has_apple_email_foundAppleEmailAccount = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138477827;
    v14 = v1;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "InternalKey is configured as: '%{private}@'", (uint8_t *)&v13, 0xCu);
  }

  v4 = objc_msgSend(v1, "rangeOfString:", CFSTR("@apple.com"));
  if (v4 < 2 || v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    configurationLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v7 = "Did not find an email address as part of the internal key";
      v8 = v3;
      v9 = OS_LOG_TYPE_INFO;
LABEL_13:
      _os_log_impl(&dword_1DBAE1000, v8, v9, v7, (uint8_t *)&v13, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  objc_msgSend(v1, "substringToIndex:", v4 + v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  configurationLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 138477827;
    v14 = v10;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Found Apple email configured as: '%{private}@'", (uint8_t *)&v13, 0xCu);
  }

  has_apple_email_foundAppleEmailAccount = 1;
LABEL_15:

}

void __65__ABCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  +[ManagedConfigurationUtils sharedInstance](ManagedConfigurationUtils, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installedVisibleProfileIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processInstalledVisibleProfileIdentifiers:", v4);

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

}

- (void)processInstalledVisibleProfileIdentifiers:(id)a3
{
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "containsObject:", CFSTR("com.apple.basebandlogging"));
  if (self->_autoFeedbackAssistantEnable && (v4 & 1) == 0)
  {
    configurationLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "autoFeedbackAssistantEnable";
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Disabling the %s Preference", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", 0, CFSTR("autoFeedbackAssistantEnable"));

    if (self->_observingInstalledProfiles)
    {
      +[ManagedConfigurationUtils sharedInstance](ManagedConfigurationUtils, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("installedVisibleProfileIdentifiers"));

      self->_observingInstalledProfiles = 0;
    }
  }
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  void *v6;
  NSObject *checkProfilesTimer;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_internal_build"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("carrier_seed_flag"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("seed_flag"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("vendor_flag"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_autobugcapture"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("optin_autobugcapture"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dut_flag"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("npi_flag"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("arbitrator_disable_dampening"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("arbitrator_daily_count_limit"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ABCUserConsent"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("apns_enable"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("apns_dev_environment"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("max_upload_retries"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("arbitrator_dampened_ips_limit"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("dampening_restriction_factor"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("disable_api_rate_limit"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("api_rate_limit"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("api_limit_window"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("database_container_path"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("ignore_automated_device_group"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("autoFeedbackAssistantEnable"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_enable"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_sandbox_environment"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_upload_expiration_timeout"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_upload_connection_timeout"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_upload_max_fallback_log_count"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_container_identifier"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_inverness_service"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("cloudkit_prefers_anonymous"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("case_summary_maximum_per_submission"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("case_summary_submitted_retention_days"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("case_summary_unsubmitted_retention_days"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("case_summary_enable"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("diagnostic_pipeline_submission"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("diagnostic_pipeline_submission_rate"));
  if (self->_observedAutoBugCaptureUIPreference)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.autobugcapture.UserConsentYES"), 0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.autobugcapture.UserConsentNO"), 0);
    self->_observedAutoBugCaptureUIPreference = 0;
  }
  +[ManagedConfigurationUtils sharedInstance](ManagedConfigurationUtils, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("diagnosticsAndUsageEnabled"));
  if (self->_observingInstalledProfiles)
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("installedVisibleProfileIdentifiers"));
  checkProfilesTimer = self->_checkProfilesTimer;
  if (checkProfilesTimer)
    dispatch_source_cancel(checkProfilesTimer);

  v8.receiver = self;
  v8.super_class = (Class)ABCPreferences;
  -[ABCPreferences dealloc](&v8, sel_dealloc);
}

- (void)setABCUIUserConsent:(BOOL)a3
{
  if (self->_abcUIUserConsent != a3)
  {
    -[ABCPreferences willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("abcUIUserConsent"));
    self->_abcUIUserConsent = a3;
    -[ABCPreferences didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("abcUIUserConsent"));
    -[ABCPreferences setABCUserConsent:](self, "setABCUserConsent:", self->_abcUIUserConsent);
  }
}

- (void)setABCUserConsent:(BOOL)a3
{
  if (self->_ABCUserConsent != a3)
  {
    -[ABCPreferences willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ABCUserConsent"));
    self->_ABCUserConsent = a3;
    -[ABCPreferences didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ABCUserConsent"));
  }
}

- (BOOL)diagnosticsAndUsageEnabled
{
  return self->_diagnosticsAndUsageEnabled;
}

- (BOOL)autoFeedbackAssistantEnable
{
  return self->_autoFeedbackAssistantEnable;
}

- (void)setAutoFeedbackAssistantEnable:(BOOL)a3
{
  self->_autoFeedbackAssistantEnable = a3;
}

- (BOOL)disable_internal_build
{
  return self->_disable_internal_build;
}

- (void)setDisable_internal_build:(BOOL)a3
{
  self->_disable_internal_build = a3;
}

- (NSNumber)carrier_seed_flag
{
  return self->_carrier_seed_flag;
}

- (void)setCarrier_seed_flag:(id)a3
{
  objc_storeStrong((id *)&self->_carrier_seed_flag, a3);
}

- (NSNumber)seed_flag
{
  return self->_seed_flag;
}

- (void)setSeed_flag:(id)a3
{
  objc_storeStrong((id *)&self->_seed_flag, a3);
}

- (NSNumber)vendor_flag
{
  return self->_vendor_flag;
}

- (void)setVendor_flag:(id)a3
{
  objc_storeStrong((id *)&self->_vendor_flag, a3);
}

- (NSString)database_container_path
{
  return self->_database_container_path;
}

- (void)setDatabase_container_path:(id)a3
{
  objc_storeStrong((id *)&self->_database_container_path, a3);
}

- (NSNumber)npi_flag
{
  return self->_npi_flag;
}

- (void)setNpi_flag:(id)a3
{
  objc_storeStrong((id *)&self->_npi_flag, a3);
}

- (void)setOptin_autobugcapture:(BOOL)a3
{
  self->_optin_autobugcapture = a3;
}

- (BOOL)disable_autobugcapture
{
  return self->_disable_autobugcapture;
}

- (void)setDisable_autobugcapture:(BOOL)a3
{
  self->_disable_autobugcapture = a3;
}

- (BOOL)dut_flag
{
  return self->_dut_flag;
}

- (void)setDut_flag:(BOOL)a3
{
  self->_dut_flag = a3;
}

- (BOOL)ignore_automated_device_group
{
  return self->_ignore_automated_device_group;
}

- (void)setIgnore_automated_device_group:(BOOL)a3
{
  self->_ignore_automated_device_group = a3;
}

- (BOOL)apns_enable
{
  return self->_apns_enable;
}

- (void)setApns_enable:(BOOL)a3
{
  self->_apns_enable = a3;
}

- (BOOL)apns_dev_environment
{
  return self->_apns_dev_environment;
}

- (void)setApns_dev_environment:(BOOL)a3
{
  self->_apns_dev_environment = a3;
}

- (BOOL)arbitrator_disable_dampening
{
  return self->_arbitrator_disable_dampening;
}

- (void)setArbitrator_disable_dampening:(BOOL)a3
{
  self->_arbitrator_disable_dampening = a3;
}

- (BOOL)disable_api_rate_limit
{
  return self->_disable_api_rate_limit;
}

- (void)setDisable_api_rate_limit:(BOOL)a3
{
  self->_disable_api_rate_limit = a3;
}

- (BOOL)cloudkit_enable
{
  return self->_cloudkit_enable;
}

- (void)setCloudkit_enable:(BOOL)a3
{
  self->_cloudkit_enable = a3;
}

- (BOOL)ABCUserConsent
{
  return self->_ABCUserConsent;
}

- (BOOL)abcUIUserConsent
{
  return self->_abcUIUserConsent;
}

- (void)setAbcUIUserConsent:(BOOL)a3
{
  self->_abcUIUserConsent = a3;
}

- (int64_t)arbitrator_daily_count_limit
{
  return self->_arbitrator_daily_count_limit;
}

- (void)setArbitrator_daily_count_limit:(int64_t)a3
{
  self->_arbitrator_daily_count_limit = a3;
}

- (unint64_t)max_upload_retries
{
  return self->_max_upload_retries;
}

- (void)setMax_upload_retries:(unint64_t)a3
{
  self->_max_upload_retries = a3;
}

- (unint64_t)arbitrator_dampened_ips_limit
{
  return self->_arbitrator_dampened_ips_limit;
}

- (void)setArbitrator_dampened_ips_limit:(unint64_t)a3
{
  self->_arbitrator_dampened_ips_limit = a3;
}

- (unint64_t)dampening_restriction_factor
{
  return self->_dampening_restriction_factor;
}

- (void)setDampening_restriction_factor:(unint64_t)a3
{
  self->_dampening_restriction_factor = a3;
}

- (double)api_rate_limit
{
  return self->_api_rate_limit;
}

- (void)setApi_rate_limit:(double)a3
{
  self->_api_rate_limit = a3;
}

- (double)api_limit_window
{
  return self->_api_limit_window;
}

- (void)setApi_limit_window:(double)a3
{
  self->_api_limit_window = a3;
}

- (BOOL)cloudkit_sandbox_environment
{
  return self->_cloudkit_sandbox_environment;
}

- (void)setCloudkit_sandbox_environment:(BOOL)a3
{
  self->_cloudkit_sandbox_environment = a3;
}

- (unint64_t)cloudkit_upload_expiration_timeout
{
  return self->_cloudkit_upload_expiration_timeout;
}

- (void)setCloudkit_upload_expiration_timeout:(unint64_t)a3
{
  self->_cloudkit_upload_expiration_timeout = a3;
}

- (unint64_t)cloudkit_upload_connection_timeout
{
  return self->_cloudkit_upload_connection_timeout;
}

- (void)setCloudkit_upload_connection_timeout:(unint64_t)a3
{
  self->_cloudkit_upload_connection_timeout = a3;
}

- (unint64_t)cloudkit_upload_max_fallback_log_count
{
  return self->_cloudkit_upload_max_fallback_log_count;
}

- (void)setCloudkit_upload_max_fallback_log_count:(unint64_t)a3
{
  self->_cloudkit_upload_max_fallback_log_count = a3;
}

- (NSString)cloudkit_container_identifier
{
  return self->_cloudkit_container_identifier;
}

- (void)setCloudkit_container_identifier:(id)a3
{
  objc_storeStrong((id *)&self->_cloudkit_container_identifier, a3);
}

- (NSString)cloudkit_inverness_service
{
  return self->_cloudkit_inverness_service;
}

- (void)setCloudkit_inverness_service:(id)a3
{
  objc_storeStrong((id *)&self->_cloudkit_inverness_service, a3);
}

- (BOOL)cloudkit_prefers_anonymous
{
  return self->_cloudkit_prefers_anonymous;
}

- (void)setCloudkit_prefers_anonymous:(BOOL)a3
{
  self->_cloudkit_prefers_anonymous = a3;
}

- (unint64_t)case_summary_maximum_per_submission
{
  return self->_case_summary_maximum_per_submission;
}

- (void)setCase_summary_maximum_per_submission:(unint64_t)a3
{
  self->_case_summary_maximum_per_submission = a3;
}

- (unint64_t)case_summary_submitted_retention_days
{
  return self->_case_summary_submitted_retention_days;
}

- (void)setCase_summary_submitted_retention_days:(unint64_t)a3
{
  self->_case_summary_submitted_retention_days = a3;
}

- (unint64_t)case_summary_unsubmitted_retention_days
{
  return self->_case_summary_unsubmitted_retention_days;
}

- (void)setCase_summary_unsubmitted_retention_days:(unint64_t)a3
{
  self->_case_summary_unsubmitted_retention_days = a3;
}

- (BOOL)case_summary_enable
{
  return self->_case_summary_enable;
}

- (void)setCase_summary_enable:(BOOL)a3
{
  self->_case_summary_enable = a3;
}

- (BOOL)diagnostic_pipeline_submission
{
  return self->_diagnostic_pipeline_submission;
}

- (void)setDiagnostic_pipeline_submission:(BOOL)a3
{
  self->_diagnostic_pipeline_submission = a3;
}

- (double)diagnostic_pipeline_submission_rate
{
  return self->_diagnostic_pipeline_submission_rate;
}

- (void)setDiagnostic_pipeline_submission_rate:(double)a3
{
  self->_diagnostic_pipeline_submission_rate = a3;
}

- (BOOL)enable_cloudkit
{
  return self->_enable_cloudkit;
}

- (void)setEnable_cloudkit:(BOOL *)a3
{
  self->_enable_cloudkit = a3;
}

- (NSUserDefaults)automatedDeviceGroupDefaults
{
  return self->_automatedDeviceGroupDefaults;
}

- (void)setAutomatedDeviceGroupDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_automatedDeviceGroupDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automatedDeviceGroupDefaults, 0);
  objc_storeStrong((id *)&self->_cloudkit_inverness_service, 0);
  objc_storeStrong((id *)&self->_cloudkit_container_identifier, 0);
  objc_storeStrong((id *)&self->_npi_flag, 0);
  objc_storeStrong((id *)&self->_database_container_path, 0);
  objc_storeStrong((id *)&self->_vendor_flag, 0);
  objc_storeStrong((id *)&self->_seed_flag, 0);
  objc_storeStrong((id *)&self->_carrier_seed_flag, 0);
  objc_storeStrong((id *)&self->_checkProfilesTimer, 0);
}

@end
