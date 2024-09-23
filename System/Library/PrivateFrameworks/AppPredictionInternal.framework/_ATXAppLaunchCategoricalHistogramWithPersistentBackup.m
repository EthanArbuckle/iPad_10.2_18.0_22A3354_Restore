@implementation _ATXAppLaunchCategoricalHistogramWithPersistentBackup

- (void)flush
{
  void *v3;
  void *v4;
  void *v5;
  _ATXDataStore *datastore;
  void *v7;

  v3 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[_ATXAppLaunchCategoricalHistogram encodeWithCoder:](self, "encodeWithCoder:", v4);
  objc_autoreleasePoolPop(v5);
  datastore = self->_datastore;
  objc_msgSend(v4, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXDataStore addCategoricalHistogramData:forHistogramOfType:](datastore, "addCategoricalHistogramData:forHistogramOfType:", v7, self->_histogramType);

  objc_autoreleasePoolPop(v3);
}

- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4
{
  return -[_ATXAppLaunchCategoricalHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:](self, "initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:", a3, a4, 0, 0, 0);
}

- (_ATXAppLaunchCategoricalHistogramWithPersistentBackup)initWithDataStore:(id)a3 histogramType:(int64_t)a4 saveOnBackgroundQueue:(id)a5 maxCategoryCount:(unsigned __int16)a6 pruningMethod:(int64_t)a7
{
  uint64_t v8;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _ATXAppLaunchCategoricalHistogramWithPersistentBackup *v19;
  NSObject *v20;
  ATXBackgroundSaver *v21;
  uint64_t v22;
  ATXBackgroundSaver *saver;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  id v34;

  v8 = a6;
  v13 = a3;
  v14 = a5;
  v15 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v13, "categoricalHistogramDataForHistogramType:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v26 = v13;
    v17 = (void *)MEMORY[0x1CAA48B6C]();
    v34 = 0;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v16, &v34);
    v27 = v34;
    if (v18)
    {
      v33.receiver = self;
      v33.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
      v19 = -[_ATXAppLaunchCategoricalHistogram initWithCoder:](&v33, sel_initWithCoder_, v18);
    }
    else
    {
      v25 = v17;
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:].cold.1();

      v32.receiver = self;
      v32.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
      v19 = -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](&v32, sel_initWithType_maxCategoryCount_pruningMethod_, a4, v8, a7);
      v17 = v25;
    }

    objc_autoreleasePoolPop(v17);
    if (v19)
    {
      -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:](v19, "_setMaxCategoryCount:pruningMethod:", v8, a7);
      -[_ATXAppLaunchCategoricalHistogram _reduceCategoryCountTo:](v19, "_reduceCategoryCountTo:", -[_ATXAppLaunchCategoricalHistogram maxCategoryCount](v19, "maxCategoryCount"));
    }

    v13 = v26;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
    v19 = -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](&v31, sel_initWithType_maxCategoryCount_pruningMethod_, a4, v8, a7);
  }

  objc_autoreleasePoolPop(v15);
  if (v19)
  {
    objc_storeStrong((id *)&v19->_datastore, a3);
    v19->_histogramType = a4;
    if (v14)
    {
      objc_initWeak(&location, v19);
      v21 = [ATXBackgroundSaver alloc];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __142___ATXAppLaunchCategoricalHistogramWithPersistentBackup_initWithDataStore_histogramType_saveOnBackgroundQueue_maxCategoryCount_pruningMethod___block_invoke;
      v28[3] = &unk_1E82DB988;
      objc_copyWeak(&v29, &location);
      v22 = -[ATXBackgroundSaver initWithQueue:block:](v21, "initWithQueue:block:", v14, v28);
      saver = v19->_saver;
      v19->_saver = (ATXBackgroundSaver *)v22;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return v19;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](&v6, sel_addLaunchWithBundleId_date_category_, a3, a4, a5);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](&v7, sel_addLaunchWithBundleId_date_category_weight_, a3, a4, a5);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  v4 = -[_ATXAppLaunchCategoricalHistogram removeHistoryForBundleId:](&v6, sel_removeHistoryForBundleId_, a3);
  if (v4)
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  return v4;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  v4 = -[_ATXAppLaunchCategoricalHistogram removeHistoryForBundleIds:](&v6, sel_removeHistoryForBundleIds_, a3);
  if (v4)
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  return v4;
}

- (BOOL)removeHistoryForCategory:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  v4 = -[_ATXAppLaunchCategoricalHistogram removeHistoryForCategory:](&v6, sel_removeHistoryForCategory_, a3);
  if (v4)
    -[ATXBackgroundSaver scheduleSaveImmediately](self->_saver, "scheduleSaveImmediately");
  return v4;
}

- (void)resetData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  -[_ATXAppLaunchCategoricalHistogram resetData](&v3, sel_resetData);
  -[ATXBackgroundSaver scheduleSave](self->_saver, "scheduleSave");
}

- (void)resetHistogram:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_ATXAppLaunchCategoricalHistogramWithPersistentBackup;
  -[_ATXAppLaunchCategoricalHistogram resetHistogram:](&v4, sel_resetHistogram_, a3);
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

- (void)initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to decode data with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
