@implementation HMDDeviceSetupClientSession

- (HMDDeviceSetupClientSession)initWithHomeManager:(id)a3 userDefaults:(id)a4 sessionIdentifier:(id)a5
{
  id v9;
  HMDDeviceSetupClientSession *v10;
  uint64_t v11;
  OS_os_log *logger;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDDeviceSetupClientSession;
  v10 = -[HMDDeviceSetupSessionInternal initWithHomeManager:userDefaults:](&v14, sel_initWithHomeManager_userDefaults_, a3, a4);
  if (v10)
  {
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_storeStrong((id *)&v10->_sessionIdentifier, a5);
  }

  return v10;
}

- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7
{
  NSObject *logger;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  HMDDeviceSetupClientSession *v20;
  NSObject *v21;
  NSObject *v22;
  HMDDeviceSetupClientSession *v23;
  id v24;
  id *v25;
  id *v26;
  id *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  void *v34;
  HMDDeviceSetupClientSession *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMDDeviceSetupClientSession *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  HMDDeviceSetupClientSession *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDDeviceSetupClientSession *v66;
  NSObject *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  BOOL v72;
  void *v73;
  HMDDeviceSetupClientSession *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  HMDDeviceSetupClientSession *v81;
  NSObject *v82;
  HMDDeviceSetupClientSession *v83;
  id v84;
  id *v85;
  id *v86;
  id *v87;
  void *v88;
  id v89;
  char isKindOfClass;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  void *v98;
  HMDDeviceSetupClientSession *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  HMDDeviceSetupClientSession *v104;
  NSObject *v105;
  void *v106;
  unint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  HMDDeviceSetupClientSession *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  HMDDeviceSetupClientSession *v116;
  HMDHomeKitVersion *v117;
  void *v118;
  HMDDeviceSetupClientSession *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  char v127;
  void *v128;
  HMDDeviceSetupClientSession *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  char v133;
  void *v134;
  HMDDeviceSetupClientSession *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  HMDDeviceSetupClientSession *v142;
  NSObject *v143;
  void *v144;
  void *v145;
  HMDDeviceSetupClientSession *v147;
  id v148;
  void *v149;
  id *v150;
  void *v151;
  void *v152;
  void *context;
  int contexta;
  unsigned int v155;
  HMDHomeKitVersion *v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  id *v161;
  void *v162;
  id *v163;
  HMDDeviceSetupClientSession *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  const __CFString *v172;
  void *v173;
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  unint64_t v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  void *v181;
  __int16 v182;
  uint64_t v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  v169 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientDeviceSessionProcess", ", buf, 2u);
  }
  if (!v169)
  {
    v16 = 0;
LABEL_13:
    -[HMDDeviceSetupSessionInternal homeManager](self, "homeManager");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDDeviceSetupSessionInternal state](self, "state");
    if (v31 != 2)
    {
      if (v31 == 1)
      {
        v170 = 0;
        objc_msgSend(v167, "getOrCreateLocalPairingIdentity:", &v170);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = v170;
        if (!v33 && v32)
        {
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v175 = v37;
            v176 = 2112;
            v177 = (unint64_t)v32;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Sending local pairing identity: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v34);
          objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "getPreferredHH2ControllerKey");
          v39 = objc_claimAutoreleasedReturnValue();

          if (!v39)
          {
            v40 = (void *)MEMORY[0x227676638]();
            v41 = v35;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v43 = v32;
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v175 = v44;
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Its very strange that we are running in HH2 mode but we do not have HH2 pairing key. This will not fail TTSU as the HH2 key will be created by the newly setup device.", buf, 0xCu);

              v32 = v43;
            }

            objc_autoreleasePoolPop(v40);
          }
          objc_msgSend(v166, "setObject:forKeyedSubscript:", v39, CFSTR("pi.hh2"));
          objc_msgSend(v166, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("mi.hh2"));
          objc_msgSend(v167, "homes");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v45;
          v47 = 0x24BDD1000;
          v162 = (void *)v39;
          if (objc_msgSend(v45, "count") == 1 && v46)
          {
            v157 = v32;
            objc_msgSend(v46, "residentDeviceManager");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "residentDevices");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend((id)v49, "na_any:", &__block_literal_global_297);

            objc_msgSend(v46, "appleMediaAccessories");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v49) = objc_msgSend(v51, "na_any:", &__block_literal_global_299);

            v155 = v50 | v49;
            context = (void *)MEMORY[0x227676638]();
            v52 = v35;
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "shortDescription");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v56 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v175 = v151;
              v176 = 2112;
              v177 = (unint64_t)v149;
              v178 = 2112;
              v179 = (uint64_t)v54;
              v180 = 2112;
              v181 = v55;
              v182 = 2112;
              v183 = v56;
              v57 = (void *)v56;
              _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Sending home has reachable resident value: %@ as part of payload (home: %@, hasReachableResident: %@, hasReachableAppleMediaAccessory: %@)", buf, 0x34u);

            }
            objc_autoreleasePoolPop(context);
            v47 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v155);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "setObject:forKeyedSubscript:", v58, CFSTR("rpr"));

            v32 = v157;
          }
          objc_msgSend(*(id *)(v47 + 1760), "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v35, "state"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "setObject:forKeyedSubscript:", v59, CFSTR("st"));

          objc_msgSend(v166, "setObject:forKeyedSubscript:", v32, CFSTR("pi"));
          v60 = *(void **)(v47 + 1760);
          objc_msgSend(v167, "hh2FrameworkSwitch");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "numberWithBool:", objc_msgSend(v61, "checkExistenceOfHH2SentinelZone"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "setObject:forKeyedSubscript:", v62, CFSTR("sz.hh2"));

          -[HMDDeviceSetupClientSession sessionIdentifier](v35, "sessionIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "UUIDString");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = (void *)MEMORY[0x227676638]();
          v66 = v35;
          HMFGetOSLogHandle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v68 = v32;
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v175 = v69;
            v176 = 2112;
            v177 = (unint64_t)v64;
            _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup session identifier %@ as part of payload", buf, 0x16u);

            v32 = v68;
          }

          objc_autoreleasePoolPop(v65);
          objc_msgSend(v166, "setObject:forKeyedSubscript:", v64, CFSTR("session.id"));
          -[HMDDeviceSetupSessionInternal setState:](v66, "setState:", 2);

          goto LABEL_102;
        }

        goto LABEL_83;
      }
      if (a7)
      {
        v96 = (void *)MEMORY[0x24BDD1540];
        v97 = 23;
LABEL_65:
        objc_msgSend(v96, "hmErrorWithCode:", v97);
        v72 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_107:

        goto LABEL_108;
      }
      goto LABEL_83;
    }
    if (!v16)
    {
      v98 = (void *)MEMORY[0x227676638]();
      v99 = self;
      HMFGetOSLogHandle();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = -[HMDDeviceSetupSessionInternal state](v99, "state");
        *(_DWORD *)buf = 138543618;
        v175 = v101;
        v176 = 2048;
        v177 = v102;
        _os_log_impl(&dword_2218F0000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid request state: %tu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v98);
      if (a7)
      {
        v96 = (void *)MEMORY[0x24BDD1540];
        v97 = 58;
        goto LABEL_65;
      }
LABEL_83:
      v72 = 0;
      goto LABEL_107;
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ac"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v79 = v78;
    else
      v79 = 0;
    v32 = v79;

    if (!v32)
    {
LABEL_101:
      -[HMDDeviceSetupSessionInternal setState:](self, "setState:", 3);
LABEL_102:

      if (-[HMDDeviceSetupSessionInternal state](self, "state") != 3)
      {
        v141 = (void *)MEMORY[0x227676638]();
        v142 = self;
        HMFGetOSLogHandle();
        v143 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v175 = v144;
          v176 = 2112;
          v177 = (unint64_t)v166;
          _os_log_impl(&dword_2218F0000, v143, OS_LOG_TYPE_DEFAULT, "%{public}@Response: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v141);
        encodeRootObjectForRemote(v166, 0, 0);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDeviceSetupSessionInternal setSessionData:](v142, "setSessionData:", v145);

      }
      v72 = 1;
      goto LABEL_107;
    }
    v80 = (void *)MEMORY[0x227676638]();
    v81 = self;
    HMFGetOSLogHandle();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v163 = a6;
      v83 = self;
      v84 = v16;
      v85 = a7;
      v86 = a4;
      v87 = a5;
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v175 = v88;
      v176 = 2112;
      v177 = (unint64_t)v32;
      _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory description: %@", buf, 0x16u);

      a5 = v87;
      a4 = v86;
      a7 = v85;
      v16 = v84;
      self = v83;
      a6 = v163;
    }

    v164 = v81;
    objc_autoreleasePoolPop(v80);
    v89 = v32;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v91 = v89;
    else
      v91 = 0;
    v92 = v91;

    if ((isKindOfClass & 1) == 0)
    {
LABEL_96:
      objc_msgSend(v167, "accessoryBrowser", v147);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addUnassociatedAccessory:forDeviceSetup:", v89, 1);

      if (a4)
      {
        objc_msgSend(v89, "uuid");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5)
      {
        objc_msgSend(v89, "category");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      encodeRootObjectForIncomingXPCMessage(v89, 0);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = CFSTR("kAccessoryDataKey");
      v173 = v139;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceSetupSessionInternal setUserInfo:](v164, "setUserInfo:", v140);

      goto LABEL_101;
    }
    v148 = v92;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("hk"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v94 = v93;
    else
      v94 = 0;
    v95 = v94;

    v158 = v32;
    v160 = v89;
    v152 = v95;
    if (v95)
      v156 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v95);
    else
      v156 = 0;
    v150 = a5;
    v103 = (void *)MEMORY[0x227676638]();
    v104 = v164;
    HMFGetOSLogHandle();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v175 = v106;
      v176 = 2112;
      v177 = (unint64_t)v156;
      _os_log_impl(&dword_2218F0000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory HomeKit version: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v103);
    v107 = +[HMDDeviceCapabilities supportedPairingCapabilities](HMDDeviceCapabilities, "supportedPairingCapabilities");
    objc_msgSend(v160, "minimumRequiredPairingSoftwareVersion");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
    {
      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "minimumRequiredPairingSoftwareVersion");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      contexta = objc_msgSend(v109, "isAtLeastVersion:", v110);

    }
    else
    {
      contexta = 1;
    }

    v111 = (void *)MEMORY[0x227676638]();
    v112 = v104;
    HMFGetOSLogHandle();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v147 = v112;
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v175 = v114;
      v176 = 2048;
      v177 = v107;
      v178 = 2112;
      v179 = (uint64_t)v115;
      _os_log_impl(&dword_2218F0000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@Our pairing capabilities: 0x%lx, minimum software version satisfied: %@", buf, 0x20u);

      v112 = v147;
    }

    objc_autoreleasePoolPop(v111);
    if ((objc_msgSend(v160, "canPairGivenCapabilities:", v107) & contexta & 1) != 0)
    {
      v116 = v112;
      v117 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("10.0"));
      if (-[HMDHomeKitVersion isAtLeastVersion:](v156, "isAtLeastVersion:", v117))
      {

        a5 = v150;
LABEL_90:
        v134 = (void *)MEMORY[0x227676638]();
        v135 = v116;
        HMFGetOSLogHandle();
        v136 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v175 = v137;
          _os_log_impl(&dword_2218F0000, v136, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory HomeKit version indicates HH2 support, continuing normally", buf, 0xCu);

          a5 = v150;
        }

        objc_autoreleasePoolPop(v134);
        v32 = v158;
LABEL_93:
        v89 = v160;
        if (a6)
        {
          objc_msgSend(v160, "idsIdentifierString");
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        v92 = v148;
        goto LABEL_96;
      }
      objc_msgSend(v160, "category");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "categoryType");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v126, "isEqualToString:", *MEMORY[0x24BDD49E0]);

      a5 = v150;
      if ((v127 & 1) == 0)
        goto LABEL_90;
      v128 = (void *)MEMORY[0x227676638]();
      v129 = v116;
      HMFGetOSLogHandle();
      v130 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v131;
        _os_log_impl(&dword_2218F0000, v130, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod upgrade and pairing engine", buf, 0xCu);

        a5 = v150;
      }

      objc_autoreleasePoolPop(v128);
      objc_msgSend(v167, "legacyAccessoryPairingController");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "pairAccessory:", v160);

      v32 = v158;
      if ((v133 & 1) != 0)
        goto LABEL_93;
      v122 = v160;
      v123 = v152;
      if (!a7)
      {
LABEL_82:

        goto LABEL_83;
      }
      v124 = -1;
    }
    else
    {
      v118 = (void *)MEMORY[0x227676638]();
      v119 = v112;
      HMFGetOSLogHandle();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v121;
        _os_log_impl(&dword_2218F0000, v120, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair as current device doesn't have all required capabilities.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v118);
      v122 = v160;
      v123 = v152;
      if (!a7)
        goto LABEL_82;
      v124 = 48;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v124, v147);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  v13 = (void *)MEMORY[0x24BDD1620];
  +[HMDDeviceSetupServerSession allowedClasses](HMDDeviceSetupServerSession, "allowedClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = 0;
  objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v14, v169, &v171);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v171;

  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v161 = a6;
      v23 = self;
      v24 = v16;
      v25 = a7;
      v26 = a4;
      v27 = a5;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v175 = v28;
      v176 = 2112;
      v177 = (unint64_t)v18;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

      a5 = v27;
      a4 = v26;
      a7 = v25;
      v16 = v24;
      self = v23;
      a6 = v161;
    }

    objc_autoreleasePoolPop(v19);
    objc_msgSend(v18, "hmf_numberForKey:", CFSTR("st"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");
    if (v30 == -[HMDDeviceSetupSessionInternal state](v20, "state"))
    {

      goto LABEL_13;
    }
    v73 = (void *)MEMORY[0x227676638]();
    v74 = v20;
    HMFGetOSLogHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[HMDDeviceSetupSessionInternal state](v74, "state");
      *(_DWORD *)buf = 138543874;
      v175 = v76;
      v176 = 2112;
      v177 = (unint64_t)v29;
      v178 = 2048;
      v179 = v77;
      _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v73);
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v72 = 0;
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v175 = v70;
      v176 = 2112;
      v177 = (unint64_t)v165;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (a7)
    {
      v71 = objc_retainAutorelease(v165);
      v72 = 0;
      v168 = v16;
      *a7 = v71;
      v16 = v71;
    }
    else
    {
      v72 = 0;
      v168 = v16;
      v16 = v165;
    }

  }
LABEL_108:

  return v72;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __120__HMDDeviceSetupClientSession_processSessionData_outAccessoryUUID_outAccessoryCategory_outAccessoryIDSIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReachable");
}

uint64_t __120__HMDDeviceSetupClientSession_processSessionData_outAccessoryUUID_outAccessoryCategory_outAccessoryIDSIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReachable");
}

+ (int64_t)role
{
  return 0;
}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsKeychainSync");

  return v3;
}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupClientSession;
  objc_msgSendSuper2(&v6, sel_allowedClasses);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t43 != -1)
    dispatch_once(&logCategory__hmf_once_t43, &__block_literal_global_303);
  return (id)logCategory__hmf_once_v44;
}

void __42__HMDDeviceSetupClientSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v44;
  logCategory__hmf_once_v44 = v0;

}

@end
