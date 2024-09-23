@implementation DiagnosticPipelineOutlet

- (id)contextDictionaryFromCase:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "caseId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("caseID"));

    objc_msgSend(v3, "caseGroupId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("caseGroupID"));

    objc_msgSend(v3, "caseDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("caseDomain"));

    objc_msgSend(v3, "caseType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("caseType"));

    objc_msgSend(v3, "caseSubType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("caseSubtype"));

    objc_msgSend(v3, "caseSubTypeContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("caseSubtypeContext"));

    objc_msgSend(v3, "caseDetectedProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("caseProcess"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "caseOpenedTime");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("caseDetectionTime"));

    -[DiagnosticPipelineOutlet caseSignatureFieldFromCase:](a1, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("caseSignature"));

    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildVariant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("buildVariant"));
    }
    else
    {
      objc_msgSend(v16, "buildVariant");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("buildVariant"));

    }
    objc_msgSend(v3, "buildVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("buildVersion"));
    }
    else
    {
      objc_msgSend(v16, "buildVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("buildVersion"));

    }
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configurationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v22, "hasAppleEmail"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("hasAppleEmail"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v22, "isCarryDevice"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("isCarryDevice"));

    objc_msgSend(v3, "basebandChipset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(v16, "basebandChipset");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    if (objc_msgSend(v28, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("basebandChipset"));
    objc_msgSend(v3, "basebandFirmwareVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(v16, "basebandFirmwareVersion");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;

    if (objc_msgSend(v32, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("basebandFirmwareVersion"));
    objc_msgSend(v3, "regulatoryDomainCountry");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("regulatoryDomainCountry"));
    objc_msgSend(v3, "homeCarrier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("homeCarrier"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)caseSignatureFieldFromCase:(uint64_t)a1
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;

  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x1E0C99DE8];
    v3 = a2;
    v4 = objc_alloc_init(v2);
    objc_msgSend(v3, "caseDomain");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1EA3B8F58;
    objc_msgSend(v4, "addObject:", v7);

    objc_msgSend(v3, "caseType");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_1EA3B8F58;
    objc_msgSend(v4, "addObject:", v10);

    objc_msgSend(v3, "caseSubType");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1EA3B8F58;
    objc_msgSend(v4, "addObject:", v13);

    objc_msgSend(v3, "caseSubTypeContext");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1EA3B8F58;
    objc_msgSend(v4, "addObject:", v16);

    objc_msgSend(v3, "caseDetectedProcess");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = v17;
    else
      v18 = &stru_1EA3B8F58;
    objc_msgSend(v4, "addObject:", v18);

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("^"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)issueDescriptionFromCase:(uint64_t)a1
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x1E0CB3940];
    v3 = a2;
    v4 = [v2 alloc];
    objc_msgSend(v3, "caseDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "caseType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "caseSubType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("AutoBugCapture case for %@, type:%@ subtype:%@"), v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)shouldPublishReportForCase:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  double v15;
  unsigned int v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  uint32_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_13;
  }
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "submitToDiagnosticPipeline"))
  {
    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    LOWORD(v23) = 0;
    v7 = "Not configured to submit to DiagnosticPipeline";
LABEL_8:
    v8 = v6;
    v9 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "dampeningType"))
  {
    objc_msgSend(v3, "attachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v5, "diagnosticPipelineSubmissionRate");
      v16 = (v15 * 100.0);
      if (v16 > 0x63)
      {
        casemanagementLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        v11 = 1;
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        LOWORD(v23) = 0;
        v20 = "Submission rate configured to always submit to DiagnosticPipeline";
        v21 = v6;
        v22 = 2;
      }
      else
      {
        v17 = arc4random_uniform(0x64u);
        casemanagementLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v23 = 67109376;
          v24 = 100;
          v25 = 1024;
          v26 = v16;
          _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_INFO, " Current submission probability is %u to %u against", (uint8_t *)&v23, 0xEu);
        }

        casemanagementLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        v6 = v19;
        if (v17 >= v16)
        {
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          v23 = 67109632;
          v24 = 100;
          v25 = 1024;
          v26 = v16;
          v27 = 1024;
          v28 = v17;
          v7 = "Failed to pass probability check (%u to %u against). Will not submit this case to DiagnosticPipeline. [%d]";
          v8 = v6;
          v9 = OS_LOG_TYPE_DEFAULT;
          v10 = 20;
          goto LABEL_10;
        }
        v11 = 1;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        v23 = 67109120;
        v24 = v17;
        v20 = "Allowing submission to DiagnosticPipeline [%d]";
        v21 = v6;
        v22 = 8;
      }
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v23, v22);
      goto LABEL_12;
    }
    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    LOWORD(v23) = 0;
    v7 = "Cases with empty attachments will not be submitted to DP";
    goto LABEL_8;
  }
  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v23) = 0;
    v7 = "Dampened cases will not be submitted to DP";
    v8 = v6;
    v9 = OS_LOG_TYPE_DEBUG;
LABEL_9:
    v10 = 2;
LABEL_10:
    _os_log_impl(&dword_1DBAE1000, v8, v9, v7, (uint8_t *)&v23, v10);
  }
LABEL_11:
  v11 = 0;
LABEL_12:

LABEL_13:
  return v11;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v27[7];
  char v28;
  uint8_t v29[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[DiagnosticPipelineOutlet shouldPublishReportForCase:]((uint64_t)self, v6))
  {
    objc_msgSend(v6, "caseDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticPipelineOutlet issueDescriptionFromCase:]((uint64_t)self, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticPipelineOutlet contextDictionaryFromCase:]((uint64_t)self, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "cloudKitEnabled");

    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 1;
    *(_QWORD *)v29 = 0;
    v30 = v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "attachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __57__DiagnosticPipelineOutlet_publishReportForCase_options___block_invoke;
    v27[3] = &unk_1EA3B5870;
    v28 = v13 ^ 1;
    v27[4] = self;
    v27[5] = &v35;
    v27[6] = v29;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v27);

    if (*((_BYTE *)v36 + 24))
    {
      casemanagementLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "caseId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v17;
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "Submitting case id %{public}@ to DiagnosticPipeline", buf, 0xCu);

      }
      v18 = DRSubmitLogs();
      v19 = 0;
      if ((v18 & 1) != 0)
      {
        v20 = 1;
      }
      else
      {
        casemanagementLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v19;
          v41 = 2112;
          v42 = v6;
          _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEFAULT, "Error occurred when submitting case to DiagnosticPipeline: %@ (case: %@)", buf, 0x16u);
        }

        v20 = 4;
      }
      objc_msgSend(v6, "setDPSubmissionState:", v20);

    }
    else
    {
      casemanagementLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "caseId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEFAULT, "Skipping submission of case id %{public}@ to DiagnosticPipeline due to preflight errors", buf, 0xCu);

      }
      objc_msgSend(v6, "setDPSubmissionState:", 3);
      v18 = 0;
    }
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    casemanagementLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEFAULT, "Case not eligible for submission to DiagnosticPipeline", v29, 2u);
    }

    objc_msgSend(v6, "setDPSubmissionState:", 2);
    v18 = 0;
  }

  return v18;
}

void __57__DiagnosticPipelineOutlet_publishReportForCase_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_class *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E98];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

  v9 = objc_msgSend(*(id *)(a1 + 32), "logRequiresUploadConsent:", v8);
  v10 = objc_alloc(MEMORY[0x1E0D1D248]);
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned __int8 *)(a1 + 56);
  v22 = 0;
  v13 = (void *)objc_msgSend(v10, "initWithPath:transferOwnership:errorOut:", v11, v12, &v22);
  v14 = v22;

  if (v14 || !v13)
  {
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v14;
      v17 = " Failed to create DRClientLog object representing %@: %@";
      v18 = v15;
      v19 = 22;
      goto LABEL_8;
    }
  }
  else
  {
    if (!v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13);
      goto LABEL_11;
    }
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      v17 = " Log file at %@ is privacy sensitive and requires user consent for automatic upload";
      v18 = v15;
      v19 = 12;
LABEL_8:
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

    }
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

  *a4 = 1;
LABEL_11:

}

- (BOOL)logRequiresUploadConsent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autoBugCaptureUploadPreapproved");

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "hasSuffix:", CFSTR(".pcapng"));

  return v7;
}

@end
