@implementation AFOpportuneSpeakingModelFeedbackManager

- (AFOpportuneSpeakingModelFeedbackManager)init
{
  AFOpportuneSpeakingModelFeedbackManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *usageEventsBySpeakableId;
  uint64_t v5;
  _DKKnowledgeQuerying *knowledgeStore;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AFOpportuneSpeakingModelFeedbackManager;
  v2 = -[AFOpportuneSpeakingModelFeedbackManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    usageEventsBySpeakableId = v2->_usageEventsBySpeakableId;
    v2->_usageEventsBySpeakableId = v3;

    objc_msgSend(get_DKKnowledgeStoreClass_18986(), "knowledgeStore");
    v5 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v5;

    if (!v2->_knowledgeStore)
    {
      v7 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[AFOpportuneSpeakingModelFeedbackManager init]";
        _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Error obtaining CoreDuet knowledge store.", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (id)lastNegativeFeedbackForContact:(id)a3
{
  id v4;
  uint64_t v5;
  AFOpportuneSpeakingModelFeedback *feedback;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFOpportuneSpeakingModelFeedbackManager loadIfNecessary](self, "loadIfNecessary");
  v5 = objc_msgSend(v4, "length");
  feedback = self->_feedback;
  if (v5)
  {
    -[AFOpportuneSpeakingModelFeedback negativeFeedbackByContact](feedback, "negativeFeedbackByContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AFOpportuneSpeakingModelFeedback lastNegativeFeedback](feedback, "lastNegativeFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = AFSiriLogContextService;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "-[AFOpportuneSpeakingModelFeedbackManager lastNegativeFeedbackForContact:]";
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (void)setLastNegativeFeedbackForContact:(id)a3
{
  id v4;
  NSObject *v5;
  AFOpportuneSpeakingModelFeedback *v6;
  AFOpportuneSpeakingModelFeedback *feedback;
  void *v8;
  uint64_t v9;
  AFOpportuneSpeakingModelFeedback *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextService;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315394;
    v14 = "-[AFOpportuneSpeakingModelFeedbackManager setLastNegativeFeedbackForContact:]";
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s contact: %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_feedback)
  {
    v6 = objc_alloc_init(AFOpportuneSpeakingModelFeedback);
    feedback = self->_feedback;
    self->_feedback = v6;

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "length");
  v10 = self->_feedback;
  if (v9)
  {
    -[AFOpportuneSpeakingModelFeedback negativeFeedbackByContact](v10, "negativeFeedbackByContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setObject:forKey:", v8, v4);
    -[AFOpportuneSpeakingModelFeedback setNegativeFeedbackByContact:](self->_feedback, "setNegativeFeedbackByContact:", v12);

  }
  else
  {
    -[AFOpportuneSpeakingModelFeedback setLastNegativeFeedback:](v10, "setLastNegativeFeedback:", v8);
  }
  -[AFOpportuneSpeakingModelFeedbackManager save](self, "save");

}

- (void)fetchNotificationUsageForSpeakableId:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id DKEventQueryClass_18946;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __objc2_class *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  __objc2_class *v36;
  id v37;
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
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  AFOpportuneSpeakingModelFeedbackManager *v60;
  uint64_t v61;
  id v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(get_DKSystemEventStreamsClass_18937(), "notificationUsageStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(get_DKQueryClass_18941(), "predicateForEventsWithStartInDateRangeFrom:to:", v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v16 = objc_claimAutoreleasedReturnValue();
    DKEventQueryClass_18946 = get_DKEventQueryClass_18946();
    v77[0] = v14;
    v60 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v16;
    v76 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(DKEventQueryClass_18946, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v15, v18, 0, 100, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v20;
    knowledgeStore = v60->_knowledgeStore;
    v68 = 0;
    -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v20, &v68);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v68;
    v59 = v24;
    if (v24 || !v23)
    {
      v51 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v70 = "-[AFOpportuneSpeakingModelFeedbackManager fetchNotificationUsageForSpeakableId:withStartDate:withEndDate:withHandler:]";
        v71 = 2112;
        v72 = v23;
        v73 = 2112;
        v74 = v24;
        _os_log_error_impl(&dword_19AF50000, v51, OS_LOG_TYPE_ERROR, "%s Error querying CoreDuet with %@: %@", buf, 0x20u);
      }
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
      v49 = v58;
    }
    else
    {
      v53 = v21;
      v54 = v15;
      v55 = v14;
      v56 = v12;
      v57 = v11;
      v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v52 = v23;
      obj = v23;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      if (v25)
      {
        v26 = v25;
        v27 = _AFHomeAnnouncementSnapshotMutation;
        v28 = *(_QWORD *)v65;
        v61 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v65 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v30, "metadata");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(((id (__cdecl *)())v27[81].vtable)(), "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v33, "isEqualToString:", v10))
            {
              v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v30, "value");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "stringValue");
              v36 = v27;
              v37 = v10;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v38, CFSTR("EventType"));

              v39 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v30, "startDate");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "timeIntervalSinceReferenceDate");
              objc_msgSend(v39, "numberWithDouble:");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v41, CFSTR("StartDate"));

              v42 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v30, "endDate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "timeIntervalSinceReferenceDate");
              objc_msgSend(v42, "numberWithDouble:");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v44, CFSTR("EndDate"));

              objc_msgSend(v30, "timeZone");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "name");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v46, CFSTR("TimeZone"));

              v10 = v37;
              v27 = v36;
              v28 = v61;

              v47 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v30, "confidence");
              objc_msgSend(v47, "numberWithDouble:");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v48, CFSTR("Confidence"));

              objc_msgSend(v62, "addObject:", v34);
            }

          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        }
        while (v26);
      }

      -[NSMutableDictionary setObject:forKey:](v60->_usageEventsBySpeakableId, "setObject:forKey:", v62, v10);
      (*((void (**)(id, id, uint64_t))v13 + 2))(v13, v62, 1);

      v12 = v56;
      v11 = v57;
      v15 = v54;
      v14 = v55;
      v49 = v58;
      v23 = v52;
      v21 = v53;
    }

  }
  else
  {
    v50 = AFSiriLogContextService;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v70 = "-[AFOpportuneSpeakingModelFeedbackManager fetchNotificationUsageForSpeakableId:withStartDate:withEndDate:withHandler:]";
      _os_log_error_impl(&dword_19AF50000, v50, OS_LOG_TYPE_ERROR, "%s Error obtaining notificationUsageStream from CoreDuet.", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

- (BOOL)interactionDetectedForSpeakableId:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_usageEventsBySpeakableId, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKey:", CFSTR("EventType"), (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && (objc_msgSend(v10, "isEqualToString:", CFSTR("IndirectClear")) & 1) != 0)
          {

            v12 = 1;
            goto LABEL_14;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_14:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)loadIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  AFOpportuneSpeakingModelFeedback *v8;
  AFOpportuneSpeakingModelFeedback *feedback;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_feedback)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    AFOpportuneSpeakingModelFeedbackPath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) != 0)
    {
      v12 = 0;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 2, &v12);
      v6 = v12;
      if (v6 || !v5)
      {
        v11 = AFSiriLogContextService;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[AFOpportuneSpeakingModelFeedbackManager loadIfNecessary]";
          v15 = 2112;
          v16 = v6;
          _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Error reading data: %@", buf, 0x16u);
        }
      }
      else
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
        objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
        v8 = (AFOpportuneSpeakingModelFeedback *)objc_claimAutoreleasedReturnValue();
        feedback = self->_feedback;
        self->_feedback = v8;

        objc_msgSend(v7, "finishDecoding");
      }

    }
    else
    {
      v10 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[AFOpportuneSpeakingModelFeedbackManager loadIfNecessary]";
        _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s No feedback persisted", buf, 0xCu);
      }
    }

  }
}

- (void)save
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  AFOpportuneSpeakingModelFeedback *v7;
  AFOpportuneSpeakingModelFeedback *feedback;
  void *v9;
  AFOpportuneSpeakingModelFeedback *v10;
  char v11;
  NSObject *v12;
  AFOpportuneSpeakingModelFeedback *v13;
  NSObject *v14;
  NSObject *v15;
  AFOpportuneSpeakingModelFeedback *v16;
  AFOpportuneSpeakingModelFeedback *v17;
  AFOpportuneSpeakingModelFeedback *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  AFOpportuneSpeakingModelFeedback *v23;
  __int16 v24;
  AFOpportuneSpeakingModelFeedback *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_feedback)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    AFOpportuneSpeakingModelFeedbackPath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v19);
    v7 = (AFOpportuneSpeakingModelFeedback *)v19;

    if ((v6 & 1) != 0)
    {
      feedback = self->_feedback;
      v18 = v7;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", feedback, 1, &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;

      if (v9)
      {
        v17 = v10;
        v11 = objc_msgSend(v9, "writeToFile:options:error:", v4, 1, &v17);
        v7 = v17;

        if ((v11 & 1) == 0)
        {
          v12 = AFSiriLogContextService;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
          {
            v13 = self->_feedback;
            *(_DWORD *)buf = 136315650;
            v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
            v22 = 2112;
            v23 = v13;
            v24 = 2112;
            v25 = v7;
            _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Failed to save feedback to disk %@: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        v15 = AFSiriLogContextService;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
        {
          v16 = self->_feedback;
          *(_DWORD *)buf = 136315650;
          v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
          v22 = 2112;
          v23 = v16;
          v24 = 2112;
          v25 = v10;
          _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Failed to archive feedback %@: %@", buf, 0x20u);
        }
        v7 = v10;
      }

    }
    else
    {
      v14 = AFSiriLogContextService;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[AFOpportuneSpeakingModelFeedbackManager save]";
        v22 = 2112;
        v23 = v7;
        _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Error creating directory: %@", buf, 0x16u);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageEventsBySpeakableId, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
}

@end
