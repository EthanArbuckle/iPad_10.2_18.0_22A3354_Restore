@implementation HMDResidentStatus

- (HMDResidentStatus)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4 version:(id)a5 generationID:(id)a6 assertionTime:(id)a7 preferredResidentsList:(id)a8 selectionInfo:(id)a9 connectionType:(unint64_t)a10 locationRawValue:(id)a11
{
  id v18;
  id v19;
  HMDResidentStatus *v20;
  HMDResidentStatus *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v18 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)HMDResidentStatus;
  v20 = -[HMDResidentStatus init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_idsIdentifier, a3);
    objc_storeStrong((id *)&v21->_idsDestination, a4);
    objc_storeStrong((id *)&v21->_swVersion, a5);
    objc_storeStrong((id *)&v21->_generationID, a6);
    objc_storeStrong((id *)&v21->_assertionTime, a7);
    objc_storeStrong((id *)&v21->_preferredResidentsList, a8);
    objc_storeStrong((id *)&v21->_selectionInfo, a9);
    v21->_networkConnectionType = a10;
    objc_storeStrong((id *)&v21->_locationRawValue, a11);
    v21->_location = objc_msgSend(v19, "unsignedIntegerValue");
  }

  return v21;
}

- (HMDResidentStatus)initWithChannelRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomeKitVersion *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDResidentStatus *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDResidentStatus *v24;
  void *v25;
  HMDResidentStatus *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  HMDResidentSelectionInfo *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  HMDPreferredResidentsList *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDResidentStatus *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("residentStatusSwVersionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("residentStatusGenerationIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v6);
  if (v9)
  {
    objc_msgSend(v4, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_dictionaryForKey:", CFSTR("RS.ck.prl"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v8;
    v51 = self;
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDBCF20];
      v54 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_arrayForKey:ofClasses:", CFSTR("PRL.ck.rii"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "hmf_dateForKey:", CFSTR("PRL.ck.mt"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 && v16)
      {
        objc_msgSend(v15, "na_map:", &__block_literal_global_94_97181);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[HMDPreferredResidentsList initWithResidentIDSIdentifiers:modifiedTimestamp:]([HMDPreferredResidentsList alloc], "initWithResidentIDSIdentifiers:modifiedTimestamp:", v18, v17);

      }
      else
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v48 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "payload");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v28;
          v57 = 2112;
          v58 = v29;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to create preferred residents list from invalid record %@", buf, 0x16u);

          v25 = v48;
        }

        objc_autoreleasePoolPop(v25);
        v47 = 0;
      }

    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v4, "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hmf_dateForKey:", CFSTR("RSI.ck.st"));
    v31 = objc_claimAutoreleasedReturnValue();

    v52 = v6;
    v49 = (void *)v31;
    v50 = v11;
    if (v31)
    {
      objc_msgSend(v4, "payload");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hmf_dataForKey:", CFSTR("RSI.ck.prii"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v33), "bytes"));
      else
        v34 = 0;
      v35 = -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:selectionTimestamp:]([HMDResidentSelectionInfo alloc], "initWithPreferredResidentIDSIdentifier:selectionTimestamp:", v34, v31);

    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v4, "payload");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hmf_numberForKey:", CFSTR("RS.ck.rl"));
    v37 = objc_claimAutoreleasedReturnValue();

    if (v37)
      v38 = (void *)v37;
    else
      v38 = &unk_24E96B2A0;
    objc_msgSend(v4, "payload");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "hmf_numberForKey:", CFSTR("RS.ck.nw"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");

    objc_msgSend(v4, "idsIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDestination");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertionTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v41;
    v8 = v53;
    v20 = -[HMDResidentStatus initWithIDSIdentifier:idsDestination:version:generationID:assertionTime:preferredResidentsList:selectionInfo:connectionType:locationRawValue:](v51, "initWithIDSIdentifier:idsDestination:version:generationID:assertionTime:preferredResidentsList:selectionInfo:connectionType:locationRawValue:", v42, v43, v9, v53, v44, v47, v35, v46, v38);

    v24 = v20;
    v6 = v52;
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
      objc_msgSend(v4, "payload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v22;
      v57 = 2112;
      v58 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to create resident status from invalid record %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v24 = 0;
  }

  return v24;
}

- (id)matchingDeviceFromResidentDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HMDResidentStatus idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus idsDestination](self, "idsDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceAddress addressWithIDSIdentifier:idsDestination:](HMDDeviceAddress, "addressWithIDSIdentifier:idsDestination:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMDResidentStatus_matchingDeviceFromResidentDevices___block_invoke;
  v11[3] = &unk_24E7953A8;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDResidentStatus idsIdentifier](self, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDResidentStatus idsDestination](self, "idsDestination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "idsDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDResidentStatus idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)hasChangedFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  unint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;

  v4 = a3;
  -[HMDResidentStatus idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[HMDResidentStatus idsDestination](self, "idsDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDestination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      LOBYTE(v23) = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[HMDResidentStatus swVersion](self, "swVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
      goto LABEL_11;
    v25 = v9;
    -[HMDResidentStatus generationID](self, "generationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (!v13)
      goto LABEL_12;
    -[HMDResidentStatus assertionTime](self, "assertionTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertionTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if (!v16
      || (-[HMDResidentStatus preferredResidentsList](self, "preferredResidentsList"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "preferredResidentsList"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = HMFEqualObjects(),
          v18,
          v17,
          !v19))
    {
LABEL_12:
      LOBYTE(v23) = 1;
      v9 = v25;
      goto LABEL_13;
    }
    v20 = -[HMDResidentStatus networkConnectionType](self, "networkConnectionType");
    v9 = v25;
    if (v20 == objc_msgSend(v4, "networkConnectionType"))
    {
      -[HMDResidentStatus locationRawValue](self, "locationRawValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationRawValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToNumber:", v22) ^ 1;

    }
    else
    {
LABEL_11:
      LOBYTE(v23) = 1;
    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v23) = 0;
LABEL_15:

  return v23;
}

- (BOOL)isPrimary
{
  void *v2;
  BOOL v3;

  -[HMDResidentStatus generationID](self, "generationID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentStatus idsIdentifier](self, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus idsDestination](self, "idsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus assertionTime](self, "assertionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus swVersion](self, "swVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus generationID](self, "generationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentStatus networkConnectionType](self, "networkConnectionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  StringFromHMDResidentLocation(-[HMDResidentStatus location](self, "location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentStatus preferredResidentsList](self, "preferredResidentsList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ assertionTime: %@ swVer %@ generationID %@ connectionType %@ location %@ preferredResidentsList %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (HMDHomeKitVersion)swVersion
{
  return self->_swVersion;
}

- (NSUUID)generationID
{
  return self->_generationID;
}

- (HMDPreferredResidentsList)preferredResidentsList
{
  return self->_preferredResidentsList;
}

- (unint64_t)location
{
  return self->_location;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (unint64_t)networkConnectionType
{
  return self->_networkConnectionType;
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (NSNumber)locationRawValue
{
  return self->_locationRawValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationRawValue, 0);
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_preferredResidentsList, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

uint64_t __55__HMDResidentStatus_matchingDeviceFromResidentDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDeviceEquivalentToDeviceAddress:", *(_QWORD *)(a1 + 32));
}

id __43__HMDResidentStatus_initWithChannelRecord___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");

  return (id)objc_msgSend(v4, "initWithUUIDBytes:", v6);
}

@end
