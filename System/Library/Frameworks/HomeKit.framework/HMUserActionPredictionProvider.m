@implementation HMUserActionPredictionProvider

- (void)configure
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  -[HMUserActionPredictionProvider workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMUserActionPredictionProvider_configure__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v3, block);

  -[HMUserActionPredictionProvider messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMUserActionPredictionRefreshMessage"), self, sel__handleRefreshPredictionsMessage_);

}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (void)_fetchPredictionsFromDuetAndUpdateHomes
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend((id)a1, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "deviceUnlockedSinceBootForUserActionPredictionProvider:", a1);

    if ((v4 & 1) != 0)
    {
      objc_msgSend((id)a1, "duetDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v5, "fetchPredictionsFromDuet");

      -[HMUserActionPredictionProvider _recalculatePredictions]((void *)a1);
    }
    else
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(a1 + 24) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend((id)a1, "workQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v7);

      v8 = a1 + 12;
      v9 = *(_DWORD *)(a1 + 12) == -1;
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = (id)a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v15;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device has not been unlocked once, registering for first unlock notification", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        objc_initWeak((id *)buf, v11);
        objc_msgSend(v11, "darwinNotificationProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "workQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __53__HMUserActionPredictionProvider__waitForFirstUnlock__block_invoke;
        v18[3] = &unk_1E3AB43D0;
        objc_copyWeak(&v19, (id *)buf);
        objc_msgSend(v16, "notifyRegisterDispatch:outToken:queue:handler:", "com.apple.mobile.keybagd.lock_status", v8, v17, v18);

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v14;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device has not been unlocked once, waiting for first unlock notification", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
      }
    }
  }
}

- (void)addSubscriber:(id)a3 forHomeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMUserActionPredictionProvider *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 shouldRefetchFromDuet;
  void *v18;
  HMUserActionPredictionProvider *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMUserActionPredictionProvider *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  _BYTE v27[24];
  void *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 138543874;
    *(_QWORD *)&v27[4] = v11;
    *(_WORD *)&v27[12] = 2112;
    *(_QWORD *)&v27[14] = v6;
    *(_WORD *)&v27[22] = 2112;
    v28 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding subscriber (%@) for predictions in home: %@", v27, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](v9->_subscribers, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if ((objc_msgSend(v15, "containsObject:", v7) & 1) != 0)
  {

    os_unfair_lock_unlock(&v9->_lock);
    v16 = 0;
  }
  else
  {
    objc_msgSend(v15, "setByAddingObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v9->_subscribers, "setObject:forKey:", v16, v6);
    shouldRefetchFromDuet = v9->_shouldRefetchFromDuet;
    if (v9->_shouldRefetchFromDuet)
      v9->_shouldRefetchFromDuet = 0;

    os_unfair_lock_unlock(&v9->_lock);
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138544130;
      *(_QWORD *)&v27[4] = v21;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v6;
      *(_WORD *)&v27[22] = 2112;
      v28 = v7;
      LOWORD(v29[0]) = 2112;
      *(_QWORD *)((char *)v29 + 2) = v16;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Added subscriber (%@) for predictions in home: %@, and updated subscribed homes to: %@", v27, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    if (shouldRefetchFromDuet)
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = v19;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v27 = 138543362;
        *(_QWORD *)&v27[4] = v25;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Running fetch from duet on subscriber addition", v27, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      -[HMUserActionPredictionProvider workQueue](v23, "workQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v27 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v27[8] = 3221225472;
      *(_QWORD *)&v27[16] = __72__HMUserActionPredictionProvider_fetchPredictionsFromDuetAndUpdateHomes__block_invoke;
      v28 = &unk_1E3AB5E18;
      v29[0] = v23;
      dispatch_async(v26, v27);

    }
  }

}

- (void)fetchPredictionsForHomeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HMUserActionPredictionProvider workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__HMUserActionPredictionProvider_fetchPredictionsForHomeWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E3AB4478;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_recalculatePredictions
{
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v1, "duetDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v4;
    objc_msgSend(v4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_44527);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homesForUserActionPredictionProvider:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    v62 = v5;
    if (v8)
    {
      v9 = v8;
      v61 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v11, "uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v15;
            v17 = v11;
            if (!v16)
              goto LABEL_39;
            if (!v11)
              goto LABEL_37;
          }
          else
          {
            v16 = (id)MEMORY[0x1E0C9AA60];
            v18 = MEMORY[0x1E0C9AA60];
            v19 = v11;
            if (!v11)
              goto LABEL_37;
          }
          objc_msgSend(v1, "workQueue");
          v20 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v20);

          objc_msgSend(v1, "predictionTransformer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "predictionsWithDuetPredictions:forHome:", v16, v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "uniqueIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v22;
          v25 = v23;
          if (!v25)
          {
LABEL_36:
            _HMFPreconditionFailure();
LABEL_37:
            _HMFPreconditionFailure();
LABEL_38:
            _HMFPreconditionFailure();
LABEL_39:
            _HMFPreconditionFailure();
          }
          if (!v24)
            goto LABEL_38;
          v26 = v25;
          objc_msgSend(v1, "workQueue");
          v27 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v27);

          objc_msgSend(v1, "lastMappedPredictionsPerHome");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v26);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          v31 = (void *)MEMORY[0x1E0C9AA60];
          if (v29)
            v31 = (void *)v29;
          v32 = v31;

          v33 = objc_msgSend(v32, "isEqualToArray:", v24);
          if ((v33 & 1) == 0)
          {
            v34 = (void *)objc_msgSend(v24, "copy");
            objc_msgSend(v1, "lastMappedPredictionsPerHome");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v26);

            -[HMUserActionPredictionProvider notifySubscribersOfChangedPredictions:forHomeWithIdentifier:]((uint64_t)v1, v24, v26);
          }

          v5 = v62;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v9);
    }

    objc_msgSend(obj, "na_map:", &__block_literal_global_27);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v1, "lastMappedPredictionsPerHome");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");

    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v64;
      v59 = v1;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v64 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          if ((objc_msgSend(v36, "containsObject:", v43) & 1) == 0)
          {
            v44 = v43;
            if (!v44)
              goto LABEL_36;
            v45 = v44;
            objc_msgSend(v1, "workQueue");
            v46 = objc_claimAutoreleasedReturnValue();
            dispatch_assert_queue_V2(v46);

            v47 = (void *)MEMORY[0x1A1AC1AAC]();
            v48 = v1;
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v50 = v40;
              v51 = v41;
              v52 = v36;
              v53 = v38;
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v54;
              v75 = 2112;
              v76 = v45;
              _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_INFO, "%{public}@Removing all predictions for home: %@", buf, 0x16u);

              v38 = v53;
              v36 = v52;
              v41 = v51;
              v40 = v50;
              v1 = v59;
            }

            objc_autoreleasePoolPop(v47);
            objc_msgSend(v48, "lastMappedPredictionsPerHome");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKeyedSubscript:", v45);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "lastMappedPredictionsPerHome");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", 0, v45);

            if (objc_msgSend(v56, "count"))
              -[HMUserActionPredictionProvider notifySubscribersOfChangedPredictions:forHomeWithIdentifier:]((uint64_t)v48, MEMORY[0x1E0C9AA60], v45);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v40);
    }

  }
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)lastMappedPredictionsPerHome
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (HMUserActionPredictionDuetDataSource)duetDataSource
{
  return (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (HMUserActionPredictionProviderDataSource)dataSource
{
  return (HMUserActionPredictionProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMUserActionPredictionTransformer)predictionTransformer
{
  return (HMUserActionPredictionTransformer *)objc_getProperty(self, a2, 72, 1);
}

void __83__HMUserActionPredictionProvider_fetchPredictionsForHomeWithIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    if (*((_BYTE *)WeakRetained + 24))
    {
      *((_BYTE *)WeakRetained + 24) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      v3 = (void *)MEMORY[0x1A1AC1AAC]();
      v4 = WeakRetained;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v6;
        _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Running deferred fetch from duet before returning predictions", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
      -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes]((uint64_t)v4);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
    objc_msgSend(WeakRetained, "lastMappedPredictionsPerHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __57__HMUserActionPredictionProvider__recalculatePredictions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)recalculatePredictions
{
  NSObject *v3;
  _QWORD block[5];

  -[HMUserActionPredictionProvider workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMUserActionPredictionProvider_recalculatePredictions__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __72__HMUserActionPredictionProvider_fetchPredictionsFromDuetAndUpdateHomes__block_invoke(uint64_t a1)
{
  -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes](*(_QWORD *)(a1 + 32));
}

void __56__HMUserActionPredictionProvider_recalculatePredictions__block_invoke(uint64_t a1)
{
  -[HMUserActionPredictionProvider _recalculatePredictions](*(void **)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_44574 != -1)
    dispatch_once(&logCategory__hmf_once_t18_44574, &__block_literal_global_37_44575);
  return (id)logCategory__hmf_once_v19_44576;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMUserActionPredictionProvider)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 UUID:(id)a5 dataSource:(id)a6 duetDataSource:(id)a7 predictionTransformer:(id)a8 darwinNotificationProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMUserActionPredictionProvider *v24;
  HMUserActionPredictionProvider *v25;
  uint64_t v26;
  NSMutableDictionary *lastMappedPredictionsPerHome;
  uint64_t v28;
  NSMapTable *subscribers;
  HMUserActionPredictionDuetDataSource *v31;
  SEL v32;
  id v33;
  id obj;
  id v35;
  id v36;
  objc_super v37;

  v16 = a3;
  v17 = a4;
  obj = a5;
  v18 = a5;
  v19 = a6;
  v35 = a7;
  v20 = a7;
  v36 = a8;
  v21 = a8;
  v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v31 = (HMUserActionPredictionDuetDataSource *)_HMFPreconditionFailure();
    return (HMUserActionPredictionProvider *)-[HMUserActionPredictionDuetDataSource initWithCacheManager:](v31, v32, v33);
  }
  v37.receiver = self;
  v37.super_class = (Class)HMUserActionPredictionProvider;
  v24 = -[HMUserActionPredictionProvider init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_workQueue, a3);
    objc_storeWeak((id *)&v25->_dataSource, v19);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    lastMappedPredictionsPerHome = v25->_lastMappedPredictionsPerHome;
    v25->_lastMappedPredictionsPerHome = (NSMutableDictionary *)v26;

    objc_storeStrong((id *)&v25->_messageDispatcher, a4);
    objc_storeStrong((id *)&v25->_uuid, obj);
    objc_storeStrong((id *)&v25->_duetDataSource, v35);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v28 = objc_claimAutoreleasedReturnValue();
    subscribers = v25->_subscribers;
    v25->_subscribers = (NSMapTable *)v28;

    objc_storeStrong((id *)&v25->_predictionTransformer, v36);
    *(_QWORD *)&v25->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    objc_storeStrong((id *)&v25->_darwinNotificationProvider, a9);
    v25->_shouldRefetchFromDuet = 1;
  }

  return v25;
}

void __43__HMUserActionPredictionProvider_configure__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "duetDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "fetchPredictionsFromCache");

  -[HMUserActionPredictionProvider _recalculatePredictions](*(void **)(a1 + 32));
}

void __45__HMUserActionPredictionProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_44576;
  logCategory__hmf_once_v19_44576 = v0;

}

- (void)dealloc
{
  objc_super v3;

  if (self->_firstUnlockToken != -1)
    -[HMDarwinNotificationProvider notifyCancel:](self->_darwinNotificationProvider, "notifyCancel:");
  v3.receiver = self;
  v3.super_class = (Class)HMUserActionPredictionProvider;
  -[HMUserActionPredictionProvider dealloc](&v3, sel_dealloc);
}

- (void)removeSubscriber:(id)a3 forHomeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMUserActionPredictionProvider *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMapTable *subscribers;
  void *v20;
  HMUserActionPredictionProvider *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing subscriber (%@) for predictions in home: %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](v9->_subscribers, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (objc_msgSend(v15, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_setByRemovingObjectsFromSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "count");
    subscribers = v9->_subscribers;
    if (v18)
      -[NSMapTable setObject:forKey:](subscribers, "setObject:forKey:", v17, v6);
    else
      -[NSMapTable removeObjectForKey:](subscribers, "removeObjectForKey:", v6);

    os_unfair_lock_unlock(&v9->_lock);
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v23;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Removed subscriber (%@) for predictions in home: %@, and updated subscribed homes to: %@", (uint8_t *)&v24, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);

  }
  else
  {

    os_unfair_lock_unlock(&v9->_lock);
  }

}

- (void)_handleRefreshPredictionsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  HMUserActionPredictionProvider *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUserActionPredictionProvider workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMapTable count](self->_subscribers, "count"))
  {
    self->_shouldRefetchFromDuet = 0;
    os_unfair_lock_unlock(&self->_lock);
    -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes]((uint64_t)self);
  }
  else
  {
    self->_shouldRefetchFromDuet = 1;
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@No active prediction subscribers, will fetch from duet later.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    os_unfair_lock_unlock(p_lock);
  }

}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_lastMappedPredictionsPerHome, 0);
  objc_storeStrong((id *)&self->_predictionTransformer, 0);
  objc_storeStrong((id *)&self->_duetDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

- (void)notifySubscribersOfChangedPredictions:(void *)a3 forHomeWithIdentifier:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  os_unfair_lock_s *lock;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
    _HMFPreconditionFailure();
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  lock = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = *(id *)(a1 + 16);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v12, lock);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v7);

        if (v14)
          objc_msgSend(v20, "addObject:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v20;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "didUpdatePredictions:forHomeWithIdentifier:", v5, v7, lock);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

}

id __57__HMUserActionPredictionProvider__recalculatePredictions__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  return v6;
}

void __53__HMUserActionPredictionProvider__waitForFirstUnlock__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  _DWORD *v2;
  void *v3;
  int v4;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "deviceUnlockedSinceBootForUserActionPredictionProvider:", v2))
    {
      v4 = v2[3];

      if (v4 != -1)
      {
        v5 = (void *)MEMORY[0x1A1AC1AAC]();
        v6 = v2;
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138543362;
          v11 = v8;
          _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time, fetching predictions from duet", (uint8_t *)&v10, 0xCu);

        }
        objc_autoreleasePoolPop(v5);
        -[os_unfair_lock_s darwinNotificationProvider](v6, "darwinNotificationProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "notifyCancel:", v2[3]);

        v2[3] = -1;
        os_unfair_lock_lock_with_options();
        LOBYTE(v6[6]._os_unfair_lock_opaque) = 0;
        os_unfair_lock_unlock(v6 + 2);
        -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes](v6);
      }
    }
    else
    {

    }
  }

}

@end
