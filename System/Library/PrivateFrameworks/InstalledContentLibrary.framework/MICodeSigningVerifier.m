@implementation MICodeSigningVerifier

- (MICodeSigningVerifier)initWithBundle:(id)a3
{
  id v5;
  MICodeSigningVerifier *v6;
  MICodeSigningVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MICodeSigningVerifier;
  v6 = -[MICodeSigningVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    v7->_logResourceVerificationErrors = 1;
  }

  return v7;
}

+ (id)codeSigningVerifierForBundle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundle:", v3);

  return v4;
}

+ (id)_validateSignatureAndCopyInfoForURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = MIAssertHighResourceUsage();
  v10 = (void *)MEMORY[0x1BCCAA068](v9);
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MISValidateSignatureAndCopyInfo();

  objc_autoreleasePoolPop(v10);
  MIClearResourceAssertion();
  if ((_DWORD)v12)
  {
    v23[0] = CFSTR("LegacyErrorString");
    v23[1] = CFSTR("LibMISErrorNumber");
    v24[0] = CFSTR("ApplicationVerificationFailed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MIErrorStringForMISError(v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]", 79, CFSTR("MIInstallerErrorDomain"), 13, 0, v14, CFSTR("Failed to verify code signature of %@ : 0x%08x (%@)"), v16, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21[0] = CFSTR("LegacyErrorString");
    v21[1] = CFSTR("LibMISErrorNumber");
    v22[0] = CFSTR("ApplicationVerificationFailed");
    v22[1] = &unk_1E6CD48C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]", 84, CFSTR("MIInstallerErrorDomain"), 13, 0, v13, CFSTR("Failed to get info dictionary from MISValidateSignatureAndCopyInfo when verifying %@"), v19, (uint64_t)v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return 0;
}

- (id)_loadSystemDetachedSignatureForBundleID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  id v15;

  v5 = a3;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemAppDetachedSignaturesDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 3, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (!v9)
  {
    objc_msgSend(v8, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _loadSystemDetachedSignatureForBundleID:error:]", 109, CFSTR("MIInstallerErrorDomain"), 129, v10, 0, CFSTR("Could not load detached signature data for %@ from %@"), v11, (uint64_t)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v10 = objc_retainAutorelease(v12);
      *a4 = v10;
    }
    else
    {
      v10 = v12;
    }
  }

  return v9;
}

- (BOOL)_getMICodeSignerTypeFromMISInfoDict:(id)a3 codeSignerType:(unint64_t *)a4 profileType:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  BOOL v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DE7298]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (v13)
  {
    v14 = v10;
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72B8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MIBooleanValue(v15, 0);

    if (v16)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72C0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MIBooleanValue(v17, 0);

      if ((v18 & 1) != 0)
      {
        v19 = 2;
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72B0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = MIBooleanValue(v24, 0);

        if (v25)
          v19 = 3;
        else
          v19 = 4;
      }
    }
    else
    {
      v19 = 1;
    }

    v26 = objc_msgSend(v13, "longValue");
    switch(v26)
    {
      case 0:
      case 1:
      case 2:
      case 4:
        if (!a4)
          goto LABEL_18;
        goto LABEL_17;
      case 3:
        if (v19 == 1)
        {
          -[MICodeSigningVerifier bundle](self, "bundle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 245, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("kMISValidationInfoValidatedByProfile was not set for %@ but kMISValidationInfoSignerType was set to MISSignerTypeProfile"), v30, (uint64_t)v29);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        v26 = 3;
        if (a4)
LABEL_17:
          *a4 = v26;
LABEL_18:
        v22 = 0;
        if (a5)
          *a5 = v19;
        v23 = 1;
        break;
      case 5:
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 254, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("MISSignerType is MISSignerTypeLegacyVPN which is not supported by MI; returning MICodeSignerTypeUnknown"),
          v27,
          v31);
        goto LABEL_23;
      case 6:
        v26 = 5;
        if (!a4)
          goto LABEL_18;
        goto LABEL_17;
      default:
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 260, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("kMISValidationInfoSignerType was set to unknown value %ld"), v27, v26);
LABEL_23:
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (!a6)
          goto LABEL_24;
        goto LABEL_10;
    }
  }
  else
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]", 227, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("kMISValidationInfoSignerType is not set or is not a number for %@"), v21, (uint64_t)v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    if (a6)
    {
LABEL_10:
      v22 = objc_retainAutorelease(v22);
      v23 = 0;
      *a6 = v22;
    }
    else
    {
LABEL_24:
      v23 = 0;
    }
  }

  return v23;
}

- (BOOL)performValidationWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  _BOOL4 v52;
  void *v53;
  id v54;
  const __CFData *v55;
  id *v56;
  void *v57;
  BOOL v58;
  __SecCertificate *v59;
  __SecCertificate *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  id v72;
  id v73;
  void *v74;
  MICodeSigningInfo *v75;
  MICodeSigningInfo *v76;
  MICodeSigningInfo *signingInfo;
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
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  char v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[7];
  _QWORD v116[7];
  _QWORD v117[5];
  _QWORD v118[7];

  v118[5] = *MEMORY[0x1E0C80C00];
  v105 = 0;
  v106 = 0;
  v4 = -[MICodeSigningVerifier validateResources](self, "validateResources") ^ 1;
  +[MITestManager sharedInstance](MITestManager, "sharedInstance");
  v96 = objc_claimAutoreleasedReturnValue();
  if (-[MICodeSigningVerifier verifyTrustCachePresence](self, "verifyTrustCachePresence"))
    -[MICodeSigningVerifier setAllowAdhocSigning:](self, "setAllowAdhocSigning:", 1);
  if (-[MICodeSigningVerifier validateResources](self, "validateResources"))
    v4 = -[MICodeSigningVerifier validateUsingDetachedSignature](self, "validateUsingDetachedSignature") | v4;
  v98 = *MEMORY[0x1E0DE7328];
  v117[0] = *MEMORY[0x1E0DE7328];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v5;
  v92 = *MEMORY[0x1E0DE72F0];
  v117[1] = *MEMORY[0x1E0DE72F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v6;
  v89 = *MEMORY[0x1E0DE72C8];
  v117[2] = *MEMORY[0x1E0DE72C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MICodeSigningVerifier allowAdhocSigning](self, "allowAdhocSigning"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DE72D0];
  v118[2] = v7;
  v118[3] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0DE72F8];
  v88 = v8;
  v117[3] = v8;
  v117[4] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MICodeSigningVerifier performOnlineAuthorization](self, "performOnlineAuthorization"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (-[MICodeSigningVerifier verifyTrustCachePresence](self, "verifyTrustCachePresence"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE7310]);
  if (-[MICodeSigningVerifier skipProfileIDValidation](self, "skipProfileIDValidation"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DE7308]);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v12;
    MOLogWrite();

  }
  -[MICodeSigningVerifier bundle](self, "bundle", v79, v86);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "estimatedMemoryUsageToValidate");
  -[MICodeSigningVerifier bundle](self, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MIReserveMemoryForValidation(v16, v18);

  v20 = (void *)objc_opt_class();
  -[MICodeSigningVerifier bundle](self, "bundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  objc_msgSend(v20, "_validateSignatureAndCopyInfoForURL:withOptions:error:", v22, v12, &v104);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v104;

  MIReturnMemoryUsedForValidation(v19);
  if (!v23)
  {
    v45 = 0;
    v99 = 0;
    v46 = 0;
    goto LABEL_44;
  }
  if (-[MICodeSigningVerifier validateResources](self, "validateResources")
    && -[MICodeSigningVerifier validateUsingDetachedSignature](self, "validateUsingDetachedSignature"))
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v24;
    -[MICodeSigningVerifier _loadSystemDetachedSignatureForBundleID:error:](self, "_loadSystemDetachedSignatureForBundleID:error:", v26, &v103);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v103;

    if (!v27)
    {
      v93 = 0;
      v99 = 0;
      v46 = 0;
      v40 = 0;
      v57 = (void *)v96;
LABEL_72:
      v56 = a3;
      goto LABEL_73;
    }
    v29 = MEMORY[0x1E0C9AAA0];
    v116[0] = MEMORY[0x1E0C9AAA0];
    v115[0] = v98;
    v115[1] = v92;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v30;
    v116[2] = v29;
    v115[2] = v89;
    v115[3] = v9;
    v31 = *MEMORY[0x1E0DE72E0];
    v116[3] = v29;
    v116[4] = v27;
    v90 = v27;
    v32 = *MEMORY[0x1E0DE7320];
    v115[4] = v31;
    v115[5] = v32;
    v115[6] = v88;
    v116[5] = MEMORY[0x1E0C9AAB0];
    v116[6] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 7);
    v33 = objc_claimAutoreleasedReturnValue();

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      -[MICodeSigningVerifier bundle](self, "bundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bundleURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "path");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v36 = (void *)objc_opt_class();
    -[MICodeSigningVerifier bundle](self, "bundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bundleURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v28;
    objc_msgSend(v36, "_validateSignatureAndCopyInfoForURL:withOptions:error:", v38, v33, &v102);
    v39 = (void *)v33;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v102;

    if (!v40)
    {
      v93 = 0;
      v99 = 0;
      v46 = 0;
      v28 = v41;
      v56 = a3;
      v57 = (void *)v96;
      v27 = v90;
LABEL_73:

      v24 = v28;
      v45 = v93;
      if (!v56)
        goto LABEL_74;
      goto LABEL_45;
    }

  }
  else
  {
    v41 = v24;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72A0], v80);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;

  v93 = v44;
  if (!v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE7268], v81);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v48 = v47;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v49 = v48;
  else
    v49 = 0;

  v99 = v49;
  if (!v49 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE7278], v82);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v51 = v50;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v51;
  else
    v46 = 0;
  v45 = v93;

  if (!v46 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    v45 = v93;
  }
  v101 = v41;
  v52 = -[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:](self, "_getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:", v23, &v105, &v106, &v101, v83);
  v24 = v101;

  if (!v52)
  {
LABEL_44:
    v40 = 0;
    v56 = a3;
    v57 = (void *)v96;
    if (!a3)
    {
LABEL_74:
      v58 = 0;
      goto LABEL_75;
    }
LABEL_45:
    v24 = objc_retainAutorelease(v24);
    v58 = 0;
    *v56 = v24;
    goto LABEL_75;
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE7290]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v54 = v53;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v55 = (const __CFData *)objc_retainAutorelease(v54);
  else
    v55 = 0;

  if (v55)
  {
    v59 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v55);
    if (v59)
    {
      v60 = v59;
      v40 = (void *)SecCertificateCopySubjectSummary(v59);
      v27 = (void *)SecCertificateCopyOrganization();
      CFRelease(v60);
      if (v40)
      {
        v57 = (void *)v96;
        if (v27 && objc_msgSend(v27, "count"))
        {
          if ((unint64_t)objc_msgSend(v27, "count") >= 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
          {
            -[MICodeSigningVerifier bundle](self, "bundle");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v27;
            MOLogWrite();

          }
          objc_msgSend(v27, "objectAtIndexedSubscript:", 0, v84, v87);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_62;
        }
        v107[0] = CFSTR("LegacyErrorString");
        v107[1] = CFSTR("LibMISErrorNumber");
        v108[0] = CFSTR("ApplicationVerificationFailed");
        v108[1] = &unk_1E6CD48C8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[MICodeSigningVerifier bundle](self, "bundle");
        v67 = objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 432, CFSTR("MIInstallerErrorDomain"), 13, 0, v64, CFSTR("Could not extract signer organizations for %@"), v68, v67);
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v109[0] = CFSTR("LegacyErrorString");
        v109[1] = CFSTR("LibMISErrorNumber");
        v110[0] = CFSTR("ApplicationVerificationFailed");
        v110[1] = &unk_1E6CD48C8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[MICodeSigningVerifier bundle](self, "bundle");
        v67 = objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 427, CFSTR("MIInstallerErrorDomain"), 13, 0, v64, CFSTR("Could not extract signer identity for %@"), v69, v67);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v57 = (void *)v96;
      }

      v24 = (id)v67;
      goto LABEL_71;
    }
    v111[0] = CFSTR("LegacyErrorString");
    v111[1] = CFSTR("LibMISErrorNumber");
    v112[0] = CFSTR("ApplicationVerificationFailed");
    v112[1] = &unk_1E6CD48C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MICodeSigningVerifier bundle](self, "bundle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 419, CFSTR("MIInstallerErrorDomain"), 13, 0, v27, CFSTR("Could not create certificate from data for %@"), v65, (uint64_t)v64);
LABEL_67:
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v57 = (void *)v96;
LABEL_71:

    goto LABEL_72;
  }
  if (!-[MICodeSigningVerifier allowAdhocSigning](self, "allowAdhocSigning"))
  {
    v113[0] = CFSTR("LegacyErrorString");
    v113[1] = CFSTR("LibMISErrorNumber");
    v114[0] = CFSTR("ApplicationVerificationFailed");
    v114[1] = &unk_1E6CD48C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MICodeSigningVerifier bundle](self, "bundle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MICodeSigningVerifier performValidationWithError:]", 413, CFSTR("MIInstallerErrorDomain"), 13, 0, v27, CFSTR("Failed to extract signer identity from %@"), v66, (uint64_t)v64);
    goto LABEL_67;
  }
  v95 = 0;
  v40 = 0;
  v57 = (void *)v96;
LABEL_62:
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72A8]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v62 = v61;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v63 = v62;
  else
    v63 = 0;

  v100 = 0;
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0DE7280]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v72 = v71;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v73 = v72;
  else
    v73 = 0;
  v97 = v12;

  v91 = v63;
  if (v73)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      -[MICodeSigningVerifier bundle](self, "bundle");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "identifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (objc_msgSend(v57, "isRunningInTestMode:outError:", &v100, 0) && v100)
  {
    if (objc_msgSend(v57, "testFlagsAreSet:", 32))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        -[MICodeSigningVerifier bundle](self, "bundle");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "identifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "MOBILEINSTALLATION_TEST_LAUNCH_WARNING_DATA", 43, v84);
      v73 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v73 = 0;
    }
  }
  v75 = [MICodeSigningInfo alloc];
  v76 = -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:](v75, "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:", v40, v95, v93, v91, v99, v46, v105, v106, 2, v73);
  signingInfo = self->_signingInfo;
  self->_signingInfo = v76;

  v45 = v93;
  v58 = 1;
  v12 = v97;
LABEL_75:

  return v58;
}

+ (BOOL)validateWatchKitV1StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("_WatchKitStub/WK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (validateWatchKitV1StubExecutableBundle_error__onceToken != -1)
    dispatch_once(&validateWatchKitV1StubExecutableBundle_error__onceToken, &__block_literal_global_7);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    objc_msgSend(v6, "executableURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v10 = objc_msgSend(a1, "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:", v6, v8, validateWatchKitV1StubExecutableBundle_error__trustedHashes, CFSTR("__watchkit"), CFSTR("com.apple.WK"), a4, v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV1StubExecutableBundle_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("fApr4oevAMrl65iFf3wAhUqJIOk="), 0);
  +[MISignatureAgnosticHasher packedNumberForCPUType:subtype:](MISignatureAgnosticHasher, "packedNumberForCPUType:subtype:", 12, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)validateWatchKitV1StubExecutableBundle_error__trustedHashes;
  validateWatchKitV1StubExecutableBundle_error__trustedHashes = v2;

}

+ (BOOL)validateWatchKitV2StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("_WatchKitStub/WK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (validateWatchKitV2StubExecutableBundle_error__onceToken != -1)
    dispatch_once(&validateWatchKitV2StubExecutableBundle_error__onceToken, &__block_literal_global_61);
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    objc_msgSend(v6, "executableURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v10 = objc_msgSend(a1, "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:", v6, v8, validateWatchKitV2StubExecutableBundle_error__trustedHashes, CFSTR("__watchkit"), CFSTR("com.apple.WK"), a4, v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV2StubExecutableBundle_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("gMfFfUYLxpniCKUmtjSz0XLrXGs="), 0);
  +[MISignatureAgnosticHasher packedNumberForCPUType:subtype:](MISignatureAgnosticHasher, "packedNumberForCPUType:subtype:", 12, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)validateWatchKitV2StubExecutableBundle_error__trustedHashes;
  validateWatchKitV2StubExecutableBundle_error__trustedHashes = v2;

}

+ (BOOL)_validateBundleExecutable:(id)a3 againstStubAt:(id)a4 trustedHashes:(id)a5 sectionName:(id)a6 signingIdentifier:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  int v22;
  id v23;
  MISignatureAgnosticHasher *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  MISignatureAgnosticHasher *v28;
  void *v29;
  MISignatureAgnosticHasher *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id *v46;
  BOOL v47;
  uint64_t v48;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v63 = v17;
  if (!v14)
  {
    v21 = 0;
    goto LABEL_14;
  }
  v18 = v17;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "itemExistsAtURL:", v14);

  v21 = 0;
  if (!v18 || !v20)
  {
LABEL_14:
    v28 = [MISignatureAgnosticHasher alloc];
    objc_msgSend(v13, "executableURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MISignatureAgnosticHasher initWithExecutable:searchForSectionNamed:](v28, "initWithExecutable:searchForSectionNamed:", v29, 0);

    v60 = v16;
    if (v30)
    {
      v69 = v21;
      v31 = -[MISignatureAgnosticHasher performHashWithError:](v30, "performHashWithError:", &v69);
      v23 = v69;

      if (v31)
      {
        -[MISignatureAgnosticHasher hashes](v30, "hashes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v32;
        if (v32)
        {
          v33 = v32;
          if (objc_msgSend(v32, "count"))
          {
            v58 = v14;
            v59 = v13;
            v34 = (void *)objc_msgSend(v33, "mutableCopy");
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v15 = v15;
            v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v66;
              while (2)
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v66 != v37)
                    objc_enumerationMutation(v15);
                  v39 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
                  objc_msgSend(v34, "objectForKeyedSubscript:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    objc_msgSend(v15, "objectForKeyedSubscript:", v39);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v41, "isEqualToData:", v40))
                    {
                      v64 = 0;
                      +[MISignatureAgnosticHasher unpackPackedCpuTypeAndSubType:cputype:subtype:](MISignatureAgnosticHasher, "unpackPackedCpuTypeAndSubType:cputype:subtype:", v39, (char *)&v64 + 4, &v64);
                      v13 = v59;
                      objc_msgSend(v59, "executableURL");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "path");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 572, CFSTR("MIInstallerErrorDomain"), 72, 0, &unk_1E6CD4680, CFSTR("Executable at %@ did not match stub hash for cputype %d cpusubtype %d: %@ != %@"), v52, (uint64_t)v51);
                      v43 = objc_claimAutoreleasedReturnValue();

                      v23 = v41;
                      v25 = v15;
                      goto LABEL_42;
                    }
                    objc_msgSend(v34, "removeObjectForKey:", v39);

                  }
                }
                v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
                if (v36)
                  continue;
                break;
              }
            }

            if (!objc_msgSend(v34, "count"))
            {
              v47 = 1;
              v14 = v58;
              v13 = v59;
              v16 = v60;
              v45 = v61;
              goto LABEL_39;
            }
            v13 = v59;
            objc_msgSend(v59, "executableURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "path");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 581, CFSTR("MIInstallerErrorDomain"), 72, 0, &unk_1E6CD46A8, CFSTR("Did not validate all slice hashes on executable %@; unchecked hashes: %@"),
              v42,
              (uint64_t)v40);
            v43 = objc_claimAutoreleasedReturnValue();
LABEL_42:
            v14 = v58;
LABEL_37:
            v46 = a8;

            v23 = (id)v43;
            v16 = v60;
            v45 = v61;
            if (a8)
              goto LABEL_38;
            goto LABEL_34;
          }
        }
        objc_msgSend(v13, "executableURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 560, CFSTR("MIInstallerErrorDomain"), 72, v23, &unk_1E6CD4658, CFSTR("Unable to get hashes for executable %@"), v48, (uint64_t)v40);
        v43 = objc_claimAutoreleasedReturnValue();
LABEL_36:
        v34 = 0;
        goto LABEL_37;
      }
      v21 = v23;
    }
    else
    {
      v23 = v21;
    }
    objc_msgSend(v13, "executableURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 554, CFSTR("MIInstallerErrorDomain"), 72, v21, &unk_1E6CD4630, CFSTR("Unable to compute hash for executable %@"), v44, (uint64_t)v40);
    v43 = objc_claimAutoreleasedReturnValue();
    v61 = 0;
    goto LABEL_36;
  }
  v71 = 0;
  v22 = objc_msgSend(a1, "_validateStubSignature:withSigningID:error:", v14, v18, &v71);
  v23 = v71;
  if (v22)
  {
    v24 = -[MISignatureAgnosticHasher initWithExecutable:searchForSectionNamed:]([MISignatureAgnosticHasher alloc], "initWithExecutable:searchForSectionNamed:", v14, v16);
    v25 = v24;
    if (v24)
    {
      v70 = v23;
      v26 = -[MISignatureAgnosticHasher performHashWithError:](v24, "performHashWithError:", &v70);
      v21 = v70;

      if (v26)
      {
        if (v16 && (objc_msgSend(v25, "hasNamedSection") & 1) == 0)
        {
          objc_msgSend(v14, "path");
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v16;
          v40 = (void *)v54;
          v60 = v55;
          _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 542, CFSTR("MIInstallerErrorDomain"), 72, v21, &unk_1E6CD4608, CFSTR("Stub %@ does not have required section %@"), v56, v54);
          v43 = objc_claimAutoreleasedReturnValue();
          v61 = 0;
          v34 = 0;
          v30 = 0;
          v23 = v21;
          goto LABEL_37;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          objc_msgSend(v14, "path");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        objc_msgSend(v25, "hashes", v57);
        v27 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v27;
        goto LABEL_14;
      }
      v60 = v16;
      v23 = v21;
    }
    else
    {
      v60 = v16;
    }
    objc_msgSend(v14, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]", 537, CFSTR("MIInstallerErrorDomain"), 72, v23, &unk_1E6CD45E0, CFSTR("Unable to compute hash for stub %@"), v53, (uint64_t)v40);
    v43 = objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v34 = 0;
    v30 = 0;
    goto LABEL_37;
  }
  v45 = 0;
  v34 = 0;
  v30 = 0;
  v46 = a8;
  if (a8)
  {
LABEL_38:
    v23 = objc_retainAutorelease(v23);
    v47 = 0;
    *v46 = v23;
    goto LABEL_39;
  }
LABEL_34:
  v47 = 0;
LABEL_39:

  return v47;
}

+ (BOOL)_validateStubSignature:(id)a3 withSigningID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0DE7320];
  v26[0] = *MEMORY[0x1E0DE7328];
  v26[1] = v10;
  v27[0] = MEMORY[0x1E0C9AAB0];
  v27[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(a1, "_validateSignatureAndCopyInfoForURL:withOptions:error:", v8, v11, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72B8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MIBooleanValue(v14, 0);

    if (v15)
    {
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]", 611, CFSTR("MIInstallerErrorDomain"), 72, 0, &unk_1E6CD46D0, CFSTR("Executable stub at %@ not signed by Apple."), v17, (uint64_t)v16);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DE72A0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v22;
      else
        v19 = 0;

      if ((objc_msgSend(v19, "isEqualToString:", v9) & 1) != 0)
      {
        v20 = 1;
        goto LABEL_14;
      }
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]", 618, CFSTR("MIInstallerErrorDomain"), 72, 0, &unk_1E6CD46F8, CFSTR("Executable stub at %@ had unexpected signing identifier '%@'; expected %@."),
        v23,
        (uint64_t)v16);
      v18 = objc_claimAutoreleasedReturnValue();
    }

    v13 = (id)v18;
    if (a5)
      goto LABEL_13;
  }
  else
  {
    v19 = 0;
    if (a5)
    {
LABEL_13:
      v13 = objc_retainAutorelease(v13);
      v20 = 0;
      *a5 = v13;
      goto LABEL_14;
    }
  }
  v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)allowAdhocSigning
{
  return self->_allowAdhocSigning;
}

- (void)setAllowAdhocSigning:(BOOL)a3
{
  self->_allowAdhocSigning = a3;
}

- (BOOL)logResourceVerificationErrors
{
  return self->_logResourceVerificationErrors;
}

- (void)setLogResourceVerificationErrors:(BOOL)a3
{
  self->_logResourceVerificationErrors = a3;
}

- (BOOL)validateResources
{
  return self->_validateResources;
}

- (void)setValidateResources:(BOOL)a3
{
  self->_validateResources = a3;
}

- (BOOL)performOnlineAuthorization
{
  return self->_performOnlineAuthorization;
}

- (void)setPerformOnlineAuthorization:(BOOL)a3
{
  self->_performOnlineAuthorization = a3;
}

- (BOOL)validateUsingDetachedSignature
{
  return self->_validateUsingDetachedSignature;
}

- (void)setValidateUsingDetachedSignature:(BOOL)a3
{
  self->_validateUsingDetachedSignature = a3;
}

- (BOOL)verifyTrustCachePresence
{
  return self->_verifyTrustCachePresence;
}

- (void)setVerifyTrustCachePresence:(BOOL)a3
{
  self->_verifyTrustCachePresence = a3;
}

- (BOOL)skipProfileIDValidation
{
  return self->_skipProfileIDValidation;
}

- (void)setSkipProfileIDValidation:(BOOL)a3
{
  self->_skipProfileIDValidation = a3;
}

- (MICodeSigningInfo)signingInfo
{
  return self->_signingInfo;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_signingInfo, 0);
}

@end
