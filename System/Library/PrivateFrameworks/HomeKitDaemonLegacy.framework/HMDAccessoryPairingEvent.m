@implementation HMDAccessoryPairingEvent

- (HMDAccessoryPairingEvent)initWithUnpairedAccessory:(id)a3 pairedAccessory:(id)a4 hapAccessory:(id)a5 appIdentifier:(id)a6 retry:(BOOL)a7 home:(id)a8 isAddOperation:(BOOL)a9 logEventStateManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  HMDAccessoryPairingEvent *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUUID *accessoryUUID;
  void *v30;
  uint64_t v31;
  NSString *accessoryCategory;
  void *v33;
  uint64_t v34;
  NSString *accessoryServerIdentifier;
  void *v36;
  uint64_t v37;
  NSString *accessoryAddRequestIdentifier;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSString *accessoryModel;
  void *v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  uint64_t v50;
  NSString *accessoryManufacturer;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSString *v68;
  uint64_t v69;
  NSString *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSString *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSString *v78;
  id v79;
  void *v80;
  uint64_t v81;
  NSString *v82;
  void *v83;
  uint64_t v84;
  NSString *v85;
  uint64_t v86;
  NSUUID *v87;
  uint64_t v88;
  HMDAccessoryMetricVendorDetails *vendorDetailsForReporting;
  id v90;
  char isKindOfClass;
  void *v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  NSString *v103;
  uint64_t v104;
  NSString *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSString *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  NSString *v113;
  void *v114;
  uint64_t v115;
  NSString *matterSoftwareVersionString;
  void *v117;
  void *v118;
  void *v119;
  NSDate *residentConfirmationTimeStarted;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v126;
  void *v127;
  id v128;
  id obj;
  void *v130;
  id *p_logEventStateManager;
  id v132;
  id v133;
  void *v134;
  objc_super v135;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v18 = a5;
  v133 = a6;
  v19 = a8;
  v20 = v18;
  v21 = v19;
  v132 = a10;
  objc_msgSend(v21, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v135.receiver = self;
  v135.super_class = (Class)HMDAccessoryPairingEvent;
  v23 = -[HMMHomeLogEvent initWithHomeUUID:](&v135, sel_initWithHomeUUID_, v22);

  if (!v23)
    goto LABEL_66;
  objc_msgSend(v21, "homeManager");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  p_logEventStateManager = (id *)&v23->_logEventStateManager;
  objc_storeStrong((id *)&v23->_logEventStateManager, a10);
  v134 = v21;
  if (v16)
  {
    v128 = v17;
    v24 = *p_logEventStateManager;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "startProgressStateTrackerWithDate:identifier:", v25, v27);

    objc_msgSend(v16, "uuid");
    v28 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v23->_accessoryUUID;
    v23->_accessoryUUID = (NSUUID *)v28;

    objc_msgSend(v16, "category");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "categoryType");
    v31 = objc_claimAutoreleasedReturnValue();
    accessoryCategory = v23->_accessoryCategory;
    v23->_accessoryCategory = (NSString *)v31;

    objc_msgSend(v16, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    accessoryServerIdentifier = v23->_accessoryServerIdentifier;
    v23->_accessoryServerIdentifier = (NSString *)v34;

    objc_msgSend(v16, "uuid");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = objc_claimAutoreleasedReturnValue();
    accessoryAddRequestIdentifier = v23->_accessoryAddRequestIdentifier;
    v23->_accessoryAddRequestIdentifier = (NSString *)v37;

    objc_storeStrong((id *)&v23->_appIdentifier, a6);
    v23->_retry = a7;
    objc_msgSend(v16, "preferredAccessoryServer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
      v39 = v16;
    v23->_linkType = objc_msgSend(v39, "linkType");
    v23->_communicationProtocol = objc_msgSend(v40, "communicationProtocol");
    v41 = v40;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
    v43 = v42;

    if (v43)
    {
      objc_msgSend(v43, "model");
      v44 = objc_claimAutoreleasedReturnValue();
      accessoryModel = v23->_accessoryModel;
      v23->_accessoryModel = (NSString *)v44;

      if (objc_msgSend(v43, "isWacAccessory"))
      {
        objc_msgSend(v43, "hapWACAccessory");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "model");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v23->_accessoryModel;
        v23->_accessoryModel = (NSString *)v47;

        objc_msgSend(v43, "hapWACAccessory");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "manufacturer");
        v50 = objc_claimAutoreleasedReturnValue();
        accessoryManufacturer = v23->_accessoryManufacturer;
        v23->_accessoryManufacturer = (NSString *)v50;

      }
    }
    if (a9)
    {
      objc_msgSend(v16, "category");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isWiFiRouterAccessoryCategory");

      if (v53)
      {
        v23->_networkRouterAdd = 1;
        objc_msgSend(v21, "wiFiRouterAccessories");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "count");

        if (v55)
          v23->_networkRouterReplace = 1;
      }
    }
    v56 = v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v56;
    else
      v57 = 0;
    v58 = v57;

    if (v58 || objc_msgSend(v56, "linkLayerType") == 4)
      v23->_threadAccessory = 1;
    objc_msgSend(v21, "currentUser");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_userPrivilege = objc_msgSend(v59, "privilege");

    if (-[HMDAccessoryPairingEvent _isMatterAccessory](v23, "_isMatterAccessory"))
    {
      v126 = v20;
      objc_msgSend(v130, "chipDataSource");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "vendorMetadataStore");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "metadata");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "vendorID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "vendorWithID:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "productID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "productWithID:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "name");
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = v23->_accessoryManufacturer;
      v23->_accessoryManufacturer = (NSString *)v67;

      objc_msgSend(v66, "name");
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v23->_accessoryModel;
      v23->_accessoryModel = (NSString *)v69;

      v23->_currentWiFiBand = 0;
      objc_msgSend(v16, "vendorID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71 && !v64)
      {
        objc_msgSend(v16, "vendorID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "stringValue");
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = v23->_accessoryManufacturer;
        v23->_accessoryManufacturer = (NSString *)v73;

      }
      objc_msgSend(v16, "productID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v128;
      if (v75 && !v66)
      {
        objc_msgSend(v16, "productID");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "stringValue");
        v77 = objc_claimAutoreleasedReturnValue();
        v78 = v23->_accessoryModel;
        v23->_accessoryModel = (NSString *)v77;

      }
      v23->_linkType = 1;

      v20 = v126;
    }
    else
    {
      v79 = *p_logEventStateManager;
      objc_msgSend(v16, "identifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "incrementRetryCount:", v64);
      v17 = v128;
    }

  }
  if (v17)
  {
    objc_storeStrong((id *)&v23->_pairedAccessory, obj);
    objc_msgSend(v17, "category");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "categoryType");
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = v23->_accessoryCategory;
    v23->_accessoryCategory = (NSString *)v81;

    objc_msgSend(v17, "identifier");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "copy");
    v85 = v23->_accessoryServerIdentifier;
    v23->_accessoryServerIdentifier = (NSString *)v84;

    objc_msgSend(v17, "uuid");
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = v23->_accessoryUUID;
    v23->_accessoryUUID = (NSUUID *)v86;

    objc_msgSend(v17, "metricLoggingVendorDetails");
    v88 = objc_claimAutoreleasedReturnValue();
    vendorDetailsForReporting = v23->_vendorDetailsForReporting;
    v23->_vendorDetailsForReporting = (HMDAccessoryMetricVendorDetails *)v88;

    v90 = v17;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v92 = v90;
    else
      v92 = 0;
    v93 = v92;

    if ((isKindOfClass & 1) == 0)
      goto LABEL_42;
    v23->_certificationStatus = objc_msgSend(v90, "certificationStatus");
    if (v23->_linkType)
      goto LABEL_42;
    if ((objc_msgSend(v90, "hasBTLELink") & 1) != 0)
    {
      v94 = 2;
    }
    else
    {
      if (!objc_msgSend(v90, "hasIPLink"))
      {
LABEL_42:
        -[HMDAccessoryPairingEvent _updateThreadPropertiesWithPairedAccessory:](v23, "_updateThreadPropertiesWithPairedAccessory:", v93);
        v23->_accessorySupportsWoL = objc_msgSend(v93, "supportsWoL");
        v23->_communicationProtocol = objc_msgSend(v93, "communicationProtocol");
        v23->_threadAccessory = objc_msgSend(v93, "hasThreadServer");
        if (-[HMDAccessoryPairingEvent _isMatterAccessory](v23, "_isMatterAccessory"))
        {
          v127 = v20;
          objc_msgSend(v130, "chipDataSource");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "vendorMetadataStore");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "metadata");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "matterVendorID");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "vendorWithID:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v93, "matterProductID");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "productWithID:", v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v99, "name");
          v102 = objc_claimAutoreleasedReturnValue();
          v103 = v23->_accessoryManufacturer;
          v23->_accessoryManufacturer = (NSString *)v102;

          objc_msgSend(v101, "name");
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = v23->_accessoryModel;
          v23->_accessoryModel = (NSString *)v104;

          v23->_currentWiFiBand = 0;
          objc_msgSend(v93, "matterVendorID");
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          if (v106 && !v99)
          {
            objc_msgSend(v93, "matterVendorID");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "stringValue");
            v108 = objc_claimAutoreleasedReturnValue();
            v109 = v23->_accessoryManufacturer;
            v23->_accessoryManufacturer = (NSString *)v108;

          }
          objc_msgSend(v93, "matterProductID");
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          if (v110 && !v101)
          {
            objc_msgSend(v93, "matterProductID");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "stringValue");
            v112 = objc_claimAutoreleasedReturnValue();
            v113 = v23->_accessoryModel;
            v23->_accessoryModel = (NSString *)v112;

          }
          objc_msgSend(v90, "firmwareVersion");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "versionString");
          v115 = objc_claimAutoreleasedReturnValue();
          matterSoftwareVersionString = v23->_matterSoftwareVersionString;
          v23->_matterSoftwareVersionString = (NSString *)v115;

          v23->_linkType = 1;
          v20 = v127;
        }

        goto LABEL_51;
      }
      v94 = 1;
    }
    v23->_linkType = v94;
    goto LABEL_42;
  }
LABEL_51:
  if (v20 && !v23->_linkType)
    v23->_linkType = objc_msgSend(v20, "linkType");
  if (v20 && !v23->_communicationProtocol)
  {
    objc_msgSend(v20, "server");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_communicationProtocol = objc_msgSend(v117, "communicationProtocol");

  }
  v21 = v134;
  if (objc_msgSend(v134, "doesHomeContainResident"))
  {
    objc_msgSend(v134, "primaryResident");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v118;
    v23->_hasResidentInHome = 1;
    if (v118)
      LOBYTE(v118) = objc_msgSend(v118, "isReachable");
    v23->_isPrimaryResidentOnline = (char)v118;

  }
  else
  {
    v23->_hasResidentInHome = 0;
    v23->_isPrimaryResidentOnline = 0;
  }
  v23->_hmdAccessoryPairingEventResidentConfirmation = 0;
  residentConfirmationTimeStarted = v23->_residentConfirmationTimeStarted;
  v23->_residentConfirmationTimeStarted = 0;

  v23->_residentConfirmationDurationInSeconds = 0.0;
  *(_WORD *)&v23->_addOperation = a9;
  if (a9)
  {
    objc_msgSend(*p_logEventStateManager, "resetStatesForNewAddOperation");
    if (-[HMDAccessoryPairingEvent _isMatterAccessory](v23, "_isMatterAccessory"))
    {
      v121 = *p_logEventStateManager;
      objc_msgSend(v134, "workQueue");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "logEventSubmitter");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v121;
      v21 = v134;
      objc_msgSend(v124, "configureWithPairingEvent:workQueue:logEventSubmitter:", v23, v122, v123);

      v23->_matterAccessoryPairingStep = 1;
    }
  }

LABEL_66:
  return v23;
}

- (HMDAccessoryPairingEvent)initWithAccessoryDescription:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryPairingEvent *v9;
  uint64_t v10;
  HMDAccessoryPairingLogEventStateManager *logEventStateManager;
  void *v12;
  HMDAccessoryPairingLogEventStateManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *accessoryAddRequestIdentifier;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSUUID *accessoryUUID;
  uint64_t v36;
  NSString *appIdentifier;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *categoryType;
  uint64_t v44;
  NSString *productNumber;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSString *accessoryManufacturer;
  uint64_t v63;
  NSString *accessoryModel;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  NSString *v68;
  HMDAccessoryPairingLogEventStateManager *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_super v78;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78.receiver = self;
  v78.super_class = (Class)HMDAccessoryPairingEvent;
  v9 = -[HMMHomeLogEvent initWithHomeUUID:](&v78, sel_initWithHomeUUID_, v8);

  if (v9)
  {
    +[HMDAccessoryPairingLogEventStateManager sharedManager](HMDAccessoryPairingLogEventStateManager, "sharedManager");
    v10 = objc_claimAutoreleasedReturnValue();
    logEventStateManager = v9->_logEventStateManager;
    v9->_logEventStateManager = (HMDAccessoryPairingLogEventStateManager *)v10;

    objc_msgSend(v6, "addRequestIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v9->_logEventStateManager;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addRequestIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingLogEventStateManager startProgressStateTrackerWithDate:identifier:](v13, "startProgressStateTrackerWithDate:identifier:", v14, v16);

      objc_msgSend(v6, "addRequestIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = objc_claimAutoreleasedReturnValue();
      accessoryAddRequestIdentifier = v9->_accessoryAddRequestIdentifier;
      v9->_accessoryAddRequestIdentifier = (NSString *)v18;

    }
    if (objc_msgSend(v6, "supportsIP"))
    {
      v9->_linkType = 1;
    }
    else if (objc_msgSend(v6, "supportsBTLE"))
    {
      v9->_linkType = 2;
    }
    else
    {
      v9->_linkType = 0;
    }
    objc_msgSend(v6, "setupAccessoryPayload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "communicationProtocol");

    if ((unint64_t)(v21 - 1) <= 1)
      v9->_communicationProtocol = v21;
    v9->_addOperation = 1;
    objc_msgSend(v6, "ownershipToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v9->_usedOwnershipProof = 1;
    objc_msgSend(v6, "setupAccessoryPayload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "threadIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      v9->_threadAccessory = 1;
    if (objc_msgSend(v7, "doesHomeContainResident"))
    {
      objc_msgSend(v7, "primaryResident");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v9->_hasResidentInHome = 1;
      if (v25)
        LOBYTE(v25) = objc_msgSend(v25, "isReachable");
      v9->_isPrimaryResidentOnline = (char)v25;

    }
    else
    {
      v9->_hasResidentInHome = 0;
      v9->_isPrimaryResidentOnline = 0;
    }
    objc_msgSend(v6, "category");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CBA1D8];
    objc_msgSend(v6, "setupAccessoryPayload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "categoryNumber");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "categoryWithCategoryIdentifier:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v27, "isWiFiRouterAccessoryCategory") & 1) != 0
      || objc_msgSend(v31, "isWiFiRouterAccessoryCategory"))
    {
      v9->_networkRouterAdd = 1;
      objc_msgSend(v7, "wiFiRouterAccessories");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33)
        v9->_networkRouterReplace = 1;
    }
    objc_msgSend(v6, "accessoryUUID");
    v34 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v9->_accessoryUUID;
    v9->_accessoryUUID = (NSUUID *)v34;

    objc_msgSend(v6, "appIdentifier");
    v36 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v9->_appIdentifier;
    v9->_appIdentifier = (NSString *)v36;

    if (v27)
      v38 = v27;
    else
      v38 = v31;
    objc_msgSend(v38, "categoryType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_accessoryCategory, v39);

    objc_msgSend(v6, "setupAccessoryPayload");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "category");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "categoryType");
    v42 = objc_claimAutoreleasedReturnValue();
    categoryType = v9->_categoryType;
    v9->_categoryType = (NSString *)v42;

    objc_msgSend(v40, "productNumber");
    v44 = objc_claimAutoreleasedReturnValue();
    productNumber = v9->_productNumber;
    v9->_productNumber = (NSString *)v44;

    v9->_requiresMatterCustomCommissioningFlow = objc_msgSend(v40, "requiresMatterCustomCommissioningFlow");
    objc_msgSend(v7, "currentUser");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_userPrivilege = objc_msgSend(v46, "privilege");

    if (-[HMDAccessoryPairingEvent _isMatterAccessory](v9, "_isMatterAccessory"))
    {
      v75 = v31;
      v76 = v27;
      objc_msgSend(v6, "setupAccessoryPayload");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "chipAccessorySetupPayload");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "vendorID");
      v49 = v7;
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setupAccessoryPayload");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "chipAccessorySetupPayload");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "productID");
      v53 = objc_claimAutoreleasedReturnValue();

      v74 = v49;
      objc_msgSend(v49, "homeManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "chipDataSource");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "vendorMetadataStore");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "metadata");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "vendorWithID:", v50);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = (void *)v53;
      objc_msgSend(v58, "productWithID:", v53);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "name");
      v61 = objc_claimAutoreleasedReturnValue();
      accessoryManufacturer = v9->_accessoryManufacturer;
      v9->_accessoryManufacturer = (NSString *)v61;

      objc_msgSend(v60, "name");
      v63 = objc_claimAutoreleasedReturnValue();
      accessoryModel = v9->_accessoryModel;
      v9->_accessoryModel = (NSString *)v63;

      v9->_currentWiFiBand = 0;
      v77 = v50;
      if (v50 && !v58)
      {
        objc_msgSend(v50, "stringValue");
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v9->_accessoryManufacturer;
        v9->_accessoryManufacturer = (NSString *)v65;

      }
      v7 = v74;
      if (v59 && !v60)
      {
        objc_msgSend(v59, "stringValue");
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = v9->_accessoryModel;
        v9->_accessoryModel = (NSString *)v67;

      }
      v9->_linkType = 1;
      v69 = v9->_logEventStateManager;
      objc_msgSend(v74, "workQueue");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "logEventSubmitter");
      v71 = v59;
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingLogEventStateManager configureWithPairingEvent:workQueue:logEventSubmitter:](v69, "configureWithPairingEvent:workQueue:logEventSubmitter:", v9, v70, v72);

      v9->_matterAccessoryPairingStep = 1;
      v31 = v75;
      v27 = v76;
    }
    -[HMDAccessoryPairingLogEventStateManager resetStatesForNewAddOperation](v9->_logEventStateManager, "resetStatesForNewAddOperation");

  }
  return v9;
}

- (void)pairedToServer:(id)a3 certificationStatus:(int64_t)a4 addedViaWAC:(BOOL)a5 legacyWAC:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a6;
  v7 = a5;
  v20 = a3;
  if (v20)
  {
    if (!-[HMDAccessoryPairingEvent linkType](self, "linkType"))
      -[HMDAccessoryPairingEvent setLinkType:](self, "setLinkType:", objc_msgSend(v20, "linkType"));
    v10 = v20;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    if ((isKindOfClass & 1) != 0)
    {
      -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(v10, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v15);

        if (objc_msgSend(v10, "isWacAccessory"))
        {
          objc_msgSend(v10, "hapWACAccessory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "model");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v17);

          objc_msgSend(v10, "hapWACAccessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "manufacturer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v19);

        }
      }
    }

  }
  if (-[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    -[HMDAccessoryPairingEvent setCertificationStatus:](self, "setCertificationStatus:", a4);
    -[HMDAccessoryPairingEvent setAddViaWAC:](self, "setAddViaWAC:", v7);
    if (-[HMDAccessoryPairingEvent isAddViaWAC](self, "isAddViaWAC"))
      -[HMDAccessoryPairingEvent setWacLegacy:](self, "setWacLegacy:", v6);
  }

}

- (void)updateEventPropertiesWithPairedAccessory:(id)a3
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

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[HMDAccessoryPairingEvent setPairedAccessory:](self, "setPairedAccessory:", v4);
    -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v12, "manufacturer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v6);

    }
    -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v12, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v8);

    }
    -[HMDAccessoryPairingEvent accessoryCategory](self, "accessoryCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v12, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "categoryType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setAccessoryCategory:](self, "setAccessoryCategory:", v11);

    }
    -[HMDAccessoryPairingEvent _updateThreadPropertiesWithPairedAccessory:](self, "_updateThreadPropertiesWithPairedAccessory:", v12);
    v4 = v12;
  }

}

- (int)currentWiFiBand
{
  void *v2;
  int OperatingBand;

  v2 = (void *)WiFiCopyCurrentNetworkInfoEx();
  objc_msgSend(v2, "objectForKey:", CFSTR("platformNetwork"));
  OperatingBand = WiFiNetworkGetOperatingBand();

  return OperatingBand;
}

- (void)updateEventPropertiesWithHAPAccessory:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  if (-[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory"))
  {
    objc_msgSend(v31, "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(v6, "vendorNameFromDcl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v7);

      objc_msgSend(v6, "productNameFromDcl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v8);

      objc_msgSend(v6, "softwareVersionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent setMatterSoftwareVersionString:](self, "setMatterSoftwareVersionString:", v9);

      objc_msgSend(v6, "vendorID");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v6, "vendorNameFromDcl");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(v6, "vendorID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v14);

        }
      }
      objc_msgSend(v6, "productID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v6, "productNameFromDcl");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v6, "productID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v19);

        }
      }
      -[HMDAccessoryPairingEvent setThreadAccessory:](self, "setThreadAccessory:", objc_msgSend(v6, "linkLayerType") == 4);
    }

  }
  -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(v31, "manufacturer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v21);

  }
  -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v31, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent setAccessoryModel:](self, "setAccessoryModel:", v23);

  }
  -[HMDAccessoryPairingEvent accessoryCategory](self, "accessoryCategory");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24
    || (v25 = (void *)v24,
        v26 = -[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory"),
        v25,
        v26))
  {
    v27 = (void *)MEMORY[0x1E0CBA1D8];
    objc_msgSend(v31, "category");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "categoryWithCategoryIdentifier:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "categoryType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent setAccessoryCategory:](self, "setAccessoryCategory:", v30);

  }
}

- (void)_updateThreadPropertiesWithPairedAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    -[HMDAccessoryPairingEvent setThreadCapabilities:](self, "setThreadCapabilities:", objc_msgSend(v5, "threadCapabilities"));
    -[HMDAccessoryPairingEvent setThreadStatus:](self, "setThreadStatus:", objc_msgSend(v6, "threadStatus"));
  }

}

- (BOOL)isMatterAccessory
{
  return -[HMDAccessoryPairingEvent communicationProtocol](self, "communicationProtocol") == 2;
}

- (BOOL)_isMatterAccessory
{
  return self->_communicationProtocol == 2;
}

- (void)_setBtLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryPairingEvent *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[HMDWirelessLoadManager sharedInstance](HMDWirelessLoadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBtLoadData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtLoadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btLoad = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtAudioTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btAudioTask = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBtNonAudioTask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_btNonAudioTask = objc_msgSend(v7, "intValue");

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v11;
    v14 = 1024;
    v15 = -[HMDAccessoryPairingEvent btLoad](v9, "btLoad");
    v16 = 1024;
    v17 = -[HMDAccessoryPairingEvent btAudioTask](v9, "btAudioTask");
    v18 = 1024;
    v19 = -[HMDAccessoryPairingEvent btNonAudioTask](v9, "btNonAudioTask");
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Pairing BT Load: %d AudioTsk: %d NonAudioTsk: %d", (uint8_t *)&v12, 0x1Eu);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)markEndTime
{
  NSDate *v3;
  NSDate *endDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryPairingEvent;
  -[HMMLogEvent markEndTime](&v5, sel_markEndTime);
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v3;

  }
  os_unfair_lock_unlock(&self->_lock);
  -[HMDAccessoryPairingEvent _setBtLoad](self, "_setBtLoad");
}

- (NSDate)endDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)prepareForObservation
{
  HMDAccessoryMetricVendorDetails *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessoryMetricVendorDetails *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  HMDAccessoryMetricVendorDetails *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDAccessoryPairingEvent *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  HMDAccessoryPairingEvent *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  HMDAccessoryPairingEvent *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  objc_super v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)HMDAccessoryPairingEvent;
  -[HMMLogEvent prepareForObservation](&v76, sel_prepareForObservation);
  if (-[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory"))
  {
    v3 = [HMDAccessoryMetricVendorDetails alloc];
    -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent matterSoftwareVersionString](self, "matterSoftwareVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent accessoryCategory](self, "accessoryCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDAccessoryMetricVendorDetails initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:](v3, "initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:", 0, v4, v5, v6, v7, 0);
    -[HMDAccessoryPairingEvent setVendorDetailsForReporting:](self, "setVendorDetailsForReporting:", v8);
    goto LABEL_11;
  }
  +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vendorModelEntryForManufacturer:model:", v10, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v8 = (HMDAccessoryMetricVendorDetails *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firmwareVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (v4)
    {
      objc_msgSend(v4, "manufacturer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "databaseContainsManufacturer:", v15);

      -[HMDAccessoryPairingEvent accessoryManufacturer](self, "accessoryManufacturer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if ((v16 & 1) == 0)
      {
        anonymizeUnknownVendorString(v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v18;
      }
    }
  }
  if (!v8)
  {
    objc_msgSend(v4, "model");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v4, "model");
      v8 = (HMDAccessoryMetricVendorDetails *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDAccessoryPairingEvent accessoryModel](self, "accessoryModel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      anonymizeUnknownVendorString(v54);
      v8 = (HMDAccessoryMetricVendorDetails *)objc_claimAutoreleasedReturnValue();

    }
    if (v13)
      goto LABEL_10;
    goto LABEL_30;
  }
  if (!v13)
  {
LABEL_30:
    -[HMDAccessoryPairingEvent accessoryCategory](self, "accessoryCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v19 = -[HMDAccessoryMetricVendorDetails initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:]([HMDAccessoryMetricVendorDetails alloc], "initWithProductData:manufacturer:model:firmwareVersion:category:differentiationNumber:", v6, v7, v8, v12, v13, 0);
  -[HMDAccessoryPairingEvent setVendorDetailsForReporting:](self, "setVendorDetailsForReporting:", v19);

LABEL_11:
  -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent accessoryServerIdentifier](self, "accessoryServerIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent setRetryCount:](self, "setRetryCount:", objc_msgSend(v20, "retryCountForIdentifier:", v21));

  -[HMMLogEvent error](self, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "clearRetryCountMap");

  }
  -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent setPairingUIState:](self, "setPairingUIState:", objc_msgSend(v24, "pairingUIState"));

  -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent setRecoveryType:](self, "setRecoveryType:", objc_msgSend(v25, "recoveryType"));

  -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent setPreviousRecoveryType:](self, "setPreviousRecoveryType:", objc_msgSend(v26, "previousRecoveryType"));

  if (-[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMLogEvent error](self, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateStatesOnResult:", objc_msgSend(v28, "code") == 0);

  }
  if (-[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent endDate](self, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updateLastPairingProgressStateEventForIdentifier:withDate:", v32, v33);

      -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "getLastProgressStateForAccessory:", v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "getTimeDurationForProgressStateForIdentifier:state:", v38, v36);
      v40 = v39;

      if (v40 <= 0.0)
      {
        v49 = (void *)MEMORY[0x1D17BA0A0]();
        v50 = self;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](v50, "accessoryAddRequestIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v52;
          v79 = 2112;
          v80 = v53;
          _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Submitting placeholder metric values since same accessory request UUID %@ being paired multiple times before CA event submission", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v49);
        -[HMDAccessoryPairingEvent setLastAccessoryPairingState:](v50, "setLastAccessoryPairingState:", CFSTR("Undetermined due to successive pairing attempts"));
        -[HMDAccessoryPairingEvent setLongestPairingState:](v50, "setLongestPairingState:", CFSTR("Undetermined due to successive pairing attempts"));
        -[HMDAccessoryPairingEvent setLongestPairingProgressStateDurationInMilliseconds:](v50, "setLongestPairingProgressStateDurationInMilliseconds:", 0.0);
      }
      else
      {
        if (v36)
          v41 = v36;
        else
          v41 = CFSTR("Unknown");
        -[HMDAccessoryPairingEvent setLastAccessoryPairingState:](self, "setLastAccessoryPairingState:", v41);
        -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "getLongestProgressStateForAccessory:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "getLongestProgressStateForAccessory:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryPairingEvent setLongestPairingState:](self, "setLongestPairingState:", v47);

        }
        else
        {
          -[HMDAccessoryPairingEvent setLongestPairingState:](self, "setLongestPairingState:", CFSTR("Unknown"));
        }

        -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "getTimeDurationForLongestProgressStateForAccessory:", v56);
        -[HMDAccessoryPairingEvent setLongestPairingProgressStateDurationInMilliseconds:](self, "setLongestPairingProgressStateDurationInMilliseconds:");

        -[HMDAccessoryPairingEvent logEventStateManager](self, "logEventStateManager");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryPairingEvent accessoryAddRequestIdentifier](self, "accessoryAddRequestIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "clearPairingProgressStateTrackerForIdentifier:", v58);

      }
    }
  }
  if (-[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory")
    && -[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    v59 = -[HMDAccessoryPairingEvent matterAccessoryPairingStep](self, "matterAccessoryPairingStep") == 25;
    -[HMMLogEvent error](self, "error");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60 == 0;

    if (v59 != v61)
    {
      v62 = (void *)MEMORY[0x1D17BA0A0]();
      v63 = self;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMLogEvent error](v63, "error");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        HMDMatterAccessoryPairingStepAsString(-[HMDAccessoryPairingEvent matterAccessoryPairingStep](v63, "matterAccessoryPairingStep"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v78 = v65;
        v79 = 2112;
        v80 = v66;
        v81 = 2112;
        v82 = v67;
        _os_log_impl(&dword_1CD062000, v64, OS_LOG_TYPE_ERROR, "%{public}@Unexpected step and error in submitting pairing log event %@ %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v62);
    }
    -[HMMLogEvent error](self, "error");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "underlyingErrors");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "firstObject");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = (void *)MEMORY[0x1D17BA0A0]();
      v72 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMLogEvent error](v72, "error");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v74;
        v79 = 2112;
        v80 = v75;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error contains underlying error %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v71);
    }
  }
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.AccessoryPairingEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v16;
  void *v17;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  _QWORD v84[4];
  id v85;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryManufacturer"));

  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryModel"));

  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));

  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firmwareVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryFirmwareVersion"));

  -[HMDAccessoryPairingEvent vendorDetailsForReporting](self, "vendorDetailsForReporting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "productData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("accessoryProductData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessoryPairingEvent certificationStatus](self, "certificationStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("accessoryCertificationStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessoryPairingEvent communicationProtocol](self, "communicationProtocol"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("accessoryCommunicationProtocol"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessoryPairingEvent linkType](self, "linkType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("accessoryTransportType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent authMethod](self, "authMethod"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("authenticationMethod"));

  -[HMDAccessoryPairingEvent appIdentifier](self, "appIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (HMDShouldRedactBundleId(v18))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Third-party app"), CFSTR("appIdentifier"));
  }
  else
  {
    -[HMDAccessoryPairingEvent appIdentifier](self, "appIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("appIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("pairingDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isAdd"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[HMMLogEvent error](self, "error");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "code"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("errorCode"));

  -[HMMLogEvent error](self, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "domain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("errorDomain"));

  if (-[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory"))
  {
    -[HMDAccessoryPairingEvent matterAccessorySourceErrorDomain](self, "matterAccessorySourceErrorDomain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryPairingEvent mtrMetrics](self, "mtrMetrics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __56__HMDAccessoryPairingEvent_coreAnalyticsEventDictionary__block_invoke;
    v84[3] = &unk_1E89AE4A0;
    v85 = v3;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v84);

    v29 = 0;
    v30 = v85;
    goto LABEL_13;
  }
  -[HMMLogEvent error](self, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryPairingEvent getLowestError:](HMDAccessoryPairingEvent, "getLowestError:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    goto LABEL_9;
  v32 = objc_msgSend(v30, "code");
  -[HMMLogEvent error](self, "error");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 != objc_msgSend(v33, "code"))
  {

    goto LABEL_11;
  }
  objc_msgSend(v30, "domain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEvent error](self, "error");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "domain");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v34, "isEqualToString:", v36);

  if ((v37 & 1) == 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "code"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_9:
  v27 = 0;
  v29 = 0;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessoryPairingEvent retryCount](self, "retryCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("retryCount"));

LABEL_13:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("underlyingErrorCode"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("underlyingErrorDomain"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent didUseWiFiPPSK](self, "didUseWiFiPPSK"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("usedWifiPPSK"));

  if (-[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    if (-[HMDAccessoryPairingEvent isAddViaWAC](self, "isAddViaWAC"))
      v41 = -[HMDAccessoryPairingEvent isWacLegacy](self, "isWacLegacy");
    else
      v41 = 0;
    objc_msgSend(v40, "numberWithInt:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isAddedViaLegacyWAC"));

    v43 = (void *)MEMORY[0x1E0CB37E8];
    if (-[HMDAccessoryPairingEvent isAddViaWAC](self, "isAddViaWAC"))
      v44 = -[HMDAccessoryPairingEvent isWacLegacy](self, "isWacLegacy") ^ 1;
    else
      v44 = 0;
    objc_msgSend(v43, "numberWithInt:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("isAddedViaSecureWAC"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent didUseOwnershipProof](self, "didUseOwnershipProof"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("isAddedWithWACOwnershipProof"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isFirstHAPAccessoryInAnyHome](self, "isFirstHAPAccessoryInAnyHome"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("firstHAPAccessoryForUser"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isFirstHAPAccessoryInHome](self, "isFirstHAPAccessoryInHome"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("firstHAPAccessoryInHome"));

  }
  if (-[HMDAccessoryPairingEvent isNetworkRouterAdd](self, "isNetworkRouterAdd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isNetworkRouterReplace](self, "isNetworkRouterReplace"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("isNetworkRouterReplace"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isThreadAccessory](self, "isThreadAccessory"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("isThreadAccessory"));

  if (-[HMDAccessoryPairingEvent isThreadAccessory](self, "isThreadAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isBTCommissioned](self, "isBTCommissioned"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("threadOnboardIsBTCommissioned"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent threadStatus](self, "threadStatus"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("threadStatus"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent threadCapabilities](self, "threadCapabilities"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("threadCapabilities"));

    v54 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryPairingEvent threadCommissioningDuration](self, "threadCommissioningDuration");
    objc_msgSend(v54, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("threadOnboardDuration"));

    v56 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryPairingEvent threadCommissioningError](self, "threadCommissioningError");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v57, "code"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("threadCommissioningErrorCode"));

    -[HMDAccessoryPairingEvent threadCommissioningError](self, "threadCommissioningError");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "domain");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("threadCommissioningErrorDomain"));

  }
  if (-[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"))
  {
    -[HMDAccessoryPairingEvent lastAccessoryPairingState](self, "lastAccessoryPairingState");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("lastPairingState"));

    -[HMDAccessoryPairingEvent longestPairingState](self, "longestPairingState");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("longestState"));

    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryPairingEvent longestPairingProgressStateDurationInMilliseconds](self, "longestPairingProgressStateDurationInMilliseconds");
    objc_msgSend(v63, "numberWithDouble:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("longestStateDuration"));

  }
  -[HMDAccessoryPairingEvent matterMetrics](self, "matterMetrics");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    -[HMDAccessoryPairingEvent matterMetrics](self, "matterMetrics");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v66);

    -[HMDAccessoryPairingEvent setMatterMetrics:](self, "setMatterMetrics:", 0);
  }
  if (-[HMDAccessoryPairingEvent hmdAccessoryPairingEventResidentConfirmation](self, "hmdAccessoryPairingEventResidentConfirmation"))
  {
    -[HMDAccessoryPairingEvent residentConfirmationToString:](self, "residentConfirmationToString:", -[HMDAccessoryPairingEvent hmdAccessoryPairingEventResidentConfirmation](self, "hmdAccessoryPairingEventResidentConfirmation"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("HMDAccessoryPairingEventResidentConfirmationState"));

    v68 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryPairingEvent residentConfirmationDurationInSeconds](self, "residentConfirmationDurationInSeconds");
    objc_msgSend(v68, "numberWithDouble:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("HMDAccessoryPairingEventResidentConfirmationDurationInSeconds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent retry](self, "retry"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("HMDAccessoryPairingEventRetry"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent recoveryType](self, "recoveryType"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("HMDAccessoryPairingEventRecoveryType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent previousRecoveryType](self, "previousRecoveryType"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("HMDAccessoryPairingEventPreviousRecoveryType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent isPrimaryResidentOnline](self, "isPrimaryResidentOnline"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("isPrimaryResidentOnline"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessoryPairingEvent hasResidentInHome](self, "hasResidentInHome"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("hasResidentInHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDAccessoryPairingEvent btLoad](self, "btLoad"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("btLoad"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDAccessoryPairingEvent btAudioTask](self, "btAudioTask"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("btAudioTask"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDAccessoryPairingEvent btNonAudioTask](self, "btNonAudioTask"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("btNonAudioTask"));

  if (-[HMDAccessoryPairingEvent _isMatterAccessory](self, "_isMatterAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent currentWiFiBand](self, "currentWiFiBand"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("currentWiFiBand"));

    HMDMatterAccessoryPairingStepAsString(-[HMDAccessoryPairingEvent matterAccessoryPairingStep](self, "matterAccessoryPairingStep"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("currentPairingStep"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent userPrivilege](self, "userPrivilege"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = CFSTR("userPrivilege");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent pairingUIState](self, "pairingUIState"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = CFSTR("HMDAccessoryPairingEventUIState");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, v81);

  v82 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v82;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (void)updateResidentConfirmationDurationWithConfirmation:(int64_t)a3
{
  double v4;
  NSDate *residentConfirmationTimeStarted;
  id v6;

  if (self->_residentConfirmationTimeStarted)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_residentConfirmationTimeStarted);
    self->_residentConfirmationDurationInSeconds = v4;
    residentConfirmationTimeStarted = self->_residentConfirmationTimeStarted;
    self->_residentConfirmationTimeStarted = 0;

  }
}

- (id)residentConfirmationToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("HMDAccessoryPairingEventResidentConfirmationNotSet");
  else
    return off_1E89AE4E0[a3 - 1];
}

- (void)setHmdAccessoryPairingEventResidentConfirmation:(int64_t)a3
{
  NSDate *v4;
  NSDate *residentConfirmationTimeStarted;

  switch(a3)
  {
    case 3:
      if (self->_hmdAccessoryPairingEventResidentConfirmation != 2)
      {
        -[HMDAccessoryPairingEvent updateResidentConfirmationDurationWithConfirmation:](self, "updateResidentConfirmationDurationWithConfirmation:", 3);
        self->_hmdAccessoryPairingEventResidentConfirmation = 3;
      }
      break;
    case 2:
      -[HMDAccessoryPairingEvent updateResidentConfirmationDurationWithConfirmation:](self, "updateResidentConfirmationDurationWithConfirmation:");
      self->_hmdAccessoryPairingEventResidentConfirmation = 2;
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      residentConfirmationTimeStarted = self->_residentConfirmationTimeStarted;
      self->_residentConfirmationTimeStarted = v4;

      self->_hmdAccessoryPairingEventResidentConfirmation = 1;
      break;
  }
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setAccessoryServerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, a3);
}

- (NSString)accessoryAddRequestIdentifier
{
  return self->_accessoryAddRequestIdentifier;
}

- (void)setAccessoryAddRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryAddRequestIdentifier, a3);
}

- (HMDAccessory)pairedAccessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPairedAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (void)setAccessoryModel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryModel, a3);
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryManufacturer, a3);
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryCategory, a3);
}

- (NSString)primaryServiceType
{
  return self->_primaryServiceType;
}

- (void)setPrimaryServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryServiceType, a3);
}

- (HMDAccessoryMetricVendorDetails)vendorDetailsForReporting
{
  return self->_vendorDetailsForReporting;
}

- (void)setVendorDetailsForReporting:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetailsForReporting, a3);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setCommunicationProtocol:(int64_t)a3
{
  self->_communicationProtocol = a3;
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCertificationStatus:(int64_t)a3
{
  self->_certificationStatus = a3;
}

- (BOOL)isAddOperation
{
  return self->_addOperation;
}

- (BOOL)isAddViaWAC
{
  return self->_addViaWAC;
}

- (void)setAddViaWAC:(BOOL)a3
{
  self->_addViaWAC = a3;
}

- (BOOL)isWacLegacy
{
  return self->_wacLegacy;
}

- (void)setWacLegacy:(BOOL)a3
{
  self->_wacLegacy = a3;
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (void)setAuthMethod:(unint64_t)a3
{
  self->_authMethod = a3;
}

- (BOOL)didUseWiFiPPSK
{
  return self->_usedWiFiPPSK;
}

- (void)setUsedWiFiPPSK:(BOOL)a3
{
  self->_usedWiFiPPSK = a3;
}

- (BOOL)didUseOwnershipProof
{
  return self->_usedOwnershipProof;
}

- (void)setUsedOwnershipProof:(BOOL)a3
{
  self->_usedOwnershipProof = a3;
}

- (BOOL)isNetworkRouterAdd
{
  return self->_networkRouterAdd;
}

- (void)setNetworkRouterAdd:(BOOL)a3
{
  self->_networkRouterAdd = a3;
}

- (BOOL)isNetworkRouterReplace
{
  return self->_networkRouterReplace;
}

- (void)setNetworkRouterReplace:(BOOL)a3
{
  self->_networkRouterReplace = a3;
}

- (BOOL)isFirstHAPAccessoryInHome
{
  return self->_firstHAPAccessoryInHome;
}

- (void)setFirstHAPAccessoryInHome:(BOOL)a3
{
  self->_firstHAPAccessoryInHome = a3;
}

- (BOOL)isFirstHAPAccessoryInAnyHome
{
  return self->_firstHAPAccessoryInAnyHome;
}

- (void)setFirstHAPAccessoryInAnyHome:(BOOL)a3
{
  self->_firstHAPAccessoryInAnyHome = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_threadAccessory;
}

- (void)setThreadAccessory:(BOOL)a3
{
  self->_threadAccessory = a3;
}

- (BOOL)isBTCommissioned
{
  return self->_btCommissioned;
}

- (void)setBtCommissioned:(BOOL)a3
{
  self->_btCommissioned = a3;
}

- (NSError)threadCommissioningError
{
  return self->_threadCommissioningError;
}

- (void)setThreadCommissioningError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (double)threadCommissioningDuration
{
  return self->_threadCommissioningDuration;
}

- (void)setThreadCommissioningDuration:(double)a3
{
  self->_threadCommissioningDuration = a3;
}

- (unsigned)threadCapabilities
{
  return self->_threadCapabilities;
}

- (void)setThreadCapabilities:(unsigned int)a3
{
  self->_threadCapabilities = a3;
}

- (unsigned)threadStatus
{
  return self->_threadStatus;
}

- (void)setThreadStatus:(unsigned int)a3
{
  self->_threadStatus = a3;
}

- (int64_t)hmdAccessoryPairingEventResidentConfirmation
{
  return self->_hmdAccessoryPairingEventResidentConfirmation;
}

- (NSDate)residentConfirmationTimeStarted
{
  return self->_residentConfirmationTimeStarted;
}

- (double)residentConfirmationDurationInSeconds
{
  return self->_residentConfirmationDurationInSeconds;
}

- (NSString)lastAccessoryPairingState
{
  return self->_lastAccessoryPairingState;
}

- (void)setLastAccessoryPairingState:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccessoryPairingState, a3);
}

- (NSString)longestPairingState
{
  return self->_longestPairingState;
}

- (void)setLongestPairingState:(id)a3
{
  objc_storeStrong((id *)&self->_longestPairingState, a3);
}

- (double)longestPairingProgressStateDurationInMilliseconds
{
  return self->_longestPairingProgressStateDurationInMilliseconds;
}

- (void)setLongestPairingProgressStateDurationInMilliseconds:(double)a3
{
  self->_longestPairingProgressStateDurationInMilliseconds = a3;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (BOOL)requiresMatterCustomCommissioningFlow
{
  return self->_requiresMatterCustomCommissioningFlow;
}

- (NSDictionary)matterMetrics
{
  return self->_matterMetrics;
}

- (void)setMatterMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)matterSoftwareVersionString
{
  return self->_matterSoftwareVersionString;
}

- (void)setMatterSoftwareVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)isPrimaryResidentOnline
{
  return self->_isPrimaryResidentOnline;
}

- (BOOL)hasResidentInHome
{
  return self->_hasResidentInHome;
}

- (BOOL)accessorySupportsWoL
{
  return self->_accessorySupportsWoL;
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (unint64_t)pairingUIState
{
  return self->_pairingUIState;
}

- (void)setPairingUIState:(unint64_t)a3
{
  self->_pairingUIState = a3;
}

- (unint64_t)recoveryType
{
  return self->_recoveryType;
}

- (void)setRecoveryType:(unint64_t)a3
{
  self->_recoveryType = a3;
}

- (unint64_t)previousRecoveryType
{
  return self->_previousRecoveryType;
}

- (void)setPreviousRecoveryType:(unint64_t)a3
{
  self->_previousRecoveryType = a3;
}

- (HMDAccessoryPairingLogEventStateManager)logEventStateManager
{
  return self->_logEventStateManager;
}

- (unint64_t)matterAccessoryPairingStep
{
  return self->_matterAccessoryPairingStep;
}

- (void)setMatterAccessoryPairingStep:(unint64_t)a3
{
  self->_matterAccessoryPairingStep = a3;
}

- (NSString)matterAccessorySourceErrorDomain
{
  return self->_matterAccessorySourceErrorDomain;
}

- (void)setMatterAccessorySourceErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_matterAccessorySourceErrorDomain, a3);
}

- (NSDictionary)mtrMetrics
{
  return self->_mtrMetrics;
}

- (void)setMtrMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mtrMetrics, a3);
}

- (BOOL)isSubmitting
{
  return self->_submitting;
}

- (void)setSubmitting:(BOOL)a3
{
  self->_submitting = a3;
}

- (void)setCurrentWiFiBand:(int)a3
{
  self->_currentWiFiBand = a3;
}

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (NSDictionary)vendorDetailsForCoreAnalytics
{
  return self->_vendorDetailsForCoreAnalytics;
}

- (void)setVendorDetailsForCoreAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, a3);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_mtrMetrics, 0);
  objc_storeStrong((id *)&self->_matterAccessorySourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_logEventStateManager, 0);
  objc_storeStrong((id *)&self->_matterSoftwareVersionString, 0);
  objc_storeStrong((id *)&self->_matterMetrics, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_longestPairingState, 0);
  objc_storeStrong((id *)&self->_lastAccessoryPairingState, 0);
  objc_storeStrong((id *)&self->_residentConfirmationTimeStarted, 0);
  objc_storeStrong((id *)&self->_threadCommissioningError, 0);
  objc_storeStrong((id *)&self->_vendorDetailsForReporting, 0);
  objc_storeStrong((id *)&self->_primaryServiceType, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_pairedAccessory, 0);
  objc_storeStrong((id *)&self->_accessoryAddRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

void __56__HMDAccessoryPairingEvent_coreAnalyticsEventDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("mtr_%@"), a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

+ (id)pairingAccessoryWithDescription:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  HMDAccessoryPairingEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDAccessoryPairingEvent initWithAccessoryDescription:home:]([HMDAccessoryPairingEvent alloc], "initWithAccessoryDescription:home:", v6, v5);

  return v7;
}

+ (id)pairingAccessory:(id)a3 home:(id)a4 appIdentifier:(id)a5 retry:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  HMDAccessoryPairingEvent *v12;
  void *v13;
  HMDAccessoryPairingEvent *v14;
  uint64_t v16;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [HMDAccessoryPairingEvent alloc];
  +[HMDAccessoryPairingLogEventStateManager sharedManager](HMDAccessoryPairingLogEventStateManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 1;
  v14 = -[HMDAccessoryPairingEvent initWithUnpairedAccessory:pairedAccessory:hapAccessory:appIdentifier:retry:home:isAddOperation:logEventStateManager:](v12, "initWithUnpairedAccessory:pairedAccessory:hapAccessory:appIdentifier:retry:home:isAddOperation:logEventStateManager:", v11, 0, 0, v9, v6, v10, v16, v13);

  return v14;
}

+ (id)removingAccessory:(id)a3 hapAccessory:(id)a4
{
  id v5;
  id v6;
  HMDAccessoryPairingEvent *v7;
  void *v8;
  void *v9;
  HMDAccessoryPairingEvent *v10;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  v7 = [HMDAccessoryPairingEvent alloc];
  objc_msgSend(v6, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryPairingLogEventStateManager sharedManager](HMDAccessoryPairingLogEventStateManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  v10 = -[HMDAccessoryPairingEvent initWithUnpairedAccessory:pairedAccessory:hapAccessory:appIdentifier:retry:home:isAddOperation:logEventStateManager:](v7, "initWithUnpairedAccessory:pairedAccessory:hapAccessory:appIdentifier:retry:home:isAddOperation:logEventStateManager:", 0, v6, v5, 0, 0, v8, v12, v9);

  return v10;
}

+ (id)getLowestError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v7, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (!v14)
        {
          v19 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v7, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v7, "code"), 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }

        if (!v12)
          break;
        v7 = v12;
      }
      while (v10++ < 3);
      if (!v12)
        goto LABEL_17;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v12, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v12, "code"), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v12;
    }
    else
    {
LABEL_17:
      v18 = v4;
      v7 = 0;
    }
LABEL_19:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_70188 != -1)
    dispatch_once(&logCategory__hmf_once_t15_70188, &__block_literal_global_70189);
  return (id)logCategory__hmf_once_v16_70190;
}

void __39__HMDAccessoryPairingEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_70190;
  logCategory__hmf_once_v16_70190 = v0;

}

@end
