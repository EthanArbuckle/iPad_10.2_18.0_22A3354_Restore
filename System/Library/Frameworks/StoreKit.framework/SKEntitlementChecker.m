@implementation SKEntitlementChecker

+ (BOOL)checkForEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  BOOL v9;
  CFErrorRef error;

  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      CFRelease(v7);
    }
    else
    {
      v9 = 0;
    }
    if (error)
      CFRelease(error);
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isProcessEntitled:(id *)a3 entitlementName:(__CFString *)a4
{
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  CFTypeID v15;
  BOOL v16;
  uint64_t v18;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(0, &token);
  if (!v6)
    return 0;
  v7 = v6;
  error = 0;
  v8 = SecTaskCopyValueForEntitlement(v6, a4, &error);
  if (error)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      token.val[0] = 138412290;
      *(_QWORD *)&token.val[1] = error;
      LODWORD(v18) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        CFRelease(error);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &token, v18);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (v8)
  {
    v15 = CFGetTypeID(v8);
    v16 = v15 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
    CFRelease(v8);
  }
  else
  {
    v16 = 0;
  }
  CFRelease(v7);
  return v16;
}

@end
