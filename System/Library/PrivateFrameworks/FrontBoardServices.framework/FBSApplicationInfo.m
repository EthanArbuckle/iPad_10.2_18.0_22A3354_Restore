@implementation FBSApplicationInfo

- (BOOL)isBlockedForScreenTimeExpiration
{
  return -[FBSApplicationInfo screenTimePolicy](self, "screenTimePolicy") != 0;
}

- (int64_t)screenTimePolicy
{
  return self->_screenTimePolicy;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (BOOL)hasViewServicesEntitlement
{
  return self->_hasViewServicesEntitlement;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (BOOL)builtOnOrAfterSDKVersion:(id)a3
{
  NSString *sdkVersion;

  sdkVersion = self->_sdkVersion;
  if (sdkVersion)
    LOBYTE(sdkVersion) = (unint64_t)-[NSString compare:options:](sdkVersion, "compare:options:", a3, 64) < 2;
  return (char)sdkVersion;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (unint64_t)unauthoritativeTrustState
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "trustStateForApplication:", self);

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isProvisioningProfileValidated
{
  return self->_provisioningProfileValidated;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (LSApplicationIdentity)applicationIdentity
{
  return self->_applicationIdentity;
}

- (float)minimumBrightnessLevel
{
  return self->_minimumBrightnessLevel;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (BOOL)supportsInterfaceOrientation:(int64_t)a3
{
  return (self->_supportedInterfaceOrientations & (1 << a3)) != 0;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (BOOL)_isUninstalling
{
  return self->_uninstalling;
}

- (BOOL)_isPendingUninstall
{
  return self->_pendingUninstall;
}

- (BOOL)_isInstalling
{
  return self->_installing;
}

- (void)_synchronize:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_lock = &self->_lock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_lock);
    v4[2](v4);

    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSApplicationInfo *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this initializer is unavailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSApplicationInfo.m");
    v22 = 1024;
    v23 = 72;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSApplicationInfo *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this initializer is unavailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSApplicationInfo.m");
    v22 = 1024;
    v23 = 77;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBSApplicationInfo)initWithApplicationProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FBSApplicationInfo *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x19AECA15C]();
  objc_msgSend(v4, "fbs_correspondingApplicationRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fbs_processIdentityForApplicationIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (FBSApplicationInfo *)-[FBSApplicationInfo _initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:](self, "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v4, v6, v8, v9, 0);

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (FBSApplicationInfo)initWithApplicationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FBSApplicationInfo *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x19AECA15C]();
  objc_msgSend(v4, "fbs_correspondingApplicationProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fbs_processIdentityForApplicationIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (FBSApplicationInfo *)-[FBSApplicationInfo _initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:](self, "_initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:", v6, v4, v8, v9, 0);

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)_initWithApplicationProxy:(id)a3 record:(id)a4 appIdentity:(id)a5 processIdentity:(id)a6 overrideURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  _DWORD *v20;
  _DWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  _DWORD *v100;
  id v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *context;
  id v110;
  id v111;
  void *v112;
  objc_super v113;
  uint8_t buf[4];
  id v115;
  __int16 v116;
  id v117;
  __int16 v118;
  id v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v110 = a7;
  context = (void *)MEMORY[0x19AECA15C]();
  if (_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL__onceToken != -1)
    dispatch_once(&_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL__onceToken, &__block_literal_global_6);
  objc_msgSend(v13, "bundleURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17
    || (objc_msgSend(v13, "appState"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isValid"),
        v18,
        !v16)
    || !v15
    || !v14
    || (v19 & 1) == 0)
  {
    if (v110)
    {
      v102 = v110;

    }
    FBSLogApplicationLibrary();
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v115 = v13;
      v116 = 2114;
      v117 = v14;
      v118 = 2114;
      v119 = v15;
      v120 = 2114;
      v121 = v16;
      _os_log_error_impl(&dword_19A6D4000, v103, OS_LOG_TYPE_ERROR, "Invalid application proxy %{public}@, record %{public}@, app identity %{public}@, or process identity %{public}@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Application Proxy provided"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationInfo _initWithApplicationProxy:record:appIdentity:processIdentity:overrideURL:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v104), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6FDB0CLL);
  }
  v112 = v16;
  v113.receiver = self;
  v113.super_class = (Class)FBSApplicationInfo;
  v20 = -[FBSBundleInfo _initWithBundleProxy:overrideURL:](&v113, sel__initWithBundleProxy_overrideURL_, v13, v17);
  v21 = v20;
  if (v20)
  {
    v108 = v15;
    v111 = v14;
    v20[22] = 0;
    objc_msgSend(v13, "objectsForInfoDictionaryKeys:", _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entitlementValuesForKeys:", _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v21 + 27) = +[FBSApplicationInfo _applicationTypeForProxy:](FBSApplicationInfo, "_applicationTypeForProxy:", v13);
    objc_storeStrong((id *)v21 + 14, a5);
    v24 = objc_msgSend(v112, "copy");
    v25 = (void *)*((_QWORD *)v21 + 15);
    *((_QWORD *)v21 + 15) = v24;

    objc_msgSend(v13, "canonicalExecutablePath");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v26, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)*((_QWORD *)v21 + 16);
      *((_QWORD *)v21 + 16) = v27;

    }
    objc_msgSend(v13, "bundleContainerURL");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v21 + 17);
    *((_QWORD *)v21 + 17) = v29;

    objc_msgSend(v13, "dataContainerURL");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v21 + 18);
    *((_QWORD *)v21 + 18) = v31;

    v21[18] = objc_msgSend(v14, "codeSignatureVersion");
    objc_msgSend(v17, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    BSModificationDateForPath();
    *((_QWORD *)v21 + 20) = v34;

    *((_BYTE *)v21 + 94) = objc_msgSend(v13, "profileValidated");
    *((_BYTE *)v21 + 95) = objc_msgSend(v13, "UPPValidated");
    *((_BYTE *)v21 + 96) = objc_msgSend(v13, "freeProfileValidated");
    objc_msgSend(v22, "numberForKey:", CFSTR("disabled"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v21 + 98) = objc_msgSend(v35, "BOOLValue") ^ 1;

    objc_msgSend(v13, "appState");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v21 + 99) = objc_msgSend(v105, "isRestricted");
    *((_BYTE *)v21 + 100) = 0;
    objc_msgSend(v13, "teamID");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v21 + 22);
    *((_QWORD *)v21 + 22) = v36;

    objc_msgSend(v13, "signerIdentity");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v21 + 23);
    *((_QWORD *)v21 + 23) = v38;

    *((_BYTE *)v21 + 101) = objc_msgSend(v13, "isBetaApp");
    v40 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v13, "UIBackgroundModes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "initWithArray:", v41);
    v43 = (void *)*((_QWORD *)v21 + 10);
    *((_QWORD *)v21 + 10) = v42;

    objc_msgSend(v13, "deviceFamily");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)*((_QWORD *)v21 + 29);
    *((_QWORD *)v21 + 29) = v44;

    objc_msgSend(v13, "appTags");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "count"))
    {
      objc_msgSend(v13, "appTags");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }

    objc_msgSend(v13, "applicationType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isEqual:", *MEMORY[0x1E0CA57E8]);

    v106 = (void *)v26;
    if (v49)
    {
      if (v47)
      {
        objc_msgSend(v47, "arrayByAddingObject:", CFSTR("hidden"));
        v50 = objc_claimAutoreleasedReturnValue();

        v47 = (void *)v50;
      }
      else
      {
        v47 = &unk_1E390C3D8;
      }
    }
    objc_storeStrong((id *)v21 + 30, v47);
    objc_msgSend(v13, "requiredDeviceCapabilities");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v21 + 28);
    *((_QWORD *)v21 + 28) = v51;

    objc_msgSend(v13, "ratingRank");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v21 + 36) = objc_msgSend(v53, "integerValue");

    objc_msgSend(v13, "itemID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "copy");
    v56 = (void *)*((_QWORD *)v21 + 37);
    *((_QWORD *)v21 + 37) = v55;

    objc_msgSend(v13, "purchaserDSID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "copy");
    v59 = (void *)*((_QWORD *)v21 + 38);
    *((_QWORD *)v21 + 38) = v58;

    objc_msgSend(v13, "downloaderDSID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "copy");
    v62 = (void *)*((_QWORD *)v21 + 39);
    *((_QWORD *)v21 + 39) = v61;

    *((_QWORD *)v21 + 32) = 1;
    *((_QWORD *)v21 + 33) = 2;
    objc_msgSend(v22, "numberForKey:", CFSTR("UIRequiresPersistentWiFi"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v21 + 102) = objc_msgSend(v63, "BOOLValue");

    objc_msgSend(v13, "sdkVersion");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "copy");
    v66 = (void *)*((_QWORD *)v21 + 25);
    *((_QWORD *)v21 + 25) = v65;

    objc_msgSend(v23, "objectForKey:", CFSTR("com.apple.UIKit.vends-view-services"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v21 + 93) = v67 != 0;

    v107 = v23;
    objc_msgSend(v23, "stringForKey:", CFSTR("application-identifier"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "copy");
    v70 = (void *)*((_QWORD *)v21 + 41);
    *((_QWORD *)v21 + 41) = v69;

    *((_QWORD *)v21 + 35) = objc_msgSend(v13, "deviceManagementPolicy");
    *((_BYTE *)v21 + 103) = objc_msgSend(v14, "wasBuiltWithThreadSanitizer");
    if (*((_QWORD *)v21 + 27) <= 1uLL)
    {
      objc_msgSend(v22, "numberForKey:", CFSTR("BKDisplayBrightnessAbsoluteOverride"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "floatValue");
      v21[27] = v72;

    }
    objc_msgSend(v22, "arrayForKey:", CFSTR("UISupportedExternalAccessoryProtocols"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bs_objectsOfClass:", objc_opt_class());
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v74, "count"))
      objc_storeStrong((id *)v21 + 34, v74);
    objc_msgSend(v13, "environmentVariables");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)v21 + 25))
      v76 = objc_msgSend(v21, "builtOnOrAfterSDKVersion:", CFSTR("4.0")) ^ 1;
    else
      v76 = 1;
    +[FBSApplicationInfo _configureEnvironment:withInfo:isPreApex:](FBSApplicationInfo, "_configureEnvironment:withInfo:isPreApex:", v75, v22, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "copy");
    v79 = (void *)*((_QWORD *)v21 + 24);
    *((_QWORD *)v21 + 24) = v78;

    objc_msgSend(*((id *)v21 + 24), "objectForKey:", CFSTR("CFFIXED_USER_HOME"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v80);
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = (void *)*((_QWORD *)v21 + 19);
      *((_QWORD *)v21 + 19) = v81;

      v83 = (void *)MEMORY[0x1E0CB3940];
      v84 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v21, "bundleIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "arrayWithObjects:", v80, CFSTR("Library"), CFSTR("Preferences"), v85, 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "pathWithComponents:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "copy");
      v89 = (void *)*((_QWORD *)v21 + 21);
      *((_QWORD *)v21 + 21) = v88;

    }
    else
    {
      objc_msgSend(v21, "bundleIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v85, "copy");
      v86 = (void *)*((_QWORD *)v21 + 21);
      *((_QWORD *)v21 + 21) = v90;
    }

    if (*((_QWORD *)v21 + 27) != 2)
    {
      objc_msgSend(v22, "arrayForKey:", CFSTR("SBMachServices"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "bs_objectsOfClass:", objc_opt_class());
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v92, "count"))
        objc_storeStrong((id *)v21 + 26, v92);

    }
    *((_BYTE *)v21 + 97) = objc_msgSend(v13, "supportsMultiwindow");
    objc_msgSend(v13, "shortVersionString");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "copy");
    v95 = (void *)*((_QWORD *)v21 + 31);
    *((_QWORD *)v21 + 31) = v94;

    objc_msgSend(v22, "stringForKey:", CFSTR("NSAdvertisingAttributionReportEndpoint"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v96);
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = (void *)*((_QWORD *)v21 + 40);
      *((_QWORD *)v21 + 40) = v97;

    }
    objc_msgSend(v21, "_loadFromProxy:", v13);
    objc_msgSend(v13, "fbs_correspondingApplicationRecord");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_loadFromRecord:", v99);

    *((_BYTE *)v21 + 92) = 1;
    v14 = v111;
    v15 = v108;
  }
  v100 = v21;

  objc_autoreleasePoolPop(context);
  return v100;
}

void __95__FBSApplicationInfo__initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("disabled"), CFSTR("UIInterfaceOrientation"), CFSTR("UISupportedInterfaceOrientations"), CFSTR("UIRequiresPersistentWiFi"), CFSTR("BKDisplayBrightnessAbsoluteOverride"), CFSTR("UISupportedExternalAccessoryProtocols"), CFSTR("MallocBehavior"), CFSTR("SBMachServices"), CFSTR("NSAdvertisingAttributionReportEndpoint"), 0);
  v1 = (void *)_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys;
  _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____infoKeys = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.UIKit.vends-view-services"), CFSTR("application-identifier"), 0);
  v3 = (void *)_initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys;
  _initWithApplicationProxy_record_appIdentity_processIdentity_overrideURL____entitlementKeys = v2;

}

- (NSDictionary)entitlements
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__FBSApplicationInfo_entitlements__block_invoke;
  v4[3] = &unk_1E38EAE78;
  v4[4] = self;
  -[FBSApplicationInfo _synchronize:](self, "_synchronize:", v4);
  return self->_lazy_entitlements;
}

void __34__FBSApplicationInfo_entitlements__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[8])
  {
    v3 = (void *)MEMORY[0x1E0CA5860];
    objc_msgSend(v1, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationProxyForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    FBSLogApplicationLibrary();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*v2, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_19A6D4000, v7, OS_LOG_TYPE_INFO, "inefficient loading of all entitlements for '%@'", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(v5, "entitlements");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (v9)
        v10 = (void *)v9;
      else
        v10 = (void *)MEMORY[0x1E0C9AA70];
      objc_storeStrong((id *)*v2 + 8, v10);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __34__FBSApplicationInfo_entitlements__block_invoke_cold_1(v2, v7);
    }

  }
}

- (id)folderNames
{
  return 0;
}

- (id)fallbackFolderName
{
  return 0;
}

- (unsigned)signatureVersion
{
  return self->_signatureVersion;
}

- (BOOL)isExitsOnSuspend
{
  return 0;
}

- (BOOL)supportsBackgroundMode:(id)a3
{
  return -[NSSet containsObject:](self->_backgroundModes, "containsObject:", a3);
}

- (BOOL)supportsAllInterfaceOrientations
{
  return (~LODWORD(self->_supportedInterfaceOrientations) & 0x1ELL) == 0;
}

- (BOOL)supportsDeviceFamily:(unint64_t)a3
{
  NSArray *deviceFamilies;
  void *v4;

  deviceFamilies = self->_deviceFamilies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceFamilies) = -[NSArray containsObject:](deviceFamilies, "containsObject:", v4);

  return (char)deviceFamilies;
}

- (void)_overrideTags:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *tags;
  void *v8;
  id v9;

  v5 = a3;
  if (self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can not call this method after initialization has finished"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationInfo _overrideTags:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v9 = v5;
    if ((BSEqualObjects() & 1) == 0)
    {
      v6 = (NSArray *)objc_msgSend(v9, "copy");
      tags = self->_tags;
      self->_tags = v6;

    }
  }
}

+ (unint64_t)_applicationTypeForProxy:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "applicationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CA5820]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CA57E8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CA57F0]))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

+ (unint64_t)_applicationTypeForRecord:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "fbs_correspondingApplicationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "_applicationTypeForProxy:", v4);

  return v5;
}

+ (id)_configureEnvironment:(id)a3 withInfo:(id)a4 isPreApex:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __63__FBSApplicationInfo__configureEnvironment_withInfo_isPreApex___block_invoke;
  v23 = &unk_1E38EAEA0;
  v25 = &v26;
  v9 = v7;
  v24 = v9;
  v10 = MEMORY[0x19AECA324](&v20);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v5)
    (*(void (**)(uint64_t, const __CFString *, const __CFString *))(v10 + 16))(v10, CFSTR("MallocCorruptionAbort"), CFSTR("0"));
  objc_msgSend(v8, "dictionaryForKey:", CFSTR("MallocBehavior"), v20, v21, v22, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "bs_safeNumberForKey:", CFSTR("NanoAllocator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "BOOLValue"))
        v16 = CFSTR("1");
      else
        v16 = CFSTR("0");
      ((void (**)(_QWORD, const __CFString *, const __CFString *))v11)[2](v11, CFSTR("MallocNanoZone"), v16);
    }

  }
  v17 = (void *)v27[5];
  if (!v17)
    v17 = v9;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __63__FBSApplicationInfo__configureEnvironment_withInfo_isPreApex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v6, "setObject:forKey:", v5, v10);

}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBSApplicationInfo;
  -[FBSBundleInfo succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationIdentity fbs_personaUniqueString](self->_applicationIdentity, "fbs_personaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LSApplicationIdentity fbs_personaUniqueString](self->_applicationIdentity, "fbs_personaUniqueString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("persona"));

  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSApplicationInfo *v11;

  v4 = a3;
  -[FBSApplicationInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FBSApplicationInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __60__FBSApplicationInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sdkVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("sdk"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "signerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("signerIdentity"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleContainerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v10, CFSTR("bundleContainer"), 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataContainerURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v14, CFSTR("dataContainer"), 1);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "tags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendArraySection:withName:skipIfEmpty:", v17, CFSTR("tags"), 1);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customMachServices");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendArraySection:withName:skipIfEmpty:", v19, CFSTR("machServices"), 1);

}

- (NSURL)sandboxURL
{
  return self->_sandboxURL;
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)preferenceDomain
{
  return self->_preferenceDomain;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)isUPPProvisioningProfileValidated
{
  return self->_uppProvisioningProfileValidated;
}

- (BOOL)isFreeDeveloperProvisioningProfileValidated
{
  return self->_freeDeveloperProvisioningProfileValidated;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSArray)customMachServices
{
  return self->_customMachServices;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (BOOL)requiresPersistentWiFi
{
  return self->_requiresPersistentWiFi;
}

- (NSArray)externalAccessoryProtocols
{
  return self->_externalAccessoryProtocols;
}

- (int64_t)ratingRank
{
  return self->_ratingRank;
}

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (NSNumber)downloaderDSID
{
  return self->_downloaderDSID;
}

- (BOOL)wasBuiltWithTSAN
{
  return self->_builtWithTSAN;
}

- (NSURL)advertisingAttributionReportEndpoint
{
  return self->_advertisingAttributionReportEndpoint;
}

- (NSString)_appIDEntitlement
{
  return self->_appIDEntitlement;
}

- (void)_setInstalling:(BOOL)a3
{
  self->_installing = a3;
}

- (void)_setUninstalling:(BOOL)a3
{
  self->_uninstalling = a3;
}

- (void)_setPendingUninstall:(BOOL)a3
{
  self->_pendingUninstall = a3;
}

- (BOOL)_isTentativeUninstall
{
  return self->_tentativeUninstall;
}

- (void)_setTentativeUninstall:(BOOL)a3
{
  self->_tentativeUninstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIDEntitlement, 0);
  objc_storeStrong((id *)&self->_advertisingAttributionReportEndpoint, 0);
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalAccessoryProtocols, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_customMachServices, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_preferenceDomain, 0);
  objc_storeStrong((id *)&self->_sandboxURL, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_backgroundModes, 0);
  objc_storeStrong((id *)&self->_lazy_entitlements, 0);
}

- (BOOL)isSignatureVersionSupported
{
  unsigned int v2;

  v2 = -[FBSApplicationInfo signatureVersion](self, "signatureVersion");
  return v2 >= getkMISMinSupportedSignatureVersion();
}

- (BOOL)isSignatureVersionSupportEndingSoon
{
  unsigned int v2;

  v2 = -[FBSApplicationInfo signatureVersion](self, "signatureVersion");
  return v2 < getkMISFutureMinSupportedSignatureVersion();
}

- (void)setCachedCDHashInfo:(id)a3
{
  objc_setAssociatedObject(self, "_fb_cachedCDHashInfo", a3, (void *)0x301);
}

- (_FBSCDHashCacheInfo)cachedCDHashInfo
{
  return (_FBSCDHashCacheInfo *)objc_getAssociatedObject(self, "_fb_cachedCDHashInfo");
}

- (void)_initWithApplicationProxy:(const char *)a1 record:appIdentity:processIdentity:overrideURL:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __34__FBSApplicationInfo_entitlements__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "failed to load entitlements for '%@' because we could not find the proxy", (uint8_t *)&v4, 0xCu);

}

- (void)_overrideTags:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
