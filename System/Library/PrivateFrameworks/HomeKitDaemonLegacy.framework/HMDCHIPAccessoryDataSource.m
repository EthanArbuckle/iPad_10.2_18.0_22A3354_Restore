@implementation HMDCHIPAccessoryDataSource

- (HMDCHIPAccessoryDataSource)initWithNodeID:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCHIPAccessoryDataSource *v10;
  HMDCHIPAccessoryDataSource *v11;
  HMDCHIPAccessoryDataSource *result;
  HMDCHIPAccessoryDataSource *v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDCHIPAccessoryDataSource *)_HMFPreconditionFailure();
    -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v13, v14, v15, v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDCHIPAccessoryDataSource;
  v10 = -[HMDCHIPAccessoryDataSource init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nodeID, a3);
    objc_storeWeak((id *)&v11->_accessory, v9);
  }

  return v11;
}

- (void)_updateAccessoryModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCHIPAccessoryDataSource *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDCHIPAccessoryDataSource *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "home");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "transactionWithObjectChangeType:", 2);
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, v14);
      objc_msgSend(v13, "backingStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "transaction:options:", v8, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "add:", v14);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __78__HMDCHIPAccessoryDataSource__updateAccessoryModelWithLabel_completion_block___block_invoke;
      v26[3] = &unk_1E89C1A48;
      v27 = v9;
      objc_msgSend(v17, "run:", v26);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      v14 = (void (**)(_QWORD, _QWORD))_Block_copy(v9);
      if (!v14)
      {
        v13 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v17);
    }

LABEL_13:
    goto LABEL_14;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v21;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v13 = (void (**)(_QWORD, _QWORD))_Block_copy(v9);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, v14);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)updateNodeID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model node ID to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HMDCHIPAccessoryDataSource_updateNodeID_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP node ID"), v7, v13);

}

- (NSNumber)vendorID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vendorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateVendorID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model vendor ID to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPAccessoryDataSource_updateVendorID_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP vendor ID"), v7, v13);

}

- (NSNumber)productID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateProductID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model product ID to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HMDCHIPAccessoryDataSource_updateProductID_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP product ID"), v7, v13);

}

- (void)updateVendorID:(id)a3 productID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCHIPAccessoryDataSource *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@updateVendorID:productID: Updating accessory model vendor ID to %@, product ID to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HMDCHIPAccessoryDataSource_updateVendorID_productID_completion___block_invoke;
  v17[3] = &unk_1E89B3568;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v12, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP product ID and vendor ID"), v10, v17);

}

- (NSData)attributeDatabase
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)updateAttributeDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model attribute database to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__HMDCHIPAccessoryDataSource_updateAttributeDatabase_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP attribute database"), v7, v13);

}

- (NSSet)pairings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_109664);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)updatePairings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model pairings to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP pairings"), v7, v13);

}

- (NSString)extendedMACAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedMACAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)updateExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model extended MAC address to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__HMDCHIPAccessoryDataSource_updateExtendedMACAddress_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP extended MAC address"), v7, v13);

}

- (BOOL)wedSupport
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wedSupport");

  return v4;
}

- (void)updateWedSupport:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMDCHIPAccessoryDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model wed support to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__HMDCHIPAccessoryDataSource_updateWedSupport_completion___block_invoke;
  v12[3] = &__block_descriptor_33_e36_v16__0__HMDHAPAccessoryTransaction_8l;
  v13 = a3;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v8, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP wed support"), v6, v12);

}

- (NSNumber)softwareVersionNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersionNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateSoftwareVersionNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model software version to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HMDCHIPAccessoryDataSource_updateSoftwareVersionNumber_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update CHIP software version number"), v7, v13);

}

- (NSNumber)supportedLinkLayerTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chipStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedLinkLayerTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateSupportedLinkLayerTypes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPAccessoryDataSource *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory model link layer types to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__HMDCHIPAccessoryDataSource_updateSupportedLinkLayerTypes_completion___block_invoke;
  v13[3] = &unk_1E89B3540;
  v14 = v6;
  v12 = v6;
  -[HMDCHIPAccessoryDataSource _updateAccessoryModelWithLabel:completion:block:](v9, "_updateAccessoryModelWithLabel:completion:block:", CFSTR("Update supported link layer types"), v7, v13);

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCHIPAccessoryDataSource accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryDataSource nodeID](self, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

uint64_t __71__HMDCHIPAccessoryDataSource_updateSupportedLinkLayerTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportedLinkLayerTypes:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__HMDCHIPAccessoryDataSource_updateSoftwareVersionNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMatterSoftwareVersionNumber:", *(_QWORD *)(a1 + 32));
}

void __58__HMDCHIPAccessoryDataSource_updateWedSupport_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChipWEDSupport:", v5);

}

uint64_t __66__HMDCHIPAccessoryDataSource_updateExtendedMACAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChipExtendedMACAddress:", *(_QWORD *)(a1 + 32));
}

void __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "na_map:", &__block_literal_global_26_109661);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChipPairings:", v4);

}

id __56__HMDCHIPAccessoryDataSource_updatePairings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CBA380];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithHMMTRPairing:", v3);

  return v4;
}

uint64_t __38__HMDCHIPAccessoryDataSource_pairings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chipPluginPairing");
}

uint64_t __65__HMDCHIPAccessoryDataSource_updateAttributeDatabase_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChipAttributeDatabase:", *(_QWORD *)(a1 + 32));
}

void __66__HMDCHIPAccessoryDataSource_updateVendorID_productID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setChipVendorID:", v3);
  objc_msgSend(v4, "setChipProductID:", *(_QWORD *)(a1 + 40));

}

uint64_t __57__HMDCHIPAccessoryDataSource_updateProductID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChipProductID:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__HMDCHIPAccessoryDataSource_updateVendorID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChipVendorID:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__HMDCHIPAccessoryDataSource_updateNodeID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChipNodeID:", *(_QWORD *)(a1 + 32));
}

void __78__HMDCHIPAccessoryDataSource__updateAccessoryModelWithLabel_completion_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 32));
  v4 = v3;
  if (v3)
    (*((void (**)(void *, id))v3 + 2))(v3, v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_109693 != -1)
    dispatch_once(&logCategory__hmf_once_t15_109693, &__block_literal_global_41_109694);
  return (id)logCategory__hmf_once_v16_109695;
}

void __41__HMDCHIPAccessoryDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_109695;
  logCategory__hmf_once_v16_109695 = v0;

}

@end
