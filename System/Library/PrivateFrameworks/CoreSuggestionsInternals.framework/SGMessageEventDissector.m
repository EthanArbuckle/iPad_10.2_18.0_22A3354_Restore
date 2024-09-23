@implementation SGMessageEventDissector

- (id)_init
{
  SGMessageEventDissector *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSDictionary *dissectorConfig;
  NSDictionary *v8;
  uint64_t v9;
  NSDictionary *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _PASLock *lock;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SGMessageEventDissector;
  v2 = -[SGMessageEventDissector init](&v20, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)objc_opt_new();
    v4 = objc_opt_new();
    v5 = (void *)v3[1];
    v3[1] = v4;

    if (objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled"))
    {
      objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("SGMessageEventDissectorConfig"));
      v6 = objc_claimAutoreleasedReturnValue();
      dissectorConfig = v2->_dissectorConfig;
      v2->_dissectorConfig = (NSDictionary *)v6;

      v8 = v2->_dissectorConfig;
      if (!v8)
      {
        v21[0] = CFSTR("EventExtractionMessageProcessingLimit");
        v21[1] = CFSTR("EventExtractionRateLimitInterval");
        v22[0] = &unk_1E7E0C5F0;
        v22[1] = &unk_1E7E0C608;
        v21[2] = CFSTR("EventClassifierThreshold");
        v22[2] = &unk_1E7E0CDC0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v2->_dissectorConfig;
        v2->_dissectorConfig = (NSDictionary *)v9;

        v8 = v2->_dissectorConfig;
      }
      -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("EventExtractionMessageProcessingLimit"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v3[2];
      v3[2] = v11;
    }
    else
    {
      +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageProcessingLimit");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v3[2];
      v3[2] = v13;

    }
    -[SGMessageEventDissector loadEventClassifierModel](v2, "loadEventClassifierModel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v3[3];
    v3[3] = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v17;

  }
  return v2;
}

- (BOOL)isDissectorProcessingWithinRateLimit
{
  _PASLock *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SGMessageEventDissector_isDissectorProcessingWithinRateLimit__block_invoke;
  v5[3] = &unk_1E7DAE548;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldProcessTextMessage:(id)a3 entity:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!+[SGMessageEventDissector allowMessageEventDissector](SGMessageEventDissector, "allowMessageEventDissector"))
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    LOWORD(v17) = 0;
    v12 = "SGMessageEventDissector: Skipping Message Event dissector: allowMessageEventDissector is OFF";
    v13 = v11;
    v14 = 2;
LABEL_10:
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    goto LABEL_11;
  }
  objc_msgSend(v5, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7 || (_os_feature_enabled_impl() & 1) == 0 && !objc_msgSend(v5, "isPotentialEventMessage"))
    goto LABEL_12;
  objc_msgSend(v5, "textContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGMessageEventDissector isMessageOfTypeEvent:](self, "isMessageOfTypeEvent:", v8);

  if (!v9)
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v17 = 138412290;
    v18 = CFSTR("Event");
    v12 = "SGMessageEventDissector: Skipping Message: Message is not classified as %@ type by the Event-Classifier.";
    v13 = v11;
    v14 = 12;
    goto LABEL_10;
  }
  if (!-[SGMessageEventDissector isDissectorProcessingWithinRateLimit](self, "isDissectorProcessingWithinRateLimit"))
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Skipping Message: Exceeded Rate Limit", (uint8_t *)&v17, 2u);
    }

    -[SGMessageEventDissector logFailedEventExtractionForMessage:failureCode:](self, "logFailedEventExtractionForMessage:failureCode:", v5, 101);
    goto LABEL_12;
  }
  v10 = 1;
LABEL_13:

  return v10;
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "featureEnabled"))
  {
    v11 = mach_absolute_time();
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    if (-[SGMessageEventDissector shouldProcessTextMessage:entity:](self, "shouldProcessTextMessage:entity:", v8, v9))
    {
      v13 = objc_msgSend(v9, "hasEventEnrichment");
      objc_autoreleasePoolPop(v12);
      if ((v13 & 1) == 0)
      {
        sgEventsLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message is potential event message, dissecting to extract events", buf, 2u);
        }

        if (objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled"))
        {
          -[SGMessageEventDissector eventExtractionMobileAssetsPath](self, "eventExtractionMobileAssetsPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
LABEL_8:
            -[SGMessageEventDissector eventsFromMessage:eventExtractionAssetsPath:](self, "eventsFromMessage:eventExtractionAssetsPath:", v8, v15);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && -[NSObject count](v16, "count"))
            {
              v18 = mach_absolute_time() - v11;
              if (SGMachTimeToNanoseconds_onceToken != -1)
                dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
              v19 = v18
                  * SGMachTimeToNanoseconds_machTimebaseInfo
                  / *(unsigned int *)algn_1ED52979C
                  / 0xF4240;
              v20 = -[NSObject count](v17, "count");
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __61__SGMessageEventDissector_dissectTextMessage_entity_context___block_invoke;
              v24[3] = &unk_1E7DAE570;
              v24[4] = self;
              v21 = v19 / v20;
              v17 = v17;
              v25 = v17;
              v26 = v9;
              v27 = v8;
              v28 = v10;
              v29 = v21;
              objc_msgSend(v26, "runWithDissectorLock:", v24);

            }
            else
            {
              sgEventsLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to fetch events from MLRuntime, bailing", buf, 2u);
              }

            }
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "eventExtractionAssetsPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_8;
        }
        sgEventsLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to fetch Event Extraction Assets from TRIAL, bailing", buf, 2u);
        }
        goto LABEL_20;
      }
    }
    else
    {
      objc_autoreleasePoolPop(v12);
    }
  }
LABEL_21:

}

- (id)eventClassifierMobileAssetsPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[SGAsset regionAsset](SGAsset, "regionAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("EventClassifier"), CFSTR("mlmodelc"));
  objc_msgSend(v2, "filesystemPathForAssetDataRelativePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    +[SGAsset localeAsset](SGAsset, "localeAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("EventClassifier"), CFSTR("mlmodelc"));
    objc_msgSend(v5, "filesystemPathForAssetDataRelativePath:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = v4;
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: EventClassifier Model Path: %{private}@", buf, 0xCu);
    }

    v10 = v4;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to find MA path for EventClassifier model", buf, 2u);
    }

  }
  return v4;
}

- (id)eventExtractionMobileAssetsPath
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[SGAsset regionAsset](SGAsset, "regionAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filesystemPathForAssetDataRelativePath:", CFSTR("MLEventExtractionModel.assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    +[SGAsset localeAsset](SGAsset, "localeAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", CFSTR("MLEventExtractionModel.assets"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  sgEventsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138477827;
      v11 = v3;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: MLEventExtractionAssets Path: %{private}@", (uint8_t *)&v10, 0xCu);
    }

    v8 = v3;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to find MA path for MLEventExtractionAssets", (uint8_t *)&v10, 2u);
    }

  }
  return v3;
}

- (void)addEnrichmentForEvents:(id)a3 toEntity:(id)a4 message:(id)a5 context:(id)a6 timingProcessingInMs:(unint64_t)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *context;
  SGMessageEventDissector *v40;
  id obj;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *log;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v47 = a5;
  v42 = a6;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  v48 = v13;
  if (v13)
  {
    v45 = *(_QWORD *)v59;
    v40 = self;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(obj);
        v52 = v14;
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v14);
        v16 = MEMORY[0x1C3BD4F6C](v13);
        objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForExtractedEvent:", v15, context);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v16;
        v19 = (void *)v17;
        objc_autoreleasePoolPop(v18);
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("schema"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("category"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = MEMORY[0x1C3BD4F6C]();
        v23 = (void *)v22;
        if (v20)
        {
          v24 = (void *)MEMORY[0x1C3BD4F6C](-[SGMessageEventDissector logMLMessageEventExtractionForSchema:message:category:timingProcessingInMs:](self, "logMLMessageEventExtractionForSchema:message:category:timingProcessingInMs:", v20, v47, v21, a7));
          objc_msgSend((id)objc_opt_class(), "enrichmentsFromSchema:forMessage:forEntity:category:", v20, v47, v12, v21);
          v25 = objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v24);
          log = v25;
          if (v25)
          {
            v49 = v23;
            v51 = v20;
            v43 = v21;
            v44 = v19;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v26 = v25;
            v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v55;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v55 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                  v32 = (void *)MEMORY[0x1C3BD4F6C]();
                  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFromTemplateWithName:", CFSTR("ML_EventMessage"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addTag:", v33);

                  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFromTemplateWithShortName:", CFSTR("ML_EventMessage"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addTag:", v34);

                  sgEventsLogHandle();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = v31;
                    v64 = 2112;
                    v65 = v12;
                    _os_log_impl(&dword_1C3607000, v35, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Adding Enrichment: %@ to entity:%@", buf, 0x16u);
                  }

                  objc_msgSend(v12, "addEnrichment:", v31);
                  objc_autoreleasePoolPop(v32);
                }
                v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
              }
              while (v28);
            }

            self = v40;
            v21 = v43;
            v19 = v44;
            v23 = v49;
            v20 = v51;
          }
          objc_msgSend((id)objc_opt_class(), "logMLMessageEventExtractionInteractions:context:", v12, v42);
          v36 = v52;
        }
        else
        {
          v50 = (void *)v22;
          v37 = v19;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("missingEntities"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGMessageEventDissector logFailedEventExtractionForMessage:category:missingEntities:timingProcessingInMs:](self, "logFailedEventExtractionForMessage:category:missingEntities:timingProcessingInMs:", v47, v21, v38, a7);

          sgEventsLogHandle();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v63 = v15;
            v64 = 2112;
            v65 = v12;
            _os_log_error_impl(&dword_1C3607000, log, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Could not extract event deatils from event dictionary: %@ for entity: %@", buf, 0x16u);
          }
          v19 = v37;
          v20 = 0;
          v36 = v52;
          v23 = v50;
        }

        objc_autoreleasePoolPop(v23);
        v14 = v36 + 1;
      }
      while (v14 != v48);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      v48 = v13;
    }
    while (v13);
  }

  objc_autoreleasePoolPop(context);
}

- (id)eventsFromMessage:(id)a3 eventExtractionAssetsPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  NSObject *v49;
  uint64_t v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t v59[16];
  _QWORD block[4];
  id v61;
  __CFString *v62;
  __int128 *p_buf;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  __int128 buf;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[3];
  _QWORD v75[5];

  v75[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Fetching events from ML Runtime Plugin com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin eventExtractionAssetsPath: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "textContent");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v74[0] = CFSTR("TaskName");
    v74[1] = CFSTR("InputMessage");
    v75[0] = CFSTR("EventSuggestionsFromMessage");
    v75[1] = v9;
    v74[2] = CFSTR("AssetFolderPath");
    v75[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46588]), "initWithParametersDict:", v11);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__18095;
    v72 = __Block_byref_object_dispose__18096;
    v73 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = 0;
    if (serialQueue__pasOnceToken4 != -1)
      dispatch_once(&serialQueue__pasOnceToken4, &__block_literal_global_353);
    v13 = serialQueue__pasExprOnceResult;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke;
    block[3] = &unk_1E7DB7850;
    v14 = v12;
    v61 = v14;
    v62 = CFSTR("com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin");
    p_buf = &buf;
    v64 = &v65;
    dispatch_async_and_wait(v13, block);
    v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (!v15)
    {
      if (*((_BYTE *)v66 + 24))
        v50 = 102;
      else
        v50 = 103;
      -[SGMessageEventDissector logFailedEventExtractionForMessage:failureCode:](self, "logFailedEventExtractionForMessage:failureCode:", v6, v50);
      v19 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("events"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16
      || (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("events")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "count") == 0,
          v17,
          v16,
          v18))
    {
      sgEventsLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1C3607000, v49, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: ML Runtime failed to return events information, bailing", v59, 2u);
      }

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("errorCode"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMessageEventDissector logFailedEventExtractionForMessage:failureCode:](self, "logFailedEventExtractionForMessage:failureCode:", v6, (int)objc_msgSend(v23, "intValue"));
      v19 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("events"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__CATEGORY"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Flight"));

      if (!v22)
      {
LABEL_33:

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_34;
      }
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "getFlightReferencesAndReservationId:", v6);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count") == 0;

        if (!v26)
        {
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("airline"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("IATA"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("carrierCode"));

          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("flightNumber"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("flightNumber"));

          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("reservationId"));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v36 = v33 ? v33 : &stru_1E7DB83A8;
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("reservationId"));

          if (objc_msgSend(v19, "count") == 2)
          {
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count") == 2;

            if (v38)
            {
              objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "objectAtIndexedSubscript:", 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("airline"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("IATA"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("carrierCode"));

              objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("flightReferences"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("flightNumber"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("flightNumber"));

              objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("reservationId"));
              v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v46;
              if (v45)
                v48 = v45;
              else
                v48 = &stru_1E7DB83A8;
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v48, CFSTR("reservationId"));

            }
          }
        }
      }

    }
    goto LABEL_33;
  }
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Nil MessageBody Found. Bailing.", (uint8_t *)&buf, 2u);
  }
  v19 = 0;
LABEL_34:

  return v19;
}

- (id)loadEventClassifierModel
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0D815E0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SGMessageEventDissector_loadEventClassifierModel__block_invoke;
  v5[3] = &unk_1E7DB22A8;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithBlock:idleTimeout:", v5, 300.0);
}

- (BOOL)isMessageOfTypeEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18095;
  v21 = __Block_byref_object_dispose__18096;
  v22 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__SGMessageEventDissector_isMessageOfTypeEvent___block_invoke;
  v14[3] = &unk_1E7DAE5C0;
  v14[4] = self;
  v16 = &v17;
  v6 = v4;
  v15 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  if (objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dissectorConfig, "objectForKeyedSubscript:", CFSTR("EventClassifierThreshold"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventClassifierThreshold");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)v18[5];
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Event"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)v18[5], "objectForKeyedSubscript:", CFSTR("Event"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", v7) == 1;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)logMLMessageEventExtractionForSchema:(id)a3 message:(id)a4 category:(id)a5 timingProcessingInMs:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  _PASLock *lock;
  id v20;
  int v21;
  void *v22;
  int v23;
  _PASLock *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("deviceLocale"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("outputCategory"));
  v15 = objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (v15)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dissectorConfig, "objectForKeyedSubscript:", CFSTR("EventExtractionMessageProcessingLimit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__18095;
    v36 = __Block_byref_object_dispose__18096;
    lock = self->_lock;
    v37 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke;
    v31[3] = &unk_1E7DAE5E8;
    v31[4] = &v32;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v31);
    v20 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    v21 = objc_msgSend(v20, "intValue");
    objc_msgSend(v16, "numberWithInt:", (v18 - v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("messageProcessingRate"));
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageProcessingLimit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "intValue");
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__18095;
    v36 = __Block_byref_object_dispose__18096;
    v24 = self->_lock;
    v37 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke_2;
    v30[3] = &unk_1E7DAE5E8;
    v30[4] = &v32;
    -[_PASLock runWithLockAcquired:](v24, "runWithLockAcquired:", v30);
    v25 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    v26 = objc_msgSend(v25, "intValue");
    objc_msgSend(v16, "numberWithInt:", (v23 - v26));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("messageProcessingRate"));

  }
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logMLMessageEventExtractionForTemplateName:extractionStatus:outputInfo:outputExceptions:timingProcessing:", CFSTR("ML_EventMessage"), 0, v12, MEMORY[0x1E0C9AA60], a6);

}

- (void)logFailedEventExtractionForMessage:(id)a3 category:(id)a4 missingEntities:(id)a5 timingProcessingInMs:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  _PASLock *lock;
  id v20;
  int v21;
  void *v22;
  int v23;
  _PASLock *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v29 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("deviceLocale"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("outputCategory"));
  v15 = objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (v15)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dissectorConfig, "objectForKeyedSubscript:", CFSTR("EventExtractionMessageProcessingLimit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__18095;
    v36 = __Block_byref_object_dispose__18096;
    lock = self->_lock;
    v37 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke;
    v31[3] = &unk_1E7DAE5E8;
    v31[4] = &v32;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v31);
    v20 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    v21 = objc_msgSend(v20, "intValue");
    objc_msgSend(v16, "numberWithInt:", (v18 - v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("messageProcessingRate"));
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageProcessingLimit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "intValue");
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__18095;
    v36 = __Block_byref_object_dispose__18096;
    v24 = self->_lock;
    v37 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke_2;
    v30[3] = &unk_1E7DAE5E8;
    v30[4] = &v32;
    -[_PASLock runWithLockAcquired:](v24, "runWithLockAcquired:", v30);
    v25 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    v26 = objc_msgSend(v25, "intValue");
    objc_msgSend(v16, "numberWithInt:", (v23 - v26));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("messageProcessingRate"));

  }
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logMLMessageEventExtractionForTemplateName:extractionStatus:outputInfo:outputExceptions:timingProcessing:", CFSTR("ML_EventMessage"), 1, v12, v11, a6);

}

- (void)logFailedEventExtractionForMessage:(id)a3 failureCode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  _PASLock *lock;
  id v16;
  int v17;
  void *v18;
  int v19;
  _PASLock *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("deviceLocale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("failureReasonCode"));

  v11 = objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  if (v11)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dissectorConfig, "objectForKeyedSubscript:", CFSTR("EventExtractionMessageProcessingLimit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__18095;
    v31 = __Block_byref_object_dispose__18096;
    lock = self->_lock;
    v32 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke;
    v26[3] = &unk_1E7DAE5E8;
    v26[4] = &v27;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v26);
    v16 = (id)v28[5];
    _Block_object_dispose(&v27, 8);

    v17 = objc_msgSend(v16, "intValue");
    objc_msgSend(v12, "numberWithInt:", (v14 - v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("messageProcessingRate"));
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageProcessingLimit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__18095;
    v31 = __Block_byref_object_dispose__18096;
    v20 = self->_lock;
    v32 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke_2;
    v25[3] = &unk_1E7DAE5E8;
    v25[4] = &v27;
    -[_PASLock runWithLockAcquired:](v20, "runWithLockAcquired:", v25);
    v21 = (id)v28[5];
    _Block_object_dispose(&v27, 8);

    v22 = objc_msgSend(v21, "intValue");
    objc_msgSend(v12, "numberWithInt:", (v19 - v22));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("messageProcessingRate"));

  }
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logMLMessageEventExtractionForTemplateName:extractionStatus:outputInfo:outputExceptions:timingProcessing:", CFSTR("ML_EventMessage"), 1, v7, MEMORY[0x1E0C9AA60], 0);

}

- (id)schemaOrgAndMissingEntitiesForMessage:(id)a3 withMLModelParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "featureEnabled"))
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    v11 = (void *)objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("eventClassifierPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadEventClassifierModelFromPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    if (v13)
    {
      objc_msgSend(v6, "textContent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predictedLabelHypothesesForString:maximumCount:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allKeys");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v28 = v8;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v31 = v17;
        v32 = 2048;
        v33 = v20;
        _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message classification by Event-Classifier: %@ (Score: %.02f)", buf, 0x16u);

        v8 = v28;
      }

      if (v15)
      {
        objc_msgSend(v9, "addObject:", v15);

      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assetFolderPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessageEventDissector eventsFromMessage:eventExtractionAssetsPath:](self, "eventsFromMessage:eventExtractionAssetsPath:", v6, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 && objc_msgSend(v22, "count"))
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __87__SGMessageEventDissector_schemaOrgAndMissingEntitiesForMessage_withMLModelParameters___block_invoke;
      v29[3] = &unk_1E7DAE610;
      v29[4] = self;
      objc_msgSend(v22, "_pas_mappedArrayWithTransform:", v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v23);

    }
    v24 = (void *)objc_msgSend(v9, "copy");

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dissectorConfig, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

id __87__SGMessageEventDissector_schemaOrgAndMissingEntitiesForMessage_withMLModelParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForExtractedEvent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __48__SGMessageEventDissector_isMessageOfTypeEvent___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[3], "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(*(id *)(a1 + 32), "loadEventClassifierModel"),
        v5 = objc_claimAutoreleasedReturnValue(),
        v6 = v3[3],
        v3[3] = (id)v5,
        v6,
        objc_msgSend(v3[3], "result"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "predictedLabelHypothesesForString:maximumCount:", *(_QWORD *)(a1 + 40), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = 138412546;
      v19 = v12;
      v20 = 2048;
      v21 = v17;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message classification by Event-Classifier: %@ (Score: %.02f)", (uint8_t *)&v18, 0x16u);

    }
  }

}

NSObject *__51__SGMessageEventDissector_loadEventClassifierModel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventClassifierMobileAssetsPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventClassifierModelPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
LABEL_3:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v2);
      v4 = (void *)objc_opt_new();
      objc_msgSend(v4, "setComputeUnits:", 0);
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v3, v4, &v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14;
      if (v6)
      {
        v7 = v6;
        sgEventsLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v7;
          _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model: %@", buf, 0xCu);
        }
      }
      else
      {
        v13 = 0;
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCE158]), "initWithMLModel:error:", v5, &v13);
        v7 = v13;
        if (!v7)
        {
          v8 = v8;
          v10 = v8;
          goto LABEL_15;
        }
        sgEventsLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v7;
          _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to convert ML Model to NL Model: %@", buf, 0xCu);
        }

      }
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  sgEventsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model. Model Path does not exist", buf, 2u);
  }
  v10 = 0;
LABEL_16:

  return v10;
}

void __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __int16 v8[8];
  _QWORD v9[4];
  NSObject *v10;
  uint64_t v11;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)MEMORY[0x1E0D46580];
  v4 = a1[4];
  v5 = a1[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke_2;
  v9[3] = &unk_1E7DAE598;
  v11 = a1[6];
  v6 = v2;
  v10 = v6;
  objc_msgSend(v3, "performTask:forPluginID:completionHandler:", v4, v5, v9);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v6, 8.0) == 1)
  {
    sgEventsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 0;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: MLRuntime Plugin task timeout", (uint8_t *)v8, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

void __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "JSONResult");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    sgEventsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: MLRuntime Plugin Task failed with error:  %@", (uint8_t *)&v10, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __61__SGMessageEventDissector_dissectTextMessage_entity_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEnrichmentForEvents:toEntity:message:context:timingProcessingInMs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __63__SGMessageEventDissector_isDissectorProcessingWithinRateLimit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;

  v20 = a2;
  if (objc_msgSend((id)objc_opt_class(), "mobileAssetsEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("EventExtractionMessageProcessingLimit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("EventExtractionRateLimitInterval"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageProcessingLimit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rateLimitInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = v20[1];
  v8 = v20[2];
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  v11 = v10;
  objc_msgSend(v4, "doubleValue");
  if (v11 >= v12)
  {
    v13 = v9;

    v14 = v3;
    v7 = v13;
    v8 = v14;
  }
  if ((int)objc_msgSend(v8, "intValue") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intValue") - 1);
    v15 = objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v8 = (id)v15;
  }
  v16 = v20[1];
  v20[1] = v7;
  v17 = v7;

  v18 = v20[2];
  v20[2] = v8;
  v19 = v8;

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_18326 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_18326, &__block_literal_global_18327);
  return (id)sharedInstance__pasExprOnceResult_18328;
}

+ (BOOL)allowMessageEventDissector
{
  return objc_msgSend(MEMORY[0x1E0D198F0], "detectMessageEventsML");
}

+ (id)loadLazyPlistWithBasename:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("plplist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SGAsset regionAsset](SGAsset, "regionAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      +[SGAsset localeAsset](SGAsset, "localeAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filesystemPathForAssetDataRelativePath:", v3);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (v5)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", v5, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (v8)
      {
LABEL_13:

        v11 = v8;
        goto LABEL_14;
      }
      sgEventsLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
      }

    }
    else
    {
      sgEventsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "Unable to resolve path: %@", buf, 0xCu);
      }
    }
    v8 = 0;
    goto LABEL_13;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

+ (BOOL)featureEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)mobileAssetsEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)schemaOrgAndMissingEntitiesForExtractedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  BOOL v48;
  BOOL v49;
  char v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  __CFString *v121;
  __CFString *v122;
  __CFString *v123;
  __CFString *v124;
  __CFString *v125;
  void *v126;
  __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  _QWORD v138[3];
  _QWORD v139[2];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[4];
  _QWORD v143[4];
  _QWORD v144[4];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[4];
  _QWORD v152[4];
  _QWORD v153[4];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[5];
  _QWORD v159[5];
  _QWORD v160[4];
  _QWORD v161[4];
  _QWORD v162[3];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[6];
  _QWORD v166[6];
  uint8_t buf[4];
  void *v168;
  _QWORD v169[6];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[11];
  _QWORD v177[11];
  _QWORD v178[5];
  _QWORD v179[8];

  v179[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__CATEGORY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "messageEventCategoryForCategoryString:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__CATEGORY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("category"));

  switch((int)v6)
  {
    case 0:
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend((id)objc_opt_class(), "describeCategory:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Unsupported category: %@"), v10);
      v137 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      goto LABEL_124;
    case 1:
      v38 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(a1, "getFlightInformationForFlightEventData:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v38);
      if (!v14)
      {
        v13 = 0;
        v12 = 0;
LABEL_100:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65 && v135 && v15)
        {
          sgEventsLogHandle();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "describeCategory:", 1);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v168 = v105;
            _os_log_debug_impl(&dword_1C3607000, v82, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);

          }
          objc_msgSend((id)objc_opt_class(), "fallbackSchemaForGenericEventWithTitle:startDate:endDate:", v65, v135, v15);
          v83 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "describeCategory:", 6);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("category"));

          v13 = (void *)v83;
        }
        goto LABEL_120;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("carrierCode"));
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("carrierName"));
      v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("flightNumber"));
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v115 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureActualTime"));
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("arrivalActualTime"));
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureAirportName"));
      v114 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("arrivalAirportName"));
      v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureAirportCode"));
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("arrivalAirportCode"));
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureGate"));
      v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
      v123 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
      v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v39)
        v45 = v40 == 0;
      else
        v45 = 1;
      v48 = v45 || v41 == 0 || v42 == 0 || v43 == 0;
      v132 = (void *)v40;
      v136 = (void *)v44;
      v49 = v48 || v44 == 0;
      v50 = !v49;
      v116 = v50;
      v119 = (void *)v41;
      v120 = (void *)v39;
      v117 = (void *)v43;
      v118 = (void *)v42;
      if (v49)
      {
        v78 = (void *)objc_opt_class();
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v39, CFSTR("carrierCode"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v169[0] = v113;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v40, CFSTR("flightNumber"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v169[1] = v112;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v41, CFSTR("departureTime"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v169[2] = v57;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v42, CFSTR("arrivalTime"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v169[3] = v61;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v43, CFSTR("departureAirportCode"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v169[4] = v79;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v136, CFSTR("arrivalAirportCode"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v169[5] = v80;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 6);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "nilEntities:", v81);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v55 = (void *)v114;
        v62 = (void *)v115;
      }
      else
      {
        v178[0] = CFSTR("@context");
        v178[1] = CFSTR("@type");
        v179[0] = CFSTR("http://schema.org");
        v179[1] = CFSTR("http://schema.org/FlightReservation");
        v178[2] = CFSTR("reservationFor");
        v177[0] = CFSTR("http://schema.org/Flight");
        v176[0] = CFSTR("@type");
        v176[1] = CFSTR("airline");
        v174[0] = CFSTR("@type");
        v174[1] = CFSTR("iataCode");
        v175[0] = CFSTR("http://schema.org/Airline");
        v175[1] = v39;
        v174[2] = CFSTR("name");
        v51 = v121;
        if (!v121)
          v51 = &stru_1E7DB83A8;
        v175[2] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 3);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v177[1] = v113;
        v176[2] = CFSTR("arrivalAirport");
        v172[0] = CFSTR("@type");
        v172[1] = CFSTR("iataCode");
        v173[0] = CFSTR("http://schema.org/Airport");
        v173[1] = v44;
        v172[2] = CFSTR("name");
        v52 = v127;
        if (!v127)
          v52 = &stru_1E7DB83A8;
        v173[2] = v52;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 3);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v177[2] = v112;
        v177[3] = v42;
        v176[3] = CFSTR("arrivalTime");
        v176[4] = CFSTR("arrivalGate");
        v53 = v124;
        if (!v124)
          v53 = &stru_1E7DB83A8;
        v54 = v122;
        if (!v122)
          v54 = &stru_1E7DB83A8;
        v177[4] = v53;
        v177[5] = v54;
        v176[5] = CFSTR("arrivalTerminal");
        v176[6] = CFSTR("departureAirport");
        v170[0] = CFSTR("@type");
        v170[1] = CFSTR("iataCode");
        v171[0] = CFSTR("http://schema.org/Airport");
        v171[1] = v43;
        v170[2] = CFSTR("name");
        v55 = (void *)v114;
        if (v114)
          v56 = (const __CFString *)v114;
        else
          v56 = &stru_1E7DB83A8;
        v171[2] = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v177[6] = v57;
        v177[7] = v41;
        v176[7] = CFSTR("departureTime");
        v176[8] = CFSTR("departureGate");
        v58 = v125;
        if (!v125)
          v58 = &stru_1E7DB83A8;
        v59 = v123;
        if (!v123)
          v59 = &stru_1E7DB83A8;
        v177[8] = v58;
        v177[9] = v59;
        v176[9] = CFSTR("departureTerminal");
        v176[10] = CFSTR("flightNumber");
        v177[10] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 11);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)v60;
        v62 = (void *)v115;
        if (v115)
          v63 = (const __CFString *)v115;
        else
          v63 = &stru_1E7DB83A8;
        v179[2] = v60;
        v179[3] = v63;
        v178[3] = CFSTR("reservationId");
        v178[4] = CFSTR("reservationStatus");
        v179[4] = CFSTR("http://schema.org/ReservationConfirmed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }

      if ((v116 & 1) == 0)
        goto LABEL_100;
      goto LABEL_122;
    case 2:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v14 && v135 && v15 && v16 && v18)
      {
        v160[0] = CFSTR("@context");
        v160[1] = CFSTR("@type");
        v161[0] = CFSTR("http://schema.org");
        v161[1] = CFSTR("http://schema.org/BusReservation");
        v161[2] = CFSTR("http://schema.org/ReservationConfirmed");
        v160[2] = CFSTR("reservationStatus");
        v160[3] = CFSTR("reservationFor");
        v159[0] = CFSTR("http://schema.org/BusTrip");
        v158[0] = CFSTR("@type");
        v158[1] = CFSTR("departureBusStop");
        v130 = (void *)v19;
        v21 = v16;
        v156[0] = CFSTR("@type");
        v156[1] = CFSTR("name");
        v157[0] = CFSTR("http://schema.org/BusStop");
        v157[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
        v22 = objc_claimAutoreleasedReturnValue();
        v159[1] = v22;
        v159[2] = v15;
        v158[2] = CFSTR("departureTime");
        v158[3] = CFSTR("arrivalBusStop");
        v154[0] = CFSTR("@type");
        v154[1] = CFSTR("name");
        v155[0] = CFSTR("http://schema.org/BusStop");
        v155[1] = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v158[4] = CFSTR("arrivalTime");
        v159[3] = v23;
        v159[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v161[3] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v21;
        v20 = v130;
        goto LABEL_16;
      }
      if (!v19 || !v15 || !v16)
      {
        v85 = (void *)objc_opt_class();
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v14, CFSTR("departureBusStop"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v153[0] = v133;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v135, CFSTR("arrivalBusStop"));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v153[1] = v128;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v15, CFSTR("startDate"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v153[2] = v86;
        v126 = v16;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v16, CFSTR("endDate"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v153[3] = v87;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 4);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "nilEntities:", v88);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        sgEventsLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v168 = v108;
          _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);

        }
        v13 = 0;
        v16 = v126;
        goto LABEL_79;
      }
      sgEventsLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        goto LABEL_77;
      objc_msgSend((id)objc_opt_class(), "describeCategory:", 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v168 = v70;
      goto LABEL_128;
    case 3:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
      v27 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v27;
      if (v14 && v135 && v15 && v16 && v26)
      {
        v151[0] = CFSTR("@context");
        v151[1] = CFSTR("@type");
        v152[0] = CFSTR("http://schema.org");
        v152[1] = CFSTR("http://schema.org/TrainReservation");
        v152[2] = CFSTR("http://schema.org/ReservationConfirmed");
        v151[2] = CFSTR("reservationStatus");
        v151[3] = CFSTR("reservationFor");
        v150[0] = CFSTR("http://schema.org/TrainTrip");
        v149[0] = CFSTR("@type");
        v149[1] = CFSTR("departureStation");
        v131 = v5;
        v28 = v14;
        v29 = v15;
        v30 = (void *)v27;
        v31 = v16;
        v147[0] = CFSTR("@type");
        v147[1] = CFSTR("name");
        v148[0] = CFSTR("http://schema.org/TrainStation");
        v148[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, v147, 2);
        v22 = objc_claimAutoreleasedReturnValue();
        v150[1] = v22;
        v150[2] = v29;
        v149[2] = CFSTR("departureTime");
        v149[3] = CFSTR("arrivalStation");
        v145[0] = CFSTR("@type");
        v145[1] = CFSTR("name");
        v146[0] = CFSTR("http://schema.org/TrainStation");
        v146[1] = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v149[4] = CFSTR("arrivalTime");
        v150[3] = v23;
        v150[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v152[3] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v31;
        v20 = v30;
        v15 = v29;
        v14 = v28;
        v5 = v131;
LABEL_16:

LABEL_78:
        v12 = 0;
        goto LABEL_79;
      }
      if (v27 && v15 && v16)
      {
        sgEventsLogHandle();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "describeCategory:", 3);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v168 = v70;
LABEL_128:
          _os_log_debug_impl(&dword_1C3607000, v69, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);

        }
LABEL_77:

        objc_msgSend((id)objc_opt_class(), "fallbackSchemaForGenericEventWithTitle:startDate:endDate:", v20, v15, v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "describeCategory:", 6);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("category"));
        goto LABEL_78;
      }
      v89 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v14, CFSTR("departureStation"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v144[0] = v134;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v135, CFSTR("arrivalStation"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v144[1] = v90;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v15, CFSTR("startDate"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v144[2] = v91;
      v129 = v16;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v16, CFSTR("endDate"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v144[3] = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 4);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "nilEntities:", v93);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v168 = v109;
        _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);

      }
      v13 = 0;
      v16 = v129;
LABEL_79:

      goto LABEL_121;
    case 4:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__NAME"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v14 && v135 && v15 && v34)
      {
        v166[0] = CFSTR("http://schema.org");
        v166[1] = CFSTR("http://schema.org/LodgingReservation");
        v165[0] = CFSTR("@context");
        v165[1] = CFSTR("@type");
        v165[2] = CFSTR("checkinTime");
        v165[3] = CFSTR("checkoutTime");
        v166[2] = v135;
        v166[3] = v15;
        v166[4] = CFSTR("http://schema.org/ReservationConfirmed");
        v165[4] = CFSTR("reservationStatus");
        v165[5] = CFSTR("reservationFor");
        v163[0] = CFSTR("@type");
        v163[1] = CFSTR("name");
        v164[0] = CFSTR("http://schema.org/LodgingBusiness");
        v164[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
        v37 = objc_claimAutoreleasedReturnValue();
        v166[5] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_86:
        v12 = 0;
        goto LABEL_115;
      }
      if (v35 && v135 && v15)
      {
        sgEventsLogHandle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "describeCategory:", 4);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v168 = v106;
          _os_log_debug_impl(&dword_1C3607000, v71, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);

        }
        objc_msgSend((id)objc_opt_class(), "fallbackSchemaForGenericEventWithTitle:startDate:endDate:", v36, v135, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "describeCategory:", 6);
        v37 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("category"));
        goto LABEL_86;
      }
      v94 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v14, CFSTR("name"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v162[0] = v95;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v135, CFSTR("startDate"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v162[1] = v96;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v15, CFSTR("endDate"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v162[2] = v97;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 3);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "nilEntities:", v98);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v168 = v110;
        _os_log_error_impl(&dword_1C3607000, v37, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);

      }
      v13 = 0;
LABEL_115:

      goto LABEL_121;
    case 5:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__NAME"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v64;
      if (v14 && v135)
      {
        v142[0] = CFSTR("@context");
        v142[1] = CFSTR("@type");
        v143[0] = CFSTR("http://schema.org");
        v143[1] = CFSTR("http://schema.org/EventReservation");
        v143[2] = CFSTR("http://schema.org/ReservationConfirmed");
        v142[2] = CFSTR("reservationStatus");
        v142[3] = CFSTR("reservationFor");
        v140[0] = CFSTR("@type");
        v140[1] = CFSTR("name");
        v141[0] = CFSTR("http://schema.org/ScreeningEvent");
        v141[1] = v14;
        v140[2] = CFSTR("startDate");
        v141[2] = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 3);
        v66 = objc_claimAutoreleasedReturnValue();
        v143[3] = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_93:
        v12 = 0;
        goto LABEL_119;
      }
      if (v64 && v135 && v15)
      {
        sgEventsLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "describeCategory:", 5);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v168 = v107;
          _os_log_debug_impl(&dword_1C3607000, v72, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);

        }
        objc_msgSend((id)objc_opt_class(), "fallbackSchemaForGenericEventWithTitle:startDate:endDate:", v65, v135, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "describeCategory:", 6);
        v66 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("category"));
        goto LABEL_93;
      }
      v99 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v14, CFSTR("name"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v139[0] = v100;
      objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v135, CFSTR("startDate"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v139[1] = v101;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "nilEntities:", v102);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v168 = v111;
        _os_log_error_impl(&dword_1C3607000, v66, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);

      }
      v13 = 0;
LABEL_119:

LABEL_120:
LABEL_121:

LABEL_122:
      if (v13)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("schema"));
LABEL_124:
      if (v12)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("missingEntities"));

      }
LABEL_126:

      return v5;
    case 6:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__END_DATETIME"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_opt_class();
      v68 = v67;
      if (v14 && v135 && v15)
      {
        objc_msgSend(v67, "fallbackSchemaForGenericEventWithTitle:startDate:endDate:", v14, v135, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v14, CFSTR("name"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v138[0] = v73;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v135, CFSTR("startDate"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v138[1] = v74;
        objc_msgSend((id)objc_opt_class(), "tupleWithEntity:label:", v15, CFSTR("endDate"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v138[2] = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 3);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "nilEntities:", v76);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        sgEventsLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(", "));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v168 = v104;
          _os_log_error_impl(&dword_1C3607000, v77, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);

        }
        v13 = 0;
      }
      goto LABEL_121;
    default:
      v13 = 0;
      goto LABEL_126;
  }
}

+ (id)fallbackSchemaForGenericEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("@context");
  v16[1] = CFSTR("@type");
  v17[0] = CFSTR("http://schema.org");
  v17[1] = CFSTR("http://schema.org/EventReservation");
  v17[2] = CFSTR("http://schema.org/ReservationConfirmed");
  v16[2] = CFSTR("reservationStatus");
  v16[3] = CFSTR("reservationFor");
  v14[0] = CFSTR("@type");
  v14[1] = CFSTR("name");
  v15[0] = CFSTR("http://schema.org/Event");
  v15[1] = a3;
  v14[2] = CFSTR("startDate");
  v14[3] = CFSTR("endDate");
  v15[2] = a4;
  v15[3] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)enrichmentsFromSchema:(id)a3 forMessage:(id)a4 forEntity:(id)a5 category:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  SGPipelineEnrichment *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SGPipelineEnrichment *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend((id)objc_opt_class(), "messageEventCategoryForCategoryString:", v12);

  if ((v13 - 1) >= 5)
  {
    if (v13 == 6)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_opt_class();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("startDate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateFromString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_opt_class();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("endDate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dateFromString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v27 = 0;
      if (v23 && v26)
      {
        if (objc_msgSend(v23, "compare:", v26) == 1)
        {
          v27 = 0;
          v16 = 0;
        }
        else
        {
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("startDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("endDate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("GenericEvent|%@|%@|%@"), v20, v29, v30);
          v37 = v20;

          objc_msgSend(v11, "duplicateKey");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoEventWithGroupId:parentKey:", v36, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:]([SGPipelineEnrichment alloc], "initWithDuplicateKey:title:parent:", v35, v20, v11);
          v27 = 1;
          -[SGEntity setState:](v32, "setState:", 1);
          objc_msgSend(MEMORY[0x1E0D19940], "floatingRangeWithLocalStartDate:endDate:", v23, v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setTimeRange:](v32, "setTimeRange:", v33);
          -[SGEntity setTitle:](v32, "setTitle:", v37);
          objc_msgSend(v11, "creationTimestamp");
          -[SGPipelineEnrichment setCreationTimestamp:](v32, "setCreationTimestamp:");
          objc_msgSend(v11, "lastModifiedTimestamp");
          -[SGPipelineEnrichment setLastModifiedTimestamp:](v32, "setLastModifiedTimestamp:");
          objc_msgSend(MEMORY[0x1E0D197F0], "extractedEvent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v32, "addTag:", v34);

          v38 = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          v20 = v37;
        }
      }

      if (!v27)
      {
        v17 = 0;
        goto LABEL_4;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v14 = (void *)objc_opt_new();
    v39[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enrichmentsFromSchemas:inTextMessage:parentEntity:", v15, v10, v11);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = v16;
  v17 = v16;
LABEL_4:

  return v17;
}

+ (id)dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)tupleWithEntity:(id)a3 label:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D81638];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFirst:second:", v7, v6);

  return v8;
}

+ (id)nilEntities:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "first");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v10, "second");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "second");
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);
          }
          else
          {
            sgEventsLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v15 = 0;
              _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No name for missing entity", v15, 2u);
            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

+ (unsigned)messageEventCategoryForCategoryString:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Flight")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bus")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Train")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hotel")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GenericEvent")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)describeCategory:(unsigned __int8)a3
{
  if (a3 > 6u)
    return CFSTR("Unknown");
  else
    return off_1E7DAE650[a3];
}

+ (id)getFlightInformationForFlightEventData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id obj;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  NSObject *log;
  uint64_t v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EventMetaDataExtractor_ML_EVENT__START_DATETIME"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("carrierCode"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservationId"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)v6;
  if (!v6 || !v98 || !v97)
  {
    sgEventsLogHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, log, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: airlineCode or flightNumber or departureDateTime not found, bailing", buf, 2u);
    }
    v20 = 0;
    goto LABEL_88;
  }
  v92 = v3;
  v7 = objc_opt_new();
  -[NSObject setDateFormat:](v7, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setTimeZone:](v7, "setTimeZone:", v8);

  objc_msgSend(a1, "dateFromString:", v97);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  log = v7;
  -[NSObject stringFromDate:](v7, "stringFromDate:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v93 = (void *)objc_opt_new();
  v107 = (void *)v10;
  objc_msgSend(v93, "flightInformationWithAirlineCode:flightNumber:flightDate:", v95, v98, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    sgEventsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No flight information found, bailing", buf, 2u);
    }
    v20 = 0;
    goto LABEL_87;
  }
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("legs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 == 1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("legs"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = 0;
      v19 = 0;
      goto LABEL_51;
    }
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v21 = v11;
  v102 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
  if (!v102)
  {

    v18 = 0;
    v19 = 0;
    v108 = 0;
    v15 = 0;
    goto LABEL_83;
  }
  obj = v21;
  v15 = 0;
  v108 = 0;
  v19 = 0;
  v99 = *(_QWORD *)v120;
  v100 = v11;
  v110 = v5;
  v101 = v4;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v120 != v99)
        objc_enumerationMutation(obj);
      v109 = v15;
      v103 = v22;
      v23 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v22);

      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v104 = v23;
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("legs"));
      v105 = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
      if (!v24)
      {
        v19 = 0;
        goto LABEL_39;
      }
      v25 = v24;
      v19 = 0;
      v113 = *(_QWORD *)v116;
      do
      {
        v26 = 0;
        do
        {
          v27 = v19;
          if (*(_QWORD *)v116 != v113)
            objc_enumerationMutation(v105);
          v28 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v26);
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("departureAirport"), v92);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("departureActualTime"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "dateFromString:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject stringFromDate:](log, "stringFromDate:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("code"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "isEqualToString:", v34) & 1) != 0)
          {
            v35 = objc_msgSend(v33, "isEqualToString:", v107);

            if (v35)
              goto LABEL_26;
          }
          else
          {
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("city"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v5, "isEqualToString:", v36) & 1) != 0)
            {
              v37 = objc_msgSend(v33, "isEqualToString:", v107);

              if ((v37 & 1) != 0)
              {
LABEL_26:
                v38 = v108;
                v39 = v109;
                v108 = v28;
                v109 = v104;
                v40 = v27;
LABEL_30:

                v19 = v38;
LABEL_31:
                v41 = v28;

                v19 = v40;
                goto LABEL_32;
              }
            }
            else
            {

            }
          }
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("code"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v106, "isEqualToString:", v39) & 1) != 0)
          {
            v38 = v27;
            v40 = v28;
            goto LABEL_30;
          }
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("city"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v106, "isEqualToString:", v42);

          v40 = v28;
          v19 = v27;
          if ((v43 & 1) != 0)
            goto LABEL_31;
LABEL_32:

          ++v26;
          v5 = v110;
        }
        while (v25 != v26);
        v44 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
        v25 = v44;
      }
      while (v44);
LABEL_39:

      v15 = v109;
      if (v109 && v108)
      {

        v11 = v100;
        v4 = v101;
        goto LABEL_49;
      }
      v22 = v103 + 1;
      v11 = v100;
      v4 = v101;
    }
    while (v103 + 1 != v102);
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
  }
  while (v102);

  if (!v108)
  {
    v18 = 0;
    v108 = 0;
    goto LABEL_83;
  }
LABEL_49:
  v18 = (void *)objc_msgSend(v108, "mutableCopy", v92);
  if (v19)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v45, CFSTR("arrivalAirport"));

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalActualTime"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v46, CFSTR("arrivalActualTime"));

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v47, CFSTR("arrivalGate"));

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v48, CFSTR("arrivalTerminal"));

  }
LABEL_51:
  if (v15 && v18)
  {
    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("carrierCode"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 != v50)
    {
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("carrierCode"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, CFSTR("carrierCode"));

    }
    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("carrierName"), v92);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52 != v53)
    {
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("carrierName"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("carrierName"));

    }
    -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("flightNumber"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55 != v56)
    {
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("flightNumber"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, CFSTR("flightNumber"));

    }
    if (v94)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, CFSTR("reservationId"));
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureActualTime"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58 != v59)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureActualTime"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("departureActualTime"));

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalActualTime"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61 != v62)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalActualTime"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v63, CFSTR("arrivalActualTime"));

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureGate"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64 != v65)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureGate"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, CFSTR("departureGate"));

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67 != v68)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v69, CFSTR("arrivalGate"));

    }
    v114 = v19;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70 != v71)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, CFSTR("departureTerminal"));

    }
    v73 = v15;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74 != v75)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, CFSTR("arrivalTerminal"));

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("departureAirport"));
    v77 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("name"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79 != v80)
    {
      -[NSObject objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("name"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v81, CFSTR("departureAirportName"));

    }
    objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("name"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82 != v83)
    {
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("name"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v84, CFSTR("arrivalAirportName"));

    }
    -[NSObject objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("code"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85 != v86)
    {
      -[NSObject objectForKeyedSubscript:](v77, "objectForKeyedSubscript:", CFSTR("code"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v87, CFSTR("departureAirportCode"));

    }
    objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("code"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88 != v89)
    {
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("code"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v90, CFSTR("arrivalAirportCode"));

    }
    v20 = v4;

    v15 = v73;
    v19 = v114;
    goto LABEL_86;
  }
LABEL_83:
  sgEventsLogHandle();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    v124 = v107;
    v125 = 2113;
    v126 = v5;
    _os_log_error_impl(&dword_1C3607000, v77, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No flight information for departure date:%{private}@ & departureLocation:%{private}@ found, bailing", buf, 0x16u);
  }
  v20 = 0;
LABEL_86:

LABEL_87:
  v3 = v92;

LABEL_88:
  return v20;
}

+ (void)logMLMessageEventExtractionInteractions:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v5;
  objc_msgSend(v5, "enrichments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v12, "duplicateKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entityType");
        if (SGEntityTypeIsEvent())
        {
          v15 = objc_msgSend(v12, "isNaturalLanguageEvent");

          if ((v15 & 1) != 0)
            goto LABEL_16;
          v16 = objc_msgSend(v6, "backpressureHazard");
          if (v16 == 1)
            v17 = 12;
          else
            v17 = 0;
          if (v16)
            v18 = v17;
          else
            v18 = 13;
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMLMessageEventInteractionForEntity:interface:actionType:", v12, 0, v18);
        }

LABEL_16:
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

+ (id)loadEventClassifierModelFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v3);
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setComputeUnits:", 0);
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v4, v5, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v6)
    {
      v14 = v7;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE158]), "initWithMLModel:error:", v6, &v14);
      v9 = v14;

      if (v8)
      {
        v10 = v8;
        v11 = v10;
      }
      else
      {
        sgEventsLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to convert ML Model to NL Model: %@", buf, 0xCu);
        }

        v10 = 0;
        v11 = 0;
      }
    }
    else
    {
      sgEventsLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model: %@", buf, 0xCu);
      }
      v11 = 0;
      v9 = v7;
    }

  }
  else
  {
    sgEventsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model. Model Path does not exist", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

void __41__SGMessageEventDissector_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = -[SGMessageEventDissector _init]([SGMessageEventDissector alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_18328;
  sharedInstance__pasExprOnceResult_18328 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
