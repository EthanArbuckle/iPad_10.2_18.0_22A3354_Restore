@implementation AFMyriadMetrics

- (id)_getRequestType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return CFSTR("Unknown");
  else
    return off_1E3A31D00[a3 - 2];
}

- (int)_getCDASchemaCDATriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return 0;
  else
    return dword_19B0ED6B0[a3 - 2];
}

- (unsigned)getVersion:(MyriadMetricsDataV1 *)a3
{
  if (a3)
    return a3->version;
  else
    return 0;
}

- (double)getSessionId:(MyriadMetricsDataV1 *)a3
{
  if (a3)
    return (double)a3->sessionId;
  else
    return 0.0;
}

- (BOOL)isMyriadMetricsMessage:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryMetrics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)getCDASessionId:(MyriadMetricsDataV1 *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v5 = v4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("00000000-0000-0000-0000-%012u"), a3->sessionId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  }
  return v7;
}

- (id)_createEndAnalyticContexFromIntermediateContext:(id)a3 forVersion:(unsigned int)a4 sessionId:(double)a5
{
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("session_id"));

  return v9;
}

- (void)_submitMyriadMetrics:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 toStream:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *, void *);
  uint64_t state;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  double advDelay;
  double advInterval;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  int v75;
  void *v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  unint64_t requestType;
  int v81;
  int v82;
  id v83;
  _QWORD v84[5];
  id v85;
  uint64_t *v86;
  MyriadMetricsDataV1 *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  uint64_t v97;
  const __CFString *v98;
  void *v99;
  _QWORD v100[2];
  _QWORD v101[2];
  const __CFString *v102;
  void *v103;
  _QWORD v104[3];
  _QWORD v105[3];
  const __CFString *v106;
  void *v107;
  _QWORD v108[2];
  _QWORD v109[4];

  v109[2] = *MEMORY[0x1E0C80C00];
  v83 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *, void *))a7;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__20717;
  v92 = __Block_byref_object_dispose__20718;
  v93 = 0;
  if (a3)
  {
    switch(a3->eventType)
    {
      case 0u:
        requestType = a3->requestType;
        state = a3->state;
        v108[0] = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), state);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v108[1] = CFSTR("trigger");
        v109[0] = v16;
        -[AFMyriadMetrics _getRequestType:](self, "_getRequestType:", requestType);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v89[5];
        v89[5] = v20;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2011, v89[5]);
        v22 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v22) = 1;
        if ((v22 & 1) == 0)
        {
          v23 = -[AFMyriadMetrics _getCDASchemaCDATriggerType:](self, "_getCDASchemaCDATriggerType:", requestType);
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", (state + 1), v23, v24, mach_absolute_time());

        }
        break;
      case 1u:
        v27 = a3->state;
        v106 = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v29, v30);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v89[5];
        v89[5] = v31;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2012, v89[5]);
        v33 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v33) = 1;
        if ((v33 & 1) == 0)
        {
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logCDADeviceStateActivityEnded:withCdaId:withTimestamp:", (v27 + 1), v34, mach_absolute_time());

        }
        break;
      case 2u:
        v35 = a3->state;
        advDelay = a3->advDelay;
        advInterval = a3->advInterval;
        v104[0] = CFSTR("state");
        v81 = v35;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = v38;
        v104[1] = CFSTR("adv-delay");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", advDelay);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v105[1] = v39;
        v104[2] = CFSTR("adv-interval");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", advInterval);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v105[2] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v41, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v89[5];
        v89[5] = v43;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2002, v89[5]);
        v45 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v45) = 1;
        if ((v45 & 1) == 0)
        {
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = mach_absolute_time();
          *(float *)&v48 = advDelay;
          *(float *)&v49 = advInterval;
          objc_msgSend(v13, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:", (v81 + 1), v46, v47, v48, v49);

        }
        break;
      case 3u:
        v50 = a3->state;
        v102 = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v52, v53);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v89[5];
        v89[5] = v54;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2003, v89[5]);
        v56 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v56) = 1;
        if ((v56 & 1) == 0)
        {
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:", (v50 + 1), v57, mach_absolute_time());

        }
        break;
      case 4u:
        v58 = a3->state;
        v100[0] = CFSTR("state");
        v82 = v58;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v100[1] = CFSTR("unixTime");
        v101[0] = v59;
        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "timeIntervalSince1970");
        objc_msgSend(v60, "numberWithDouble:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v63, v64);
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)v89[5];
        v89[5] = v65;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2010, v89[5]);
        v67 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v67) = 1;
        if ((v67 & 1) == 0)
        {
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logCDAElectionTimerEnded:withCdaId:withTimestamp:", (v82 + 1), v68, mach_absolute_time());

        }
        break;
      case 5u:
        v69 = a3->state;
        v98 = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v70;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = -[AFMyriadMetrics getVersion:](self, "getVersion:", a3);
        -[AFMyriadMetrics getSessionId:](self, "getSessionId:", a3);
        -[AFMyriadMetrics _createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:](self, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v71, v72);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v89[5];
        v89[5] = v73;

        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          objc_msgSend(v12, "logEventWithType:context:", 2005, v89[5]);
        v75 = !+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        if (!v13)
          LOBYTE(v75) = 1;
        if ((v75 & 1) == 0)
        {
          -[AFMyriadMetrics getCDASessionId:](self, "getCDASessionId:", a3);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:", (v69 + 1), v76, mach_absolute_time());

        }
        break;
      case 6u:
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __94__AFMyriadMetrics__submitMyriadMetrics_additionalContext_toStream_instrumentation_completion___block_invoke;
        v84[3] = &unk_1E3A31CE0;
        v86 = &v88;
        v87 = a3;
        v84[4] = self;
        v85 = v12;
        -[AFMyriadMetrics _decisionMadeContext:additionalContext:instrumentation:completion:](self, "_decisionMadeContext:additionalContext:instrumentation:completion:", a3, v83, v13, v84);

        break;
      default:
        v25 = 2201;
        goto LABEL_10;
    }
    v26 = 0;
  }
  else
  {
    v25 = 2202;
LABEL_10:
    +[AFError errorWithCode:](AFError, "errorWithCode:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v77 = AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEBUG))
  {
    v79 = v89[5];
    *(_DWORD *)buf = 136315394;
    v95 = "-[AFMyriadMetrics _submitMyriadMetrics:additionalContext:toStream:instrumentation:completion:]";
    v96 = 2112;
    v97 = v79;
    _os_log_debug_impl(&dword_19AF50000, v77, OS_LOG_TYPE_DEBUG, "%s Myriad endpoint metrics context: %@", buf, 0x16u);
    if (!v14)
      goto LABEL_47;
    goto LABEL_46;
  }
  if (v14)
  {
LABEL_46:
    v78 = (void *)objc_msgSend((id)v89[5], "copy");
    v14[2](v14, v26, v78);

  }
LABEL_47:

  _Block_object_dispose(&v88, 8);
}

- (void)_decisionMadeContext:(MyriadMetricsDataV1 *)a3 additionalContext:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  uint64_t electionParticipantCount;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *electionParticipantDeviceType;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  id v45;
  unsigned __int8 *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int8 *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  AFMyriadMetrics *v66;
  void (**v67)(id, id);
  void *v68;
  void *v69;
  uint64_t v70;
  MyriadMetricsDataV1 *v71;
  uint64_t v72;
  void *v73;
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a3->version)
    {
      v66 = self;
      v67 = v12;
      v68 = v11;
      v69 = v10;
      v71 = a3;
      electionParticipantCount = a3->electionParticipantCount;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), electionParticipantCount);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("device_count"));

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", electionParticipantCount);
      v72 = electionParticipantCount;
      v73 = v16;
      if (electionParticipantCount >= 0x32)
        v17 = 50;
      else
        v17 = electionParticipantCount;
      v70 = v17;
      if ((_DWORD)v17)
      {
        v18 = v17;
        electionParticipantDeviceType = a3->electionParticipantDeviceType;
        do
        {
          v20 = objc_alloc(MEMORY[0x1E0C99E08]);
          v76[0] = CFSTR("dc");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *electionParticipantDeviceType);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = v21;
          v76[1] = CFSTR("pt");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", electionParticipantDeviceType[50]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v77[1] = v22;
          v76[2] = CFSTR("goodness");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(electionParticipantDeviceType - 50));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v77[2] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v20, "initWithDictionary:", v24);

          v16 = v73;
          objc_msgSend(v73, "addObject:", v25);

          ++electionParticipantDeviceType;
          --v18;
        }
        while (v18);
      }
      objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("goodness_scores"));
      if (v71->previousDecision)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      objc_msgSend(v13, "setObject:forKey:", v26, CFSTR("previous_decision"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), (unint64_t)v71->previousDecisionTime);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("previous_decision_time"));

      if (v71->decision)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      objc_msgSend(v13, "setObject:forKey:", v28, CFSTR("decision"));
      if ((_DWORD)v72)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%hhu"), v71->electionParticipantGoodnessScore[0]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v29, CFSTR("winner_goodness"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v71->electionParticipantDeviceType[0]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v30, CFSTR("winner_device_class"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v71->electionParticipantProductType[0]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v31, CFSTR("winner_product_type"));

      }
      if (v71->homepodInvolved)
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("homepod_involved"));
      v10 = v69;
      v33 = v70;
      if ((_DWORD)v72 && !v71->decision)
      {
        if (v71->electionParticipantGoodnessScore[0] == 255)
          v34 = CFSTR("YES");
        else
          v34 = CFSTR("NO");
        objc_msgSend(v13, "setObject:forKey:", v34, CFSTR("winner_sent_suppresssion"));
      }
      v35 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v71->version);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v36, CFSTR("version"));

      if (v71->lateToElection)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v37, CFSTR("late_for_device_arbitration"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71->advInterval);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v38, CFSTR("device_arbitration_delay"));

      }
      if (v69)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v69, "rawGoodnessScore"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v39, CFSTR("raw_goodness_score"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v69, "goodnessScore"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v40, CFSTR("my_goodness"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v69, "deviceClass"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v41, CFSTR("my_device_class"));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v69, "deviceProductType"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v42, CFSTR("my_product_type"));

      }
      v43 = +[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
      if (v11 && v43)
      {
        v44 = objc_alloc_init(MEMORY[0x1E0D99470]);
        objc_msgSend(v44, "setDeviceClass:", v71->electionParticipantDeviceType[0]);
        objc_msgSend(v44, "setProductType:", v71->electionParticipantProductType[0]);
        v65 = v44;
        objc_msgSend(v44, "setGoodnessScore:", v71->electionParticipantGoodnessScore[0]);
        v45 = objc_alloc_init(MEMORY[0x1E0D99470]);
        objc_msgSend(v45, "setDeviceClass:", objc_msgSend(v69, "deviceClass"));
        objc_msgSend(v45, "setProductType:", objc_msgSend(v69, "deviceProductType"));
        v64 = v45;
        objc_msgSend(v45, "setGoodnessScore:", objc_msgSend(v69, "goodnessScore"));
        if ((_DWORD)v70)
        {
          v46 = v71->electionParticipantDeviceType;
          v47 = v70;
          do
          {
            v48 = objc_alloc(MEMORY[0x1E0C99E08]);
            v74[0] = CFSTR("dc");
            objc_msgSend(*(id *)(v35 + 2024), "numberWithUnsignedChar:", *v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v75[0] = v49;
            v74[1] = CFSTR("pt");
            objc_msgSend(*(id *)(v35 + 2024), "numberWithUnsignedChar:", v46[50]);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v75[1] = v50;
            v74[2] = CFSTR("goodness");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(v46 - 50));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v75[2] = v51;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend(v48, "initWithDictionary:", v52);

            v35 = 0x1E0CB3000;
            objc_msgSend(v73, "addObject:", v53);

            ++v46;
            --v47;
          }
          while (v47);
        }
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v72);
        if ((_DWORD)v70)
        {
          v55 = v71->electionParticipantDeviceType;
          do
          {
            v56 = objc_alloc_init(MEMORY[0x1E0D99470]);
            objc_msgSend(v56, "setDeviceClass:", *v55);
            objc_msgSend(v56, "setProductType:", v55[50]);
            objc_msgSend(v56, "setGoodnessScore:", *(v55 - 50));
            objc_msgSend(v54, "addObject:", v56);

            ++v55;
            --v33;
          }
          while (v33);
        }
        if (v71->decision)
          v57 = 1;
        else
          v57 = 2;
        if (v71->previousDecision)
          v58 = 1;
        else
          v58 = 2;
        v59 = mach_absolute_time();
        v11 = v68;
        if (_AFMachAbsoluteTimeRate_onceToken != -1)
          dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
        v10 = v69;
        v60 = (unint64_t)(((double)(unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v59)
                                - v71->previousDecisionTime)
                               / 1000000.0);
        v61 = objc_msgSend(v69, "rawGoodnessScore");
        -[AFMyriadMetrics getCDASessionId:](v66, "getCDASessionId:", v71);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v63) = v61;
        objc_msgSend(v68, "logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:", 11, v57, v58, v60, v65, v64, v54, v63, 0, v62, 0, mach_absolute_time());

        v16 = v73;
      }

      v12 = v67;
    }
    v12[2](v12, v13);

  }
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 instrumentation:(id)a5 completion:(id)a6
{
  -[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrumentation:completion:](self, "submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:instrumentation:completion:", a3, a4, 0, a5, a6);
}

- (void)submitAccessoryMyriadMetricsToAnalyticsStream:(id)a3 payload:(id)a4 additionalContext:(id)a5 instrumentation:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  AFMyriadAccessoryMetricMessage *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BYTE v24[18];
  __int16 v25;
  id v26;
  __int16 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  if (v12)
  {
    v17 = -[AFMyriadAccessoryMetricMessage initWithMetricData:]([AFMyriadAccessoryMetricMessage alloc], "initWithMetricData:", v13);
    if (v17)
    {
      v18 = v17;
      v19 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        *(_DWORD *)v24 = 136315906;
        *(_QWORD *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:i"
                             "nstrumentation:completion:]";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = objc_msgSend(v18, "version");
        v25 = 2048;
        v26 = v12;
        v27 = 2112;
        *(_QWORD *)&v28 = v14;
        _os_log_impl(&dword_19AF50000, v20, OS_LOG_TYPE_INFO, "%s version = %u analytics stream = %p additional = [%@]", v24, 0x26u);

      }
      objc_msgSend(v18, "messageAsStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        v29);
      -[AFMyriadMetrics _submitMyriadMetrics:additionalContext:toStream:instrumentation:completion:](self, "_submitMyriadMetrics:additionalContext:toStream:instrumentation:completion:", v24, v14, v12, v15, v16);
    }
    else
    {
      +[AFError errorWithCode:](AFError, "errorWithCode:", 2202);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v16[2](v16, v22, 0);
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136315138;
        *(_QWORD *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:i"
                             "nstrumentation:completion:]";
        _os_log_error_impl(&dword_19AF50000, v23, OS_LOG_TYPE_ERROR, "%s Invalid analytics data received", v24, 0xCu);
      }

      v18 = 0;
    }
  }
  else
  {
    v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 136315138;
      *(_QWORD *)&v24[4] = "-[AFMyriadMetrics submitAccessoryMyriadMetricsToAnalyticsStream:payload:additionalContext:ins"
                           "trumentation:completion:]";
      _os_log_error_impl(&dword_19AF50000, v21, OS_LOG_TYPE_ERROR, "%s Invalid analytics stream.", v24, 0xCu);
    }
    +[AFError errorWithCode:](AFError, "errorWithCode:", 2202);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v16[2](v16, v18, 0);
  }

}

- (void)submitMyriadMetricsToAnalyticsStream:(id)a3 context:(id)a4 forEvent:(int64_t)a5 contextNoCopy:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  BOOL v10;
  id v11;

  v6 = a6;
  v11 = a3;
  v9 = a4;
  v10 = +[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
  if (v11 && !v10)
    objc_msgSend(v11, "logEventWithType:context:contextNoCopy:", a5, v9, v6);

}

uint64_t __94__AFMyriadMetrics__submitMyriadMetrics_additionalContext_toStream_instrumentation_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a2;
  v6 = objc_msgSend(v3, "getVersion:", v4);
  objc_msgSend(*(id *)(a1 + 32), "getSessionId:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "_createEndAnalyticContexFromIntermediateContext:forVersion:sessionId:", v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  result = +[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "logEventWithType:context:", 2006, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_20753 != -1)
    dispatch_once(&sharedInstance_onceToken_20753, &__block_literal_global_20754);
  return (id)sharedInstance_metrics;
}

void __33__AFMyriadMetrics_sharedInstance__block_invoke()
{
  AFMyriadMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(AFMyriadMetrics);
  v1 = (void *)sharedInstance_metrics;
  sharedInstance_metrics = (uint64_t)v0;

}

@end
