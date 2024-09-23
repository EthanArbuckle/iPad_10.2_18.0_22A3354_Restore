@implementation UARPAccessory(HMDHAPAccessory)

- (uint64_t)initWithHMDHAPAccessory:()HMDHAPAccessory
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "identityType"))
  {
    case 0:
      objc_msgSend(v4, "chipStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vendorID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "chipStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "productID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v54 = v12;
        v55 = 2112;
        v56 = v4;
        v57 = 2112;
        v58 = v6;
        v59 = 2112;
        v60 = v8;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not a valid AFU accessory: %@ vendorID: %@ productID: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v9);

      goto LABEL_25;
    case 1:
      v13 = objc_alloc_init(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "productData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v13;
      +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:](HMDAccessory, "splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:", v14, 0, &v52);
      v15 = v52;

      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v19;
        v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ProductData accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v20 = objc_alloc(MEMORY[0x1E0D1A648]);
      objc_msgSend(v4, "productGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "initWithProductGroup:productNumber:uuid:", v21, v15, v22);

      goto LABEL_21;
    case 2:
      v24 = (void *)MEMORY[0x1E0D1A660];
      objc_msgSend(v4, "model");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "findByAppleModelNumber:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v26)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v31;
          v55 = 2112;
          v56 = v4;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ModelNumber accessory %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v32 = objc_alloc(MEMORY[0x1E0D1A648]);
        objc_msgSend(v26, "hardwareID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v32, "initWithHardwareID:uuid:", v33, v34);

      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v50;
          v55 = 2112;
          v56 = v4;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not a CoreUARP suppoorted accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
LABEL_25:
        v23 = 0;
      }
LABEL_26:

      return v23;
    case 3:
      objc_msgSend(v4, "chipStorage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "vendorID");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "chipStorage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "productID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1D17BA0A0]();
      v39 = a1;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v15 && v37)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringValue");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringValue");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v42;
          v55 = 2112;
          v56 = v43;
          v57 = 2112;
          v58 = v44;
          v59 = 2112;
          v60 = v4;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP VendorProductID (%@/%@) accessory %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v38);
        v45 = objc_alloc(MEMORY[0x1E0D1A648]);
        objc_msgSend(v15, "stringValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v45, "initWithProductGroup:productNumber:uuid:", v46, v47, v48);

      }
      else
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v49;
          v55 = 2112;
          v56 = v15;
          v57 = 2112;
          v58 = v37;
          v59 = 2112;
          v60 = v4;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Matter Accessory has a nil vendorID(%@) or productID(%@), not a valid AFU accessory: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v38);
        v23 = 0;
      }

LABEL_21:
      goto LABEL_26;
    default:
      goto LABEL_25;
  }
}

- (id)redactedDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@>"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
