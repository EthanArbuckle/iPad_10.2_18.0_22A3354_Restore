@implementation HMDWidgetConfigurationReader

- (HMDWidgetConfigurationReader)init
{
  void *v3;
  uint64_t v4;
  id v5;
  HMDWidgetConfigurationReader *v6;

  +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds](HMDWidgetFetchSpecification, "allHomeLockScreenWidgetKinds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB8D08];
  v5 = objc_alloc_init(MEMORY[0x1E0D10160]);
  v6 = -[HMDWidgetConfigurationReader initWithInterface:bundleIdentifier:lockScreenWidgetKinds:](self, "initWithInterface:bundleIdentifier:lockScreenWidgetKinds:", v5, v4, v3);

  return v6;
}

- (HMDWidgetConfigurationReader)initWithInterface:(id)a3 bundleIdentifier:(id)a4 lockScreenWidgetKinds:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDWidgetConfigurationReader *v12;
  HMDWidgetConfigurationReader *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDWidgetConfigurationReader;
  v12 = -[HMDWidgetConfigurationReader init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_lockScreenWidgetKinds, a5);
  }

  return v13;
}

- (id)fetchedHomeWidgets
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (!self)
    return MEMORY[0x1E0C9AA60];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__177624;
  v16 = __Block_byref_object_dispose__177625;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  -[HMDWidgetConfigurationReader interface](self, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HMDWidgetConfigurationReader_fetchedHomeWidgets__block_invoke;
  v9[3] = &unk_1E89C0910;
  v9[4] = self;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "allConfiguredWidgetsWithCompletion:", v9);

  v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchHomeWidgetsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
  {
    -[HMDWidgetConfigurationReader interface](self, "interface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke;
    v7[3] = &unk_1E89C0960;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "allConfiguredWidgetsWithCompletion:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

- (int64_t)homeWidgetsEnabledCount
{
  void *v2;
  int64_t v3;

  -[HMDWidgetConfigurationReader fetchedHomeWidgets](self, "fetchedHomeWidgets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (HMDWidgetConfigurationReaderInterface)interface
{
  return (HMDWidgetConfigurationReaderInterface *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSSet)lockScreenWidgetKinds
{
  return self->_lockScreenWidgetKinds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenWidgetKinds, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

void __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "widgetConfigurationsForApplicationContainerBundleIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObjectsFromArray:", v15);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v10);
    }

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke_2;
    v21[3] = &unk_1E89C0938;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "na_map:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched configured widgets: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

HMDWidget *__63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  HMDWidget *v65;
  void *v66;
  void *v67;
  HMDWidget *v68;
  id v70;
  void *v71;
  id v72;
  id v73;
  int v74;
  void *v75;
  void *v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  char v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  _QWORD v88[3];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (!v4)
    goto LABEL_3;
  objc_msgSend(v4, "lockScreenWidgetKinds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v75 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
LABEL_3:

    v10 = 0;
LABEL_58:
    v68 = 0;
    goto LABEL_59;
  }
  objc_msgSend(v5, "widget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v75;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widget");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "intent");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v27;
      v85 = 2112;
      v86 = v29;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Ignoring widget configuration because the intent is not INAppIntent: %@", buf, 0x16u);

    }
    goto LABEL_21;
  }
  v82 = 0;
  objc_msgSend(v14, "serializedParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", CFSTR("useHomeKitRecommendations"), &v82);

  if (!v82)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v75;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serializedParameters");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v84 = v31;
      v85 = 2112;
      v86 = CFSTR("useHomeKitRecommendations");
      v87 = 2112;
      v88[0] = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Ignoring widget configuration because %@ key is missing from serialized parameters: %@", buf, 0x20u);

    }
LABEL_21:

    objc_autoreleasePoolPop(v24);
    v10 = 0;
    goto LABEL_56;
  }
  objc_msgSend(v14, "serializedParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("accessoriesAndScenes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = 1;
  else
    v19 = v16;
  if ((v19 & 1) != 0)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0D3E558]);
    v21 = v20;
    v74 = v16;
    if (v16)
    {
      v22 = (id)objc_msgSend(v20, "combineContentsOfPropertyListObject:", CFSTR("0FD0F71F-DAB9-4D7F-90C4-AB0A0E4724E4"));
      v23 = v75;
    }
    else
    {
      v38 = v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
      v40 = v39;

      if (v40)
      {
        v76 = v21;
        v71 = v18;
        v72 = v14;
        v73 = v5;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v70 = v40;
        obj = v40;
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
        v23 = v75;
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v79 != v43)
                objc_enumerationMutation(obj);
              v45 = (__CFString *)*(id *)(*((_QWORD *)&v78 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v46 = v45;
              else
                v46 = 0;
              v47 = v46;

              if (v47)
              {
                -[__CFString hmf_stringForKey:](v45, "hmf_stringForKey:", CFSTR("identifier"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (v48)
                {
                  v49 = (id)objc_msgSend(v76, "combineContentsOfPropertyListObject:", v48);
                }
                else
                {
                  v54 = (void *)MEMORY[0x1D17BA0A0]();
                  v55 = v23;
                  HMFGetOSLogHandle();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v84 = v57;
                    v85 = 2112;
                    v86 = v45;
                    _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly missing the identifier in %@", buf, 0x16u);

                    v23 = v75;
                  }

                  objc_autoreleasePoolPop(v54);
                }

              }
              else
              {
                v50 = (void *)MEMORY[0x1D17BA0A0]();
                v51 = v23;
                HMFGetOSLogHandle();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v84 = v53;
                  v85 = 2112;
                  v86 = v45;
                  _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@accessoryOrScene is not a dictionary! %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v50);
              }

            }
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          }
          while (v42);
        }

        v14 = v72;
        v5 = v73;
        v40 = v70;
        v18 = v71;
        v21 = v76;
      }
      else
      {
        v58 = (id)objc_msgSend(v21, "combineContentsOfPropertyListObject:", v38);
        v23 = v75;
      }

    }
    v59 = v21;
    v60 = objc_msgSend(v21, "finalize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v60);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x1D17BA0A0]();
    v62 = v23;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v84 = v64;
      v85 = 2114;
      v86 = v10;
      v87 = 1024;
      LODWORD(v88[0]) = v74;
      WORD2(v88[0]) = 2112;
      *(_QWORD *)((char *)v88 + 6) = v18;
      _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_DEBUG, "%{public}@IFObjectHasher: computed widget identifier %{public}@ with useHomeKitRecommendations=%{BOOL}d, accessoriesAndScenes=%@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v61);

  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v75;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serializedParameters");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v84 = v36;
      v85 = 2112;
      v86 = CFSTR("accessoriesAndScenes");
      v87 = 2112;
      v88[0] = v37;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Ignoring widget configuration because %@ key is missing from serialized parameters: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v33);
    v10 = 0;
  }

LABEL_56:
  if (!v10)
    goto LABEL_58;
  v65 = [HMDWidget alloc];
  objc_msgSend(v5, "widget");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "kind");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[HMDWidget initWithIdentifier:kind:](v65, "initWithIdentifier:kind:", v10, v67);

LABEL_59:
  return v68;
}

void __50__HMDWidgetConfigurationReader_fetchedHomeWidgets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "widgetConfigurationsForApplicationContainerBundleIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_177631 != -1)
    dispatch_once(&logCategory__hmf_once_t10_177631, &__block_literal_global_177632);
  return (id)logCategory__hmf_once_v11_177633;
}

void __43__HMDWidgetConfigurationReader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_177633;
  logCategory__hmf_once_v11_177633 = v0;

}

@end
