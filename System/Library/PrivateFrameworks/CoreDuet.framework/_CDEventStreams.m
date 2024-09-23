@implementation _CDEventStreams

+ (id)eventStreamPropertiesForKBName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_eventStreamForName:orKBName:", 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "eventStreamProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance__sharedContextStoreEvents;
}

- (id)_eventStreamForName:(id)a3 orKBName:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  _CDEventStreams *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  id *p_isa;
  id v43;
  id obj;
  id v45;
  id v46;
  BOOL v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  BOOL v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__1;
  v73 = __Block_byref_object_dispose__1;
  v74 = 0;
  v8 = self;
  objc_sync_enter(v8);
  v48 = (void *)v6;
  v49 = (void *)v7;
  v47 = (v6 | v7) == 0;
  p_isa = (id *)&v8->super.isa;
  if (v6 | v7)
  {
    if (v6)
    {
      -[NSDictionary objectForKeyedSubscript:](v8->_allEventStreams, "objectForKeyedSubscript:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v70[5];
      v70[5] = v9;

    }
    else
    {
      if (!v7)
        goto LABEL_12;
      -[NSDictionary objectForKeyedSubscript:](v8->_allKBEventStreams, "objectForKeyedSubscript:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v70[5];
      v70[5] = v11;

    }
    v13 = (void *)v70[5];
    if (v13)
    {
      v43 = v13;
      goto LABEL_11;
    }
  }
  else
  {
    if (-[_CDEventStreams allStreamsLoaded](v8, "allStreamsLoaded"))
    {
      v43 = 0;
LABEL_11:
      v14 = 1;
      goto LABEL_60;
    }
    -[_CDEventStreams setAllStreamsLoaded:](v8, "setAllStreamsLoaded:", 1);
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDPaths eventPlistPath](_CDPaths, "eventPlistPath");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "addObject:", v16);
  }
  else
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[_CDEventStreams _eventStreamForName:orKBName:].cold.1(v17);

    v16 = 0;
  }
  v41 = (void *)v16;
  v46 = p_isa[2];
  v45 = p_isa[3];
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v15;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v18)
  {
    v52 = 0;
    v50 = *(_QWORD *)v66;
    while (2)
    {
      v19 = 0;
      v51 = v18;
      do
      {
        if (*(_QWORD *)v66 != v50)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfFile:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          +[_CDPaths eventPlistPath](_CDPaths, "eventPlistPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v20, "isEqualToString:", v23);

          if (v24)
          {
            v64 = 0u;
            v62 = 0u;
            v63 = 0u;
            v61 = 0u;
            v25 = v22;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v62;
              while (2)
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v62 != v27)
                    objc_enumerationMutation(v25);
                  v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                  objc_msgSend(v29, "objectForKeyedSubscript:", kCDESPEventNameKey);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Default"));

                  if (v31)
                  {
                    +[_CDEventStreamProperties eventStreamPropertiesFromDictionary:](_CDEventStreamProperties, "eventStreamPropertiesFromDictionary:", v29);
                    v33 = objc_claimAutoreleasedReturnValue();

                    v52 = (id)v33;
                    goto LABEL_37;
                  }
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
                if (v26)
                  continue;
                break;
              }
            }
LABEL_37:

            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 'Default'"), kCDESPEventNameKey);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "filterUsingPredicate:", v34);

          }
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __48___CDEventStreams__eventStreamForName_orKBName___block_invoke;
          v53[3] = &unk_1E26E3278;
          v60 = v47;
          v54 = v48;
          v55 = v49;
          v52 = v52;
          v56 = v52;
          v57 = v46;
          v58 = v45;
          v59 = &v69;
          objc_msgSend(v22, "enumerateObjectsUsingBlock:", v53);
          v35 = (void *)v70[5];
          if (v35)
          {
            v43 = v35;
            v14 = 1;
          }
          else
          {
            v14 = 0;
          }

          v32 = v54;
        }
        else
        {
          +[_CDLogging contextChannel](_CDLogging, "contextChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v20;
            _os_log_error_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_ERROR, "Unable to load plist from path: %@", buf, 0xCu);
          }
          v14 = 3;
        }

        objc_autoreleasePoolPop(v21);
        if (v14 != 3 && v14)
        {

          goto LABEL_59;
        }
        ++v19;
      }
      while (v19 != v51);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v52 = 0;
  }

  v36 = v47;
  if (v70[5])
    v36 = 1;
  if ((v36 & 1) == 0)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v76 = v48;
      v77 = 2112;
      v78 = v49;
      _os_log_impl(&dword_18DDBE000, v37, OS_LOG_TYPE_DEFAULT, "unable to find stream (%@, %@) in event stream plists.", buf, 0x16u);
    }

    +[_CDEventStream eventStreamWithProperties:](_CDEventStream, "eventStreamWithProperties:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v70[5];
    v70[5] = v38;

    if (v48)
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v70[5], v48);
    if (v49)
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v70[5]);
  }
  v14 = 0;
LABEL_59:

LABEL_60:
  objc_sync_exit(p_isa);

  if (!v14)
    v43 = (id)v70[5];
  _Block_object_dispose(&v69, 8);

  return v43;
}

+ (id)privacyPolicyForEventStreamName:(id)a3
{
  id v3;
  id v4;
  _CDPrivacyPolicy *v5;
  _CDPrivacyPolicy *v6;
  _CDPrivacyPolicy *v7;
  int v8;
  void *v9;
  _CDPrivacyPolicy *v10;
  double v11;

  v3 = a3;
  if (privacyPolicyForEventStreamName__onceToken != -1)
    dispatch_once(&privacyPolicyForEventStreamName__onceToken, &__block_literal_global_16);
  v4 = (id)privacyPolicyForEventStreamName__policies;
  objc_sync_enter(v4);
  objc_msgSend((id)privacyPolicyForEventStreamName__policies, "objectForKeyedSubscript:", v3);
  v5 = (_CDPrivacyPolicy *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "eventStreamPropertiesForKBName:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [_CDPrivacyPolicy alloc];
      objc_msgSend(v9, "temporalPrecision");
      v7 = -[_CDPrivacyPolicy initWithTemporalPrecision:canPersistOnStorage:](v10, "initWithTemporalPrecision:canPersistOnStorage:", objc_msgSend(v9, "isHistorical"), v11);
      objc_msgSend((id)privacyPolicyForEventStreamName__policies, "setObject:forKeyedSubscript:", v7, v3);
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 1;
    }

  }
  objc_sync_exit(v4);

  if (!v8)
    v6 = v7;

  return v6;
}

+ (id)rateLimiterForEventStreamName:(id)a3
{
  id v3;
  id v4;
  _CDRateAndTotalLimiter *v5;
  _CDRateAndTotalLimiter *v6;
  _CDRateAndTotalLimiter *v7;
  int v8;
  void *v9;
  _CDRateAndTotalLimiter *v10;
  uint64_t v11;
  double v12;

  v3 = a3;
  if (rateLimiterForEventStreamName__onceToken != -1)
    dispatch_once(&rateLimiterForEventStreamName__onceToken, &__block_literal_global_14);
  v4 = (id)rateLimiterForEventStreamName__policies;
  objc_sync_enter(v4);
  objc_msgSend((id)rateLimiterForEventStreamName__policies, "objectForKeyedSubscript:", v3);
  v5 = (_CDRateAndTotalLimiter *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "eventStreamPropertiesForKBName:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [_CDRateAndTotalLimiter alloc];
      v11 = objc_msgSend(v9, "eventsPerPeriod");
      objc_msgSend(v9, "period");
      v7 = -[_CDRateAndTotalLimiter initWithCount:perPeriod:totalCountLimit:](v10, "initWithCount:perPeriod:totalCountLimit:", v11, objc_msgSend(v9, "eventCountLimit"), v12);
      objc_msgSend((id)rateLimiterForEventStreamName__policies, "setObject:forKeyedSubscript:", v7, v3);
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 1;
    }

  }
  objc_sync_exit(v4);

  if (!v8)
    v6 = v7;

  return v6;
}

- (_CDEventStreams)init
{
  _CDEventStreams *v2;
  uint64_t v3;
  NSDictionary *allEventStreams;
  uint64_t v5;
  NSDictionary *allKBEventStreams;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CDEventStreams;
  v2 = -[_CDEventStreams init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    allEventStreams = v2->_allEventStreams;
    v2->_allEventStreams = (NSDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    allKBEventStreams = v2->_allKBEventStreams;
    v2->_allKBEventStreams = (NSDictionary *)v5;

  }
  return v2;
}

+ (void)loadAllEventStreams
{
  id v2;
  id v3;

  +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "_eventStreamForName:orKBName:", 0, 0);

}

- (void)setAllEventStreams:(id)a3
{
  objc_storeStrong((id *)&self->_allEventStreams, a3);
}

- (NSDictionary)allEventStreams
{
  objc_msgSend((id)objc_opt_class(), "loadAllEventStreams");
  return self->_allEventStreams;
}

- (void)setAllKBEventStreams:(id)a3
{
  objc_storeStrong((id *)&self->_allKBEventStreams, a3);
}

- (NSDictionary)allKBEventStreams
{
  objc_msgSend((id)objc_opt_class(), "loadAllEventStreams");
  return self->_allKBEventStreams;
}

+ (id)eventStreamForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_eventStreamForName:orKBName:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)eventStreamPropertiesForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_eventStreamForName:orKBName:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "eventStreamProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)eventStreamPropertiesForEventStream:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventStreamPropertiesForKBName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ephemeralitySchedule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[_CDEventStreams sharedInstance](_CDEventStreams, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v2;
  objc_msgSend(v2, "allKBEventStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "eventStreamProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "knowledgeBaseName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "eventStreamProperties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeToLive");
          v15 = v14;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)allStreamsLoaded
{
  return self->_allStreamsLoaded;
}

- (void)setAllStreamsLoaded:(BOOL)a3
{
  self->_allStreamsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKBEventStreams, 0);
  objc_storeStrong((id *)&self->_allEventStreams, 0);
}

- (void)_eventStreamForName:(os_log_t)log orKBName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18DDBE000, log, OS_LOG_TYPE_FAULT, "Unable to determine system event stream plist path.", v1, 2u);
}

@end
