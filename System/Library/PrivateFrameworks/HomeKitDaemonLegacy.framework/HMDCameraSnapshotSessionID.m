@implementation HMDCameraSnapshotSessionID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingTier, 0);
  objc_storeStrong((id *)&self->_snapshotCharacteristicEventUUID, 0);
}

- (HMDCameraSnapshotSessionID)initWithAccessory:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraSnapshotSessionID *v13;
  unsigned int v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraSnapshotSessionID *v23;
  HMDCameraSnapshotSessionID *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  HMDCameraSnapshotSessionID *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "stringForKey:", CFSTR("kCameraSessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v32 = self;
    objc_msgSend(v7, "numberForKey:", CFSTR("kCameraStreamingTierType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForKey:", CFSTR("kCameraProactiveSessionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37A0];
    v34 = v6;
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v12, "appendFormat:", CFSTR("/%@"), v9);
    v13 = -[HMDCameraSessionID initWithSessionID:message:description:]([HMDCameraSnapshotSessionID alloc], "initWithSessionID:message:description:", v8, v7, v12);
    v14 = objc_msgSend(v7, "BOOLForKey:", *MEMORY[0x1E0CB8620]);
    v15 = v14;
    if (v9)
      v16 = 1;
    else
      v16 = v14;
    v30 = v16;
    -[HMDCameraSessionID sessionID](v13, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSessionID hostProcessBundleIdentifier](v13, "hostProcessBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDCameraSessionID isSPIClient](v13, "isSPIClient");
    -[HMDCameraSessionID deviceSectionName](v13, "deviceSectionName");
    v31 = v12;
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSessionID description](v13, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = v15;
    v23 = -[HMDCameraSnapshotSessionID initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:snapshotReason:snapshotRequestForBulletin:snapshotCharacteristicEventUUID:streamingTier:](v32, "initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:snapshotReason:snapshotRequestForBulletin:snapshotCharacteristicEventUUID:streamingTier:", v17, v18, v19, v21, v22, v30, v29, v9, v33);

    v8 = v20;
    v24 = v23;
    v6 = v34;
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Snapshot session ID is not present in message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

- (HMDCameraSnapshotSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7 snapshotReason:(unint64_t)a8 snapshotRequestForBulletin:(BOOL)a9 snapshotCharacteristicEventUUID:(id)a10 streamingTier:(id)a11
{
  _BOOL8 v13;
  id v17;
  id v18;
  HMDCameraSnapshotSessionID *v19;
  HMDCameraSnapshotSessionID *v20;
  objc_super v23;

  v13 = a5;
  v17 = a10;
  v18 = a11;
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraSnapshotSessionID;
  v19 = -[HMDCameraSessionID initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:](&v23, sel_initWithSessionID_hostProcessBundleIdentifier_isSPIClient_deviceSectionName_description_, a3, a4, v13, a6, a7);
  v20 = v19;
  if (v19)
  {
    v19->_snapshotReason = a8;
    objc_storeStrong((id *)&v19->_snapshotCharacteristicEventUUID, a10);
    v20->_snapshotRequestForBulletin = a9;
    objc_storeStrong((id *)&v20->_streamingTier, a11);
  }

  return v20;
}

- (NSString)snapshotCharacteristicEventUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isSnapshotRequestForBulletin
{
  return self->_snapshotRequestForBulletin;
}

- (unint64_t)snapshotReason
{
  return self->_snapshotReason;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCameraSnapshotSessionID *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  HMDCameraSnapshotSessionID *v14;
  uint64_t v16;

  v4 = +[HMDCameraSnapshotSessionID allocWithZone:](HMDCameraSnapshotSessionID, "allocWithZone:", a3);
  -[HMDCameraSessionID sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSessionID hostProcessBundleIdentifier](self, "hostProcessBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSessionID isSPIClient](self, "isSPIClient");
  -[HMDCameraSessionID deviceSectionName](self, "deviceSectionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSessionID description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCameraSnapshotSessionID snapshotReason](self, "snapshotReason");
  v11 = -[HMDCameraSnapshotSessionID isSnapshotRequestForBulletin](self, "isSnapshotRequestForBulletin");
  -[HMDCameraSnapshotSessionID snapshotCharacteristicEventUUID](self, "snapshotCharacteristicEventUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotSessionID streamingTier](self, "streamingTier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v11;
  v14 = -[HMDCameraSnapshotSessionID initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:snapshotReason:snapshotRequestForBulletin:snapshotCharacteristicEventUUID:streamingTier:](v4, "initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:snapshotReason:snapshotRequestForBulletin:snapshotCharacteristicEventUUID:streamingTier:", v5, v6, v7, v8, v9, v10, v16, v12, v13);

  return v14;
}

- (NSNumber)streamingTier
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

@end
