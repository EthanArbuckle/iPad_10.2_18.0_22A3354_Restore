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
  id v12;
  NSObject *logger;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  HMDDeviceSetupClientSession *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  HMDDeviceSetupClientSession *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDDeviceSetupClientSession *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  BOOL v50;
  void *v51;
  HMDDeviceSetupClientSession *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  HMDDeviceSetupClientSession *v59;
  NSObject *v60;
  void *v61;
  id v62;
  char isKindOfClass;
  void *v64;
  id *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  HMDDeviceSetupClientSession *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  HMDDeviceSetupClientSession *v77;
  NSObject *v78;
  void *v79;
  HMDDeviceSetupClientSession *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  HMDDeviceSetupClientSession *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  HMDDeviceSetupClientSession *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  HMDDeviceSetupClientSession *v100;
  NSObject *v101;
  void *v102;
  void *v104;
  HMDHomeKitVersion *v105;
  id *v106;
  id v107;
  HMDDeviceSetupClientSession *v108;
  void *v109;
  HMDDeviceSetupClientSession *v110;
  id *v111;
  void *v112;
  void *v113;
  id *v114;
  id *v115;
  id *v116;
  id *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  const __CFString *v122;
  void *v123;
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  unint64_t v127;
  __int16 v128;
  uint64_t v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientDeviceSessionProcess", ", buf, 2u);
  }
  if (!v12)
  {
    v18 = 0;
LABEL_13:
    -[HMDDeviceSetupSessionInternal homeManager](self, "homeManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HMDDeviceSetupSessionInternal state](self, "state");
    if (v30 == 2)
    {
      if (v18)
      {
        v111 = a5;
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ac"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v57 = v56;
        else
          v57 = 0;
        v31 = v57;

        if (v31)
        {
          v115 = a6;
          v117 = a4;
          v119 = v12;
          v106 = a7;
          v58 = (void *)MEMORY[0x1D17BA0A0]();
          v108 = self;
          v59 = self;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v125 = v61;
            v126 = 2112;
            v127 = (unint64_t)v31;
            _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory description: %@", buf, 0x16u);

          }
          v110 = v59;

          objc_autoreleasePoolPop(v58);
          v62 = v31;
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            v64 = v62;
          else
            v64 = 0;
          v107 = v64;

          v65 = v117;
          v12 = v119;
          if ((isKindOfClass & 1) != 0)
          {
            v113 = v29;
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("hk"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v67 = v66;
            else
              v67 = 0;
            v68 = v67;

            v109 = v62;
            v104 = v68;
            if (v68)
              v105 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v68, v68);
            else
              v105 = 0;
            v76 = (void *)MEMORY[0x1D17BA0A0]();
            v77 = v110;
            HMFGetOSLogHandle();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v125 = v79;
              v126 = 2112;
              v127 = (unint64_t)v105;
              _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@Received accessory HomeKit version: %@", buf, 0x16u);

            }
            v80 = v77;

            objc_autoreleasePoolPop(v76);
            v81 = +[HMDDeviceCapabilities supportedPairingCapabilities](HMDDeviceCapabilities, "supportedPairingCapabilities");
            objc_msgSend(v109, "minimumRequiredPairingSoftwareVersion");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
            {
              +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "minimumRequiredPairingSoftwareVersion");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v83, "isAtLeastVersion:", v84);

            }
            else
            {
              v85 = 1;
            }
            v29 = v113;

            v86 = (void *)MEMORY[0x1D17BA0A0]();
            v87 = v80;
            HMFGetOSLogHandle();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v125 = v89;
              v126 = 2048;
              v127 = v81;
              v128 = 2112;
              v129 = (uint64_t)v90;
              _os_log_impl(&dword_1CD062000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@Our pairing capabilities: 0x%lx, minimum software version satisfied: %@", buf, 0x20u);

              v29 = v113;
            }

            objc_autoreleasePoolPop(v86);
            if ((objc_msgSend(v109, "canPairGivenCapabilities:", v81) & v85 & 1) == 0)
            {
              v99 = (void *)MEMORY[0x1D17BA0A0]();
              v100 = v87;
              HMFGetOSLogHandle();
              v101 = objc_claimAutoreleasedReturnValue();
              v12 = v119;
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v125 = v102;
                _os_log_impl(&dword_1CD062000, v101, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair as current device doesn't have all required capabilities.", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v99);
              if (v106)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
                *v106 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_85;
            }
            v12 = v119;
            v62 = v109;
            if (v115)
            {
              objc_msgSend(v109, "idsIdentifierString");
              *v115 = (id)objc_claimAutoreleasedReturnValue();
            }

            v65 = v117;
          }
          objc_msgSend(v28, "accessoryBrowser", v104);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "addUnassociatedAccessory:forDeviceSetup:", v62, 1);

          if (v65)
          {
            objc_msgSend(v62, "uuid");
            *v65 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (v111)
          {
            objc_msgSend(v62, "category");
            *v111 = (id)objc_claimAutoreleasedReturnValue();
          }
          encodeRootObjectForIncomingXPCMessage(v62, 0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = CFSTR("kAccessoryDataKey");
          v123 = v92;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDeviceSetupSessionInternal setUserInfo:](v110, "setUserInfo:", v93);

          self = v108;
        }
        -[HMDDeviceSetupSessionInternal setState:](self, "setState:", 3);
LABEL_75:

        if (-[HMDDeviceSetupSessionInternal state](self, "state") != 3)
        {
          v94 = (void *)MEMORY[0x1D17BA0A0]();
          v95 = self;
          HMFGetOSLogHandle();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v125 = v97;
            v126 = 2112;
            v127 = (unint64_t)v29;
            _os_log_impl(&dword_1CD062000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Response: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v94);
          encodeRootObjectForRemote(v29, 0, 0);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDeviceSetupSessionInternal setSessionData:](v95, "setSessionData:", v98);

        }
        v50 = 1;
        goto LABEL_86;
      }
      v71 = (void *)MEMORY[0x1D17BA0A0]();
      v72 = self;
      HMFGetOSLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[HMDDeviceSetupSessionInternal state](v72, "state");
        *(_DWORD *)buf = 138543618;
        v125 = v74;
        v126 = 2048;
        v127 = v75;
        _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid request state: %tu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v71);
      if (a7)
      {
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v70 = 58;
        goto LABEL_56;
      }
    }
    else
    {
      if (v30 == 1)
      {
        v120 = 0;
        objc_msgSend(v28, "getOrCreateLocalPairingIdentity:", &v120);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = v120;
        if (!v32 && v31)
        {
          v33 = v12;
          v112 = v29;
          v34 = (void *)MEMORY[0x1D17BA0A0]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v125 = v37;
            v126 = 2112;
            v127 = (unint64_t)v31;
            _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Sending local pairing identity: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v34);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDDeviceSetupSessionInternal state](v35, "state"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v38, CFSTR("st"));

          objc_msgSend(v112, "setObject:forKeyedSubscript:", v31, CFSTR("pi"));
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v28, "hh2FrameworkSwitch");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "numberWithBool:", objc_msgSend(v40, "checkExistenceOfHH2SentinelZone"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v41, CFSTR("sz.hh2"));

          -[HMDDeviceSetupClientSession sessionIdentifier](v35, "sessionIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "UUIDString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v35;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v125 = v47;
            v126 = 2112;
            v127 = (unint64_t)v43;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup session identifier %@ as part of payload", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v44);
          v29 = v112;
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v43, CFSTR("session.id"));
          -[HMDDeviceSetupSessionInternal setState:](v45, "setState:", 2);

          v12 = v33;
          goto LABEL_75;
        }

        goto LABEL_85;
      }
      if (a7)
      {
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v70 = 23;
LABEL_56:
        objc_msgSend(v69, "hmErrorWithCode:", v70);
        v50 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

        goto LABEL_87;
      }
    }
LABEL_85:
    v50 = 0;
    goto LABEL_86;
  }
  v114 = a6;
  v116 = a4;
  v14 = (void *)MEMORY[0x1E0CB3710];
  +[HMDDeviceSetupServerSession allowedClasses](HMDDeviceSetupServerSession, "allowedClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  v118 = v12;
  objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", v15, v12, &v121);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v121;

  v18 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v125 = v25;
      v126 = 2112;
      v127 = (unint64_t)v20;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Processing request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v20, "hmf_numberForKey:", CFSTR("st"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");
    if (v27 == -[HMDDeviceSetupSessionInternal state](v22, "state"))
    {

      a4 = v116;
      v12 = v118;
      a6 = v114;
      goto LABEL_13;
    }
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = v22;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[HMDDeviceSetupSessionInternal state](v52, "state");
      *(_DWORD *)buf = 138543874;
      v125 = v54;
      v126 = 2112;
      v127 = (unint64_t)v26;
      v128 = 2048;
      v129 = v55;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Request state number, %@, does not match expected state number: %tu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v51);
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v50 = 0;
    v28 = v17;
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v125 = v48;
      v126 = 2112;
      v127 = (unint64_t)v17;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive request payload from data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    if (a7)
    {
      v49 = objc_retainAutorelease(v17);
      v50 = 0;
      v28 = v18;
      *a7 = v49;
      v18 = v49;
    }
    else
    {
      v50 = 0;
      v28 = v18;
      v18 = v17;
    }
  }
  v12 = v118;
LABEL_87:

  return v50;
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

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDDeviceSetupClientSession;
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
  if (logCategory__hmf_once_t40 != -1)
    dispatch_once(&logCategory__hmf_once_t40, &__block_literal_global_298);
  return (id)logCategory__hmf_once_v41;
}

void __42__HMDDeviceSetupClientSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v41;
  logCategory__hmf_once_v41 = v0;

}

@end
