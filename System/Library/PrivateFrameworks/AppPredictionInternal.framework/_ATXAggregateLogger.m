@implementation _ATXAggregateLogger

+ (_ATXAggregateLogger)sharedInstance
{
  if (sharedInstance__pasOnceToken9_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken9_0, &__block_literal_global_157);
  return (_ATXAggregateLogger *)(id)sharedInstance__pasExprOnceResult_36;
}

- (_ATXAggregateLogger)init
{
  _ATXAggregateLogger *v2;
  uint64_t v3;
  _ATXBundleIdSet *bundleIdSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAggregateLogger;
  v2 = -[_ATXAggregateLogger init](&v6, sel_init);
  if (v2)
  {
    +[_ATXBundleIdSet sharedInstance](_ATXBundleIdSet, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    bundleIdSet = v2->_bundleIdSet;
    v2->_bundleIdSet = (_ATXBundleIdSet *)v3;

    v2->_buildType = +[_ATXAggregateLogger getBuildType](_ATXAggregateLogger, "getBuildType");
  }
  return v2;
}

+ (int64_t)getBuildType
{
  NSObject *v2;
  int64_t v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  _BOOL4 v7;
  __int16 v9;
  uint8_t buf[16];
  __int16 v11;

  if (objc_msgSend(MEMORY[0x1E0D81588], "isBetaBuild"))
  {
    __atxlog_handle_default();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = 1;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v11 = 0;
      v4 = "Seed build detected";
      v3 = 1;
      v5 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
    __atxlog_handle_default();
    v2 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
    if (!v6)
    {
      if (!v7)
      {
        v3 = 2;
        goto LABEL_12;
      }
      v9 = 0;
      v4 = "Customer build detected";
      v3 = 2;
      v5 = (uint8_t *)&v9;
      goto LABEL_10;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_INFO, "Internal build detected", buf, 2u);
    }
    v3 = 0;
  }
LABEL_12:

  return v3;
}

+ (id)predictionOutcomesMapping
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
  for (i = 0; i != 8; ++i)
  {
    +[_ATXAggregateLogger stringForPredictionOutcome:](_ATXAggregateLogger, "stringForPredictionOutcome:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
  return v2;
}

+ (id)predictedItemOutcomesMapping
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  for (i = 0; i != 5; ++i)
  {
    +[_ATXAggregateLogger stringForPredictedItemOutcome:](_ATXAggregateLogger, "stringForPredictedItemOutcome:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
  return v2;
}

+ (id)suggestionCountsArray
{
  void *v2;
  uint64_t i;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  for (i = 0; i != 10; ++i)
  {
    ATXSuggestionTypeToString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:atIndexedSubscript:", v4, i);

  }
  return v2;
}

+ (id)notificationOutcomesMapping
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 27);
  for (i = 0; i != 27; ++i)
  {
    ATXNEventTypeToString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

- (void)logLaunchEventWithLaunchReason:(id)a3 predicted:(BOOL)a4 position:(int64_t)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v6 = a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("launchReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("position"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D80F38]);
  v18[0] = v9;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("allLaunches"), v12);

  +[_ATXAggregateLogger propertyStringForLaunchReason:](_ATXAggregateLogger, "propertyStringForLaunchReason:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a5);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("notPredicted");
  }
  v17[0] = v14;
  v17[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEventWithPropertyValues:", v16);

  objc_autoreleasePoolPop(v8);
}

- (void)logPredictionEventWith:(id)a3 outcome:(unint64_t)a4 forABGroup:(id)a5 consumerType:(unint64_t)a6 andSubType:(unsigned __int8)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  unsigned int v59;
  void *v60;
  void *context;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[2];
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[2];
  id v78;
  id v79;
  void *v80;
  _QWORD v81[3];

  v59 = a7;
  v81[1] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v9 = a5;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("abGroup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D80F20];
  +[_ATXAggregateLogger predictionOutcomesMapping](_ATXAggregateLogger, "predictionOutcomesMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("outcomeType"), v12, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D80F20];
  objc_msgSend(MEMORY[0x1E0CF9508], "consumerMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("consumerType"), v14, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D80F20];
  objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeMapping");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("consumerSubType"), v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("itemsShown"), 0, 8, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0D80F38]);
  v81[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("predictions"), v19);

  v21 = objc_alloc(MEMORY[0x1E0D80F38]);
  v80 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v21, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("conversions"), v22);

  v63 = v9;
  v79 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v20;
  objc_msgSend(v20, "trackEventWithPropertyValues:", v23);

  if (+[_ATXAggregateLogger isConversionOutcome:](_ATXAggregateLogger, "isConversionOutcome:", a4))
  {
    v78 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trackEventWithPropertyValues:", v24);

  }
  v25 = objc_alloc(MEMORY[0x1E0D80F38]);
  v77[0] = v10;
  v77[1] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v25, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("outcome"), v26);

  v27 = objc_alloc(MEMORY[0x1E0D80F38]);
  v76[0] = v10;
  v76[1] = v67;
  v76[2] = v17;
  v76[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v27, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("consumerOutcome"), v28);

  v29 = objc_alloc(MEMORY[0x1E0D80F18]);
  v75[0] = v10;
  v75[1] = v67;
  v75[2] = v17;
  v75[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v29, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("consumerOutcomeWithCacheAge"), v30);

  v31 = objc_alloc(MEMORY[0x1E0D80F18]);
  v74[0] = v10;
  v74[1] = v67;
  v74[2] = v17;
  v74[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v31, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("consumerOutcomeCacheAgeHistogram"), v32);

  v73[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trackEventWithPropertyValues:", v34);

  v72[0] = v63;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v59);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trackEventWithPropertyValues:", v38);

  +[ATXFileUtil cacheAgeForConsumerType:](ATXFileUtil, "cacheAgeForConsumerType:", v59);
  v40 = v39;
  v71[0] = v63;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v59);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trackEventWithPropertyValues:value:", v44, v40);

  v70[0] = v63;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v45;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v59);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v46;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trackEventWithPropertyValues:value:", v48, v40);

  v49 = objc_alloc(MEMORY[0x1E0D80F38]);
  v69 = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v49, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("predictionItemsShown"), v50);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v62, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trackEventWithPropertyValues:", v53);

  objc_autoreleasePoolPop(context);
}

- (void)logInputs:(const float *)a3 andScore:(float)a4 withOutcome:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1CAA48B6C](self, a2, a3);
  v8 = (void *)MEMORY[0x1E0D80F20];
  +[_ATXAggregateLogger predictedItemOutcomesMapping](_ATXAggregateLogger, "predictedItemOutcomesMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("outcome"), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D80F18]);
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("score"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEventWithPropertyValues:value:", v15, a4);

  objc_autoreleasePoolPop(v7);
}

- (void)logPredictionOfAppWithBundleId:(id)a3 inputs:(const float *)a4 outcome:(unint64_t)a5 rank:(unint64_t)a6 score:(float)a7 forABGroup:(id)a8
{
  __CFString *v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  int64_t buildType;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const float *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  __CFString *v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v15 = a8;
  v42 = (void *)MEMORY[0x1CAA48B6C]();
  v16 = (-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("com.apple")) & 1) != 0
     || -[_ATXBundleIdSet containsBundleId:](self->_bundleIdSet, "containsBundleId:", v14);
  __atxlog_handle_default();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[_ATXAggregateLogger logPredictionOfAppWithBundleId:inputs:outcome:rank:score:forABGroup:].cold.1((uint64_t)v14, v16, v17);

  buildType = self->_buildType;
  v19 = v14;
  switch(buildType)
  {
    case 0:
      goto LABEL_11;
    case 2:
      if (objc_msgSend((id)objc_opt_class(), "yesWithProbability:", 0.1))
      {
LABEL_9:
        v19 = CFSTR("redactedBundleId");
        if (v16)
          v19 = v14;
LABEL_11:
        v20 = v19;
        objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("bundleId"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v15;
        v22 = (void *)MEMORY[0x1E0D80F20];
        +[_ATXAggregateLogger predictedItemOutcomesMapping](_ATXAggregateLogger, "predictedItemOutcomesMapping");
        v39 = a6;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("outcomeType"), v23, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc(MEMORY[0x1E0D80F38]);
        v46[0] = v21;
        v46[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
        v26 = a4;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("predictedApp"), v27);

        v41 = v20;
        v45[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "trackEventWithPropertyValues:", v30);

        *(float *)&v31 = a7;
        -[_ATXAggregateLogger logInputs:andScore:withOutcome:](self, "logInputs:andScore:withOutcome:", v26, a5, v31);

        a6 = v39;
        v15 = v40;

        goto LABEL_14;
      }
      break;
    case 1:
      goto LABEL_9;
  }
  v41 = 0;
LABEL_14:
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("abGroup"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("position"), 0, 8, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_alloc(MEMORY[0x1E0D80F38]);
    v44[0] = v32;
    v44[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("conversionAtPosition"), v35);

    v43[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trackEventWithPropertyValues:", v38);

  }
  objc_autoreleasePoolPop(v42);

}

- (void)logPredictUninstalledApps:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D80F20];
  objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("consumerSubType"), v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D80F38]);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("predictUninstalledApps"), v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEventWithPropertyValues:value:", v13, a3);

}

- (void)logNotificationInteraction:(int64_t)a3 orbed:(BOOL)a4 onscreen:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v5 = a5;
  v6 = a4;
  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D80F20];
  +[_ATXAggregateLogger notificationOutcomesMapping](_ATXAggregateLogger, "notificationOutcomesMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("outcome"), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("screen"), &unk_1E83D0448);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("orb"), &unk_1E83D0460);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0D80F38]);
  v22[0] = v10;
  v22[1] = v12;
  v22[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFeatureId:event:registerProperties:", CFSTR("AppNotifications"), CFSTR("interaction"), v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("no");
  if (v6)
    v18 = CFSTR("yes");
  v21[0] = v16;
  v21[1] = v18;
  v19 = CFSTR("history");
  if (v5)
    v19 = CFSTR("lockscreen");
  v21[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trackEventWithPropertyValues:", v20);

}

- (void)logAppLaunch:(id)a3 bundleId:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D80F20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "freeValuedPropertyWithName:", CFSTR("from"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("bundleId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D80F38]);
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFeatureId:event:registerProperties:", CFSTR("AppPredictions"), CFSTR("limitedAppLaunch"), v11);

  v14[0] = v7;
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "trackEventWithPropertyValues:", v13);
}

+ (BOOL)yesWithProbability:(double)a3
{
  unsigned int v3;

  v3 = atomic_load((unsigned int *)&yesWithProbabilityOverride);
  if ((v3 & 0x80000000) != 0)
    return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < a3;
  else
    return v3 != 0;
}

+ (void)yesWithProbabilityAlwaysSays:(BOOL)a3
{
  atomic_store(a3, (unsigned int *)&yesWithProbabilityOverride);
}

+ (void)yesWithProbabilityStopMocking
{
  atomic_store(0xFFFFFFFF, (unsigned int *)&yesWithProbabilityOverride);
}

+ (BOOL)isConversionOutcome:(unint64_t)a3
{
  return a3 - 9 < 0xFFFFFFFFFFFFFFF9;
}

+ (id)stringForPredictionOutcome:(unint64_t)a3
{
  void *v7;

  if (a3 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXAggregateLogger.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outcome >= 0 && outcome < _ATXPredictionOutcomeMax"));

  }
  if (a3 - 1 > 7)
    return CFSTR("convertedAppExpert");
  else
    return off_1E82E69C8[a3 - 1];
}

+ (id)stringForPredictedItemOutcome:(unint64_t)a3
{
  void *v7;

  if (a3 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXAggregateLogger.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outcome >= 0 && outcome < _ATXPredictedItemOutcomeMax"));

  }
  if (a3 > 5)
    return CFSTR("abandoned");
  else
    return off_1E82E6A08[a3];
}

+ (id)propertyStringForLaunchReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)*MEMORY[0x1E0DAB178];
  if (objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0DAB178]))
  {
    objc_msgSend(v4, "appendString:", CFSTR("Backlight-"));
  }
  else
  {
    v5 = (void *)*MEMORY[0x1E0DAB230];
    if (!objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0DAB230]))
    {
      v8 = CFSTR("LaunchReasonUnknown");
      goto LABEL_8;
    }
  }
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", CFSTR(".")))
  {
    objc_msgSend(v6, "substringFromIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v4, "appendString:", v6);
  v8 = (__CFString *)objc_msgSend(v4, "copy");
  v3 = v6;
LABEL_8:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdSet, 0);
}

- (void)logPredictionOfAppWithBundleId:(os_log_t)log inputs:outcome:rank:score:forABGroup:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Bundleid %@ in approved list: %{BOOL}d", (uint8_t *)&v3, 0x12u);
}

@end
