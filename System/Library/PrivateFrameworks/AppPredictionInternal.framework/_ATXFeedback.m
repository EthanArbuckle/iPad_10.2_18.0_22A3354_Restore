@implementation _ATXFeedback

+ (_ATXFeedback)sharedInstance
{
  if (sharedInstance__pasOnceToken6_20 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_20, &__block_literal_global_123);
  return (_ATXFeedback *)(id)sharedInstance__pasExprOnceResult_26;
}

- (double)currentAlpha
{
  -[_ATXFeedback putFeedbackScoresForApps:intoScores:confirms:rejects:](self, "putFeedbackScoresForApps:intoScores:confirms:rejects:", MEMORY[0x1E0C9AA60], 0, 0, 0);
  return self->_priorAlpha;
}

- (double)currentBeta
{
  -[_ATXFeedback putFeedbackScoresForApps:intoScores:confirms:rejects:](self, "putFeedbackScoresForApps:intoScores:confirms:rejects:", MEMORY[0x1E0C9AA60], 0, 0, 0);
  return self->_priorBeta;
}

- (_ATXFeedback)initWithDataStore:(id)a3 histogramManager:(id)a4
{
  id v6;
  id v7;
  _ATXFeedback *v8;
  _ATXDataStore *v9;
  _ATXDataStore *store;
  uint64_t v11;
  _ATXInternalUninstallNotification *uninstallNotificationListener;
  _ATXInternalUninstallNotification *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *histogramState;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_ATXFeedback;
  v8 = -[_ATXFeedback init](&v25, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (_ATXDataStore *)v6;
    }
    else
    {
      +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
      v9 = (_ATXDataStore *)objc_claimAutoreleasedReturnValue();
    }
    store = v8->_store;
    v8->_store = v9;

    objc_initWeak(&location, v8);
    v11 = objc_opt_new();
    uninstallNotificationListener = v8->_uninstallNotificationListener;
    v8->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v11;

    v13 = v8->_uninstallNotificationListener;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __51___ATXFeedback_initWithDataStore_histogramManager___block_invoke;
    v22 = &unk_1E82DAE98;
    objc_copyWeak(&v23, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v13, "registerForNotificationsWithUninstallBlock:", &v19);
    objc_storeStrong((id *)&v8->_histogramManager, a4);
    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15, v19, v20, v21, v22);
    histogramState = v8->_histogramState;
    v8->_histogramState = (_PASLock *)v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (_ATXFeedback)init
{
  void *v3;
  _ATXFeedback *v4;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXFeedback initWithDataStore:histogramManager:](self, "initWithDataStore:histogramManager:", 0, v3);

  return v4;
}

- (void)loadHistogramsInMemoryIfNecessary
{
  _PASLock *histogramState;
  _QWORD v3[5];

  histogramState = self->_histogramState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49___ATXFeedback_loadHistogramsInMemoryIfNecessary__block_invoke;
  v3[3] = &unk_1E82E4A38;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](histogramState, "runWithLockAcquired:", v3);
}

- (void)unloadCachedHistograms
{
  _PASLock *histogramState;
  _QWORD v3[5];

  histogramState = self->_histogramState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38___ATXFeedback_unloadCachedHistograms__block_invoke;
  v3[3] = &unk_1E82E4A38;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](histogramState, "runWithLockAcquired:", v3);
}

- (void)decayCounts
{
  -[_ATXFeedback doDecayAtTime:](self, "doDecayAtTime:", CFAbsoluteTimeGetCurrent());
}

- (void)doDecayAtTime:(double)a3
{
  _ATXDataStore *store;
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[4];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FF8000000000000;
  store = self->_store;
  v4[4] = v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30___ATXFeedback_doDecayAtTime___block_invoke;
  v5[3] = &unk_1E82E4A60;
  *(double *)&v5[5] = a3;
  v5[4] = v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30___ATXFeedback_doDecayAtTime___block_invoke_2;
  v4[3] = &unk_1E82E4A88;
  -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:](store, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:", 0, v5, v4);
  _Block_object_dispose(v6, 8);
}

- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 context:(id)a6
{
  -[_ATXFeedback feedbackLaunchedWithConsumerType:forBundleId:rejected:explicitlyRejected:context:](self, "feedbackLaunchedWithConsumerType:forBundleId:rejected:explicitlyRejected:context:", a3, a4, a5, 0, a6);
}

- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 explicitlyRejected:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _ATXDataStore *store;
  id v19;
  id v20;
  id v21;
  _ATXDataStore *v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  _ATXFeedback *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31[2];
  id location;
  _QWORD v33[3];
  int v34;
  _QWORD v35[3];
  int v36;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    objc_msgSend(v13, "arrayByAddingObject:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v13;
  }
  v17 = v16;
  -[_ATXFeedback loadHistogramsInMemoryIfNecessary](self, "loadHistogramsInMemoryIfNecessary");
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  objc_initWeak(&location, self);
  store = self->_store;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke;
  v24[3] = &unk_1E82E4AB0;
  v19 = v12;
  v25 = v19;
  v26 = self;
  v31[1] = (id)a3;
  v29 = v35;
  objc_copyWeak(v31, &location);
  v20 = v15;
  v27 = v20;
  v21 = v14;
  v28 = v21;
  v30 = v33;
  -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:](store, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:", v17, 0, v24);
  if (objc_msgSend((id)objc_opt_class(), "isWidgetOrSpotlight:", a3))
  {
    v22 = self->_store;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke_2;
    v23[3] = &unk_1E82E4AD8;
    v23[4] = v35;
    v23[5] = v33;
    -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:](v22, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:", MEMORY[0x1E0C9AA60], v23, 0);
  }
  if (v12)
    ATXUpdatePredictionsDefaultInterval(2);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

}

+ (BOOL)isWidgetOrSpotlight:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)populateFeedbackForConsumerType:(unint64_t)a3 forBundleId:(id)a4 withContext:(id)a5 forFeedbackCategory:(int64_t)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _PASLock *histogramState;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  unint64_t v48;
  int64_t v49;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "timeContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationMotionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v10, 0, objc_msgSend(v11, "coarseGeohash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationMotionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v14, 0, objc_msgSend(v15, "geohash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForTwoHourTimeWindow:timeZone:](_ATXActionUtils, "stringForTwoHourTimeWindow:timeZone:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForDayOfWeek:timeZone:](_ATXActionUtils, "stringForDayOfWeek:timeZone:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "locationMotionContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", objc_msgSend(v23, "geohash"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "locationMotionContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", objc_msgSend(v25, "coarseGeohash"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  histogramState = self->_histogramState;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke;
  v39[3] = &unk_1E82E4B00;
  v48 = a3;
  v49 = a6;
  v40 = v7;
  v41 = v8;
  v42 = v12;
  v43 = v16;
  v44 = v19;
  v45 = v22;
  v46 = v26;
  v47 = v24;
  v28 = v24;
  v29 = v26;
  v30 = v22;
  v31 = v19;
  v32 = v16;
  v33 = v12;
  v34 = v8;
  v38 = v7;
  -[_PASLock runWithLockAcquired:](histogramState, "runWithLockAcquired:", v39);

}

- (void)resetData
{
  -[_ATXDataStore removeAllFeedback](self->_store, "removeAllFeedback");
}

- (void)putNopScoresForApps:(id)a3 into:(double *)a4 atTime:(double)a5
{
  unint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v6 = 0;
    do
      a4[v6++] = 1.0;
    while (v6 < objc_msgSend(v7, "count"));
  }

}

- (void)putFeedbackScoresForApps:(id)a3 intoScores:(double *)a4 confirms:(double *)a5 rejects:(double *)a6
{
  id v10;
  double v11;
  double v12;
  _ATXDataStore *store;
  double v14;
  _QWORD v15[11];
  _QWORD v16[7];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];

  v10 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = a6;
  +[_ATXFeedbackConstants baseAlpha](_ATXFeedbackConstants, "baseAlpha");
  v12 = v11;
  +[_ATXFeedbackConstants baseBeta](_ATXFeedbackConstants, "baseBeta");
  store = self->_store;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke;
  v16[3] = &unk_1E82E4B28;
  v16[4] = self;
  *(double *)&v16[5] = v12 + v14;
  *(double *)&v16[6] = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke_2;
  v15[3] = &unk_1E82E4B50;
  v15[4] = self;
  v15[5] = v19;
  v15[8] = a4;
  v15[9] = a5;
  v15[10] = a6;
  v15[6] = v18;
  v15[7] = v17;
  -[_ATXDataStore enumerateStateForAppsReadOnly:withGlobalBlock:thenWithPerAppBlock:](store, "enumerateStateForAppsReadOnly:withGlobalBlock:thenWithPerAppBlock:", v10, v16, v15);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);

}

- (void)removeFeedbackForBundles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_ATXFeedback removeFeedbackForBundle:](self, "removeFeedbackForBundle:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeFeedbackForBundle:(id)a3
{
  -[_ATXDataStore removeFeedbackForBundleId:](self->_store, "removeFeedbackForBundleId:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramState, 0);
  objc_storeStrong((id *)&self->_histogramManager, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
