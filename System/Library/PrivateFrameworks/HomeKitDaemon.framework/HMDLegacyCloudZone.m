@implementation HMDLegacyCloudZone

- (HMDLegacyCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  HMDLegacyCloudZone *v5;
  HMDLegacyCloudZone *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDLegacyCloudZone;
  v5 = -[HMBCloudZone initWithCloudDatabase:configuration:state:](&v8, sel_initWithCloudDatabase_configuration_state_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[HMBCloudZone setDefaultDesiredKeys:](v5, "setDefaultDesiredKeys:", 0);
  return v6;
}

- (void)startUpWithLocalZone:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDLegacyCloudZone;
  -[HMBCloudZone startUpWithLocalZone:](&v3, sel_startUpWithLocalZone_, a3);
}

- (id)waitForPendingRebuild
{
  return (id)objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  __objc2_class **v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  HMDLegacyCloudZone *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[HMBCloudZone modelContainer](self, "modelContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    _HMFPreconditionFailure();
  objc_msgSend(v9, "recordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("HomeDataBlob"));

  if ((v15 & 1) != 0)
  {
    v16 = off_24E762678;
  }
  else
  {
    objc_msgSend(v9, "recordType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("MetadataBlob"));

    if ((v18 & 1) != 0)
    {
      v16 = off_24E762670;
    }
    else
    {
      objc_msgSend(v9, "recordType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("HomeDataBlobV3"));

      if (!v20)
        goto LABEL_13;
      v16 = off_24E762680;
    }
  }
  -[__objc2_class createWithLegacyRecord:modelContainer:error:](*v16, "createWithLegacyRecord:modelContainer:error:", v9, v13, a6);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[HMBCloudZone modelContainer](self, "modelContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hmbAssociateWithContainer:", v23);

    goto LABEL_19;
  }
LABEL_13:
  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v27;
    v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode record %@ from legacy cloud zone.", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  if (a6 && !*a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  HMDLegacyCloudZone *v22;
  SEL v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  -[HMBCloudZone modelContainer](self, "modelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (!v15)
  {
    _HMFPreconditionFailure();
LABEL_14:
    v22 = (HMDLegacyCloudZone *)_HMFPreconditionFailure();
    return -[HMDLegacyCloudZone participants](v22, v23);
  }
  objc_msgSend(v10, "hmbAssociateWithContainer:", v15);
  v16 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (!v18)
    goto LABEL_14;
  if (a6)
    v19 = a6;
  else
    v19 = (id *)&v24;
  objc_msgSend(v18, "encodeWithExistingRecord:cloudZone:modelContainer:error:", v11, self, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSSet)participants
{
  return self->_participants;
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
