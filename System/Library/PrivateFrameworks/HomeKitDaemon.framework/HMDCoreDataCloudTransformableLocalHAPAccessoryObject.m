@implementation HMDCoreDataCloudTransformableLocalHAPAccessoryObject

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
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFService entity](_MKFService, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isKindOfEntity:", v15);

  if (v16)
  {
    v37[0] = CFSTR("accessory");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v13, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v10, v17, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (__CFString *)v29;

    if (v18)
    {
      objc_msgSend(v18, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("services_");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addToUpdates:objectID:properties:", v12, v21, v22);

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("not found");
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        if (v19)
          v27 = v19;
        v32 = 2114;
        v33 = v10;
        v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
  return 1;
}

@end
