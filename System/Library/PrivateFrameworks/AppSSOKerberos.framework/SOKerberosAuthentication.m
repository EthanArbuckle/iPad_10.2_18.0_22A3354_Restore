@implementation SOKerberosAuthentication

- (SOKerberosAuthentication)initWithRealm:(id)a3
{
  id v5;
  SOKerberosAuthentication *v6;
  SOKerberosAuthentication *v7;
  SOKerberosHelper *v8;
  SOKerberosHelper *kerberosHelper;
  SOKeychainHelper *v10;
  SOKeychainHelper *keychainHelper;
  SOADSiteDiscovery *v12;
  SOADSiteDiscovery *siteDiscovery;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SOKerberosAuthentication;
  v6 = -[SOKerberosAuthentication init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realm, a3);
    if (initWithRealm__onceToken != -1)
      dispatch_once(&initWithRealm__onceToken, &__block_literal_global_10);
    v7->_siteDiscoveryInProgress = 0;
    v8 = objc_alloc_init(SOKerberosHelper);
    kerberosHelper = v7->_kerberosHelper;
    v7->_kerberosHelper = v8;

    v10 = objc_alloc_init(SOKeychainHelper);
    keychainHelper = v7->_keychainHelper;
    v7->_keychainHelper = v10;

    v12 = -[SOADSiteDiscovery initWithRealm:]([SOADSiteDiscovery alloc], "initWithRealm:", v7->_realm);
    siteDiscovery = v7->_siteDiscovery;
    v7->_siteDiscovery = v12;

  }
  return v7;
}

void __42__SOKerberosAuthentication_initWithRealm___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_lock;
  _lock = v0;

}

- (unint64_t)attemptKerberosWithContext:(id)a3 returningToken:(id *)a4 orError:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  unint64_t v36;
  int v38;
  unint64_t v39;
  NSObject *v40;
  const __CFUUID *v41;
  const __CFUUID *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  const __CFUUID *v64;
  const __CFUUID *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  gss_cred_id_t v107;
  void *v108;
  NSObject *v109;
  char v110;
  id *v111;
  id *v112;
  id *v113;
  id *v114;
  OM_uint32 minor_status;
  gss_cred_id_t cred_handle;

  v8 = a3;
  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.16();

  cred_handle = 0;
  minor_status = 0;
  objc_msgSend(v8, "realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callerBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:](self, "triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:", v10, v11, v12);

  objc_msgSend(v8, "credentialUUID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v8, "refreshCredential");

    if ((v15 & 1) == 0)
    {
      v16 = (id)_lock;
      objc_sync_enter(v16);
      objc_msgSend(v8, "impersonationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        objc_msgSend(v8, "impersonationBundleIdentifier");
      else
        objc_msgSend(v8, "callerBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HeimCredSetImpersonateBundle();

      -[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "credentialUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      cred_handle = (gss_cred_id_t)objc_msgSend(v19, "acquireCredentialForUUID:", v20);

      HeimCredSetImpersonateBundle();
      objc_sync_exit(v16);

      if (cred_handle)
      {
        SO_LOG_SOKerberosAuthentication();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.15(v8, v21);

      }
    }
  }
  objc_msgSend(v8, "extensionData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "useSiteAutoDiscovery");

  if (v23)
  {
    objc_msgSend(v8, "networkIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "determineNetworkFingerprint");

    objc_msgSend(v8, "callerBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "networkIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkFingerprint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:](self, "retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:", v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_18;
    SO_LOG_SOKerberosAuthentication();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.14();

    objc_msgSend(v8, "setSiteCode:", v28);
    if (!cred_handle || (objc_msgSend(v28, "age"), v30 > 86400.0))
    {
LABEL_18:
      SO_LOG_SOKerberosAuthentication();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.13();

      -[SOKerberosAuthentication determineSiteCodeUsingContext:](self, "determineSiteCodeUsingContext:", v8);
    }

  }
  objc_msgSend(v8, "userPrincipalName");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32
    || (v33 = (void *)v32,
        objc_msgSend(v8, "userPrincipalName"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v34, "isEqualToString:", &stru_24D3EC758),
        v34,
        v33,
        (v35 & 1) != 0))
  {
    v36 = 2;
    goto LABEL_25;
  }
  if (!cred_handle)
  {
    if ((objc_msgSend(v8, "refreshCredential") & 1) != 0)
    {
      v38 = 0;
      v36 = 0;
      goto LABEL_46;
    }
    v39 = -[SOKerberosAuthentication findExistingCredentialUsingContext:returningCredential:orError:](self, "findExistingCredentialUsingContext:returningCredential:orError:", v8, &cred_handle, a5);
    v36 = v39;
    if (v39 == 2)
    {
      SO_LOG_SOKerberosAuthentication();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.12(v43, v45, v46);
      v38 = 0;
    }
    else
    {
      if (v39 != 4)
      {
        v38 = 0;
        goto LABEL_46;
      }
      SO_LOG_SOKerberosAuthentication();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.11();

      v41 = GSSCredentialCopyUUID(cred_handle);
      if (v41)
      {
        v42 = v41;
        v43 = CFUUIDCreateString(0, v41);
        CFRelease(v42);
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v43);
        objc_msgSend(v8, "setCredentialUUID:", v44);

      }
      else
      {
        SO_LOG_SOKerberosAuthentication();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.10(v8);
      }
      v38 = 1;
    }

LABEL_46:
    if (!cred_handle)
      goto LABEL_48;
    goto LABEL_47;
  }
  v36 = 0;
  v38 = 0;
LABEL_47:
  if (!objc_msgSend(v8, "refreshCredential"))
    goto LABEL_79;
LABEL_48:
  objc_msgSend(v8, "extensionData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "usePlatformSSOTGT");

  if ((_DWORD)v48)
  {
    if ((objc_msgSend(v8, "returnCredentialOnly") & 1) == 0)
    {
      if (!a5)
      {
LABEL_86:
        v36 = 7;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "invalidKerberosOperation");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_85:
      *a5 = v54;
      goto LABEL_86;
    }
    if (objc_msgSend(v8, "returnCredentialOnly"))
    {
      objc_msgSend(v8, "extensionData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v49, "allowPlatformSSOAuthFallback");

      if ((v48 & 1) == 0)
      {
        if (!a5)
          goto LABEL_86;
        goto LABEL_84;
      }
    }
  }
  objc_msgSend(v8, "password");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v8, "password");
    v48 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v48, "isEqualToString:", &stru_24D3EC758) & 1) == 0)
    {

      goto LABEL_66;
    }
  }
  v111 = a5;
  v113 = a4;
  objc_msgSend(v8, "extensionData");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "certificateUUID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52
    || (objc_msgSend(v8, "extensionData"),
        a4 = (id *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a4, "certificateUUID"),
        a5 = (id *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a5, "isEqualToString:", &stru_24D3EC758)))
  {
    objc_msgSend(v8, "pkinitPersistientRef");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v55, "length") == 0;

    if (!v52)
      goto LABEL_62;
  }
  else
  {
    v53 = 0;
  }

LABEL_62:
  if (v50)
  {

  }
  a5 = v111;
  a4 = v113;
  if (v53)
  {
    v36 = 1;
    goto LABEL_25;
  }
LABEL_66:
  objc_msgSend(v8, "extensionData");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "requireUserPresence"))
  {
    objc_msgSend(v8, "extensionData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "certificateUUID");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_msgSend(v8, "keychainLAContext");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
      {
        SO_LOG_SOKerberosAuthentication();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.9();

        v36 = 18;
        goto LABEL_25;
      }
      goto LABEL_74;
    }

  }
LABEL_74:
  -[SOKerberosAuthentication setSiteCodeUsingContext:](self, "setSiteCodeUsingContext:", v8);
  v36 = -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:](self, "createNewCredentialUsingContext:returningCredential:orError:", v8, &cred_handle, a5);
  SO_LOG_SOKerberosAuthentication();
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);
  if (v36 != 4)
  {
    if (v63)
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.8();

    if (*a5)
    {
      SO_LOG_SOKerberosAuthentication();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.7();

    }
    goto LABEL_25;
  }
  if (v63)
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.6();

  v64 = GSSCredentialCopyUUID(cred_handle);
  if (!v64)
  {
    SO_LOG_SOKerberosAuthentication();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.1(v8);

    if (!a5)
      goto LABEL_86;
    objc_msgSend(MEMORY[0x24BDD1540], "sourceAppNotAllowed");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v65 = v64;
  v66 = (__CFString *)CFUUIDCreateString(0, v64);
  CFRelease(v65);
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v66);
  objc_msgSend(v8, "setCredentialUUID:", v67);

  v38 = 1;
  v36 = 4;
LABEL_79:
  if (!cred_handle)
  {
    if (!a5)
    {
      v36 = 7;
      goto LABEL_27;
    }
LABEL_84:
    objc_msgSend(MEMORY[0x24BDD1540], "credentialMissing");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  objc_msgSend(v8, "extensionData");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = a4;
  if (objc_msgSend(v68, "usePlatformSSOTGT"))
  {
    objc_msgSend(v8, "currentSettings");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "dateExpirationChecked");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v71 = 0;
    }
    else
    {
      objc_msgSend(v8, "extensionData");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v73, "performKerberosOnly") ^ 1;

    }
  }
  else
  {
    v71 = 0;
  }

  SO_LOG_SOKerberosAuthentication();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.5(v8, v74);

  if (((v38 | v71) & 1) != 0)
    goto LABEL_102;
  if ((objc_msgSend(v8, "refreshCredential") & 1) != 0)
    goto LABEL_102;
  objc_msgSend(v8, "currentSettings");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "dateNextPacRefresh");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "timeIntervalSinceNow");
  v78 = v77;

  if (v78 < 0.0)
  {
LABEL_102:
    v79 = (id)_lock;
    objc_sync_enter(v79);
    objc_msgSend(v8, "impersonationBundleIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
      objc_msgSend(v8, "impersonationBundleIdentifier");
    else
      objc_msgSend(v8, "callerBundleIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    HeimCredSetImpersonateBundle();

    -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:](self, "refreshPacValuesWithContext:credential:atLogin:", v8, cred_handle, v38 | v71);
    HeimCredSetImpersonateBundle();
    objc_sync_exit(v79);

  }
  +[SOKerberosAuthentication saveValuesForPlugins:](SOKerberosAuthentication, "saveValuesForPlugins:", v8);
  objc_msgSend(v8, "credentialUUID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSettings");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setCredentialUUID:", v82);

  objc_msgSend(v8, "userPrincipalName");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSettings");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setUserPrincipalName:", v84);

  objc_msgSend(v8, "currentSettings");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setUserCancelledLogin:", 0);

  objc_msgSend(v8, "currentSettings");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setDateLoginCancelled:", 0);

  objc_msgSend(v8, "loginTimeStamp");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    objc_msgSend(v8, "loginTimeStamp");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSettings");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setDateLastLogin:", v89);

  }
  SO_LOG_SOKerberosAuthentication();
  v91 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.4(v8, v91);

  objc_msgSend(v8, "extensionData");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v92, "performKerberosOnly") & 1) != 0)
    goto LABEL_115;
  objc_msgSend(v8, "currentSettings");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "dateExpirationChecked");
  v94 = objc_claimAutoreleasedReturnValue();
  if (!v94)
  {

LABEL_115:
    goto LABEL_116;
  }
  v95 = (void *)v94;
  objc_msgSend(v8, "currentSettings");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "datePasswordLastChangedAtLogin");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSettings");
  v112 = a5;
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "datePasswordLastChanged");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v97, "isEqualToDate:", v99);

  a5 = v112;
  if ((v110 & 1) == 0)
  {
    objc_msgSend(v8, "setRefreshCredential:", 1);
    v36 = 16;
    goto LABEL_25;
  }
LABEL_116:
  if ((objc_msgSend(v8, "returnCredentialOnly") & 1) == 0)
  {
    SO_LOG_SOKerberosAuthentication();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.3();

    objc_msgSend(v8, "servicePrincipalName");
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      v102 = (id)_lock;
      objc_sync_enter(v102);
      objc_msgSend(v8, "impersonationBundleIdentifier");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v103)
        objc_msgSend(v8, "impersonationBundleIdentifier");
      else
        objc_msgSend(v8, "callerBundleIdentifier");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      HeimCredSetImpersonateBundle();

      -[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = cred_handle;
      objc_msgSend(v8, "servicePrincipalName");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107) = objc_msgSend(v106, "authenticate:toServer:returningToken:andError:", v107, v108, v114, a5);

      HeimCredSetImpersonateBundle();
      HeimCredSetImpersonateAuditToken();
      objc_sync_exit(v102);

      if ((_DWORD)v107 && *v114)
      {
        SO_LOG_SOKerberosAuthentication();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
          -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.2(v114, v109);

        v36 = 0;
      }
      else if (*a5)
      {
        v36 = -[SOKerberosAuthentication mapErrorToKnownError:](self, "mapErrorToKnownError:");
      }
      goto LABEL_25;
    }
    if (!a5)
      goto LABEL_86;
    objc_msgSend(MEMORY[0x24BDD1540], "servicePrincipalNameMissing");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v36 = 4;
LABEL_25:
  if (cred_handle)
    gss_release_cred(&minor_status, &cred_handle);
LABEL_27:

  return v36;
}

+ (void)saveValuesForPlugins:(id)a3
{
  id v3;
  NSObject *v4;
  SOKerberosHeimdalPluginSettings *v5;
  void *v6;
  SOKerberosHeimdalPluginSettings *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  SO_LOG_SOKerberosAuthentication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SOKerberosAuthentication saveValuesForPlugins:].cold.1();

  v5 = [SOKerberosHeimdalPluginSettings alloc];
  objc_msgSend(v3, "realm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SOKerberosHeimdalPluginSettings initWithRealm:](v5, "initWithRealm:", v6);

  objc_msgSend(v3, "siteCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "code");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosHeimdalPluginSettings setSiteCode:](v7, "setSiteCode:", v9);

  objc_msgSend(v3, "credentialUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOKerberosHeimdalPluginSettings setCurrentCredential:](v7, "setCurrentCredential:", v10);
}

+ (void)savePacValues:(id)a3 atLogin:(BOOL)a4
{
  _BOOL4 v4;
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
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  NSObject *v21;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "currentSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setDateExpirationChecked:", 0);
    objc_msgSend(v7, "setPasswordNeverExpires:", 0);
    objc_msgSend(v7, "setDatePasswordExpires:", 0);
    objc_msgSend(v7, "setDatePasswordLastChanged:", 0);
    objc_msgSend(v7, "setDateADPasswordCanChange:", 0);
    objc_msgSend(v7, "setDatePasswordLastChangedAtLogin:", 0);
  }
  objc_msgSend(v5, "pacData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateExpirationChecked:", v9);

    objc_msgSend(v7, "setPasswordNeverExpires:", objc_msgSend(v8, "passwordNeverExpires"));
    objc_msgSend(v8, "passwordMustChange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDatePasswordExpires:", v10);

    objc_msgSend(v8, "passwordLastSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDatePasswordLastChanged:", v11);

    objc_msgSend(v8, "passwordCanChange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateADPasswordCanChange:", v12);

    objc_msgSend(v8, "homeDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNetworkHomeDirectory:", v13);

    if (v4)
    {
      objc_msgSend(v7, "datePasswordLastChanged");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDatePasswordLastChangedAtLogin:", v14);

    }
    objc_msgSend(v7, "datePasswordExpires");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceNow");
    if (v16 >= 0.0 && v16 >= 86400.0)
    {
      if (v16 >= 259200.0)
      {
        v18 = (void *)MEMORY[0x24BDBCE60];
        if (v16 >= 604800.0)
          v19 = 10800.0;
        else
          v19 = 3600.0;
      }
      else
      {
        v18 = (void *)MEMORY[0x24BDBCE60];
        v19 = 900.0;
      }
      objc_msgSend(v18, "dateWithTimeIntervalSinceNow:", v19);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v17;
    objc_msgSend(v7, "setDateNextPacRefresh:", v17);

    SO_LOG_SOKerberosAuthentication();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[SOKerberosAuthentication savePacValues:atLogin:].cold.1(v7, v21);

  }
}

- (void)setSiteCodeUsingContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  SO_LOG_SOKerberosAuthentication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication setSiteCodeUsingContext:].cold.3();

  objc_msgSend(v4, "extensionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "useSiteAutoDiscovery");

  if (v7)
  {
    objc_msgSend(v4, "siteCodeGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_time(0, 15000000000);
    v10 = dispatch_group_wait(v8, v9);

    if (v10 >= 1)
    {
      SO_LOG_SOKerberosAuthentication();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[SOKerberosExtensionProcess handleGetSiteCode:].cold.3();

    }
    objc_msgSend(v4, "callerBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "networkFingerprint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:](self, "retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    SO_LOG_SOKerberosAuthentication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication attemptKerberosWithContext:returningToken:orError:].cold.14();

    objc_msgSend(v4, "setSiteCode:", v15);
  }

}

- (id)retrieveCachedSiteCodeFromCacheForBundleIdentifier:(id)a3 networkFingerprint:(id)a4
{
  id v5;
  SOKerberosRealmSettings *v6;
  void *v7;
  SOKerberosRealmSettings *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;

  v5 = a4;
  v6 = [SOKerberosRealmSettings alloc];
  -[SOKerberosAuthentication realm](self, "realm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SOKerberosRealmSettings initWithRealm:](v6, "initWithRealm:", v7);

  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:].cold.3();

  -[SOKerberosRealmSettings siteCodeForNetworkFingerprint:](v8, "siteCodeForNetworkFingerprint:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SO_LOG_SOKerberosAuthentication();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:].cold.2(v10, v11);

    v13 = v10;
  }
  else
  {
    if (v12)
      -[SOKerberosAuthentication retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:].cold.1();

  }
  return v10;
}

- (void)determineSiteCodeUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "siteCodeGroup");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkFingerprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOKerberosAuthentication _determineSiteCodeUsingDispatchGroup:bundleIdentifier:auditTokenData:networkFingerprint:requireTLSForLDAP:](self, "_determineSiteCodeUsingDispatchGroup:bundleIdentifier:auditTokenData:networkFingerprint:requireTLSForLDAP:", v10, v5, v6, v8, objc_msgSend(v9, "requireTLSForLDAP"));
}

- (void)_determineSiteCodeUsingDispatchGroup:(id)a3 bundleIdentifier:(id)a4 auditTokenData:(id)a5 networkFingerprint:(id)a6 requireTLSForLDAP:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SOKerberosRealmSettings *v16;
  void *v17;
  SOKerberosRealmSettings *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  SOKerberosRealmSettings *v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = [SOKerberosRealmSettings alloc];
  -[SOKerberosAuthentication realm](self, "realm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SOKerberosRealmSettings initWithRealm:](v16, "initWithRealm:", v17);

  if (!-[SOKerberosAuthentication siteDiscoveryInProgress](self, "siteDiscoveryInProgress"))
  {
    -[SOKerberosAuthentication setSiteDiscoveryInProgress:](self, "setSiteDiscoveryInProgress:", 1);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = v12;
    dispatch_group_enter((dispatch_group_t)v29[5]);
    v19 = v29[5];
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke;
    block[3] = &unk_24D3EC500;
    block[4] = self;
    v22 = v13;
    v23 = v14;
    v27 = a7;
    v24 = v15;
    v25 = v18;
    v26 = &v28;
    dispatch_group_async(v19, v20, block);

    _Block_object_dispose(&v28, 8);
  }

}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  SO_LOG_SOKerberosAuthentication();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "siteDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11;
  v9[3] = &unk_24D3EC4D8;
  v10 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "performLDAPPingUsingSite:bundleIdentifier:auditTokenData:requireTLSForLDAP:inBackground:completion:", 0, v4, v5, v6, 0, v9);

}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  int v5;
  SOSiteCode *v6;
  const __CFString *v7;
  uint64_t v8;
  SOSiteCode *v9;
  NSObject *v10;

  v3 = a2;
  SO_LOG_SOKerberosAuthentication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_2();

  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", &stru_24D3EC758);
      v6 = [SOSiteCode alloc];
      if (v5)
      {
        v7 = CFSTR("no site code");
        v8 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 32);
        v7 = v3;
      }
      v9 = -[SOSiteCode initWithSiteCode:forNetworkFingerprint:](v6, "initWithSiteCode:forNetworkFingerprint:", v7, v8);
      objc_msgSend(*(id *)(a1 + 40), "cacheSiteCode:", v9);

    }
    SO_LOG_SOKerberosAuthentication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 48), "setSiteDiscoveryInProgress:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (unint64_t)createNewCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __SecIdentity *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  gss_cred_id_t_desc_struct **v49;
  SOKerberosAuthentication *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *DisplayString;
  __SecIdentity *v81;
  void *v82;
  char v83;
  __SecIdentity *cf;
  gss_name_t input_name;
  OM_uint32 minor_status;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  _QWORD v91[2];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.16();

  SO_LOG_SOKerberosAuthentication();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.15(v8, v10);

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(v8, "extensionData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "certificateUUID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v8, "useKerberosPasswordInsteadOfMDMIdentity");

    if ((v15 & 1) == 0)
    {
      SO_LOG_SOKerberosAuthentication();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.14();

      -[SOKerberosAuthentication keychainHelper](self, "keychainHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "extensionData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "certificateUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (__SecIdentity *)objc_msgSend(v17, "identityForUUIDString:", v19);

      SO_LOG_SOKerberosAuthentication();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (!v20)
      {
        if (v22)
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.12(v8, v21);
        v35 = 15;
        goto LABEL_80;
      }
      if (v22)
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.13((uint64_t)v20, v8, v21);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("kGSSICCertificate"));
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "pkinitPersistientRef");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    objc_msgSend(v8, "pkinitPersistientRef");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "certificateTokenID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SOSmartcard searchForCachedIdentityPersistentRef:tokenID:](SOSmartcard, "searchForCachedIdentityPersistentRef:tokenID:", v25, v26);
    v21 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v21, "count"))
    {
      -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x24BDE8F48]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v8, "smartCardLAContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = objc_alloc_init(MEMORY[0x24BDDA938]);
          objc_msgSend(v8, "setSmartCardLAContext:", v29);

          objc_msgSend(v8, "smartCardLAContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setOptionCallerName:", CFSTR("Kerberos"));

        }
        objc_msgSend(v8, "smartCardLAContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = +[SOSmartcard getLocalAuthIdentityForCert:withLAContext:](SOSmartcard, "getLocalAuthIdentityForCert:withLAContext:", v21, v31);

        if (!v20)
          goto LABEL_69;
        goto LABEL_31;
      }
      v36 = *MEMORY[0x24BDE9558];
      -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x24BDE9558]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
LABEL_69:
        SO_LOG_SOKerberosAuthentication();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.8(v8, v34);
        v35 = 6;
        goto LABEL_72;
      }
      -[SOKerberosAuthentication keychainHelper](self, "keychainHelper");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (__SecIdentity *)objc_msgSend(v38, "identityForPersistientRef:", v39);

      if (v20)
      {
LABEL_31:
        SO_LOG_SOKerberosAuthentication();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.11((uint64_t)v20, v8, v40);

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("kGSSICCertificate"));
        objc_msgSend(v8, "smartCardLAContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          SO_LOG_SOKerberosAuthentication();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.10(v8, v42);

          objc_msgSend(v8, "smartCardLAContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, CFSTR("kGSSICAuthenticationContext"));

        }
        goto LABEL_38;
      }
      SO_LOG_SOKerberosAuthentication();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.9();
    }
    else
    {
      SO_LOG_SOKerberosAuthentication();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.7(v8, v34);
    }
    v35 = 3;
LABEL_72:

    goto LABEL_80;
  }
  objc_msgSend(v8, "password");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    SO_LOG_SOKerberosAuthentication();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.1();
    v35 = 1;
    goto LABEL_80;
  }
  objc_msgSend(v8, "password");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, CFSTR("kGSSICPassword"));

  v20 = 0;
LABEL_38:
  objc_msgSend(v8, "cacheName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "cacheName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("API:%@"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v47, CFSTR("kGSSICKerberosCacheName"));

    SO_LOG_SOKerberosAuthentication();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.6(v11, v48);

  }
  cf = v20;
  v49 = a4;
  v50 = self;
  objc_msgSend(v8, "siteCode");
  v51 = objc_claimAutoreleasedReturnValue();
  -[NSObject code](v51, "code");
  v52 = objc_claimAutoreleasedReturnValue();
  if (!v52)
    goto LABEL_46;
  v53 = (void *)v52;
  objc_msgSend(v8, "siteCode");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "code");
  v55 = a5;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("no site code"));

  a5 = v55;
  if ((v57 & 1) == 0)
  {
    objc_msgSend(v8, "siteCode");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "code");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v59, CFSTR("kGSSICSiteName"));

    SO_LOG_SOKerberosAuthentication();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.5(v11, v51);
LABEL_46:

  }
  objc_msgSend(v8, "extensionData");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "credentialBundleIdACL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61
    || (objc_msgSend(v8, "extensionData"),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v61, "includeManagedAppsInBundleIdACL") & 1) != 0))
  {

  }
  else
  {
    objc_msgSend(v8, "extensionData");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "includeKerberosAppsInBundleIdACL");

    if ((v83 & 1) == 0)
    {
      v21 = &unk_24D3F2CD0;
      goto LABEL_54;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionData");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "credentialBundleIdACL");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "count");

  if (v64)
  {
    objc_msgSend(v8, "extensionData");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "credentialBundleIdACL");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObjectsFromArray:](v21, "addObjectsFromArray:", v66);

  }
  objc_msgSend(v8, "extensionData");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "includeManagedAppsInBundleIdACL");

  if (v68)
    -[NSObject addObject:](v21, "addObject:", CFSTR("com.apple.private.gssapi.allowmanagedapps"));
LABEL_54:
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("kGSSICAppIdentifierACL"));
  SO_LOG_SOKerberosAuthentication();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.4();

  objc_msgSend(v8, "impersonationBundleIdentifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v90 = CFSTR("kGSSICAppleSourceAppSigningIdentity");
    objc_msgSend(v8, "impersonationBundleIdentifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v71;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v72, CFSTR("kGSSICAppleSourceApp"));

    SO_LOG_SOKerberosAuthentication();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.3(v11, v73);
LABEL_62:

    goto LABEL_63;
  }
  objc_msgSend(v8, "callerBundleIdentifier");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    v88 = CFSTR("kGSSICAppleSourceAppSigningIdentity");
    objc_msgSend(v8, "callerBundleIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v75;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v76, CFSTR("kGSSICAppleSourceApp"));

    SO_LOG_SOKerberosAuthentication();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:].cold.2(v11, v73);
    goto LABEL_62;
  }
LABEL_63:
  -[SOKerberosAuthentication kerberosHelper](v50, "kerberosHelper");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userPrincipalName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  *v49 = (gss_cred_id_t_desc_struct *)objc_msgSend(v77, "createCredential:withOptions:andError:", v78, v11, a5);

  if (*v49)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLoginTimeStamp:", v79);

    minor_status = 0;
    input_name = GSSCredentialCopyName(*v49);
    DisplayString = (__CFString *)GSSNameCreateDisplayString(input_name);
    gss_release_name(&minor_status, &input_name);
    objc_msgSend(v8, "setUserPrincipalNameAfterAuth:", DisplayString);

    v35 = 4;
    v81 = cf;
    if (!cf)
      goto LABEL_80;
    goto LABEL_79;
  }
  v81 = cf;
  if (*a5)
  {
    v35 = -[SOKerberosAuthentication mapErrorToKnownError:](v50, "mapErrorToKnownError:");
    if (!cf)
      goto LABEL_80;
    goto LABEL_79;
  }
  v35 = 5;
  if (cf)
LABEL_79:
    CFRelease(v81);
LABEL_80:

  return v35;
}

- (unint64_t)findExistingCredentialUsingContext:(id)a3 returningCredential:(gss_cred_id_t_desc_struct *)a4 orError:(id *)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v7 = a3;
  SO_LOG_SOKerberosAuthentication();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication findExistingCredentialUsingContext:returningCredential:orError:].cold.2();

  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication findExistingCredentialUsingContext:returningCredential:orError:].cold.1(v7, v9);

  v10 = (id)_lock;
  objc_sync_enter(v10);
  objc_msgSend(v7, "impersonationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v7, "impersonationBundleIdentifier");
  else
    objc_msgSend(v7, "callerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HeimCredSetImpersonateBundle();

  -[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userPrincipalName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (gss_cred_id_t_desc_struct *)objc_msgSend(v13, "acquireCredentialForUPN:", v14);

  HeimCredSetImpersonateBundle();
  objc_sync_exit(v10);

  if (*a4)
    v15 = 4;
  else
    v15 = 5;

  return v15;
}

- (BOOL)changePasswordWithContext:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;

  v6 = a3;
  SO_LOG_SOKerberosAuthentication();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication changePasswordWithContext:withError:].cold.3(v6, (uint64_t)self, v7);

  objc_msgSend(v6, "realm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:](self, "triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:", v8, v9, v10);

  v11 = (id)_lock;
  objc_sync_enter(v11);
  objc_msgSend(v6, "impersonationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v6, "impersonationBundleIdentifier");
  else
    objc_msgSend(v6, "callerBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HeimCredSetImpersonateBundle();

  -[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userPrincipalName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "password");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedPassword");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v14, "changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:", v15, v16, v17, v18, a4);

  HeimCredSetImpersonateBundle();
  HeimCredSetImpersonateAuditToken();
  objc_sync_exit(v11);

  SO_LOG_SOKerberosAuthentication();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication changePasswordWithContext:withError:].cold.2();

  if (*a4)
  {
    SO_LOG_SOKerberosAuthentication();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SOKerberosAuthentication changePasswordWithContext:withError:].cold.1(a4);

  }
  return v19;
}

- (BOOL)refreshPacValuesWithContext:(id)a3 atLogin:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  OM_uint32 minor_status;
  gss_cred_id_t cred_handle;

  v6 = a4;
  v8 = a3;
  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:].cold.2((uint64_t)self, v9, v10);

  cred_handle = 0;
  minor_status = 0;
  objc_msgSend(v8, "credentialUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (-[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "credentialUUID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        cred_handle = (gss_cred_id_t)objc_msgSend(v12, "acquireCredentialForUUID:", v13),
        v13,
        v12,
        !cred_handle))
  {
    if (-[SOKerberosAuthentication createNewCredentialUsingContext:returningCredential:orError:](self, "createNewCredentialUsingContext:returningCredential:orError:", v8, &cred_handle, a5) != 4&& *a5)
    {
      SO_LOG_SOKerberosAuthentication();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:].cold.1();

    }
  }
  v15 = -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:](self, "refreshPacValuesWithContext:credential:atLogin:", v8, cred_handle, v6);
  if (cred_handle)
    gss_release_cred(&minor_status, &cred_handle);

  return v15;
}

- (BOOL)refreshPacValuesWithContext:(id)a3 credential:(gss_cred_id_t_desc_struct *)a4 atLogin:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  v5 = a5;
  v8 = a3;
  SO_LOG_SOKerberosAuthentication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:].cold.3(v5, (uint64_t)self, v9);

  objc_msgSend(v8, "extensionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "performKerberosOnly");

  if (v11)
  {
    objc_msgSend(v8, "currentSettings");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateExpirationChecked:", 0);
    objc_msgSend(v12, "setPasswordNeverExpires:", 0);
    objc_msgSend(v12, "setDatePasswordExpires:", 0);
    objc_msgSend(v12, "setDatePasswordLastChanged:", 0);
    objc_msgSend(v12, "setDateADPasswordCanChange:", 0);
    objc_msgSend(v12, "setDatePasswordLastChangedAtLogin:", 0);
    objc_msgSend(v12, "setNetworkHomeDirectory:", 0);
LABEL_9:
    v17 = 1;
    goto LABEL_13;
  }
  -[SOKerberosAuthentication kerberosHelper](self, "kerberosHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v14 = objc_msgSend(v13, "getPACForCred:pac:", a4, &v22);
  v12 = v22;

  SO_LOG_SOKerberosAuthentication();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:].cold.1();

    objc_msgSend(v8, "setPacData:", v12);
    +[SOKerberosAuthentication savePacValues:atLogin:](SOKerberosAuthentication, "savePacValues:atLogin:", v8, v5);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:].cold.2();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDatePasswordLastChanged:", v18);

  objc_msgSend(v8, "currentSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDateExpirationChecked:", 0);

  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)mapErrorToKnownError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kGSSMinorErrorCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328361);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328360);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToNumber:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = 10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328378);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqualToNumber:", v11);

      if ((v12 & 1) != 0)
      {
        v8 = 11;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328366);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "isEqualToNumber:", v13);

        if ((v14 & 1) != 0)
        {
          v8 = 9;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328228);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "isEqualToNumber:", v15);

          if ((v16 & 1) != 0)
          {
            v8 = 12;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328165);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v5, "isEqualToNumber:", v17);

            if ((v18 & 1) != 0)
            {
              v8 = 13;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328370);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v5, "isEqualToNumber:", v19);

              if ((v20 & 1) != 0)
              {
                v8 = 14;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1765328377);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v5, "isEqualToNumber:", v21);

                if ((v22 & 1) != 0)
                {
                  v8 = 17;
                }
                else
                {
                  objc_msgSend(v3, "userInfo");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kGSSMechanism"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v5, "isEqualToNumber:", &unk_24D3F2D18)
                    && objc_msgSend(v3, "code") == 0x10000
                    && (objc_msgSend(v24, "isEqualToString:", CFSTR("SPNEGO")) & 1) != 0)
                  {
                    v8 = 17;
                  }
                  else
                  {
                    v8 = 7;
                  }

                }
              }
            }
          }
        }
      }
    }
  }

  return v8;
}

- (void)triggerVPNIfNeededUsingRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *srv;
  nw_parameters_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  NSObject *v16;
  NSObject *v17;
  void *evaluator_for_endpoint;
  NSObject *v19;
  int is_per_app_vpn;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  dispatch_time_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  void (*v33)(uint64_t);
  dispatch_semaphore_t v34;
  __int128 v35;
  __int128 v36;
  void (*v37)(uint64_t);
  dispatch_semaphore_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  SO_LOG_SOKerberosAuthentication();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.8();

  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "UTF8String");
  srv = (void *)nw_endpoint_create_srv();
  v13 = nw_parameters_create();
  v14 = xpc_array_create(0, 0);
  xpc_array_set_string(v14, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  v15 = xpc_array_create(0, 0);
  xpc_array_set_string(v15, 0xFFFFFFFFFFFFFFFFLL, "VPN");
  nw_parameters_set_required_netagent_classes();
  if (v8)
  {
    SO_LOG_SOKerberosAuthentication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.7();

    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    nw_parameters_set_source_application_by_bundle_id();
    v35 = 0u;
    v36 = 0u;
    if (v9 && objc_msgSend(MEMORY[0x24BE043A0], "auditTokenFromData:auditToken:", v9, &v35))
    {
      SO_LOG_SOKerberosAuthentication();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.6();

      v31 = v35;
      v32 = v36;
      nw_parameters_set_source_application();
    }
  }
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v30 = (void *)nw_path_evaluator_copy_path();
  SO_LOG_SOKerberosAuthentication();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.5();

  v39 = 0;
  v40 = 0;
  if (nw_path_get_vpn_config_id())
  {
    is_per_app_vpn = nw_path_is_per_app_vpn();
    SO_LOG_SOKerberosAuthentication();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (is_per_app_vpn)
    {
      if (v22)
        -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.2();
    }
    else if (v22)
    {
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.3();
    }

    ne_session_create();
    *(_QWORD *)&v35 = 0;
    *((_QWORD *)&v35 + 1) = &v35;
    *(_QWORD *)&v36 = 0x3032000000;
    *((_QWORD *)&v36 + 1) = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    v38 = dispatch_semaphore_create(0);
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    *(_QWORD *)&v32 = 0x3032000000;
    *((_QWORD *)&v32 + 1) = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v34 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ne_session_set_event_handler();

    SO_LOG_SOKerberosAuthentication();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.1();

    ne_session_start();
    v26 = *(NSObject **)(*((_QWORD *)&v35 + 1) + 40);
    v27 = dispatch_time(0, 120000000000);
    dispatch_semaphore_wait(v26, v27);
    ne_session_cancel();
    v28 = *(NSObject **)(*((_QWORD *)&v31 + 1) + 40);
    v29 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v28, v29);
    ne_session_release();
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    SO_LOG_SOKerberosAuthentication();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[SOKerberosAuthentication triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:].cold.4();

  }
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    dispatch_get_global_queue(0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    ne_session_get_status();

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  v4 = ne_session_status_to_string();
  SO_LOG_SOKerberosAuthentication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_2(v4, v5);

  if ((a2 & 0xFFFFFFFD) == 1)
  {
    SO_LOG_SOKerberosAuthentication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (BOOL)siteDiscoveryInProgress
{
  return self->_siteDiscoveryInProgress;
}

- (void)setSiteDiscoveryInProgress:(BOOL)a3
{
  self->_siteDiscoveryInProgress = a3;
}

- (SOKerberosHelper)kerberosHelper
{
  return (SOKerberosHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKerberosHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SOKeychainHelper)keychainHelper
{
  return (SOKeychainHelper *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SOADSiteDiscovery)siteDiscovery
{
  return (SOADSiteDiscovery *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSiteDiscovery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteDiscovery, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:orError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "callerBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v2, v3, "UUID nil after authentication for calling app: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:(id *)a1 returningToken:(NSObject *)a2 orError:.cold.2(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "length");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v3, "token received: %lu bytes", v4);
  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "using credential: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.4(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datePasswordLastChanged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datePasswordLastChangedAtLogin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_215A1B000, a2, v8, "password last changed: %@, at login: %@", v9);

}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateNextPacRefresh");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v5, "Next pac refresh: %@", v6);

  OUTLINED_FUNCTION_3_1();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "new credential received: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.7()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_215A1B000, v0, OS_LOG_TYPE_ERROR, "error for new credential: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "response for new credential: %lu", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "requireUserPresence is required for MDM certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:orError:.cold.10(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "callerBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v2, v3, "UUID nil after find credential for calling app: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "found existing credential received: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:(NSObject *)a1 returningToken:(uint64_t)a2 orError:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = 2;
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a1, a3, "response for find existing credential: %lu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "starting site code discovery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "using sitecode: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)attemptKerberosWithContext:(void *)a1 returningToken:(NSObject *)a2 orError:.cold.15(void *a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "credentialUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v5, "using credential from cache: %@", v6);

  OUTLINED_FUNCTION_3_1();
}

- (void)attemptKerberosWithContext:returningToken:orError:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Start of attemptKerberos", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)saveValuesForPlugins:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "saveValuesForPlugins", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)savePacValues:(void *)a1 atLogin:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dateNextPacRefresh");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "Next pac refresh: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)setSiteCodeUsingContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "siteCodeForCurrentNetworkAndRealmUsingContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "sitecode not found in cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:(void *)a1 networkFingerprint:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using cached sitecode: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)retrieveCachedSiteCodeFromCacheForBundleIdentifier:networkFingerprint:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "checking sitecode cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "calling discoverADInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "sitecode saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __134__SOKerberosAuthentication__determineSiteCodeUsingDispatchGroup_bundleIdentifier_auditTokenData_networkFingerprint_requireTLSForLDAP___block_invoke_11_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "received sitecode: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "password is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kGSSICAppleSourceApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using source app signing identifier: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kGSSICAppleSourceApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using impersonation source app signing identifier: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "complete bundleIdACL: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kGSSICSiteName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using sitecode: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("kGSSICKerberosCacheName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using cache: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "certificateTokenID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "certificate not found for token id: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "certificateTokenID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "Could not get a SecIdentityRef for token id: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "error retrieving identity for persistient ref", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.10(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "smartCardLAContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using LAContext: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:(uint64_t)a1 returningCredential:(void *)a2 orError:(NSObject *)a3 .cold.11(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "certificateTokenID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_215A1B000, a3, v5, "using certificate: %@ for token id: %@", v6);

  OUTLINED_FUNCTION_3_1();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.12(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "certificateUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v5, "certificate not found for uuid: %@", v6);

  OUTLINED_FUNCTION_3_1();
}

- (void)createNewCredentialUsingContext:(uint64_t)a1 returningCredential:(void *)a2 orError:(NSObject *)a3 .cold.13(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "extensionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "certificateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_215A1B000, a3, v6, "using certificate: %@ for uuid: %@", v7);

  OUTLINED_FUNCTION_3_1();
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "using pkinit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createNewCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.15(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userPrincipalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using upn: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)createNewCredentialUsingContext:returningCredential:orError:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "createNewCredentialUsingContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)findExistingCredentialUsingContext:(void *)a1 returningCredential:(NSObject *)a2 orError:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userPrincipalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "using upn: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)findExistingCredentialUsingContext:returningCredential:orError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "findExistingCredentialUsingContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)changePasswordWithContext:(id *)a1 withError:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_215A1B000, v2, v3, "error during changePasswordForUPN: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)changePasswordWithContext:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "changePasswordForUPN result: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)changePasswordWithContext:(NSObject *)a3 withError:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userPrincipalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[SOKerberosAuthentication changePasswordWithContext:withError:]";
  v8 = 2114;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_215A1B000, a3, OS_LOG_TYPE_DEBUG, "%s using upn: %{public}@ on %@", (uint8_t *)&v6, 0x20u);

}

- (void)refreshPacValuesWithContext:atLogin:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  v3 = 134218242;
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  _os_log_error_impl(&dword_215A1B000, v2, OS_LOG_TYPE_ERROR, "Error retrieving new TGT after password change: %lu, %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)refreshPacValuesWithContext:(uint64_t)a1 atLogin:(NSObject *)a2 error:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[SOKerberosAuthentication refreshPacValuesWithContext:atLogin:error:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_10(&dword_215A1B000, a2, a3, "%s  on %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)refreshPacValuesWithContext:credential:atLogin:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "Received Pac Data: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)refreshPacValuesWithContext:credential:atLogin:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "Error refreshing pac", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)refreshPacValuesWithContext:(char)a1 credential:(uint64_t)a2 atLogin:(os_log_t)log .cold.3(char a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[SOKerberosAuthentication refreshPacValuesWithContext:credential:atLogin:]";
  v5 = 1024;
  v6 = a1 & 1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_215A1B000, log, OS_LOG_TYPE_DEBUG, "%s login: %d on %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: starting connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: creating per app vpn connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: creating vpn connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: no vpn to start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: connection needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: using audit token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "trigger VPN: using bundleIdentifier: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)triggerVPNIfNeededUsingRealm:bundleIdentifier:auditToken:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "start of trigger VPN if needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "trigger VPN: finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __85__SOKerberosAuthentication_triggerVPNIfNeededUsingRealm_bundleIdentifier_auditToken___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a1, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "trigger VPN: connection status: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

@end
