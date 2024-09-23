@implementation HMDResidentAppleMediaStateManager

- (HMDResidentAppleMediaStateManager)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HMDResidentAppleMediaStateManager *v8;
  HMDResidentAppleMediaStateManager *v9;
  uint64_t v10;
  NSMutableSet *subscribedMediaProfiles;
  uint64_t v12;
  NSMutableSet *mediaProfilesToRetry;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentAppleMediaStateManager;
  v8 = -[HMDResidentAppleMediaStateManager init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    subscribedMediaProfiles = v9->_subscribedMediaProfiles;
    v9->_subscribedMediaProfiles = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    mediaProfilesToRetry = v9->_mediaProfilesToRetry;
    v9->_mediaProfilesToRetry = (NSMutableSet *)v12;

    v9->_retryCount = 0;
  }

  return v9;
}

- (void)configureWithNotificationRegistry:(id)a3 notificationCenter:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "addDelegate:", self);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAppleMediaAccessoryReachabilityChanged_, CFSTR("HMDAppleMediaAccessoryDeviceIsReachableNotification"), 0);

}

- (void)handleAppleMediaAccessoryReachabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  id Property;
  id v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      if (self)
        Property = objc_getProperty(self, v9, 32, 1);
      else
        Property = 0;
      v11 = Property;
      objc_msgSend(v8, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

      os_unfair_lock_unlock(&self->_lock);
      if ((v13 & 1) != 0)
        -[HMDResidentAppleMediaStateManager refreshStateForMediaProfile:](self, v8);
    }

  }
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  void *v5;
  void *v6;
  HMDResidentAppleMediaStateManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (HMFTimer *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_retryTimer == v4)
  {
    self->_retryTimer = 0;

    -[NSMutableSet allObjects](self->_mediaProfilesToRetry, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeAllObjects](self->_mediaProfilesToRetry, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Retrying media subscription for profiles: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentAppleMediaStateManager mediaPropertyRegistrationsDidChangeForMediaProfiles:](v7, "mediaPropertyRegistrationsDidChangeForMediaProfiles:", v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

}

- (void)mediaPropertyRegistrationsDidChangeForMediaProfiles:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDResidentAppleMediaStateManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_unfair_lock_s *p_lock;
  SEL v23;
  id v24;
  void *v25;
  int v26;
  const char *v27;
  void *v28;
  HMDResidentAppleMediaStateManager *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  HMDResidentAppleMediaStateManager *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  HMDResidentAppleMediaStateManager *v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  HMDResidentAppleMediaStateManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  os_unfair_lock_s *v58;
  SEL v59;
  id v60;
  void *v61;
  char v62;
  const char *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  HMDResidentAppleMediaStateManager *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  HMDResidentAppleMediaStateManager *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  HMDResidentAppleMediaStateManager *v78;
  NSObject *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  HMDResidentAppleMediaStateManager *v84;
  NSObject *v85;
  void *v86;
  id v87;
  void *v88;
  id *to;
  id obj;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id WeakRetained;
  HMDResidentAppleMediaStateManager *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  _QWORD v106[5];
  _BYTE v107[128];
  uint8_t v108[128];
  _BYTE buf[24];
  id *v110;
  id v111;
  id v112;
  uint8_t v113[4];
  id v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v96 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v87;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that media profile registrations did change: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke;
  v106[3] = &unk_1E89C2198;
  v106[4] = v96;
  objc_msgSend(v87, "na_filter:", v106);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke_2;
  v105[3] = &unk_1E89C2198;
  v105[4] = v96;
  objc_msgSend(v87, "na_filter:", v105);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
    WeakRetained = objc_loadWeakRetained((id *)&v96->_dataSource);
  else
    WeakRetained = 0;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v9;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
  if (v93)
  {
    v91 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v93; ++i)
      {
        if (*(_QWORD *)v102 != v91)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "mediaProfileForUniqueIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          if (v96)
          {
            v17 = (void *)MEMORY[0x1D17BA0A0]();
            v18 = v96;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "uniqueIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v113 = 138543618;
              v114 = v20;
              v115 = 2112;
              v116 = v21;
              _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Subscribing to updates for media profile identifier: %@", v113, 0x16u);

            }
            objc_autoreleasePoolPop(v17);
            p_lock = &v18->_lock;
            os_unfair_lock_lock_with_options();
            v24 = objc_getProperty(v18, v23, 32, 1);
            objc_msgSend(v16, "uniqueIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "containsObject:", v25);

            if (v26)
            {
              v28 = (void *)MEMORY[0x1D17BA0A0]();
              v29 = v18;
              HMFGetOSLogHandle();
              v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v31 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "uniqueIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v113 = 138543618;
                v114 = v31;
                v115 = 2112;
                v116 = v32;
                _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Already registered for updates for media profile identifier: %@", v113, 0x16u);

              }
              objc_autoreleasePoolPop(v28);
              os_unfair_lock_unlock(p_lock);
            }
            else
            {
              v37 = objc_getProperty(v18, v27, 32, 1);
              objc_msgSend(v16, "uniqueIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v38);

              os_unfair_lock_unlock(&v18->_lock);
              objc_msgSend(v16, "accessory");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v40 = v39;
              else
                v40 = 0;
              v41 = v40;

              if (objc_msgSend(v41, "isCurrentAccessory"))
              {
                v42 = (void *)MEMORY[0x1D17BA0A0]();
                v43 = v18;
                HMFGetOSLogHandle();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v113 = 138543362;
                  v114 = v45;
                  _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Subscribed for updates for media profile identifier on current device", v113, 0xCu);

                }
                objc_autoreleasePoolPop(v42);
              }
              else
              {
                objc_initWeak((id *)v113, v18);
                v46 = objc_loadWeakRetained((id *)&v18->_delegate);
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __71__HMDResidentAppleMediaStateManager_subscribeToUpdatesForMediaProfile___block_invoke;
                v110 = (id *)&unk_1E89BF250;
                objc_copyWeak(&v112, (id *)v113);
                v47 = v16;
                v111 = v47;
                objc_msgSend(v46, "enableMediaNotifications:directlyOnMediaAccessory:forStateManager:completion:", 1, v41, v18, buf);

                -[HMDResidentAppleMediaStateManager refreshStateForMediaProfile:](v18, v47);
                objc_destroyWeak(&v112);
                objc_destroyWeak((id *)v113);
              }

            }
          }

        }
        else
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v96;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v13;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find media profile with uniqueIdentifier: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
        }

      }
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
    }
    while (v93);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  to = v88;
  v94 = objc_msgSend(to, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
  if (v94)
  {
    v92 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v94; ++j)
      {
        if (*(_QWORD *)v98 != v92)
          objc_enumerationMutation(to);
        v49 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
        objc_msgSend(WeakRetained, "mediaProfileForUniqueIdentifier:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
        {
          v52 = v50;
          if (v96)
          {
            v53 = (void *)MEMORY[0x1D17BA0A0]();
            v54 = v96;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "uniqueIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v113 = 138543618;
              v114 = v56;
              v115 = 2112;
              v116 = v57;
              _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to updates for media profile identifier: %@", v113, 0x16u);

            }
            objc_autoreleasePoolPop(v53);
            v58 = &v54->_lock;
            os_unfair_lock_lock_with_options();
            v60 = objc_getProperty(v54, v59, 32, 1);
            objc_msgSend(v52, "uniqueIdentifier");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v60, "containsObject:", v61);

            if ((v62 & 1) != 0)
            {
              v64 = objc_getProperty(v54, v63, 32, 1);
              objc_msgSend(v52, "uniqueIdentifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "removeObject:", v65);

              os_unfair_lock_unlock(&v54->_lock);
              objc_msgSend(v52, "accessory");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v67 = v66;
              else
                v67 = 0;
              v68 = v67;

              if (objc_msgSend(v68, "isCurrentAccessory"))
              {
                v69 = (void *)MEMORY[0x1D17BA0A0]();
                v70 = v54;
                HMFGetOSLogHandle();
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v113 = 138543362;
                  v114 = v72;
                  _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed for updates for media profile identifier on current device", v113, 0xCu);

                }
                objc_autoreleasePoolPop(v69);
              }
              else
              {
                objc_initWeak((id *)v113, v54);
                v82 = objc_loadWeakRetained((id *)&v54->_delegate);
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __73__HMDResidentAppleMediaStateManager_unsubscribeToUpdatesForMediaProfile___block_invoke;
                v110 = (id *)&unk_1E89BF250;
                objc_copyWeak(&v112, (id *)v113);
                v111 = v52;
                objc_msgSend(v82, "enableMediaNotifications:directlyOnMediaAccessory:forStateManager:completion:", 0, v68, v54, buf);

                objc_destroyWeak(&v112);
                objc_destroyWeak((id *)v113);
              }

            }
            else
            {
              v77 = (void *)MEMORY[0x1D17BA0A0]();
              v78 = v54;
              HMFGetOSLogHandle();
              v79 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v80 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "uniqueIdentifier");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v113 = 138543618;
                v114 = v80;
                v115 = 2112;
                v116 = v81;
                _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_INFO, "%{public}@Already unsubscribed for updates for media profile identifier: %@", v113, 0x16u);

              }
              objc_autoreleasePoolPop(v77);
              os_unfair_lock_unlock(v58);
            }
          }

        }
        else
        {
          v73 = (void *)MEMORY[0x1D17BA0A0]();
          v74 = v96;
          HMFGetOSLogHandle();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v76;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v49;
            _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_ERROR, "%{public}@Could not find media profile with uniqueIdentifier: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v73);
        }

      }
      v94 = objc_msgSend(to, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
    }
    while (v94);
  }

  v83 = (void *)MEMORY[0x1D17BA0A0]();
  v84 = v96;
  HMFGetOSLogHandle();
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v86;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = obj;
    *(_WORD *)&buf[22] = 2112;
    v110 = to;
    _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_INFO, "%{public}@Added %@ media profiles and removed: %@ media profiles from media state management", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v83);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_mediaProfilesToRetry, 0);
  objc_storeStrong((id *)&self->_subscribedMediaProfiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

BOOL __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  return -[HMDResidentAppleMediaStateManager hasRegistrationsForMediaProfileIdentifier:](*(_QWORD *)(a1 + 32), a2);
}

BOOL __89__HMDResidentAppleMediaStateManager_mediaPropertyRegistrationsDidChangeForMediaProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  return !-[HMDResidentAppleMediaStateManager hasRegistrationsForMediaProfileIdentifier:](*(_QWORD *)(a1 + 32), a2);
}

void __73__HMDResidentAppleMediaStateManager_unsubscribeToUpdatesForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  void *v13;
  SEL v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (os_unfair_lock_s *)WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed for updates for media profile identifier: %@ with success: %@ - %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    if (v3)
    {
      v12 = objc_getProperty(v6, v11, 32, 1);
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      v15 = objc_getProperty(v6, v14, 40, 1);
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      os_unfair_lock_unlock(v6 + 2);
      -[HMDResidentAppleMediaStateManager startRetryTimer](v6);
    }
    else
    {
      *(_QWORD *)&v6[14]._os_unfair_lock_opaque = 0;
      os_unfair_lock_unlock(v6 + 2);
    }
  }

}

- (void)startRetryTimer
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id WeakRetained;
  uint64_t v17;
  id v18;
  os_unfair_lock_s *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 2;
  v3 = os_unfair_lock_lock_with_options();
  if (*(_QWORD *)&a1[12]._os_unfair_lock_opaque)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](v3);
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Not starting media state manager retry timer because one is already running", (uint8_t *)&v21, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v4);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)&a1[14]._os_unfair_lock_opaque;
  if (v8 > 8)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](v3);
    v19 = a1;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Not starting media state manager retry timer due to too many failed retries", (uint8_t *)&v21, 0xCu);

    }
    goto LABEL_10;
  }
  v9 = v8 + 1;
  *(_QWORD *)&a1[14]._os_unfair_lock_opaque = v9;
  v10 = HMDResidentAppleMediaStateManagerRetryIntervals[v9];
  v11 = (void *)MEMORY[0x1D17BA0A0](v3);
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting media state manager retry timer with fire interval: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  WeakRetained = objc_loadWeakRetained(v12 + 2);
  objc_msgSend(WeakRetained, "timerWithTimerInterval:", (double)v10);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v12[6];
  v12[6] = (id)v17;

  objc_msgSend(v12[6], "setDelegate:", v12);
  objc_msgSend(v12[6], "resume");
LABEL_11:
  os_unfair_lock_unlock(v2);
}

void __71__HMDResidentAppleMediaStateManager_subscribeToUpdatesForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  void *v13;
  SEL v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (os_unfair_lock_s *)WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Subscribed for updates for media profile identifier: %@ with success: %@ - %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    if (v3)
    {
      v12 = objc_getProperty(v6, v11, 32, 1);
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v13);

      v15 = objc_getProperty(v6, v14, 40, 1);
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      os_unfair_lock_unlock(v6 + 2);
      -[HMDResidentAppleMediaStateManager startRetryTimer](v6);
    }
    else
    {
      *(_QWORD *)&v6[14]._os_unfair_lock_opaque = 0;
      os_unfair_lock_unlock(v6 + 2);
    }
  }

}

- (void)refreshStateForMediaProfile:(void *)a1
{
  id v3;
  void *v4;
  id *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Refreshing state for media profile with unique identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      WeakRetained = objc_loadWeakRetained(v5 + 3);
      v19 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "readProfileState:viaDevice:forStateManager:", v14, v12, v5);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v5;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v21 = v18;
        v22 = 2112;
        v23 = 0;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = v3;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to refresh state either device: %@ for accessory: %@, mediaProfile: %@ is nil", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
}

- (BOOL)hasRegistrationsForMediaProfileIdentifier:(uint64_t)a1
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 16);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "propertiesRegisteredForMediaProfileUniqueIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count") != 0;
  return v6;
}

@end
