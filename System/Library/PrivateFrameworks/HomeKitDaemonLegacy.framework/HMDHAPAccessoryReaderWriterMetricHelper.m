@implementation HMDHAPAccessoryReaderWriterMetricHelper

+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 forTaskID:(id)a5 shouldSubmit:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  BOOL v26;

  v10 = a3;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0D33490];
  v13 = a4;
  objc_msgSend(v12, "currentTime");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_forTaskID_shouldSubmit___block_invoke;
  v20[3] = &unk_1E89AEF50;
  v24 = v15;
  v26 = a6;
  v21 = v10;
  v22 = v16;
  v25 = a1;
  v23 = v11;
  v17 = v11;
  v18 = v16;
  v19 = v10;
  objc_msgSend(v13, "na_each:", v20);

}

+ (void)updateLogEvents:(id)a3 withResponses:(id)a4 remoteMessageResponse:(id)a5 forTaskID:(id)a6 shouldSubmit:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  int v31;
  char v32;
  char v33;
  BOOL v34;

  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kRemoteMessageTransportAttributionKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  LOBYTE(v16) = objc_msgSend(v14, "hmf_BOOLForKey:", CFSTR("kRemoteMessageIsRapportLinkSlowKey"));
  v18 = objc_msgSend(v14, "hmf_BOOLForKey:", CFSTR("kRemoteMessageIsModernTransportUsedKey"));

  objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_remoteMessageResponse_forTaskID_shouldSubmit___block_invoke;
  v25[3] = &unk_1E89AEF78;
  v31 = v17;
  v32 = (char)v16;
  v33 = v18;
  v29 = v20;
  v34 = a7;
  v26 = v12;
  v27 = v21;
  v30 = a1;
  v28 = v13;
  v22 = v13;
  v23 = v21;
  v24 = v12;
  objc_msgSend(v15, "na_each:", v25);

}

void __118__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_remoteMessageResponse_forTaskID_shouldSubmit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  __CFString *v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isPrimary") & 1) == 0)
  {
    objc_msgSend(v5, "bridge");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isSubmitted") & 1) == 0)
      {
        objc_msgSend(v10, "setTransportType:", *(unsigned int *)(a1 + 72));
        objc_msgSend(v10, "setIsSlowRapport:", *(unsigned __int8 *)(a1 + 76));
        objc_msgSend(v10, "setIsModernTransport:", *(unsigned __int8 *)(a1 + 77));
        objc_msgSend(v3, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setResidentFirstError:", v11);

        objc_msgSend(v10, "setResidentFirstEndTime:", *(double *)(a1 + 56));
        if (*(_BYTE *)(a1 + 78))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          {
            v12 = (void *)MEMORY[0x1D17BA0A0]();
            v13 = *(id *)(a1 + 64);
            HMFGetOSLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v31 = v12;
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = *(_QWORD *)(a1 + 48);
              if (objc_msgSend(v10, "isWriteOperation"))
                v16 = CFSTR("Writing");
              else
                v16 = CFSTR("Reading");
              objc_msgSend(v10, "characteristicsInRequest");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v30, "count");
              objc_msgSend(v10, "accessoryUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "residentFirstError");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v10, "durationMilliseconds");
              v24 = objc_msgSend(v10, "localDurationInMilliseconds");
              v23 = objc_msgSend(v10, "residentFirstDurationInMilliseconds");
              if (objc_msgSend(v10, "isLocal"))
              {
                objc_msgSend(v10, "linkType");
                HAPLinkTypeDescription();
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v18 = objc_msgSend(v10, "transportType");
                if (v18 > 6)
                  v19 = 0;
                else
                  v19 = off_1E89C1C90[v18];
                v17 = v19;
              }
              v20 = v17;
              *(_DWORD *)buf = 138545922;
              v34 = v32;
              v35 = 2114;
              v36 = v15;
              v37 = 2114;
              v38 = v16;
              v39 = 2048;
              v40 = v26;
              v41 = 2114;
              v42 = v29;
              v43 = 2114;
              v44 = v28;
              v45 = 2114;
              v46 = v27;
              v47 = 2048;
              v48 = v25;
              v49 = 2048;
              v50 = v24;
              v51 = 2048;
              v52 = v23;
              v53 = 2114;
              v54 = v17;
              _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@For Task: %{public}@ -- %{public}@ %tu characteristic(s) on accessory %{public}@ completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@", buf, 0x70u);

              v12 = v31;
            }

            objc_autoreleasePoolPop(v12);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
          }
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "residentFirstError");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "submitLogEvent:error:", v10, v22);

        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

}

void __96__HMDHAPAccessoryReaderWriterMetricHelper_updateLogEvents_withResponses_forTaskID_shouldSubmit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  __CFString *v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isPrimary") & 1) == 0)
  {
    objc_msgSend(v5, "bridge");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isSubmitted") & 1) == 0)
      {
        objc_msgSend(v3, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setResidentFirstError:", v11);

        objc_msgSend(v10, "setResidentFirstEndTime:", *(double *)(a1 + 56));
        if (*(_BYTE *)(a1 + 72))
        {
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
          {
            v12 = (void *)MEMORY[0x1D17BA0A0]();
            v13 = *(id *)(a1 + 64);
            HMFGetOSLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v31 = v12;
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = *(_QWORD *)(a1 + 48);
              if (objc_msgSend(v10, "isWriteOperation"))
                v16 = CFSTR("Writing");
              else
                v16 = CFSTR("Reading");
              objc_msgSend(v10, "characteristicsInRequest");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v30, "count");
              objc_msgSend(v10, "accessoryUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "error");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "residentFirstError");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v10, "durationMilliseconds");
              v24 = objc_msgSend(v10, "localDurationInMilliseconds");
              v23 = objc_msgSend(v10, "residentFirstDurationInMilliseconds");
              if (objc_msgSend(v10, "isLocal"))
              {
                objc_msgSend(v10, "linkType");
                HAPLinkTypeDescription();
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v18 = objc_msgSend(v10, "transportType");
                if (v18 > 6)
                  v19 = 0;
                else
                  v19 = off_1E89C1C90[v18];
                v17 = v19;
              }
              v20 = v17;
              *(_DWORD *)buf = 138545922;
              v34 = v32;
              v35 = 2114;
              v36 = v15;
              v37 = 2114;
              v38 = v16;
              v39 = 2048;
              v40 = v26;
              v41 = 2114;
              v42 = v29;
              v43 = 2114;
              v44 = v28;
              v45 = 2114;
              v46 = v27;
              v47 = 2048;
              v48 = v25;
              v49 = 2048;
              v50 = v24;
              v51 = 2048;
              v52 = v23;
              v53 = 2114;
              v54 = v17;
              _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@For Task: %{public}@ -- %{public}@ %tu characteristic(s) on accessory %{public}@ completed with error: %{public}@ (Resident first error: %{public}@), Total duration: %ld ms (Local duration: %ld ms, Resident first duration: %ld ms) using transport: %{public}@", buf, 0x70u);

              v12 = v31;
            }

            objc_autoreleasePoolPop(v12);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
          }
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "residentFirstError");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "submitLogEvent:error:", v10, v22);

        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

}

@end
