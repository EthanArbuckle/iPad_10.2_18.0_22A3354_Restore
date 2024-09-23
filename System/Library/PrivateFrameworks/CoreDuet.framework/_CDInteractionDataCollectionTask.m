@implementation _CDInteractionDataCollectionTask

- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _CDInteractionDataCollectionTask *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1.0;
  if (!CRIsAppleInternal())
  {
    OSAGetDATaskingValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0001;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        v9 = v11;
      }
    }

  }
  OSAGetDATaskingValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
  else
    v13 = 0;
  OSAGetDATaskingValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
  else
    v15 = 7;
  v16 = -[_CDInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:](self, "initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:", v6, v7, CFSTR("/var/mobile/Library/CoreDuet/DataCollection/Interactions/session.archive"), v8, v13, v15, v9);

  return v16;
}

- (_CDInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  _CDInteractionDataCollectionTask *v21;
  _CDInteractionDataCollectionTask *v22;
  uint64_t v23;
  NSString *sessionPath;
  void *v25;
  id v26;
  unint64_t v27;
  _CDInteractionDataCollectionSession *v28;
  id v29;
  NSObject *v30;
  _CDInteractionDataCollectionSession *session;
  _CDInteractionDataCollectionSession *v32;
  uint64_t v33;
  NSDate *collectionDate;
  id v36;
  id v37;
  objc_super v38;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v38.receiver = self;
  v38.super_class = (Class)_CDInteractionDataCollectionTask;
  v21 = -[_CDInteractionDataCollectionTask init](&v38, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_interactionStore, a3);
    objc_storeStrong((id *)&v22->_activity, a4);
    v23 = objc_msgSend(v19, "copy");
    sessionPath = v22->_sessionPath;
    v22->_sessionPath = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v22->_sessionPath, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v18;
    v26 = v17;
    v27 = a9;
    if (v25)
    {
      v37 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v25, &v37);
      v28 = (_CDInteractionDataCollectionSession *)objc_claimAutoreleasedReturnValue();
      v29 = v37;
      if (v29)
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[_CDInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:].cold.1();

      }
    }
    else
    {
      v28 = 0;
    }
    session = v22->_session;
    v22->_session = v28;
    v32 = v28;

    v33 = objc_msgSend(v20, "copy");
    collectionDate = v22->_collectionDate;
    v22->_collectionDate = (NSDate *)v33;

    v22->_samplingRate = a7;
    v22->_maxBatches = a8;
    v22->_daysPerBatch = v27;
    v22->_deleteSessionOnCleanup = 1;

    v17 = v26;
    v18 = v36;
  }

  return v22;
}

- (void)execute
{
  -[_CDInteractionDataCollectionTask _execute](self, "_execute");
  -[_CDInteractionDataCollectionTask cleanup](self, "cleanup");
}

- (void)_execute
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "Selected for _CDInteraction data collection", a5, a6, a7, a8, 0);
}

- (void)cleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error remove previous session file (_CDInteraction data collection): %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)sessionPath
{
  return self->_sessionPath;
}

- (NSDate)collectionDate
{
  return self->_collectionDate;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (_CDInteractionDataCollectionSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (double)samplingRate
{
  return self->_samplingRate;
}

- (unint64_t)maxBatches
{
  return self->_maxBatches;
}

- (unint64_t)daysPerBatch
{
  return self->_daysPerBatch;
}

- (BOOL)selectedForDataCollection
{
  return self->_selectedForDataCollection;
}

- (void)setSelectedForDataCollection:(BOOL)a3
{
  self->_selectedForDataCollection = a3;
}

- (BOOL)deleteSessionOnCleanup
{
  return self->_deleteSessionOnCleanup;
}

- (void)setDeleteSessionOnCleanup:(BOOL)a3
{
  self->_deleteSessionOnCleanup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error unarchiving _CDInteraction data collection session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
