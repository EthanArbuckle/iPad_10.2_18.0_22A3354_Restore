@implementation HAPAccessoryServerIPConnectionStatistics

- (HAPAccessoryServerIPConnectionStatistics)initWithAccessory:(id)a3
{
  id v4;
  HAPAccessoryServerIPConnectionStatistics *v5;
  HAPAccessoryServerIPConnectionStatistics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HAPAccessoryServerIPConnectionStatistics;
  v5 = -[HAPAccessoryServerIPConnectionStatistics init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    v6->_state = 0;
    v6->_sessionRestoreActive = 0;
  }

  return v6;
}

- (void)generateBonjourRemoveMetric
{
  void *v3;
  HAPMetricsBonjourIncorrrectStateLogEvent *v4;
  void *v5;
  HAPMetricsBonjourIncorrrectStateLogEvent *v6;
  void *v7;
  void *v8;
  HAPAccessoryServerIPConnectionStatistics *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIPConnectionStatistics accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HAPMetricsBonjourIncorrrectStateLogEvent alloc];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HAPMetricsBonjourIncorrrectStateLogEvent initWithDeviceID:](v4, "initWithDeviceID:", v5);

    +[HAPMetricsDispatcher sharedInstance](HAPMetricsDispatcher, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitLogEvent:", v6);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot generate bonjour metric as accessory server is nil", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)accessoryServerIPEvent:(int64_t)a3
{
  void *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  int64_t state;
  void *v9;
  HAPAccessoryServerIPConnectionStatistics *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  HAPAccessoryServerIPConnectionStatistics *v15;
  NSObject *v16;
  void *v17;
  int64_t v18;
  void *v19;
  HAPAccessoryServerIPConnectionStatistics *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  HAPAccessoryServerIPConnectionStatistics *v26;
  NSObject *v27;
  id v28;
  void *v29;
  int64_t v30;
  void *v31;
  HAPAccessoryServerIPConnectionStatistics *v32;
  NSObject *v33;
  id v34;
  void *v35;
  int64_t v36;
  void *v37;
  HAPAccessoryServerIPConnectionStatistics *v38;
  NSObject *v39;
  id v40;
  void *v41;
  int64_t v42;
  void *v43;
  HAPAccessoryServerIPConnectionStatistics *v44;
  NSObject *v45;
  id v46;
  void *v47;
  int64_t v48;
  void *v49;
  HAPAccessoryServerIPConnectionStatistics *v50;
  NSObject *v51;
  id v52;
  void *v53;
  HAPAccessoryServerIPConnectionStatistics *v54;
  id v55;
  void *v56;
  void *v57;
  HAPAccessoryServerIPConnectionStatistics *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  HAPAccessoryServerIPConnectionStatistics *v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  void *v67;
  unint64_t v68;
  const __CFString *v69;
  const __CFString *v70;
  void *v71;
  HAPAccessoryServerIPConnectionStatistics *v72;
  NSObject *v73;
  id v74;
  void *v75;
  void *v76;
  HAPAccessoryServerIPConnectionStatistics *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  unint64_t v81;
  const __CFString *v82;
  os_unfair_lock_s *v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  const __CFString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIPConnectionStatistics accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    p_lock = &self->_lock;
    v7 = os_unfair_lock_lock_with_options();
    state = self->_state;
    switch(a3)
    {
      case 0:
        if (!self->_sessionRestoreActive)
          goto LABEL_57;
        v9 = (void *)MEMORY[0x1D17B7244](v7);
        v10 = self;
        HMFGetOSLogHandle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = (uint64_t)v12;
          v86 = 2112;
          v87 = (uint64_t)v13;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection BonjourUndiscovered", buf, 0x16u);

        }
        goto LABEL_50;
      case 1:
        v36 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v37 = (void *)MEMORY[0x1D17B7244](v7);
          v38 = self;
          HMFGetOSLogHandle();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v40;
            v86 = 2112;
            v87 = (uint64_t)v41;
            _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection BonjourRemoved", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v37);
          v36 = self->_state;
        }
        if (v36 == 1)
          goto LABEL_56;
        if (v36 != 2)
          goto LABEL_57;
        v24 = 0;
        self->_metricTriggered = 0;
        state = 3;
        goto LABEL_58;
      case 2:
        v18 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v19 = (void *)MEMORY[0x1D17B7244](v7);
          v20 = self;
          HMFGetOSLogHandle();
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v22;
            v86 = 2112;
            v87 = (uint64_t)v23;
            _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection BonjourAdd", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v19);
          v18 = self->_state;
        }
        v24 = 0;
        if (!v18)
          state = 1;
        self->_metricTriggered = 0;
        goto LABEL_58;
      case 3:
        if (self->_sessionRestoreActive)
        {
          v25 = (void *)MEMORY[0x1D17B7244](v7);
          v26 = self;
          HMFGetOSLogHandle();
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v28;
            v86 = 2112;
            v87 = (uint64_t)v29;
            _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Connected", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v25);
          state = self->_state;
        }
        if (state == 1)
        {
          v24 = 0;
          state = 2;
LABEL_58:
          if (!HAPIsInternalBuild() || !self->_sessionRestoreActive || self->_metricTriggered)
            v24 = 0;
          if (self->_state != state)
          {
            v62 = (void *)MEMORY[0x1D17B7244]();
            v63 = self;
            HMFGetOSLogHandle();
            v64 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              v83 = p_lock;
              HMFGetLogIdentifier();
              v65 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "identifier");
              v66 = objc_claimAutoreleasedReturnValue();
              v67 = (void *)v66;
              v68 = self->_state - 1;
              if (v68 > 2)
                v69 = CFSTR("HAPAccessoryServerIPDiscoveryState_Undiscovered");
              else
                v69 = off_1E894C630[v68];
              if ((unint64_t)(state - 1) > 2)
                v70 = CFSTR("HAPAccessoryServerIPDiscoveryState_Undiscovered");
              else
                v70 = off_1E894C630[state - 1];
              *(_DWORD *)buf = 138544130;
              v85 = (uint64_t)v65;
              v86 = 2112;
              v87 = v66;
              v88 = 2112;
              v89 = v69;
              v90 = 2112;
              v91 = v70;
              _os_log_impl(&dword_1CCE01000, v64, OS_LOG_TYPE_INFO, "%{public}@%@ updating discovery state from %@ to %@", buf, 0x2Au);

              p_lock = v83;
            }

            objc_autoreleasePoolPop(v62);
          }
          self->_state = state;
          if (v24)
          {
            v71 = (void *)MEMORY[0x1D17B7244]();
            v72 = self;
            HMFGetOSLogHandle();
            v73 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v74 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "identifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v85 = (uint64_t)v74;
              v86 = 2112;
              v87 = (uint64_t)v75;
              _os_log_impl(&dword_1CCE01000, v73, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection bonjour submitting metric", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v71);
            v72->_metricTriggered = 1;
            os_unfair_lock_unlock(p_lock);
            -[HAPAccessoryServerIPConnectionStatistics generateBonjourRemoveMetric](v72, "generateBonjourRemoveMetric");
            goto LABEL_84;
          }
        }
        else
        {
          v76 = (void *)MEMORY[0x1D17B7244](v7);
          v77 = self;
          HMFGetOSLogHandle();
          v78 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v79 = objc_claimAutoreleasedReturnValue();
            v80 = (void *)v79;
            v81 = self->_state - 1;
            if (v81 > 2)
              v82 = CFSTR("HAPAccessoryServerIPDiscoveryState_Undiscovered");
            else
              v82 = off_1E894C630[v81];
            *(_DWORD *)buf = 138543618;
            v85 = v79;
            v86 = 2112;
            v87 = (uint64_t)v82;
            _os_log_impl(&dword_1CCE01000, v78, OS_LOG_TYPE_ERROR, "%{public}@*** transitioning to invalid state %@ while connected", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v76);
        }
        os_unfair_lock_unlock(p_lock);
        goto LABEL_84;
      case 4:
        v30 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v31 = (void *)MEMORY[0x1D17B7244](v7);
          v32 = self;
          HMFGetOSLogHandle();
          v33 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v34;
            v86 = 2112;
            v87 = (uint64_t)v35;
            _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Connection Failed", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v31);
          v30 = self->_state;
        }
        if (v30 == 2)
        {
          v24 = 0;
          state = 1;
        }
        else
        {
          if (v30 == 3)
LABEL_56:
            state = 0;
LABEL_57:
          v24 = 0;
        }
        goto LABEL_58;
      case 5:
        v42 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v43 = (void *)MEMORY[0x1D17B7244](v7);
          v44 = self;
          HMFGetOSLogHandle();
          v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v46;
            v86 = 2112;
            v87 = (uint64_t)v47;
            _os_log_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection ConnectionTerminated", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v43);
          v42 = self->_state;
        }
        v24 = 0;
        if (v42 == 2)
          state = 1;
        goto LABEL_58;
      case 6:
        v48 = self->_state;
        if (self->_sessionRestoreActive)
        {
          v49 = (void *)MEMORY[0x1D17B7244](v7);
          v50 = self;
          HMFGetOSLogHandle();
          v51 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v52 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v52;
            v86 = 2112;
            v87 = (uint64_t)v53;
            _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_DEBUG, "%{public}@%@ IP Connection Successful Transaction", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v49);
          v48 = self->_state;
        }
        v24 = v48 == 3;
        goto LABEL_58;
      case 7:
        self->_sessionRestoreActive = 1;
        v9 = (void *)MEMORY[0x1D17B7244](v7);
        v54 = self;
        HMFGetOSLogHandle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v55 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = (uint64_t)v55;
          v86 = 2112;
          v87 = (uint64_t)v56;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Session Restore Registration", buf, 0x16u);

        }
LABEL_50:

        objc_autoreleasePoolPop(v9);
        goto LABEL_57;
      case 8:
        if (self->_sessionRestoreActive)
        {
          v57 = (void *)MEMORY[0x1D17B7244](v7);
          v58 = self;
          HMFGetOSLogHandle();
          v59 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = (uint64_t)v60;
            v86 = 2112;
            v87 = (uint64_t)v61;
            _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_INFO, "%{public}@%@ IP Connection Session Restore Deregistration", buf, 0x16u);

            p_lock = &self->_lock;
          }

          objc_autoreleasePoolPop(v57);
        }
        v24 = 0;
        self->_sessionRestoreActive = 0;
        goto LABEL_58;
      default:
        goto LABEL_57;
    }
  }
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v85 = (uint64_t)v17;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Will not update state as accessory server is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
LABEL_84:

}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)metricTriggered
{
  return self->_metricTriggered;
}

- (BOOL)sessionRestoreActive
{
  return self->_sessionRestoreActive;
}

- (HAPAccessoryServer)accessory
{
  return (HAPAccessoryServer *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
}

@end
