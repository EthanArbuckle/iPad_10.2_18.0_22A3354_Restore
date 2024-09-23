@implementation HMDXPCMessageReportingSessionManager

- (void)addResponseMessagePayload:(id)a3 toSessionWithUUID:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDXPCMessageReportingSessionManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "responseMessagePayloads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Adding response message payload to session with UUID: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "addObject:", v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)sessionsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMDXPCMessageReportingSessionManager)init
{
  HMDXPCMessageReportingSessionManager *v2;
  uint64_t v3;
  NSMutableDictionary *sessionsByUUID;
  id endSessionTimerFactory;
  id consumeSessionResultsTimerFactory;
  id performBackgroundRequestHandler;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDXPCMessageReportingSessionManager;
  v2 = -[HMDXPCMessageReportingSessionManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sessionsByUUID = v2->_sessionsByUUID;
    v2->_sessionsByUUID = (NSMutableDictionary *)v3;

    endSessionTimerFactory = v2->_endSessionTimerFactory;
    v2->_endSessionTimerFactory = &__block_literal_global_56280;

    consumeSessionResultsTimerFactory = v2->_consumeSessionResultsTimerFactory;
    v2->_consumeSessionResultsTimerFactory = &__block_literal_global_49_56281;

    performBackgroundRequestHandler = v2->_performBackgroundRequestHandler;
    v2->_performBackgroundRequestHandler = &__block_literal_global_51;

  }
  return v2;
}

- (void)startSessionWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  HMDXPCMessageReportingSessionManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDXPCMessageReportingSession *v20;
  void (**v21)(_QWORD, _QWORD, double);
  void *v22;
  void *v23;
  void *v24;
  os_unfair_lock_s *p_lock;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "reportTimeout");
  if (v12 <= 0.0)
    v13 = 15.0;
  else
    v13 = v12;
  v14 = (void *)MEMORY[0x1D17BA0A0](v11);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportDomain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544386;
    v28 = v17;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    v35 = 2048;
    v36 = v13;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting reporting session with UUID: %@, reportDomain: %@, requestInfo: %@, timeout: %fs", (uint8_t *)&v27, 0x34u);

  }
  objc_autoreleasePoolPop(v14);
  v20 = -[HMDXPCMessageReportingSession initWithUUID:reportContext:xpcClientConnection:]([HMDXPCMessageReportingSession alloc], "initWithUUID:reportContext:xpcClientConnection:", v8, v9, v10);
  -[HMDXPCMessageReportingSessionManager endSessionTimerFactory](v15, "endSessionTimerFactory");
  v21 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v21[2](v21, 2, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDXPCMessageReportingSession setEndSessionTimer:](v20, "setEndSessionTimer:", v22);

  -[HMDXPCMessageReportingSession endSessionTimer](v20, "endSessionTimer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", v15);

  -[HMDXPCMessageReportingSession endSessionTimer](v20, "endSessionTimer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resume");

  p_lock = &v15->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageReportingSessionManager sessionsByUUID](v15, "sessionsByUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)endSessionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDXPCMessageReportingSessionManager *v9;
  NSObject *v10;
  id v11;
  void *v12;
  HMDXPCMessageReportingSessionManager *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDXPCMessageReportingSessionManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDXPCMessageReportingSessionManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDXPCMessageReportingSessionManager *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  HMDXPCMessageReportingSessionManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v14;
      v49 = 2112;
      v50 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No existing session to end with UUID: %@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v6, "consumeSessionResultsTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "reportContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcClientConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isActivated");

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceForKey:", CFSTR("cachedResponsesCleanupTimeoutSeconds"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDXPCMessageReportingSessionManager consumeSessionResultsTimerFactory](self, "consumeSessionResultsTimerFactory");
    v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v21[2](v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConsumeSessionResultsTimer:", v22);

    objc_msgSend(v6, "consumeSessionResultsTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    objc_msgSend(v6, "consumeSessionResultsTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");

    objc_msgSend(v6, "setEndSessionTimer:", 0);
    os_unfair_lock_unlock(&self->_lock);
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v28;
      v49 = 2112;
      v50 = v4;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Ending session with UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v15, "reportDomain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v26;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v34;
        v49 = 2112;
        v50 = v4;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@XPC client connection is still active so not reporting completion of session with UUID: %@", buf, 0x16u);

      }
    }
    else
    {
      if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB98D8]))
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = v26;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v38;
          v49 = 2112;
          v50 = v30;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Reporting completion of Siri request with requestInfo: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v35);
        dispatch_get_global_queue(0, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke;
        v45[3] = &unk_1E89C2328;
        v45[4] = v36;
        v46 = v30;
        dispatch_async(v39, v45);

        goto LABEL_26;
      }
      if (isInternalBuild() && objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB98E0]))
      {
        v40 = (void *)MEMORY[0x1D17BA0A0]();
        v41 = v26;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v43;
          v49 = 2112;
          v50 = v30;
          _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Reporting completion of HomeUtil request with requestInfo: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        notify_post("HomeUtilAsyncCompletionReportNotification");
        goto LABEL_26;
      }
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v26;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v44;
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v30;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Not reporting completion of request with unhandled domain: %@, requestInfo: %@", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v31);
LABEL_26:

    goto LABEL_27;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v11;
    v49 = 2112;
    v50 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Not ending already-ended session with UUID: %@", buf, 0x16u);

  }
LABEL_7:

  objc_autoreleasePoolPop(v8);
  os_unfair_lock_unlock(&self->_lock);
LABEL_27:

}

- (id)consumeResponseMessagePayloadsForSessionWithReportContextRequestInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDXPCMessageReportingSessionManager *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  os_unfair_lock_t lock;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    v27 = (id)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID", lock);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "reportContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "requestInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToData:", v4);

        if (v15)
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v28 = v16;
            HMFGetLogIdentifier();
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "responseMessagePayloads");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");
            objc_msgSend(v12, "UUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v34 = v19;
            v35 = 2048;
            v36 = v21;
            v37 = 2112;
            v38 = v22;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Consuming %lu response message payloads for session with UUID: %@", buf, 0x20u);

            v16 = v28;
          }

          objc_autoreleasePoolPop(v16);
          -[HMDXPCMessageReportingSessionManager sessionsByUUID](v17, "sessionsByUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v24);

          objc_msgSend(v12, "responseMessagePayloads");
          v27 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v27 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_14:

  os_unfair_lock_unlock(lock);
  return v27;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  HMDXPCMessageReportingSessionManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDXPCMessageReportingSessionManager *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (!v6)
  {
    v15 = 0;
    goto LABEL_19;
  }
  v7 = *(_QWORD *)v26;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
      -[HMDXPCMessageReportingSessionManager sessionsByUUID](self, "sessionsByUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "consumeSessionResultsTimer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = v12 == v4;

      if ((_DWORD)v10)
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v19;
          v31 = 2112;
          v32 = v9;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Results retrieval timed out for session with UUID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        -[HMDXPCMessageReportingSessionManager sessionsByUUID](v17, "sessionsByUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v9);

        v15 = 0;
        goto LABEL_18;
      }
      objc_msgSend(v11, "endSessionTimer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v13 == v4;

      if (v14)
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v24;
          v31 = 2112;
          v32 = v9;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@End timed out for session with UUID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(v11, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }

    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    v15 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_19:

  os_unfair_lock_unlock(&self->_lock);
  if (v15)
    -[HMDXPCMessageReportingSessionManager endSessionWithUUID:](self, "endSessionWithUUID:", v15);

}

- (id)endSessionTimerFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEndSessionTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)consumeSessionResultsTimerFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setConsumeSessionResultsTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)performBackgroundRequestHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setPerformBackgroundRequestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performBackgroundRequestHandler, 0);
  objc_storeStrong(&self->_consumeSessionResultsTimerFactory, 0);
  objc_storeStrong(&self->_endSessionTimerFactory, 0);
  objc_storeStrong((id *)&self->_sessionsByUUID, 0);
}

void __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "performBackgroundRequestHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke_2;
  v4[3] = &unk_1E89B4E68;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  ((void (**)(_QWORD, id, _QWORD *))v2)[2](v2, v5, v4);

}

void __59__HMDXPCMessageReportingSessionManager_endSessionWithUUID___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v10 = "%{public}@Successfully reported completion of request with requestInfo: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v13;
    v10 = "%{public}@Failed to report completion of request with requestInfo: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __44__HMDXPCMessageReportingSessionManager_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CFE9F0];
  v5 = a3;
  v6 = a2;
  v8 = (id)objc_msgSend([v4 alloc], "initWithContext:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE9E8]), "initWithRequestInfo:", v8);
  objc_msgSend(v7, "performRequestWithCompletion:", v5);

}

id __44__HMDXPCMessageReportingSessionManager_init__block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

id __44__HMDXPCMessageReportingSessionManager_init__block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_58_56287);
  return (id)logCategory__hmf_once_v17;
}

void __51__HMDXPCMessageReportingSessionManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
