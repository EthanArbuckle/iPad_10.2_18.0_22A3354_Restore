@implementation HMDDeviceSetupServerSession

- (HMDDeviceSetupServerSession)initWithHomeManager:(id)a3 userDefaults:(id)a4
{
  HMDDeviceSetupServerSession *v4;
  uint64_t v5;
  OS_os_log *logger;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDDeviceSetupServerSession;
  v4 = -[HMDDeviceSetupSessionInternal initWithHomeManager:userDefaults:](&v8, sel_initWithHomeManager_userDefaults_, a3, a4);
  if (v4)
  {
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v5;

  }
  return v4;
}

- (BOOL)processSessionData:(id)a3 outAccessoryUUID:(id *)a4 outAccessoryCategory:(id *)a5 outAccessoryIDSIdentifier:(id *)a6 error:(id *)a7
{
  id v11;
  NSObject *logger;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMDDeviceSetupServerSession *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  HMDDeviceSetupServerSession *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  HMDDeviceSetupServerSession *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  HMDDeviceSetupServerSession *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDDeviceSetupServerSession *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  HMDDeviceSetupServerSession *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  HMDDeviceSetupServerSession *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  HMDDeviceSetupServerSession *v82;
  NSObject *v83;
  void *v84;
  BOOL v85;
  void *v86;
  HMDDeviceSetupServerSession *v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  HMDDeviceSetupServerSession *v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  id v102;
  char isKindOfClass;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  HMDDeviceSetupServerSession *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  HMDDeviceSetupServerSession *v114;
  NSObject *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  HMDDeviceSetupServerSession *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  HMDDeviceSetupServerSession *v132;
  NSObject *v133;
  id v134;
  void *v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  HMDDeviceSetupServerSession *v140;
  NSObject *v141;
  id v142;
  void *v143;
  void *v144;
  id v145;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  id *v152;
  id *v153;
  void *v154;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  uint8_t buf[4];
  void *v163;
  __int16 v164;
  id v165;
  __int16 v166;
  uint64_t v167;
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServerDeviceSessionProcess", ", buf, 2u);
  }
  -[HMDDeviceSetupSessionInternal homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentAccessorySetupMetricDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v152 = a4;
    v153 = a5;
    v29 = 0;
    v18 = 0;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HMDRemoteKeyedArchiver initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:supportedFeatures:]([HMDRemoteKeyedArchiver alloc], "initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:supportedFeatures:", 0, 0, 0, 0, 0);
    v31 = -[HMDDeviceSetupSessionInternal state](self, "state");
    v154 = v29;
    if (v31 == 2)
    {
      v150 = v30;
      v151 = v11;
LABEL_59:
      objc_msgSend(v14, "markSetupBeginStage:error:", 4, v18);
      objc_msgSend(v13, "accessoryBrowser");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "mediaBrowser");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "currentAccessory");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = (void *)MEMORY[0x1D17BA0A0]();
      v97 = self;
      HMFGetOSLogHandle();
      v98 = objc_claimAutoreleasedReturnValue();
      v99 = v98;
      v160 = v13;
      if (v95)
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v163 = v100;
          v164 = 2112;
          v165 = v95;
          _os_log_impl(&dword_1CD062000, v99, OS_LOG_TYPE_DEFAULT, "%{public}@Set accessory %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v96);
        v101 = self->_logger;
        if (os_signpost_enabled(v101))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CD062000, v101, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentUnassociatedAppleMediaAccessory", ", buf, 2u);
        }
        objc_msgSend(v157, "setObject:forKeyedSubscript:", v95, CFSTR("ac"));
        v102 = v95;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v104 = v102;
        else
          v104 = 0;
        v105 = v104;

        if (a6 && (isKindOfClass & 1) != 0)
        {
          objc_msgSend(v105, "idsIdentifierString");
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v152)
        {
          objc_msgSend(v102, "uuid");
          *v152 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v153)
        {
          objc_msgSend(v102, "category");
          *v153 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v102, "uuid");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "UUIDString");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (v107)
        {
          v108 = (void *)MEMORY[0x1D17BA0A0]();
          v109 = v97;
          HMFGetOSLogHandle();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v163 = v111;
            v164 = 2112;
            v165 = v107;
            _os_log_impl(&dword_1CD062000, v110, OS_LOG_TYPE_INFO, "%{public}@Saving model uuid for Core Data voucher %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v108);
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setObject:forKey:", v107, CFSTR("HMDCurrentAccessoryModelUUID"));

        }
      }
      else
      {
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v163 = v122;
          _os_log_impl(&dword_1CD062000, v99, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain accessory in M2.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v96);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 2, CFSTR("No accessory found from the browser"));
        v105 = v18;
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v97, "state"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v157;
      objc_msgSend(v157, "setObject:forKeyedSubscript:", v123, CFSTR("st"));

      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "versionString");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "setObject:forKeyedSubscript:", v125, CFSTR("hk"));

      -[HMDDeviceSetupSessionInternal setState:](v97, "setState:", 3);
      objc_msgSend(v14, "markSetupEndStage:error:", 4, v18);

      v126 = (void *)MEMORY[0x1D17BA0A0]();
      v127 = v97;
      HMFGetOSLogHandle();
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v163 = v129;
        v164 = 2112;
        v165 = v157;
        _os_log_impl(&dword_1CD062000, v128, OS_LOG_TYPE_INFO, "%{public}@Response: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v126);
      v30 = v150;
      objc_msgSend(v150, "encodeObject:forKey:", v157, *MEMORY[0x1E0CB2CD0]);
      objc_msgSend(v150, "finishEncoding");
      objc_msgSend(v150, "encodedData");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceSetupSessionInternal setSessionData:](v127, "setSessionData:", v130);

      v85 = 1;
      v11 = v151;
      v13 = v160;
LABEL_94:
      v138 = v154;
LABEL_103:

      goto LABEL_104;
    }
    if (v31 != 1)
    {
      v113 = (void *)MEMORY[0x1D17BA0A0]();
      v114 = self;
      HMFGetOSLogHandle();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v116 = v30;
        v117 = v18;
        v118 = v14;
        v119 = v13;
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v163 = v120;
        _os_log_impl(&dword_1CD062000, v115, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized state or hit error.", buf, 0xCu);

        v13 = v119;
        v14 = v118;
        v18 = v117;
        v30 = v116;
      }

      objc_autoreleasePoolPop(v113);
      v121 = v157;
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
        v85 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v85 = 0;
      }
      goto LABEL_94;
    }
    objc_msgSend(v14, "markSetupBeginStage:error:", 3, v18);
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("pi"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;

    v149 = v34;
    if (v34)
    {
      if ((objc_msgSend(v13, "setLocalPairingIdentity:error:", v34, a7) & 1) != 0)
      {
        v35 = self->_logger;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CD062000, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedLocalControllerKey", ", buf, 2u);
        }
        v150 = v30;
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("pi.hh2"));
        v36 = objc_claimAutoreleasedReturnValue();
        v148 = (void *)v36;
        v151 = v11;
        v159 = v13;
        if (v36)
        {
          v37 = (void *)v36;
          v38 = (void *)MEMORY[0x1D17BA0A0]();
          v39 = self;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "identifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v163 = v41;
            v164 = 2112;
            v165 = v42;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 Pairing key during TTSU : %@. Going to save it to keychain store", buf, 0x16u);

            v37 = v148;
          }

          objc_autoreleasePoolPop(v38);
          objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "saveHH2PairingIdentity:syncable:", v37, 1);

          if ((v44 & 1) == 0)
          {
            v45 = (void *)MEMORY[0x1D17BA0A0]();
            v46 = v39;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v163 = v48;
              _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the HH2 key to keychain store. This will not fail TTSU as there can be multiple HH2 keys and the HomeKitDaemon will handle that appropriately.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v45);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3401);
            v49 = objc_claimAutoreleasedReturnValue();

            v18 = (id)v49;
          }
          v29 = v154;
        }
        objc_msgSend(v29, "hmf_numberForKey:", CFSTR("mi.hh2"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          v51 = (void *)MEMORY[0x1D17BA0A0]();
          v52 = self;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "BOOLValue");
            HMFBooleanToString();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v163 = v54;
            v164 = 2112;
            v165 = v55;
            _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 settings migration key during TTSU : %@. Going to save it to user defaults", buf, 0x16u);

            v29 = v154;
          }

          objc_autoreleasePoolPop(v51);
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setBool:forKey:", objc_msgSend(v50, "BOOLValue"), CFSTR("mi.hh2"));

        }
        objc_msgSend(v29, "hmf_numberForKey:", CFSTR("rpr"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v58 = v50;
          v59 = (void *)MEMORY[0x1D17BA0A0]();
          v60 = self;
          HMFGetOSLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "BOOLValue");
            HMFBooleanToString();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v163 = v62;
            v164 = 2112;
            v165 = v63;
            _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Got the home has reachable resident value during TTSU: %@.", buf, 0x16u);

            v29 = v154;
          }

          objc_autoreleasePoolPop(v59);
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setBool:forKey:", objc_msgSend(v57, "BOOLValue"), CFSTR("rpr"));

          v50 = v58;
        }
        v147 = v50;
        v65 = objc_msgSend(v50, "BOOLValue");
        objc_msgSend(v29, "hmf_numberForKey:", CFSTR("sz.hh2"));
        v66 = v29;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "BOOLValue");

        objc_msgSend(v14, "markControllerHH2Mode:controllerHH2SentinelExists:", v65, v68);
        objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("session.id"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v70 = v69;
        else
          v70 = 0;
        v71 = v70;

        v13 = v159;
        if (v71)
        {
          v72 = (void *)MEMORY[0x1D17BA0A0]();
          v73 = self;
          HMFGetOSLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v163 = v75;
            v164 = 2112;
            v165 = v71;
            _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v72);
          objc_msgSend(v14, "setControllerSetupSessionIdentifier:", v71);
        }
        objc_msgSend(v159, "uuid");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Device Setup Set Controller Keys"), v76, 1);

        v77 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v14, "markSetupEndStage:error:", 3, v18));
        v78 = self;
        HMFGetOSLogHandle();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v163 = v80;
          _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@Proceeding to M2", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v77);
        -[HMDDeviceSetupSessionInternal setState:](v78, "setState:", 2);

        goto LABEL_59;
      }
      v139 = (void *)MEMORY[0x1D17BA0A0]();
      v140 = self;
      HMFGetOSLogHandle();
      v141 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v142 = v30;
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v163 = v143;
        _os_log_impl(&dword_1CD062000, v141, OS_LOG_TYPE_ERROR, "%{public}@Failed to set local pairing identity", buf, 0xCu);

        v30 = v142;
      }

      objc_autoreleasePoolPop(v139);
      v121 = v157;
      if (a7)
      {
        v137 = *a7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 16, CFSTR("Failed to set local pairing identity"));
        v137 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v131 = (void *)MEMORY[0x1D17BA0A0]();
      v132 = self;
      HMFGetOSLogHandle();
      v133 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v134 = v30;
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v163 = v135;
        _os_log_impl(&dword_1CD062000, v133, OS_LOG_TYPE_ERROR, "%{public}@Request missing pairing identity", buf, 0xCu);

        v30 = v134;
      }

      objc_autoreleasePoolPop(v131);
      v121 = v157;
      if (!a7)
      {
        v138 = v154;
        v144 = 0;
LABEL_102:
        objc_msgSend(v14, "markSetupEndStage:error:", 3, v18);

        v85 = 0;
        goto LABEL_103;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v136 = (id)objc_claimAutoreleasedReturnValue();
      *a7 = v136;
      v137 = v136;
    }
    v145 = v137;
    v138 = v154;
    v144 = v149;

    v18 = v145;
    goto LABEL_102;
  }
  v15 = (void *)MEMORY[0x1E0CB3710];
  +[HMDDeviceSetupClientSession allowedClasses](HMDDeviceSetupClientSession, "allowedClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 0;
  objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v16, v11, &v161);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v161;

  if (v17)
  {
    v152 = a4;
    v153 = a5;
    v156 = v14;
    v158 = v13;
    v19 = v11;
    v20 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v163 = v26;
      v164 = 2112;
      v165 = v22;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v22, "hmf_numberForKey:", CFSTR("st"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue");
    v29 = v22;
    if (v28 == -[HMDDeviceSetupSessionInternal state](v24, "state"))
    {

      v11 = v19;
      v14 = v156;
      v13 = v158;
      goto LABEL_13;
    }
    v86 = (void *)MEMORY[0x1D17BA0A0]();
    v87 = v24;
    HMFGetOSLogHandle();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = -[HMDDeviceSetupSessionInternal state](v87, "state");
      *(_DWORD *)buf = 138543874;
      v163 = v89;
      v164 = 2112;
      v165 = v27;
      v166 = 2048;
      v167 = v90;
      _os_log_impl(&dword_1CD062000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v86);
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v91 = (id)objc_claimAutoreleasedReturnValue();
      *a7 = v91;
      v92 = v91;

      v18 = v92;
    }
    v11 = v19;
    v14 = v156;
    objc_msgSend(v156, "markSetupBeginStage:error:", 3, v18);

    v85 = 0;
    v13 = v158;
  }
  else
  {
    v81 = (void *)MEMORY[0x1D17BA0A0]();
    v82 = self;
    HMFGetOSLogHandle();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v163 = v84;
      v164 = 2112;
      v165 = v18;
      _os_log_impl(&dword_1CD062000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v81);
    if (a7)
      *a7 = objc_retainAutorelease(v18);
    objc_msgSend(v14, "markSetupBeginStage:error:", 3, v18);
    v85 = 0;
  }
LABEL_104:

  return v85;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

+ (int64_t)role
{
  return 1;
}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDeviceSetup");

  return v3;
}

+ (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupServerSession;
  objc_msgSendSuper2(&v6, sel_allowedClasses);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68_25757 != -1)
    dispatch_once(&logCategory__hmf_once_t68_25757, &__block_literal_global_321);
  return (id)logCategory__hmf_once_v69_25758;
}

void __42__HMDDeviceSetupServerSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v69_25758;
  logCategory__hmf_once_v69_25758 = v0;

}

@end
