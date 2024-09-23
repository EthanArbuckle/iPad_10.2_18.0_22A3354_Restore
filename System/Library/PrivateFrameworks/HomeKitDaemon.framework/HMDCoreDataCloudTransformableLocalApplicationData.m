@implementation HMDCoreDataCloudTransformableLocalApplicationData

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString **v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  const __CFString *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFApplicationData entity](_MKFApplicationData, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isKindOfEntity:", v15);

  if (v16)
  {
    v43 = 0;
    objc_msgSend(v13, "existingObjectWithID:error:", v10, &v43);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (__CFString *)v43;
    if (v17)
    {
      objc_msgSend(v17, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v17, "home");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("applicationData");
        v22 = (void *)MEMORY[0x24BDBCE30];
        v23 = &v49;
LABEL_17:
        objc_msgSend(v22, "arrayWithObjects:count:", v23, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "addToUpdates:objectID:properties:", v12, v21, v35);

        goto LABEL_18;
      }
      objc_msgSend(v17, "actionSet");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v17, "actionSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = CFSTR("applicationData");
        v22 = (void *)MEMORY[0x24BDBCE30];
        v23 = &v48;
        goto LABEL_17;
      }
      objc_msgSend(v17, "room");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v17, "room");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = CFSTR("applicationData");
        v22 = (void *)MEMORY[0x24BDBCE30];
        v23 = &v47;
        goto LABEL_17;
      }
      objc_msgSend(v17, "accessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v17, "accessory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = CFSTR("applicationData");
        v22 = (void *)MEMORY[0x24BDBCE30];
        v23 = &v46;
        goto LABEL_17;
      }
      objc_msgSend(v17, "service");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v17, "service");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "accessory");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("services_");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "addToUpdates:objectID:properties:", v12, v39, v40);

        goto LABEL_18;
      }
      objc_msgSend(v17, "serviceGroup");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v17, "serviceGroup");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = CFSTR("applicationData");
        v22 = (void *)MEMORY[0x24BDBCE30];
        v23 = &v44;
        goto LABEL_17;
      }
      v24 = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v27;
        v52 = 2114;
        v53 = v10;
        v29 = "%{public}@Failed to determine app data container for object with objectID %{public}@";
        v30 = v26;
        v31 = 22;
LABEL_9:
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

      }
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("not found");
        *(_DWORD *)buf = 138543874;
        v51 = v27;
        if (v18)
          v28 = v18;
        v52 = 2114;
        v53 = v10;
        v54 = 2114;
        v55 = v28;
        v29 = "%{public}@Failed to fetch object with objectID %{public}@: %{public}@";
        v30 = v26;
        v31 = 32;
        goto LABEL_9;
      }
    }

    objc_autoreleasePoolPop(v24);
LABEL_18:

  }
  return 1;
}

@end
