@implementation ATXAppIntentDuetEvent

- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  return -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:](self, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9 alogId:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  ATXAppIntentDuetEvent *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  ATXAppIntentDuetEvent *v26;
  uint64_t v27;
  NSString *bundleId;
  uint64_t v29;
  NSString *actionType;
  uint64_t v31;
  NSArray *parameterHashes;
  void *v33;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v37 = a6;
  v35 = a7;
  v36 = a8;
  v19 = a9;
  v20 = a10;
  if (objc_msgSend(v16, "length"))
  {
    v21 = objc_msgSend(v17, "length");
    v22 = 0;
    if (v18
      && v21
      && (v23 = objc_msgSend(v18, "count"), v22 = 0, v37)
      && v23
      && (v24 = objc_msgSend(v37, "count"), v22 = 0, v36)
      && v24)
    {
      v38.receiver = self;
      v38.super_class = (Class)ATXAppIntentDuetEvent;
      v25 = v19;
      v26 = -[ATXDuetEvent initWithStartDate:endDate:](&v38, sel_initWithStartDate_endDate_, v36, v19);
      if (v26)
      {
        v27 = objc_msgSend(v16, "copy");
        bundleId = v26->_bundleId;
        v26->_bundleId = (NSString *)v27;

        v29 = objc_msgSend(v17, "copy");
        actionType = v26->_actionType;
        v26->_actionType = (NSString *)v29;

        v31 = objc_msgSend(v18, "copy");
        parameterHashes = v26->_parameterHashes;
        v26->_parameterHashes = (NSArray *)v31;

        objc_storeStrong((id *)&v26->_slotSetHashes, a6);
        objc_storeStrong((id *)&v26->_paramCount, a7);
        objc_storeStrong((id *)&v26->_alogId, a10);
      }
      self = v26;
      v22 = self;
    }
    else
    {
      v25 = v19;
    }
    v33 = v35;
  }
  else
  {
    v25 = v19;
    v22 = 0;
    v33 = v35;
  }

  return v22;
}

- (ATXAppIntentDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ATXAppIntentDuetEvent *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppIntentDuetEvent.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("unknown")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", &stru_1E82FDC98) & 1) != 0
      || !v7)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXAppIntentDuetEvent initWithDKEvent:].cold.1();
    }
    else
    {
      objc_msgSend(v5, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A40], "intentClass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v18);
      v8 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((-[NSObject isEqualToString:](v8, "isEqualToString:", &stru_1E82FDC98) & 1) == 0 && v8)
        {
          objc_storeStrong((id *)&self->_bundleId, v7);
          objc_storeStrong((id *)&self->_actionType, v8);
          objc_msgSend(v5, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:](self, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:", v7, v8, &unk_1E83D03B8, &unk_1E83D03D0, &unk_1E83CD3F0, v19, v20);

          v15 = self;
          goto LABEL_10;
        }
        __atxlog_handle_default();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[ATXAppIntentDuetEvent initWithDKEvent:].cold.2();
      }
      else
      {
        __atxlog_handle_default();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[ATXAppIntentDuetEvent initWithDKEvent:].cold.3((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);
      }

    }
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentDuetEvent initWithDKEvent:].cold.4((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (ATXAppIntentDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  ATXAppIntentDuetEvent *v26;
  ATXAppIntentDuetEvent *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v35;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __atxlog_handle_default();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues].cold.1();

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForIntentsDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_default();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues].cold.4();

    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = *MEMORY[0x1E0C99768];
    v32 = CFSTR("ContextStore's 'keyPathForIntentsDataDictionary' is not an NSDictionary.");
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "intentSourceBundleIDKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
  {
    __atxlog_handle_default();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues].cold.3();

    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = *MEMORY[0x1E0C99768];
    v32 = CFSTR("Value for 'intentSourceBundleIDKey' in ContextStore's 'keyPathForIntentsDataDictionary' is not an NSString.");
LABEL_21:
    objc_msgSend(v30, "raise:format:", v31, v32);
LABEL_22:
    v27 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "intentSourceBundleIDKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_1E82FDC98;
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0D15C58], "intentClassKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "intentClassKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_1E82FDC98;
    v24 = v23;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:](self, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:", v16, v24, &unk_1E83D03E8, &unk_1E83D0400, &unk_1E83CD3F0, v25, v25);

    self = v26;
    v27 = self;
  }
  else
  {
    __atxlog_handle_default();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Value for 'intentClassKey' in ContextStore's 'keyPathForIntentsDataDictionary' is not an NSString."));
    v27 = 0;
  }

LABEL_23:
  return v27;
}

- (id)identifier
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSUInteger v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:"), self->_bundleId, self->_actionType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  if (-[NSArray count](self->_parameterHashes, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_parameterHashes, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray count](self->_parameterHashes, "count") - 1;
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v9 = objc_msgSend(v6, "longLongValue");
      if (v7 <= v5)
        v10 = CFSTR("%lld");
      else
        v10 = CFSTR("%lld,");
      v11 = (void *)objc_msgSend(v8, "initWithFormat:", v10, v9);
      objc_msgSend(v3, "appendString:", v11);

      ++v5;
    }
    while (-[NSArray count](self->_parameterHashes, "count") > v5);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("codingKeyForDuetEventStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("codingKeyForDuetEventEndDate"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleId, CFSTR("codingKeyForBundleId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actionType, CFSTR("codingKeyForActionType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_parameterHashes, CFSTR("codingKeyForParamHashes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_slotSetHashes, CFSTR("codingKeyForSlotSetHashes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_paramCount, CFSTR("codingKeyForParamCount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_alogId, CFSTR("codingKeyForALogId"));

}

- (ATXAppIntentDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAppIntentDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *contexta;
  void *context;
  void *v53;
  void *v54;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForDuetEventStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForDuetEventEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_anchor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForBundleId"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && (objc_msgSend(v4, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_anchor();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForActionType"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24
          && (objc_msgSend(v4, "error"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          v53 = (void *)MEMORY[0x1E0D81610];
          v26 = (void *)MEMORY[0x1CAA48B6C]();
          v27 = objc_alloc(MEMORY[0x1E0C99E60]);
          v28 = objc_opt_class();
          v29 = (void *)objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
          objc_autoreleasePoolPop(v26);
          __atxlog_handle_anchor();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v29, CFSTR("codingKeyForParamHashes"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31
            && (objc_msgSend(v4, "error"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v32, !v32))
          {
            v54 = v31;
            v33 = (void *)MEMORY[0x1E0D81610];
            contexta = (void *)MEMORY[0x1CAA48B6C]();
            v34 = objc_alloc(MEMORY[0x1E0C99E60]);
            v35 = objc_opt_class();
            v36 = (void *)objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);
            objc_autoreleasePoolPop(contexta);
            __atxlog_handle_anchor();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v36, CFSTR("codingKeyForSlotSetHashes"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38
              && (objc_msgSend(v4, "error"), v39 = (void *)objc_claimAutoreleasedReturnValue(), v39, !v39))
            {
              context = v38;
              v40 = (void *)MEMORY[0x1E0D81610];
              v41 = objc_opt_class();
              __atxlog_handle_anchor();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v41, CFSTR("codingKeyForParamCount"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (v43
                && (objc_msgSend(v4, "error"), v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v44,
                                               !v44))
              {
                v45 = (void *)MEMORY[0x1E0D81610];
                v46 = objc_opt_class();
                __atxlog_handle_anchor();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v46, CFSTR("codingKeyForALogId"), v4, 0, CFSTR("com.apple.proactive.ATXDuetEvent"), -1, v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();

                if (v48
                  && (objc_msgSend(v4, "error"),
                      v49 = (void *)objc_claimAutoreleasedReturnValue(),
                      v49,
                      !v49))
                {
                  self = -[ATXAppIntentDuetEvent initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:](self, "initWithBundleId:actionType:parameterHashes:slotSetHashes:paramCount:startDate:endDate:alogId:", v19, v24, v54, context, v43, v8, v14, v48);
                  v10 = self;
                }
                else
                {
                  v10 = 0;
                }

              }
              else
              {
                v10 = 0;
              }
              v38 = context;

            }
            else
            {
              v10 = 0;
            }

            v31 = v54;
          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSArray)parameterHashes
{
  return self->_parameterHashes;
}

- (NSArray)slotSetHashes
{
  return self->_slotSetHashes;
}

- (NSNumber)paramCount
{
  return self->_paramCount;
}

- (NSNumber)alogId
{
  return self->_alogId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alogId, 0);
  objc_storeStrong((id *)&self->_paramCount, 0);
  objc_storeStrong((id *)&self->_slotSetHashes, 0);
  objc_storeStrong((id *)&self->_parameterHashes, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Received AppIntent event but bundleId is 'unknown' or empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Received AppIntent event but actionType is empty or nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDKEvent:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Value for metdata key 'intentClass' is not a string, %@", a5, a6, a7, a8, 2u);
}

- (void)initWithDKEvent:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Value for source key 'bundleID' is not a string, %@", a5, a6, a7, a8, 2u);
}

- (void)initWithCurrentContextStoreValues
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForIntentsDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
