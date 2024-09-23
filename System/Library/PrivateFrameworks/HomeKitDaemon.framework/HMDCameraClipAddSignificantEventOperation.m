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
  HMDCameraClipAddSignificantEventOperation *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  HMDCameraSignificantEventFaceClassificationModel *v35;
  void *v36;
  void *v37;
  HMDCameraSignificantEventFaceClassificationModel *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCameraClipAddSignificantEventOperation *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  void *v52;
  HMDCameraSignificantEventNotificationModel *v53;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
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

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "reason"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setSignificantEvent:](v8, "setSignificantEvent:", v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "confidenceLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setConfidenceLevel:](v8, "setConfidenceLevel:", v16);

  v17 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeOffsetWithinClip");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventNotificationModel setTimeOffsetWithinClip:](v8, "setTimeOffsetWithinClip:", v19);

  v20 = objc_alloc(MEMORY[0x24BE4ECA0]);
  -[HMDCameraClipOperation clipModelID](self, "clipModelID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithModelID:action:", v21, 1);
  -[HMDCameraSignificantEventNotificationModel setAssociatedClip:](v8, "setAssociatedClip:", v22);

  v52 = v3;
  v53 = v8;
  v23 = (void *)MEMORY[0x227676638](objc_msgSend(v3, "addObject:", v8));
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel debugDescription](v8, "debugDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v26;
    v62 = 2112;
    v63 = v27;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating significant event model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[HMDCameraClipAddSignificantEventOperation significantEvent](v24, "significantEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "faceClassifications");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v29;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v56 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v35 = [HMDCameraSignificantEventFaceClassificationModel alloc];
        objc_msgSend(v34, "UUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbModelID](v53, "hmbModelID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[HMBModel initWithModelID:parentModelID:](v35, "initWithModelID:parentModelID:", v36, v37);

        objc_msgSend(v34, "personManagerUUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonManagerUUID:](v38, "setPersonManagerUUID:", v39);

        objc_msgSend(v34, "personUUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonUUID:](v38, "setPersonUUID:", v40);

        objc_msgSend(v34, "personName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setPersonName:](v38, "setPersonName:", v41);

        objc_msgSend(v34, "unassociatedFaceCropUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventFaceClassificationModel setUnassociatedFaceCropUUID:](v38, "setUnassociatedFaceCropUUID:", v42);

        v43 = (void *)MEMORY[0x227676638](objc_msgSend(v52, "addObject:", v38));
        v44 = v24;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel debugDescription](v38, "debugDescription");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v46;
          v62 = 2112;
          v63 = v47;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating face classification model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v31);
  }

  v54.receiver = v24;
  v54.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  -[HMDCameraClipAddModelsOperation modelsToAdd](&v54, sel_modelsToAdd);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setByAddingObjectsFromSet:", v52);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
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

  v25 = *MEMORY[0x24BDAC8D0];
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
    v11 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Adding assets to significant event model for mirror output: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraClipAddSignificantEventOperation significantEvent](v12, "significantEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heroFrameData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithAssetContent:itemTypeHint:", v16, CFSTR("jpg"));
      objc_msgSend(v6, "setHeroFrameAsset:", v17);

    }
    -[HMDCameraClipAddSignificantEventOperation significantEvent](v12, "significantEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "faceCropData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithAssetContent:itemTypeHint:", v19, CFSTR("jpg"));
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

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraClipAddSignificantEventOperation;
  -[HMDCameraClipOperation attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipAddSignificantEventOperation significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Significant Event"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipAddSignificantEventOperation homePresenceByPairingIdentity](self, "homePresenceByPairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Home Presence By Pairing Identity"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
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
  if (logCategory__hmf_once_t4_127852 != -1)
    dispatch_once(&logCategory__hmf_once_t4_127852, &__block_literal_global_127853);
  return (id)logCategory__hmf_once_v5_127854;
}

void __56__HMDCameraClipAddSignificantEventOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_127854;
  logCategory__hmf_once_v5_127854 = v0;

}

@end
