@implementation HMDHomeCreateAddAccessoryProgressHandler

void __HMDHomeCreateAddAccessoryProgressHandler_block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id *v71;
  id *v72;
  uint64_t v73;
  _QWORD v74[4];
  _QWORD v75[4];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[4];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMSetupAccessoryProgressAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v9;
    v78 = 2112;
    v79 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Progress Handler called with progress: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(v5, "accessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = a2;
    if (v12
      || (objc_msgSend(a1[5], "addRequestIdentifier"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      v71 = a1;
      v14 = (void *)MEMORY[0x227676638]();
      v69 = WeakRetained;
      v15 = WeakRetained;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMSetupAccessoryProgressAsString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v17;
        v78 = 2112;
        v79 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Posting accessory pairing state progress notification to %@", buf, 0x16u);

        a2 = v73;
      }

      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = CFSTR("HMDSetupAccessoryProgressStateKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v20;
      v74[1] = CFSTR("HMDAccessoryProgressStateNotificationKey");
      HMSetupAccessoryProgressAsString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v21;
      v74[2] = CFSTR("HMDAccessoryProgressStateTimeNotificationKey");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v22;
      v74[3] = CFSTR("HMDAccessoryProgressStateforAccessoryKey");
      if (v12)
      {
        objc_msgSend(v12, "UUIDString");
      }
      else
      {
        objc_msgSend(v71[5], "addRequestIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject UUIDString](v16, "UUIDString");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryProgressStateUpdateNotification"), v15, v24);

      if (!v12)
      {

        v23 = v16;
      }

      WeakRetained = v69;
      a1 = v71;
      a2 = v73;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v5, "accessoryName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("kAccessoryName"));

    }
    objc_msgSend(v5, "accessoryUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v5, "accessoryUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("kAccessoryUUID"));

    }
    objc_msgSend(v5, "manufacturerName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "manufacturerName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, CFSTR("kAccessoryInfoManufacturerKey"));

    }
    objc_msgSend(v5, "category");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v5, "category");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      encodeRootObjectForIncomingXPCMessage(v34, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("kAccessoryCategory"));

    }
    if (a2 == 9)
    {
      objc_msgSend(WeakRetained, "wiFiRouterAccessories");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v37, "uuid");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "UUIDString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v43, *MEMORY[0x24BDD6250]);

LABEL_41:
LABEL_42:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v62, CFSTR("kAccessorySetupProgressKey"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "certificationStatus"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v63, CFSTR("kAccessoryCertificationStatusKey"));

        v64 = (void *)MEMORY[0x24BE3F1D0];
        v65 = *MEMORY[0x24BDD7BE0];
        objc_msgSend(WeakRetained, "messageDestination");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "messageWithName:destination:payload:", v65, v66, v25);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[6], "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setIdentifier:", v67);

        objc_msgSend(v37, "setRequiresSPIEntitlement");
        objc_msgSend(a1[6], "transport");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTransport:", v68);

        objc_msgSend(WeakRetained, "msgDispatcher");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "sendMessage:completionHandler:", v37, 0);
        goto LABEL_43;
      }
      v44 = (void *)MEMORY[0x227676638]();
      v45 = WeakRetained;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        HMSetupAccessoryProgressAsString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v47;
        v78 = 2112;
        v79 = v48;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Progress is %@ but no accessory being replaced", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      v37 = 0;
    }
    else
    {
      if (a2 != 8)
        goto LABEL_42;
      objc_msgSend(v5, "productData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_42;
      +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "vendorModelEntryForProductData:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "addRequestIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {

LABEL_43:
        goto LABEL_44;
      }
      objc_msgSend(a1[5], "appIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "appBundleID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if ((v51 & 1) != 0)
        goto LABEL_43;
      objc_msgSend(v39, "appStoreID");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52
        && (v53 = (void *)v52,
            objc_msgSend(v39, "appBundleID"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v54,
            v53,
            v54))
      {
        objc_msgSend(v39, "appStoreID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v55, CFSTR("kAccessoryVendorInfoStoreIDKey"));

        objc_msgSend(v39, "appBundleID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v56, CFSTR("kAccessoryVendorInfoBundleIDKey"));

      }
      else
      {
        v72 = a1;
        v57 = (void *)MEMORY[0x227676638]();
        v70 = WeakRetained;
        v58 = WeakRetained;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "productData");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v60;
          v78 = 2112;
          v79 = v61;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_DEBUG, "%{public}@No appID/bundleID found for productData: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v57);
        WeakRetained = v70;
        a1 = v72;
      }

    }
    a2 = v73;
    goto LABEL_41;
  }
LABEL_44:

}

@end
