@implementation NSDictionary(ExtensionKitAdditions)

- (id)_EX_dictionaryForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_EX_stringForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)_EX_objectForKey:()ExtensionKitAdditions ofClass:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)_EX_BOOLForKey:()ExtensionKitAdditions defaultValue:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (id)_EX_arrayForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_EX_dictionaryWithSignedURL:()ExtensionKitAdditions error:
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  const __CFURL *v10;
  NSObject *v11;
  OSStatus v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __SecCode *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD *v49;
  void *v50;
  OSStatus v51;
  OSStatus v52;
  CFDictionaryRef v53;
  id v54;
  id v55;
  OSStatus v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  mach_port_t v69;
  const __CFDictionary *v70;
  io_service_t MatchingService;
  kern_return_t v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  mach_port_t v79;
  id v80;
  kern_return_t v81;
  int v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  io_object_t objecta[2];
  io_object_t object;
  _QWORD *v89;
  _QWORD *v90;
  id v91;
  id v92;
  id v93;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;
  io_connect_t connect;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t input[2];
  __int128 buf;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _EXAuditTokenForCurrentProcess();
  objc_opt_class();
  _EXAuditTokenGetEntitlementValue(v6, CFSTR("com.apple.private.amfi.can-check-trust-cache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v8)
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_190C25000, v11, OS_LOG_TYPE_DEFAULT, "Unable to check trust cache due to missing entitlement", (uint8_t *)&buf, 2u);
    }
    v18 = 0;
    v19 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("sig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const __CFURL *)v5;
  v11 = v9;
  information = 0;
  staticCode = 0;
  v12 = SecStaticCodeCreateWithPath(v10, 0, &staticCode);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    input[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create SecStaticCodeRef [%ld]"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, input, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v17 = 0;
LABEL_26:

    v53 = 0;
    v54 = 0;
LABEL_27:
    if (staticCode)
      CFRelease(staticCode);
    v18 = 0;
    goto LABEL_30;
  }
  v93 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 0, &v93);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v93;
  if (!v17)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    input[0] = *MEMORY[0x1E0CB2D50];
    v47 = (void *)MEMORY[0x1E0CB3940];
    -[NSObject path](v11, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("Unable to read detached signature from %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    input[1] = *MEMORY[0x1E0CB3388];
    *(_QWORD *)&buf = v15;
    *((_QWORD *)&buf + 1) = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, input, 2);
    v48 = v5;
    v49 = a4;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v50);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    a4 = v49;
    v5 = v48;
    goto LABEL_4;
  }
  v30 = SecCodeSetDetachedSignature();
  if (v30)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set detached signature [%ld]"), v30);
LABEL_25:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, input, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = v33;
    v5 = v32;
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  v51 = SecStaticCodeCheckValidity(staticCode, 6u, 0);
  if (v51 != -66996 && v51)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to verify code directory [%ld]"), v51);
    goto LABEL_25;
  }
  v52 = SecCodeCopySigningInformation(staticCode, 0, &information);
  if (v52)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = v5;
    v33 = a4;
    input[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get code signing information [%ld]"), v52);
    goto LABEL_25;
  }
  v53 = information;
  information = 0;
  -[__CFDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6D40]);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  connect = 0;
  v69 = *MEMORY[0x1E0CBBAA8];
  v70 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(v69, v70);
  v90 = a4;
  object = MatchingService;
  if (!MatchingService)
  {
    v76 = (void *)MEMORY[0x1E0CB35C8];
    input[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&buf = CFSTR("Unable to find AMFI");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, input, 1);
    v77 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_59:
    v82 = 0;
    goto LABEL_60;
  }
  v72 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
  if (v72)
  {
    v86 = (void *)MEMORY[0x1E0CB35C8];
    input[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to connect to AMFI [%ld]"), v72);
    v73 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v73;
    v74 = (void *)MEMORY[0x1E0C99D80];
    v75 = input;
LABEL_58:
    objc_msgSend(v74, "dictionaryWithObjects:forKeys:count:", &buf, v75, 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v83);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v73;
    goto LABEL_59;
  }
  input[0] = 1;
  v79 = connect;
  v80 = objc_retainAutorelease(v54);
  v81 = IOConnectCallMethod(v79, 6u, input, 1u, (const void *)objc_msgSend(v80, "bytes"), objc_msgSend(v80, "length"), 0, 0, 0, 0);
  if (v81 == -536870160)
  {
    v86 = (void *)MEMORY[0x1E0CB35C8];
    v107[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cdhash: %@ is not in trust cache"), v80, v85);
LABEL_57:
    v73 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v73;
    v74 = (void *)MEMORY[0x1E0C99D80];
    v75 = v107;
    goto LABEL_58;
  }
  if (v81)
  {
    v86 = (void *)MEMORY[0x1E0CB35C8];
    v107[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown error (%ld) checking cdhash %@"), v81, v80);
    goto LABEL_57;
  }
  _EXDefaultLog();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v80;
    _os_log_impl(&dword_190C25000, v77, OS_LOG_TYPE_DEFAULT, "cdhash: %@ is trusted", (uint8_t *)&buf, 0xCu);
  }
  v78 = 0;
  v82 = 1;
LABEL_60:

  if (connect)
    IOServiceClose(connect);
  if (object)
    IOObjectRelease(object);
  if (v78)
  {
    v84 = objc_retainAutorelease(v78);
  }
  else
  {
    v84 = v29;
    if ((v82 & 1) == 0)
      +[NSDictionary(ExtensionKitAdditions) _EX_dictionaryWithSignedURL:error:].cold.1();
  }

  v16 = v84;
  if (!v82)
  {
    a4 = v90;
    goto LABEL_27;
  }
  v18 = staticCode;
  staticCode = 0;
  a4 = v90;
LABEL_30:
  if (information)
    CFRelease(information);
  if (v16)
    v55 = objc_retainAutorelease(v16);

  v19 = v16;
  if (!v18)
  {
    if (!a4)
      +[NSDictionary(ExtensionKitAdditions) _EX_dictionaryWithSignedURL:error:].cold.1();
    goto LABEL_38;
  }
  v56 = SecCodeMapMemory(v18, 0);
  if (v56)
  {
    v57 = (void *)MEMORY[0x1E0CB35C8];
    v103 = *MEMORY[0x1E0CB2D50];
    v58 = (void *)MEMORY[0x1E0CB3940];
    v59 = v56;
    -[__CFURL path](v10, "path");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v11, "path");
    *(_QWORD *)objecta = v11;
    v61 = v5;
    v62 = a4;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithFormat:", CFSTR("Unable to push signature to kernel [%ld]: plist: %@ signature: %@"), v59, v60, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v64;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v65);
    v66 = objc_claimAutoreleasedReturnValue();

    a4 = v62;
    v5 = v61;
    v11 = *(NSObject **)objecta;

    v19 = (id)v66;
LABEL_38:

    goto LABEL_39;
  }
LABEL_8:

  v92 = v19;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 8, &v92);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v92;

  if (!v20)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D50];
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Unable to read plist at %@"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v28);
    v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_39:
    v22 = 0;
    v20 = 0;
    v23 = 0;
    goto LABEL_40;
  }
  v91 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v20, 0, 0, &v91);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v91;

  if (v22)
  {
    v89 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v22;
      v23 = v22;
    }
    else
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v97 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("Extension cache at path [%@] not a dictionary: %@"), v42, v22);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v44);
      v45 = objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v19 = (id)v45;
    }
    a4 = v89;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v99 = *MEMORY[0x1E0CB2D50];
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Unable to deserialize %@"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 12, v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v23 = 0;
    v19 = (id)v39;
  }
LABEL_40:
  if (v18)
    CFRelease(v18);
  if (a4 && v19)
    *a4 = objc_retainAutorelease(v19);
  v67 = v23;

  return v67;
}

- (id)_EX_objectForKeys:()ExtensionKitAdditions ofClass:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(a1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (id)_EX_dictionaryForKeys:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_EX_arrayForKeys:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_EX_stringForKeys:()ExtensionKitAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKeys:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_EX_integerForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_EX_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (id)_EX_dictionaryByRemovingObjectForKey:()ExtensionKitAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = (id)objc_msgSend(v5, "copy");
  v7 = v6;

  return v7;
}

- (id)_EX_dictionaryBySettingObject:()ExtensionKitAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = (id)objc_msgSend(v8, "copy");
  v10 = v9;

  return v10;
}

- (id)_EX_dictionaryBySettingValuesForKeysWithDictionary:()ExtensionKitAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "setValuesForKeysWithDictionary:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = (id)objc_msgSend(v5, "copy");
  v7 = v6;

  return v7;
}

+ (void)_EX_dictionaryWithSignedURL:()ExtensionKitAdditions error:.cold.1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

@end
