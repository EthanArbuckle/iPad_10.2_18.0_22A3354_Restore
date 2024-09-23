@implementation HMDoorbellChimeProfile

void __38___HMDoorbellChimeProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3;
  logCategory__hmf_once_v3 = v0;

}

- (HMDoorbellChimeProfile)initWithDoorbellChimeProfile:(id)a3
{
  id v4;
  HMDoorbellChimeProfile *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDoorbellChimeProfile;
  v5 = -[HMAccessoryProfile initWithAccessoryProfile:](&v7, sel_initWithAccessoryProfile_, v4);
  if (v5)
    objc_msgSend(v4, "setDelegate:", v5);

  return v5;
}

- (HMDoorbellChimeProfileDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDoorbellChimeProfileDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveDoorbellChimeMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDoorbellChimeProfile *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDoorbellChimeProfile *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDoorbellChimeProfile *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDoorbellChimeProfile *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDoorbellChimeProfile *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDoorbellChimeProfile *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *context;
  void *contexta;
  void *contextb;
  _QWORD v46[4];
  id v47;
  HMDoorbellChimeProfile *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  HMDoorbellChimeProfile *v55;
  id v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HM.doorbell.chime.mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dateForKey:", CFSTR("HM.doorbell.chime.date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7 && v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v13;
        v60 = 2048;
        v61 = objc_msgSend(v7, "integerValue");
        v62 = 2112;
        v63 = v8;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received message to chime (mode %ld) on %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      v14 = objc_msgSend(v7, "integerValue");
      -[HMDoorbellChimeProfile delegate](v10, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v14 - 2) >= 2)
      {
        if (v14 == 1)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v26 = (void *)MEMORY[0x1A1AC1AAC]();
            v27 = v10;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v59 = v29;
              v60 = 2112;
              v61 = (uint64_t)v15;
              _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of chime", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
            -[HMAccessoryProfile accessoryProfile](v27, "accessoryProfile");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "context");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "delegateCaller");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke;
            v53[3] = &unk_1E3AB2228;
            v54 = v15;
            v55 = v27;
            v57 = 1;
            v56 = v8;
            objc_msgSend(v32, "invokeBlock:", v53);

          }
        }
        else
        {
          v33 = (void *)MEMORY[0x1A1AC1AAC]();
          v34 = v10;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v7, "integerValue");
            *(_DWORD *)buf = 138543618;
            v59 = v36;
            v60 = 2048;
            v61 = v37;
            _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unknown chime mode (%ld)", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
        }
      }
      else
      {
        objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HM.doorbell.chime.personText"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            context = (void *)MEMORY[0x1A1AC1AAC]();
            v17 = v10;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v59 = v42;
              v60 = 2112;
              v61 = (uint64_t)v15;
              v62 = 2048;
              v63 = v7;
              _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of chime (%ld) with person identification text", buf, 0x20u);

            }
            objc_autoreleasePoolPop(context);
            -[HMAccessoryProfile accessoryProfile](v17, "accessoryProfile");
            contexta = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(contexta, "context");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "delegateCaller");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke_75;
            v46[3] = &unk_1E3AADE98;
            v47 = v15;
            v48 = v17;
            v52 = v14;
            v49 = v8;
            v50 = v16;
            v51 = v7;
            objc_msgSend(v20, "invokeBlock:", v46);

          }
        }
        else
        {
          v38 = (void *)MEMORY[0x1A1AC1AAC]();
          v39 = v10;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            contextb = v38;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v59 = v41;
            v60 = 2048;
            v61 = (uint64_t)v7;
            v62 = 2112;
            v63 = v8;
            _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@No person identification text in spoken message, mode: %ld, date: %@", buf, 0x20u);

            v38 = contextb;
          }

          objc_autoreleasePoolPop(v38);
        }

      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        v60 = 2048;
        v61 = objc_msgSend(v7, "integerValue");
        v62 = 2112;
        v63 = v8;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No chime mode (%ld) or date (%@) in chime message", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v24;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@No message payload for chime message", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "doorbellChimeProfile:didChimeWithMode:chimeDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48)));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notified delegate: %@ of chime", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __57__HMDoorbellChimeProfile_didReceiveDoorbellChimeMessage___block_invoke_75(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "doorbellChimeProfile:didChimeWithMode:chimeDate:personIdentificationText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notified delegate: %@ of chime (%ld) with person identification text", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1)
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_76);
  return (id)logCategory__hmf_once_v16;
}

void __37__HMDoorbellChimeProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;

}

@end
