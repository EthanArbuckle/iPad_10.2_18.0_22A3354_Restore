@implementation HMSetupAccessoryDescription

- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMSetupAccessoryDescription *v14;
  uint64_t v15;
  NSUUID *accessoryUUID;
  uint64_t v17;
  NSString *accessoryName;
  uint64_t v19;
  NSString *appIdentifier;
  uint64_t v21;
  NSUUID *homeUUID;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMSetupAccessoryDescription;
  v14 = -[HMSetupAccessoryDescription init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    accessoryUUID = v14->_accessoryUUID;
    v14->_accessoryUUID = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    accessoryName = v14->_accessoryName;
    v14->_accessoryName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    appIdentifier = v14->_appIdentifier;
    v14->_appIdentifier = (NSString *)v19;

    v14->_addAndSetupAccessories = 0;
    v21 = objc_msgSend(v13, "copy");
    homeUUID = v14->_homeUUID;
    v14->_homeUUID = (NSUUID *)v21;

    v14->_certificationStatus = 0;
  }

  return v14;
}

- (HMSetupAccessoryDescription)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 appID:(id)a5 homeName:(id)a6 homeUUID:(id)a7 trustedOrigin:(BOOL)a8
{
  return -[HMSetupAccessoryDescription initWithAccessoryUUID:accessoryName:appID:homeUUID:](self, "initWithAccessoryUUID:accessoryName:appID:homeUUID:", a3, a4, a5, a7);
}

- (HMSetupAccessoryDescription)initWithAppIdentifier:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  HMSetupAccessoryDescription *v8;
  uint64_t v9;
  NSString *appIdentifier;
  uint64_t v11;
  NSUUID *homeUUID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMSetupAccessoryDescription;
  v8 = -[HMSetupAccessoryDescription init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appIdentifier = v8->_appIdentifier;
    v8->_appIdentifier = (NSString *)v9;

    v8->_addAndSetupAccessories = 1;
    v11 = objc_msgSend(v7, "copy");
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v11;

    v8->_certificationStatus = 0;
  }

  return v8;
}

- (HMSetupAccessoryDescription)initWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeUUID:(id)a5 ownershipToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMSetupAccessoryDescription *v15;
  uint64_t v16;
  NSString *appIdentifier;
  uint64_t v18;
  NSUUID *homeUUID;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMSetupAccessoryDescription;
  v15 = -[HMSetupAccessoryDescription init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    appIdentifier = v15->_appIdentifier;
    v15->_appIdentifier = (NSString *)v16;

    v15->_addAndSetupAccessories = 1;
    v18 = objc_msgSend(v13, "copy");
    homeUUID = v15->_homeUUID;
    v15->_homeUUID = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_setupAccessoryPayload, a3);
    v15->_certificationStatus = 0;
    objc_storeStrong((id *)&v15->_ownershipToken, a6);
  }

  return v15;
}

- (id)initToSetupAccessoriesWithSetupAccessoryPayload:(id)a3 appID:(id)a4 homeName:(id)a5 homeUUID:(id)a6 trustedOrigin:(BOOL)a7 ownershipToken:(id)a8
{
  return -[HMSetupAccessoryDescription initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:](self, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", a3, a4, a6, a8, a7);
}

- (HMSetupAccessoryDescription)initWithAddRequestIdentifier:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5 setupAccessoryPayload:(id)a6 appID:(id)a7 ownershipToken:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMSetupAccessoryDescription *v19;
  HMSetupAccessoryDescription *v20;
  uint64_t v21;
  NSString *appIdentifier;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMSetupAccessoryDescription;
  v19 = -[HMSetupAccessoryDescription init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_addAndSetupAccessories = 1;
    objc_storeStrong((id *)&v19->_addRequestIdentifier, a3);
    objc_storeStrong((id *)&v20->_accessoryName, a4);
    objc_storeStrong((id *)&v20->_category, a5);
    objc_storeStrong((id *)&v20->_setupAccessoryPayload, a6);
    v21 = objc_msgSend(v17, "copy", v24, v25);
    appIdentifier = v20->_appIdentifier;
    v20->_appIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_ownershipToken, a8);
  }

  return v20;
}

- (HMSetupAccessoryDescription)initWithStagedCHIPAccessoryPairingIdentifier:(id)a3
{
  id v5;
  void *v6;
  HMSetupAccessoryDescription *v7;
  HMSetupAccessoryDescription *v8;
  HMSetupAccessoryDescription *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)HMSetupAccessoryDescription;
    v7 = -[HMSetupAccessoryDescription init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_addAndSetupAccessories = 1;
      objc_storeStrong((id *)&v7->_accessoryServerIdentifier, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    return -[HMSetupAccessoryDescription initWithDictionaryRepresentation:](v10, v11, v12);
  }
}

- (HMSetupAccessoryDescription)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  __CFString *v6;
  HMSetupAccessoryDescription *v7;
  id v8;
  HMSetupAccessoryDescription *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMSetupAccessoryDescription *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMSetupAccessoryDescription init](self, "init");
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("HMSADDRK.data"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v18);
    v7 = (HMSetupAccessoryDescription *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        v21 = 2112;
        v22 = v6;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory description from dictionary representation; failed to deserialize data %@: %@",
          buf,
          0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

    v13 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("HMSADDRK.data");
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory description from dictionary representation: missing %@ key in dictionary: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v13 = 0;
  }

  return v13;
}

- (void)updateWithSetupAccessoryPayload:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMSetupAccessoryDescription setSetupAccessoryPayload:](self, "setSetupAccessoryPayload:", v4);

  }
  else
  {
    v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateWithAccessory:](v5, v6, v7);
  }
}

- (void)updateWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMSetupAccessoryDescription *v9;
  SEL v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setAccessoryUUID:](self, "setAccessoryUUID:", v5);

    objc_msgSend(v12, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setAccessoryName:](self, "setAccessoryName:", v6);

    objc_msgSend(v12, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setCategory:](self, "setCategory:", v7);

    objc_msgSend(v12, "manufacturer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setManufacturerName:](self, "setManufacturerName:", v8);

  }
  else
  {
    v9 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateOwnershipToken:](v9, v10, v11);
  }
}

- (void)updateAppIdentifier:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMSetupAccessoryDescription setAppIdentifier:](self, "setAppIdentifier:", v4);

  }
  else
  {
    v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateAccessoryCategory:](v5, v6, v7);
  }
}

- (void)updateAccessoryCategory:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMSetupAccessoryDescription setCategory:](self, "setCategory:", v4);

  }
  else
  {
    v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateAccessoryName:](v5, v6, v7);
  }
}

- (void)updateAccessoryName:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  SEL v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[HMSetupAccessoryDescription setAccessoryName:](self, "setAccessoryName:", v4);

  }
  else
  {
    v5 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateWithAuthToken:uuid:](v5, v6, v7, v8);
  }
}

- (void)updateWithAuthToken:(id)a3 uuid:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMSetupAccessoryDescription *v10;
  SEL v11;
  BOOL v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v13, "copy");
    -[HMSetupAccessoryDescription setSetupAuthToken:](self, "setSetupAuthToken:", v8);

    v9 = (void *)objc_msgSend(v7, "copy");
    -[HMSetupAccessoryDescription setSetupAuthTokenUUID:](self, "setSetupAuthTokenUUID:", v9);

  }
  else
  {
    v10 = (HMSetupAccessoryDescription *)_HMFPreconditionFailure();
    -[HMSetupAccessoryDescription updateRetry:](v10, v11, v12);
  }
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  HMSetupAccessoryDescription *v7;
  NSObject *v8;
  void *v9;
  id v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  HMSetupAccessoryDescription *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v12 = CFSTR("HMSADDRK.data");
    v13 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize device setup request %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return (NSDictionary *)v5;
}

- (BOOL)supportsIP
{
  void *v2;
  char v3;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsIP");

  return v3;
}

- (BOOL)supportsWAC
{
  void *v2;
  char v3;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsWAC");

  return v3;
}

- (BOOL)supportsBTLE
{
  void *v2;
  char v3;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBTLE");

  return v3;
}

- (BOOL)isPaired
{
  void *v2;
  char v3;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaired");

  return v3;
}

- (void)setSetupCode:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_storeStrong((id *)&self->_setupCode, a3);

}

- (NSString)setupCode
{
  NSString *setupCode;
  NSString *v3;
  void *v4;

  setupCode = self->_setupCode;
  if (setupCode)
  {
    v3 = setupCode;
  }
  else
  {
    -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupCode");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)setupID
{
  void *v2;
  void *v3;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMAccessoryCategory)category
{
  HMAccessoryCategory *category;
  HMAccessoryCategory *v3;
  void *v5;
  void *v6;
  void *v7;

  category = self->_category;
  if (category)
  {
    v3 = category;
  }
  else
  {
    +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryForIdentifier:", v7);
    v3 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)hasAddRequest
{
  void *v2;
  BOOL v3;

  -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSUUID)suggestedRoomUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (HMSetupAccessoryDescription)initWithCoder:(id)a3
{
  id v4;
  HMSetupAccessoryDescription *v5;
  void *v6;
  uint64_t v7;
  NSUUID *accessoryUUID;
  void *v9;
  uint64_t v10;
  NSString *accessoryName;
  void *v12;
  uint64_t v13;
  NSString *appIdentifier;
  void *v15;
  uint64_t v16;
  NSURL *appBundleURL;
  void *v18;
  uint64_t v19;
  NSUUID *homeUUID;
  void *v21;
  uint64_t v22;
  HMSetupAccessoryPayload *setupAccessoryPayload;
  void *v24;
  uint64_t v25;
  NSUUID *setupAuthTokenUUID;
  void *v27;
  uint64_t v28;
  NSData *setupAuthToken;
  uint64_t v30;
  HMAccessoryOwnershipToken *ownershipToken;
  uint64_t v32;
  NSUUID *suggestedRoomUUID;
  uint64_t v34;
  NSString *suggestedAccessoryName;
  uint64_t v36;
  NSString *storeID;
  uint64_t v38;
  NSString *bundleID;
  uint64_t v40;
  NSUUID *addRequestIdentifier;
  uint64_t v42;
  NSError *cancellationReason;
  uint64_t v44;
  NSString *marketingName;
  uint64_t v46;
  NSURL *installationGuideURL;
  uint64_t v48;
  NSString *accessoryServerIdentifier;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HMSetupAccessoryDescription;
  v5 = -[HMSetupAccessoryDescription init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    accessoryUUID = v5->_accessoryUUID;
    v5->_accessoryUUID = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    accessoryName = v5->_accessoryName;
    v5->_accessoryName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appBundleURL = v5->_appBundleURL;
    v5->_appBundleURL = (NSURL *)v16;

    v5->_addAndSetupAccessories = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("addAndSetupAccessories"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupAccessoryPayload"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    setupAccessoryPayload = v5->_setupAccessoryPayload;
    v5->_setupAccessoryPayload = (HMSetupAccessoryPayload *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupAuthTokenUUID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    setupAuthTokenUUID = v5->_setupAuthTokenUUID;
    v5->_setupAuthTokenUUID = (NSUUID *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupAuthToken"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    setupAuthToken = v5->_setupAuthToken;
    v5->_setupAuthToken = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownershipToken"));
    v30 = objc_claimAutoreleasedReturnValue();
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (HMAccessoryOwnershipToken *)v30;

    v5->_certificationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("certificationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedRoomUUID"));
    v32 = objc_claimAutoreleasedReturnValue();
    suggestedRoomUUID = v5->_suggestedRoomUUID;
    v5->_suggestedRoomUUID = (NSUUID *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedAccessoryName"));
    v34 = objc_claimAutoreleasedReturnValue();
    suggestedAccessoryName = v5->_suggestedAccessoryName;
    v5->_suggestedAccessoryName = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeID"));
    v36 = objc_claimAutoreleasedReturnValue();
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v38 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addRequestIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    addRequestIdentifier = v5->_addRequestIdentifier;
    v5->_addRequestIdentifier = (NSUUID *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelationReason"));
    v42 = objc_claimAutoreleasedReturnValue();
    cancellationReason = v5->_cancellationReason;
    v5->_cancellationReason = (NSError *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("marketingName"));
    v44 = objc_claimAutoreleasedReturnValue();
    marketingName = v5->_marketingName;
    v5->_marketingName = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationGuideURL"));
    v46 = objc_claimAutoreleasedReturnValue();
    installationGuideURL = v5->_installationGuideURL;
    v5->_installationGuideURL = (NSURL *)v46;

    v5->_entitledForHomeKitSPI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntitledForHomeKitSPI"));
    v5->_entitledForThirdPartySetupAccessoryPayload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntitledForThirdPartySetupAccessoryPayload"));
    v5->_entitledForThirdPartyMatterSetupPayload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEntitledForThirdPartyMatterSetupPayload"));
    v5->_setupInitiatedByOtherMatterEcosystem = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSetupInitiatedByOtherMatterEcosystem"));
    v5->_userConsentedForReplace = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryServerIdentifier"));
    v48 = objc_claimAutoreleasedReturnValue();
    accessoryServerIdentifier = v5->_accessoryServerIdentifier;
    v5->_accessoryServerIdentifier = (NSString *)v48;

    v5->_doNetworkScan = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("networkScan"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v4, CFSTR("uuid"));

  -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v5, CFSTR("name"));

  -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v6, CFSTR("appIdentifier"));

  -[HMSetupAccessoryDescription appBundleURL](self, "appBundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v7, CFSTR("appBundleURL"));

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories"), CFSTR("addAndSetupAccessories"));
  -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v8, CFSTR("homeUUID"));

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v9, CFSTR("setupAccessoryPayload"));

  -[HMSetupAccessoryDescription setupAuthTokenUUID](self, "setupAuthTokenUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v10, CFSTR("setupAuthTokenUUID"));

  -[HMSetupAccessoryDescription setupAuthToken](self, "setupAuthToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v11, CFSTR("setupAuthToken"));

  -[HMSetupAccessoryDescription ownershipToken](self, "ownershipToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v12, CFSTR("ownershipToken"));

  objc_msgSend(v22, "encodeInteger:forKey:", -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"), CFSTR("certificationStatus"));
  -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v13, CFSTR("suggestedRoomUUID"));

  -[HMSetupAccessoryDescription suggestedAccessoryName](self, "suggestedAccessoryName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v14, CFSTR("suggestedAccessoryName"));

  -[HMSetupAccessoryDescription storeID](self, "storeID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v15, CFSTR("storeID"));

  -[HMSetupAccessoryDescription bundleID](self, "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v16, CFSTR("bundleID"));

  -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v17, CFSTR("addRequestIdentifier"));

  -[HMSetupAccessoryDescription cancellationReason](self, "cancellationReason");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v18, CFSTR("cancelationReason"));

  -[HMSetupAccessoryDescription marketingName](self, "marketingName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v19, CFSTR("marketingName"));

  -[HMSetupAccessoryDescription installationGuideURL](self, "installationGuideURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v20, CFSTR("installationGuideURL"));

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI"), CFSTR("isEntitledForHomeKitSPI"));
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload"), CFSTR("isEntitledForThirdPartySetupAccessoryPayload"));
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload"), CFSTR("isEntitledForThirdPartyMatterSetupPayload"));
  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem"), CFSTR("isSetupInitiatedByOtherMatterEcosystem"));
  -[HMSetupAccessoryDescription accessoryServerIdentifier](self, "accessoryServerIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v21, CFSTR("accessoryServerIdentifier"));

  objc_msgSend(v22, "encodeBool:forKey:", -[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan"), CFSTR("networkScan"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  HMSetupAccessoryDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMSetupAccessoryDescription *v12;
  HMSetupAccessoryDescription *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [HMSetupAccessoryDescription alloc];
    -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription ownershipToken](self, "ownershipToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMSetupAccessoryDescription initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:](v5, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v6, v7, v8, v9);
  }
  else
  {
    -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [HMSetupAccessoryDescription alloc];
    if (!v11)
    {
      -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMSetupAccessoryDescription initWithAppIdentifier:homeUUID:](v12, "initWithAppIdentifier:homeUUID:", v6, v7);
      goto LABEL_6;
    }
    -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMSetupAccessoryDescription initWithAccessoryUUID:accessoryName:appID:homeUUID:](v12, "initWithAccessoryUUID:accessoryName:appID:homeUUID:", v6, v7, v8, v9);
  }
  v13 = (HMSetupAccessoryDescription *)v10;

LABEL_6:
  -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setAccessoryName:](v13, "setAccessoryName:", v14);

  -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setAccessoryUUID:](v13, "setAccessoryUUID:", v15);

  -[HMSetupAccessoryDescription appBundleURL](self, "appBundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setAppBundleURL:](v13, "setAppBundleURL:", v16);

  -[HMSetupAccessoryDescription setAddAndSetupAccessories:](v13, "setAddAndSetupAccessories:", -[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories"));
  -[HMSetupAccessoryDescription setCertificationStatus:](v13, "setCertificationStatus:", -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"));
  -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setSuggestedRoomUUID:](v13, "setSuggestedRoomUUID:", v17);

  -[HMSetupAccessoryDescription suggestedAccessoryName](self, "suggestedAccessoryName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setSuggestedAccessoryName:](v13, "setSuggestedAccessoryName:", v18);

  -[HMSetupAccessoryDescription storeID](self, "storeID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setStoreID:](v13, "setStoreID:", v19);

  -[HMSetupAccessoryDescription bundleID](self, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setBundleID:](v13, "setBundleID:", v20);

  -[HMSetupAccessoryDescription setUserConsentedForReplace:](v13, "setUserConsentedForReplace:", -[HMSetupAccessoryDescription userConsentedForReplace](self, "userConsentedForReplace"));
  -[HMSetupAccessoryDescription category](self, "category");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setCategory:](v13, "setCategory:", v21);

  -[HMSetupAccessoryDescription cancellationReason](self, "cancellationReason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setCancellationReason:](v13, "setCancellationReason:", v22);

  -[HMSetupAccessoryDescription setEntitledForHomeKitSPI:](v13, "setEntitledForHomeKitSPI:", -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI"));
  -[HMSetupAccessoryDescription setEntitledForThirdPartySetupAccessoryPayload:](v13, "setEntitledForThirdPartySetupAccessoryPayload:", -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload"));
  -[HMSetupAccessoryDescription setEntitledForThirdPartyMatterSetupPayload:](v13, "setEntitledForThirdPartyMatterSetupPayload:", -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload"));
  -[HMSetupAccessoryDescription setSetupInitiatedByOtherMatterEcosystem:](v13, "setSetupInitiatedByOtherMatterEcosystem:", -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem"));
  -[HMSetupAccessoryDescription accessoryServerIdentifier](self, "accessoryServerIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription setAccessoryServerIdentifier:](v13, "setAccessoryServerIdentifier:", v23);

  -[HMSetupAccessoryDescription setDoNetworkScan:](v13, "setDoNetworkScan:", -[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan"));
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMSetupAccessoryDescription *v4;
  HMSetupAccessoryDescription *v5;
  HMSetupAccessoryDescription *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  _BOOL4 v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  _BOOL4 v53;
  unint64_t v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  _BOOL4 v70;
  _BOOL4 v71;

  v4 = (HMSetupAccessoryDescription *)a3;
  if (v4 == self)
  {
    LOBYTE(v71) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_32;
    -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription accessoryUUID](v6, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_32;
    -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription accessoryName](v6, "accessoryName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (!v12)
      goto LABEL_32;
    -[HMSetupAccessoryDescription manufacturerName](self, "manufacturerName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription manufacturerName](v6, "manufacturerName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if (!v15)
      goto LABEL_32;
    -[HMSetupAccessoryDescription marketingName](self, "marketingName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription marketingName](v6, "marketingName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

    if (!v18)
      goto LABEL_32;
    -[HMSetupAccessoryDescription installationGuideURL](self, "installationGuideURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription installationGuideURL](v6, "installationGuideURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if (!v21)
      goto LABEL_32;
    -[HMSetupAccessoryDescription category](self, "category");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription category](v6, "category");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

    if (!v24)
      goto LABEL_32;
    -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription appIdentifier](v6, "appIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = HMFEqualObjects();

    if (!v27)
      goto LABEL_32;
    -[HMSetupAccessoryDescription appBundleURL](self, "appBundleURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription appBundleURL](v6, "appBundleURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = HMFEqualObjects();

    if (!v30)
      goto LABEL_32;
    v31 = -[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories");
    if (v31 != -[HMSetupAccessoryDescription addAndSetupAccessories](v6, "addAndSetupAccessories"))
      goto LABEL_32;
    -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription homeUUID](v6, "homeUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = HMFEqualObjects();

    if (!v34)
      goto LABEL_32;
    -[HMSetupAccessoryDescription storeID](self, "storeID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription storeID](v6, "storeID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = HMFEqualObjects();

    if (!v37)
      goto LABEL_32;
    -[HMSetupAccessoryDescription bundleID](self, "bundleID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription bundleID](v6, "bundleID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HMFEqualObjects();

    if (!v40)
      goto LABEL_32;
    -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription suggestedRoomUUID](v6, "suggestedRoomUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = HMFEqualObjects();

    if (!v43)
      goto LABEL_32;
    -[HMSetupAccessoryDescription suggestedAccessoryName](self, "suggestedAccessoryName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription suggestedAccessoryName](v6, "suggestedAccessoryName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = HMFEqualObjects();

    if (!v46)
      goto LABEL_32;
    v47 = -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI");
    if (v47 != -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](v6, "isEntitledForHomeKitSPI"))
      goto LABEL_32;
    v48 = -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload");
    if (v48 != -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](v6, "isEntitledForThirdPartySetupAccessoryPayload"))goto LABEL_32;
    -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setupAccessoryPayload](v6, "setupAccessoryPayload");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = HMFEqualObjects();

    if (!v51)
      goto LABEL_32;
    v52 = -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload");
    if (v52 != -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](v6, "isEntitledForThirdPartyMatterSetupPayload"))goto LABEL_32;
    v53 = -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem");
    if (v53 != -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](v6, "isSetupInitiatedByOtherMatterEcosystem"))goto LABEL_32;
    v54 = -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus");
    if (v54 != -[HMSetupAccessoryDescription certificationStatus](v6, "certificationStatus"))
      goto LABEL_32;
    -[HMSetupAccessoryDescription accessoryBeingReplaced](self, "accessoryBeingReplaced");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription accessoryBeingReplaced](v6, "accessoryBeingReplaced");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = HMFEqualObjects();

    if (!v57)
      goto LABEL_32;
    -[HMSetupAccessoryDescription cancellationReason](self, "cancellationReason");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription cancellationReason](v6, "cancellationReason");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = HMFEqualObjects();

    if (!v60)
      goto LABEL_32;
    -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription addRequestIdentifier](v6, "addRequestIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = HMFEqualObjects();

    if (!v63)
      goto LABEL_32;
    -[HMSetupAccessoryDescription setupCode](self, "setupCode");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription setupCode](v6, "setupCode");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = HMFEqualObjects();

    if (!v66)
      goto LABEL_32;
    -[HMSetupAccessoryDescription accessoryServerIdentifier](self, "accessoryServerIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSetupAccessoryDescription accessoryServerIdentifier](v6, "accessoryServerIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = HMFEqualObjects();

    if (v69)
    {
      v70 = -[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan");
      v71 = v70 ^ -[HMSetupAccessoryDescription doNetworkScan](v6, "doNetworkScan") ^ 1;
    }
    else
    {
LABEL_32:
      LOBYTE(v71) = 0;
    }

  }
  return v71;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription accessoryName](self, "accessoryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Accessory Name"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription accessoryUUID](self, "accessoryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Accessory UUID"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMSetupAccessoryDescription manufacturerName](self, "manufacturerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription manufacturerName](self, "manufacturerName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Manufacturer Name"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMSetupAccessoryDescription marketingName](self, "marketingName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription marketingName](self, "marketingName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Marketing Name"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMSetupAccessoryDescription installationGuideURL](self, "installationGuideURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription installationGuideURL](self, "installationGuideURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Installation Guide URL"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMSetupAccessoryDescription category](self, "category");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription category](self, "category");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Category"), v26);
    objc_msgSend(v3, "addObject:", v27);

  }
  -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription appIdentifier](self, "appIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("App Identifier"), v30);
    objc_msgSend(v3, "addObject:", v31);

  }
  -[HMSetupAccessoryDescription appBundleURL](self, "appBundleURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription appBundleURL](self, "appBundleURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithName:value:", CFSTR("App Bundle URL"), v34);
    objc_msgSend(v3, "addObject:", v35);

  }
  if (-[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories"))
  {
    v36 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription addAndSetupAccessories](self, "addAndSetupAccessories");
    HMFBooleanToString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithName:value:", CFSTR("Add And Setup"), v37);
    objc_msgSend(v3, "addObject:", v38);

  }
  -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription homeUUID](self, "homeUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithName:value:", CFSTR("Home UUID"), v41);
    objc_msgSend(v3, "addObject:", v42);

  }
  -[HMSetupAccessoryDescription storeID](self, "storeID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription storeID](self, "storeID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithName:value:", CFSTR("Store ID"), v45);
    objc_msgSend(v3, "addObject:", v46);

  }
  -[HMSetupAccessoryDescription bundleID](self, "bundleID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription bundleID](self, "bundleID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v48, "initWithName:value:", CFSTR("Bundle ID"), v49);
    objc_msgSend(v3, "addObject:", v50);

  }
  -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v52 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription suggestedRoomUUID](self, "suggestedRoomUUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v52, "initWithName:value:", CFSTR("Suggested Room UUID"), v53);
    objc_msgSend(v3, "addObject:", v54);

  }
  -[HMSetupAccessoryDescription suggestedAccessoryName](self, "suggestedAccessoryName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription suggestedAccessoryName](self, "suggestedAccessoryName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v56, "initWithName:value:", CFSTR("Suggested Accessory Name"), v57);
    objc_msgSend(v3, "addObject:", v58);

  }
  if (-[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI"))
  {
    v59 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription isEntitledForHomeKitSPI](self, "isEntitledForHomeKitSPI");
    HMFBooleanToString();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initWithName:value:", CFSTR("SPI Entitled"), v60);
    objc_msgSend(v3, "addObject:", v61);

  }
  if (-[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload"))
  {
    v62 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription isEntitledForThirdPartySetupAccessoryPayload](self, "isEntitledForThirdPartySetupAccessoryPayload");
    HMFBooleanToString();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v62, "initWithName:value:", CFSTR("Setup Accessory Payload Entitled"), v63);
    objc_msgSend(v3, "addObject:", v64);

  }
  if (-[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload"))
  {
    v65 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription isEntitledForThirdPartyMatterSetupPayload](self, "isEntitledForThirdPartyMatterSetupPayload");
    HMFBooleanToString();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v65, "initWithName:value:", CFSTR("Matter Setup Payload Entitled"), v66);
    objc_msgSend(v3, "addObject:", v67);

  }
  if (-[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem"))
  {
    v68 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription isSetupInitiatedByOtherMatterEcosystem](self, "isSetupInitiatedByOtherMatterEcosystem");
    HMFBooleanToString();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v68, "initWithName:value:", CFSTR("Setup Initiated By Other Matter Ecosystem"), v69);
    objc_msgSend(v3, "addObject:", v70);

  }
  -[HMSetupAccessoryDescription setupAuthTokenUUID](self, "setupAuthTokenUUID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v72 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription setupAuthTokenUUID](self, "setupAuthTokenUUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v72, "initWithName:value:", CFSTR("Setup Auth Token UUID"), v73);
    objc_msgSend(v3, "addObject:", v74);

  }
  -[HMSetupAccessoryDescription setupAuthToken](self, "setupAuthToken");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    v76 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription setupAuthToken](self, "setupAuthToken");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v76, "initWithName:value:", CFSTR("Setup Auth Token"), v77);
    objc_msgSend(v3, "addObject:", v78);

  }
  -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v80 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription setupAccessoryPayload](self, "setupAccessoryPayload");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend(v80, "initWithName:value:", CFSTR("Setup Accessory Payload"), v81);
    objc_msgSend(v3, "addObject:", v82);

  }
  if (-[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"))
  {
    v83 = objc_alloc(MEMORY[0x1E0D28548]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMSetupAccessoryDescription certificationStatus](self, "certificationStatus"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)objc_msgSend(v83, "initWithName:value:", CFSTR("Certification Status"), v84);
    objc_msgSend(v3, "addObject:", v85);

  }
  -[HMSetupAccessoryDescription accessoryBeingReplaced](self, "accessoryBeingReplaced");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Accessory Being Replaced"), v86);
    objc_msgSend(v3, "addObject:", v87);

  }
  -[HMSetupAccessoryDescription cancellationReason](self, "cancellationReason");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    v89 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription cancellationReason](self, "cancellationReason");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v89, "initWithName:value:", CFSTR("Cancellation Reason"), v90);
    objc_msgSend(v3, "addObject:", v91);

  }
  -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    v93 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription addRequestIdentifier](self, "addRequestIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)objc_msgSend(v93, "initWithName:value:", CFSTR("Add Request Identifier"), v94);
    objc_msgSend(v3, "addObject:", v95);

  }
  -[HMSetupAccessoryDescription setupCode](self, "setupCode");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    v97 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription setupCode](self, "setupCode");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend(v97, "initWithName:value:", CFSTR("Has Setup Code"), v99);
    objc_msgSend(v3, "addObject:", v100);

  }
  -[HMSetupAccessoryDescription ownershipToken](self, "ownershipToken");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    v102 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription ownershipToken](self, "ownershipToken");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)objc_msgSend(v102, "initWithName:value:", CFSTR("Has Ownership Token"), v104);
    objc_msgSend(v3, "addObject:", v105);

  }
  -[HMSetupAccessoryDescription accessoryServerIdentifier](self, "accessoryServerIdentifier");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    v107 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription accessoryServerIdentifier](self, "accessoryServerIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend(v107, "initWithName:value:", CFSTR("Accessory Server Identifier"), v108);
    objc_msgSend(v3, "addObject:", v109);

  }
  if (-[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan"))
  {
    v110 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMSetupAccessoryDescription doNetworkScan](self, "doNetworkScan");
    HMFBooleanToString();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)objc_msgSend(v110, "initWithName:value:", CFSTR("Do Network Scan"), v111);
    objc_msgSend(v3, "addObject:", v112);

  }
  v113 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v113;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)installationGuideURL
{
  return self->_installationGuideURL;
}

- (void)setInstallationGuideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (void)setAppBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)addAndSetupAccessories
{
  return self->_addAndSetupAccessories;
}

- (void)setAddAndSetupAccessories:(BOOL)a3
{
  self->_addAndSetupAccessories = a3;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isEntitledForHomeKitSPI
{
  return self->_entitledForHomeKitSPI;
}

- (void)setEntitledForHomeKitSPI:(BOOL)a3
{
  self->_entitledForHomeKitSPI = a3;
}

- (BOOL)isEntitledForThirdPartySetupAccessoryPayload
{
  return self->_entitledForThirdPartySetupAccessoryPayload;
}

- (void)setEntitledForThirdPartySetupAccessoryPayload:(BOOL)a3
{
  self->_entitledForThirdPartySetupAccessoryPayload = a3;
}

- (BOOL)isEntitledForThirdPartyMatterSetupPayload
{
  return self->_entitledForThirdPartyMatterSetupPayload;
}

- (void)setEntitledForThirdPartyMatterSetupPayload:(BOOL)a3
{
  self->_entitledForThirdPartyMatterSetupPayload = a3;
}

- (NSString)suggestedAccessoryName
{
  return self->_suggestedAccessoryName;
}

- (void)setSuggestedAccessoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (HMSetupAccessoryPayload)setupAccessoryPayload
{
  return self->_setupAccessoryPayload;
}

- (void)setSetupAccessoryPayload:(id)a3
{
  objc_storeStrong((id *)&self->_setupAccessoryPayload, a3);
}

- (NSData)setupAuthToken
{
  return self->_setupAuthToken;
}

- (void)setSetupAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSUUID)setupAuthTokenUUID
{
  return self->_setupAuthTokenUUID;
}

- (void)setSetupAuthTokenUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCertificationStatus:(unint64_t)a3
{
  self->_certificationStatus = a3;
}

- (HMAccessory)accessoryBeingReplaced
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessoryBeingReplaced);
}

- (void)setAccessoryBeingReplaced:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryBeingReplaced, a3);
}

- (NSError)cancellationReason
{
  return self->_cancellationReason;
}

- (void)setCancellationReason:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationReason, a3);
}

- (BOOL)isSetupInitiatedByOtherMatterEcosystem
{
  return self->_setupInitiatedByOtherMatterEcosystem;
}

- (void)setSetupInitiatedByOtherMatterEcosystem:(BOOL)a3
{
  self->_setupInitiatedByOtherMatterEcosystem = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)doNetworkScan
{
  return self->_doNetworkScan;
}

- (void)setDoNetworkScan:(BOOL)a3
{
  self->_doNetworkScan = a3;
}

- (NSUUID)suggestedRoomUUID
{
  return self->_suggestedRoomUUID;
}

- (void)setSuggestedRoomUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (HMAccessoryOwnershipToken)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setOwnershipToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSUUID)addRequestIdentifier
{
  return self->_addRequestIdentifier;
}

- (void)setAddRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)userConsentedForReplace
{
  return self->_userConsentedForReplace;
}

- (void)setUserConsentedForReplace:(BOOL)a3
{
  self->_userConsentedForReplace = a3;
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setAccessoryServerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_addRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUUID, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_destroyWeak((id *)&self->_accessoryBeingReplaced);
  objc_storeStrong((id *)&self->_setupAuthTokenUUID, 0);
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_setupAccessoryPayload, 0);
  objc_storeStrong((id *)&self->_suggestedAccessoryName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_appBundleURL, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_installationGuideURL, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
