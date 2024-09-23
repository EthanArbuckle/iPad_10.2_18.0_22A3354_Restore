@implementation MSVAutoBugCapture

+ (void)snapshotWithDomain:(id)a3 type:(id)a4 subType:(id)a5 context:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  void *v37;
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(_QWORD))a9;
  if (objc_msgSend(a1, "_isReporterEnabled"))
  {
    v20 = os_log_create("com.apple.amp.MediaServices", "Analytics");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v37 = v16;
      LOWORD(v38[0]) = 2112;
      *(_QWORD *)((char *)v38 + 2) = v17;
      _os_log_impl(&dword_1A077D000, v20, OS_LOG_TYPE_DEFAULT, "SymptomDiagnosticReporter starting to report a snapshot with type:%@ subType:%@ context:%@ thresholdValues:%@", buf, 0x2Au);
    }

    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v21 = (void *)getSDRDiagnosticReporterClass_softClass;
    v35 = getSDRDiagnosticReporterClass_softClass;
    if (!getSDRDiagnosticReporterClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
      v37 = &unk_1E43E92D0;
      v38[0] = &v32;
      __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
      v21 = (void *)v33[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v32, 8);
    v23 = objc_alloc_init(v22);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "processName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v28, v29, v15, v16, v25, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _MSVTransformStateValue(v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __102__MSVAutoBugCapture_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion___block_invoke;
    v30[3] = &unk_1E43E92A8;
    v31 = v19;
    objc_msgSend(v23, "snapshotWithSignature:delay:events:payload:actions:reply:", v26, v27, 0, MEMORY[0x1E0C9AA70], v30, 0.0);

  }
  else if (v19)
  {
    v19[2](v19);
  }

}

+ (BOOL)_isReporterEnabled
{
  return os_variant_has_internal_content();
}

void __102__MSVAutoBugCapture_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  int v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  int v20;
  id *v21;
  void *v22;
  id v23;
  _DWORD *v24;
  void *v25;
  _DWORD *v26;
  void *v27;
  _DWORD *v28;
  void *v29;
  _DWORD *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BYTE buf[24];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v4 = (_QWORD *)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    v5 = SymptomDiagnosticReporterLibrary();
    v4 = dlsym(v5, "kSymptomDiagnosticReplySuccess");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v4;
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(buf, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplySuccess(void)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("MSVAutoBugCapture.m"), 32, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = (id *)getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
    v50 = getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
    if (!getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr)
    {
      v9 = SymptomDiagnosticReporterLibrary();
      v8 = (id *)dlsym(v9, "kSymptomDiagnosticReplySessionID");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (v8)
    {
      v10 = *v8;
      objc_msgSend(v3, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = os_log_create("com.apple.amp.MediaServices", "Analytics");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      v13 = "SymptomDiagnosticReporter snapshot accepted with sessionID %@";
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 12;
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplySessionID(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MSVAutoBugCapture.m"), 33, CFSTR("%s"), dlerror());

LABEL_49:
    __break(1u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = (_QWORD *)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    v18 = SymptomDiagnosticReporterLibrary();
    v17 = dlsym(v18, "kSymptomDiagnosticReplyReason");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(buf, 8);
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplyReason(void)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("MSVAutoBugCapture.m"), 34, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = (id *)getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr)
  {
    v22 = SymptomDiagnosticReporterLibrary();
    v21 = (id *)dlsym(v22, "kSymptomDiagnosticReplyReasonString");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
    getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(buf, 8);
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplyReasonString(void)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("MSVAutoBugCapture.m"), 35, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  v23 = *v21;
  objc_msgSend(v3, "objectForKeyedSubscript:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v24 = (_DWORD *)getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr)
  {
    v25 = SymptomDiagnosticReporterLibrary();
    v24 = dlsym(v25, "kSymptomDiagnosticErrorDisabled");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v24;
    getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(buf, 8);
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int getkSymptomDiagnosticErrorDisabled(void)");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("MSVAutoBugCapture.m"), 37, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  if (*v24 == v20)
    goto LABEL_32;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v26 = (_DWORD *)getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr)
  {
    v27 = SymptomDiagnosticReporterLibrary();
    v26 = dlsym(v27, "kSymptomDiagnosticErrorHourlyLimitExceeded");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v26;
    getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(buf, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int getkSymptomDiagnosticErrorHourlyLimitExceeded(void)");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("MSVAutoBugCapture.m"), 38, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  if (*v26 == v20)
    goto LABEL_32;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v28 = (_DWORD *)getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr)
  {
    v29 = SymptomDiagnosticReporterLibrary();
    v28 = dlsym(v29, "kSymptomDiagnosticErrorDailyLimitExceeded");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v28;
    getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(buf, 8);
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int getkSymptomDiagnosticErrorDailyLimitExceeded(void)");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("MSVAutoBugCapture.m"), 39, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  if (*v28 == v20)
    goto LABEL_32;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v30 = (_DWORD *)getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr;
  v50 = getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr;
  if (!getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr)
  {
    v31 = SymptomDiagnosticReporterLibrary();
    v30 = dlsym(v31, "kSymptomDiagnosticErrorRandomizedSuppression");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v30;
    getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(buf, 8);
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int getkSymptomDiagnosticErrorRandomizedSuppression(void)");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("MSVAutoBugCapture.m"), 40, CFSTR("%s"), dlerror());

    goto LABEL_49;
  }
  if (*v30 == v20)
  {
LABEL_32:
    v12 = os_log_create("com.apple.amp.MediaServices", "Analytics");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v20;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v11;
    v13 = "SymptomDiagnosticReporter snapshot rejected with expected reason %d (%@)";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_34;
  }
  v12 = os_log_create("com.apple.amp.MediaServices", "Analytics");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v20;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v11;
    v13 = "SymptomDiagnosticReporter snapshot rejected with unexpected reason %d (%@)";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
LABEL_34:
    v16 = 18;
LABEL_35:
    _os_log_impl(&dword_1A077D000, v14, v15, v13, buf, v16);
  }
LABEL_36:

  v32 = *(_QWORD *)(a1 + 32);
  if (v32)
    (*(void (**)(void))(v32 + 16))();

}

@end
