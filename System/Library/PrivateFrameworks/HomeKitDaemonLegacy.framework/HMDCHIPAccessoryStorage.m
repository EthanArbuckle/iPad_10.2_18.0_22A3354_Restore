@implementation HMDCHIPAccessoryStorage

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)updateAccessoryModel:(id)a3
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
  id v13;

  v13 = a3;
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v13, "setChipNodeID:", v4);
  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v13, "setChipVendorID:", v5);
  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v13, "setChipProductID:", v6);
  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v13, "setChipAttributeDatabase:", v7);
  -[HMDCHIPAccessoryStorage pairings](self, "pairings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v13, "setChipPairings:", v8);
  if (-[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setChipWEDSupport:", v9);

  }
  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v13, "setChipExtendedMACAddress:", v10);
  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v13, "setMatterSoftwareVersionNumber:", v11);
  -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v13, "setSupportedLinkLayerTypes:", v12);

}

- (BOOL)wedSupport
{
  return self->_wedSupport;
}

- (NSSet)pairings
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)extendedMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)attributeDatabase
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Node ID"));

  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Vendor ID"));

  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Product ID"));

  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Attribute Database"));

  -[HMDCHIPAccessoryStorage pairings](self, "pairings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Pairings"));

  -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("WED"));

  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("eMAC"));

  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("softwareVersionNumber"));

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v15;
}

- (BOOL)updateUsingAccessoryModel:(id)a3
{
  NSObject *v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDCHIPAccessoryStorage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDCHIPAccessoryStorage *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMDCHIPAccessoryStorage *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  HMDCHIPAccessoryStorage *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  HMDCHIPAccessoryStorage *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  HMDCHIPAccessoryStorage *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  HMDCHIPAccessoryStorage *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  HMDCHIPAccessoryStorage *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  HMDCHIPAccessoryStorage *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  int v101;
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "containsObject:", CFSTR("chipNodeID")))
  {

    goto LABEL_7;
  }
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipNodeID");
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage nodeID](v10, "nodeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chipNodeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 138543874;
    v102 = v11;
    v103 = 2112;
    v104 = v12;
    v105 = 2112;
    v106 = v13;
    _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@Updating storage node ID from %@ to %@", (uint8_t *)&v101, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v5, "chipNodeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setNodeID:](v10, "setNodeID:", v14);

  v15 = 1;
LABEL_8:
  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
    v3 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToNumber:](v3, "isEqualToNumber:", &unk_1E8B32AC0) & 1) == 0)
      goto LABEL_18;
  }
  objc_msgSend(v5, "setProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "containsObject:", CFSTR("chipVendorID")))
  {

    if (!v16)
      goto LABEL_20;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipVendorID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if (v16)
  {

  }
  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage vendorID](v22, "vendorID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipVendorID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v23;
      v103 = 2112;
      v104 = v24;
      v105 = 2112;
      v106 = v25;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@Updating storage vendor ID from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v5, "chipVendorID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setVendorID:](v22, "setVendorID:", v16);
    v15 = 1;
    goto LABEL_19;
  }
LABEL_20:
  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[HMDCHIPAccessoryStorage productID](self, "productID");
    v3 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToNumber:](v3, "isEqualToNumber:", &unk_1E8B32AC0) & 1) == 0)
    {
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
  }
  objc_msgSend(v5, "setProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "containsObject:", CFSTR("chipProductID")))
  {

    if (!v26)
      goto LABEL_32;
    goto LABEL_30;
  }
  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipProductID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if (v26)
  {

  }
  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage productID](v32, "productID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipProductID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v34;
      v103 = 2112;
      v104 = v35;
      v105 = 2112;
      v106 = v36;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating storage product ID from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(v5, "chipProductID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setProductID:](v32, "setProductID:", v26);
    v15 = 1;
    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(v5, "setProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "containsObject:", CFSTR("chipAttributeDatabase")))
  {
    -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chipAttributeDatabase");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HMFEqualObjects();

    if ((v40 & 1) != 0)
      goto LABEL_38;
    v41 = (void *)MEMORY[0x1D17BA0A0]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage attributeDatabase](v42, "attributeDatabase");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipAttributeDatabase");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v44;
      v103 = 2112;
      v104 = v45;
      v105 = 2112;
      v106 = v46;
      _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Updating storage attribute database from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    objc_msgSend(v5, "chipAttributeDatabase");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setAttributeDatabase:](v42, "setAttributeDatabase:", v37);
    v15 = 1;
  }

LABEL_38:
  objc_msgSend(v5, "setProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "containsObject:", CFSTR("chipPairingsData")))
  {
    -[HMDCHIPAccessoryStorage pairings](self, "pairings");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chipPairings");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = HMFEqualObjects();

    if ((v50 & 1) != 0)
      goto LABEL_44;
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage pairings](v52, "pairings");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipPairings");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v54;
      v103 = 2112;
      v104 = v55;
      v105 = 2112;
      v106 = v56;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating storage pairings from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v51);
    objc_msgSend(v5, "chipPairings");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setPairings:](v52, "setPairings:", v47);
    v15 = 1;
  }

LABEL_44:
  objc_msgSend(v5, "setProperties");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "containsObject:", CFSTR("chipWEDSupport")))
  {
    v58 = -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport");
    objc_msgSend(v5, "chipWEDSupport");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "BOOLValue");

    if (v58 == v60)
      goto LABEL_50;
    v61 = (void *)MEMORY[0x1D17BA0A0]();
    v62 = self;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage wedSupport](v62, "wedSupport");
      HMFBooleanToString();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipWEDSupport");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "BOOLValue");
      HMFBooleanToString();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v64;
      v103 = 2112;
      v104 = v65;
      v105 = 2112;
      v106 = v67;
      _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating storage WED support from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v61);
    objc_msgSend(v5, "chipWEDSupport");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setWedSupport:](v62, "setWedSupport:", objc_msgSend(v57, "BOOLValue"));
    v15 = 1;
  }

LABEL_50:
  objc_msgSend(v5, "setProperties");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "containsObject:", CFSTR("chipExtendedMACAddress")))
  {
    -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chipExtendedMACAddress");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = HMFEqualObjects();

    if ((v71 & 1) != 0)
      goto LABEL_56;
    v72 = (void *)MEMORY[0x1D17BA0A0]();
    v73 = self;
    HMFGetOSLogHandle();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage extendedMACAddress](v73, "extendedMACAddress");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipExtendedMACAddress");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v75;
      v103 = 2112;
      v104 = v76;
      v105 = 2112;
      v106 = v77;
      _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_INFO, "%{public}@Updating storage eMAC Address from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v72);
    objc_msgSend(v5, "chipExtendedMACAddress");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setExtendedMACAddress:](v73, "setExtendedMACAddress:", v68);
    v15 = 1;
  }

LABEL_56:
  objc_msgSend(v5, "setProperties");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v78, "containsObject:", CFSTR("matterSoftwareVersionNumber")))
  {
    -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matterSoftwareVersionNumber");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = HMFEqualObjects();

    if ((v81 & 1) != 0)
      goto LABEL_62;
    v82 = (void *)MEMORY[0x1D17BA0A0]();
    v83 = self;
    HMFGetOSLogHandle();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage softwareVersionNumber](v83, "softwareVersionNumber");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "matterSoftwareVersionNumber");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 138543874;
      v102 = v85;
      v103 = 2112;
      v104 = v86;
      v105 = 2112;
      v106 = v87;
      _os_log_impl(&dword_1CD062000, v84, OS_LOG_TYPE_INFO, "%{public}@Updating accessory software version number from %@ to %@", (uint8_t *)&v101, 0x20u);

    }
    objc_autoreleasePoolPop(v82);
    objc_msgSend(v5, "matterSoftwareVersionNumber");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPAccessoryStorage setSoftwareVersionNumber:](v83, "setSoftwareVersionNumber:", v78);
    v15 = 1;
  }

LABEL_62:
  objc_msgSend(v5, "setProperties");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend(v88, "containsObject:", CFSTR("supportedLinkLayerTypes"));

  if ((_DWORD)v89)
  {
    -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v89, "isEqualToNumber:", &unk_1E8B32AC0) & 1) == 0)
      {

LABEL_72:
        goto LABEL_73;
      }
    }
    -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedLinkLayerTypes");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = HMFEqualObjects();

    if (v90)
    {

    }
    if ((v93 & 1) == 0)
    {
      v94 = (void *)MEMORY[0x1D17BA0A0]();
      v95 = self;
      HMFGetOSLogHandle();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](v95, "supportedLinkLayerTypes");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "supportedLinkLayerTypes");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 138543874;
        v102 = v97;
        v103 = 2112;
        v104 = v98;
        v105 = 2112;
        v106 = v99;
        _os_log_impl(&dword_1CD062000, v96, OS_LOG_TYPE_INFO, "%{public}@Updating matter accessory supported link layer types from %@ to %@", (uint8_t *)&v101, 0x20u);

      }
      objc_autoreleasePoolPop(v94);
      objc_msgSend(v5, "supportedLinkLayerTypes");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPAccessoryStorage setSupportedLinkLayerTypes:](v95, "setSupportedLinkLayerTypes:", v90);
      v15 = 1;
      goto LABEL_72;
    }
  }
LABEL_73:

  return v15;
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
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (!v15)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if (!v18)
    goto LABEL_14;
  v19 = -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport");
  if (v19 != objc_msgSend(v6, "wedSupport"))
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedMACAddress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  if (!v22)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareVersionNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HMFEqualObjects();

  if (!v25)
    goto LABEL_14;
  -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedLinkLayerTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = HMFEqualObjects();

  if (v28)
  {
    -[HMDCHIPAccessoryStorage pairings](self, "pairings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = HMFEqualObjects();

  }
  else
  {
LABEL_14:
    v31 = 0;
  }

  return v31;
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMDCHIPAccessoryStorage pairings](self, "pairings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ objc_msgSend(v15, "hash");

  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash") ^ v14;

  -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCHIPAccessoryStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[HMDCHIPAccessoryStorage init](+[HMDCHIPAccessoryStorage allocWithZone:](HMDCHIPAccessoryStorage, "allocWithZone:", a3), "init");
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setNodeID:](v4, "setNodeID:", v5);

  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setVendorID:](v4, "setVendorID:", v6);

  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setProductID:](v4, "setProductID:", v7);

  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setAttributeDatabase:](v4, "setAttributeDatabase:", v8);

  -[HMDCHIPAccessoryStorage pairings](self, "pairings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setPairings:](v4, "setPairings:", v9);

  -[HMDCHIPAccessoryStorage setWedSupport:](v4, "setWedSupport:", -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"));
  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setExtendedMACAddress:](v4, "setExtendedMACAddress:", v10);

  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setSoftwareVersionNumber:](v4, "setSoftwareVersionNumber:", v11);

  -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setSupportedLinkLayerTypes:](v4, "setSupportedLinkLayerTypes:", v12);

  return v4;
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
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v13, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
    || objc_msgSend(v13, "hmd_isForRemoteUserAdministrator"))
  {
    -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("HMCAS.ck.nodeID"));

    -[HMDCHIPAccessoryStorage pairings](self, "pairings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("HMCAS.ck.pairings"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("HMCAS.ck.wedSupport"));

    -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("HMCAS.ck.eMAC"));

    -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("HMCAS.ck.supportedLinkLayerTypes"));

    if (objc_msgSend(v13, "hmd_isForLocalStore"))
    {
      -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("HMCAS.ck.vendorID"));

      -[HMDCHIPAccessoryStorage productID](self, "productID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("HMCAS.ck.productID"));

      -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("HMCAS.ck.attributeDatabase"));

      -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("HMCAS.softwareVersionNumber"));

    }
  }

}

- (HMDCHIPAccessoryStorage)initWithCoder:(id)a3
{
  id v4;
  HMDCHIPAccessoryStorage *v5;
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
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDCHIPAccessoryStorage init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.nodeID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setNodeID:](v5, "setNodeID:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.vendorID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setVendorID:](v5, "setVendorID:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.productID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setProductID:](v5, "setProductID:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.attributeDatabase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setAttributeDatabase:](v5, "setAttributeDatabase:", v9);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HMCAS.ck.pairings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setPairings:](v5, "setPairings:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.wedSupport"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setWedSupport:](v5, "setWedSupport:", objc_msgSend(v14, "BOOLValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.eMAC"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setExtendedMACAddress:](v5, "setExtendedMACAddress:", v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.softwareVersionNumber"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage setSoftwareVersionNumber:](v5, "setSoftwareVersionNumber:", v16);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCAS.ck.supportedLinkLayerTypes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCHIPAccessoryStorage setSupportedLinkLayerTypes:](v5, "setSupportedLinkLayerTypes:", v17);
  return v5;
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
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Node ID"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage vendorID](self, "vendorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Vendor ID"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMDCHIPAccessoryStorage productID](self, "productID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage productID](self, "productID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Product ID"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage attributeDatabase](self, "attributeDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Attribute Database"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMDCHIPAccessoryStorage pairings](self, "pairings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage pairings](self, "pairings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Pairings"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage extendedMACAddress](self, "extendedMACAddress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("eMAC"), v26);
    objc_msgSend(v3, "addObject:", v27);

  }
  v28 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport");
  HMFBooleanToString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithName:value:", CFSTR("WED"), v29);
  objc_msgSend(v3, "addObject:", v30);

  -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage softwareVersionNumber](self, "softwareVersionNumber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithName:value:", CFSTR("softwareVersionNumber"), v33);
    objc_msgSend(v3, "addObject:", v34);

  }
  -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCHIPAccessoryStorage supportedLinkLayerTypes](self, "supportedLinkLayerTypes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v36, "initWithName:value:", CFSTR("supportedLinkLayerTypes"), v37);
    objc_msgSend(v3, "addObject:", v38);

  }
  v39 = (void *)objc_msgSend(v3, "copy");

  return v39;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCHIPAccessoryStorage nodeID](self, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setNodeID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setAttributeDatabase:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setPairings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setWedSupport:(BOOL)a3
{
  self->_wedSupport = a3;
}

- (void)setExtendedMACAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)softwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSoftwareVersionNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)supportedLinkLayerTypes
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSupportedLinkLayerTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLinkLayerTypes, 0);
  objc_storeStrong((id *)&self->_softwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_extendedMACAddress, 0);
  objc_storeStrong((id *)&self->_pairings, 0);
  objc_storeStrong((id *)&self->_attributeDatabase, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10 != -1)
    dispatch_once(&logCategory__hmf_once_t10, &__block_literal_global_21095);
  return (id)logCategory__hmf_once_v11;
}

void __38__HMDCHIPAccessoryStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11;
  logCategory__hmf_once_v11 = v0;

}

@end
