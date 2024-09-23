@implementation HMDXPCMessageCountTracker

- (NSMutableDictionary)sentNotifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)acceptedRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

+ (HMDXPCMessageCountTracker)sharedTracker
{
  if (sharedTracker_onceToken != -1)
    dispatch_once(&sharedTracker_onceToken, &__block_literal_global_68069);
  return (HMDXPCMessageCountTracker *)(id)sharedTracker_sharedTracker;
}

- (NSMutableDictionary)erroredRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (HMDXPCMessageCountTracker)init
{
  HMDXPCMessageCountTracker *v2;
  uint64_t v3;
  NSMutableDictionary *acceptedRequests;
  uint64_t v5;
  NSMutableDictionary *erroredRequests;
  uint64_t v7;
  NSMutableDictionary *sentNotifications;
  uint64_t v9;
  NSDate *lastResetDate;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  HMFTimer *submissionTimer;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDXPCMessageCountTracker;
  v2 = -[HMDXPCMessageCountTracker init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    acceptedRequests = v2->_acceptedRequests;
    v2->_acceptedRequests = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    erroredRequests = v2->_erroredRequests;
    v2->_erroredRequests = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    sentNotifications = v2->_sentNotifications;
    v2->_sentNotifications = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    lastResetDate = v2->_lastResetDate;
    v2->_lastResetDate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceForKey:", CFSTR("xpcMessageCountTrackerSubmissionTimeInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0D286C8]);
    objc_msgSend(v13, "doubleValue");
    v15 = objc_msgSend(v14, "initWithTimeInterval:options:", 12);
    submissionTimer = v2->_submissionTimer;
    v2->_submissionTimer = (HMFTimer *)v15;

  }
  return v2;
}

- (void)configure
{
  void *v3;
  id v4;

  -[HMDXPCMessageCountTracker submissionTimer](self, "submissionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HMDXPCMessageCountTracker submissionTimer](self, "submissionTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (void)_resetCounters
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  os_unfair_lock_assert_owner(&self->_lock);
  -[HMDXPCMessageCountTracker acceptedRequests](self, "acceptedRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[HMDXPCMessageCountTracker erroredRequests](self, "erroredRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HMDXPCMessageCountTracker sentNotifications](self, "sentNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDXPCMessageCountTracker setLastResetDate:](self, "setLastResetDate:", v6);

}

- (id)mutableCountersOfType:(int64_t)a3
{
  void *v3;
  HMDXPCMessageCountTracker *v5;
  SEL v6;
  int64_t v7;

  switch(a3)
  {
    case 2:
      -[HMDXPCMessageCountTracker sentNotifications](self, "sentNotifications");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 1:
      -[HMDXPCMessageCountTracker erroredRequests](self, "erroredRequests");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 0:
      -[HMDXPCMessageCountTracker acceptedRequests](self, "acceptedRequests");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
  v5 = (HMDXPCMessageCountTracker *)_HMFPreconditionFailureWithFormat();
  return -[HMDXPCMessageCountTracker countersOfType:](v5, v6, v7);
}

- (id)countersOfType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDXPCMessageCountTracker mutableCountersOfType:](self, "mutableCountersOfType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)incrementCounterOfType:(int64_t)a3 clientName:(id)a4 messageName:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("/%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_stringWithSmallestEncoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDXPCMessageCountTracker mutableCountersOfType:](self, "mutableCountersOfType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  objc_msgSend(v11, "hmf_numberForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13 + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v14, v10);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)sampleCountersAndReset:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v3 = a3;
  v15[3] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14[0] = &unk_1E8B33288;
  -[HMDXPCMessageCountTracker acceptedRequests](self, "acceptedRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v15[0] = v7;
  v14[1] = &unk_1E8B332A0;
  -[HMDXPCMessageCountTracker erroredRequests](self, "erroredRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v15[1] = v9;
  v14[2] = &unk_1E8B332B8;
  -[HMDXPCMessageCountTracker sentNotifications](self, "sentNotifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HMDXPCMessageCountTracker _resetCounters](self, "_resetCounters");
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void)submitCounters
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDXPCMessageCountTracker *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id obj;
  uint64_t v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[HMDXPCMessageCountTracker sampleCountersAndReset:](self, "sampleCountersAndReset:", 1);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v40;
    *(_QWORD *)&v3 = 138543618;
    v26 = v3;
    v27 = *(_QWORD *)v40;
    do
    {
      v6 = 0;
      v29 = v4;
      do
      {
        if (*(_QWORD *)v40 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        HMDXPCCounterTypeAsString(objc_msgSend(v7, "unsignedIntegerValue", v26));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("XPCDroppedRequests")) & 1) == 0)
          {
            v34 = v9;
            v32 = v6;
            objc_msgSend(v28, "objectForKeyedSubscript:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v10, "allKeys");
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v36 != v13)
                    objc_enumerationMutation(v33);
                  v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                  objc_msgSend(v10, "hmf_numberForKey:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("/"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "firstObject");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "lastObject");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMDXPCMessageCountersLogEvent XPCMessageCountersLogEventWithType:peerInformation:messageName:count:](HMDXPCMessageCountersLogEvent, "XPCMessageCountersLogEventWithType:peerInformation:messageName:count:", v34, v18, v19, v16);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "submitLogEvent:error:", v20, 0);

                }
                v12 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v12);
            }

            v5 = v27;
            v4 = v29;
            v6 = v32;
            v9 = v34;
          }
        }
        else
        {
          v22 = (void *)MEMORY[0x1D17BA0A0]();
          v23 = self;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v45 = v25;
            v46 = 2112;
            v47 = v7;
            _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to map counterType %@ to a logEvent counter type", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v22);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v4);
  }

}

- (NSDictionary)stateDump
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDXPCMessageCountTracker sampleCountersAndReset:](self, "sampleCountersAndReset:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HMDXPCCounterTypeAsString(objc_msgSend(v9, "unsignedIntegerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDXPCMessageCountTracker submissionTimer](self, "submissionTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDXPCMessageCountTracker submitCounters](self, "submitCounters");
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastResetDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_sentNotifications, 0);
  objc_storeStrong((id *)&self->_erroredRequests, 0);
  objc_storeStrong((id *)&self->_acceptedRequests, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_68064 != -1)
    dispatch_once(&logCategory__hmf_once_t4_68064, &__block_literal_global_22_68065);
  return (id)logCategory__hmf_once_v5_68066;
}

void __40__HMDXPCMessageCountTracker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_68066;
  logCategory__hmf_once_v5_68066 = v0;

}

uint64_t __42__HMDXPCMessageCountTracker_sharedTracker__block_invoke()
{
  HMDXPCMessageCountTracker *v0;
  void *v1;

  v0 = objc_alloc_init(HMDXPCMessageCountTracker);
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;

  return objc_msgSend((id)sharedTracker_sharedTracker, "configure");
}

@end
