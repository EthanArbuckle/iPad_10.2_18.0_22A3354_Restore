@implementation HMMRTCSession

- (HMMRTCSession)initWithUUID:(id)a3 serviceName:(id)a4 commonFields:(id)a5 backend:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMRTCSession *v15;
  NSObject *v16;
  void *v17;
  HMMRTCSession *v18;
  HMMRTCSession *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17B78FC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v17;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1CD029000, v16, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Creating session with service name: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v21.receiver = v15;
  v21.super_class = (Class)HMMRTCSession;
  v18 = -[HMMNullRTCSession initWithUUID:serviceName:](&v21, sel_initWithUUID_serviceName_, v10, v11);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_commonFields, a5);
    objc_storeStrong((id *)&v19->_backend, a6);
  }

  return v19;
}

- (void)submitEventWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMRTCSession *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("HMFEventName"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("HMFTimestamp"));

  -[HMMNullRTCSession uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("HMFSessionIdentifier"));

  -[HMMRTCSession commonFields](self, "commonFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v14);

  v15 = (void *)MEMORY[0x1D17B78FC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMNullRTCSession uuid](v16, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v18;
    v23 = 2112;
    v24 = v19;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1CD029000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Submitting event: %@", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMMRTCSession backend](v16, "backend");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v8);

}

- (NSDictionary)commonFields
{
  return self->_commonFields;
}

- (HMMRTCBackendSession)backend
{
  return self->_backend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_commonFields, 0);
}

@end
