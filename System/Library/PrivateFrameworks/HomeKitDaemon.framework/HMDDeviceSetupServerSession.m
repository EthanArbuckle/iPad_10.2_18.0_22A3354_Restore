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
  id v12;
  NSObject *logger;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  HMDDeviceSetupServerSession *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDDeviceSetupServerSession *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  HMDDeviceSetupServerSession *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  HMDDeviceSetupServerSession *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDDeviceSetupServerSession *v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  HMDDeviceSetupServerSession *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  HMDDeviceSetupServerSession *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  CFIndex AppIntegerValue;
  void *v90;
  HMDDeviceSetupServerSession *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  HMDDeviceSetupServerSession *v96;
  NSObject *v97;
  void *v98;
  BOOL v99;
  void *v100;
  HMDDeviceSetupServerSession *v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  HMDDeviceSetupServerSession *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  HMDDeviceSetupServerSession *v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  HMDDeviceSetupServerSession *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  HMDDeviceSetupServerSession *v134;
  NSObject *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  HMDDeviceSetupServerSession *v142;
  NSObject *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  id v147;
  char isKindOfClass;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  HMDDeviceSetupServerSession *v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  HMDDeviceSetupServerSession *v162;
  void *v163;
  NSObject *v164;
  void *v165;
  void *v166;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  id *v174;
  id *v175;
  id *v176;
  id *v177;
  id *v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id *v184;
  void *v185;
  id v186;
  id v187;
  uint8_t buf[4];
  void *v189;
  __int16 v190;
  id v191;
  __int16 v192;
  uint64_t v193;
  uint64_t v194;

  v194 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServerDeviceSessionProcess", ", buf, 2u);
  }
  v184 = a7;
  v178 = a4;
  -[HMDDeviceSetupSessionInternal homeManager](self, "homeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentAccessorySetupMetricDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v174 = a6;
    v31 = 0;
    v19 = 0;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = -[HMDRemoteKeyedArchiver initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:supportedFeatures:]([HMDRemoteKeyedArchiver alloc], "initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:supportedFeatures:", 0, 0, 0, 0, 0);
    v33 = -[HMDDeviceSetupSessionInternal state](self, "state");
    v183 = v31;
    if (v33 == 2)
      goto LABEL_48;
    if (v33 != 1)
    {
      v107 = v15;
      v108 = v19;
      v109 = (void *)MEMORY[0x227676638]();
      v110 = self;
      HMFGetOSLogHandle();
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v112 = v14;
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v189 = v113;
        _os_log_impl(&dword_2218F0000, v111, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized state or hit error.", buf, 0xCu);

        v14 = v112;
      }

      objc_autoreleasePoolPop(v109);
      if (v184)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
        v99 = 0;
        *v184 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v99 = 0;
      }
      v131 = v183;
      v132 = v179;
      goto LABEL_113;
    }
    objc_msgSend(v15, "markSetupBeginStage:error:", 3, v19);
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("pi"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    if (v36)
    {
      if ((objc_msgSend(v14, "setLocalPairingIdentity:error:", v36, v184) & 1) != 0)
      {
        v37 = self->_logger;
        if (os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2218F0000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedLocalControllerKey", ", buf, 2u);
        }
        v176 = a5;
        v169 = v32;
        v38 = v183;
        objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("pi.hh2"));
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = v15;
        v168 = v36;
        if (v170)
        {
          v39 = (void *)MEMORY[0x227676638]();
          v40 = self;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v42;
            v190 = 2112;
            v191 = v43;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 Pairing key during TTSU : %@. Going to save it to keychain store", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v39);
          objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "saveHH2PairingIdentity:syncable:", v170, 1);

          if ((v45 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x227676638]();
            v47 = v40;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v189 = v49;
              _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the HH2 key to keychain store. This will not fail TTSU as there can be multiple HH2 keys and the HomeKitDaemon will handle that appropriately.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v46);
            objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3401);
            v50 = objc_claimAutoreleasedReturnValue();

            v19 = (id)v50;
          }
          v38 = v183;
        }
        objc_msgSend(v38, "hmf_numberForKey:", CFSTR("mi.hh2"));
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        if (v185)
        {
          v51 = (void *)MEMORY[0x227676638]();
          v52 = self;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v171 = v51;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v185, "BOOLValue");
            HMFBooleanToString();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v54;
            v190 = 2112;
            v191 = v55;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Got the HH2 settings migration key during TTSU : %@. Going to save it to user defaults", buf, 0x16u);

            v51 = v171;
          }

          objc_autoreleasePoolPop(v51);
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setBool:forKey:", objc_msgSend(v185, "BOOLValue"), CFSTR("mi.hh2"));

          v38 = v183;
        }
        objc_msgSend(v38, "hmf_numberForKey:", CFSTR("rpr"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v58 = (void *)MEMORY[0x227676638]();
          v59 = self;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "BOOLValue");
            HMFBooleanToString();
            v172 = v57;
            v62 = v19;
            v63 = v14;
            v64 = v12;
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v61;
            v190 = 2112;
            v191 = v65;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Got the home has reachable resident value during TTSU: %@.", buf, 0x16u);

            v12 = v64;
            v14 = v63;
            v19 = v62;
            v57 = v172;

          }
          objc_autoreleasePoolPop(v58);
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setBool:forKey:", objc_msgSend(v57, "BOOLValue"), CFSTR("rpr"));

        }
        v67 = v19;
        v68 = v14;
        v69 = v12;
        v70 = objc_msgSend(v185, "BOOLValue");
        objc_msgSend(v183, "hmf_numberForKey:", CFSTR("sz.hh2"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "BOOLValue");

        v73 = v182;
        objc_msgSend(v182, "markControllerHH2Mode:controllerHH2SentinelExists:", v70, v72);
        objc_msgSend(v183, "objectForKeyedSubscript:", CFSTR("session.id"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v75 = v74;
        else
          v75 = 0;
        v76 = v75;

        if (v76)
        {
          v77 = (void *)MEMORY[0x227676638]();
          v78 = self;
          HMFGetOSLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v80;
            v190 = 2112;
            v191 = v76;
            _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v77);
          v73 = v182;
          objc_msgSend(v182, "setControllerSetupSessionIdentifier:", v76);
        }
        objc_msgSend(v68, "uuid");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Device Setup Set Controller Keys"), v81, 1);

        v82 = (void *)MEMORY[0x227676638](objc_msgSend(v73, "markSetupEndStage:error:", 3, v67));
        v83 = self;
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v189 = v85;
          _os_log_impl(&dword_2218F0000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@Proceeding to M2", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v82);
        -[HMDDeviceSetupSessionInternal setState:](v83, "setState:", 2);

        v12 = v69;
        v14 = v68;
        v15 = v182;
        v19 = v67;
        v32 = v169;
        a5 = v176;
LABEL_48:
        v186 = v19;
        objc_msgSend(v15, "markSetupBeginStage:error:", 4, v19);
        objc_msgSend(v14, "accessoryBrowser");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "mediaBrowser");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "currentAccessory");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        v181 = v14;
        if (!v88)
        {
          v114 = (void *)MEMORY[0x227676638]();
          v115 = self;
          HMFGetOSLogHandle();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v189 = v117;
            _os_log_impl(&dword_2218F0000, v116, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain accessory in M2.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v114);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 2, CFSTR("No accessory found from the browser"));
          v118 = objc_claimAutoreleasedReturnValue();
          v119 = v186;
          goto LABEL_110;
        }
        v177 = a5;
        buf[0] = 0;
        AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("HHTTSUMode"), CFSTR("com.apple.homed"), buf);
        if (buf[0] && AppIntegerValue == 1)
        {
          v90 = (void *)MEMORY[0x227676638]();
          v91 = self;
          HMFGetOSLogHandle();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v93 = v32;
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v189 = v94;
            _os_log_impl(&dword_2218F0000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@Allowing setup to proceed in HH2 mode as TTSU setting indicates we are good to proceed.", buf, 0xCu);

            v32 = v93;
          }

          objc_autoreleasePoolPop(v90);
          goto LABEL_91;
        }
        v120 = objc_opt_class();
        if (v120 != objc_opt_class())
        {
LABEL_91:
          v173 = v12;
          v141 = (void *)MEMORY[0x227676638]();
          v142 = self;
          HMFGetOSLogHandle();
          v143 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v144;
            v190 = 2112;
            v191 = v88;
            _os_log_impl(&dword_2218F0000, v143, OS_LOG_TYPE_DEFAULT, "%{public}@Set accessory %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v141);
          v145 = self->_logger;
          if (os_signpost_enabled(v145))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2218F0000, v145, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentUnassociatedAppleMediaAccessory", ", buf, 2u);
          }
          v146 = v32;
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v88, CFSTR("ac"));
          v147 = v88;
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            v149 = v147;
          else
            v149 = 0;
          v119 = v149;

          if (v174 && (isKindOfClass & 1) != 0)
          {
            objc_msgSend(v119, "idsIdentifierString");
            *v174 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (v178)
          {
            objc_msgSend(v147, "uuid");
            *v178 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (v177)
          {
            objc_msgSend(v147, "category");
            *v177 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v147, "uuid");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "UUIDString");
          v151 = (void *)objc_claimAutoreleasedReturnValue();

          if (v151)
          {
            v152 = (void *)MEMORY[0x227676638]();
            v153 = v142;
            HMFGetOSLogHandle();
            v154 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v189 = v155;
              v190 = 2112;
              v191 = v151;
              _os_log_impl(&dword_2218F0000, v154, OS_LOG_TYPE_INFO, "%{public}@Saving model uuid for Core Data voucher %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v152);
            objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "setObject:forKey:", v151, CFSTR("HMDCurrentAccessoryModelUUID"));

          }
          v12 = v173;
          v32 = v146;
          v118 = (uint64_t)v186;
LABEL_110:

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](self, "state"));
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v157, CFSTR("st"));

          +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "versionString");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v159, CFSTR("hk"));

          -[HMDDeviceSetupSessionInternal setState:](self, "setState:", 3);
          v107 = v15;
          v160 = v15;
          v108 = (id)v118;
          objc_msgSend(v160, "markSetupEndStage:error:", 4, v118);

          v161 = (void *)MEMORY[0x227676638]();
          v162 = self;
          HMFGetOSLogHandle();
          v163 = v32;
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v189 = v165;
            v190 = 2112;
            v191 = v163;
            _os_log_impl(&dword_2218F0000, v164, OS_LOG_TYPE_INFO, "%{public}@Response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v161);
          v132 = v179;
          objc_msgSend(v179, "encodeObject:forKey:", v163, *MEMORY[0x24BDD0E88]);
          objc_msgSend(v179, "finishEncoding");
          objc_msgSend(v179, "encodedData");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDeviceSetupSessionInternal setSessionData:](v162, "setSessionData:", v166);

          v99 = 1;
          v14 = v181;
          v131 = v183;
          v32 = v163;
          goto LABEL_113;
        }
        v121 = v88;
        objc_msgSend(v121, "minimumRequiredPairingSoftwareVersion");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (v122)
        {

        }
        else if ((objc_msgSend(v121, "canPairGivenCapabilities:", 1) & 1) != 0)
        {
LABEL_90:

          goto LABEL_91;
        }
        objc_msgSend(v179, "setClassName:forClass:", CFSTR("HMDUnassociatedAppleHomePodAccessory"), objc_opt_class());
        goto LABEL_90;
      }
      v123 = v36;
      v133 = (void *)MEMORY[0x227676638]();
      v134 = self;
      HMFGetOSLogHandle();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v136 = v32;
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v189 = v137;
        _os_log_impl(&dword_2218F0000, v135, OS_LOG_TYPE_ERROR, "%{public}@Failed to set local pairing identity", buf, 0xCu);

        v32 = v136;
      }

      objc_autoreleasePoolPop(v133);
      if (v184)
      {
        v130 = *v184;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 16, CFSTR("Failed to set local pairing identity"));
        v130 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v123 = 0;
      v124 = (void *)MEMORY[0x227676638]();
      v125 = self;
      HMFGetOSLogHandle();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v127 = v32;
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v189 = v128;
        _os_log_impl(&dword_2218F0000, v126, OS_LOG_TYPE_ERROR, "%{public}@Request missing pairing identity", buf, 0xCu);

        v32 = v127;
      }

      objc_autoreleasePoolPop(v124);
      if (!v184)
      {
        v132 = v179;
        v138 = 0;
LABEL_87:
        v107 = v15;
        v140 = v15;
        v108 = v19;
        objc_msgSend(v140, "markSetupEndStage:error:", 3, v19);

        v99 = 0;
        v131 = v183;
LABEL_113:

        v19 = v108;
        v15 = v107;
        goto LABEL_114;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v129 = (id)objc_claimAutoreleasedReturnValue();
      *v184 = v129;
      v130 = v129;
    }
    v139 = v130;
    v138 = v123;

    v19 = v139;
    v132 = v179;
    goto LABEL_87;
  }
  v16 = (void *)MEMORY[0x24BDD1620];
  +[HMDDeviceSetupClientSession allowedClasses](HMDDeviceSetupClientSession, "allowedClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = 0;
  objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", v17, v12, &v187);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v187;

  if (v18)
  {
    v174 = a6;
    v175 = a5;
    v180 = v14;
    v20 = v12;
    v21 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v23;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v189 = v28;
      v190 = 2112;
      v191 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

      v23 = v27;
    }

    objc_autoreleasePoolPop(v24);
    objc_msgSend(v23, "hmf_numberForKey:", CFSTR("st"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");
    if (v30 == -[HMDDeviceSetupSessionInternal state](v25, "state"))
    {

      v12 = v20;
      v14 = v180;
      v31 = v27;
      a5 = v175;
      goto LABEL_13;
    }
    v100 = (void *)MEMORY[0x227676638]();
    v101 = v25;
    HMFGetOSLogHandle();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = -[HMDDeviceSetupSessionInternal state](v101, "state");
      *(_DWORD *)buf = 138543874;
      v189 = v103;
      v190 = 2112;
      v191 = v29;
      v192 = 2048;
      v193 = v104;
      _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v100);
    if (v184)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v105 = (id)objc_claimAutoreleasedReturnValue();
      *v184 = v105;
      v106 = v105;

      v19 = v106;
    }
    v12 = v20;
    objc_msgSend(v15, "markSetupBeginStage:error:", 3, v19);

    v99 = 0;
    v14 = v180;
  }
  else
  {
    v95 = (void *)MEMORY[0x227676638]();
    v96 = self;
    HMFGetOSLogHandle();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v189 = v98;
      v190 = 2112;
      v191 = v19;
      _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v95);
    if (v184)
      *v184 = objc_retainAutorelease(v19);
    objc_msgSend(v15, "markSetupBeginStage:error:", 3, v19);
    v99 = 0;
  }
LABEL_114:

  return v99;
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

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupServerSession;
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
  if (logCategory__hmf_once_t72 != -1)
    dispatch_once(&logCategory__hmf_once_t72, &__block_literal_global_327);
  return (id)logCategory__hmf_once_v73;
}

void __42__HMDDeviceSetupServerSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v73;
  logCategory__hmf_once_v73 = v0;

}

@end
