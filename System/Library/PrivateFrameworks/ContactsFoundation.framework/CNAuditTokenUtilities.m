@implementation CNAuditTokenUtilities

+ (id)bundleIdentifierForAuditToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _BYTE v28[32];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "audit_token");
    objc_msgSend(a1, "_bundleIdentifierFromSecTaskForAuditToken:", v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v6))
    {
      objc_msgSend(a1, "os_log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[CNAuditTokenUtilities bundleIdentifierForAuditToken:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

      v14 = v6;
    }
    else
    {
      objc_msgSend(v5, "audit_token");
      objc_msgSend(a1, "_bundleIdentifierFromInfoPlistForAuditToken:", &v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = CNIsStringNonempty_block_invoke_2((uint64_t)&__block_literal_global_109, v16);
      objc_msgSend(a1, "os_log");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[CNAuditTokenUtilities bundleIdentifierForAuditToken:].cold.3();

        v15 = 0;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[CNAuditTokenUtilities bundleIdentifierForAuditToken:].cold.2((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);

      v14 = v16;
    }
    v16 = v14;
    v15 = v14;
LABEL_15:

    goto LABEL_16;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_13 != -1)
    dispatch_once(&os_log_cn_once_token_1_13, &__block_literal_global_72);
  return (id)os_log_cn_once_object_1_13;
}

+ (id)_bundleIdentifierFromSecTaskForAuditToken:(id *)a3
{
  __int128 v4;
  SecTaskRef v5;
  __SecTask *v6;
  CFStringRef v7;
  __CFString *v8;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  int v21;
  _BOOL4 v23;
  void *v25;
  id v26;
  NSObject *v27;
  audit_token_t v28;

  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v28.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v28.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &v28);
  if (!v5)
  {
    objc_msgSend(a1, "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:].cold.1();

    return 0;
  }
  v6 = v5;
  *__error() = 0;
  *(_QWORD *)v28.val = 0;
  v7 = SecTaskCopySigningIdentifier(v6, (CFErrorRef *)&v28);
  if (v7)
  {
    v8 = (__CFString *)v7;
    CFRelease(v6);
    return v8;
  }
  objc_msgSend(a1, "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:].cold.3((uint64_t)&v28, v11, v12, v13, v14, v15, v16, v17);

  v18 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("application-identifier"), (CFErrorRef *)&v28);
  if (!v18)
  {
    objc_msgSend(a1, "os_log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[CNAuditTokenUtilities _bundleIdentifierFromSecTaskForAuditToken:].cold.2();

    CFRelease(v6);
    return 0;
  }
  v19 = v18;
  if ((unint64_t)objc_msgSend(v18, "length") < 0xB
    || objc_msgSend(v19, "characterAtIndex:", 10) != 46)
  {
    goto LABEL_27;
  }
  v20 = 0;
  do
  {
    v21 = objc_msgSend(v19, "characterAtIndex:", v20);
    v23 = (v21 - 65) < 0x1A || (v21 - 48) < 0xA;
  }
  while (v23 && v20++ < 9);
  if (!v23
    || (objc_msgSend(v19, "substringWithRange:", 11, objc_msgSend(v19, "length") - 11),
        (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_27:
    v25 = (void *)objc_msgSend(v19, "copy");
  }
  CFRelease(v6);
  v26 = v25;

  return v26;
}

void __31__CNAuditTokenUtilities_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.foundation", "CNAuditTokenUtilities");
  v1 = (void *)os_log_cn_once_object_1_13;
  os_log_cn_once_object_1_13 = (uint64_t)v0;

}

+ (id)processNameForAuditToken:(id)a3
{
  pid_t v4;
  char *v5;
  char *v6;
  void *v7;
  NSObject *v8;
  audit_token_t atoken;
  char buffer[2048];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
LABEL_10:
    v7 = 0;
    return v7;
  }
  objc_msgSend(a3, "audit_token");
  v4 = audit_token_to_pid(&atoken);
  buffer[0] = 0;
  if (proc_pidpath(v4, buffer, 0x800u) <= 0)
  {
    objc_msgSend(a1, "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CNAuditTokenUtilities processNameForAuditToken:].cold.1();

    goto LABEL_10;
  }
  v5 = strrchr(buffer, 47);
  if (v5)
    v6 = v5 + 1;
  else
    v6 = buffer;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

+ (int)processIdentifierForAuditToken:(id)a3
{
  audit_token_t v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "audit_token");
  return audit_token_to_pid(&v4);
}

+ (id)_bundleIdentifierFromInfoPlistForAuditToken:(id *)a3
{
  pid_t v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFURLRef v16;
  CFURLRef v17;
  const __CFURL *v18;
  const __CFURL *v19;
  __CFBundle *v20;
  __CFBundle *v21;
  audit_token_t v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = audit_token_to_pid(v22);
  v5 = proc_pidpath(v4, v22, 0x1000u);
  if (v5 <= 0)
  {
    objc_msgSend(a1, "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CNAuditTokenUtilities _bundleIdentifierFromInfoPlistForAuditToken:].cold.2(v4, v6);
    goto LABEL_8;
  }
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v22, v5, 4));
  if (access((const char *)-[NSObject UTF8String](v6, "UTF8String"), 4))
  {
    objc_msgSend(a1, "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNAuditTokenUtilities _bundleIdentifierFromInfoPlistForAuditToken:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    goto LABEL_8;
  }
  v16 = CFURLCreateWithFileSystemPath(0, (CFStringRef)v6, kCFURLPOSIXPathStyle, 0);
  if (!v16)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v17 = v16;
  v18 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
  if (v18)
  {
    v19 = v18;
    v20 = CFBundleCreate(0, v18);
    if (v20)
    {
      v21 = v20;
      CFBundleGetIdentifier(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v21);
    }
    else
    {
      v14 = 0;
    }
    CFRelease(v19);
  }
  else
  {
    v14 = 0;
  }
  CFRelease(v17);
LABEL_9:

  return v14;
}

+ (void)bundleIdentifierForAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18F80C000, a2, a3, "Looked up bundle ID %@ from audit token using SecTask.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)bundleIdentifierForAuditToken:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18F80C000, a2, a3, "Looked up bundle ID %@ from audit token using Info.plist.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)bundleIdentifierForAuditToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Could not look up bundle identifier using audit token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)processNameForAuditToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Could not look up process name using audit token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Could not look up SecTaskRef using audit token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Could not look up Entitlement Application Identifier using SecTaskRef.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_bundleIdentifierFromSecTaskForAuditToken:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "Could not look up Signing Identifier using SecTaskRef, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)_bundleIdentifierFromInfoPlistForAuditToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "No access to path %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)_bundleIdentifierFromInfoPlistForAuditToken:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Could not look up proc_pidpath using pid %d.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_2();
}

@end
