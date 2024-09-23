@implementation _CDAutoSuCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___CDAutoSuCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (id)sharedCache_sharedInstance;
}

- (void)clear
{
  _CDAutoSuCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[_CDAutoSuCache setPredictedSleep:](obj, "setPredictedSleep:", 0);
  -[_CDAutoSuCache setPredictedSleepValidityStartDate:](obj, "setPredictedSleepValidityStartDate:", 0);
  -[_CDAutoSuCache setPredictedSleepValidityEndDate:](obj, "setPredictedSleepValidityEndDate:", 0);
  objc_sync_exit(obj);

}

- (void)setCachedPredictedSleepDictionary:(id)a3 validityStartDate:(id)a4 validityEndDate:(id)a5
{
  id v8;
  id v9;
  _CDAutoSuCache *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[_CDAutoSuCache setPredictedSleep:](v10, "setPredictedSleep:", v11);
  -[_CDAutoSuCache setPredictedSleepValidityStartDate:](v10, "setPredictedSleepValidityStartDate:", v8);
  -[_CDAutoSuCache setPredictedSleepValidityEndDate:](v10, "setPredictedSleepValidityEndDate:", v9);
  objc_sync_exit(v10);

}

- (id)cachedPredictedSleepDictionaryForDate:(id)a3
{
  id v4;
  _CDAutoSuCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[_CDAutoSuCache predictedSleepValidityStartDate](v5, "predictedSleepValidityStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_CDAutoSuCache predictedSleepValidityEndDate](v5, "predictedSleepValidityEndDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_CDAutoSuCache predictedSleepValidityStartDate](v5, "predictedSleepValidityStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "laterDate:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToDate:", v4) & 1) != 0)
      {
        -[_CDAutoSuCache predictedSleepValidityEndDate](v5, "predictedSleepValidityEndDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "earlierDate:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToDate:", v4);

        if (v12)
        {
          -[_CDAutoSuCache predictedSleep](v5, "predictedSleep");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    v6 = 0;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)predictedSleep
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPredictedSleep:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)predictedSleepValidityStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPredictedSleepValidityStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)predictedSleepValidityEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPredictedSleepValidityEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSleepValidityEndDate, 0);
  objc_storeStrong((id *)&self->_predictedSleepValidityStartDate, 0);
  objc_storeStrong((id *)&self->_predictedSleep, 0);
}

@end
