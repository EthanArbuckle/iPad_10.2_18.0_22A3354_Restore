@implementation SODebugHints

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance_instance;
}

void __30__SODebugHints_sharedInstance__block_invoke()
{
  SODebugHints *v0;
  void *v1;

  v0 = objc_alloc_init(SODebugHints);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (SODebugHints)debugHintsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id SOUtilsClass;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SODebugHints *result;
  __CFString *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[7];
  _QWORD v38[7];
  _BYTE buf[24];
  void *v40;
  uint64_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  if (SO_LOG_SODebugConfiguration_once != -1)
    dispatch_once(&SO_LOG_SODebugConfiguration_once, &__block_literal_global_34);
  v5 = SO_LOG_SODebugConfiguration_log;
  if (os_log_type_enabled((os_log_t)SO_LOG_SODebugConfiguration_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SODebugHints debugHintsWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }
  if (v4)
  {
    if ((objc_msgSend(getSOUtilsClass(), "isInternalBuild") & 1) != 0)
    {
      +[SOConfigurationHost defaultManager](SOConfigurationHost, "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v6, "configurationForClientWithError:", &v32);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v32;

      if (v8)
      {
        v4[2](v4, 0, v8);
      }
      else
      {
        SOUtilsClass = getSOUtilsClass();
        +[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "loadedExtensions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(SOUtilsClass, "mapArray:usingBlock:", v13, &__block_literal_global_19);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

        +[SOConfigurationHost defaultManager](SOConfigurationHost, "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "realms");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v37[0] = CFSTR("Configuration");
        objc_msgSend(v7, "description");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (const __CFString *)v16;
        else
          v18 = CFSTR("(null)");
        v19 = v31;
        if (!v31)
          v19 = CFSTR("(null)");
        v38[0] = v18;
        v38[1] = v19;
        v37[1] = CFSTR("Plugins");
        v37[2] = CFSTR("Realms");
        if (v15)
          v20 = v15;
        else
          v20 = CFSTR("(null)");
        v38[2] = v20;
        v37[3] = CFSTR("Signature Validated");
        if (+[SOPreferences isExtensionSignatureValidated](SOPreferences, "isExtensionSignatureValidated"))
        {
          v21 = CFSTR("YES");
        }
        else
        {
          v21 = CFSTR("NO");
        }
        v38[3] = v21;
        v37[4] = CFSTR("Associated Domains Validated");
        if (+[SOPreferences isAssociatedDomainValidated](SOPreferences, "isAssociatedDomainValidated"))
          v22 = CFSTR("YES");
        else
          v22 = CFSTR("NO");
        v38[4] = v22;
        v37[5] = CFSTR("Requests");
        +[SORequestQueue debugDescription](SORequestQueue, "debugDescription");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (const __CFString *)v23;
        else
          v25 = CFSTR("(null)");
        v38[5] = v25;
        v37[6] = CFSTR("Config Version");
        v26 = (void *)MEMORY[0x24BDD17C8];
        +[SOConfigurationHost defaultManager](SOConfigurationHost, "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("0x%016llX"), objc_msgSend(v27, "configVersion"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38[6] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, void *, id))v4)[2](v4, v29, 0);
      }

    }
    else
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v9 = (void *)getSOErrorHelperClass_softClass_3;
      v36 = getSOErrorHelperClass_softClass_3;
      if (!getSOErrorHelperClass_softClass_3)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSOErrorHelperClass_block_invoke_3;
        v40 = &unk_24C80C0B8;
        v41 = &v33;
        __getSOErrorHelperClass_block_invoke_3((uint64_t)buf);
        v9 = (void *)v34[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v33, 8);
      objc_msgSend(v10, "internalErrorWithMessage:", CFSTR("not internal build"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v8);
    }

  }
  return result;
}

uint64_t __41__SODebugHints_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

@end
