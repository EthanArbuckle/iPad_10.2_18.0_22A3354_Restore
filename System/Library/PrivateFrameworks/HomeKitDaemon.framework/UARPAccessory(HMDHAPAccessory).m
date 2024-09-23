@implementation UARPAccessory(HMDHAPAccessory)

- (uint64_t)initWithHMDHAPAccessory:()HMDHAPAccessory
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(objc_msgSend(v4, "identityType"))
  {
    case 0:
      objc_msgSend(v4, "matterVendorID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "matterProductID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x227676638]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v50 = v10;
        v51 = 2112;
        v52 = v4;
        v53 = 2112;
        v54 = v5;
        v55 = 2112;
        v56 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not a valid AFU accessory: %@ vendorID: %@ productID: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);

      goto LABEL_25;
    case 1:
      v11 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      objc_msgSend(v4, "productData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v11;
      +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:](HMDAccessory, "splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:", v12, 0, &v48);
      v13 = v48;

      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v17;
        v51 = 2112;
        v52 = v4;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ProductData accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v18 = objc_alloc(MEMORY[0x24BE289E8]);
      objc_msgSend(v4, "productGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "initWithProductGroup:productNumber:uuid:", v19, v13, v20);

      goto LABEL_21;
    case 2:
      v22 = (void *)MEMORY[0x24BE28A18];
      objc_msgSend(v4, "model");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "findByAppleModelNumber:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x227676638]();
      v26 = a1;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v24)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v29;
          v51 = 2112;
          v52 = v4;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP ModelNumber accessory %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v30 = objc_alloc(MEMORY[0x24BE289E8]);
        objc_msgSend(v24, "hardwareID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v30, "initWithHardwareID:uuid:", v31, v32);

      }
      else
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v46;
          v51 = 2112;
          v52 = v4;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not a CoreUARP suppoorted accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
LABEL_25:
        v21 = 0;
      }
LABEL_26:

      return v21;
    case 3:
      objc_msgSend(v4, "matterVendorID");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "matterProductID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x227676638]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v13 && v33)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v50 = v38;
          v51 = 2112;
          v52 = v39;
          v53 = 2112;
          v54 = v40;
          v55 = 2112;
          v56 = v4;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Initializing UARP VendorProductID (%@/%@) accessory %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v34);
        v41 = objc_alloc(MEMORY[0x24BE289E8]);
        objc_msgSend(v13, "stringValue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringValue");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v41, "initWithProductGroup:productNumber:uuid:", v42, v43, v44);

      }
      else
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v50 = v45;
          v51 = 2112;
          v52 = v13;
          v53 = 2112;
          v54 = v33;
          v55 = 2112;
          v56 = v4;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Matter Accessory has a nil vendorID(%@) or productID(%@), not a valid AFU accessory: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v34);
        v21 = 0;
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

  v2 = (void *)MEMORY[0x24BDD17C8];
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
