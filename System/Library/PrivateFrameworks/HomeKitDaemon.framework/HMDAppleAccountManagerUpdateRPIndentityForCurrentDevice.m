@implementation HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice

void ____HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638](v7);
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v11;
      v49 = 2112;
      v50 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine rapport identity for current device with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = v6;
    if (v12)
    {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
      v13 = v6;
    }
    goto LABEL_31;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v15)
  {

LABEL_25:
    v35 = (void *)MEMORY[0x227676638]();
    v36 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v38;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Rapport did not return the self identity", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    goto LABEL_28;
  }
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v41 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      if (objc_msgSend(v20, "type", (_QWORD)v40) == 1)
      {
        v21 = v20;

        v17 = v21;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  }
  while (v16);

  if (!v17)
    goto LABEL_25;
  v22 = (void *)MEMORY[0x227676638]();
  v23 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v25;
    v49 = 2112;
    v50 = v17;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Found current device RPIdentity: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(*(id *)(a1 + 48), "rpIdentity");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26
    || (v27 = (void *)v26,
        objc_msgSend(*(id *)(a1 + 48), "rpIdentity"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "isEqualToRPIndentity:", v17),
        v28,
        v27,
        (v29 & 1) == 0))
  {
    +[HMDRPIdentity identityWithRPIdentity:](HMDRPIdentity, "identityWithRPIdentity:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(*(id *)(a1 + 48), "setRpIdentity:", v30);

  }
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(a1 + 40);
  v44 = CFSTR("deviceIRK");
  objc_msgSend(v17, "deviceIRKData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "postNotificationName:object:userInfo:", CFSTR("HMDAppleAccountManagerFetchedCurrentDeviceIRK"), v32, v34);

  v13 = 0;
LABEL_28:
  v39 = *(_QWORD *)(a1 + 56);
  if (v39)
    (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v13);

LABEL_31:
}

@end
