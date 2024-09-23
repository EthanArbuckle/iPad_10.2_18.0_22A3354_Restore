@implementation HFPredictionsManager

id __74__HFPredictionsManager_fetchUserActionPredictionsAndWaitForInitialUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4
    && (objc_msgSend(WeakRetained, "setWasQueriedForInFlightPredictions:", 1), *(_BYTE *)(a1 + 40))
    && (objc_msgSend(WeakRetained, "predictionsController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(WeakRetained, "initialPredictionUpdateFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(WeakRetained, "predictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setWasQueriedForInFlightPredictions:(BOOL)a3
{
  self->_wasQueriedForInFlightPredictions = a3;
}

- (BOOL)wasQueriedForInFlightPredictions
{
  return self->_wasQueriedForInFlightPredictions;
}

- (void)setPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_predictions, a3);
}

- (NAFuture)initialPredictionUpdateFuture
{
  return self->_initialPredictionUpdateFuture;
}

- (HFPredictionsManagerDelegate)delegate
{
  return (HFPredictionsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)fetchUserActionPredictions
{
  return -[HFPredictionsManager fetchUserActionPredictionsAndWaitForInitialUpdate:](self, "fetchUserActionPredictionsAndWaitForInitialUpdate:", 0);
}

- (id)fetchUserActionPredictionsAndWaitForInitialUpdate:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HFPredictionsManager_fetchUserActionPredictionsAndWaitForInitialUpdate___block_invoke;
  v7[3] = &unk_1EA7317D8;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6 filterTypes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HFPredictionsManager *v17;
  HFPredictionsManager *v18;
  NAFuture *v19;
  NAFuture *initialPredictionUpdateFuture;
  NSArray *predictions;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *predictionQueue;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HFPredictionsManager;
  v17 = -[HFPredictionsManager init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v15);
    v18->_predictionLimit = a6;
    objc_storeStrong((id *)&v18->_home, a3);
    objc_storeStrong((id *)&v18->_predictionsController, a4);
    v19 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    initialPredictionUpdateFuture = v18->_initialPredictionUpdateFuture;
    v18->_initialPredictionUpdateFuture = v19;

    -[HFPredictionsController setDelegate:](v18->_predictionsController, "setDelegate:", v18);
    predictions = v18->_predictions;
    v18->_predictions = (NSArray *)MEMORY[0x1E0C9AA60];

    v18->_cachesRawPredictions = 0;
    objc_storeStrong((id *)&v18->_filterTypes, a7);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.Home.predictionFetchQueue", v22);
    predictionQueue = v18->_predictionQueue;
    v18->_predictionQueue = (OS_dispatch_queue *)v23;

    -[HFPredictionsManager _queryUserActionPredictions](v18, "_queryUserActionPredictions");
  }

  return v18;
}

- (void)_queryUserActionPredictions
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFPredictionsManager _queryUserActionPredictionsOnQueue](self, "_queryUserActionPredictionsOnQueue");
  }
  else
  {
    objc_initWeak(&location, self);
    -[HFPredictionsManager predictionQueue](self, "predictionQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__HFPredictionsManager__queryUserActionPredictions__block_invoke;
    v4[3] = &unk_1EA728AE8;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)predictionQueue
{
  return self->_predictionQueue;
}

void __51__HFPredictionsManager__queryUserActionPredictions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryUserActionPredictionsOnQueue");

}

- (void)_queryUserActionPredictionsOnQueue
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HFLogForCategory(0x33uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFPredictionsManager home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Fetching predictions for home: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsManager predictionsController](self, "predictionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HFPredictionsManager__queryUserActionPredictionsOnQueue__block_invoke;
  v8[3] = &unk_1EA731800;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "fetchPredictionsWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __58__HFPredictionsManager__queryUserActionPredictionsOnQueue__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "cachesRawPredictions"))
  {
    v4 = objc_msgSend(v9, "count");
    v5 = objc_msgSend(WeakRetained, "predictionLimit");
    if (v4 >= 2 * v5)
      v4 = 2 * v5;
    objc_msgSend(WeakRetained, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subarrayWithRange:", 0, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCachedPredictions:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  objc_msgSend(WeakRetained, "submitPredictionsFetchEventWithDuration:numberOfPredictions:", objc_msgSend(v9, "count"), fabs(v8));
  objc_msgSend(WeakRetained, "_didReceivePredictions:", v9);

}

- (HMHome)home
{
  return self->_home;
}

- (HFPredictionsController)predictionsController
{
  return self->_predictionsController;
}

- (id)_processUserActionPredictions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[HFPredictionsManager predictionLimit](self, "predictionLimit"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[HFPredictionsManager predictionLimit](self, "predictionLimit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        HFLogForCategory(0x33uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "hf_prettyDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v43 = (uint64_t)v12;
          _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Processing user action prediction: %@", buf, 0xCu);

        }
        -[HFPredictionsManager filterTypes](self, "filterTypes");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_10;
        v14 = (void *)v13;
        -[HFPredictionsManager filterTypes](self, "filterTypes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v5;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "predictionType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "containsObject:", v17);

        v5 = v16;
        if ((v18 & 1) != 0)
        {
LABEL_10:
          switch(objc_msgSend(v10, "predictionType"))
          {
            case 0:
              goto LABEL_26;
            case 1:
              objc_msgSend(v10, "predictionTargetUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFPredictionsManager _homeKitObjectForSceneUUID:](self, "_homeKitObjectForSceneUUID:", v19);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            case 2:
              objc_msgSend(v10, "targetServiceUUID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v10, "targetServiceUUID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFPredictionsManager _homeKitObjectForServiceUUID:](self, "_homeKitObjectForServiceUUID:", v19);
              }
              else
              {
                objc_msgSend(v10, "predictionTargetUUID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFPredictionsManager _homeKitObjectForAccessoryUUID:](self, "_homeKitObjectForAccessoryUUID:", v19);
              }
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            case 3:
              objc_msgSend(v10, "predictionTargetUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFPredictionsManager _homeKitObjectForServiceGroupUUID:](self, "_homeKitObjectForServiceGroupUUID:", v19);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            case 4:
              objc_msgSend(v10, "predictionTargetUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFPredictionsManager _homeKitObjectForMediaSystemUUID:](self, "_homeKitObjectForMediaSystemUUID:", v19);
              v20 = objc_claimAutoreleasedReturnValue();
LABEL_22:
              v25 = v20;

              if (!v25)
                goto LABEL_26;
              -[NSObject uniqueIdentifier](v25, "uniqueIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v5, "containsObject:", v27) & 1) != 0)
              {
                HFLogForCategory(0x33uLL);
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v43 = (uint64_t)v25;
                  _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "HomeKit object %@ already added, skipping", buf, 0xCu);
                }
              }
              else
              {
                objc_msgSend(v5, "addObject:", v27);
                objc_msgSend(v37, "addObject:", v25);
                v29 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v10, "predictionScore");
                objc_msgSend(v29, "numberWithDouble:");
                v28 = objc_claimAutoreleasedReturnValue();
                -[NSObject uniqueIdentifier](v25, "uniqueIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKey:", v28, v30);

              }
              goto LABEL_30;
            default:
              NSStringFromHMUserActionPredictionType(objc_msgSend(v10, "predictionType"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("Unhandled prediction type: %@"), v23);

LABEL_26:
              HFLogForCategory(0x33uLL);
              v25 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                goto LABEL_31;
              -[HFPredictionsManager home](self, "home");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v43 = (uint64_t)v10;
              v44 = 2112;
              v45 = v27;
              _os_log_error_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_ERROR, "Prediction %@ couldn't be mapped to a HomeKit object in home: %@", buf, 0x16u);
LABEL_30:

LABEL_31:
              v31 = objc_msgSend(v37, "count");
              if (v31 < -[HFPredictionsManager predictionLimit](self, "predictionLimit"))
                continue;
              goto LABEL_34;
          }
        }
        HFLogForCategory(0x33uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v10, "predictionType");
          *(_DWORD *)buf = 134217984;
          v43 = v22;
          _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Skipping prediction that does not match any of the filtered types: %lu", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v7);
  }
LABEL_34:

  v32 = (void *)objc_msgSend(v35, "copy");
  -[HFPredictionsManager setPredictionConfidence:](self, "setPredictionConfidence:", v32);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (unint64_t)predictionLimit
{
  return self->_predictionLimit;
}

- (void)submitPredictionsFetchEventWithDuration:(double)a3 numberOfPredictions:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  HFPredictionsManager *v9;
  uint64_t v10;

  v5 = sub_1DD63DC0C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1DD63DC00();
  sub_1DD4042CC();
  sub_1DD63D93C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (HFPredictionsManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_predictionsController_delegate_predictionLimit_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPredictionsManager.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPredictionsManager init]",
    v5);

  return 0;
}

- (HFPredictionsManager)initWithHome:(id)a3 predictionsController:(id)a4 delegate:(id)a5 predictionLimit:(unint64_t)a6
{
  return -[HFPredictionsManager initWithHome:predictionsController:delegate:predictionLimit:filterTypes:](self, "initWithHome:predictionsController:delegate:predictionLimit:filterTypes:", a3, a4, a5, a6, 0);
}

- (id)predictionConfidenceForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFPredictionsManager predictionConfidence](self, "predictionConfidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)prepopulateWithCache
{
  void *v3;
  id v4;

  -[HFPredictionsManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedPredictions");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    -[HFPredictionsManager _didReceivePredictions:](self, "_didReceivePredictions:", v4);

}

- (void)setFilterTypes:(id)a3
{
  objc_storeStrong((id *)&self->_filterTypes, a3);
  if (-[HFPredictionsManager cachesRawPredictions](self, "cachesRawPredictions"))
    -[HFPredictionsManager prepopulateWithCache](self, "prepopulateWithCache");
  -[HFPredictionsManager _queryUserActionPredictions](self, "_queryUserActionPredictions");
}

- (void)_didReceivePredictions:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  HFLogForCategory(0x33uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    -[HFPredictionsManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Fetched %lu predictions for home %@: %@", buf, 0x20u);

  }
  -[HFPredictionsManager _processUserActionPredictions:](self, "_processUserActionPredictions:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HFPredictionsManager__didReceivePredictions___block_invoke;
  v13[3] = &unk_1EA72BE50;
  objc_copyWeak(&v16, &location);
  v11 = v4;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "performBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __47__HFPredictionsManager__didReceivePredictions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 1, objc_msgSend(*(id *)(a1 + 32), "count"));
  objc_msgSend(WeakRetained, "setPredictions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "predictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 2, objc_msgSend(v2, "count"));

  if (objc_msgSend(WeakRetained, "wasQueriedForInFlightPredictions"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictionsManagerDidUpdatePredictions:", WeakRetained);

    objc_msgSend(WeakRetained, "setWasQueriedForInFlightPredictions:", 0);
    objc_msgSend(WeakRetained, "initialPredictionUpdateFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "predictions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v5);

  }
}

- (id)_homeKitObjectForSceneUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPredictionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_actionSetWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Found scene object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForServiceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPredictionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Found initial service object: %@", (uint8_t *)&v24, 0xCu);
  }

  if (objc_msgSend(v6, "hf_isChildService"))
  {
    objc_msgSend(v6, "hf_parentService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x33uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Child service - using parent service instead: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  else
  {
    v8 = v6;
  }
  if (!objc_msgSend(v8, "hf_isVisible"))
  {
    HFLogForCategory(0x33uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Service %@ is non visible, so skipping this service entirely", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_24;
  }
  objc_msgSend(v8, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_showAsAccessoryTile");

  if (v11)
  {
    objc_msgSend(v8, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_isCamera");

    if (v13)
    {
      HFLogForCategory(0x33uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v15;
        v16 = "Service is normally shown as accessory, but accessory %@ is a camera, so skipping this service entirely";
LABEL_23:
        _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, 0xCu);

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    objc_msgSend(v8, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hf_isVisibleAccessory");

    HFLogForCategory(0x33uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v19 & 1) == 0)
    {
      if (v20)
      {
        objc_msgSend(v8, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v15;
        v16 = "Service is normally shown as accessory, but accessory %@ is non visible, so skipping this service entirely";
        goto LABEL_23;
      }
LABEL_24:

      v22 = 0;
      goto LABEL_25;
    }
    if (v20)
    {
      objc_msgSend(v8, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v21;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Service is normally shown as accessory, using accessory %@ instead", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v8, "accessory");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v8;
  }
  v22 = v17;
LABEL_25:

  return v22;
}

- (id)_homeKitObjectForServiceGroupUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPredictionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Found service group object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPredictionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessoryWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Found accessory object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_homeKitObjectForMediaSystemUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPredictionsManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaSystemWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Found media system object: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x33uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Predictions manager updated with %lu predictions: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HFPredictionsManager_userActionPredictionController_didUpdatePredictions___block_invoke;
  v10[3] = &unk_1EA727A48;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __76__HFPredictionsManager_userActionPredictionController_didUpdatePredictions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_processUserActionPredictions:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setPredictions:", v2);

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictionsManagerDidUpdatePredictions:", WeakRetained);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HFPredictionsManager predictions](self, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48__HFPredictionsManager_home_didRemoveAccessory___block_invoke;
  v15 = &unk_1EA731828;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "na_filter:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((_BYTE *)v19 + 24))
  {
    -[HFPredictionsManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictionsManagerDidUpdatePredictions:", self);

    -[HFPredictionsManager _queryUserActionPredictions](self, "_queryUserActionPredictions");
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __48__HFPredictionsManager_home_didRemoveAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "hf_associatedAccessories"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32)),
        v7,
        v8))
  {
    v6 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HFPredictionsManager predictions](self, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __50__HFPredictionsManager_home_didRemoveMediaSystem___block_invoke;
  v15 = &unk_1EA731828;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "na_filter:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((_BYTE *)v19 + 24))
  {
    -[HFPredictionsManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictionsManagerDidUpdatePredictions:", self);

    -[HFPredictionsManager _queryUserActionPredictions](self, "_queryUserActionPredictions");
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __50__HFPredictionsManager_home_didRemoveMediaSystem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v3 != v4;
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HFPredictionsManager predictions](self, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __51__HFPredictionsManager_home_didRemoveServiceGroup___block_invoke;
  v15 = &unk_1EA731828;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "na_filter:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((_BYTE *)v19 + 24))
  {
    -[HFPredictionsManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictionsManagerDidUpdatePredictions:", self);

    -[HFPredictionsManager _queryUserActionPredictions](self, "_queryUserActionPredictions");
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __51__HFPredictionsManager_home_didRemoveServiceGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v3 != v4;
}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HFPredictionsManager predictions](self, "predictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48__HFPredictionsManager_home_didRemoveActionSet___block_invoke;
  v15 = &unk_1EA731828;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "na_filter:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsManager setPredictions:](self, "setPredictions:", v10, v12, v13, v14, v15);

  if (*((_BYTE *)v19 + 24))
  {
    -[HFPredictionsManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictionsManagerDidUpdatePredictions:", self);

    -[HFPredictionsManager _queryUserActionPredictions](self, "_queryUserActionPredictions");
  }

  _Block_object_dispose(&v18, 8);
}

BOOL __48__HFPredictionsManager_home_didRemoveActionSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v3 != v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)cachesRawPredictions
{
  return self->_cachesRawPredictions;
}

- (void)setCachesRawPredictions:(BOOL)a3
{
  self->_cachesRawPredictions = a3;
}

- (NSArray)filterTypes
{
  return self->_filterTypes;
}

- (NSDictionary)predictionConfidence
{
  return self->_predictionConfidence;
}

- (void)setPredictionConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_predictionConfidence, a3);
}

- (void)setPredictionsController:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsController, a3);
}

- (void)setPredictionLimit:(unint64_t)a3
{
  self->_predictionLimit = a3;
}

- (void)setPredictionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_predictionQueue, a3);
}

- (void)setInitialPredictionUpdateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPredictionUpdateFuture, 0);
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_predictionsController, 0);
  objc_storeStrong((id *)&self->_predictionConfidence, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_filterTypes, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
