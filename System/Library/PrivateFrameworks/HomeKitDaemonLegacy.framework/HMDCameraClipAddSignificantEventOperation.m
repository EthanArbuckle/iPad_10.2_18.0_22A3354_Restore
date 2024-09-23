@implementation HMDCameraClipAddSignificantEventOperation

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCameraClipOperationDataSource *v14;
  HMDCameraClipAddSignificantEventOperation *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v15 = -[HMDCameraClipAddSignificantEventOperation initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:dataSource:](self, "initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:dataSource:", v13, v12, v11, v10, v14);

  return v15;
}

- (HMDCameraClipAddSignificantEventOperation)initWithClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 dataSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDCameraClipAddSignificantEventOperation *v18;
  uint64_t v19;
  HMDCameraRecordingSessionSignificantEvent *significantEvent;
  HMDCameraClipAddSignificantEventOperation *v22;
  SEL v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_13:
    v22 = (HMDCameraClipAddSignificantEventOperation *)_HMFPreconditionFailure();
    return (HMDCameraClipAddSignificantEventOperation *)-[HMDCameraClipAddSignificantEventOperation modelsToAdd](v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  v18 = -[HMDCameraClipOperation initWithClipModelID:localZone:dataSource:](&v24, sel_initWithClipModelID_localZone_dataSource_, v12, v13, v16);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    significantEvent = v18->_significantEvent;
    v18->_significantEvent = (HMDCameraRecordingSessionSignificantEvent *)v19;

    objc_storeStrong((id *)&v18->_homePresenceByPairingIdentity, a6);
  }

  return v18;
}

- (id)modelsToAdd
{
  void *v3;
  HMDCameraSignificantEventNotificationModel *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraSignificantEventNotificationModel *v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraClipAddSignificantEventOperation *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  HMDCameraSignificantEventFaceClassificationModel *v36;
  void *v37;
  void *v38;
  HMDCameraSignificantEventFaceClassificationModel *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDCameraClipAddSignificantEventOperation *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  void *v53;
  HMDCameraSignificantEventNotificationModel *v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [HMDCameraSignificantEventNotificationModel alloc];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipOperation clipModelID](self, "clipModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v6, v7);

  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateOfOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setDateOfOccurrence:](v8, "setDateOfOccurrence:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "reason"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setSignificantEvent:](v8, "setSignificantEvent:", v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "confidenceLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setConfidenceLevel:](v8, "setConfidenceLevel:", v16);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeOffsetWithinClip");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setTimeOffsetWithinClip:](v8, "setTimeOffsetWithinClip:", v19);

  v20 = objc_alloc(MEMORY[0x1E0D32C68]);
  -[HMDCameraClipOperation clipModelID](self, "clipModelID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithModelID:action:", v21, 1);
  -[HMDCameraSignificantEventNotificationModel setAssociatedClip:](v8, "setAssociatedClip:", v22);

  -[HMDCameraClipAddSignificantEventOperation homePresenceByPairingIdentity](self, "homePresenceByPairingIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setHomePresenceByPairingIdentity:](v8, "setHomePresenceByPairingIdentity:", v23);

  v53 = v3;
  v54 = v8;
  v24 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v3, "addObject:", v8));
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel debugDescription](v8, "debugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v27;
    v63 = 2112;
    v64 = v28;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating significant event model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[HMDCameraClipAddSignificantEventOperation significantEvent](v25, "significantEvent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "faceClassifications");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v30;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v36 = [HMDCameraSignificantEventFaceClassificationModel alloc];
        objc_msgSend(v35, "UUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbModelID](v54, "hmbModelID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[HMBModel initWithModelID:parentModelID:](v36, "initWithModelID:parentModelID:", v37, v38);

        objc_msgSend(v35, "personManagerUUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonManagerUUID:](v39, "setPersonManagerUUID:", v40);

        objc_msgSend(v35, "personUUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonUUID:](v39, "setPersonUUID:", v41);

        objc_msgSend(v35, "personName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonName:](v39, "setPersonName:", v42);

        objc_msgSend(v35, "unassociatedFaceCropUUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setUnassociatedFaceCropUUID:](v39, "setUnassociatedFaceCropUUID:", v43);

        v44 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v53, "addObject:", v39));
        v45 = v25;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel debugDescription](v39, "debugDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v47;
          v63 = 2112;
          v64 = v48;
          _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Updating face classification model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v32);
  }

  v55.receiver = v25;
  v55.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  -[HMDCameraClipAddModelsOperation modelsToAdd](&v55, sel_modelsToAdd);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setByAddingObjectsFromSet:", v53);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (void)updateMirrorOutputModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDCameraClipAddSignificantEventOperation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding assets to significant event model for mirror output: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraClipAddSignificantEventOperation significantEvent](v12, "significantEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heroFrameData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithAssetContent:itemTypeHint:", v16, CFSTR("jpg"));
      objc_msgSend(v6, "setHeroFrameAsset:", v17);

    }
    -[HMDCameraClipAddSignificantEventOperation significantEvent](v12, "significantEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "faceCropData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithAssetContent:itemTypeHint:", v19, CFSTR("jpg"));
      objc_msgSend(v6, "setFaceCropAsset:", v20);

    }
  }

}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  -[HMDCameraClipOperation attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Significant Event"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipAddSignificantEventOperation homePresenceByPairingIdentity](self, "homePresenceByPairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Home Presence By Pairing Identity"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMDCameraRecordingSessionSignificantEvent)significantEvent
{
  return (HMDCameraRecordingSessionSignificantEvent *)objc_getProperty(self, a2, 376, 1);
}

- (NSDictionary)homePresenceByPairingIdentity
{
  return (NSDictionary *)objc_getProperty(self, a2, 384, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

+ (unint64_t)cameraClipOperationType
{
  return 3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_91110 != -1)
    dispatch_once(&logCategory__hmf_once_t4_91110, &__block_literal_global_91111);
  return (id)logCategory__hmf_once_v5_91112;
}

void __56__HMDCameraClipAddSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_91112;
  logCategory__hmf_once_v5_91112 = v0;

}

@end
