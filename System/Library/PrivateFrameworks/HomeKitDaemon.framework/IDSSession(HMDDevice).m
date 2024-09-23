@implementation IDSSession(HMDDevice)

+ (id)hmd_sessionWithAccount:()HMDDevice device:options:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  _HMDGlobalDeviceHandle *v30;
  void *v31;
  _HMDGlobalDeviceHandle *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  HMDAssertionLogEvent *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isCurrentAccount"))
    {
      v47 = a1;
      v49 = v9;
      objc_msgSend(v12, "primaryHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v12, "handles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
      v50 = v8;
      v48 = v10;
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v56;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v56 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            if (objc_msgSend(v19, "isLocal"))
            {
              v21 = v19;

              v13 = v21;
              goto LABEL_14;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_14:

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v11, "globalHandles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v52;
        while (2)
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v52 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "internal");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v28 = v27;
            else
              v28 = 0;
            v29 = v28;

            if (v29)
            {
              v30 = [_HMDGlobalDeviceHandle alloc];
              objc_msgSend(v29, "pushToken");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = -[_HMDGlobalDeviceHandle initWithPushToken:accountHandle:](v30, "initWithPushToken:accountHandle:", v31, v13);

              if (v32)
              {
                -[_HMDGlobalDeviceHandle destination](v32, "destination");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v9 = v49;
                v8 = v50;
                v10 = v48;
                a1 = v47;
                goto LABEL_29;
              }
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v24)
            continue;
          break;
        }
      }

      v9 = v49;
      v8 = v50;
      v10 = v48;
      a1 = v47;
    }
    objc_msgSend(v11, "remoteDestinationString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

    if (v33)
    {
      v34 = objc_alloc(MEMORY[0x24BE4FCD0]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v34, "initWithAccount:destinations:options:", v8, v35, v10);

    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = a1;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v40;
        v62 = 2112;
        v63 = v11;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to create session for device, could not create destination: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      v41 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Failed to create session for device, could not create destination: %@"), v11);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "submitLogEvent:", v41);

      v43 = (void *)MEMORY[0x227676638]();
      v44 = v38;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v46;
        v62 = 2112;
        v63 = v11;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to create session for device: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
