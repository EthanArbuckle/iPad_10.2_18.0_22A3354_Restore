@implementation HMDMetricsAccessoryDetailsManager

- (HMDMetricsAccessoryDetailsManager)initWithDataSource:(id)a3
{
  id v4;
  HMDMetricsAccessoryDetailsManager *v5;
  HMDMetricsAccessoryDetailsManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDMetricsAccessoryDetailsManager;
  v5 = -[HMDMetricsAccessoryDetailsManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMetricsAccessoryDetailsManager *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMetricsAccessoryDetailsManager accessoryCategoryLogEventsForHomeWithUUID:](self, "accessoryCategoryLogEventsForHomeWithUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    +[HMDAccessoryCategoryLogEvent denominatorSpecifyingEvent](HMDAccessoryCategoryLogEvent, "denominatorSpecifyingEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v10 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Returning NULL (for onboarded configuration) to household metrics request for home with UUID: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)accessoryCategoryLogEventsForHomeWithUUID:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  HMDAccessoryCategoryLogEvent *v25;
  void *v26;
  void *v27;
  HMDAccessoryCategoryLogEvent *v28;
  id v29;
  void *v30;
  HMDAccessoryCategoryLogEvent *v31;
  void *v32;
  HMDAccessoryCategoryLogEvent *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAccessoryCategoryLogEvent *v39;
  void *v40;
  HMDMetricsAccessoryDetailsManager *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  HMDMetricsAccessoryDetailsManager *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  _QWORD v72[3];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  v52 = self;
  -[HMDMetricsAccessoryDetailsManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v46 = v4;
  objc_msgSend(v4, "homeDataSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v65;
    v55 = *MEMORY[0x24BDD4A50];
    v54 = *MEMORY[0x24BDD4A60];
    v53 = *MEMORY[0x24BDD4A68];
    v51 = *MEMORY[0x24BDD4A30];
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v65 != v48)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (v58)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "uuid");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqual:", v58);

          if (!v8)
            continue;
        }
        v50 = i;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v6, "accessories");
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        if (!v9)
          goto LABEL_43;
        v10 = v9;
        v59 = *(_QWORD *)v61;
        while (1)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v61 != v59)
              objc_enumerationMutation(v56);
            v12 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
            v14 = v13;

            if (!v14)
            {
              v29 = v12;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v30 = v29;
              else
                v30 = 0;
              v15 = v30;

              if (v15)
              {
                v31 = [HMDAccessoryCategoryLogEvent alloc];
                objc_msgSend(v29, "category");
                v16 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "categoryType");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = -[HMDAccessoryCategoryLogEvent initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:](v31, "initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:", 2, v32, v58);
                objc_msgSend(v57, "addObject:", v33);

              }
              else
              {
                v34 = v29;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v35 = v34;
                else
                  v35 = 0;
                v16 = v35;

                if (v16)
                {
                  objc_msgSend(v34, "category");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "categoryType");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "stringByAppendingString:", CFSTR("_AirPlay"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  v39 = -[HMDAccessoryCategoryLogEvent initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:]([HMDAccessoryCategoryLogEvent alloc], "initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:", 1, v38, v58);
                  objc_msgSend(v57, "addObject:", v39);

                  v15 = 0;
                }
                else
                {
                  v40 = (void *)MEMORY[0x227676638]();
                  v41 = v52;
                  HMFGetOSLogHandle();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v69 = v43;
                    v70 = 2112;
                    v71 = v34;
                    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Accessory category not found for: %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v40);
                  v16 = 0;
                  v15 = 0;
                }
              }
              goto LABEL_38;
            }
            objc_msgSend(v14, "hostAccessory");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v15)
            {
              +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:](HMDMetricsUtilities, "primaryServiceTypeForHAPAccessory:", v14);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v72[0] = v55;
              v72[1] = v54;
              v72[2] = v53;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v14, "hasTelevisionService") & 1) != 0)
                goto LABEL_23;
              objc_msgSend(v14, "category");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "categoryType");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v17, "containsObject:", v19);

              if ((v20 & 1) != 0
                || (objc_msgSend(v16, "isEqual:", CFSTR("00000228-0000-1000-8000-0026BB765291")) & 1) != 0
                || (objc_msgSend(v14, "category"),
                    v21 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v21, "categoryType"),
                    v22 = (void *)objc_claimAutoreleasedReturnValue(),
                    v23 = objc_msgSend(v22, "isEqualToString:", v51),
                    v22,
                    v21,
                    v23))
              {
LABEL_23:
                v24 = 1;
              }
              else
              {
                v24 = 3;
              }
              v25 = [HMDAccessoryCategoryLogEvent alloc];
              objc_msgSend(v12, "category");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "categoryType");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[HMDAccessoryCategoryLogEvent initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:](v25, "initWithAccessoryDetailsType:accessoryCategoryIdentifier:homeUUID:", v24, v27, v58);
              objc_msgSend(v57, "addObject:", v28);

LABEL_38:
            }

            ++v11;
          }
          while (v10 != v11);
          v44 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
          v10 = v44;
          if (!v44)
          {
LABEL_43:

            i = v50;
            break;
          }
        }
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v49);
  }

  return v57;
}

- (HMDHouseholdMetricsDataSource)dataSource
{
  return (HMDHouseholdMetricsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
