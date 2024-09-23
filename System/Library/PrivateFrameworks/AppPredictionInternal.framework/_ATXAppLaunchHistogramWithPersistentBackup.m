@implementation _ATXAppLaunchHistogramWithPersistentBackup

- (void)flush
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[_ATXAppLaunchHistogram encodeWithCoder:](self, "encodeWithCoder:", v5);
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  -[_ATXDataStore addHistogramData:forHistogramOfType:](self->_datastore, "addHistogramData:forHistogramOfType:", v6, self->_histogramType);

  objc_autoreleasePoolPop(v3);
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4
{
  return -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:](self, "initWithDataStore:histogramType:saveOnBackgroundQueue:", a3, a4, 0);
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5
{
  return -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:](self, "initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:", a3, a4, 1, a5);
}

- (_ATXAppLaunchHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 loadFromDataStore:(BOOL)a5 saveOnBackgroundQueue:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _ATXAppLaunchHistogramWithPersistentBackup *v18;
  _ATXAppLaunchHistogramWithPersistentBackup *v19;
  ATXBackgroundSaver *v20;
  uint64_t v21;
  ATXBackgroundSaver *saver;
  NSObject *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  objc_super v30;
  objc_super v31;
  id v32;

  v7 = a5;
  v11 = a3;
  v12 = a6;
  if (v7 && (objc_msgSend(v11, "histogramDataForHistogramType:", a4), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1CAA48B6C]();
    v32 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v14, &v32);
    v17 = v32;
    if (v16)
    {
      v31.receiver = self;
      v31.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
      v18 = -[_ATXAppLaunchHistogram initWithCoder:](&v31, sel_initWithCoder_, v16);
    }
    else
    {
      __atxlog_handle_default();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:].cold.2();

      v30.receiver = self;
      v30.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
      v18 = -[_ATXAppLaunchHistogram initWithType:](&v30, sel_initWithType_, a4);
    }
    v19 = v18;

    objc_autoreleasePoolPop(v15);
    if (!v19)
      goto LABEL_12;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
    v19 = -[_ATXAppLaunchHistogram initWithType:](&v29, sel_initWithType_, a4);
    v14 = 0;
    if (!v19)
    {
LABEL_12:
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:].cold.1();

      goto LABEL_15;
    }
  }
  objc_storeStrong((id *)&v19->_datastore, a3);
  v19->_histogramType = a4;
  if (v12)
  {
    objc_initWeak(&location, v19);
    v20 = [ATXBackgroundSaver alloc];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __118___ATXAppLaunchHistogramWithPersistentBackup_initWithDataStore_histogramType_loadFromDataStore_saveOnBackgroundQueue___block_invoke;
    v26[3] = &unk_1E82DB988;
    objc_copyWeak(&v27, &location);
    v21 = -[ATXBackgroundSaver initWithQueue:block:](v20, "initWithQueue:block:", v12, v26);
    saver = v19->_saver;
    v19->_saver = (ATXBackgroundSaver *)v21;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
LABEL_15:

  return v19;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:](&v6, sel_addLaunchWithBundleId_date_timeZone_, a3, a4, a5);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:](&v7, sel_addLaunchWithBundleId_date_timeZone_weight_, a3, a4, a5);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:elapsedTime:](&v5, sel_addLaunchWithBundleId_elapsedTime_, a3, a4);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:elapsedTime:weight:](&v6, sel_addLaunchWithBundleId_elapsedTime_weight_, a3, a4);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram removeLaunchWithBundleId:date:timeZone:weight:](&v7, sel_removeLaunchWithBundleId_date_timeZone_weight_, a3, a4, a5);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  v4 = -[_ATXAppLaunchHistogram removeHistoryForBundleId:](&v6, sel_removeHistoryForBundleId_, a3);
  if (v4)
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  return v4;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  v4 = -[_ATXAppLaunchHistogram removeHistoryForBundleIds:](&v6, sel_removeHistoryForBundleIds_, a3);
  if (v4 >= 1)
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  return v4;
}

- (void)decayByFactor:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram decayByFactor:](&v4, sel_decayByFactor_, a3);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram decayWithHalfLifeInDays:](&v4, sel_decayWithHalfLifeInDays_, a3);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)resetData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchHistogramWithPersistentBackup;
  -[_ATXAppLaunchHistogram resetData](&v3, sel_resetData);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (_ATXDataStore)datastore
{
  return self->_datastore;
}

- (int64_t)histogramType
{
  return self->_histogramType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datastore, 0);
  objc_storeStrong((id *)&self->_saver, 0);
}

- (void)initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "Failed to create App Launch Histogram with type: %ld", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error unarchiving AppLaunchHistogram. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
