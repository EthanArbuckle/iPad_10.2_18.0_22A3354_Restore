@implementation AnalyticsAgent

- (AnalyticsAgent)initWithSymptomsAWDConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  AnalyticsAgent *v9;
  AnalyticsAgent *v10;
  AWDServerConnection *symptomsAWDConnection;
  NSObject *v12;
  uint8_t v14[8];
  _QWORD v15[4];
  AnalyticsAgent *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AnalyticsAgent;
  v9 = -[AnalyticsAgent init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symptomsAWDConnection, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    -[AnalyticsAgent _registerAWDQueriableMetric:](v10, "_registerAWDQueriableMetric:", 3145742);
    symptomsAWDConnection = v10->_symptomsAWDConnection;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke;
    v15[3] = &unk_1EA3B5AF0;
    v16 = v10;
    if ((-[AWDServerConnection registerConfigChangeCallback:](symptomsAWDConnection, "registerConfigChangeCallback:", v15) & 1) == 0)
    {
      analyticsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Failed to register for Symptoms AWD config change", v14, 2u);
      }

    }
  }

  return v10;
}

void __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke_2;
  block[3] = &unk_1EA3B4BB8;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  analyticsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "description");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "UTF8String");
    objc_msgSend(*(id *)(a1 + 40), "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136315394;
    v12 = v4;
    v13 = 2080;
    v14 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "Symptoms AWD metric ids configured, queriables: %s, triggers: %s", (uint8_t *)&v11, 0x16u);

  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v8;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_12);
  return (id)sharedInstance_sharedInstance_3;
}

void __32__AnalyticsAgent_sharedInstance__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  NSObject *v2;
  void *v3;
  AnalyticsAgent *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.autobugcapture.analytics", v0);
  if (!v1)
  {
    analyticsLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_ERROR, "Failed to create queue", buf, 2u);
    }

  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AF8]), "initWithComponentId:", 48);
  if (!v3)
  {
    analyticsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Failed to create symptoms AWD connection", v6, 2u);
    }
    goto LABEL_10;
  }
  if (v1)
  {
    v4 = -[AnalyticsAgent initWithSymptomsAWDConnection:queue:]([AnalyticsAgent alloc], "initWithSymptomsAWDConnection:queue:", v3, v1);
    v5 = sharedInstance_sharedInstance_3;
    sharedInstance_sharedInstance_3 = (uint64_t)v4;
LABEL_10:

  }
}

- (void)_registerAWDQueriableMetric:(unsigned int)a3
{
  AWDServerConnection *symptomsAWDConnection;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  symptomsAWDConnection = self->_symptomsAWDConnection;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke;
  v6[3] = &unk_1EA3B5038;
  v6[4] = self;
  if ((-[AWDServerConnection registerQueriableMetric:callback:](symptomsAWDConnection, "registerQueriableMetric:callback:", *(_QWORD *)&a3, v6) & 1) == 0)
  {
    analyticsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v8 = a3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Failed to register queriable for 0x%x", buf, 8u);
    }

  }
}

void __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD v5[5];
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke_2;
  v5[3] = &unk_1EA3B5B38;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  dispatch_async(v4, v5);

}

uint64_t __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuery:", *(unsigned int *)(a1 + 40));
}

- (void)_postMetric:(id)a3 metricIdentifier:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a3;
  -[AnalyticsAgent queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AnalyticsAgent__postMetric_metricIdentifier___block_invoke;
  block[3] = &unk_1EA3B5B60;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __47__AnalyticsAgent__postMetric_metricIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "newMetricContainerWithIdentifier:", *(unsigned int *)(a1 + 48));
  v3 = v2;
  if (!v2)
  {
    analyticsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = *(_DWORD *)(a1 + 48);
    v13 = 67109120;
    v14 = v11;
    v8 = "awd is not interested in metric ID %ul";
LABEL_9:
    v9 = v6;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_10;
  }
  objc_msgSend(v2, "setMetric:", *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "submitMetric:", v3);
  analyticsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v12 = *(_DWORD *)(a1 + 48);
    v13 = 67109120;
    v14 = v12;
    v8 = "Failed to send a metric with ID %ul";
    goto LABEL_9;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = *(_DWORD *)(a1 + 48);
    v13 = 67109120;
    v14 = v7;
    v8 = "Successfully sent a metric with ID %ul";
    v9 = v6;
    v10 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl(&dword_1DBAE1000, v9, v10, v8, (uint8_t *)&v13, 8u);
  }
LABEL_11:

}

- (void)_handleQuery:(unsigned int)a3
{
  NSObject *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  analyticsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Received queriable metric request for metric ID %ul", (uint8_t *)v6, 8u);
  }

  if (a3 == 3145742)
  {
    analyticsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Submitting APNS token to AWD has been deprecated", (uint8_t *)v6, 2u);
    }

  }
}

+ (id)_awdSymptomsDiagnosticNotificationTokenMetricForTokenString:(id)a3
{
  id v3;
  AWDSymptomsDiagnosticNotificationToken *v4;

  v3 = a3;
  v4 = objc_alloc_init(AWDSymptomsDiagnosticNotificationToken);
  -[AWDSymptomsDiagnosticNotificationToken setNotificationToken:](v4, "setNotificationToken:", v3);

  return v4;
}

+ (id)_awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:(id)a3
{
  id v4;
  AWDSymptomsDiagnosticIncidentReport *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AWDSymptomsDiagnosticIncidentReport);
  objc_msgSend(v4, "caseOpenedTime");
  -[AWDSymptomsDiagnosticIncidentReport setTimestamp:](v5, "setTimestamp:", (unint64_t)(v6 * 1000.0));
  -[AWDSymptomsDiagnosticIncidentReport setVersion:](v5, "setVersion:", 2);
  -[AWDSymptomsDiagnosticIncidentReport setHandledResult:](v5, "setHandledResult:", +[AnalyticsAgent awdHandledResult:](AnalyticsAgent, "awdHandledResult:", objc_msgSend(v4, "dampeningType")));
  v7 = +[AnalyticsAgent awdDampeningType:](AnalyticsAgent, "awdDampeningType:", objc_msgSend(v4, "dampeningType"));
  if ((int)v7 >= 1)
    -[AWDSymptomsDiagnosticIncidentReport setDampeningType:](v5, "setDampeningType:", v7);
  objc_msgSend(v4, "caseClosedTime");
  v9 = v8;
  objc_msgSend(v4, "caseOpenedTime");
  if (v9 > v10)
  {
    objc_msgSend(v4, "caseClosedTime");
    v12 = v11;
    objc_msgSend(v4, "caseOpenedTime");
    -[AWDSymptomsDiagnosticIncidentReport setDuration:](v5, "setDuration:", (unint64_t)(v13 * -1000.0 + v12 * 1000.0));
  }
  objc_msgSend(v4, "caseId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "caseId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDSymptomsDiagnosticIncidentReport setIdentifier:](v5, "setIdentifier:", v16);

  }
  objc_msgSend(v4, "signature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("groupID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setGroupIdentifier:](v5, "setGroupIdentifier:", v18);
  objc_msgSend(v4, "signature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("domain"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setDomain:](v5, "setDomain:", v20);
  objc_msgSend(v4, "signature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setType:](v5, "setType:", v22);
  objc_msgSend(v4, "signature");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subtype"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setSubtype:](v5, "setSubtype:", v24);
  v57 = v22;
  objc_msgSend(v4, "signature");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("additional"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setSubtypeContext:](v5, "setSubtypeContext:", v26);
  v55 = v26;
  v56 = v24;
  objc_msgSend(v4, "signature");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("detected"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

  }
  else
  {
    objc_msgSend(v4, "signature");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_25;
  }
  objc_msgSend(v4, "signature");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v32, "length"))
  {
    objc_msgSend(v4, "signature");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("detected"));
    v34 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v34;
  }
  if (objc_msgSend(v32, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setDetectedName:](v5, "setDetectedName:", v32);

LABEL_25:
  objc_msgSend(v4, "signature");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("effective"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v36, "length"))
    -[AWDSymptomsDiagnosticIncidentReport setEffectiveName:](v5, "setEffectiveName:", v36);
  objc_msgSend(v4, "signature");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("related"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v4, "signature");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("related"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v20;
      v53 = v18;
      v54 = a1;
      v41 = v40;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v59 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v46, "length"))
              -[AWDSymptomsDiagnosticIncidentReport addRelatedNames:](v5, "addRelatedNames:", v46);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v43);
      }

      a1 = v54;
      v20 = v52;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v40;
        if (objc_msgSend(v47, "length"))
          -[AWDSymptomsDiagnosticIncidentReport addRelatedNames:](v5, "addRelatedNames:", v47);

      }
    }

  }
  objc_msgSend(v4, "events", v52, v53, v54);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  if (v49)
  {
    objc_msgSend(v4, "events");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updateAWDReport:withEvents:", v5, v50);

  }
  return v5;
}

+ (int)awdHandledResult:(signed __int16)a3
{
  int v3;

  if (a3 == -1)
    v3 = 4;
  else
    v3 = 2;
  if (a3)
    return v3;
  else
    return 1;
}

+ (int)awdDampeningType:(signed __int16)a3
{
  int v3;
  uint64_t v4;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 2;
  if (v4 < 7)
    return dword_1DBB605E8[v4];
  analyticsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Found unexpected dampening type %d", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (void)updateAWDReport:(id)a3 withEvents:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  AWDSymptomsDiagnosticIncidentEvent *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v5 = a4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v34 = v5;
    v35 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      v36 = v7;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("probe")))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("status"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("result"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 2;
            goto LABEL_11;
          }
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("symptom")))
          {
            v13 = 0;
            v12 = 0;
            v14 = 1;
LABEL_11:
            analyticsLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v11;
              _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Processing event of type: %@", buf, 0xCu);
            }

            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("process"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "timeIntervalSince1970");
              goto LABEL_18;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v18, "doubleValue");
LABEL_18:
              v20 = v19;
              if (v19 > 0.0)
              {
                v21 = objc_alloc_init(AWDSymptomsDiagnosticIncidentEvent);
                -[AWDSymptomsDiagnosticIncidentEvent setType:](v21, "setType:", v14);
                if (objc_msgSend(v16, "length"))
                  -[AWDSymptomsDiagnosticIncidentEvent setName:](v21, "setName:", v16);
                if (objc_msgSend(v17, "length"))
                  -[AWDSymptomsDiagnosticIncidentEvent setDetectedName:](v21, "setDetectedName:", v17);
                analyticsLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v42 = v12;
                  _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_INFO, " kSymptomDiagnosticKeyEventStatus is %@", buf, 0xCu);
                }

                if (objc_msgSend(v12, "length"))
                {
                  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("starting")) & 1) != 0
                    || (objc_msgSend(v12, "isEqualToString:", CFSTR("Starting")) & 1) != 0
                    || (objc_msgSend(v12, "isEqualToString:", CFSTR("Requesting")) & 1) != 0)
                  {
                    v23 = 1;
                    goto LABEL_30;
                  }
                  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("finished")) & 1) != 0
                    || (objc_msgSend(v12, "isEqualToString:", CFSTR("Finished")) & 1) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("success")) & 1) != 0)
                  {
                    v31 = 1;
                    goto LABEL_65;
                  }
                  if (objc_msgSend(v12, "isEqualToString:", CFSTR("failure")))
                  {
                    v31 = 2;
LABEL_65:
                    -[AWDSymptomsDiagnosticIncidentEvent setStatus:](v21, "setStatus:", v31);
LABEL_66:
                    v23 = 2;
LABEL_30:
                    -[AWDSymptomsDiagnosticIncidentEvent setState:](v21, "setState:", v23);
                  }
                }
                analyticsLogHandle();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v42 = v13;
                  _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_INFO, " kSymptomDiagnosticKeyEventResult is %@", buf, 0xCu);
                }

                if (objc_msgSend(v13, "length"))
                {
                  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("success")) & 1) != 0)
                  {
                    v25 = 1;
                    goto LABEL_40;
                  }
                  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("failure")) & 1) != 0)
                  {
                    v25 = 2;
                    goto LABEL_40;
                  }
                  if (objc_msgSend(v12, "isEqualToString:", CFSTR("timeout")))
                  {
                    v25 = 3;
LABEL_40:
                    -[AWDSymptomsDiagnosticIncidentEvent setStatus:](v21, "setStatus:", v25);
                  }
                }
                if (-[AWDSymptomsDiagnosticIncidentEvent hasState](v21, "hasState"))
                {
                  analyticsLogHandle();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    -[AWDSymptomsDiagnosticIncidentEvent stateAsString:](v21, "stateAsString:", -[AWDSymptomsDiagnosticIncidentEvent state](v21, "state"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v42 = v27;
                    _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "  state: %@", buf, 0xCu);

                    v5 = v34;
                  }

                }
                if (-[AWDSymptomsDiagnosticIncidentEvent hasStatus](v21, "hasStatus"))
                {
                  analyticsLogHandle();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    -[AWDSymptomsDiagnosticIncidentEvent statusAsString:](v21, "statusAsString:", -[AWDSymptomsDiagnosticIncidentEvent status](v21, "status"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v42 = v29;
                    _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_DEBUG, "  status: %@", buf, 0xCu);

                    v5 = v34;
                  }

                }
                if (-[AWDSymptomsDiagnosticIncidentEvent hasState](v21, "hasState")
                  || -[AWDSymptomsDiagnosticIncidentEvent hasStatus](v21, "hasStatus"))
                {
                  analyticsLogHandle();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_INFO, " Adding event to AWD incident report.", buf, 2u);
                  }

                  objc_msgSend(v33, "addIncidentEvents:", v21);
                  objc_msgSend(v33, "addTimestampsIncidentEvents:", (unint64_t)(v20 * 1000.0));
                  v5 = v34;
                }

              }
            }

            v8 = v35;
            v7 = v36;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v7 = v32;
    }
    while (v32);
  }

}

+ (id)_awdSignificantOperationalEventMetricForSignificantEvent:(int)a3 orEventName:(id)a4 errorContext:(int)a5 error:(id)a6 status:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  _DWORD v21[2];
  __int16 v22;
  id v23;
  uint64_t v24;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  if ((int)v10 <= 0 && !objc_msgSend(v11, "length"))
  {
    analyticsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109378;
      v21[1] = v10;
      v22 = 2112;
      v23 = v11;
      v16 = "Cannot create SignificantOperationalEvent metric without a valid event (%d) or event name (%@)!";
      v17 = v15;
      v18 = 18;
      goto LABEL_18;
    }
LABEL_19:

    v14 = 0;
    goto LABEL_20;
  }
  v13 = (void *)objc_opt_new();
  if (!v13)
  {
    analyticsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      v16 = "Unable to create AWDSymptomsSignificantOperationalEvent object!";
      v17 = v15;
      v18 = 2;
LABEL_18:
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v21, v18);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v14 = v13;
  if ((int)v10 < 1)
  {
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v14, "setAlternateName:", v11);
  }
  else
  {
    objc_msgSend(v13, "setName:", v10);
  }
  if ((int)v9 >= 1)
    objc_msgSend(v14, "setError:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setErrorDomain:", v19);

    objc_msgSend(v14, "setErrorCode:", objc_msgSend(v12, "code"));
  }
  if ((int)v7 >= 1)
    objc_msgSend(v14, "setStatus:", v7);
LABEL_20:

  return v14;
}

- (void)apnsPostNotificationToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  analyticsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Creating AWDSymptomsDiagnosticNotificationToken metric with token string %@", (uint8_t *)&v7, 0xCu);
  }

  +[AnalyticsAgent _awdSymptomsDiagnosticNotificationTokenMetricForTokenString:](AnalyticsAgent, "_awdSymptomsDiagnosticNotificationTokenMetricForTokenString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsAgent _postMetric:metricIdentifier:](self, "_postMetric:metricIdentifier:", v6, 3145742);

}

- (void)apnsPostTokenConversionError
{
  -[AnalyticsAgent postMetricForSignificantEvent:errorContext:error:status:](self, "postMetricForSignificantEvent:errorContext:error:status:", 7, 3, 0, 0);
}

- (void)apnsPostAPNSNotEnabled
{
  -[AnalyticsAgent postMetricForSignificantEvent:errorContext:error:status:](self, "postMetricForSignificantEvent:errorContext:error:status:", 7, 2, 0, 0);
}

- (void)apnsPostTokenNotSet
{
  -[AnalyticsAgent postMetricForSignificantEvent:errorContext:error:status:](self, "postMetricForSignificantEvent:errorContext:error:status:", 7, 1, 0, 0);
}

- (void)apnsPostTokenEmpty
{
  -[AnalyticsAgent postMetricForSignificantEvent:errorContext:error:status:](self, "postMetricForSignificantEvent:errorContext:error:status:", 7, 5, 0, 0);
}

- (void)postDiagnosticIncidentReportForCase:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  analyticsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Creating AWDSymptomsDiagnosticIncidentReport for diagnostic case: %@", (uint8_t *)&v7, 0xCu);
  }

  +[AnalyticsAgent _awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:](AnalyticsAgent, "_awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsAgent sharedInstance](AnalyticsAgent, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_postMetric:metricIdentifier:", v5, 3145739);

}

- (void)postMetricForSignificantEvent:(int)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  analyticsLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = v8;
    v14 = 1024;
    v15 = v7;
    v16 = 1024;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "Creating AWDSymptomsSignificantOperationalEvent metric with event %d, error context %d, status %d, error: %@", (uint8_t *)v13, 0x1Eu);
  }

  +[AnalyticsAgent _awdSignificantOperationalEventMetricForSignificantEvent:orEventName:errorContext:error:status:](AnalyticsAgent, "_awdSignificantOperationalEventMetricForSignificantEvent:orEventName:errorContext:error:status:", v8, 0, v7, v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsAgent sharedInstance](AnalyticsAgent, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_postMetric:metricIdentifier:", v11, 3145749);

}

- (void)postMetricForSignificantEventWithName:(id)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  analyticsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138413058;
    v15 = v9;
    v16 = 1024;
    v17 = v8;
    v18 = 1024;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Creating AWDSymptomsSignificantOperationalEvent metric with event name %@, error context %d, status %d, error: %@", (uint8_t *)&v14, 0x22u);
  }

  +[AnalyticsAgent _awdSignificantOperationalEventMetricForSignificantEvent:orEventName:errorContext:error:status:](AnalyticsAgent, "_awdSignificantOperationalEventMetricForSignificantEvent:orEventName:errorContext:error:status:", 0, v9, v8, v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsAgent sharedInstance](AnalyticsAgent, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_postMetric:metricIdentifier:", v12, 3145749);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (AWDServerConnection)symptomsAWDConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSymptomsAWDConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)awdSymptomsConfiguredMetricIds
{
  return self->_awdSymptomsConfiguredMetricIds;
}

- (void)setAwdSymptomsConfiguredMetricIds:(id)a3
{
  objc_storeStrong((id *)&self->_awdSymptomsConfiguredMetricIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdSymptomsConfiguredMetricIds, 0);
  objc_storeStrong((id *)&self->_symptomsAWDConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
