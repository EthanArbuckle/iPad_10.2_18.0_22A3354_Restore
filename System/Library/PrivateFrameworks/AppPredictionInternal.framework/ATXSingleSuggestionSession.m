@implementation ATXSingleSuggestionSession

- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXSingleSuggestionSession *v16;
  uint64_t v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v10, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  objc_msgSend(v12, "addObject:", v9);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  LOBYTE(v18) = 0;
  v16 = -[ATXSingleSuggestionSession initWithTrackedProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:sessionExpirationDate:completed:](self, "initWithTrackedProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:sessionExpirationDate:completed:", v10, v8, v11, v14, v12, v15, 0, v18);

  return v16;
}

- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8 sessionExpirationDate:(id)a9 completed:(BOOL)a10
{
  id v17;
  id v18;
  ATXSingleSuggestionSession *v19;
  ATXSingleSuggestionSession *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXSingleSuggestionSession;
  v19 = -[ATXSingleSuggestionSession init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestion, a3);
    objc_storeStrong((id *)&v20->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v20->_matchingSuggestionUUIDs, a5);
    objc_storeStrong((id *)&v20->_associatedBlendingCacheUUIDs, a6);
    objc_storeStrong((id *)&v20->_associatedClientModelCacheUUIDs, a7);
    objc_storeStrong((id *)&v20->_sessionContextStatusByConsumerSubType, a8);
    objc_storeStrong((id *)&v20->_sessionExpirationDate, a9);
    v20->_completed = a10;
  }

  return v20;
}

- (BOOL)tryUpdateSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSMutableDictionary *sessionContextStatusByConsumerSubType;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sessionContextStatusByConsumerSubType, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v7 = (void *)objc_msgSend(v7, "unsignedIntegerValue");
  if (a3 && !v7 || (v9 = 0, a3 >= 2) && v7 == (void *)1)
  {
    sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](sessionContextStatusByConsumerSubType, "setObject:forKey:", v11, v6);

    v9 = 1;
  }

  return v9;
}

- (void)enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *sessionContextStatusByConsumerSubType;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__ATXSingleSuggestionSession_enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock___block_invoke;
  v7[3] = &unk_1E82DE430;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionContextStatusByConsumerSubType, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __98__ATXSingleSuggestionSession_enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", a2, 0))
  {
    objc_msgSend(v5, "unsignedIntegerValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)stringForSuggestionSessionStatus:(unint64_t)a3
{
  id result;
  NSObject *v4;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("shown");
      break;
    case 2uLL:
      result = CFSTR("engaged");
      break;
    case 3uLL:
      result = CFSTR("dismissed");
      break;
    case 4uLL:
      __atxlog_handle_feedback();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXSingleSuggestionSession stringForSuggestionSessionStatus:].cold.1(v4);

      result = CFSTR("max");
      break;
    default:
      result = CFSTR("not shown");
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXProactiveSuggestion *suggestion;
  id v5;

  suggestion = self->_suggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestion, CFSTR("suggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feedbackMetadata, CFSTR("feedbackMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSuggestionUUIDs, CFSTR("matchingSuggestionUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedBlendingCacheUUIDs, CFSTR("blendingUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedClientModelCacheUUIDs, CFSTR("clientUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionContextStatusByConsumerSubType, CFSTR("sessionStatuses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionExpirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_completed, CFSTR("completed"));

}

- (ATXSingleSuggestionSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  ATXSingleSuggestionSession *v45;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  ATXSingleSuggestionSession *v50;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("suggestion"), v4, 1, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v50 = self;
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_metrics();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("feedbackMetadata"), v4, 0, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v11);
    v49 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D81610];
    v13 = (void *)MEMORY[0x1CAA48B6C]();
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v13);
    __atxlog_handle_metrics();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("matchingSuggestionUUIDs"), v4, 1, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = (void *)MEMORY[0x1CAA48B6C]();
      v21 = objc_alloc(MEMORY[0x1E0C99E60]);
      v22 = objc_opt_class();
      v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v20);
      __atxlog_handle_metrics();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v23, CFSTR("blendingUUIDs"), v4, 1, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = (void *)MEMORY[0x1E0D81610];
        v27 = (void *)MEMORY[0x1CAA48B6C]();
        v28 = objc_alloc(MEMORY[0x1E0C99E60]);
        v29 = objc_opt_class();
        v30 = (void *)objc_msgSend(v28, "initWithObjects:", v29, objc_opt_class(), 0);
        objc_autoreleasePoolPop(v27);
        __atxlog_handle_metrics();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("clientUUIDs"), v4, 1, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v48 = (void *)MEMORY[0x1E0D81610];
          v33 = (void *)MEMORY[0x1CAA48B6C]();
          v34 = objc_alloc(MEMORY[0x1E0C99E60]);
          v35 = objc_opt_class();
          v36 = objc_opt_class();
          v37 = (void *)objc_msgSend(v34, "initWithObjects:", v35, v36, objc_opt_class(), 0);
          objc_autoreleasePoolPop(v33);
          __atxlog_handle_metrics();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v37, CFSTR("sessionStatuses"), v4, 1, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v40 = (void *)MEMORY[0x1E0D81610];
            v41 = objc_opt_class();
            __atxlog_handle_metrics();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v41, CFSTR("expirationDate"), v4, 0, CFSTR("com.apple.ATXPushPullSessionContext"), -1, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v47) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));
            v44 = (void *)v49;
            self = -[ATXSingleSuggestionSession initWithTrackedProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:sessionExpirationDate:completed:](v50, "initWithTrackedProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:sessionExpirationDate:completed:", v8, v49, v18, v25, v32, v39, v43, v47);

            v45 = self;
          }
          else
          {
            v45 = 0;
            v44 = (void *)v49;
            self = v50;
          }

        }
        else
        {
          v45 = 0;
          v44 = (void *)v49;
          self = v50;
        }

      }
      else
      {
        v45 = 0;
        v44 = (void *)v49;
      }

    }
    else
    {
      v45 = 0;
      v44 = (void *)v49;
    }

  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (BOOL)isEqual:(id)a3
{
  ATXSingleSuggestionSession *v4;
  ATXSingleSuggestionSession *v5;
  BOOL v6;

  v4 = (ATXSingleSuggestionSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSingleSuggestionSession isEqualToATXSingleSuggestionSession:](self, "isEqualToATXSingleSuggestionSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXSingleSuggestionSession:(id)a3
{
  id *v4;
  ATXProactiveSuggestion *suggestion;
  ATXProactiveSuggestion *v6;
  ATXProactiveSuggestion *v7;
  ATXProactiveSuggestion *v8;
  char v9;
  NSData *feedbackMetadata;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  char v14;
  NSMutableOrderedSet *matchingSuggestionUUIDs;
  NSMutableOrderedSet *v16;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *v18;
  char v19;
  NSMutableOrderedSet *associatedBlendingCacheUUIDs;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *v22;
  NSMutableOrderedSet *v23;
  char v24;
  NSMutableOrderedSet *associatedClientModelCacheUUIDs;
  NSMutableOrderedSet *v26;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *v28;
  char v29;
  NSMutableDictionary *sessionContextStatusByConsumerSubType;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  char v34;
  NSDate *sessionExpirationDate;
  NSDate *v36;
  NSDate *v37;
  NSDate *v38;
  char v39;
  BOOL v40;

  v4 = (id *)a3;
  suggestion = self->_suggestion;
  v6 = (ATXProactiveSuggestion *)v4[2];
  if (suggestion == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = suggestion;
    v9 = -[ATXProactiveSuggestion isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  feedbackMetadata = self->_feedbackMetadata;
  v11 = (NSData *)v4[3];
  if (feedbackMetadata == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = feedbackMetadata;
    v14 = -[NSData isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  matchingSuggestionUUIDs = self->_matchingSuggestionUUIDs;
  v16 = (NSMutableOrderedSet *)v4[4];
  if (matchingSuggestionUUIDs == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = matchingSuggestionUUIDs;
    v19 = -[NSMutableOrderedSet isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_27;
  }
  associatedBlendingCacheUUIDs = self->_associatedBlendingCacheUUIDs;
  v21 = (NSMutableOrderedSet *)v4[6];
  if (associatedBlendingCacheUUIDs == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = associatedBlendingCacheUUIDs;
    v24 = -[NSMutableOrderedSet isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_27;
  }
  associatedClientModelCacheUUIDs = self->_associatedClientModelCacheUUIDs;
  v26 = (NSMutableOrderedSet *)v4[5];
  if (associatedClientModelCacheUUIDs == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = associatedClientModelCacheUUIDs;
    v29 = -[NSMutableOrderedSet isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_27;
  }
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v31 = (NSMutableDictionary *)v4[7];
  if (sessionContextStatusByConsumerSubType == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = sessionContextStatusByConsumerSubType;
    v34 = -[NSMutableDictionary isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_27;
  }
  sessionExpirationDate = self->_sessionExpirationDate;
  v36 = (NSDate *)v4[8];
  if (sessionExpirationDate == v36)
  {

    goto LABEL_30;
  }
  v37 = v36;
  v38 = sessionExpirationDate;
  v39 = -[NSDate isEqual:](v38, "isEqual:", v37);

  if ((v39 & 1) != 0)
  {
LABEL_30:
    v40 = self->_completed == *((unsigned __int8 *)v4 + 8);
    goto LABEL_28;
  }
LABEL_27:
  v40 = 0;
LABEL_28:

  return v40;
}

- (unint64_t)hash
{
  int64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *v6;

  v2 = (char *)self->_feedbackMetadata - (char *)self->_suggestion + 32 * (uint64_t)self->_suggestion;
  v3 = (char *)&self->_matchingSuggestionUUIDs[4 * v2] - v2;
  v4 = (char *)self->_associatedBlendingCacheUUIDs - v3 + 32 * (_QWORD)v3;
  v5 = (char *)self->_sessionContextStatusByConsumerSubType
     - ((char *)&self->_associatedClientModelCacheUUIDs[4 * v4]
      - v4)
     + 32 * ((uint64_t)&self->_associatedClientModelCacheUUIDs[4 * v4] - v4);
  v6 = (char *)&self->_sessionExpirationDate[4 * v5] - v5;
  return self->_completed - (_QWORD)v6 + 32 * (_QWORD)v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXProactiveSuggestion uuid](self->_suggestion, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestion clientModelSpecification](self->_suggestion, "clientModelSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientModelId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_completed)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("uuid: %@ clientModelId: %@ expirationDate: %@ completed: %@ statuses: %@ suggestionUUIDs: %@ blendingUUIDs: %@ clientUUIDs: %@"), v4, v6, self->_sessionExpirationDate, v8, self->_sessionContextStatusByConsumerSubType, self->_matchingSuggestionUUIDs, self->_associatedBlendingCacheUUIDs, self->_associatedClientModelCacheUUIDs);

  return v9;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackMetadata, a3);
}

- (NSMutableOrderedSet)matchingSuggestionUUIDs
{
  return self->_matchingSuggestionUUIDs;
}

- (void)setMatchingSuggestionUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSuggestionUUIDs, a3);
}

- (NSMutableOrderedSet)associatedClientModelCacheUUIDs
{
  return self->_associatedClientModelCacheUUIDs;
}

- (void)setAssociatedClientModelCacheUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_associatedClientModelCacheUUIDs, a3);
}

- (NSMutableOrderedSet)associatedBlendingCacheUUIDs
{
  return self->_associatedBlendingCacheUUIDs;
}

- (void)setAssociatedBlendingCacheUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_associatedBlendingCacheUUIDs, a3);
}

- (NSMutableDictionary)sessionContextStatusByConsumerSubType
{
  return self->_sessionContextStatusByConsumerSubType;
}

- (void)setSessionContextStatusByConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_sessionContextStatusByConsumerSubType, a3);
}

- (NSDate)sessionExpirationDate
{
  return self->_sessionExpirationDate;
}

- (void)setSessionExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionExpirationDate, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExpirationDate, 0);
  objc_storeStrong((id *)&self->_sessionContextStatusByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_associatedBlendingCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_associatedClientModelCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_matchingSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

+ (void)stringForSuggestionSessionStatus:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Invalid value ATXSingleSuggestionSessionStatus_Max", v1, 2u);
}

@end
