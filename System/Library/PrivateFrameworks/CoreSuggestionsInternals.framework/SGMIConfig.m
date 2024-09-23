@implementation SGMIConfig

- (SGMIConfig)initWithAssetAttachmentDictionary:(id)a3 attachmentLinkDetection:(id)a4 recipientConservativeDictionary:(id)a5 recipientDictionary:(id)a6 nicknameDictionary:(id)a7 followUpOnOutgoingMailsQuestionsDictionary:(id)a8 followUpOnOutgoingMailsAsksDictionary:(id)a9 followUpOnIncomingMailsDictionary:(id)a10 bodyAnalysisSamplingFactor:(float)a11 defaultTimeIntervalToStartWarningExposition:(double)a12 defaultTimeIntervalForAWarning:(double)a13 defaultTimeIntervalToEndWarningExposition:(double)a14 followUpWarningsParameters:(id)a15
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  SGMIConfig *v31;
  id v32;
  uint64_t v33;
  _PASLazyPurgeableResult *lazyDetectors;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  NSRegularExpression *attachmentLinkDetectionRegex;
  NSObject *v44;
  SGMIConfig *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  uint8_t buf[4];
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v51 = a8;
  v29 = a9;
  v30 = a10;
  v50 = a15;
  v62.receiver = self;
  v62.super_class = (Class)SGMIConfig;
  v31 = -[SGMIConfig init](&v62, sel_init);
  if (!v31)
    goto LABEL_11;
  v32 = objc_alloc(MEMORY[0x1E0D815E0]);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __429__SGMIConfig_initWithAssetAttachmentDictionary_attachmentLinkDetection_recipientConservativeDictionary_recipientDictionary_nicknameDictionary_followUpOnOutgoingMailsQuestionsDictionary_followUpOnOutgoingMailsAsksDictionary_followUpOnIncomingMailsDictionary_bodyAnalysisSamplingFactor_defaultTimeIntervalToStartWarningExposition_defaultTimeIntervalForAWarning_defaultTimeIntervalToEndWarningExposition_followUpWarningsParameters___block_invoke;
  v54[3] = &unk_1E7DB0F70;
  v55 = v52;
  v48 = v27;
  v56 = v27;
  v57 = v51;
  v58 = v29;
  v59 = v30;
  v47 = v28;
  v60 = v28;
  v49 = v26;
  v61 = v26;
  v33 = objc_msgSend(v32, "initWithBlock:idleTimeout:", v54, 5.0);
  lazyDetectors = v31->_lazyDetectors;
  v31->_lazyDetectors = (_PASLazyPurgeableResult *)v33;

  v35 = (void *)MEMORY[0x1C3BD4F6C]();
  v36 = objc_alloc(MEMORY[0x1E0CB3940]);
  v37 = v25 ? v25 : (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(v37, "_pas_componentsJoinedByString:", CFSTR(")|(?:"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\\."));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("https?://.{0,16}(?:%@)"), v39);

  v53 = 0;
  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v40, 1, &v53);
  v42 = v53;
  if (v41)
  {
    attachmentLinkDetectionRegex = v31->_attachmentLinkDetectionRegex;
    v31->_attachmentLinkDetectionRegex = (NSRegularExpression *)v41;

    objc_autoreleasePoolPop(v35);
    objc_storeStrong((id *)&v31->_followUpWarningsParameters, a15);
    v31->_bodyAnalysisSamplingFactor = a11;
    v31->_defaultTimeIntervalToStartWarningExposition = a12;
    v31->_defaultTimeIntervalForAWarning = a13;
    v31->_defaultTimeIntervalToEndWarningExposition = a14;
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v42;
      _os_log_fault_impl(&dword_1C3607000, v44, OS_LOG_TYPE_FAULT, "SGMIConfig: Invalid attachmentLinkDetectionRegex (%@).", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v35);
  }
  v26 = v49;

  v28 = v47;
  v27 = v48;
  if (!v41)
    v45 = 0;
  else
LABEL_11:
    v45 = v31;

  return v45;
}

- (NSDictionary)detectors
{
  return (NSDictionary *)-[_PASLazyPurgeableResult result](self->_lazyDetectors, "result");
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SGMIConfig detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldAnalyzeBody
{
  return (float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < self->_bodyAnalysisSamplingFactor;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  const __CFString *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMIConfig detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<SGMIConfig (%tu languages)>\n"), objc_msgSend(v5, "count"));
  objc_msgSend(v3, "appendString:", v6);

  -[SGMIConfig detectors](self, "detectors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __25__SGMIConfig_description__block_invoke;
  v24 = &unk_1E7DB0F98;
  v8 = v3;
  v25 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v21);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSRegularExpression pattern](self->_attachmentLinkDetectionRegex, "pattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("attachmentLinkDetectionRegex: %@\n"), v10, v21, v22, v23, v24);
  objc_msgSend(v8, "appendString:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("defaultTimeIntervalToStartWarningExposition: %.0f\n"), *(_QWORD *)&self->_defaultTimeIntervalToStartWarningExposition);
  objc_msgSend(v8, "appendString:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("defaultTimeIntervalForAWarning: %.0f\n"), *(_QWORD *)&self->_defaultTimeIntervalForAWarning);
  objc_msgSend(v8, "appendString:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("defaultTimeIntervalToEndWarningExposition: %.0f\n"), *(_QWORD *)&self->_defaultTimeIntervalToEndWarningExposition);
  objc_msgSend(v8, "appendString:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bodyAnalysisSamplingFactor: %.0f%%\n"), self->_bodyAnalysisSamplingFactor * 100.0);
  objc_msgSend(v8, "appendString:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = +[SGMIEnablementConfig logWarningSignatureStats](SGMIEnablementConfig, "logWarningSignatureStats");
  v18 = CFSTR("disabled");
  if (v17)
    v18 = CFSTR("enabled");
  v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("logWarningSignatureStats: %@"), v18);
  objc_msgSend(v8, "appendString:", v19);

  return v8;
}

- (NSRegularExpression)attachmentLinkDetectionRegex
{
  return self->_attachmentLinkDetectionRegex;
}

- (float)bodyAnalysisSamplingFactor
{
  return self->_bodyAnalysisSamplingFactor;
}

- (NSDictionary)followUpWarningsParameters
{
  return self->_followUpWarningsParameters;
}

- (double)defaultTimeIntervalToStartWarningExposition
{
  return self->_defaultTimeIntervalToStartWarningExposition;
}

- (double)defaultTimeIntervalForAWarning
{
  return self->_defaultTimeIntervalForAWarning;
}

- (double)defaultTimeIntervalToEndWarningExposition
{
  return self->_defaultTimeIntervalToEndWarningExposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpWarningsParameters, 0);
  objc_storeStrong((id *)&self->_attachmentLinkDetectionRegex, 0);
  objc_storeStrong((id *)&self->_lazyDetectors, 0);
}

void __25__SGMIConfig_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(v6, "description");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("  %@: %@\n"), v7, v10);
  objc_msgSend(v4, "appendString:", v9);

}

id __429__SGMIConfig_initWithAssetAttachmentDictionary_attachmentLinkDetection_recipientConservativeDictionary_recipientDictionary_nicknameDictionary_followUpOnOutgoingMailsQuestionsDictionary_followUpOnOutgoingMailsAsksDictionary_followUpOnIncomingMailsDictionary_bodyAnalysisSamplingFactor_defaultTimeIntervalToStartWarningExposition_defaultTimeIntervalForAWarning_defaultTimeIntervalToEndWarningExposition_followUpWarningsParameters___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  SGMIWarningsDetectors *v19;
  id obj;
  void *v22;
  void *v23;
  uint64_t v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  SGMIWarningsDetectors *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = (id)objc_opt_new();
  v2 = (void *)objc_opt_new();
  objc_msgSend(a1[4], "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(a1[5], "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend(a1[6], "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend(a1[7], "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend(a1[8], "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend(a1[9], "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  v26 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v2;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v28)
  {
    v24 = *(_QWORD *)v32;
    v25 = a1;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v29 = [SGMIWarningsDetectors alloc];
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[10], "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (uint64_t)v11;
        if (!v11)
        {
          objc_msgSend(a1[10], "objectForKeyedSubscript:", CFSTR("en"));
          v12 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v12;
        }
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[9], "objectForKeyedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (uint64_t)v14;
        if (!v14)
        {
          objc_msgSend(a1[9], "objectForKeyedSubscript:", CFSTR("en"));
          v15 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v15;
        }
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "objectForKeyedSubscript:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[8], "objectForKeyedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SGMIWarningsDetectors initWithAttachmentDictionary:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:compiledRegexCache:](v29, "initWithAttachmentDictionary:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:compiledRegexCache:", v30, v12, v13, v15, v16, v17, v18, v26);
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v10);

        if (!v14)
        if (!v11)

        a1 = v25;
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v28);
  }

  return v27;
}

+ (id)defaultConfig
{
  uint64_t v2;
  void *v3;

  pthread_mutex_lock(&defaultConfig_defaultConfigInitLock);
  if (!defaultConfig_instance)
  {
    +[SGMIConfig _defaultConfig](SGMIConfig, "_defaultConfig");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)defaultConfig_instance;
    defaultConfig_instance = v2;

  }
  pthread_mutex_unlock(&defaultConfig_defaultConfigInitLock);
  return (id)defaultConfig_instance;
}

+ (id)_defaultConfig
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  SGMIConfig *v13;
  SGMIConfig *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *log;
  uint8_t buf[16];

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentDetectionRegexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "attachmentLinkDetection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      sgMailIntelligenceLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v5, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get attachmentLinkDetection from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_65;
    }
    objc_msgSend(v2, "conservativeRecipientDetection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      sgMailIntelligenceLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v6, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get conservativeRecipientDetection from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_64;
    }
    objc_msgSend(v2, "recipientConservativeDetectionRegexes");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      sgMailIntelligenceLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v7, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get recipientConservativeDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_63;
    }
    objc_msgSend(v2, "recipientDetectionRegexes");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      sgMailIntelligenceLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v8, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get recipientDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_62;
    }
    objc_msgSend(v2, "nicknameDetectionRegexes");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      sgMailIntelligenceLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get nicknameDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_61;
    }
    objc_msgSend(v2, "followUpOnOutgoingMailsQuestionsDetectionRegexes");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      sgMailIntelligenceLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v10, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnOutgoingMailsQuestionsDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_60;
    }
    objc_msgSend(v2, "followUpOnOutgoingMailsAsksDetectionRegexes");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      sgMailIntelligenceLogHandle();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, log, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnOutgoingMailsAsksDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_59;
    }
    objc_msgSend(v2, "followUpOnIncomingMailsDetectionRegexes");
    log = objc_claimAutoreleasedReturnValue();
    if (!log)
    {
      sgMailIntelligenceLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v22, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnIncomingMailsDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_58;
    }
    objc_msgSend(v2, "followUpWarningsParameters");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      sgMailIntelligenceLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v21, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpWarningsParameters from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_57;
    }
    objc_msgSend(v2, "bodyAnalysisSamplingFactor");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      sgMailIntelligenceLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v20 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get bodyAnalysisSamplingFactor from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_56;
    }
    objc_msgSend(v2, "defaultTimeIntervalToStartWarningExposition");
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = v11;
    if (v11)
    {
      -[NSObject doubleValue](v11, "doubleValue");
      objc_msgSend(v2, "defaultTimeIntervalForAWarning");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v19 = v12;
        -[NSObject doubleValue](v12, "doubleValue");
        v13 = [SGMIConfig alloc];
        -[NSObject floatValue](v21, "floatValue");
        v14 = -[SGMIConfig initWithAssetAttachmentDictionary:attachmentLinkDetection:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:bodyAnalysisSamplingFactor:defaultTimeIntervalToStartWarningExposition:defaultTimeIntervalForAWarning:defaultTimeIntervalToEndWarningExposition:followUpWarningsParameters:](v13, "initWithAssetAttachmentDictionary:attachmentLinkDetection:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:bodyAnalysisSamplingFactor:defaultTimeIntervalToStartWarningExposition:defaultTimeIntervalForAWarning:defaultTimeIntervalToEndWarningExposition:followUpWarningsParameters:", v3, v4, v6, v7, v8, v9, v10, log, v22);
LABEL_50:
        v16 = v19;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
LABEL_65:

        goto LABEL_66;
      }
      sgMailIntelligenceLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get defaultTimeIntervalForAWarning from SGMITrialClientWrapper.", buf, 2u);
      }

      v16 = 0;
    }
    else
    {
      sgMailIntelligenceLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v14 = 0;
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C3607000, v19, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get defaultTimeIntervalToStartWarningExposition from SGMITrialClientWrapper.", buf, 2u);
      v16 = v19;
    }
    v14 = 0;
    goto LABEL_55;
  }
  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get attachmentDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
  }
  v14 = 0;
LABEL_66:

  return v14;
}

@end
