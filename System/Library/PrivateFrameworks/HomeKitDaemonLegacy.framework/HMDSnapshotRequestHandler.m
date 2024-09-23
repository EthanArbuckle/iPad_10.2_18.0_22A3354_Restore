@implementation HMDSnapshotRequestHandler

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_184846 != -1)
    dispatch_once(&logCategory__hmf_once_t0_184846, &__block_literal_global_184847);
  return (id)logCategory__hmf_once_v1_184848;
}

void __81__HMDSnapshotRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  HMDSnapshotRequest *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id *val;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51[2];
  id location;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "snapshotCharacteristicEventUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 40);
  if (v2)
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v3)
  {
LABEL_4:
    v4 = v3;
    v5 = -[HMDSnapshotRequest initWithCompletion:]([HMDSnapshotRequest alloc], "initWithCompletion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "addObject:", v5);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(void **)(v6 + 32);
    else
      v7 = 0;
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "supportedResolutions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[HMDSnapshotRequestHandler _sendSnapshotRequest:streamingTierType:](*(id **)(a1 + 40), *(void **)(a1 + 32), *(_QWORD *)(a1 + 56));
      }
      else
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v25;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Need to gather supported video resolutions by the camera", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        v26 = *(void **)(a1 + 40);
        v44 = *(void **)(a1 + 56);
        v45 = *(id *)(a1 + 32);
        if (v26)
        {
          v27 = (void *)MEMORY[0x1D17BA0A0]();
          val = v26;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = v29;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Getting Supported Configuration", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v27);
          WeakRetained = objc_loadWeakRetained(val + 3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = WeakRetained;
          else
            v31 = 0;
          v46 = v31;

          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            objc_msgSend(v46, "services");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v54;
              v35 = *MEMORY[0x1E0D161B8];
              v36 = *MEMORY[0x1E0D16020];
              do
              {
                for (i = 0; i != v33; ++i)
                {
                  if (*(_QWORD *)v54 != v34)
                    objc_enumerationMutation(v32);
                  v38 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                  objc_msgSend(v38, "serviceType");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "isEqualToString:", v35);

                  if (v40)
                  {
                    objc_msgSend(v38, "findCharacteristicWithType:", v36);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v41)
                    {
                      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v41);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "addObject:", v42);

                    }
                  }
                }
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
              }
              while (v33);
            }

            objc_initWeak(&location, val);
            v43 = val[2];
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __77__HMDSnapshotRequestHandler__getSupportedVideoResolutions_streamingTierType___block_invoke;
            v49[3] = &unk_1E89C2460;
            objc_copyWeak(v51, &location);
            v50 = v45;
            v51[1] = v44;
            objc_msgSend(v46, "readCharacteristicValues:source:queue:completionHandler:", v48, 7, v43, v49);

            objc_destroyWeak(v51);
            objc_destroyWeak(&location);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1011);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:]((uint64_t)val, 0, v48, 0, 0);
          }

        }
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD **)(a1 + 40);
        if (v12)
          v12 = (_QWORD *)v12[4];
        v13 = v12;
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v11;
        v59 = 2112;
        v60 = v14;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@There is already a request in progress so piggy backing on that: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    return;
  }
  if (!v3[7])
  {
LABEL_3:
    v3 = (_QWORD *)v3[4];
    goto LABEL_4;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is still valid", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    v21 = *(_QWORD *)(v20 + 56);
  else
    v21 = 0;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v21, 0);
}

- (void)_sendSnapshotRequest:(unint64_t)a3 streamingTierType:
{
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  HMDVideoResolution *v16;
  void *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  HMDVideoResolution *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  NSObject *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  _BOOL4 v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  id *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id *v81;
  NSObject *v82;
  void *v83;
  id v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  void *v89;
  void *v90;
  HMDVideoResolution *v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id *v96;
  HMDVideoResolution *v97;
  _BYTE *v98;
  _BYTE v99[24];
  void *v100;
  _QWORD v101[2];
  _BYTE buf[24];
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  uint8_t v106[32];
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v92 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = WeakRetained;
    else
      v6 = 0;
    v7 = v6;

    v89 = v7;
    if (!v7)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory is no longer available, cannot handle snapshot request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1011);
      v21 = (HMDVideoResolution *)objc_claimAutoreleasedReturnValue();
      -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:]((uint64_t)v18, 0, v21, 0, 0);
LABEL_61:

      goto LABEL_62;
    }
    v8 = (id)snapshotResolution;
    v88 = a1;
    v90 = v8;
    if (v8)
    {
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if ((unint64_t)(v9 - 1) < 0xA)
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HMDVideoResolutionTypeAsString(v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Overriding the resolution requested to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        v16 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v9);
LABEL_37:

        v86 = objc_msgSend(v92, "snapshotReason");
        v49 = (void *)MEMORY[0x1E0C99E08];
        v50 = v89;
        v91 = v16;
        objc_msgSend(v49, "dictionary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D162F8], *MEMORY[0x1E0D16318]);
        -[HMDVideoResolution imageWidth](v91, "imageWidth");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0D16308]);

        -[HMDVideoResolution imageHeight](v91, "imageHeight");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D16300]);
        v54 = v51;
        v55 = v50;
        objc_msgSend(v55, "bridge");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          objc_msgSend(v55, "hapInstanceId");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0D15EA8]);
          }
          else
          {
            v58 = (void *)MEMORY[0x1D17BA0A0]();
            v59 = v88;
            HMFGetOSLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v61;
              _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the HAP instance id (aid) for bridged accessory.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v58);
          }

        }
        v107 = 0u;
        v108 = 0u;
        memset(v106, 0, sizeof(v106));
        objc_msgSend(v55, "services", v86);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", v106, buf, 16);
        if (v63)
        {
          v64 = **(_QWORD **)&v106[16];
          v65 = *MEMORY[0x1E0CB99C8];
LABEL_46:
          v66 = 0;
          while (1)
          {
            if (**(_QWORD **)&v106[16] != v64)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*(_QWORD *)&v106[8] + 8 * v66);
            objc_msgSend(v67, "type");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "isEqualToString:", v65);

            if ((v69 & 1) != 0)
              break;
            if (v63 == ++v66)
            {
              v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", v106, buf, 16);
              if (v63)
                goto LABEL_46;
              goto LABEL_52;
            }
          }
          objc_msgSend(v67, "findCharacteristicWithType:", *MEMORY[0x1E0CB88B0]);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v72 == 0;

          objc_msgSend(v67, "findCharacteristicWithType:", CFSTR("00000225-0000-1000-8000-0026BB765291"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v73 == 0;

          if (v71 || v70)
            goto LABEL_54;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v87);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v78, *MEMORY[0x1E0D16310]);

        }
        else
        {
LABEL_52:

          v70 = 1;
          v71 = 1;
LABEL_54:
          v74 = (void *)MEMORY[0x1D17BA0A0]();
          v75 = v88;
          HMFGetOSLogHandle();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v99 = 138543874;
            *(_QWORD *)&v99[4] = v77;
            *(_WORD *)&v99[12] = 1024;
            *(_DWORD *)&v99[14] = v71;
            *(_WORD *)&v99[18] = 1024;
            *(_DWORD *)&v99[20] = v70;
            _os_log_impl(&dword_1CD062000, v76, OS_LOG_TYPE_INFO, "%{public}@Either event snapshot active characteristic (%d) or periodic snapshot active characteristic (%d) is not present", v99, 0x18u);

          }
          objc_autoreleasePoolPop(v74);
        }

        v79 = (void *)objc_msgSend(v54, "copy");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v103 = __Block_byref_object_copy__184801;
        v104 = __Block_byref_object_dispose__184802;
        v105 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.snapshot-request"));
        v80 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v92, "markMilestoneFor:", CFSTR("SentSnapshotRequestToAccessory")));
        v81 = v88;
        HMFGetOSLogHandle();
        v82 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v106 = 138543618;
          *(_QWORD *)&v106[4] = v83;
          *(_WORD *)&v106[12] = 2112;
          *(_QWORD *)&v106[14] = v79;
          _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Sending snapshot request to accessory with options: %@", v106, 0x16u);

        }
        objc_autoreleasePoolPop(v80);
        v84 = v81[2];
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __68__HMDSnapshotRequestHandler__sendSnapshotRequest_streamingTierType___block_invoke;
        v93[3] = &unk_1E89C2418;
        v94 = v92;
        v95 = v55;
        v96 = v81;
        v21 = v91;
        v97 = v21;
        v98 = buf;
        objc_msgSend(v95, "requestResource:queue:completionHandler:", v79, v84, v93);

        _Block_object_dispose(buf, 8);
        goto LABEL_61;
      }
      if (v13)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Not overriding the resolution requested to %tu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
    v85 = a3;
    if (a3 > 4)
    {
      v23 = 0;
    }
    else
    {
      +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", qword_1E89C2480[a3], a3, a1, v7, v90);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v88;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HMDStreamingTierTypeAsString(v85);
      v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      v103 = v28;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Resolutions in order of preference: %@ for tier: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    v107 = 0u;
    v108 = 0u;
    memset(v106, 0, sizeof(v106));
    v29 = v23;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v106, buf, 16);
    if (v30)
    {
      v31 = **(_QWORD **)&v106[16];
LABEL_24:
      v32 = 0;
      while (1)
      {
        if (**(_QWORD **)&v106[16] != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*(_QWORD *)&v106[8] + 8 * v32);
        v34 = objc_msgSend(v33, "resolutionType", v85);
        objc_msgSend(v25, "supportedResolutions");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v99 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v99[8] = 3221225472;
        *(_QWORD *)&v99[16] = __58__HMDSnapshotRequestHandler__supportedResolutionWithType___block_invoke;
        v100 = &__block_descriptor_40_e28_B16__0__HMDVideoResolution_8l;
        v101[0] = v34;
        objc_msgSend(v35, "na_firstObjectPassingTest:", v99);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", v106, buf, 16);
          if (v30)
            goto LABEL_24;
          goto LABEL_30;
        }
      }
      v16 = v33;

      if (!v16)
        goto LABEL_34;
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v25;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        HMDVideoResolutionTypeAsString(-[HMDVideoResolution resolutionType](v16, "resolutionType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "supportedResolutions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        HMDStreamingTierTypeAsString(v85);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138544130;
        *(_QWORD *)&v99[4] = v40;
        *(_WORD *)&v99[12] = 2112;
        *(_QWORD *)&v99[14] = v41;
        *(_WORD *)&v99[22] = 2112;
        v100 = v42;
        LOWORD(v101[0]) = 2112;
        *(_QWORD *)((char *)v101 + 2) = v43;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Found preferred resolution: %@ in supported resolutions: %@ for tier: %@", v99, 0x2Au);

      }
    }
    else
    {
LABEL_30:

LABEL_34:
      v16 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", 1);
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = v25;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "supportedResolutions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        HMDStreamingTierTypeAsString(v85);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        HMDVideoResolutionTypeAsString(-[HMDVideoResolution resolutionType](v16, "resolutionType"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v99 = 138544130;
        *(_QWORD *)&v99[4] = v45;
        *(_WORD *)&v99[12] = 2112;
        *(_QWORD *)&v99[14] = v46;
        *(_WORD *)&v99[22] = 2112;
        v100 = v47;
        LOWORD(v101[0]) = 2112;
        *(_QWORD *)((char *)v101 + 2) = v48;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Didn't find preferred resolution in supported resolutions: %@ for tier: %@. Defaulting to resolution: %@", v99, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v37);
    goto LABEL_37;
  }
LABEL_62:

}

- (NSSet)supportedResolutions
{
  return self->_supportedResolutions;
}

- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  void *v11;
  HMDSnapshotRequestHandler *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  HMDSnapshotRequestHandler *v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (self)
      workQueue = self->_workQueue;
    else
      workQueue = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__HMDSnapshotRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke;
    v15[3] = &unk_1E89C23F0;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v19 = a4;
    dispatch_async(workQueue, v15);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Completion handler is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

BOOL __58__HMDSnapshotRequestHandler__supportedResolutionWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolutionType") == *(_QWORD *)(a1 + 32);
}

void __68__HMDSnapshotRequestHandler__sendSnapshotRequest_streamingTierType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "markMilestoneFor:", CFSTR("ReceivedSnapshotFromAccessory"));
  objc_msgSend(*(id *)(a1 + 40), "updateActiveDisconnectOnIdleTimeout:", 20.0);
  -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:](*(_QWORD *)(a1 + 48), v6, v5, *(void **)(a1 + 56), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (void)_handleImageResourceData:(void *)a3 error:(void *)a4 requestedResolution:(void *)a5 snapshotDataTrasaction:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCameraSnapshotData *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v38 = v12;
  v39 = v9;
  if (a1)
  {
    v13 = v12;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v9)
    {
      if (objc_msgSend(v9, "length"))
      {
        v14 = -[HMDCameraSnapshotData initWithSnapshotData:videoResolution:snapshotDataTrasaction:]([HMDCameraSnapshotData alloc], "initWithSnapshotData:videoResolution:snapshotDataTrasaction:", v9, v11, v13);
        -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)a1, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = (id)a1;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v37 = v16;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v46 = v19;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to save snapshot file", buf, 0xCu);

            v16 = v37;
          }

          objc_autoreleasePoolPop(v16);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1038);
          v20 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v20;
        }
        v21 = v11;

      }
      else
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = (id)a1;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v29;
          v47 = 2112;
          v48 = v11;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory sent 0 length data for snapshot request of resolution %@", buf, 0x16u);

        }
        v21 = v11;

        objc_autoreleasePoolPop(v26);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1037);
        v30 = objc_claimAutoreleasedReturnValue();

        v15 = 0;
        v10 = (id)v30;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = (id)a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v25;
        v47 = 2112;
        v48 = v11;
        v49 = 2112;
        v50 = v10;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Accessory failed to send data for snapshot request of resolution %@: %@", buf, 0x20u);

      }
      v21 = v11;

      objc_autoreleasePoolPop(v22);
      v15 = 0;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = *(id *)(a1 + 32);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "completion");
          v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, id))v36)[2](v36, v15, v10);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v33);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }
  else
  {
    v21 = v11;
  }

}

- (HMDSnapshotRequestHandler)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 imageCacheDirectory:(id)a6 logID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSnapshotRequestHandler *v17;
  HMDSnapshotRequestHandler *v18;
  uint64_t v19;
  NSMutableArray *pendingRequests;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDSnapshotRequestHandler;
  v17 = -[HMDSnapshotRequestHandler init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v18->_pendingRequests;
    v18->_pendingRequests = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v18->_logIdentifier, a7);
    objc_storeStrong((id *)&v18->_streamSnapshotHandler, a5);
    objc_storeStrong((id *)&v18->_imageCacheDirectory, a6);
    -[HMDCameraStreamSnapshotHandler addDelegate:delegateQueue:](v18->_streamSnapshotHandler, "addDelegate:delegateQueue:", v18, v13);
  }

  return v18;
}

- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSnapshotRequestHandler *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received new snapshot", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
    v12 = -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)&v9->super.super.isa, v7);

}

- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSnapshotRequestHandler *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received last snapshot", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)&v9->super.super.isa, v7);

}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *mostRecentSnapshotInvalidationTimer;
  void *v6;
  HMDSnapshotRequestHandler *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    mostRecentSnapshotInvalidationTimer = self->_mostRecentSnapshotInvalidationTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    mostRecentSnapshotInvalidationTimer = 0;
  }
  if (mostRecentSnapshotInvalidationTimer == v4)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Snapshot invalidation timer has fired, resetting the most recent snapshot", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (self)
    {
      objc_storeStrong((id *)&v7->_mostRecentSnapshot, 0);
      objc_storeStrong((id *)&v7->_mostRecentSnapshotInvalidationTimer, 0);
    }
  }

}

- (NSString)imageCacheDirectory
{
  return self->_imageCacheDirectory;
}

- (void)setSupportedResolutions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedResolutions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshotInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
}

- (HMDSnapshotFile)_saveSnapshotFile:(id *)a1
{
  NSObject *v3;
  id v4;
  HMDSnapshotFile *v5;
  void *v6;
  HMDSnapshotFile *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  HMDSnapshotFile *v12;

  if (a1)
  {
    v3 = a1[2];
    v4 = a2;
    dispatch_assert_queue_V2(v3);
    v5 = [HMDSnapshotFile alloc];
    objc_msgSend(a1, "imageCacheDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDSnapshotFile initWithImageDirectory:snapshotData:](v5, "initWithImageDirectory:snapshotData:", v6, v4);

    if (v7)
    {
      objc_storeStrong(a1 + 7, v7);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 2.0);
      v9 = a1[6];
      a1[6] = (id)v8;

      objc_msgSend(a1[6], "setDelegate:", a1);
      v10 = a1[6];
      v11 = a1[2];
      objc_msgSend(v10, "setDelegateQueue:", v11);

      objc_msgSend(a1[6], "resume");
      v12 = v7;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __77__HMDSnapshotRequestHandler__getSupportedVideoResolutions_streamingTierType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  HMDSupportedVideoStreamConfiguration *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id *v48;
  void *v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id obj;
  uint64_t v60;
  HMDSupportedVideoStreamConfiguration *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v77 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for supported configurations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = *(void **)(a1 + 32);
  v51 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v9;
  v12 = v11;
  if (v6)
  {
    v55 = v6;
    v49 = v11;
    v50 = v10;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      v17 = *MEMORY[0x1E0D16020];
      v53 = *(_QWORD *)v63;
      v54 = v13;
      v52 = *MEMORY[0x1E0D16020];
      do
      {
        v18 = 0;
        v56 = v15;
        do
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v18);
          objc_msgSend(v19, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v58 = v18;
            objc_msgSend(v19, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "request");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "characteristic");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "type");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v17);

            if (v26)
            {
              v57 = v22;
              v27 = -[HAPTLVBase initWithTLVData:]([HMDSupportedVideoStreamConfiguration alloc], "initWithTLVData:", v22);
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              v73 = 0u;
              v61 = v27;
              -[HMDSupportedVideoStreamConfiguration codecConfigurations](v27, "codecConfigurations");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
              if (v29)
              {
                v30 = v29;
                v60 = *(_QWORD *)v71;
                do
                {
                  for (i = 0; i != v30; ++i)
                  {
                    if (*(_QWORD *)v71 != v60)
                      objc_enumerationMutation(obj);
                    v32 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
                    -[HMDSupportedVideoStreamConfiguration codecConfigurations](v61, "codecConfigurations");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "objectForKeyedSubscript:", v32);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    v68 = 0u;
                    v69 = 0u;
                    v66 = 0u;
                    v67 = 0u;
                    objc_msgSend(v34, "videoAttributes");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
                    if (v36)
                    {
                      v37 = v36;
                      v38 = *(_QWORD *)v67;
                      do
                      {
                        for (j = 0; j != v37; ++j)
                        {
                          if (*(_QWORD *)v67 != v38)
                            objc_enumerationMutation(v35);
                          v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
                          objc_msgSend(v40, "videoResolution");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v41)
                          {
                            objc_msgSend(v40, "videoResolution");
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v28, "addObject:", v42);

                          }
                        }
                        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
                      }
                      while (v37);
                    }

                  }
                  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
                }
                while (v30);
              }

              objc_msgSend(v55, "setSupportedResolutions:", v28);
              v16 = v53;
              v13 = v54;
              v17 = v52;
              v15 = v56;
              v22 = v57;
            }

            v18 = v58;
          }
          ++v18;
        }
        while (v18 != v15);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v15);
    }

    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v55;
    v44 = v55;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "supportedResolutions");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v46;
      v78 = 2112;
      v79 = v47;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Supported resolutions are: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    v48 = (id *)v44;
    v12 = v49;
    -[HMDSnapshotRequestHandler _sendSnapshotRequest:streamingTierType:](v48, v49, v51);
    v10 = v50;
  }

}

void __40__HMDSnapshotRequestHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_184848;
  logCategory__hmf_once_v1_184848 = v0;

}

@end
