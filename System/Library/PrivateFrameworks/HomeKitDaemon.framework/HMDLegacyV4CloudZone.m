@implementation HMDLegacyV4CloudZone

- (HMDLegacyV4CloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDLegacyV4CloudZone *v11;
  HMDLegacyV4CloudZone *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSString *rootRecordName;
  HMDLegacyV4CloudZone *v19;
  SEL v20;
  id v21;
  id v22;
  unint64_t v23;
  id *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMDLegacyV4CloudZone;
  v11 = -[HMBCloudZone initWithCloudDatabase:configuration:state:](&v25, sel_initWithCloudDatabase_configuration_state_, v8, v9, v10);
  v12 = v11;
  if (!v11)
    goto LABEL_7;
  -[HMBCloudZone setDefaultDesiredKeys:](v11, "setDefaultDesiredKeys:", 0);
  v13 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v15, "rootRecordName");
    v16 = objc_claimAutoreleasedReturnValue();
    rootRecordName = v12->_rootRecordName;
    v12->_rootRecordName = (NSString *)v16;

LABEL_7:
    return v12;
  }
  v19 = (HMDLegacyV4CloudZone *)_HMFPreconditionFailure();
  return (HMDLegacyV4CloudZone *)-[HMDLegacyV4CloudZone decodeModelFromRecord:externalRecordFields:source:error:](v19, v20, v21, v22, v23, v24);
}

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDLegacyV4CloudZone *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("ObjectRecord"));

  if (v15
    && (+[HMDLegacyV4Model createWithLegacyRecord:modelContainer:error:](HMDLegacyV4Model, "createWithLegacyRecord:modelContainer:error:", v9, v13, a6), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)v16;
    -[HMBCloudZone modelContainer](self, "modelContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmbAssociateWithContainer:", v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode record %@ from legacy cloud zone.", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (a6 && !*a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)recordIDForParentModelID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HMDLegacyV4CloudZone rootRecordModelID](self, "rootRecordModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = objc_alloc(MEMORY[0x24BDB91E8]);
  if (v6)
  {
    -[HMDLegacyV4CloudZone rootRecordName](self, "rootRecordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v8, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v9, v12);

  }
  return v11;
}

- (id)recordWithExistingRecord:(id)a3 modelData:(id)a4 parentModelID:(id)a5 modelContainer:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDLegacyV4CloudZone *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDLegacyV4CloudZone *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HMDLegacyV4CloudZone *v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  HMDLegacyV4CloudZone *v55;
  NSObject *v56;
  void *v57;
  HMDLegacyV4CloudZone *v59;
  id v60;
  id v61;
  id v62;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v65 = a5;
  v13 = a6;
  v14 = v11;
  v15 = v14;
  if (!v14)
  {
    -[HMDLegacyV4CloudZone recordIDForParentModelID:](self, "recordIDForParentModelID:", v65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ObjectRecord"), v16);
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v66 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hmbDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v21;
      v74 = 2112;
      v75 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new cloud record %@ to store model.", buf, 0x16u);

      v18 = v66;
    }

    objc_autoreleasePoolPop(v18);
    v15 = v17;
  }
  objc_msgSend(v13, "modelFromData:encoding:storageLocation:error:", v12, 1, 1, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  v64 = v25;
  if (v25)
  {
    objc_msgSend(v25, "convertToHMDModelObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "debugString:", 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "debugDescription");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)MEMORY[0x227676638]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordID");
    v61 = v12;
    v32 = v23;
    v33 = v15;
    v34 = v14;
    v35 = v13;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v73 = v30;
    v74 = 2112;
    v75 = v31;
    v76 = 2112;
    v77 = v36;
    v78 = 2112;
    v79 = v67;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@V4 CLOUD SAVE: %@/%@:\n%@", buf, 0x2Au);

    v13 = v35;
    v14 = v34;
    v15 = v33;
    v23 = v32;
    v12 = v61;

  }
  objc_autoreleasePoolPop(v27);
  v69 = 0;
  objc_msgSend(v13, "encryptData:compress:error:", v12, 1, &v69);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v69;

  if (v38)
  {
    v39 = (void *)MEMORY[0x227676638]();
    v40 = v28;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = v23;
      v43 = v15;
      v44 = v14;
      v45 = v13;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v46;
      v74 = 2112;
      v75 = v38;
      _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to encrypt model field: %@", buf, 0x16u);

      v13 = v45;
      v14 = v44;
      v15 = v43;
      v23 = v42;
    }

    objc_autoreleasePoolPop(v39);
    v47 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v38);
  }
  else
  {
    v62 = v13;
    objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v37, CFSTR("k01"), 0);
    v48 = *MEMORY[0x24BE4ED58];
    v70[0] = *MEMORY[0x24BE4ED60];
    v70[1] = v48;
    v71[0] = &unk_24E96C320;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "UUIDString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v51, 1, &v68);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v68;
    if (v52)
    {
      objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v52, *MEMORY[0x24BE4ED50], 0);
      v47 = v15;
      v13 = v62;
    }
    else
    {
      v60 = v23;
      v54 = (void *)MEMORY[0x227676638]();
      v55 = v28;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = v55;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v57;
        v74 = 2112;
        v75 = v53;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Unable to create / encode cloud record metadata: %@", buf, 0x16u);

        v55 = v59;
      }

      objc_autoreleasePoolPop(v54);
      v13 = v62;
      v47 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v53);
      v23 = v60;
    }

  }
  return v47;
}

- (id)rootRecordModelID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDLegacyV4CloudZone rootRecordName](self, "rootRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1880];
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rootRecordParentModelID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithUUIDString:", v6);

  return v7;
}

- (id)tupleForRootRecordWithOutputBlockRow:(unint64_t)a3 objectIDToRecordNameMap:(id)a4
{
  HMDCloudGroupRootRecordModelObject *v5;
  void *v6;
  void *v7;
  HMDCloudGroupRootRecordModelObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  HMDLegacyV4CloudZone *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  HMDLegacyV4CloudZone *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id result;
  void *v44;
  HMDLegacyV4CloudZone *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDLegacyV4CloudZone *v49;
  NSObject *v50;
  id v51;
  void *v52;
  HMDLegacyV4CloudZone *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  HMDLegacyV4CloudZone *v58;
  void *v59;
  void *v60;
  id v61;
  id context;
  void *contexta;
  void *v65;
  id v66;
  uint64_t v67;
  HMDCloudGroupRootRecordModelObject *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint8_t buf[4];
  id v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v66 = a4;
  v5 = [HMDCloudGroupRootRecordModelObject alloc];
  -[HMDLegacyV4CloudZone rootRecordModelID](self, "rootRecordModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLegacyV4CloudZone rootRecordParentModelID](self, "rootRecordParentModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:](v5, "initWithUUID:parentUUID:", v6, v7);

  -[HMDCloudGroupRootRecordModelObject setObjectIDToRecordNameMap:](v8, "setObjectIDToRecordNameMap:", v66);
  v68 = v8;
  -[HMDBackingStoreModelObject convertToLegacyV4](v8, "convertToLegacyV4");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  -[HMBCloudZone localZone](self, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v10, "bestModelEncodingForStorageLocation:", 2);

  objc_msgSend(v9, "modelContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  objc_msgSend(v11, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v70, v67, 2, 0, &v86);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v86;

  -[HMDBackingStoreModelObject uuid](v68, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v12;
  objc_msgSend(v9, "fetchRecordRowWithModelID:returning:error:", v13, -1, &v85);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  context = v85;

  if (v14)
  {
    objc_msgSend(v14, "externalID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "externalData");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "recordRow");
    v88[3] = v17;
    objc_msgSend(MEMORY[0x24BDB91E8], "recordIDFromExternalID:error:", v15, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "hmbDescription");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "hmbDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = v21;
      v93 = 2112;
      v94 = (uint64_t)v22;
      v95 = 2112;
      v96 = v23;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@UPDATING EXISTING ROOT RECORD: %@ / %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v9, "sql");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke_19;
    v71[3] = &unk_24E78C988;
    v72 = v14;
    v74 = v67;
    v73 = v65;
    objc_msgSend(v24, "sqlTransactionWithActivity:block:", 0, v71);
    v25 = objc_claimAutoreleasedReturnValue();

    if (!v25)
    {

      v26 = v72;
LABEL_13:

      v41 = objc_alloc(MEMORY[0x24BE4EC90]);
      v42 = (void *)objc_msgSend(v41, "initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:", a3, v88[3], v70, 0, v15, v16);

      _Block_object_dispose(&v87, 8);
      return v42;
    }
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v19;
    HMFGetOSLogHandle();
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v47;
      v93 = 2112;
      v94 = v25;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unable to update record row for rootRecordModel: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    result = (id)_HMFPreconditionFailure();
  }
  else if (context)
  {
    v48 = (void *)MEMORY[0x227676638]();
    v49 = self;
    HMFGetOSLogHandle();
    v50 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreModelObject uuid](v68, "uuid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = v51;
      v93 = 2112;
      v94 = (uint64_t)v52;
      v95 = 2112;
      v96 = context;
      _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch record row for rootRecordModel (%@): %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v48);
    result = (id)_HMFPreconditionFailure();
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x24BDB91E8]);
    -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "zoneID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v27, "initWithRecordName:zoneID:", CFSTR("4B0A9686-599F-487E-B2B0-B63BF838D813"), v29);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ObjectRecord"), v69);
    v84 = 0;
    objc_msgSend(v69, "externalID:", &v84);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v84;
    v32 = v31;
    if (v30)
    {
      v83 = v31;
      objc_msgSend(v26, "externalData:", &v83);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v83;

      contexta = (void *)MEMORY[0x227676638]();
      v34 = self;
      if (v33)
      {
        HMFGetOSLogHandle();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v60 = v30;
          HMFGetLogIdentifier();
          v36 = (id)objc_claimAutoreleasedReturnValue();
          -[HMDBackingStoreModelObject uuid](v68, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "hmbDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v92 = v36;
          v93 = 2112;
          v94 = (uint64_t)v37;
          v95 = 2112;
          v96 = v38;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@CREATING NEW ROOT RECORD: %@ / %@", buf, 0x20u);

          v30 = v60;
        }

        objc_autoreleasePoolPop(contexta);
        objc_msgSend(v9, "sql");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = MEMORY[0x24BDAC760];
        v75[1] = 3221225472;
        v75[2] = __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke;
        v75[3] = &unk_24E78C960;
        v81 = &v87;
        v76 = v9;
        v15 = v30;
        v77 = v15;
        v16 = v33;
        v78 = v16;
        v79 = v70;
        v82 = v67;
        v80 = v65;
        objc_msgSend(v39, "sqlTransactionWithActivity:block:", 0, v75);
        v40 = objc_claimAutoreleasedReturnValue();

        if (!v40)
        {

          goto LABEL_13;
        }
        contexta = (void *)MEMORY[0x227676638]();
        v58 = v34;
        HMFGetOSLogHandle();
        v54 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v92 = v59;
          v93 = 2112;
          v94 = v40;
          _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create new record row for rootRecordModel: %@", buf, 0x16u);

        }
      }
      else
      {
        HMFGetOSLogHandle();
        v54 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hmbDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v92 = v56;
          v93 = 2112;
          v94 = (uint64_t)v57;
          v95 = 2112;
          v96 = v61;
          _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create externalData from %@: %@", buf, 0x20u);

        }
      }
    }
    else
    {
      contexta = (void *)MEMORY[0x227676638]();
      v53 = self;
      HMFGetOSLogHandle();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v92 = v55;
        v93 = 2112;
        v94 = (uint64_t)v69;
        v95 = 2112;
        v96 = v32;
        _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to create externalID from %@: %@", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(contexta);
    result = (id)_HMFPreconditionFailure();
  }
  __break(1u);
  return result;
}

- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDLegacyV4CloudZone *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  objc_super v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t *v39;
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v34 = a5;
  v33 = a6;
  v13 = a7;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__174281;
  v45 = __Block_byref_object_dispose__174282;
  v46 = 0;
  -[HMBCloudZone localZone](self, "localZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLegacyV4CloudZone rootRecordModelID](self, "rootRecordModelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)(v42 + 5);
  obj = (id)v42[5];
  objc_msgSend(v14, "fetchModelWithModelID:error:", v15, &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v16, obj);

  objc_msgSend(v17, "convertToHMDModelObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "objectIDToRecordNameMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v42[5];
      *(_DWORD *)buf = 138543618;
      v48 = v25;
      v49 = 2112;
      v50 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch root record model object from DB: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLegacyV4CloudZone rootRecordName](v23, "rootRecordName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLegacyV4CloudZone rootRecordModelID](v23, "rootRecordModelID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v20, v28);

  }
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke;
  v36[3] = &unk_24E78C9D8;
  v39 = &v41;
  v36[4] = self;
  v29 = v33;
  v37 = v29;
  v30 = v21;
  v38 = v30;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);
  -[HMDLegacyV4CloudZone tupleForRootRecordWithOutputBlockRow:objectIDToRecordNameMap:](self, "tupleForRootRecordWithOutputBlockRow:objectIDToRecordNameMap:", a3, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v35.receiver = self;
  v35.super_class = (Class)HMDLegacyV4CloudZone;
  -[HMBCloudZone pushGroupWithBlockRow:tuples:options:activity:completionPromise:](&v35, sel_pushGroupWithBlockRow_tuples_options_activity_completionPromise_, a3, v32, v34, v29, v13);

  _Block_object_dispose(&v41, 8);
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
  void *v19;
  HMDLegacyV4CloudZone *v21;
  SEL v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMBCloudZone modelContainer](self, "modelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v10, "hmbAssociateWithContainer:", v15);
    v16 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      objc_msgSend(v18, "encodeWithExistingRecord:cloudZone:modelContainer:error:", v11, self, v15, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      return v19;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v21 = (HMDLegacyV4CloudZone *)_HMFPreconditionFailure();
  return -[HMDLegacyV4CloudZone waitForPendingRebuild](v21, v22);
}

- (id)waitForPendingRebuild
{
  return (id)objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

- (NSSet)participants
{
  return self->_participants;
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootRecordName, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

void __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char *v17;
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
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v54;
  id v55;
  char *v56;
  void *v57;
  id v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  char *v63;
  const char *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id obj;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(v3, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(v3, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v3, "model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordIDForModel:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
LABEL_9:
    objc_msgSend(v3, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(v11, "recordName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *(void **)(a1 + 48);
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_22;
      v70[3] = &unk_24E78C9B0;
      v55 = v53;
      v71 = v55;
      objc_msgSend(v54, "na_firstKeyPassingTest:", v70);
      v56 = (char *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x227676638]();
      v58 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
      if (v56)
      {
        if (v60)
        {
          HMFGetLogIdentifier();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v61;
          v75 = 2112;
          v76 = v56;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Removing modelID %@ from lookup", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v57);
        objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v56);
      }
      else
      {
        if (v60)
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "hmbDescription");
          v63 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v62;
          v75 = 2112;
          v76 = v63;
          _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Unable to find modelID for deleted cloud record: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v57);
      }

      goto LABEL_34;
    }
    objc_msgSend(v3, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hmbModelID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x227676638]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v67 = v3;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v26);
      v66 = v26;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        v32 = "Updating";
      else
        v32 = "Adding";
      objc_msgSend(v67, "model");
      v33 = v11;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "hmbModelID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hmbDescription");
      v65 = v27;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v74 = v30;
      v75 = 2080;
      v76 = v32;
      v77 = 2112;
      v78 = v35;
      v79 = 2112;
      v80 = v36;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@%s modelIDRecordName lookup %@ -> %@", buf, 0x2Au);

      v11 = v33;
      v26 = v66;

      v27 = v65;
      v3 = v67;
    }

    objc_autoreleasePoolPop(v27);
    v37 = *(void **)(a1 + 48);
    objc_msgSend(v11, "recordName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKey:", v38, v26);

    objc_msgSend(v3, "externalID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ObjectRecord"), v11);
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v69 = *(id *)(v41 + 40);
    objc_msgSend(v40, "externalData:", &v69);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v41 + 40), v69);
    objc_msgSend(v3, "setExternalData:", v42);

    objc_msgSend(v3, "externalData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v68 = *(id *)(v44 + 40);
      objc_msgSend(v11, "externalID:", &v68);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v44 + 40), v68);
      objc_msgSend(v3, "setExternalID:", v45);

      objc_msgSend(v3, "externalID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
LABEL_32:

        goto LABEL_33;
      }
      v47 = (void *)MEMORY[0x227676638]();
      v48 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v74 = v50;
        v75 = 2112;
        v76 = v51;
        v52 = "%{public}@Unable to generate external id from CKRecordID (this will cause issues later): %@";
LABEL_30:
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, v52, buf, 0x16u);

      }
    }
    else
    {
      v47 = (void *)MEMORY[0x227676638]();
      v48 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v74 = v50;
        v75 = 2112;
        v76 = v64;
        v52 = "%{public}@Unable to generate external data from CKRecord (this will cause issues later): %@";
        goto LABEL_30;
      }
    }

    objc_autoreleasePoolPop(v47);
    goto LABEL_32;
  }
  v8 = (void *)MEMORY[0x24BDB91E8];
  objc_msgSend(v3, "externalID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v8, "recordIDFromExternalID:error:", v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);

  if (v11)
    goto LABEL_9;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDescription");
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "externalID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v74 = v15;
    v75 = 2114;
    v76 = v17;
    v77 = 2112;
    v78 = v18;
    v79 = 2112;
    v80 = v19;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to decode encoded record ID %@: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
LABEL_35:

}

uint64_t __88__HMDLegacyV4CloudZone_pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
}

id __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = v5;
  objc_msgSend(*(id *)(a1 + 56), "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "hmbParentModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "hmbType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "modelContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "schemaHashForModel:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v14 = objc_msgSend(v4, "_insertRecordWithZoneRow:externalID:externalData:modelID:parentModelID:modelType:modelEncoding:modelData:modelSchema:pushEncoding:pushData:pushBlockRow:error:", v18, v17, v6, v7, v8, v9, v10, v11, v13, 0, 0, 0, &v19);

  v15 = v19;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v14;

  return v15;
}

id __85__HMDLegacyV4CloudZone_tupleForRootRecordWithOutputBlockRow_objectIDToRecordNameMap___block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "recordRow");
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "modelSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "_updateRecordWithRow:modelEncoding:modelData:modelSchema:error:", v5, v6, v7, v8, &v11);

  v9 = v11;
  return v9;
}

@end
