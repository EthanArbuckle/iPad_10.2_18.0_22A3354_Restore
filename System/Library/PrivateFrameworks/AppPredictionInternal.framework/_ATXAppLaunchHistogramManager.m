@implementation _ATXAppLaunchHistogramManager

- (_ATXAppLaunchHistogramManager)initWithPersistentStore
{
  return (_ATXAppLaunchHistogramManager *)-[_ATXAppLaunchHistogramManager initAndPersist:](self, "initAndPersist:", 1);
}

- (_ATXAppLaunchHistogramManager)initWithInMemoryStore
{
  return (_ATXAppLaunchHistogramManager *)-[_ATXAppLaunchHistogramManager initAndPersist:](self, "initAndPersist:", 0);
}

- (unint64_t)getHistogramPruningMethodFromAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 1;
  }

  return v7;
}

- (int)getHistogramMaxCategoryCountFromAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 50;
  }

  return v7;
}

- (id)initAndPersist:(BOOL)a3
{
  _BOOL4 v3;
  _ATXAppLaunchHistogramManager *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *backgroundSaverQueue;
  uint64_t v9;
  NSMutableDictionary *histograms;
  uint64_t v11;
  NSMutableDictionary *categoricalHistograms;
  uint64_t v13;
  _ATXDataStore *datastore;
  uint64_t v15;
  NSDictionary *parameters;
  NSObject *v17;
  objc_super v19;

  v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_ATXAppLaunchHistogramManager;
  v4 = -[_ATXAppLaunchHistogramManager init](&v19, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("ATXBackgroundSaver", v6);
    backgroundSaverQueue = v4->_backgroundSaverQueue;
    v4->_backgroundSaverQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    histograms = v4->_histograms;
    v4->_histograms = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    categoricalHistograms = v4->_categoricalHistograms;
    v4->_categoricalHistograms = (NSMutableDictionary *)v11;

    v4->_persistentStore = v3;
    if (v3)
    {
      +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
      v13 = objc_claimAutoreleasedReturnValue();
      datastore = v4->_datastore;
      v4->_datastore = (_ATXDataStore *)v13;

    }
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryWithLegacyPathForClass:", objc_opt_class());
    v15 = objc_claimAutoreleasedReturnValue();
    parameters = v4->_parameters;
    v4->_parameters = (NSDictionary *)v15;

    v4->_SSIDPruningMethod = -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:](v4, "getHistogramPruningMethodFromAsset:", CFSTR("SSIDPruningMethod"));
    v4->_maxSSIDCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("MaxSSIDCount"));
    v4->_actionConfirmsRejectsPruningMethod = -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:](v4, "getHistogramPruningMethodFromAsset:", CFSTR("ActionsConfirmsRejectsPruningMethod"));
    v4->_maxActionConfirmsRejectsActionCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("ActionsConfirmsRejectsMaxActionCount"));
    v4->_appJointContextPruningMethod = -[_ATXAppLaunchHistogramManager getHistogramPruningMethodFromAsset:](v4, "getHistogramPruningMethodFromAsset:", CFSTR("AppJointContextPruningMethod"));
    v4->_maxAppJointContextKeyCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("AppJointContextMaxKeyCount"));
    v4->_maxAppSpecificLocationMaxKeyCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("AppCoarseLocationMaxKeyCount"));
    v4->_maxAppCoarseLocationMaxKeyCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("AppSpecificLocationMaxKeyCount"));
    v4->_maxAppZoom7GeoHashMaxKeyCount = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](v4, "getHistogramMaxCategoryCountFromAsset:", CFSTR("AppZoom7GeoHashMaxKeyCount"));
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogramManager initAndPersist:].cold.1();

  }
  return v4;
}

+ (_ATXAppLaunchHistogramManager)sharedInstance
{
  void *v2;
  _ATXAppLaunchHistogramManager *v3;
  void *v4;
  id v5;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    v3 = -[_ATXAppLaunchHistogramManager initWithPersistentStore]([_ATXAppLaunchHistogramManager alloc], "initWithPersistentStore");
    v4 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedInstance;
  }
  v5 = v2;
  pthread_mutex_unlock(&sharedInstanceLock);
  return (_ATXAppLaunchHistogramManager *)v5;
}

+ (void)resetSharedInstance
{
  void *v2;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (void *)sharedInstance;
  sharedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (void)useTemporarySharedInstance:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&swappedInstance, (id)sharedInstance);
  v4 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v3;

  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (void)releaseTemporarySharedInstance
{
  void *v2;

  pthread_mutex_lock(&sharedInstanceLock);
  objc_storeStrong((id *)&sharedInstance, (id)swappedInstance);
  v2 = (void *)swappedInstance;
  swappedInstance = 0;

  pthread_mutex_unlock(&sharedInstanceLock);
}

- (void)exchangeDatastore:(id)a3
{
  _ATXDataStore *v4;
  NSMutableDictionary *v5;
  _ATXDataStore *datastore;
  _ATXDataStore *v7;

  v4 = (_ATXDataStore *)a3;
  v5 = self->_histograms;
  objc_sync_enter(v5);
  datastore = self->_datastore;
  self->_datastore = v4;
  v7 = v4;

  objc_sync_exit(v5);
}

- (void)enumerateInMemoryHistogramsWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *histograms;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  histograms = self->_histograms;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___ATXAppLaunchHistogramManager_enumerateInMemoryHistogramsWithBlock___block_invoke;
  v7[3] = &unk_1E82E0548;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](histograms, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateInMemoryCategoricalHistogramsWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *categoricalHistograms;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  categoricalHistograms = self->_categoricalHistograms;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81___ATXAppLaunchHistogramManager_enumerateInMemoryCategoricalHistogramsWithBlock___block_invoke;
  v7[3] = &unk_1E82E0570;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](categoricalHistograms, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (id)histogramForLaunchType:(int64_t)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *histograms;
  void *v7;
  _ATXAppLaunchHistogramWithPersistentBackup *v8;
  _ATXAppLaunchHistogramWithPersistentBackup *v9;
  NSMutableDictionary *v10;
  void *v11;

  v5 = self->_histograms;
  objc_sync_enter(v5);
  histograms = self->_histograms;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](histograms, "objectForKeyedSubscript:", v7);
  v8 = (_ATXAppLaunchHistogramWithPersistentBackup *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (self->_persistentStore)
    {
      v8 = -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:]([_ATXAppLaunchHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:saveOnBackgroundQueue:", self->_datastore, a3, self->_backgroundSaverQueue);
      if (v8)
      {
LABEL_7:
        v10 = self->_histograms;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, v11);

        goto LABEL_8;
      }
      v9 = -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:]([_ATXAppLaunchHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:", self->_datastore, a3, 0, self->_backgroundSaverQueue);
    }
    else
    {
      v9 = -[_ATXAppLaunchHistogram initWithType:]([_ATXAppLaunchHistogram alloc], "initWithType:", a3);
    }
    v8 = v9;
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v5);

  return v8;
}

- (id)categoricalHistogramForLaunchType:(int64_t)a3
{
  void *v5;
  int maxSSIDCount;
  int64_t SSIDPruningMethod;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[7];
  __int16 v23;

  v5 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 11:
    case 14:
    case 16:
    case 17:
    case 19:
    case 20:
    case 22:
    case 23:
    case 25:
    case 26:
    case 28:
    case 35:
    case 36:
    case 90:
    case 91:
    case 92:
    case 93:
      return v5;
    case 4:
    case 29:
    case 31:
      maxSSIDCount = self->_maxSSIDCount;
      SSIDPruningMethod = self->_SSIDPruningMethod;
      goto LABEL_12;
    case 6:
    case 7:
    case 9:
    case 10:
    case 12:
    case 13:
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.1();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("Deprecated histogram type.");
      goto LABEL_7;
    case 8:
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.2();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_APRHistogramTypeAppIntentDonation is deprecated.");
      goto LABEL_7;
    case 15:
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.3();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsLaunch is deprecated.");
      goto LABEL_7;
    case 18:
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.4();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsDayOfWeek is deprecated.");
      goto LABEL_7;
    case 21:
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.5();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsTrendingLaunch is deprecated.");
      goto LABEL_7;
    case 24:
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.6();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsUnlockTime is deprecated.");
      goto LABEL_7;
    case 27:
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.7();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch is deprecated.");
      goto LABEL_7;
    case 30:
      __atxlog_handle_default();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.8();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeIntentForAllAppsWifiLaunch is deprecated.");
      goto LABEL_7;
    case 32:
      LOWORD(maxSSIDCount) = 8;
      goto LABEL_51;
    case 33:
    case 34:
      maxSSIDCount = self->_maxActionConfirmsRejectsActionCount;
      SSIDPruningMethod = self->_actionConfirmsRejectsPruningMethod;
      goto LABEL_12;
    case 37:
    case 38:
    case 39:
      LOWORD(maxSSIDCount) = 5;
      goto LABEL_51;
    case 40:
      LOWORD(maxSSIDCount) = 2;
      goto LABEL_51;
    case 41:
      LOWORD(maxSSIDCount) = 7;
      goto LABEL_51;
    case 42:
      LOWORD(maxSSIDCount) = 42;
      goto LABEL_51;
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 63:
    case 64:
    case 69:
    case 70:
    case 75:
    case 76:
    case 81:
    case 82:
    case 87:
    case 88:
    case 89:
      maxSSIDCount = self->_maxAppJointContextKeyCount;
      SSIDPruningMethod = self->_appJointContextPruningMethod;
      goto LABEL_12;
    case 49:
      LOWORD(maxSSIDCount) = 4;
      goto LABEL_11;
    case 50:
      maxSSIDCount = self->_maxAppSpecificLocationMaxKeyCount;
      goto LABEL_11;
    case 51:
      maxSSIDCount = self->_maxAppCoarseLocationMaxKeyCount;
      goto LABEL_11;
    case 52:
    case 53:
    case 54:
    case 65:
    case 71:
    case 77:
    case 83:
      LOWORD(maxSSIDCount) = 12;
      goto LABEL_11;
    case 55:
    case 56:
    case 66:
    case 72:
    case 78:
    case 84:
      LOWORD(maxSSIDCount) = 7;
      goto LABEL_11;
    case 57:
    case 58:
    case 67:
    case 73:
    case 79:
    case 85:
      LOWORD(maxSSIDCount) = 250;
      goto LABEL_11;
    case 59:
    case 60:
    case 68:
    case 74:
    case 80:
    case 86:
      LOWORD(maxSSIDCount) = 500;
      goto LABEL_11;
    case 61:
      maxSSIDCount = self->_maxAppZoom7GeoHashMaxKeyCount;
      goto LABEL_11;
    case 62:
      LOWORD(maxSSIDCount) = 8;
      goto LABEL_11;
    case 94:
      SSIDPruningMethod = 2;
      LOWORD(maxSSIDCount) = 2;
      goto LABEL_12;
    case 95:
      LOWORD(maxSSIDCount) = -[_ATXAppLaunchHistogramManager getHistogramMaxCategoryCountFromAsset:](self, "getHistogramMaxCategoryCountFromAsset:", CFSTR("PoiCategoryMaxCount"));
      goto LABEL_11;
    case 96:
      LOWORD(maxSSIDCount) = 3;
LABEL_51:
      SSIDPruningMethod = 1;
      goto LABEL_12;
    case 97:
      LOWORD(maxSSIDCount) = 6;
      goto LABEL_11;
    case 98:
      LOWORD(maxSSIDCount) = 1;
LABEL_11:
      SSIDPruningMethod = 2;
      goto LABEL_12;
    case 99:
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:].cold.9();

      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("_ATXHistogramTypeMax is not meant to be instantiated.");
LABEL_7:
      objc_msgSend(v9, "raise:format:", v10, v11);
      return 0;
    default:
      SSIDPruningMethod = 0;
      LOWORD(maxSSIDCount) = 0;
LABEL_12:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67___ATXAppLaunchHistogramManager_categoricalHistogramForLaunchType___block_invoke;
      v22[3] = &unk_1E82E0598;
      v22[4] = self;
      v22[5] = a3;
      v23 = maxSSIDCount;
      v22[6] = SSIDPruningMethod;
      v13 = _Block_copy(v22);
      ATXHistogramTypeFunctionLookup[a3]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
  }
}

- (id)_categoricalHistogramForLaunchType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5
{
  uint64_t v6;
  NSMutableDictionary *v9;
  NSMutableDictionary *categoricalHistograms;
  void *v11;
  void *v12;
  _ATXAppLaunchCategoricalHistogramWithPersistentBackup *v13;
  NSMutableDictionary *v14;
  void *v15;

  v6 = a4;
  v9 = self->_categoricalHistograms;
  objc_sync_enter(v9);
  categoricalHistograms = self->_categoricalHistograms;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](categoricalHistograms, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (self->_persistentStore)
      v13 = -[_ATXAppLaunchCategoricalHistogramWithPersistentBackup initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:]([_ATXAppLaunchCategoricalHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:saveOnBackgroundQueue:maxCategoryCount:pruningMethod:", self->_datastore, a3, self->_backgroundSaverQueue, v6, a5);
    else
      v13 = -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:]([_ATXAppLaunchCategoricalHistogram alloc], "initWithType:maxCategoryCount:pruningMethod:", a3, v6, a5);
    v12 = v13;
    v14 = self->_categoricalHistograms;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v12, v15);

  }
  objc_sync_exit(v9);

  return v12;
}

- (void)purgeHistogramForLaunchType:(int64_t)a3
{
  NSMutableDictionary *histograms;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *categoricalHistograms;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *obj;
  NSMutableDictionary *obja;

  obj = self->_histograms;
  objc_sync_enter(obj);
  histograms = self->_histograms;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](histograms, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
      objc_msgSend(v7, "flush");
    v8 = self->_histograms;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

  }
  objc_sync_exit(obj);

  obja = self->_categoricalHistograms;
  objc_sync_enter(obja);
  categoricalHistograms = self->_categoricalHistograms;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](categoricalHistograms, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v12, "isMemberOfClass:", objc_opt_class()))
      objc_msgSend(v12, "flush");
    v13 = self->_categoricalHistograms;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

  }
  objc_sync_exit(obja);

}

+ (BOOL)isHistogramDeprecated:(int64_t)a3
{
  void *v3;
  char v4;

  +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("_Deprecated"));

  return v4;
}

+ (void)resetDataForCategoricalHistograms
{
  uint64_t i;
  void *v3;
  void *v4;

  for (i = 0; i != 99; ++i)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isHistogramDeprecated:", i) & 1) == 0)
    {
      +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "categoricalHistogramForLaunchType:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(v4, "resetData");

    }
  }
}

- (BOOL)persistentStore
{
  return self->_persistentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoricalHistograms, 0);
  objc_storeStrong((id *)&self->_histograms, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_backgroundSaverQueue, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

- (void)getHistogramPruningMethodFromAsset:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "No value found in asset for %@", a5, a6, a7, a8, 2u);
}

- (void)initAndPersist:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "_ATXLaunchHistogramManager initialized", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Deprecated histogram type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_APRHistogramTypeAppIntentDonation is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsLaunch is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsDayOfWeek is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsTrendingLaunch is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsUnlockTime is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeIntentForAllAppsWifiLaunch is deprecated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)categoricalHistogramForLaunchType:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "_ATXHistogramTypeMax is not meant to be instantiated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
