@implementation HMDModernTransportMessageContextManager

- (HMDModernTransportMessageContextManager)init
{
  return -[HMDModernTransportMessageContextManager initWithFactory:](self, "initWithFactory:", self);
}

- (HMDModernTransportMessageContextManager)initWithFactory:(id)a3
{
  id v4;
  HMDModernTransportMessageContextManager *v5;
  HMDModernTransportMessageContextManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *contexts;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDModernTransportMessageContextManager;
  v5 = -[HMDModernTransportMessageContextManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_factory, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contexts = v6->_contexts;
    v6->_contexts = v7;

  }
  return v6;
}

- (id)createContextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDModernTransportMessageContextManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDModernTransportMessageContextManager factory](self, "factory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contextWithMessage:options:completionHandler:dateProvider:timerProvider:", v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDModernTransportMessageContextManager contexts](self, "contexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v30 = v21;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Created context %@ for message %@", buf, 0x20u);

      v21 = v30;
      v13 = v29;
    }

    objc_autoreleasePoolPop(v21);
    v27 = v18;
  }

  return v18;
}

- (id)contextForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDModernTransportMessageContextManager contexts](self, "contexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)completeContext:(id)a3 withPayload:(id)a4 error:(id)a5 isFinal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  dispatch_qos_class_t v22;
  void (**v23)(void);
  void *v24;
  void *v25;
  HMDModernTransportMessageContextManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v6 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernTransportMessageContextManager contexts](self, "contexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "messageResponseHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "expectsMultipleResponses");

      if (v18)
      {
        v19 = (id)objc_msgSend(v11, "mutableCopy");
        if (!v19)
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("kRemoteMessageIsFinalResponseKey"));

        v21 = objc_msgSend(v19, "copy");
        v11 = (id)v21;
      }
      objc_msgSend(v10, "messageQualityOfService");
      v22 = HMFQOSClassFromQualityOfService();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__HMDModernTransportMessageContextManager_completeContext_withPayload_error_isFinal___block_invoke;
      block[3] = &unk_1E89C20C8;
      v32 = v10;
      v33 = v12;
      v11 = v11;
      v34 = v11;
      v23 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v22, 0, block);
      v23[2]();

    }
    if (v6)
    {
      objc_msgSend(v10, "done");
      -[HMDModernTransportMessageContextManager contexts](self, "contexts");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObjectForKey:", v13);

    }
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v28;
      v37 = 2112;
      v38 = v29;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v12;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Completed context %@ for message %@ with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (id)contextWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDModernTransportMessageContext *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[HMDModernTransportMessageContext initWithMessage:options:completionHandler:dateProvider:timerProvider:]([HMDModernTransportMessageContext alloc], "initWithMessage:options:completionHandler:dateProvider:timerProvider:", v15, v14, v13, v12, v11);

  return v16;
}

- (HMDModernTransportMessageContextFactory)factory
{
  return (HMDModernTransportMessageContextFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_destroyWeak((id *)&self->_factory);
}

void __85__HMDModernTransportMessageContextManager_completeContext_withPayload_error_isFinal___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageResponseHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_150797 != -1)
    dispatch_once(&logCategory__hmf_once_t2_150797, &__block_literal_global_150798);
  return (id)logCategory__hmf_once_v3_150799;
}

void __54__HMDModernTransportMessageContextManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_150799;
  logCategory__hmf_once_v3_150799 = v0;

}

@end
