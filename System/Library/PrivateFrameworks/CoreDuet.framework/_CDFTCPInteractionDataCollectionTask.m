@implementation _CDFTCPInteractionDataCollectionTask

- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  double v11;
  _CDFTCPInteractionDataCollectionTask *v12;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CRIsAppleInternal();
  v11 = 1.0;
  if (!v10)
    v11 = 0.0;
  v12 = -[_CDFTCPInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:](self, "initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:", v8, v7, CFSTR("/var/mobile/Library/CoreDuet/DataCollection/FTCPInteractions/session.archive"), v9, 1, 7, v11, 2);

  return v12;
}

- (_CDFTCPInteractionDataCollectionTask)initWithStore:(id)a3 activity:(id)a4 sessionPath:(id)a5 collectionDate:(id)a6 samplingRate:(double)a7 maxBatches:(unint64_t)a8 daysPerBatch:(unint64_t)a9 twoWeekPeriodsInLookback:(unint64_t)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  _CDFTCPInteractionDataCollectionTask *v22;
  _CDFTCPInteractionDataCollectionTask *v23;
  uint64_t v24;
  NSString *sessionPath;
  void *v26;
  id v27;
  unint64_t v28;
  _CDFTCPInteractionDataCollectionSession *v29;
  id v30;
  NSObject *v31;
  _CDFTCPInteractionDataCollectionSession *session;
  _CDFTCPInteractionDataCollectionSession *v33;
  uint64_t v34;
  NSDate *collectionDate;
  id v37;
  id v38;
  objc_super v39;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v39.receiver = self;
  v39.super_class = (Class)_CDFTCPInteractionDataCollectionTask;
  v22 = -[_CDFTCPInteractionDataCollectionTask init](&v39, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_interactionStore, a3);
    objc_storeStrong((id *)&v23->_activity, a4);
    v24 = objc_msgSend(v20, "copy");
    sessionPath = v23->_sessionPath;
    v23->_sessionPath = (NSString *)v24;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v23->_sessionPath, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    v27 = v18;
    v28 = a9;
    if (v26)
    {
      v38 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v26, &v38);
      v29 = (_CDFTCPInteractionDataCollectionSession *)objc_claimAutoreleasedReturnValue();
      v30 = v38;
      if (v30)
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[_CDFTCPInteractionDataCollectionTask initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:].cold.1();

      }
    }
    else
    {
      v29 = 0;
    }
    session = v23->_session;
    v23->_session = v29;
    v33 = v29;

    v34 = objc_msgSend(v21, "copy");
    collectionDate = v23->_collectionDate;
    v23->_collectionDate = (NSDate *)v34;

    v23->_samplingRate = a7;
    v23->_maxBatches = a8;
    v23->_daysPerBatch = v28;
    v23->_twoWeekPeriodsInLookback = a10;
    v23->_deleteSessionOnCleanup = 1;

    v18 = v27;
    v19 = v37;
  }

  return v23;
}

- (void)execute
{
  -[_CDFTCPInteractionDataCollectionTask _execute](self, "_execute");
  -[_CDFTCPInteractionDataCollectionTask cleanup](self, "cleanup");
}

- (void)_execute
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Selected for_CDFTCPInteractionDataCollectionTaskdata collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
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
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error remove previous session file (_CDFTCPInteraction data collection): %@", v2, v3, v4, v5, v6);
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

- (_CDFTCPInteractionDataCollectionSession)session
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

- (unint64_t)twoWeekPeriodsInLookback
{
  return self->_twoWeekPeriodsInLookback;
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

- (void)initWithStore:activity:sessionPath:collectionDate:samplingRate:maxBatches:daysPerBatch:twoWeekPeriodsInLookback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error unarchiving _CDFTCPInteraction data collection session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
