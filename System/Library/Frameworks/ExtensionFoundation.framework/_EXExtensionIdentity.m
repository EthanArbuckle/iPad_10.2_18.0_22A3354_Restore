@implementation _EXExtensionIdentity

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[_EXExtensionIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("extensionPointIdentifier"));

  -[_EXExtensionIdentity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[_EXExtensionIdentity bundleVersion](self, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("bundleVersion"));

  -[_EXExtensionIdentity containingBundleRecord](self, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("containingBundleRecordIdentifier"));

  objc_msgSend(v18, "encodeInt32:forKey:", -[_EXExtensionIdentity platform](self, "platform"), CFSTR("platform"));
  -[_EXExtensionIdentity UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("UUID"));

  -[_EXExtensionIdentity localizedName](self, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("localizedName"));

  -[_EXExtensionIdentity developerName](self, "developerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("developerName"));

  -[_EXExtensionIdentity url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("url"));

  -[_EXExtensionIdentity containingURL](self, "containingURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("containingURL"));

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("sdkDictionary"));

  -[_EXExtensionIdentity extensionDictionary](self, "extensionDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("extensionDictionary"));

  -[_EXExtensionIdentity attributes](self, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("attributes"));

  -[_EXExtensionIdentity entitlements](self, "entitlements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("entitlements"));

  objc_msgSend(v18, "encodeInteger:forKey:", -[_EXExtensionIdentity userElection](self, "userElection"), CFSTR("userElection"));
  objc_msgSend(v18, "encodeInteger:forKey:", -[_EXExtensionIdentity defaultUserElection](self, "defaultUserElection"), CFSTR("defaultUserElection"));
  objc_msgSend(v18, "encodeBool:forKey:", -[_EXExtensionIdentity isSystemComponent](self, "isSystemComponent"), CFSTR("isSystemComponent"));

}

- (BOOL)isEqual:(id)a3
{
  _EXExtensionIdentity *v4;
  BOOL v5;

  v4 = (_EXExtensionIdentity *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_EXExtensionIdentity isEqualToExtension:](self, "isEqualToExtension:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_EXExtensionIdentity UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_EXExtensionIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (_EXExtensionIdentity)initWithServiceIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  _EXExtensionRecordIdentity *v17;
  NSObject *v18;
  _EXExtensionIdentity *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = self;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v7, "applicationExtensionRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_msgSend(v13, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v13;

      self = v20;
      if (v16)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      self = v20;
    }
  }
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:requireValid:platform:error:", v6, 1, dyld_get_active_platform(), a4);
  if (v16)
  {
LABEL_13:
    v17 = -[_EXExtensionRecordIdentity initWithApplicationExtensionRecord:]([_EXExtensionRecordIdentity alloc], "initWithApplicationExtensionRecord:", v16);
  }
  else
  {
    _EXDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_EXExtensionIdentity initWithServiceIdentifier:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 5, MEMORY[0x1E0C9AA70]);
      v16 = 0;
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
  }

  return &v17->super;
}

- (_EXExtensionIdentity)initWithApplicationExtensionRecord:(id)a3
{
  id v4;
  _EXExtensionRecordIdentity *v5;

  v4 = a3;
  v5 = -[_EXExtensionRecordIdentity initWithApplicationExtensionRecord:]([_EXExtensionRecordIdentity alloc], "initWithApplicationExtensionRecord:", v4);

  return &v5->super;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXExtensionIdentity;
  return -[_EXExtensionIdentity init](&v3, sel_init);
}

- (id)xpcOverlayDictionaryOverridingSandboxProfileName:(id)a3 multiInstance:(BOOL)a4 arguments:(id)a5 additionalEnvironment:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id result;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  void *v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  const __CFString *v83;
  uint64_t v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  const __CFString *v89;
  _QWORD v90[3];

  v57 = a4;
  v90[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("XPCService"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = -[_EXExtensionIdentity type](self, "type");
  v56 = v10;
  v59 = v12;
  v60 = v11;
  if (-[_EXExtensionIdentity launchesViaExtensionKitService](self, "launchesViaExtensionKitService"))
  {
    v16 = 0;
  }
  else
  {
    v89 = CFSTR("RunningBoard");
    v17 = MEMORY[0x1E0C9AAB0];
    v87[1] = CFSTR("LaunchRequestEndpointIdentifiers");
    v88[0] = MEMORY[0x1E0C9AAB0];
    v87[0] = CFSTR("Backoff");
    v85[0] = CFSTR("com.apple.frontboard.workspace-service");
    -[_EXExtensionIdentity configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v19;
    -[_EXExtensionIdentity configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serviceName");
    v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v22;
    v86[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
    v25 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v25;
    v9 = v21;
    v12 = v59;
    v11 = v60;

  }
  v26 = CFSTR("NSRunLoop");
  switch(v62)
  {
    case 0uLL:
      v83 = CFSTR("extensionkit.internal");
      v84 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      if (-[_EXExtensionIdentity performsUserInteractiveWork](self, "performsUserInteractiveWork"))
        v26 = CFSTR("_UIApplicationMain");
      v27 = &unk_1E2D15908;
      v28 = &unk_1E2D158E0;
      break;
    case 2uLL:
      v81[0] = CFSTR("viewbridge");
      v81[1] = CFSTR("extensionkit.internal");
      v82[0] = MEMORY[0x1E0C9AAB0];
      v82[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("_NSApplicationMain");
      v28 = &unk_1E2D159A8;
      break;
    case 3uLL:
    case 4uLL:
      v79[0] = CFSTR("viewservice");
      v79[1] = CFSTR("extensionkit.internal");
      v80[0] = MEMORY[0x1E0C9AAB0];
      v80[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("_UIApplicationMain");
      v28 = &unk_1E2D15A20;
      break;
    case 5uLL:
    case 6uLL:
      v77[0] = CFSTR("viewbridge");
      v77[1] = CFSTR("viewservice");
      v78[0] = MEMORY[0x1E0C9AAB0];
      v78[1] = MEMORY[0x1E0C9AAB0];
      v77[2] = CFSTR("extensionkit.internal");
      v78[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("_UIApplicationMain");
      v28 = &unk_1E2D15A98;
      break;
    case 7uLL:
      if (!v16)
        v16 = &unk_1E2D15AE8;
      v26 = CFSTR("_UIApplicationMain");
      v27 = (void *)MEMORY[0x1E0C9AA70];
      v28 = &unk_1E2D15B60;
      break;
    case 8uLL:
      v28 = (void *)MEMORY[0x1E0C9AA70];
      v27 = &unk_1E2D15930;
      break;
    default:
      v27 = 0;
LABEL_9:
      v28 = (void *)MEMORY[0x1E0C9AA70];
      break;
  }
  v61 = v27;
  v75[0] = CFSTR("ServiceType");
  v75[1] = CFSTR("RunLoopType");
  v76[0] = CFSTR("Application");
  v76[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v29);

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "forceSandbox") & 1) != 0)
  {

  }
  else
  {
    v31 = -[_EXExtensionIdentity hasSandboxEntitlement](self, "hasSandboxEntitlement");

    if (!v31)
    {
LABEL_25:
      if (v9)
      {
        _EXDefaultLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.4();

        objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("_SandboxProfile"));
      }
      if (v57)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MultipleInstances"));
      if (-[_EXExtensionIdentity requiresHostToBeContainerApp](self, "requiresHostToBeContainerApp"))
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("_AbandonCoalition"));
      if (v16)
      {
        v73 = CFSTR("_AdditionalProperties");
        v74 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v36);

      }
      if (v61)
      {
        v71 = CFSTR("_AdditionalSubServices");
        v72 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v37);

      }
      objc_msgSend(v12, "_EX_stringForKey:", CFSTR("EXProcessType"));
      v38 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v38;
      if (v38)
      {
        v69 = CFSTR("_ProcessType");
        v70 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v39);

      }
      if (v62 <= 7 && ((1 << v62) & 0xA8) != 0)
        objc_msgSend(v15, "addEntriesFromDictionary:", &unk_1E2D15B88);
      v54 = v16;
      v55 = v9;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EnvironmentVariables"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        objc_msgSend(v40, "addEntriesFromDictionary:", v41);
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v28, 0, &v63);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v63;
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v42, 4);
      v44 = (void *)v43;
      if (v43)
      {
        v67 = CFSTR("BSServiceDomains");
        v68 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v45 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addEntriesFromDictionary:", v45);
      }
      else
      {
        _EXDefaultLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.3();
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v62);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v46, CFSTR("EXTENSION_KIT_EXTENSION_TYPE"));

      objc_msgSend(v15, "setObject:forKeyedSubscript:", v40, CFSTR("EnvironmentVariables"));
      if (-[_EXExtensionIdentity disableLaunchdCheckinTimeout](self, "disableLaunchdCheckinTimeout"))
        objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E2D15C00, CFSTR("_LaunchWatchdogTimeOut"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v56, CFSTR("ProgramArguments"));
      -[_EXExtensionIdentity configuration](self, "configuration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "serviceName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v49, CFSTR("_ManagedBy_Services"));

      v64[0] = CFSTR("CFBundlePackageType");
      v64[1] = CFSTR("XPCService");
      v65[0] = CFSTR("XPC!");
      v65[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _EXDefaultLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.2();

      return v50;
    }
  }
  -[_EXExtensionIdentity sandboxProfileName](self, "sandboxProfileName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _EXDefaultLog();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v32)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.5();

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("_SandboxProfile"));
    goto LABEL_25;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    -[_EXExtensionIdentity(Overlay) xpcOverlayDictionaryOverridingSandboxProfileName:multiInstance:arguments:additionalEnvironment:].cold.1(v34);

  __break(1u);
  return result;
}

- (BOOL)launchesViaExtensionKitService
{
  void *v3;
  char v4;

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inProcessLaunch");

  if ((v4 & 1) != 0)
    return 0;
  else
    return !-[_EXExtensionIdentity requiresLibXPCConnection](self, "requiresLibXPCConnection");
}

- (BOOL)requiresHostToBeContainerApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[_EXExtensionIdentity applicationExtensionRecord](self, "applicationExtensionRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionPointRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SDKDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_EX_dictionaryForKey:", CFSTR("_EXHostRequirements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "_EX_BOOLForKey:defaultValue:", CFSTR("_EXHostableByContainerAppOnly"), 0) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[_EXExtensionIdentity attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_EX_dictionaryForKey:", CFSTR("_EXHostRequirements"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v9, "_EX_BOOLForKey:defaultValue:", CFSTR("_EXHostableByContainerAppOnly"), 0);
  }

  return v7;
}

- (BOOL)presentsUserInterface
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXPresentsUserInterface"));

  return v3;
}

- (BOOL)requiresLibXPCConnection
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXRequiresLibXPCConnection"));

  return v3;
}

- (unint64_t)type
{
  if (-[_EXExtensionIdentity presentsUserInterface](self, "presentsUserInterface"))
  {
    if (-[_EXExtensionIdentity platform](self, "platform") == 1)
    {
      return 2;
    }
    else if (-[_EXExtensionIdentity requiresFBSceneHosting](self, "requiresFBSceneHosting"))
    {
      return 7;
    }
    else if (-[_EXExtensionIdentity(Configuration) requiresUIKitSceneHosting](self, "requiresUIKitSceneHosting"))
    {
      return 3;
    }
    else
    {
      return 4;
    }
  }
  else if (-[_EXExtensionIdentity requiresLibXPCConnection](self, "requiresLibXPCConnection"))
  {
    return 8;
  }
  else
  {
    return 1;
  }
}

- (NSString)sandboxProfileName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (-[_EXExtensionIdentity targetsSystemExtensionPoint](self, "targetsSystemExtensionPoint"))
  {
    -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_EX_stringForKey:", CFSTR("_EXSandboxProfileName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_EX_stringForKey:", CFSTR("EXSandboxProfileName"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_EX_dictionaryForKey:", CFSTR("NSExtension"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_EX_stringForKey:", CFSTR("NSExtensionSandboxProfile"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v4 = 0;
  }
  -[_EXExtensionIdentity entitlements](self, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_EX_stringForKey:", CFSTR("com.apple.private.extensionkit.sandbox-profile-name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    if (v4)
      goto LABEL_10;
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultSandboxProfileName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v4 = v11;
LABEL_10:

  return (NSString *)v4;
}

- (BOOL)disableLaunchdCheckinTimeout
{
  void *v3;
  char v4;
  void *v5;

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "disableLaunchdCheckinTimeout") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_EX_BOOLForKey:defaultValue:", CFSTR("EXDisableLaunchdCheckinTimeout"), 0);

  }
  return v4;
}

- (BOOL)performsUserInteractiveWork
{
  _BOOL4 v3;
  void *v4;
  char v5;

  if (-[_EXExtensionIdentity presentsUserInterface](self, "presentsUserInterface"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[_EXExtensionIdentity targetsSystemExtensionPoint](self, "targetsSystemExtensionPoint");
    if (v3)
    {
      -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_EX_BOOLForKey:defaultValue:", CFSTR("EXPerformsUserInteractiveWork"), 0);

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)targetsSystemExtensionPoint
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

+ (_EXExtensionIdentity)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[6];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38___EXExtensionIdentity_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (allocWithZone__onceToken != -1)
      dispatch_once(&allocWithZone__onceToken, block);
    return (_EXExtensionIdentity *)(id)allocWithZone__factory;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____EXExtensionIdentity;
    return (_EXExtensionIdentity *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (BOOL)requiresMultiInstance
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXRequiresMultiInstance"));

  return v3;
}

- (BOOL)requiresLegacyInfrastructure
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXRequiresLegacyInfrastructure"));

  return v3;
}

- (BOOL)requiresFBSceneHosting
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXRequiresSceneHosting"));

  return v3;
}

- (BOOL)requiresNetworkAttribution
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXRequiresNetworkAttribution"));

  return v3;
}

- (BOOL)supportsNSExtensionPlistKeys
{
  void *v2;
  char v3;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_EX_BOOLForKey:", CFSTR("EXSupportsNSExtensionPlistKeys"));

  return v3;
}

- (Class)principalClass
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  Class v9;
  void *v10;
  NSString *v11;
  objc_class *v12;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_EX_stringForKey:", CFSTR("EXExtensionPrincipalClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_EXExtensionIdentity attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_EX_stringForKey:", CFSTR("EXExtensionPrincipalClass"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[_EXExtensionIdentity attributes](self, "attributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EXPrincipalClass"));
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[_EXExtensionIdentity attributes](self, "attributes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EXAppExtensionDelegateClass"));
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          if (-[_EXExtensionIdentity supportsNSExtensionPlistKeys](self, "supportsNSExtensionPlistKeys"))
          {
            -[_EXExtensionIdentity extensionDictionary](self, "extensionDictionary");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "_EX_stringForKey:", CFSTR("NSExtensionPrincipalClass"));
            v4 = (NSString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v4 = 0;
          }
        }
      }
    }
  }
  v9 = NSClassFromString(v4);
  if (!v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", getprogname());
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(".%@"), v4);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    v9 = NSClassFromString(v11);
  }
  v12 = v9;

  return v12;
}

- (Class)extensionClass
{
  void *v3;
  NSString *v4;
  void *v5;
  Class v6;
  void *v7;
  void *v8;
  NSString *v9;
  __CFString *v10;
  objc_class *v11;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_EX_stringForKey:", CFSTR("EXAppExtensionClass"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[_EXExtensionIdentity attributes](self, "attributes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EXAppExtensionClass")),
        v4 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    v6 = NSClassFromString(v4);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", getprogname());
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@"), v4);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();

      v7 = NSClassFromString(v9);
    }
  }
  else
  {
    v7 = 0;
  }
  if (-[_EXExtensionIdentity supportsNSExtensionPlistKeys](self, "supportsNSExtensionPlistKeys")
    && -[_EXExtensionIdentity extensionContextClass](self, "extensionContextClass")
    && -[_EXExtensionIdentity presentsUserInterface](self, "presentsUserInterface"))
  {
    v10 = CFSTR("_EXNSExtensionUIShimExtension");
LABEL_14:
    v7 = NSClassFromString(&v10->isa);
    goto LABEL_15;
  }
  if (-[_EXExtensionIdentity supportsNSExtensionPlistKeys](self, "supportsNSExtensionPlistKeys")
    && -[_EXExtensionIdentity extensionContextClass](self, "extensionContextClass"))
  {
    v10 = CFSTR("_EXNSExtensionShimExtension");
    goto LABEL_14;
  }
LABEL_15:
  if (!v7)
    v7 = (void *)objc_opt_class();
  v11 = v7;

  return v11;
}

- (Class)connectionHandlerClass
{
  void *v2;
  NSString *v3;
  objc_class *v4;
  objc_class *v5;
  NSObject *v6;
  objc_class *v7;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_stringForKey:", CFSTR("EXConnectionHandlerClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = NSClassFromString(v3);
  v5 = v4;
  if (v3 && !v4)
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_EXExtensionIdentity(Configuration) connectionHandlerClass].cold.1(v6);
LABEL_9:

    goto LABEL_10;
  }
  if (v4 && !class_conformsToProtocol(v4, (Protocol *)&unk_1EE2126C0))
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_EXExtensionIdentity(Configuration) connectionHandlerClass].cold.2(v6);
    goto LABEL_9;
  }
LABEL_10:
  v7 = v5;

  return v7;
}

- (NSDictionary)requiredHostEntitlements
{
  void *v3;
  void *v4;
  void *v5;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXExtensionIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _EXExtractRequiredHostEntitlements(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)internalServiceName
{
  NSObject *v2;
  NSString *result;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315394;
    v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/Inte"
         "rnal/EXExtension+Configuration.m";
    v6 = 1024;
    v7 = 209;
  }

  __break(1u);
  return result;
}

- (_EXExtensionIdentity)initWithPlugInKitProxy:(id)a3
{
  id v4;
  _EXExtensionRecordIdentity *v5;

  v4 = a3;
  v5 = -[_EXExtensionRecordIdentity initWithPlugInKitProxy:]([_EXExtensionRecordIdentity alloc], "initWithPlugInKitProxy:", v4);

  return &v5->super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXExtensionIdentity)initWithCoder:(id)a3
{
  id v4;
  _EXExtensionValueIdentity *v5;

  v4 = a3;
  v5 = -[_EXExtensionValueIdentity initWithCoder:]([_EXExtensionValueIdentity alloc], "initWithCoder:", v4);

  return &v5->super;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_EXExtensionIdentity UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXExtensionIdentity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXExtensionIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Extension identity [%@]: %@ extension point: %@ platform: %u"), v4, v5, v6, -[_EXExtensionIdentity platform](self, "platform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSURL)executableURL
{
  void *v2;
  __CFBundle *Unique;
  CFURLRef v4;

  -[_EXExtensionIdentity url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Unique = (__CFBundle *)_CFBundleCreateUnique();

  if (Unique)
  {
    v4 = CFBundleCopyExecutableURL(Unique);
    CFRelease(Unique);
  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (NSDictionary)nsExtensionAttributes
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[_EXExtensionIdentity extensionDictionary](self, "extensionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_dictionaryForKey:", CFSTR("NSExtensionAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v4;
  NSObject *v5;
  id result;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;

  v4 = a3;
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v7 = 136315906;
    v8 = "false";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXE"
          "xtensionIdentity.m";
    v11 = 1024;
    v12 = 514;
    v13 = 2080;
    v14 = "-[_EXExtensionIdentity entitlementNamed:ofClass:]";
    _os_log_fault_impl(&dword_190C25000, v5, OS_LOG_TYPE_FAULT, "%s - %s:%d: _EXExtensionIdentity subclass must implement '%s'", (uint8_t *)&v7, 0x26u);
  }

  __break(1u);
  return result;
}

- (BOOL)hasSandboxEntitlement
{
  void *v2;
  void *v3;
  int v4;

  -[_EXExtensionIdentity entitlementNamed:ofClass:](self, "entitlementNamed:ofClass:", CFSTR("com.apple.security.app-sandbox"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqual:", MEMORY[0x1E0C9AAA0]) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (ISIcon)icon
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getISIconClass_softClass;
  v13 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getISIconClass_block_invoke;
    v9[3] = &unk_1E2CFC480;
    v9[4] = &v10;
    __getISIconClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v5 = [v4 alloc];
  -[_EXExtensionIdentity bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", v6);

  return (ISIcon *)v7;
}

- (Class)hostContextClass
{
  void *v2;
  NSString *v3;
  objc_class *v4;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionContextHostClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = NSClassFromString(v3);
  return v4;
}

- (Class)extensionContextClass
{
  void *v2;
  NSString *v3;
  Class v4;
  NSObject *v5;
  objc_class *v6;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_stringForKey:", CFSTR("EXExtensionContextClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = NSClassFromString(v3);
  if (!v4)
  {
    _EXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_EXExtensionIdentity extensionContextClass].cold.1();

    goto LABEL_6;
  }
LABEL_7:
  v6 = v4;

  return v6;
}

- (NSArray)roles
{
  void *v2;
  void *v3;
  void *v4;

  -[_EXExtensionIdentity extensionPointConfiguration](self, "extensionPointConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_dictionaryForKey:", CFSTR("EXSceneManifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_activity_scope_state_s v13;

  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  v5 = _os_activity_create(&dword_190C25000, "Make extension XPC connection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v13);
  _EXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_EXExtensionIdentity makeXPCConnectionWithError:].cold.2();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setExtensionIdentity:", self, v13.opaque[0], v13.opaque[1]);
  +[_EXExtensionProcess extensionProcessWithConfiguration:error:](_EXExtensionProcess, "extensionProcessWithConfiguration:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "newXPCConnectionWithError:", a3);
  }
  else
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_EXExtensionIdentity makeXPCConnectionWithError:].cold.1();

    v10 = 0;
  }
  os_activity_scope_leave(&v13);

  return v10;
}

- (unint64_t)enablementState
{
  void *v3;
  int v4;
  unint64_t v5;

  -[_EXExtensionIdentity extensionPointIdentifier](self, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = -[_EXExtensionIdentity userElection](self, "userElection");
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v4 = -[_EXExtensionIdentity defaultUserElection](self, "defaultUserElection");
    v5 = 0;
  }
  if (v4 == 1)
    return v5 | 2;
  else
    return v5;
}

- (BOOL)enabled
{
  return (-[_EXExtensionIdentity enablementState](self, "enablementState") >> 1) & 1;
}

- (BOOL)unelected
{
  return (-[_EXExtensionIdentity enablementState](self, "enablementState") & 1) == 0;
}

+ (BOOL)enableExtension:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "setUserElection:error:", 1, a4);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_EX_parameterError");
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)disableExtension:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "setUserElection:error:", 2, a4);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_EX_parameterError");
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)showsInExtensionsManager
{
  void *v3;
  char v4;

  if (!-[_EXExtensionIdentity isSystemComponent](self, "isSystemComponent"))
    return 1;
  -[_EXExtensionIdentity extensionDictionary](self, "extensionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_EX_BOOLForKey:defaultValue:", CFSTR("com.apple.showsInExtensionsManager"), 1);

  return v4;
}

- (BOOL)canDisable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  if (-[_EXExtensionIdentity isSystemComponent](self, "isSystemComponent"))
  {
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alwaysEnabledExtensionBundleIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EXExtensionIdentity bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)spotlightIndexable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_arrayForKey:", CFSTR("EXSpotlightIndexable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSArray)spotlightImporterIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_EX_arrayForKey:", CFSTR("EXSpotlightIndexable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)alternateSandboxProfileNames
{
  void *v3;
  void *v4;

  if (-[_EXExtensionIdentity targetsSystemExtensionPoint](self, "targetsSystemExtensionPoint"))
  {
    -[_EXExtensionIdentity sdkDictionary](self, "sdkDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_EX_arrayForKey:", CFSTR("EXAlternateSandboxProfileNames"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (NSString)developerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)requiresUIKitSceneHosting
{
  return self->_requiresUIKitSceneHosting;
}

- (BOOL)isSystemComponent
{
  return self->_systemComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerName, 0);
}

- (id)_executableURLWithError:(id *)a3
{
  void *v4;
  __CFBundle *Unique;
  __CFBundle *v6;
  CFURLRef v7;
  void *v8;
  NSObject *v9;

  -[_EXExtensionIdentity url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v6 = Unique;
    v7 = CFBundleCopyExecutableURL(Unique);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  -[__CFURL path](v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_EXExtensionIdentity(Overlay) _executableURLWithError:].cold.1(v9);

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 2, MEMORY[0x1E0C9AA70]);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v7 = 0;
  }

  return v7;
}

- (void)initWithServiceIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)extensionContextClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Failed to load extension context class '%{public}@', does the appex link the extension point framework?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)makeXPCConnectionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Failed to make xpc connection for extension %{public}@  (extension launch failed)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)makeXPCConnectionWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "making XPC connection for extension: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
