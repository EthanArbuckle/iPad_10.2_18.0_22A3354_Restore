@implementation SOUtils

void __38__SOUtils_currentProcessContainerPath__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getpid();
  if (sandbox_container_path_for_pid())
  {
    if (*__error() == 45)
      goto LABEL_7;
    SO_LOG_SOUtils();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __38__SOUtils_currentProcessContainerPath__block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v1 = objc_claimAutoreleasedReturnValue();
    v0 = currentProcessContainerPath_containerPath;
    currentProcessContainerPath_containerPath = v1;
  }

LABEL_7:
  SO_LOG_SOUtils();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __38__SOUtils_currentProcessContainerPath__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

}

void __35__SOUtils_isAppSSOServiceAvailable__block_invoke()
{
  kern_return_t v0;
  BOOL v1;
  kern_return_t v2;
  NSObject *v3;
  mach_port_t sp;

  sp = 0;
  v0 = bootstrap_look_up(*MEMORY[0x1E0C81720], (const char *)objc_msgSend(CFSTR("com.apple.AppSSO.service-xpc"), "UTF8String"), &sp);
  if (v0)
    v1 = 1;
  else
    v1 = sp == 0;
  if (v1)
  {
    if ((isAppSSOServiceAvailable_appSSOServiceAvailable & 1) == 0)
    {
      v2 = v0;
      SO_LOG_SOUtils();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __35__SOUtils_isAppSSOServiceAvailable__block_invoke_cold_1(v2, v3);

    }
  }
  else
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], sp);
    isAppSSOServiceAvailable_appSSOServiceAvailable = 1;
  }
}

+ (BOOL)isAppSSOServiceAvailable
{
  if (isAppSSOServiceAvailable_onceToken != -1)
    dispatch_once(&isAppSSOServiceAvailable_onceToken, &__block_literal_global_7);
  return isAppSSOServiceAvailable_appSSOServiceAvailable;
}

+ (BOOL)sandboxAllowsXPC:(const char *)a3
{
  BOOL v4;
  NSObject *v5;

  if (a3)
  {
    getpid();
    v4 = sandbox_check() == 0;
  }
  else
  {
    v4 = 0;
  }
  SO_LOG_SOUtils();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[SOUtils sandboxAllowsXPC:].cold.1((uint64_t)a3, v4, v5);

  return v4;
}

+ (id)processNameForPID:(int)a3
{
  char *v4;
  unsigned int v5;
  int v6;
  char *v7;
  char buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = buffer;
  bzero(buffer, 0x400uLL);
  v5 = proc_name(a3, buffer, 0x400u);
  if ((v5 & 0x80000000) == 0)
  {
    buffer[v5] = 0;
    if (v5 >= 0xF)
    {
      v4 = buffer;
      v6 = proc_pidpath(a3, buffer, 0x400u);
      if ((v6 & 0x80000000) == 0)
      {
        buffer[v6] = 0;
        v7 = strrchr(buffer, 47);
        if (v7)
          v4 = v7 + 1;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)currentProcessName
{
  return (id)objc_msgSend(a1, "processNameForPID:", getpid());
}

+ (BOOL)currentProcessIsSandboxed
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  getpid();
  v2 = sandbox_check();
  SO_LOG_SOUtils();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[SOUtils currentProcessIsSandboxed].cold.1(v2 != 0, v3, v4, v5, v6, v7, v8, v9);

  return v2 != 0;
}

+ (id)currentProcessContainerPath
{
  if (currentProcessContainerPath_onceToken != -1)
    dispatch_once(&currentProcessContainerPath_onceToken, &__block_literal_global_5);
  return (id)currentProcessContainerPath_containerPath;
}

+ (int)mmapFile:(id)a3 mode:(int64_t)a4 mmapData:(id *)a5
{
  id v7;
  int v8;
  id v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;

  v7 = a3;
  *__error() = 0;
  if (a4 == 1)
    v8 = 514;
  else
    v8 = 0;
  v9 = objc_retainAutorelease(v7);
  v10 = shm_open((const char *)objc_msgSend(v9, "UTF8String"), v8, 511);
  if (v10 == -1)
  {
    SO_LOG_SOUtils();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SOUtils mmapFile:mode:mmapData:].cold.1();
    goto LABEL_15;
  }
  v11 = v10;
  if (a4 == 1)
    v12 = 3;
  else
    v12 = 1;
  ftruncate(v10, 4);
  v13 = mmap(0, 4uLL, v12, 1, v11, 0);
  if (v13 == (void *)-1)
  {
    close(v11);
    SO_LOG_SOUtils();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SOUtils mmapFile:mode:mmapData:].cold.2();
LABEL_15:

    v11 = -1;
    goto LABEL_16;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, 4, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:

  return v11;
}

+ (void)unmapFile:(int)a3 data:(id)a4
{
  id v5;
  void *v6;
  size_t v7;
  NSObject *v8;
  NSObject *v9;

  v5 = objc_retainAutorelease(a4);
  v6 = (void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  if (munmap(v6, v7) == -1)
  {
    SO_LOG_SOUtils();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SOUtils unmapFile:data:].cold.2();

  }
  if (close(a3) == -1)
  {
    SO_LOG_SOUtils();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SOUtils unmapFile:data:].cold.1();

  }
}

+ (BOOL)checkEntitlementFromXPC:(id)a3 entitlement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }
  SO_LOG_SOUtils();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    v15 = 1024;
    v16 = v8;
    _os_log_debug_impl(&dword_1CF39B000, v9, OS_LOG_TYPE_DEBUG, "checkEntitlementFromXPC: %{public}@, %{public}@ = %d", (uint8_t *)&v11, 0x1Cu);
  }

  return v8;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_5);
  return isInternalBuild_internalBuild;
}

void __26__SOUtils_isInternalBuild__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  isInternalBuild_internalBuild = os_variant_has_internal_content();
  SO_LOG_SOUtils();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __26__SOUtils_isInternalBuild__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

+ (id)mapArray:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)auditTokenFromData:(id)a3 auditToken:(id *)a4
{
  id v5;
  void *v6;
  _OWORD *v7;
  __int128 v8;
  BOOL v9;
  NSObject *v10;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "length") != 32)
  {
    SO_LOG_SOUtils();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SOUtils auditTokenFromData:auditToken:].cold.1(v6, v10);

    goto LABEL_9;
  }
  if (a4)
  {
    v7 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = v7[1];
    *(_OWORD *)a4->var0 = *v7;
    *(_OWORD *)&a4->var0[4] = v8;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

+ (int)pidFromAuditToken:(id *)a3
{
  __int128 v3;
  audit_token_t v5;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v5.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v5.val[4] = v3;
  return audit_token_to_pid(&v5);
}

+ (id)bundleIdentifierFromAuditToken:(id *)a3
{
  __int128 v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __SecTask *v15;
  __SecTask *v16;
  NSObject *v17;
  CFTypeRef cf;
  NSObject *v20;
  audit_token_t buf;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v4;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    SO_LOG_SOUtils();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.val[0]) = 0;
      _os_log_impl(&dword_1CF39B000, v13, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopySigningIdentifier()", (uint8_t *)&buf, 2u);
    }

    v14 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf.val[4] = v14;
    v15 = SecTaskCreateWithAuditToken(0, &buf);
    if (v15)
    {
      v16 = v15;
      cf = 0;
      v5 = SecTaskCopySigningIdentifier(v15, (CFErrorRef *)&cf);
      CFRelease(v16);
      if (cf)
      {
        SO_LOG_SOUtils();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          buf.val[0] = 138543362;
          *(_QWORD *)&buf.val[1] = cf;
          _os_log_impl(&dword_1CF39B000, v17, OS_LOG_TYPE_INFO, "bundleIdentifier: SecTaskCopySigningIdentifier() failed %{public}@", (uint8_t *)&buf, 0xCu);
        }

        CFRelease(cf);
      }
      else if (v5)
      {
        SO_LOG_SOUtils();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          buf.val[0] = 138543362;
          *(_QWORD *)&buf.val[1] = v5;
          _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_INFO, "bundleIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_4;
      }
    }
    else
    {
      SO_LOG_SOUtils();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.val[0]) = 0;
        _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_INFO, "bundleIdentifier: SecTaskCreateWithAuditToken() failed", (uint8_t *)&buf, 2u);
      }
    }

    v5 = 0;
    return v5;
  }
  v5 = v20;
  SO_LOG_SOUtils();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SOUtils bundleIdentifierFromAuditToken:].cold.1((uint64_t)v20, v6, v7, v8, v9, v10, v11, v12);
LABEL_4:

  return v5;
}

+ (id)signatureSetToString:(int64_t)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("by apple, "));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "appendString:", CFSTR("by mac app store, "));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v5, "appendString:", CFSTR("by identified developer, "));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v5, "appendString:", CFSTR("by iphone distribution certificate, "));
    if ((v3 & 0x20) == 0)
      return v5;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v5, "appendString:", CFSTR("by distribution certificate, "));
  if ((v3 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v3 & 0x20) != 0)
LABEL_7:
    objc_msgSend(v5, "appendString:", CFSTR("by word wide developer certificate, "));
  return v5;
}

+ (BOOL)checkSignatureOfFile:(id)a3 teamIdentifier:(id *)a4 trusted:(BOOL *)a5 signedBySet:(int64_t *)a6 certificates:(id *)a7 error:(id *)a8
{
  id v14;
  NSObject *v15;
  const __CFURL *v16;
  uint64_t v17;
  CFDictionaryRef v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  CFTypeRef v22;
  void *v24;
  BOOL v25;
  void *v26;
  id v27;
  CFTypeRef cf;
  CFDictionaryRef information;
  _BYTE buf[12];
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  SO_LOG_SOUtils();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "+[SOUtils checkSignatureOfFile:teamIdentifier:trusted:signedBySet:certificates:error:]";
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = a1;
    _os_log_impl(&dword_1CF39B000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  information = 0;
  *(_QWORD *)buf = 0;
  cf = 0;
  if (!v14)
  {
    if (a8)
    {
      +[SOErrorHelper parameterErrorWithMessage:](SOErrorHelper, "parameterErrorWithMessage:", CFSTR("no file"));
      v18 = 0;
      v16 = 0;
      v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
      v16 = 0;
      v19 = 0;
    }
    goto LABEL_25;
  }
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a8)
    *a8 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
  v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v17 = SecStaticCodeCreateWithPath(v16, 0, (SecStaticCodeRef *)buf);
  if ((_DWORD)v17)
  {
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecStaticCodeCreateWithPathAndAttributes() failed with %d"), v17);
LABEL_18:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", v21);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = SecCodeCopySigningInformation(*(SecStaticCodeRef *)buf, 2u, &information);
    if (!(_DWORD)v20)
    {
      v18 = information;
      information = 0;
      if (a4)
      {
        -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6D28]);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a7)
      {
        -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6CE0]);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a6)
      {
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 1, (uint64_t)a8))
          *a6 |= 1uLL;
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 2, (uint64_t)a8))
          *a6 |= 2uLL;
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 4, (uint64_t)a8))
          *a6 |= 4uLL;
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 8, (uint64_t)a8))
          *a6 |= 8uLL;
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 16, (uint64_t)a8))
          *a6 |= 4uLL;
        if (_isStaticCodeSignedBy(*(const __SecCode **)buf, 32, (uint64_t)a8))
          *a6 |= 0x20uLL;
      }
      -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6D38]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = SecTrustEvaluateWithError((SecTrustRef)v24, (CFErrorRef *)&cf);
        v22 = cf;
        if (a8 && cf)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecTrustEvaluateWithError(), trust: %@ failed with %@"), v24, cf);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", v26);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

          v22 = cf;
        }
        v19 = v22 == 0;
      }
      else if (a8)
      {
        +[SOErrorHelper internalErrorWithMessage:](SOErrorHelper, "internalErrorWithMessage:", CFSTR("no kSecCodeInfoTrust in signing information"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v25 = 0;
        v19 = 0;
        *a8 = v27;
      }
      else
      {
        v22 = 0;
        v25 = 0;
        v19 = 0;
      }
      if (a5)
        *a5 = v25;
      goto LABEL_20;
    }
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecCodeCopySigningInformation() failed with %d"), v20);
      goto LABEL_18;
    }
  }
  v22 = 0;
  v18 = 0;
  v19 = 0;
LABEL_20:
  if (*(_QWORD *)buf)
  {
    CFRelease(*(CFTypeRef *)buf);
    v22 = cf;
  }
  if (v22)
    CFRelease(v22);
LABEL_25:

  return v19;
}

+ (id)teamIdentifierFromAuditToken:(id *)a3
{
  __int128 v4;
  void *v5;
  NSObject *v6;
  NSObject *v8;
  const __CFAllocator *v9;
  __int128 v10;
  SecTaskRef v11;
  SecTaskRef v12;
  NSObject *v13;
  NSObject *v14;
  audit_token_t buf;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v4;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v5 = 0;
    SO_LOG_SOUtils();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      buf.val[0] = 138543618;
      *(_QWORD *)&buf.val[1] = 0;
      LOWORD(buf.val[3]) = 2114;
      *(_QWORD *)((char *)&buf.val[3] + 2) = 0;
      _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ teamIdentifier: %{public}@", (uint8_t *)&buf, 0x16u);
    }

    return v5;
  }
  SO_LOG_SOUtils();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[SOUtils teamIdentifierFromAuditToken:].cold.2(v8);

  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf.val[4] = v10;
  v11 = SecTaskCreateWithAuditToken(v9, &buf);
  if (v11)
  {
    v12 = v11;
    v5 = (void *)SecTaskCopyTeamIdentifier();
    SO_LOG_SOUtils();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      buf.val[0] = 138543618;
      *(_QWORD *)&buf.val[1] = v5;
      LOWORD(buf.val[3]) = 2114;
      *(_QWORD *)((char *)&buf.val[3] + 2) = 0;
      _os_log_impl(&dword_1CF39B000, v13, OS_LOG_TYPE_DEFAULT, "teamIdentifier: %{public}@, error: %{public}@", (uint8_t *)&buf, 0x16u);
    }

    CFRelease(v12);
    return v5;
  }
  SO_LOG_SOUtils();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[SOUtils teamIdentifierFromAuditToken:].cold.1(v14);

  return 0;
}

+ (void)mmapFile:mode:mmapData:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1CF39B000, v1, v2, "shm_open(%@) failed[%d]: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)mmapFile:mode:mmapData:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1CF39B000, v1, v2, "mmap(%@) failed[%d] %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

+ (void)unmapFile:data:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1CF39B000, v1, v2, "close() failed[%d]: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

+ (void)unmapFile:data:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1CF39B000, v1, v2, "munmap() failed[%d]: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

+ (void)currentProcessIsSandboxed
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a2, a3, "currentProcessIsSandboxed(): %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)sandboxAllowsXPC:(NSObject *)a3 .cold.1(uint64_t a1, char a2, NSObject *a3)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = "YES";
  if ((a2 & 1) == 0)
    v3 = "NO";
  v4 = 136446466;
  v5 = a1;
  v6 = 2082;
  v7 = v3;
  OUTLINED_FUNCTION_10(&dword_1CF39B000, a3, (uint64_t)a3, "sandboxAllowsXPC(): '%{public}s' allowed = %{public}s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __38__SOUtils_currentProcessContainerPath__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a1, a3, "currentProcessContainerPath(): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __38__SOUtils_currentProcessContainerPath__block_invoke_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1CF39B000, v1, v2, "currentProcessContainerPath(): failed to get container path: #%d: %{public}s\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

void __26__SOUtils_isInternalBuild__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a1, a3, "isInternalBuild=%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __35__SOUtils_isAppSSOServiceAvailable__block_invoke_cold_1(kern_return_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138543618;
  v5 = CFSTR("com.apple.AppSSO.service-xpc");
  v6 = 2082;
  v7 = bootstrap_strerror(a1);
  OUTLINED_FUNCTION_10(&dword_1CF39B000, a2, v3, "%{public}@ is not available (%{public}s)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_1();
}

+ (void)auditTokenFromData:(void *)a1 auditToken:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_1CF39B000, a2, OS_LOG_TYPE_ERROR, "unexpected size of auditToken: %u", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)bundleIdentifierFromAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a2, a3, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken(): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)teamIdentifierFromAuditToken:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF39B000, log, OS_LOG_TYPE_ERROR, "teamIdentifier: SecTaskCreateWithAuditToken() failed", v1, 2u);
}

+ (void)teamIdentifierFromAuditToken:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF39B000, log, OS_LOG_TYPE_DEBUG, "teamIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopyTeamIdentifier()", v1, 2u);
}

@end
