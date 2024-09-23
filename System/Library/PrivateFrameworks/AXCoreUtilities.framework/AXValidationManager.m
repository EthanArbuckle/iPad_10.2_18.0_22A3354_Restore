@implementation AXValidationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_20);
  return (id)sharedInstance__shared_0;
}

void __37__AXValidationManager_sharedInstance__block_invoke()
{
  AXValidationManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXValidationManager);
  v1 = (void *)sharedInstance__shared_0;
  sharedInstance__shared_0 = (uint64_t)v0;

}

- (AXValidationManager)init
{
  AXValidationManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXValidationManager;
  v2 = -[AXValidationManager init](&v5, sel_init);
  if (v2)
  {
    AXSetValidationErrorLoggingFunction();
    AXSetUIAXReportSenderErrorLoggerFunction();
    if (_AXSReportValidationErrors())
    {
      AXLoadAccessibilityDebuggerIfNeeded();
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("ADTarget")), "safeValueForKey:", CFSTR("target"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager setValidationReportingServices:](v2, "setValidationReportingServices:", v3);

    }
  }
  return v2;
}

- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5
{
  -[AXValidationManager performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:](self, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", a3, a4, a5, 0);
}

- (void)performValidations:(id)a3 withPreValidationHandler:(id)a4 postValidationHandler:(id)a5 safeCategoryInstallationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[AXValidationManager installSafeCategoriesOffMainThread](self, "installSafeCategoriesOffMainThread"))
  {
    +[AXAccessQueue backgroundAccessQueue](AXAccessQueue, "backgroundAccessQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogValidations();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EBEC000, v15, OS_LOG_TYPE_INFO, "Processing safe categories off main thread", buf, 2u);
    }

  }
  else
  {
    +[AXAccessQueue mainAccessQueue](AXAccessQueue, "mainAccessQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __121__AXValidationManager_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler___block_invoke;
  v20[3] = &unk_1E28C3BF8;
  v20[4] = self;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v14, "performSynchronousWritingBlock:", v20);

}

uint64_t __121__AXValidationManager_performValidations_withPreValidationHandler_postValidationHandler_safeCategoryInstallationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BYTE *v16;
  uint64_t v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resetState");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 && !(*(unsigned int (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32)))
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "shouldPerformValidationChecks");
  objc_msgSend(*(id *)(a1 + 32), "validationTargetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v3)
      goto LABEL_17;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    AXProcessGetName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (generic symbols)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValidationTargetName:", v7);

    if (!v3)
      goto LABEL_17;
  }
  AXLogLoading();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "validationTargetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_signpost_emit_with_name_impl(&dword_18EBEC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Validations", "Target=%@", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(a1 + 32));
  AXLogLoading();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EBEC000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Validations", ", buf, 2u);
  }

  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 16))(v12, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "numberOfValidationErrors"));
LABEL_17:
  if (*(_QWORD *)(a1 + 64))
  {
    AXLogLoading();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      objc_msgSend(*(id *)(a1 + 32), "validationTargetName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_signpost_emit_with_name_impl(&dword_18EBEC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "Target=%@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    AXLogLoading();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18EBEC000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", ", buf, 2u);
    }

  }
  v16 = *(_BYTE **)(a1 + 32);
  if (v3)
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "numberOfValidationErrors");
    v16 = *(_BYTE **)(a1 + 32);
    if (!v17 && v16[10] && !v16[11] && *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "overrideProcessName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendValidationSuccessForProcessName:", v19);

      v16 = *(_BYTE **)(a1 + 32);
    }
    if (v16[8])
    {
      objc_msgSend(v16, "_printConsoleReport:isDelayed:", *(_QWORD *)(a1 + 64) != 0, 0);
      v16 = *(_BYTE **)(a1 + 32);
    }
  }
  return objc_msgSend(v16, "_clearState");
}

- (void)installSafeCategories:(id)a3 afterDelay:(double)a4 validationTargetName:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    +[AXAccessQueue mainAccessQueue](AXAccessQueue, "mainAccessQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__AXValidationManager_installSafeCategories_afterDelay_validationTargetName_overrideProcessName___block_invoke;
    v14[3] = &unk_1E28C3C20;
    v14[4] = self;
    v15 = v12;
    v16 = v11;
    v17 = v10;
    objc_msgSend(v13, "afterDelay:processWritingBlock:", v14, a4);

  }
}

uint64_t __97__AXValidationManager_installSafeCategories_afterDelay_validationTargetName_overrideProcessName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BYTE *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resetState");
  objc_msgSend(*(id *)(a1 + 32), "setOverrideProcessName:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setValidationTargetName:");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    AXProcessGetName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (generic symbols)"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValidationTargetName:", v4);

  }
  AXLogLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "validationTargetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_18EBEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", "Target=%@", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  AXLogLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18EBEC000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallSafeCategories", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfCategories:", objc_msgSend(*(id *)(a1 + 32), "numberOfCategories") + 1);
  v8 = *(_BYTE **)(a1 + 32);
  if (v8[8])
  {
    objc_msgSend(v8, "_printConsoleReport:isDelayed:", 1, 1);
    v8 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v8, "_clearState");
}

- (void)_resetState
{
  void *v3;
  id v4;

  -[AXValidationManager setShouldPerformValidationChecks:](self, "setShouldPerformValidationChecks:", AXPerformValidationChecks());
  -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", 0);
  -[AXValidationManager setNumberOfValidationWarnings:](self, "setNumberOfValidationWarnings:", 0);
  -[AXValidationManager setValidationTargetName:](self, "setValidationTargetName:", 0);
  -[AXValidationManager setForceDoNotReport:](self, "setForceDoNotReport:", 0);
  -[AXValidationManager setDebugBuild:](self, "setDebugBuild:", 0);
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", 0);
  -[AXValidationManager setShouldLogToConsole:](self, "setShouldLogToConsole:", AXShouldLogValidationErrors());
  -[AXValidationManager setShouldCrashOnError:](self, "setShouldCrashOnError:", AXShouldCrashOnValidationErrors());
  -[AXValidationManager setShouldReportToServer:](self, "setShouldReportToServer:", AXShouldReportValidationErrors());
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXValidationManager setConsoleErrorMessages:](self, "setConsoleErrorMessages:", v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXValidationManager setConsoleWarningMessages:](self, "setConsoleWarningMessages:", v4);

}

- (void)_clearState
{
  -[AXValidationManager setConsoleErrorMessages:](self, "setConsoleErrorMessages:", 0);
  -[AXValidationManager setConsoleWarningMessages:](self, "setConsoleWarningMessages:", 0);
}

- (void)_printEncodedConsoleReportForValidationRunner:(BOOL)a3 isDelayed:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidations](self, "numberOfValidations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("validationCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXValidationManager numberOfCategories](self, "numberOfCategories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("safeCategoryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("validationErrorCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("validationWarningCount"));

  -[AXValidationManager validationTargetName](self, "validationTargetName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[AXValidationManager validationTargetName](self, "validationTargetName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("validationTarget"));

  }
  AXProcessGetName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("validationProcess"));
  -[AXValidationManager overrideProcessName](self, "overrideProcessName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("validationOverrideProcess"));
  if (-[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors")
    || -[AXValidationManager numberOfValidationWarnings](self, "numberOfValidationWarnings"))
  {
    v15 = 0;
    v16 = CFSTR("failed");
  }
  else
  {
    v15 = 1;
    v16 = CFSTR("success");
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("validationResult"));
  -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("validationErrors"));

  }
  -[AXValidationManager consoleWarningMessages](self, "consoleWarningMessages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[AXValidationManager consoleWarningMessages](self, "consoleWarningMessages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("validationWarnings"));

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogValidationRunner();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v15)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138412290;
        v29 = v25;
        _os_log_impl(&dword_18EBEC000, v27, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v28, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[AXValidationManager _printEncodedConsoleReportForValidationRunner:isDelayed:].cold.1();
    }

  }
}

- (void)_printConsoleReport:(BOOL)a3 isDelayed:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint8_t v47[128];
  __int128 buf;
  Class (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v4 = a4;
  v5 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v7 = (void *)getAXSettingsClass_softClass_3;
  v45 = getAXSettingsClass_softClass_3;
  if (!getAXSettingsClass_softClass_3)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v49 = __getAXSettingsClass_block_invoke_3;
    v50 = &unk_1E28C1CB0;
    v51 = &v42;
    __getAXSettingsClass_block_invoke_3((uint64_t)&buf);
    v7 = (void *)v43[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v8, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAXValidationRunnerCollectingValidations");

  if (v10)
  {
    -[AXValidationManager _printEncodedConsoleReportForValidationRunner:isDelayed:](self, "_printEncodedConsoleReportForValidationRunner:isDelayed:", v5, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v4)
      objc_msgSend(v11, "appendString:", CFSTR("(DELAYED) "));
    if (-[AXValidationManager isDebugBuild](self, "isDebugBuild"))
      objc_msgSend(v12, "appendString:", CFSTR("(Build as DEBUG) "));
    if (v5)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = -[AXValidationManager numberOfValidations](self, "numberOfValidations");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXValidationManager numberOfCategories](self, "numberOfCategories"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("validating (%d) items and installing (%@) AX Safe Categories on "), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v16);

    }
    else
    {
      objc_msgSend(v12, "appendString:", CFSTR("validating "));
    }
    -[AXValidationManager validationTargetName](self, "validationTargetName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v17);

    AXProcessGetName();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", In process: %@"), v18);

    if (-[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n********************************************************************\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendFormat:", CFSTR("* AX: Failed %@. %lu errors:\n"), v12, -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors"));
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v39;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(v19, "appendFormat:", CFSTR("*\t%@\n"), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23++));
          }
          while (v21 != v23);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v21);
      }

      objc_msgSend(v19, "appendString:", CFSTR("********************************************************************\n"));
      AXLogValidations();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[AXValidationManager _printConsoleReport:isDelayed:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("****************** Finished %@. Success! *****************"), v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogValidations();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_18EBEC000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }

    if (-[AXValidationManager numberOfValidationWarnings](self, "numberOfValidationWarnings"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n********************************************************************\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[AXValidationManager numberOfValidationWarnings](self, "numberOfValidationWarnings");
      v27 = -[AXValidationManager numberOfValidationWarnings](self, "numberOfValidationWarnings");
      v28 = "s";
      if (v27 == 1)
        v28 = "";
      objc_msgSend(v25, "appendFormat:", CFSTR("* AX: %lu warning%s generated while %@:\n"), v26, v28, v12);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[AXValidationManager consoleWarningMessages](self, "consoleWarningMessages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v35;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v35 != v31)
              objc_enumerationMutation(v29);
            objc_msgSend(v25, "appendFormat:", CFSTR("* %@\n"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v32++));
          }
          while (v30 != v32);
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        }
        while (v30);
      }

      objc_msgSend(v25, "appendString:", CFSTR("********************************************************************\n"));
      AXLogValidations();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_18EBEC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
}

- (BOOL)validateClass:(id)a3
{
  return -[AXValidationManager client:validateClass:](self, "client:validateClass:", AXValidationClientAccessibility, a3);
}

- (BOOL)client:(id)a3 validateClass:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  const char *Name;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v8 = _AXClassFromStringWithFallback(v7);
  Name = class_getName(v8);
  v10 = strcmp(Name, "nil");
  if (!v10)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Class Not Present: %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v7, v11, v13);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return v10 != 0;
}

- (BOOL)validateClass:(id)a3 isKindOfClass:(id)a4
{
  return -[AXValidationManager client:validateClass:isKindOfClass:](self, "client:validateClass:isKindOfClass:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 isKindOfClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *Superclass;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Superclass = _AXClassFromStringWithFallback(v9);
  v12 = _AXClassFromStringWithFallback(v10);
  while (1)
  {
    v13 = Superclass;
    if (!Superclass)
      break;
    Superclass = class_getSuperclass(Superclass);
    if (Superclass == v12)
    {
      -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
      goto LABEL_12;
    }
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ is not a kind of %@"), v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldLogToConsole)
  {
    -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

  }
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    -[AXValidationManager overrideProcessName](self, "overrideProcessName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXValidationManager sendValidateExceptionForClass:isKindOfClass:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:isKindOfClass:errorMessage:overrideProcessName:", v9, v10, v14, v16);

  }
  if (self->_shouldCrashOnError)
    abort();

LABEL_12:
  return v13 != 0;
}

- (BOOL)validateClass:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5
{
  return -[AXValidationManager client:validateClass:hasSwiftField:withSwiftType:](self, "client:validateClass:hasSwiftField:withSwiftType:", AXValidationClientAccessibility, a3, a4, a5);
}

- (BOOL)validateClass:(id)a3 hasSwiftFieldOfAnyClass:(id)a4
{
  return -[AXValidationManager client:validateClass:hasSwiftFieldOfAnyClass:](self, "client:validateClass:hasSwiftFieldOfAnyClass:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)validateSwiftStruct:(id)a3
{
  return -[AXValidationManager client:validateSwiftStruct:](self, "client:validateSwiftStruct:", AXValidationClientAccessibility, a3);
}

- (BOOL)validateSwiftStruct:(id)a3 hasSize:(int64_t)a4
{
  return -[AXValidationManager client:validateSwiftStruct:hasSize:](self, "client:validateSwiftStruct:hasSize:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)validateSwiftStruct:(id)a3 hasSwiftField:(id)a4 withSwiftType:(const char *)a5
{
  return -[AXValidationManager client:validateSwiftStruct:hasSwiftField:withSwiftType:](self, "client:validateSwiftStruct:hasSwiftField:withSwiftType:", AXValidationClientAccessibility, a3, a4, a5);
}

- (BOOL)validateSwiftStruct:(id)a3 hasSwiftFieldOfAnyClass:(id)a4
{
  return -[AXValidationManager client:validateSwiftStruct:hasSwiftFieldOfAnyClass:](self, "client:validateSwiftStruct:hasSwiftFieldOfAnyClass:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)validateSwiftEnum:(id)a3
{
  return -[AXValidationManager client:validateSwiftEnum:](self, "client:validateSwiftEnum:", AXValidationClientAccessibility, a3);
}

- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4
{
  return -[AXValidationManager client:validateSwiftEnum:hasCase:](self, "client:validateSwiftEnum:hasCase:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)validateSwiftEnum:(id)a3 hasCase:(id)a4 withSwiftType:(const char *)a5
{
  return -[AXValidationManager client:validateSwiftEnum:hasCase:withSwiftType:](self, "client:validateSwiftEnum:hasCase:withSwiftType:", AXValidationClientAccessibility, a3, a4, a5);
}

- (BOOL)validateSwiftEnum:(id)a3 hasCaseOfAnyClass:(id)a4
{
  return -[AXValidationManager client:validateSwiftEnum:hasCaseOfAnyClass:](self, "client:validateSwiftEnum:hasCaseOfAnyClass:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6
{
  return -[AXValidationManager _client:validateClass:hasSwiftField:withTypeString:isAnyClass:](self, "_client:validateClass:hasSwiftField:withTypeString:isAnyClass:", a3, a4, a5, a6, 0);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasSwiftFieldOfAnyClass:(id)a5
{
  return -[AXValidationManager _client:validateClass:hasSwiftField:withTypeString:isAnyClass:](self, "_client:validateClass:hasSwiftField:withTypeString:isAnyClass:", a3, a4, a5, 0, 1);
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v8 = _AXSwiftValidateStruct((uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Struct Not Present: %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v7, v9, v11);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return v8;
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSize:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_AXSwiftValidateStruct((uint64_t)v9) & 1) == 0)
  {
    objc_msgSend(v10, "addObject:", CFSTR("Swift field doesn't exist"));
    if (!_AXSwiftValidateStructHasSize((uint64_t)v9, a5))
      objc_msgSend(v10, "addObject:", CFSTR("Swift field isn't class type"));
  }
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v12 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v8;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: Swift enum %@ doesn't match size: %@"), v8, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v14);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v9, v14, v21);

    }
    v8 = v23;
    if (self->_shouldCrashOnError)
      abort();

  }
  return v11 == 0;
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftField:(id)a5 withSwiftType:(const char *)a6
{
  return -[AXValidationManager _client:validateStruct:hasSwiftField:withTypeString:isAnyClass:](self, "_client:validateStruct:hasSwiftField:withTypeString:isAnyClass:", a3, a4, a5, a6, 0);
}

- (BOOL)client:(id)a3 validateSwiftStruct:(id)a4 hasSwiftFieldOfAnyClass:(id)a5
{
  return -[AXValidationManager _client:validateStruct:hasSwiftField:withTypeString:isAnyClass:](self, "_client:validateStruct:hasSwiftField:withTypeString:isAnyClass:", a3, a4, a5, 0, 1);
}

- (BOOL)_client:(id)a3 validateStruct:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a3;
  objc_msgSend(v14, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_AXSwiftValidateStructHasField((uint64_t)v12, (uint64_t)v13) & 1) == 0)
  {
    v17 = CFSTR("Swift field doesn't exist");
    goto LABEL_6;
  }
  if (v7)
  {
    if ((_AXSwiftValidateStructHasFieldOfAnyClass((uint64_t)v12, (uint64_t)v13) & 1) == 0)
    {
      v17 = CFSTR("Swift field isn't class type");
LABEL_6:
      objc_msgSend(v16, "addObject:", v17);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_AXSwiftValidateStructHasFieldWithTypeString((uint64_t)v12, (uint64_t)v13, (uint64_t)v18) & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      _AXSwiftValidateStructGetFieldTypeString((uint64_t)v12, (uint64_t)v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Swift field doesn't match: (%@) expected: (%@)"), v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);

    }
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v22 = -[AXValidationManager _client:validateType:hasSwiftField:handleSwiftValidationProblems:](self, "_client:validateType:hasSwiftField:handleSwiftValidationProblems:", v15, v12, v13, v16);

  return v22;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v8 = _AXSwiftValidateEnum((uint64_t)v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enum Not Present: %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v7, v9, v11);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return v8;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_AXSwiftValidateEnumHasCase((uint64_t)v8, (uint64_t)v9) & 1) == 0)
    objc_msgSend(v12, "addObject:", CFSTR("Swift case doesn't exist"));
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v13 = -[AXValidationManager _client:validateType:hasSwiftField:handleSwiftValidationProblems:](self, "_client:validateType:hasSwiftField:handleSwiftValidationProblems:", v11, v8, v9, v12);

  return v13;
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withSwiftType:(const char *)a6
{
  return -[AXValidationManager _client:validateSwiftEnum:hasCase:withTypeString:isAnyClass:](self, "_client:validateSwiftEnum:hasCase:withTypeString:isAnyClass:", a3, a4, a5, a6, 0);
}

- (BOOL)client:(id)a3 validateSwiftEnum:(id)a4 hasCaseOfAnyClass:(id)a5
{
  return -[AXValidationManager _client:validateSwiftEnum:hasCase:withTypeString:isAnyClass:](self, "_client:validateSwiftEnum:hasCase:withTypeString:isAnyClass:", a3, a4, a5, 0, 1);
}

- (BOOL)_client:(id)a3 validateSwiftEnum:(id)a4 hasCase:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a3;
  objc_msgSend(v14, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_AXSwiftValidateEnumHasCase((uint64_t)v12, (uint64_t)v13) & 1) == 0)
  {
    v17 = CFSTR("Swift case doesn't exist");
    goto LABEL_6;
  }
  if (v7)
  {
    if ((_AXSwiftValidateEnumHasCaseOfAnyClass((uint64_t)v12, (uint64_t)v13) & 1) == 0)
    {
      v17 = CFSTR("Swift case isn't class type");
LABEL_6:
      objc_msgSend(v16, "addObject:", v17);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_AXSwiftValidateEnumHasCaseWithTypeString((uint64_t)v12, (uint64_t)v13, (uint64_t)v18) & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      _AXSwiftValidateEnumGetCaseTypeString((uint64_t)v12, (uint64_t)v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Swift case doesn't match: (%@) expected: (%@)"), v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);

    }
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v22 = -[AXValidationManager _client:validateType:hasSwiftField:handleSwiftValidationProblems:](self, "_client:validateType:hasSwiftField:handleSwiftValidationProblems:", v15, v12, v13, v16);

  return v22;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasSwiftField:(id)a5 withTypeString:(const char *)a6 isAnyClass:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  const __CFString *v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a3;
  objc_msgSend(v14, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _AXClassFromStringWithFallback(v12);
  if (!v17)
  {
    v19 = CFSTR("Class doesn't exist");
    goto LABEL_8;
  }
  v18 = (uint64_t)v17;
  if ((_AXSwiftValidateClassHasField((uint64_t)v17, (uint64_t)v13) & 1) == 0)
  {
    v19 = CFSTR("Swift field doesn't exist");
    goto LABEL_8;
  }
  if (v7)
  {
    if ((_AXSwiftValidateClassHasFieldOfAnyClass(v18, (uint64_t)v13) & 1) == 0)
    {
      v19 = CFSTR("Swift field isn't class type");
LABEL_8:
      objc_msgSend(v16, "addObject:", v19);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_AXSwiftValidateClassHasFieldWithTypeString() & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      _AXSwiftValidateClassGetFieldTypeString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Swift field doesn't match: (%@) expected: (%@)"), v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v25);

    }
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v20 = -[AXValidationManager _client:validateType:hasSwiftField:handleSwiftValidationProblems:](self, "_client:validateType:hasSwiftField:handleSwiftValidationProblems:", v15, v12, v13, v16);

  return v20;
}

- (BOOL)_client:(id)a3 validateType:(id)a4 hasSwiftField:(id)a5 handleSwiftValidationProblems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v24 = v10;
    v25 = v11;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@: Swift field: (%@) on type: %@."), v10, v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v15, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v15);

    }
    v11 = v25;
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:", v25, v12, v15, v22);

    }
    if (self->_shouldCrashOnError)
      abort();

    v10 = v24;
  }

  return v14 == 0;
}

- (BOOL)validateClass:(id)a3 hasInstanceVariable:(id)a4 withType:(const char *)a5
{
  return -[AXValidationManager client:validateClass:hasInstanceVariable:withType:](self, "client:validateClass:hasInstanceVariable:withType:", AXValidationClientAccessibility, a3, a4, a5);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceVariable:(id)a5 withType:(const char *)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  objc_ivar *InstanceVariable;
  const char *TypeEncoding;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _AXClassFromStringWithFallback(v11);
  v14 = objc_retainAutorelease(v12);
  InstanceVariable = class_getInstanceVariable(v13, (const char *)objc_msgSend(v14, "UTF8String"));
  TypeEncoding = ivar_getTypeEncoding(InstanceVariable);
  if (!a6)
  {
    v19 = 0;
    goto LABEL_23;
  }
  v17 = TypeEncoding;
  if (strlen(a6) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("NSInteger")) & 1) != 0)
    {
      a6 = "q";
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("NSUInteger")) & 1) != 0)
    {
      a6 = "Q";
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("int")) & 1) != 0)
    {
      a6 = "i";
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("BOOL")) & 1) != 0)
    {
      a6 = "B";
    }
    else if (objc_msgSend(v18, "isEqualToString:", CFSTR("CGFloat")))
    {
      a6 = "d";
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@\"%@\"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
  a6 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v17 && !strcmp(v17, "B") && objc_msgSend((id)a6, "isEqualToString:", CFSTR("c")))
  {

    a6 = CFSTR("B");
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  if (v17)
  {
    v19 = objc_retainAutorelease(v21);
    if (strcmp(v17, (const char *)objc_msgSend(v19, "UTF8String")))
    {
      v22 = objc_retainAutorelease((id)a6);
      if (!strcmp(v17, (const char *)objc_msgSend(v22, "UTF8String")))
      {
        v23 = 1;
        a6 = v22;
        goto LABEL_32;
      }
      -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ : Ivar is not the right type: %@ [AX: %@ MAINLINE: %s]"), v10, v11, v14, v19, v17);
      goto LABEL_25;
    }
LABEL_23:
    v23 = 1;
    goto LABEL_32;
  }
  -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ : Ivar does not exist: %@"), v10, v11, v14, v28, v29);
LABEL_25:
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldLogToConsole)
  {
    -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v24);

  }
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    -[AXValidationManager overrideProcessName](self, "overrideProcessName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXValidationManager sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:", v11, v14, v24, v26);

  }
  if (self->_shouldCrashOnError)
    abort();

  v23 = 0;
  v19 = v21;
LABEL_32:

  return v23;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  const char *v15;
  Method InstanceMethod;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _AXClassFromStringWithFallback(v11);
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E28C88D8);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();

  v15 = NSSelectorFromString(v14);
  if ((_DWORD)v6)
    InstanceMethod = class_getInstanceMethod(v13, v15);
  else
    InstanceMethod = class_getClassMethod(v13, v15);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__AXValidationManager__client_validateClass_hasMethod_methodType___block_invoke;
  v23[3] = &unk_1E28C3C48;
  v23[4] = &v24;
  v23[5] = InstanceMethod;
  -[AXValidationManager _iterateMethodsOfType:onClass:block:](self, "_iterateMethodsOfType:onClass:block:", v6, v13, v23);
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v17 = *((unsigned __int8 *)v25 + 24);
  if (!*((_BYTE *)v25 + 24))
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v18 = CFSTR("Instance");
    if (!(_DWORD)v6)
      v18 = CFSTR("Class");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ %@ method not present: %@"), v10, v11, v18, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v19);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:", v11, v14, v19, v21);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  _Block_object_dispose(&v24, 8);

  return v17 != 0;
}

uint64_t __66__AXValidationManager__client_validateClass_hasMethod_methodType___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 40) == a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasMethod:(id)a5 methodType:(int)a6 returnType:(id)a7 arguments:(id)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  objc_class *v17;
  const char *v18;
  Method InstanceMethod;
  objc_method *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  id v41;
  id v42;
  NSString *aSelectorName;
  id v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  objc_method *v52;
  _QWORD v53[6];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v44 = a4;
  v41 = a7;
  v42 = a8;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  v15 = a5;
  objc_msgSend(v14, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _AXClassFromStringWithFallback(v44);
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E28C88D8);
  aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue();

  v18 = NSSelectorFromString(aSelectorName);
  if (a6)
    InstanceMethod = class_getInstanceMethod(v17, v18);
  else
    InstanceMethod = class_getClassMethod(v17, v18);
  v20 = InstanceMethod;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke;
  v53[3] = &unk_1E28C3C48;
  v53[4] = &v54;
  v53[5] = InstanceMethod;
  -[AXValidationManager _iterateMethodsOfType:onClass:block:](self, "_iterateMethodsOfType:onClass:block:", a6, v17, v53);
  if (*((_BYTE *)v55 + 24))
  {
    v22 = method_copyReturnType(v20);
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqualToString:", v41) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect return type: expected:%@ actual:%@"), v41, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v24);

      }
      free(v22);

    }
    else
    {
      objc_msgSend(v16, "addObject:", CFSTR("Unable to determine return type."));
    }
    v25 = method_getNumberOfArguments(v20) - 2;
    if (v25 != objc_msgSend(v42, "count"))
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Incorrect argument count: expected:%@ actual:%@"), v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v29);

    }
    v50[0] = v21;
    v50[1] = 3221225472;
    v50[2] = __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke_2;
    v50[3] = &unk_1E28C3C70;
    v52 = v20;
    v51 = v16;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v50);

  }
  else
  {
    objc_msgSend(v16, "addObject:", CFSTR("Method does not exist"));
  }
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v30 = objc_msgSend(v16, "count");
  if (v30)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v31 = CFSTR("Instance");
    if (!a6)
      v31 = CFSTR("Class");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@: %@ method: (%@) on class: %@."), v13, v31, aSelectorName, v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = v16;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v47 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(v32, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v35);
    }

    v13 = v33;
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v32);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
        -[AXValidationManager sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:", v44, aSelectorName, v32, v39);
      else
        -[AXValidationManager sendValidateExceptionForClass:hasClassMethod:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:hasClassMethod:errorMessage:overrideProcessName:", v44, aSelectorName, v32, v39);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  _Block_object_dispose(&v54, 8);

  return v30 == 0;
}

uint64_t __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 40) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __87__AXValidationManager__client_validateClass_hasMethod_methodType_returnType_arguments___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  char *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = method_copyArgumentType(*(Method *)(a1 + 40), (int)a3 + 2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v15) & 1) == 0)
    {
      v8 = *(void **)(a1 + 32);
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Incorrect argument at position:%@\n expected:%@\n actual:%@"), v10, v15, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
    free(v6);
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Actual arg not found at position:%@ expected:%@"), v7, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
}

- (BOOL)validateClass:(id)a3 hasClassMethod:(id)a4 withFullSignature:(const char *)a5
{
  uint64_t v6;

  return -[AXValidationManager _client:validateClass:hasClassMethod:withFullSignature:argList:](self, "_client:validateClass:hasClassMethod:withFullSignature:argList:", AXValidationClientAccessibility, a3, a4, a5, &v6);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6
{
  uint64_t v7;

  return -[AXValidationManager _client:validateClass:hasClassMethod:withFullSignature:argList:](self, "_client:validateClass:hasClassMethod:withFullSignature:argList:", a3, a4, a5, a6, &v7);
}

- (BOOL)_client:(id)a3 validateClass:(id)a4 hasClassMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  BOOL v19;
  char *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v21 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v17 = v21;
    v21 += 8;
    if (!*(_QWORD *)v17)
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  v19 = -[AXValidationManager _client:validateClass:hasMethod:methodType:returnType:arguments:](self, "_client:validateClass:hasMethod:methodType:returnType:arguments:", v12, v13, v14, 0, v15, v16);

  return v19;
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6 argList:(char *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  BOOL v19;
  char *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v21 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v17 = v21;
    v21 += 8;
    if (!*(_QWORD *)v17)
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  v19 = -[AXValidationManager _client:validateClass:hasMethod:methodType:returnType:arguments:](self, "_client:validateClass:hasMethod:methodType:returnType:arguments:", v12, v13, v14, 1, v15, v16);

  return v19;
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasInstanceMethod:(id)a5 withFullSignature:(const char *)a6
{
  uint64_t v7;

  return -[AXValidationManager client:validateClass:hasInstanceMethod:withFullSignature:argList:](self, "client:validateClass:hasInstanceMethod:withFullSignature:argList:", a3, a4, a5, a6, &v7);
}

- (BOOL)validateClass:(id)a3 hasInstanceMethod:(id)a4 withFullSignature:(const char *)a5
{
  uint64_t v6;

  return -[AXValidationManager client:validateClass:hasInstanceMethod:withFullSignature:argList:](self, "client:validateClass:hasInstanceMethod:withFullSignature:argList:", AXValidationClientAccessibility, a3, a4, a5, &v6);
}

- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 withType:(const char *)a5
{
  return -[AXValidationManager client:validateClass:hasProperty:customGetter:customSetter:withType:](self, "client:validateClass:hasProperty:customGetter:customSetter:withType:", AXValidationClientAccessibility, a3, a4, 0, 0, a5);
}

- (BOOL)validateClass:(id)a3 hasProperty:(id)a4 customGetter:(id)a5 customSetter:(id)a6 withType:(const char *)a7
{
  return -[AXValidationManager client:validateClass:hasProperty:customGetter:customSetter:withType:](self, "client:validateClass:hasProperty:customGetter:customSetter:withType:", AXValidationClientAccessibility, a3, a4, a5, a6, a7);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 withType:(const char *)a6
{
  return -[AXValidationManager client:validateClass:hasProperty:customGetter:customSetter:withType:](self, "client:validateClass:hasProperty:customGetter:customSetter:withType:", a3, a4, a5, 0, 0, a6);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 hasProperty:(id)a5 customGetter:(id)a6 customSetter:(id)a7 withType:(const char *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(void *, void *);
  objc_class *v22;
  id v23;
  objc_property *Property;
  objc_property *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  BOOL v38;
  _QWORD aBlock[5];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AXValidationManager_client_validateClass_hasProperty_customGetter_customSetter_withType___block_invoke;
  aBlock[3] = &unk_1E28C3C98;
  aBlock[4] = self;
  v19 = v15;
  v41 = v19;
  v20 = v16;
  v42 = v20;
  v43 = &v44;
  v21 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v22 = _AXClassFromStringWithFallback(v19);
  v23 = objc_retainAutorelease(v20);
  Property = class_getProperty(v22, (const char *)objc_msgSend(v23, "UTF8String"));
  v25 = Property;
  if (Property)
  {
    if (a8)
    {
      v26 = property_copyAttributeValue(Property, "T");
      v27 = v26;
      if (v26)
      {
        if (strcmp(v26, a8) && (*v27 != 64 || *a8 != 64))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) had wrong type:(%s) expected: (%s)"), v14, v19, v23, v27, a8);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v21[2](v21, v35);

LABEL_33:
          free(v27);
          goto LABEL_34;
        }
        v28 = property_copyAttributeValue(v25, "G");
        v29 = property_copyAttributeValue(v25, "S");
        if (!v17 && v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) has unexpected custom getter: (%s)"), v14, v19, v23, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v21[2](v21, v30);

        }
        if (!v18 && v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) has unexpected custom setter: (%s)"), v14, v19, v23, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v21[2](v21, v31);

        }
        if (v17)
        {
          if (v28)
          {
            v32 = objc_retainAutorelease(v17);
            if (!strcmp(v28, (const char *)objc_msgSend(v32, "UTF8String")))
              goto LABEL_23;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) has unexpected custom getter: (%s) expected:(%@)"), v14, v19, v23, v28, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v21[2](v21, v33);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) does not have custom getter: (%@)"), v14, v19, v23, v17);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v21[2](v21, v33);
          }

        }
LABEL_23:
        if (v18)
        {
          if (!v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) does not have custom setter: (%@)"), v14, v19, v23, v18);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v21[2](v21, v37);
            goto LABEL_28;
          }
          v36 = objc_retainAutorelease(v18);
          if (strcmp(v29, (const char *)objc_msgSend(v36, "UTF8String")))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property: (%@) has unexpected custom setter: (%s) expected:(%@)"), v14, v19, v23, v29, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v21[2](v21, v37);
LABEL_28:

          }
        }
        if (v28)
          free(v28);
        if (v29)
          free(v29);
        goto LABEL_33;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property missing type information: %@"), v14, v19, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v34);
  }
  else
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Property not present: %@"), v14, v19, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v34);
  }

LABEL_34:
  v38 = *((_BYTE *)v45 + 24) == 0;

  _Block_object_dispose(&v44, 8);
  return v38;
}

void __91__AXValidationManager_client_validateClass_hasProperty_customGetter_customSetter_withType___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfValidationErrors:", objc_msgSend(*(id *)(a1 + 32), "numberOfValidationErrors") + 1);
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[8])
  {
    objc_msgSend(*(id *)(a1 + 32), "consoleErrorMessages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    v3 = *(_BYTE **)(a1 + 32);
  }
  if (v3[10] && !v3[11])
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "overrideProcessName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendValidateExceptionForClass:hasProperty:errorMessage:overrideProcessName:", v5, v6, v8, v7);

    v3 = *(_BYTE **)(a1 + 32);
  }
  if (v3[9])
    abort();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

- (BOOL)validateClass:(id)a3 conformsToProtocol:(id)a4
{
  return -[AXValidationManager client:validateClass:conformsToProtocol:](self, "client:validateClass:conformsToProtocol:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateClass:(id)a4 conformsToProtocol:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  objc_class *v11;
  Protocol *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = (NSString *)a5;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v11 = _AXClassFromStringWithFallback(v9);
  NSProtocolFromString(v10);
  v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v13 = class_conformsToProtocol(v11, v12);

  if (!v13)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Class:%@ Does not conform to Protocol:%@"), v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForClass:conformsToProtocol:errorMessage:overrideProcessName:](self, "sendValidateExceptionForClass:conformsToProtocol:errorMessage:overrideProcessName:", v9, v10, v14, v16);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return v13;
}

- (BOOL)validateProtocol:(id)a3 conformsToProtocol:(id)a4
{
  return -[AXValidationManager client:validateProtocol:conformsToProtocol:](self, "client:validateProtocol:conformsToProtocol:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 conformsToProtocol:(id)a5
{
  id v8;
  NSString *v9;
  NSString *v10;
  Protocol *v11;
  Protocol *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  NSProtocolFromString(v9);
  v11 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v10);
  v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  v13 = protocol_conformsToProtocol(v11, v12);
  if (!v13)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Protocol does not conform to protocol: %@"), v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForProtocol:conformsToProtocol:errorMessage:overrideProcessName:](self, "sendValidateExceptionForProtocol:conformsToProtocol:errorMessage:overrideProcessName:", v9, v10, v14, v16);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return v13;
}

- (BOOL)validateProtocol:(id)a3 hasMethod:(id)a4 isInstanceMethod:(BOOL)a5 isRequired:(BOOL)a6
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", AXValidationClientAccessibility, a3, a4, a5, a6);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasMethod:(id)a5 isInstanceMethod:(BOOL)a6 isRequired:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  NSString *v13;
  id v14;
  Protocol *v15;
  NSString *v16;
  const char *v17;
  SEL name;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = (NSString *)a4;
  v14 = a5;
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  NSProtocolFromString(v13);
  v15 = (Protocol *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E28C88D8);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  v17 = NSSelectorFromString(v16);
  name = protocol_getMethodDescription(v15, v17, v7, v8).name;
  if (!name)
  {
    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v19 = CFSTR("optional");
    if (v7)
      v19 = CFSTR("required");
    v20 = CFSTR("class");
    if (v8)
      v20 = CFSTR("instance");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ Protocol %@ %@ method not present: %@"), v12, v13, v19, v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v21);

    }
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXValidationManager sendValidateExceptionForProtocol:hasMethod:errorMessage:overrideProcessName:](self, "sendValidateExceptionForProtocol:hasMethod:errorMessage:overrideProcessName:", v13, v16, v21, v23);

    }
    if (self->_shouldCrashOnError)
      abort();

  }
  return name != 0;
}

- (BOOL)validateProtocol:(id)a3 hasOptionalInstanceMethod:(id)a4
{
  return -[AXValidationManager client:validateProtocol:hasOptionalInstanceMethod:](self, "client:validateProtocol:hasOptionalInstanceMethod:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalInstanceMethod:(id)a5
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", a3, a4, a5, 1, 0);
}

- (BOOL)validateProtocol:(id)a3 hasRequiredInstanceMethod:(id)a4
{
  return -[AXValidationManager client:validateProtocol:hasRequiredInstanceMethod:](self, "client:validateProtocol:hasRequiredInstanceMethod:", AXValidationClientAccessibility, a3, a4);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredInstanceMethod:(id)a5
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", a3, a4, a5, 1, 1);
}

- (BOOL)validateProtocol:(id)a3 hasOptionalClassMethod:(id)a4
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", AXValidationClientAccessibility, a3, a4, 0, 0);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasOptionalClassMethod:(id)a5
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", a3, a4, a5, 0, 0);
}

- (BOOL)validateProtocol:(id)a3 hasRequiredClassMethod:(id)a4
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", AXValidationClientAccessibility, a3, a4, 0, 1);
}

- (BOOL)client:(id)a3 validateProtocol:(id)a4 hasRequiredClassMethod:(id)a5
{
  return -[AXValidationManager client:validateProtocol:hasMethod:isInstanceMethod:isRequired:](self, "client:validateProtocol:hasMethod:isInstanceMethod:isRequired:", a3, a4, a5, 0, 1);
}

- (void)_iterateMethodsOfType:(int)a3 onClass:(Class)Class block:(id)a5
{
  void (**v7)(id, Method, _BYTE *);
  Method *v8;
  Method *v9;
  unint64_t v10;
  char v11;
  unsigned int outCount;

  v7 = (void (**)(id, Method, _BYTE *))a5;
  if (!a3)
    Class = object_getClass(Class);
  outCount = 0;
  v8 = class_copyMethodList(Class, &outCount);
  if (v8 && outCount)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    do
    {
      v7[2](v7, v9[v10], &v11);
      if (v11)
        break;
      ++v10;
    }
    while (v10 < outCount);
    free(v9);
  }

}

- (id)_nameForMethod:(objc_method *)a3
{
  const char *Name;
  const char *v4;
  __CFString *v5;

  if (a3)
  {
    Name = method_getName(a3);
    if (Name && (v4 = sel_getName(Name)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("(null)");
    }
  }
  else
  {
    v5 = CFSTR("(null)");
  }
  return v5;
}

- (void)_generateWarningsForPrefixedMethodNames:(id)a3 client:(id)a4 methodType:(int)a5 methodName:(id)a6 className:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "count"))
  {
    -[AXValidationManager setNumberOfValidationWarnings:](self, "setNumberOfValidationWarnings:", -[AXValidationManager numberOfValidationWarnings](self, "numberOfValidationWarnings") + 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("Instance");
    if (!a5)
      v17 = CFSTR("Class");
    v26 = v15;
    v27 = v14;
    v28 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@ method: (%@) on class: %@ has the following more specific variants:"), v13, v17, v14, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
    }

    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleWarningMessages](self, "consoleWarningMessages");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObjectsFromArray:", v16);

    }
    v14 = v27;
    v13 = v28;
    v15 = v26;
  }

}

- (void)_generateWarningsOnSafeCategoryClass:(Class)a3
{
  Class Superclass;
  objc_class *Class;
  Method *v7;
  Method *v8;
  unsigned int v9;
  unsigned int outCount;

  Superclass = class_getSuperclass(a3);
  Class = object_getClass(Superclass);
  outCount = 0;
  v7 = class_copyMethodList(Class, &outCount);
  -[AXValidationManager _generateWarningsForMethodType:onClass:superclassMethods:numberOfSuperclassMethods:](self, "_generateWarningsForMethodType:onClass:superclassMethods:numberOfSuperclassMethods:", 0, a3, v7, outCount);
  if (v7 && outCount)
    free(v7);
  v9 = 0;
  v8 = class_copyMethodList(Superclass, &v9);
  -[AXValidationManager _generateWarningsForMethodType:onClass:superclassMethods:numberOfSuperclassMethods:](self, "_generateWarningsForMethodType:onClass:superclassMethods:numberOfSuperclassMethods:", 1, a3, v8, v9);
  if (v8)
  {
    if (v9)
      free(v8);
  }
}

- (void)_generateWarningsForMethodType:(int)a3 onClass:(Class)a4 superclassMethods:(objc_method *)a5 numberOfSuperclassMethods:(unsigned int)a6
{
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  objc_method **v16;
  unsigned int v17;
  int v18;

  if (a5)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", class_getName(a4));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke_2;
      v13[3] = &unk_1E28C3D00;
      v15 = &__block_literal_global_190;
      v16 = a5;
      v17 = a6;
      v18 = a3;
      v13[4] = self;
      v14 = v11;
      v12 = v11;
      -[AXValidationManager _iterateMethodsOfType:onClass:block:](self, "_iterateMethodsOfType:onClass:block:", 0, a4, v13);

    }
  }
}

uint64_t __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v4, "length");
  v8 = objc_msgSend(v5, "hasPrefix:", v4);
  v9 = 0;
  if (v6 > v7 && v8)
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v4, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasSuffix:", CFSTR(":")))
      v9 = objc_msgSend(v10, "containsString:", CFSTR(":"));
    else
      v9 = 0;

  }
  return v9;
}

void __106__AXValidationManager__generateWarningsForMethodType_onClass_superclassMethods_numberOfSuperclassMethods___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_nameForMethod:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(a1 + 64))
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_nameForMethod:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 64));
  }
  objc_msgSend(*(id *)(a1 + 32), "_generateWarningsForPrefixedMethodNames:client:methodType:methodName:className:", v3, AXValidationClientAccessibility, *(unsigned int *)(a1 + 68), v6, *(_QWORD *)(a1 + 40));

}

- (BOOL)installSafeCategory:(id)a3
{
  return -[AXValidationManager installSafeCategory:canInteractWithTargetClass:](self, "installSafeCategory:canInteractWithTargetClass:", a3, 1);
}

- (BOOL)installSafeCategory:(id)a3 canInteractWithTargetClass:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  void *v7;
  Class v8;
  NSString *v9;
  objc_class *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v4 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void *)MEMORY[0x193FF9EC8]();
  v8 = NSClassFromString(v6);
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  if (v8)
  {
    v46 = v7;
    if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = 0;
      v10 = 0;
      v18 = 0;
      v19 = 0;
      v9 = 0;
      goto LABEL_27;
    }
    -[objc_class performSelector:](v8, "performSelector:", sel_safeCategoryTargetClassName);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);
    if (v10)
    {
      if (-[AXValidationManager shouldPerformValidationChecks](self, "shouldPerformValidationChecks"))
      {
        AXLogLoading();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v11))
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("Class=%@"), v13);
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v14;
          _os_signpost_emit_with_name_impl(&dword_18EBEC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Validations", "Target=%@", buf, 0xCu);

        }
        -[objc_class performSelector:](v8, "performSelector:", sel__installSafeCategoryValidationMethod);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[objc_class axTrampolineForClass:](v10, "axTrampolineForClass:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_accessibilityPerformValidations:", self);

          }
          else
          {
            -[objc_class _accessibilityPerformValidations:](v10, "_accessibilityPerformValidations:", self);
          }
        }
        AXLogLoading();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18EBEC000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Validations", ", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundlePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "hasSuffix:", CFSTR("axbundle"));

        if ((v26 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v10);
          v27 = objc_claimAutoreleasedReturnValue();
          +[AXCodeLoader defaultLoader](AXCodeLoader, "defaultLoader");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)v27;
          objc_msgSend(v28, "codeItemForBundle:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "associatedAccessibilityCodeItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v24;
          v42 = v18;
          v43 = v29;
          if (v18)
          {
            objc_msgSend(v24, "bundlePath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "path");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByDeletingLastPathComponent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "isEqualToString:", v32);

            if ((v33 & 1) == 0)
            {
              objc_msgSend(v29, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[NSString hasSuffix:](v6, "hasSuffix:", v34);

              if (!v35)
              {
                v36 = v15;
                objc_msgSend(v45, "bundlePath");
                v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "bundlePath");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                AXLogValidations();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v48 = v6;
                  v49 = 2112;
                  v50 = v45;
                  v51 = 2112;
                  v52 = v44;
                  _os_log_error_impl(&dword_18EBEC000, v41, OS_LOG_TYPE_ERROR, "AX Safe category class:%@ in wrong AX bundle '%@' should be with '%@'!", buf, 0x20u);
                }

                -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AX Safe category class:%@ in wrong AX bundle '%@' should be with '%@'"), v6, v45, v44, v42, v29);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 0;
                v19 = 1;
                goto LABEL_49;
              }
            }
            v36 = v15;
            v19 = 0;
            v18 = 0;
          }
          else
          {
            v36 = v15;
            v19 = 0;
          }
          v10 = 0;
          v21 = 0;
          v40 = 1;
LABEL_49:

          if (!v40)
            goto LABEL_32;
          v17 = v21;
LABEL_27:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[objc_class performSelector:](v8, "performSelector:", sel__initializeSafeCategoryFromValidationManager);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not an accessibility class!"), v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v22 = 1;
            goto LABEL_34;
          }
          -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
LABEL_32:
          v22 = 0;
LABEL_34:
          v7 = v46;
          goto LABEL_35;
        }

      }
      v17 = 0;
      v10 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = 0;
    v19 = 0;
    goto LABEL_27;
  }
  AXLogValidations();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[AXValidationManager installSafeCategory:canInteractWithTargetClass:].cold.1();

  -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AX Safe Category class not found: %@"), v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v18 = 0;
  v10 = 0;
  v9 = 0;
  v22 = 0;
LABEL_35:
  if (-[AXValidationManager shouldPerformValidationChecks](self, "shouldPerformValidationChecks"))
    -[AXValidationManager _generateWarningsOnSafeCategoryClass:](self, "_generateWarningsOnSafeCategoryClass:", v8);
  if (!v22)
  {
    if (self->_shouldReportToServer && !self->_forceDoNotReport)
    {
      -[AXValidationManager overrideProcessName](self, "overrideProcessName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        -[AXValidationManager sendExceptionForSafeCategoryOnWrongTarget:targetBundle:expectedBundle:overrideProcessName:](self, "sendExceptionForSafeCategoryOnWrongTarget:targetBundle:expectedBundle:overrideProcessName:", v6, v10, v18, v37);
      else
        -[AXValidationManager sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:](self, "sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:", v6, v9, v37);

    }
    if (self->_shouldLogToConsole)
    {
      -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v21);

    }
  }

  objc_autoreleasePoolPop(v7);
  return v22;
}

- (BOOL)installSwiftDynamicReplacementUnit:(id)a3 inBundle:(id)a4 withPrecondition:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(_QWORD))a5;
  v11 = (void *)MEMORY[0x193FF9EC8]();
  -[AXValidationManager setNumberOfValidations:](self, "setNumberOfValidations:", -[AXValidationManager numberOfValidations](self, "numberOfValidations") + 1);
  if (!v9)
  {
    AXLogValidations();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:].cold.1();

    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AX Container bundle was not found when installing Swift dynamic replacement unit %@"), v8);
    goto LABEL_17;
  }
  if (!objc_msgSend(v8, "length"))
  {
    AXLogValidations();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:].cold.2(v21);

    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = CFSTR("AX Swift dynamic replacement name empty");
    goto LABEL_16;
  }
  if ((v10[2](v10) & 1) == 0)
  {
    AXLogValidations();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:].cold.4();

    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    v22 = (void *)MEMORY[0x1E0CB3940];
    v32 = v8;
    v23 = CFSTR("AX Swift dynamic replacement %@ installation's condition not met");
LABEL_16:
    objc_msgSend(v22, "stringWithFormat:", v23, v32);
LABEL_17:
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v9, "builtInPlugInsPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("axbundlefile"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, 0);

  if ((v16 & 1) != 0)
  {
    v17 = objc_retainAutorelease(v14);
    if (dlopen((const char *)objc_msgSend(v17, "UTF8String"), 1))
    {

      v18 = 0;
      v19 = 1;
      goto LABEL_24;
    }
    v30 = dlerror();
    AXLogValidations();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v8;
      v37 = 2112;
      v38 = v9;
      v39 = 2080;
      v40 = v30;
      _os_log_error_impl(&dword_18EBEC000, v31, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement %@ from bundle %@ not successfully installed: %s", buf, 0x20u);
    }

    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AX Swift dynamic replacement %@ from bundle %@ not successfully installed: %s"), v8, v9, v30);
  }
  else
  {
    AXLogValidations();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[AXValidationManager installSwiftDynamicReplacementUnit:inBundle:withPrecondition:].cold.3();

    -[AXValidationManager setNumberOfValidationErrors:](self, "setNumberOfValidationErrors:", -[AXValidationManager numberOfValidationErrors](self, "numberOfValidationErrors") + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AX Swift dynamic replacement file not found at path %@"), v14, v33, v34);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (self->_shouldReportToServer && !self->_forceDoNotReport)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Swift Dynamic Replacement: %@"), v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXValidationManager overrideProcessName](self, "overrideProcessName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXValidationManager sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:](self, "sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:", v25, &stru_1E28C88D8, v26);

  }
  if (self->_shouldLogToConsole)
  {
    -[AXValidationManager consoleErrorMessages](self, "consoleErrorMessages");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v18);

  }
  v19 = 0;
LABEL_24:

  objc_autoreleasePoolPop(v11);
  return v19;
}

- (void)sendExceptionForInstallingSafeCategory:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:", v13, v8, v9);
  }
  else
  {
    AXProcessGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendExceptionForInstallingSafeCategory:onTarget:overrideProcessName:", v13, v8, v12);

  }
}

- (void)sendExceptionForSafeCategoryOnWrongTarget:(id)a3 targetBundle:(id)a4 expectedBundle:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendExceptionForSafeCategoryOnWrongTarget:targetBundle:expectedBundle:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendExceptionForSafeCategoryOnWrongTarget:targetBundle:expectedBundle:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendExceptionForSafeValueKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (!v8)
  {
    AXProcessGetName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendExceptionForSafeValueKey:onTarget:overrideProcessName:backtrace:", v10, v9, v11, v13);

  if (!v8)
}

- (void)sendExceptionForSafeIVarKey:(id)a3 onTarget:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "sendExceptionForSafeIVarKey:onTarget:overrideProcessName:", v13, v8, v9);
  }
  else
  {
    AXProcessGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendExceptionForSafeIVarKey:onTarget:overrideProcessName:", v13, v8, v12);

  }
}

- (void)sendExceptionForSafeBlock:(id)a3 overrideProcessName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "sendExceptionForSafeBlock:overrideProcessName:", v10, v6);
  }
  else
  {
    AXProcessGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendExceptionForSafeBlock:overrideProcessName:", v10, v9);

  }
}

- (void)sendGenericReport:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "sendGenericReport:withTag:overrideProcessName:", v13, v8, v9);
  }
  else
  {
    AXProcessGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendGenericReport:withTag:overrideProcessName:", v13, v8, v12);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 errorMessage:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v13, v8, v9);
  }
  else
  {
    AXProcessGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendValidateExceptionForClass:errorMessage:overrideProcessName:", v13, v8, v12);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 isKindOfClass:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:isKindOfClass:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:isKindOfClass:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:conformsToProtocol:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:conformsToProtocol:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasInstanceVariable:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:hasInstanceVariable:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasInstanceMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:hasInstanceMethod:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasClassMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:hasClassMethod:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:hasClassMethod:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForClass:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForClass:hasProperty:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForClass:hasProperty:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 conformsToProtocol:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForProtocol:conformsToProtocol:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForProtocol:conformsToProtocol:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 hasMethod:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForProtocol:hasMethod:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForProtocol:hasMethod:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendValidateExceptionForProtocol:(id)a3 hasProperty:(id)a4 errorMessage:(id)a5 overrideProcessName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "sendValidateExceptionForProtocol:hasProperty:errorMessage:overrideProcessName:", v16, v10, v11, v12);
  }
  else
  {
    AXProcessGetName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendValidateExceptionForProtocol:hasProperty:errorMessage:overrideProcessName:", v16, v10, v11, v15);

  }
}

- (void)sendFailedAssertionWithErrorMessage:(id)a3 overrideProcessName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "sendFailedAssertionWithErrorMessage:overrideProcessName:", v10, v6);
  }
  else
  {
    AXProcessGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendFailedAssertionWithErrorMessage:overrideProcessName:", v10, v9);

  }
}

- (void)sendFailedTestCase:(id)a3 withTag:(id)a4 overrideProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "sendFailedTestCase:withTag:overrideProcessName:", v13, v8, v9);
  }
  else
  {
    AXProcessGetName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendFailedTestCase:withTag:overrideProcessName:", v13, v8, v12);

  }
}

- (void)sendValidationSuccessForProcessName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXValidationManager validationReportingServices](self, "validationReportingServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(v4, "sendValidationSuccessForProcessName:", v7);
  }
  else
  {
    AXProcessGetName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendValidationSuccessForProcessName:", v6);

  }
}

- (BOOL)shouldLogToConsole
{
  return self->_shouldLogToConsole;
}

- (void)setShouldLogToConsole:(BOOL)a3
{
  self->_shouldLogToConsole = a3;
}

- (BOOL)shouldCrashOnError
{
  return self->_shouldCrashOnError;
}

- (void)setShouldCrashOnError:(BOOL)a3
{
  self->_shouldCrashOnError = a3;
}

- (BOOL)shouldReportToServer
{
  return self->_shouldReportToServer;
}

- (void)setShouldReportToServer:(BOOL)a3
{
  self->_shouldReportToServer = a3;
}

- (unint64_t)numberOfValidationErrors
{
  return self->_numberOfValidationErrors;
}

- (void)setNumberOfValidationErrors:(unint64_t)a3
{
  self->_numberOfValidationErrors = a3;
}

- (BOOL)forceDoNotReport
{
  return self->_forceDoNotReport;
}

- (void)setForceDoNotReport:(BOOL)a3
{
  self->_forceDoNotReport = a3;
}

- (NSString)validationTargetName
{
  return self->_validationTargetName;
}

- (void)setValidationTargetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)overrideProcessName
{
  return self->_overrideProcessName;
}

- (void)setOverrideProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)consoleErrorMessages
{
  return self->_consoleErrorMessages;
}

- (void)setConsoleErrorMessages:(id)a3
{
  objc_storeStrong((id *)&self->_consoleErrorMessages, a3);
}

- (BOOL)isDebugBuild
{
  return self->_debugBuild;
}

- (void)setDebugBuild:(BOOL)a3
{
  self->_debugBuild = a3;
}

- (AXValidationReportingServices)validationReportingServices
{
  return self->_validationReportingServices;
}

- (void)setValidationReportingServices:(id)a3
{
  objc_storeStrong((id *)&self->_validationReportingServices, a3);
}

- (BOOL)installSafeCategoriesOffMainThread
{
  return self->_installSafeCategoriesOffMainThread;
}

- (void)setInstallSafeCategoriesOffMainThread:(BOOL)a3
{
  self->_installSafeCategoriesOffMainThread = a3;
}

- (BOOL)shouldPerformValidationChecks
{
  return self->_shouldPerformValidationChecks;
}

- (void)setShouldPerformValidationChecks:(BOOL)a3
{
  self->_shouldPerformValidationChecks = a3;
}

- (unint64_t)numberOfValidations
{
  return self->_numberOfValidations;
}

- (void)setNumberOfValidations:(unint64_t)a3
{
  self->_numberOfValidations = a3;
}

- (unint64_t)numberOfCategories
{
  return self->_numberOfCategories;
}

- (void)setNumberOfCategories:(unint64_t)a3
{
  self->_numberOfCategories = a3;
}

- (unint64_t)numberOfValidationWarnings
{
  return self->_numberOfValidationWarnings;
}

- (void)setNumberOfValidationWarnings:(unint64_t)a3
{
  self->_numberOfValidationWarnings = a3;
}

- (NSMutableArray)consoleWarningMessages
{
  return self->_consoleWarningMessages;
}

- (void)setConsoleWarningMessages:(id)a3
{
  objc_storeStrong((id *)&self->_consoleWarningMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleWarningMessages, 0);
  objc_storeStrong((id *)&self->_validationReportingServices, 0);
  objc_storeStrong((id *)&self->_consoleErrorMessages, 0);
  objc_storeStrong((id *)&self->_overrideProcessName, 0);
  objc_storeStrong((id *)&self->_validationTargetName, 0);
}

- (void)_printEncodedConsoleReportForValidationRunner:isDelayed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_18EBEC000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)_printConsoleReport:isDelayed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_18EBEC000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)installSafeCategory:canInteractWithTargetClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_18EBEC000, v0, v1, "AX Safe category class '%@' was not found!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_18EBEC000, v0, v1, "AX Container bundle was not found when installing Swift dynamic replacement unit %@!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)installSwiftDynamicReplacementUnit:(os_log_t)log inBundle:withPrecondition:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EBEC000, log, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement name empty", v1, 2u);
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_18EBEC000, v1, OS_LOG_TYPE_ERROR, "AX Swift dynamic replacement %@ not found in bundle %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_3();
}

- (void)installSwiftDynamicReplacementUnit:inBundle:withPrecondition:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_18EBEC000, v0, v1, "AX Swift dynamic replacement %@ installation's precondition not met", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

@end
