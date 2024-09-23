@implementation CoreAnalyticsReportOutlet

- (id)handledResultForDampeningType:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = 2;
  if (a3 == -1)
    v3 = 3;
  if (a3)
    v4 = v3;
  else
    v4 = 1;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
}

- (id)dampeningResultForDampeningType:(signed __int16)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 2;
  if (v4 >= 0xB)
  {
    analyticsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Found unexpected dampening type %d", (uint8_t *)v8, 8u);
    }

    v5 = 0;
  }
  else
  {
    v5 = qword_1DBB60570[v4];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)closureTypeForClosure:(signed __int16)a3
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (a3 >= 6)
  {
    analyticsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Found unexpected closure type %d", (uint8_t *)v7, 8u);
    }

    *(_QWORD *)&a3 = 0;
  }
  else
  {
    v4 = a3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildDiagnosticIncidentEventForCase:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "caseDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("caseDomain"));

  objc_msgSend(v4, "caseType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("caseType"));

  objc_msgSend(v4, "caseSubType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("caseSubtype"));

  objc_msgSend(v4, "caseSubTypeContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("caseSubtypeContext"));

  objc_msgSend(v4, "caseDetectedProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("caseDetectedProcess"));

  objc_msgSend(v4, "caseId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("caseIdentifier"));

  objc_msgSend(v4, "caseGroupId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "caseGroupId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("groupIdentifier"));

    v15 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v15 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("hasGroupIdentifier"));
  objc_msgSend(v4, "caseClosedTime");
  if (v16 > 0.0)
  {
    objc_msgSend(v4, "caseClosedTime");
    v19 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSince1970");
    v19 = v18;

  }
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "caseOpenedTime");
  objc_msgSend(v21, "numberWithDouble:", v19 - v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("duration"));

  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "attachments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("attachmentCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "attachmentsFileSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("totalAttachmentSize"));

  if ((objc_msgSend(v4, "isRemoteTrigger") & 1) != 0)
  {
    v28 = &unk_1EA3CFAC8;
LABEL_11:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("remoteFlags"));
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "wantsRemote"))
  {
    v28 = &unk_1EA3CFAE0;
    goto LABEL_11;
  }
LABEL_12:
  -[CoreAnalyticsReportOutlet handledResultForDampeningType:](self, "handledResultForDampeningType:", objc_msgSend(v4, "dampeningType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("handledResult"));

  -[CoreAnalyticsReportOutlet dampeningResultForDampeningType:](self, "dampeningResultForDampeningType:", objc_msgSend(v4, "dampeningType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("dampeningResult"));

  -[CoreAnalyticsReportOutlet closureTypeForClosure:](self, "closureTypeForClosure:", objc_msgSend(v4, "closureType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("closureType"));

  return v5;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9 = v6;
  objc_copyWeak(&v10, &location);
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return 1;
}

id __58__CoreAnalyticsReportOutlet_publishReportForCase_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "caseId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Submitting analytics for case id %{public}@ to CoreAnalytics", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "buildDiagnosticIncidentEventForCase:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
