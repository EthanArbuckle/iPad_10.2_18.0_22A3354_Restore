@implementation HMDCHIPHomeStorage

- (NSDictionary)debugDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Fabric ID"));

  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Last Node ID"));

  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Root Certificate"));

  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Operational Certificate"));

  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Intermediate Certificate"));

  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Key-Value Store"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (BOOL)updateUsingHomeModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDCHIPHomeStorage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDCHIPHomeStorage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMDCHIPHomeStorage *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  HMDCHIPHomeStorage *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  HMDCHIPHomeStorage *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  HMDCHIPHomeStorage *v62;
  NSObject *v63;
  void *v64;
  int v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", CFSTR("chipFabricID")))
  {

    goto LABEL_7;
  }
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chipFabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage fabricID](v10, "fabricID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chipFabricID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 138543874;
    v67 = v12;
    v68 = 2112;
    v69 = v13;
    v70 = 2112;
    v71 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating storage fabric ID from %@ to %@", (uint8_t *)&v66, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v4, "chipFabricID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setFabricID:](v10, "setFabricID:", v15);

  v16 = 1;
LABEL_8:
  objc_msgSend(v4, "setProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "containsObject:", CFSTR("chipLastNodeID")))
  {
    -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chipLastNodeID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if ((v20 & 1) != 0)
      goto LABEL_14;
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPHomeStorage lastNodeID](v22, "lastNodeID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chipLastNodeID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543874;
      v67 = v24;
      v68 = 2112;
      v69 = v25;
      v70 = 2112;
      v71 = v26;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating storage last node ID from %@ to %@", (uint8_t *)&v66, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v4, "chipLastNodeID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage setLastNodeID:](v22, "setLastNodeID:", v17);
    v16 = 1;
  }

LABEL_14:
  objc_msgSend(v4, "setProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "containsObject:", CFSTR("chipRootCertificate")))
  {
    -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chipRootCertificate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = HMFEqualObjects();

    if ((v30 & 1) != 0)
      goto LABEL_20;
    v31 = (void *)MEMORY[0x227676638]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPHomeStorage rootCertificate](v32, "rootCertificate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chipRootCertificate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543874;
      v67 = v34;
      v68 = 2112;
      v69 = v35;
      v70 = 2112;
      v71 = v36;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating storage root certificate from %@ to %@", (uint8_t *)&v66, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(v4, "chipRootCertificate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage setRootCertificate:](v32, "setRootCertificate:", v27);
    v16 = 1;
  }

LABEL_20:
  objc_msgSend(v4, "setProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "containsObject:", CFSTR("chipOperationalCertificate")))
  {
    -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chipOperationalCertificate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HMFEqualObjects();

    if ((v40 & 1) != 0)
      goto LABEL_26;
    v41 = (void *)MEMORY[0x227676638]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPHomeStorage operationalCertificate](v42, "operationalCertificate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chipOperationalCertificate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543874;
      v67 = v44;
      v68 = 2112;
      v69 = v45;
      v70 = 2112;
      v71 = v46;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Updating storage operational certificate from %@ to %@", (uint8_t *)&v66, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    objc_msgSend(v4, "chipOperationalCertificate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage setOperationalCertificate:](v42, "setOperationalCertificate:", v37);
    v16 = 1;
  }

LABEL_26:
  objc_msgSend(v4, "setProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "containsObject:", CFSTR("chipIntermediateCertificate")))
  {
    -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chipIntermediateCertificate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = HMFEqualObjects();

    if ((v50 & 1) != 0)
      goto LABEL_32;
    v51 = (void *)MEMORY[0x227676638]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPHomeStorage intermediateCertificate](v52, "intermediateCertificate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chipIntermediateCertificate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543874;
      v67 = v54;
      v68 = 2112;
      v69 = v55;
      v70 = 2112;
      v71 = v56;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating storage intermediate certificate from %@ to %@", (uint8_t *)&v66, 0x20u);

    }
    objc_autoreleasePoolPop(v51);
    objc_msgSend(v4, "chipIntermediateCertificate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage setIntermediateCertificate:](v52, "setIntermediateCertificate:", v47);
    v16 = 1;
  }

LABEL_32:
  objc_msgSend(v4, "setProperties");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v57, "containsObject:", CFSTR("chipKeyValueStore")))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chipKeyValueStore");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = HMFEqualObjects();

  if ((v60 & 1) == 0)
  {
    v61 = (void *)MEMORY[0x227676638]();
    v62 = self;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 138543362;
      v67 = v64;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating storage key-value store", (uint8_t *)&v66, 0xCu);

    }
    objc_autoreleasePoolPop(v61);
    objc_msgSend(v4, "chipKeyValueStore");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPHomeStorage setKeyValueStore:](v62, "setKeyValueStore:", v57);
    v16 = 1;
    goto LABEL_37;
  }
LABEL_38:

  return v16;
}

- (void)updateHomeModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v11, "setChipFabricID:", v4);
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v11, "setChipFabricIndex:", v5);
  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v11, "setChipLastNodeID:", v6);
  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v11, "setChipRootCertificate:", v7);
  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v11, "setChipOperationalCertificate:", v8);
  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v11, "setChipIntermediateCertificate:", v9);
  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v11, "setChipKeyValueStore:", v10);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  char v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_11;
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_11;
  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastNodeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_11;
  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootCertificate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (!v15)
    goto LABEL_11;
  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationalCertificate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if (!v18)
    goto LABEL_11;
  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intermediateCertificate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = HMFEqualObjects();

  if (v21)
  {
    -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyValueStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

  }
  else
  {
LABEL_11:
    v24 = 0;
  }

  return v24;
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCHIPHomeStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[HMDCHIPHomeStorage init](+[HMDCHIPHomeStorage allocWithZone:](HMDCHIPHomeStorage, "allocWithZone:", a3), "init");
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setFabricID:](v4, "setFabricID:", v5);

  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setLastNodeID:](v4, "setLastNodeID:", v6);

  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setRootCertificate:](v4, "setRootCertificate:", v7);

  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setOperationalCertificate:](v4, "setOperationalCertificate:", v8);

  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setIntermediateCertificate:](v4, "setIntermediateCertificate:", v9);

  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setKeyValueStore:](v4, "setKeyValueStore:", v10);

  return v4;
}

- (HMDCHIPHomeStorage)initWithCoder:(id)a3
{
  id v4;
  HMDCHIPHomeStorage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDCHIPHomeStorage init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCFS.fabricID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setFabricID:](v5, "setFabricID:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCFS.lastNodeID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setLastNodeID:](v5, "setLastNodeID:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCFS.rootCertificate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setRootCertificate:](v5, "setRootCertificate:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCFS.operationalCertificate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setOperationalCertificate:](v5, "setOperationalCertificate:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCFS.intermediateCertificate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage setIntermediateCertificate:](v5, "setIntermediateCertificate:", v10);

  v11 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HMCFS.keyValueStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCHIPHomeStorage setKeyValueStore:](v5, "setKeyValueStore:", v14);
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
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v11, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDCHIPHomeStorage fabricID](self, "fabricID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("HMCFS.fabricID"));

    -[HMDCHIPHomeStorage fabricID](self, "fabricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("HMCFS.fabricIndex"));

    -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("HMCFS.lastNodeID"));

    -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("HMCFS.rootCertificate"));

    -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("HMCFS.operationalCertificate"));

    -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("HMCFS.keyValueStore"));

    if (objc_msgSend(v11, "hmd_isForLocalStore"))
    {
      -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("HMCFS.intermediateCertificate"));

    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
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
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPHomeStorage fabricID](self, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCHIPHomeStorage fabricID](self, "fabricID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Fabric ID"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCHIPHomeStorage lastNodeID](self, "lastNodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Last Node ID"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCHIPHomeStorage rootCertificate](self, "rootCertificate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Root Certificate"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCHIPHomeStorage operationalCertificate](self, "operationalCertificate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Operational Certificate"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCHIPHomeStorage intermediateCertificate](self, "intermediateCertificate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Intermediate Certificate"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x24BE3F140]);
    v27 = (void *)MEMORY[0x24BDD16E0];
    -[HMDCHIPHomeStorage keyValueStore](self, "keyValueStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("Key-Value Store Count"), v29);
    objc_msgSend(v3, "addObject:", v30);

  }
  v31 = (void *)objc_msgSend(v3, "copy");

  return v31;
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFabricID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)lastNodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastNodeID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)rootCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootCertificate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)operationalCertificate
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationalCertificate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)intermediateCertificate
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntermediateCertificate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDictionary)keyValueStore
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeyValueStore:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_lastNodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_71719 != -1)
    dispatch_once(&logCategory__hmf_once_t7_71719, &__block_literal_global_71720);
  return (id)logCategory__hmf_once_v8_71721;
}

void __33__HMDCHIPHomeStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_71721;
  logCategory__hmf_once_v8_71721 = v0;

}

@end
