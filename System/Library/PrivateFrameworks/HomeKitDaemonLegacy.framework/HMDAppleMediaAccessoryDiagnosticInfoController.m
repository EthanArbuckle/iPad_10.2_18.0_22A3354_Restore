@implementation HMDAppleMediaAccessoryDiagnosticInfoController

- (HMDAppleMediaAccessoryDiagnosticInfoController)initWithDataSource:(id)a3 isHH2Mode:(BOOL)a4
{
  id v6;
  HMDAppleMediaAccessoryDiagnosticInfoController *v7;
  HMDAppleMediaAccessoryDiagnosticInfoController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAppleMediaAccessoryDiagnosticInfoController;
  v7 = -[HMDAppleMediaAccessoryDiagnosticInfoController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_isHH2Mode = a4;
    objc_storeWeak((id *)&v7->_dataSource, v6);
  }

  return v8;
}

- (id)_diagnosticInfoWithAdditionalKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
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
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;

  v4 = a3;
  -[HMDAppleMediaAccessoryDiagnosticInfoController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CBA208]);
  objc_msgSend(v6, "setVersion:", 11);
  if (-[HMDAppleMediaAccessoryDiagnosticInfoController isHH2Mode](self, "isHH2Mode"))
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v6, "setHomeHubVersion:", v7);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v6, "setGenerationTime:");
  if (v5)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CBA1F0]);
    objc_msgSend(v6, "setAppleMediaAccessoryDiagnosticInfo:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CBA1F8]);
    objc_msgSend(v10, "setCloudState:", 0);
    if (objc_msgSend(v5, "isSignedIntoiCloud"))
      objc_msgSend(v10, "setCloudState:", 1);
    objc_msgSend(v10, "setOctagonState:", 0);
    if (objc_msgSend(v5, "hasManatee"))
      objc_msgSend(v10, "setOctagonState:", 1);
    objc_msgSend(v10, "setFirstCloudImportComplete:", objc_msgSend(v5, "isFirstCloudImportComplete"));
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v10;
    objc_msgSend(v11, "setCloudInfo:", v10);

    objc_msgSend(v5, "networkInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWifiInfo:", v12);

    }
    v129 = v8;
    objc_msgSend(v6, "setNumHomes:", objc_msgSend(v5, "numHomes"));
    objc_msgSend(v5, "currentDeviceMediaRouteIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMediaRouteIdString:", v14);

    objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serialNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSerialNumber:", v17);

    objc_msgSend(v16, "modelIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setModelIdentifier:", v19);

    objc_msgSend(v16, "softwareVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "versionString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSoftwareVersion:", v22);

    v122 = v16;
    objc_msgSend(v16, "regionInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRegionInfo:", v24);

    if (objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CB8EE8]))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCurrentAccessorySetupMetricDispatcher readLastAccessorySetupInfo:](HMDCurrentAccessorySetupMetricDispatcher, "readLastAccessorySetupInfo:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v6, "setLastSetupInfo:", v27);
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDCurrentAccessorySetupMetricDispatcher removeLastAccessorySetupInfoFromUserDefaults:](HMDCurrentAccessorySetupMetricDispatcher, "removeLastAccessorySetupInfoFromUserDefaults:", v28);

      }
    }
    v127 = v4;
    objc_msgSend(v5, "obtainNetworkInfoProto");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NetworkInfo"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = (void *)MEMORY[0x1E0C9AA60];
    if (v30)
      v33 = (void *)v30;
    else
      v33 = (void *)MEMORY[0x1E0C9AA60];
    v130 = v33;

    v123 = v29;
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NetworkServiceInfo"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = (void *)v34;
    else
      v36 = v32;
    v37 = v36;

    objc_msgSend(v5, "networkVisibleDevices");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38)
      v40 = (void *)v38;
    else
      v40 = v32;
    v41 = v40;

    objc_msgSend(v5, "nearbyVisibleDevices");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if (v42)
      v44 = (void *)v42;
    else
      v44 = v32;
    v45 = v44;

    objc_msgSend(v5, "currentAccessory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "home");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v46;
    if (v46)
    {
      v124 = v12;
      objc_msgSend(v46, "manufacturer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setManufacturer:", v47);

      v49 = objc_alloc_init(MEMORY[0x1E0CBA200]);
      objc_msgSend(v46, "uuid");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "UUIDString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setUuidString:", v51);

      objc_msgSend(v46, "pairingIdentity");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "publicPairingIdentity");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "protoPayload");
      v54 = v46;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPublicPairingIdentity:", v55);

      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v49;
      objc_msgSend(v56, "setCurrentAccessoryInfo:", v49);

      objc_msgSend(v5, "eventRouterServerDiagnosticInfo");
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = (void *)v57;
      objc_msgSend(v58, "setEventRouterServerInfo:", v57);

      v8 = v129;
      objc_msgSend(v129, "timeIntervalSince1970");
      v60 = v59;
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setGenerationTime:", v60);

      objc_msgSend(v54, "lastSentSoftwareUpdateDescriptor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "protoPayload");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setSoftwareUpdateDescriptor:", v63);

      objc_msgSend(v54, "lastSentSoftwareUpdateProgress");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "protoPayload");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setSoftwareUpdateProgress:", v66);

      objc_msgSend(v54, "manufacturer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setManufacturer:", v68);

      if (v131)
      {
        objc_msgSend(v131, "appleMediaAccessories");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "count");
        objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setNumAppleMediaAccessories:", v71);

        objc_msgSend(v131, "residentDeviceManager");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "residentDevices");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "count");
        objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
        v76 = v45;
        v77 = v41;
        v78 = v37;
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setNumResidents:", v75);

        objc_msgSend(v131, "residentDeviceManager");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "confirmedPrimaryResidentDevice");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
          v82 = 2;
        else
          v82 = 1;
        objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setPrimaryResidentStatus:", v82);

        v37 = v78;
        v41 = v77;
        v45 = v76;
      }

      v12 = v124;
    }
    else
    {
      v128 = 0;
      v8 = v129;
    }
    v84 = objc_msgSend(v5, "currentDeviceRawProblemFlags");
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setSfProblemFlags:", v84);

    v86 = (void *)objc_msgSend(v130, "mutableCopy");
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setNetworkInfos:", v86);

    v125 = v37;
    v88 = (void *)objc_msgSend(v37, "mutableCopy");
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setNetworkServiceInfos:", v88);

    objc_msgSend(v5, "currentDeviceIDSIdentifier");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_alloc_init(MEMORY[0x1E0CBA210]);
    objc_msgSend(v91, "setIdsState:", 0);
    if (v90)
    {
      objc_msgSend(v90, "UUIDString");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setIdsIdentifierString:", v92);

      objc_msgSend(v91, "setIdsState:", 1);
    }
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setIdsInfo:", v91);

    v94 = (void *)objc_msgSend(v41, "mutableCopy");
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setNetworkVisibleDeviceInfos:", v94);

    v96 = (void *)objc_msgSend(v45, "mutableCopy");
    objc_msgSend(v6, "appleMediaAccessoryDiagnosticInfo");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setNearbyVisibleDeviceInfos:", v96);

    if (objc_msgSend(v5, "isCurrentDevicePrimaryResident"))
    {
      v98 = objc_alloc_init(MEMORY[0x1E0CBA218]);
      objc_msgSend(v6, "setPrimaryResidentDiagnosticInfo:", v98);

      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setWifiInfo:", v12);

      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setEventRouterServerInfo:", v128);

      v101 = (void *)objc_msgSend(v130, "mutableCopy");
      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setNetworkInfos:", v101);

      v103 = (void *)objc_msgSend(v41, "mutableCopy");
      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setNetworkVisibleDeviceInfos:", v103);

      v105 = (void *)objc_msgSend(v41, "mutableCopy");
      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setNetworkVisibleDeviceInfos:", v105);

      objc_msgSend(v131, "appleMediaAccessories");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v107, "count");
      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v120 = v5;
      v109 = v90;
      v110 = v45;
      v111 = v12;
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setNumAppleMediaAccessories:", v108);

      objc_msgSend(v131, "residentDeviceManager");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "residentDevices");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "count");
      objc_msgSend(v6, "primaryResidentDiagnosticInfo");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v115;
      v12 = v111;
      v45 = v110;
      v90 = v109;
      v5 = v120;
      objc_msgSend(v116, "setNumResidents:", v117);

      v8 = v129;
    }

    v4 = v127;
  }

  return v6;
}

- (id)diagnosticInfoDataWithAdditionalKeys:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAppleMediaAccessoryDiagnosticInfoController _diagnosticInfoWithAdditionalKeys:](self, "_diagnosticInfoWithAdditionalKeys:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isHH2Mode
{
  return self->_isHH2Mode;
}

- (HMDAppleMediaAccessoryDiagnosticInfoControllerDataSource)dataSource
{
  return (HMDAppleMediaAccessoryDiagnosticInfoControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)diagnosticInfoDescriptionWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
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
  const __CFString *v17;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
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
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t k;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  __CFString *v160;
  uint64_t v161;
  __CFString *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v197;
  id v198;
  id v199;
  id v200;
  id obj;
  id obja;
  id objb;
  id objc;
  void *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA208]), "initWithData:", v3);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("version"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "homeHubVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("homehubversion"));

    if (objc_msgSend(v4, "hasNumHomes"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "numHomes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("homes.num"));

    }
    if (objc_msgSend(v4, "hasAppleMediaAccessoryDiagnosticInfo"))
    {
      v197 = v4;
      v198 = v3;
      objc_msgSend(v4, "appleMediaAccessoryDiagnosticInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasCloudInfo"))
      {
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "cloudInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "cloudState"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("cloud.state"));

        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "cloudInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "octagonState"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("cloud.octagonstate"));

        objc_msgSend(v9, "cloudInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "firstCloudImportComplete"))
          v17 = CFSTR("true");
        else
          v17 = CFSTR("false");
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("cloud.firstImportComplete"));

      }
      if (objc_msgSend(v9, "hasWifiInfo"))
      {
        objc_msgSend(v9, "wifiInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "networkSSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("wifi.netssid"));

        objc_msgSend(v9, "wifiInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "networkBSSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("wifi.netbssid"));

        objc_msgSend(v9, "wifiInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "networkGatewayIPAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("wifi.netgateway"));

        objc_msgSend(v9, "wifiInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "macAddress");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("wifi.macAddress"));

        objc_msgSend(v9, "wifiInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "networkGatewayMacAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("wifi.gatewayMacAddress"));

        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "wifiInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberWithInt:", objc_msgSend(v29, "networkRSSI"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("wifi.netrssi"));

      }
      objc_msgSend(v9, "currentAccessoryInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v9, "currentAccessoryInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "uuidString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("accessory.uuid"));

        objc_msgSend(v9, "currentAccessoryInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "publicPairingIdentity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("accessory.pairingIdentity"));

      }
      objc_msgSend(v9, "mediaRouteIdString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("accessory.mediaRouteID"));

      objc_msgSend(v9, "idsInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v9, "idsInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "idsIdentifierString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("ids.identifier"));

        v41 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "idsInfo");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "idsState"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("ids.state"));

      }
      if (objc_msgSend(v9, "hasManufacturer"))
      {
        objc_msgSend(v9, "manufacturer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("dev.manufacturer"));

      }
      if (objc_msgSend(v9, "hasSerialNumber"))
      {
        objc_msgSend(v9, "serialNumber");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("dev.serialNumber"));

      }
      if (objc_msgSend(v9, "hasModelIdentifier"))
      {
        objc_msgSend(v9, "modelIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("dev.model"));

      }
      if (objc_msgSend(v9, "hasRegionInfo"))
      {
        objc_msgSend(v9, "regionInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("dev.region"));

      }
      if (objc_msgSend(v9, "hasSoftwareVersion"))
      {
        objc_msgSend(v9, "softwareVersion");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("dev.software.version"));

      }
      if (objc_msgSend(v9, "hasSoftwareUpdateDescriptor"))
      {
        v49 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "softwareUpdateDescriptor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "numberWithLongLong:", objc_msgSend(v50, "status"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("dev.softwareUpdate.descriptor.status"));

      }
      if (objc_msgSend(v9, "hasSoftwareUpdateProgress"))
      {
        v52 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "softwareUpdateProgress");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "percentageComplete");
        objc_msgSend(v52, "numberWithFloat:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("dev.softwareUpdate.progress.percentageComplete"));

      }
      if (objc_msgSend(v9, "hasSfProblemFlags"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "sfProblemFlags"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("dev.sfProblemFlags"));

      }
      v224 = 0u;
      v225 = 0u;
      v222 = 0u;
      v223 = 0u;
      objc_msgSend(v9, "networkVisibleDeviceInfos");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v222, v230, 16);
      if (v56)
      {
        v57 = v56;
        v58 = 0;
        v59 = *(_QWORD *)v223;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v223 != v59)
              objc_enumerationMutation(obj);
            v61 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * i);
            objc_msgSend(v61, "idsIdentifierString");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              v63 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58 + i);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "stringWithFormat:", CFSTR("dev.networkVisibleDevice.%@.%@"), v64, CFSTR("ids"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v61, "idsIdentifierString");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v66, v65);

            }
            objc_msgSend(v61, "mediaRouteIdString");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v67)
            {
              v68 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58 + i);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "stringWithFormat:", CFSTR("dev.networkVisibleDevice.%@.%@"), v69, CFSTR("mediaRouteID"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v61, "mediaRouteIdString");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v71, v70);

            }
          }
          v58 += i;
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v222, v230, 16);
        }
        while (v57);
      }

      v220 = 0u;
      v221 = 0u;
      v218 = 0u;
      v219 = 0u;
      objc_msgSend(v9, "networkVisibleDeviceInfos");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v218, v229, 16);
      if (v72)
      {
        v73 = v72;
        v74 = 0;
        v75 = *(_QWORD *)v219;
        do
        {
          for (j = 0; j != v73; ++j)
          {
            if (*(_QWORD *)v219 != v75)
              objc_enumerationMutation(obja);
            v77 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * j);
            objc_msgSend(v77, "idsIdentifierString");
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            if (v78)
            {
              v79 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74 + j);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "stringWithFormat:", CFSTR("dev.nearbyVisibleDevice.%@.%@"), v80, CFSTR("ids"));
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v77, "idsIdentifierString");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v82, v81);

            }
            objc_msgSend(v77, "mediaRouteIdString");
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            if (v83)
            {
              v84 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74 + j);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "stringWithFormat:", CFSTR("dev.nearbyVisibleDevice.%@.%@"), v85, CFSTR("mediaRouteID"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v77, "mediaRouteIdString");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v87, v86);

            }
          }
          v74 += j;
          v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v218, v229, 16);
        }
        while (v73);
      }

      v216 = 0u;
      v217 = 0u;
      v214 = 0u;
      v215 = 0u;
      objc_msgSend(v9, "networkInfos");
      objb = (id)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v214, v228, 16);
      if (v88)
      {
        v89 = v88;
        v90 = *(_QWORD *)v215;
        do
        {
          v91 = 0;
          v199 = (id)v89;
          do
          {
            if (*(_QWORD *)v215 != v90)
              objc_enumerationMutation(objb);
            v92 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * v91);
            objc_msgSend(v92, "ifaceName");
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            if (v93)
            {
              objc_msgSend(v92, "ifaceName");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("name"));
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v94, v95);
              objc_msgSend(v92, "macAddress");
              v96 = (void *)objc_claimAutoreleasedReturnValue();

              if (v96)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("mac"));
                v97 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v92, "macAddress");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v98, v97);

                v95 = (void *)v97;
              }
              objc_msgSend(v92, "ipv4Addresses");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v99, "count");

              if (v100)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("ipv4"));
                v101 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v92, "ipv4Addresses");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v102, v101);

                v95 = (void *)v101;
              }
              objc_msgSend(v92, "ipv6Addresses");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = objc_msgSend(v103, "count");

              if (v104)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("ipv6"));
                v105 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v92, "ipv6Addresses");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v106, v105);

                v95 = (void *)v105;
              }
              if (objc_msgSend(v92, "hasWifiInfo"))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("wifi.SSID"));
                v107 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v92, "wifiInfo");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "ssid");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v109, v107);

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkInfo.%@.%@"), v94, CFSTR("wifi.BSSID"));
                v95 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v92, "wifiInfo");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "bssid");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = (uint64_t)v199;
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v111, v95);

              }
            }
            ++v91;
          }
          while (v89 != v91);
          v89 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v214, v228, 16);
        }
        while (v89);
      }

      v212 = 0u;
      v213 = 0u;
      v210 = 0u;
      v211 = 0u;
      objc_msgSend(v9, "networkServiceInfos");
      v200 = (id)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v210, v227, 16);
      if (v112)
      {
        v113 = v112;
        objc = *(id *)v211;
        do
        {
          for (k = 0; k != v113; ++k)
          {
            if (*(id *)v211 != objc)
              objc_enumerationMutation(v200);
            v115 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * k);
            objc_msgSend(v115, "ifaceName");
            v116 = (void *)objc_claimAutoreleasedReturnValue();

            if (v116)
            {
              objc_msgSend(v115, "ifaceName");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("name"));
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "setObject:forKeyedSubscript:", v117, v118);
              objc_msgSend(v115, "networkSignatureV4");
              v119 = (void *)objc_claimAutoreleasedReturnValue();

              if (v119)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("NetSigV4"));
                v120 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "networkSignatureV4");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v121, v120);

                v118 = (void *)v120;
              }
              objc_msgSend(v115, "networkSignatureV6");
              v122 = (void *)objc_claimAutoreleasedReturnValue();

              if (v122)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("netSigV6"));
                v123 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "networkSignatureV6");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v124, v123);

                v118 = (void *)v123;
              }
              objc_msgSend(v115, "routerIPv4");
              v125 = (void *)objc_claimAutoreleasedReturnValue();

              if (v125)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("routerV4"));
                v126 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "routerIPv4");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v127, v126);

                v118 = (void *)v126;
              }
              objc_msgSend(v115, "routerIPv6");
              v128 = (void *)objc_claimAutoreleasedReturnValue();

              if (v128)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("routerV6"));
                v129 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "routerIPv6");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v130, v129);

                v118 = (void *)v129;
              }
              objc_msgSend(v115, "ipv4Addresses");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = objc_msgSend(v131, "count");

              if (v132)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("ipv4"));
                v133 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "ipv4Addresses");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v134, v133);

                v118 = (void *)v133;
              }
              objc_msgSend(v115, "ipv6Addresses");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = objc_msgSend(v135, "count");

              if (v136)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dev.networkService.%@.%@"), v117, CFSTR("ipv6"));
                v137 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v115, "ipv6Addresses");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "setObject:forKeyedSubscript:", v138, v137);

                v118 = (void *)v137;
              }

            }
          }
          v113 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v210, v227, 16);
        }
        while (v113);
      }

      v139 = v9;
      objc_msgSend(v9, "eventRouterServerInfo");
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      if (v140)
      {
        v141 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "eventRouterServerInfo");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "numberWithInt:", objc_msgSend(v142, "mode"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "setObject:forKeyedSubscript:", v143, CFSTR("evtrouter.server.mode"));

        v144 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "eventRouterServerInfo");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "numberWithInt:", objc_msgSend(v145, "connectionState"));
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "setObject:forKeyedSubscript:", v146, CFSTR("evtrouter.server.connectionState"));

        objc_msgSend(v9, "eventRouterServerInfo");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v145) = objc_msgSend(v147, "hasLastConnected");

        if ((_DWORD)v145)
        {
          v148 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v9, "eventRouterServerInfo");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "lastConnected");
          objc_msgSend(v148, "dateWithTimeIntervalSinceReferenceDate:");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "description");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "setObject:forKeyedSubscript:", v151, CFSTR("evtrouter.server.lastConnected"));

        }
        objc_msgSend(v9, "eventRouterServerInfo");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "connectedClients");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_msgSend(v153, "count");

        if (v154)
        {
          v208 = 0u;
          v209 = 0u;
          v206 = 0u;
          v207 = 0u;
          objc_msgSend(v9, "eventRouterServerInfo");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "connectedClients");
          v156 = (void *)objc_claimAutoreleasedReturnValue();

          v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v206, v226, 16);
          if (v157)
          {
            v158 = v157;
            v159 = *(_QWORD *)v207;
            v160 = &stru_1E89C3E38;
            do
            {
              v161 = 0;
              v162 = v160;
              do
              {
                if (*(_QWORD *)v207 != v159)
                  objc_enumerationMutation(v156);
                objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * v161), "connectedClientIdentifierString");
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString stringByAppendingFormat:](v162, "stringByAppendingFormat:", CFSTR(" %@"), v163);
                v160 = (__CFString *)objc_claimAutoreleasedReturnValue();

                ++v161;
                v162 = v160;
              }
              while (v158 != v161);
              v158 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v206, v226, 16);
            }
            while (v158);
          }
          else
          {
            v160 = &stru_1E89C3E38;
          }

          objc_msgSend(v205, "setObject:forKeyedSubscript:", v160, CFSTR("evtrouter.server.connectedClients"));
          v139 = v9;
        }
      }

      v4 = v197;
      v3 = v198;
    }
    if (objc_msgSend(v4, "hasLastSetupInfo"))
    {
      objc_msgSend(v4, "lastSetupInfo");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v165, "version"));
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v166, CFSTR("lastSetup.version"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "sessionSetupOpenMSHH1"));
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v167, CFSTR("lastSetup.sessionSetupOpenMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "controllerKeyExchangeMSHH1"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v168, CFSTR("lastSetup.controllerKeyExchangeMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "newAccessoryTransferMSHH1"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v169, CFSTR("lastSetup.newAccessoryTransferMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "sessionSetupCloseMSHH1"));
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v170, CFSTR("lastSetup.sessionSetupCloseMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "totalDurationMSHH1"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v171, CFSTR("lastSetup.totalDurationMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "sentinelZoneFetchMSHH1"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v172, CFSTR("lastSetup.sentinelZoneFetchMSHH1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "accountSettleWaitMSHH2"));
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v173, CFSTR("lastSetup.accountSettleWaitMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "currentDeviceIDSWaitMSHH2"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v174, CFSTR("lastSetup.currentDeviceIDSWaitMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "homeManagerReadyMSHH2"));
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v175, CFSTR("lastSetup.homeManagerReadyMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "firstCoreDataImportMSHH2"));
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v176, CFSTR("lastSetup.firstCoreDataImportMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "accessoryAddMSHH2"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v177, CFSTR("lastSetup.accessoryAddMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "settingsCreationMSHH2"));
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v178, CFSTR("lastSetup.settingsCreationMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "pairingIdentityCreationMSHH2"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v179, CFSTR("lastSetup.pairingIdentityCreationMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "siriReadyMSHH2"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v180, CFSTR("lastSetup.siriReadyMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "eventRouterServerConnectionMSHH2"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v181, CFSTR("lastSetup.eventRouterServerConnectionMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "primaryResidentElectionMSHH2"));
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v182, CFSTR("lastSetup.primaryResidentElectionMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "eventRouterFirstEventPushMSHH2"));
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v183, CFSTR("lastSetup.eventRouterFirstEventPushMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "totalDurationMSHH2"));
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v184, CFSTR("lastSetup.totalDurationMSHH2"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v165, "iCloudAvailableINT"));
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v185, CFSTR("lastSetup.iCloudAvailableINT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v165, "iDSAvailableINT"));
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v186, CFSTR("lastSetup.iDSAvailableINT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v165, "manateeAvailableINT"));
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v187, CFSTR("lastSetup.manateeAvailableINT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v165, "networkAvailableINT"));
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v188, CFSTR("lastSetup.networkAvailableINT"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "lastKnownStageErrorCode"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v189, CFSTR("lastSetup.lastKnownStageErrorCode"));

      objc_msgSend(v165, "lastKnownStageErrorDomain");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v190, CFSTR("lastSetup.lastKnownStageErrorDomain"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v165, "lastKnownStageUnderlyingErrorCode"));
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v191, CFSTR("lastSetup.lastKnownStageUnderlyingErrorCode"));

      objc_msgSend(v165, "lastKnownStageUnderlyingErrorDomain");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v192, CFSTR("lastSetup.lastKnownStageUnderlyingErrorDomain"));

      objc_msgSend(v165, "lastKnownStageErrorString");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v193, CFSTR("lastSetup.lastKnownStageErrorString"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v165, "savedEventState"));
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKeyedSubscript:", v194, CFSTR("lastSetup.savedEventState"));

    }
    v164 = v205;
    objc_msgSend(v205, "setObject:forKeyedSubscript:", CFSTR("false"), CFSTR("isPrimaryResident"));
    if (objc_msgSend(v4, "hasPrimaryResidentDiagnosticInfo"))
      objc_msgSend(v205, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("isPrimaryResident"));
  }
  else
  {
    v164 = 0;
  }
  v195 = (void *)objc_msgSend(v164, "copy");

  return v195;
}

@end
