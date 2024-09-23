@implementation NSXPCConnection(FPAdditions)

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions
{
  return objc_msgSend(a1, "fp_hasOneOfEntitlements:logLevel:", a3, 0);
}

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions logLevel:
{
  return objc_msgSend(a1, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", a3, 1, a4);
}

- (void)fp_annotateInvocation:()FPAdditions withLogSection:
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v5 = a3;
  objc_msgSend(v5, "methodSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fp_indexOfLastArgumentWithType:", "@?");
  v8 = (const char *)objc_msgSend(v5, "selector");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NSXPCConnection(FPAdditions) fp_annotateInvocation:withLogSection:].cold.1(v8, a4, v9);

  }
  else
  {
    v24 = 0;
    objc_msgSend(v5, "getArgument:atIndex:", &v24, v7);
    v10 = (void *)MEMORY[0x1A1B00850](v24);
    _Block_signature(v10);
    fp_current_or_default_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = (id *)&v18;
    v20 = 0x3042000000;
    v21 = __Block_byref_object_copy__23;
    v22 = __Block_byref_object_dispose__23;
    v23 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = v11;
    v16 = v10;
    obj = (id)__NSMakeSpecialForwardingCaptureBlock();
    objc_msgSend(v5, "_addAttachedObject:", obj, v14, 3221225472, __69__NSXPCConnection_FPAdditions__fp_annotateInvocation_withLogSection___block_invoke, &unk_1E444E7D0);
    objc_msgSend(v5, "setArgument:atIndex:", &obj, v7);
    objc_storeWeak(v19 + 5, obj);
    WeakRetained = objc_loadWeakRetained(v19 + 5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(WeakRetained, &kFileProviderLogSectionKey, v13, (void *)0x301);

    _Block_object_dispose(&v18, 8);
    objc_destroyWeak(&v23);

  }
}

- (id)fp_bundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("application-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || (FPAppIdentifierFromTeamAppTuple(v2), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = (void *)MEMORY[0x1E0CA5898];
    objc_msgSend(a1, "auditToken");
    objc_msgSend(v5, "bundleRecordForAuditToken:error:", &v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)fp_hasOneOfEntitlements:()FPAdditions nonSandboxedAccess:logLevel:
{
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v16;
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a3;
  v8 = -[__CFString countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "fp_valueForEntitlement:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11), (_QWORD)v19);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (-[NSObject BOOLValue](v12, "BOOLValue") & 1) != 0)
          {
            v14 = 1;
            v13 = v7;
            goto LABEL_26;
          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = -[__CFString countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "fp_valueForEntitlement:", CFSTR("com.apple.internal.fileprovider.debug"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFString BOOLValue](v13, "BOOLValue"))
      {
        if (!a5)
        {
          v14 = 1;
          goto LABEL_27;
        }
        if (a5 == 2)
        {
          objc_msgSend(a1, "processIdentifier");
          FPExecutableNameForProcessIdentifier();
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = CFSTR("<restricted>");
        }
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(a1, "processIdentifier");
          *(_DWORD *)buf = 67109634;
          v24 = v17;
          v25 = 2112;
          v26 = v12;
          v27 = 2112;
          v28 = CFSTR("com.apple.internal.fileprovider.debug");
          _os_log_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] Allowing request from PID %d (%@) because it has the %@ entitlement.", buf, 0x1Cu);
        }

        v14 = 1;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
  }

  if (a5)
  {
    if (a5 == 2)
    {
      objc_msgSend(a1, "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("<restricted>");
    }
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(a1, "processIdentifier");
      *(_DWORD *)buf = 67109634;
      v24 = v18;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v7;
      _os_log_error_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_ERROR, "[ERROR] Rejecting request from PID %d (%@) because it does not have any of these entitlements: %@", buf, 0x1Cu);
    }
    v14 = 0;
    goto LABEL_26;
  }
  v14 = 0;
LABEL_28:

  return v14;
}

- (BOOL)fp_hasSandboxAccessToFile:()FPAdditions accessType:logLevel:
{
  id v8;
  int v9;
  id v10;
  const char *v11;
  int v12;
  __CFString *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  int v20;
  __CFString *v21;
  void *v22;
  void *v23;
  const char *v24;
  int v25;
  _BOOL8 v26;
  int v27;
  __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  int v32;
  int v33;
  void *v34;
  const char *v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  int v43;
  void *v44;
  int v45;
  void *v46;
  __CFString *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[40];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(a1, "auditToken");
  v9 = *MEMORY[0x1E0C806B0] | 1;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  memset(buf, 0, 32);
  if (fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v11))
  {
    v49 = 0;
    v12 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v49);
    v13 = (__CFString *)v49;
    if (v12)
    {
      v48 = 0;
      v14 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v48, *MEMORY[0x1E0C99A28], 0);
      v15 = v48;
      v16 = v15;
      if (!v14)
        goto LABEL_6;
      if (!-[NSObject BOOLValue](v15, "BOOLValue"))
        goto LABEL_6;
      objc_msgSend(v10, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByDeletingLastPathComponent");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");
      *(_OWORD *)buf = v50;
      *(_OWORD *)&buf[16] = v51;
      v20 = fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v19);

      if (v20)
      {
LABEL_6:
        if (a5)
        {
          if (a5 == 2)
          {
            objc_msgSend(a1, "processIdentifier");
            FPExecutableNameForProcessIdentifier();
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = CFSTR("<restricted>");
          }
          fp_current_or_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v39 = objc_msgSend(a1, "processIdentifier");
            objc_msgSend(v10, "fp_shortDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v39;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v21;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v40;
            _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\", buf, 0x1Cu);

          }
          v26 = 0;
          goto LABEL_66;
        }
        v26 = 0;
LABEL_67:

        goto LABEL_68;
      }
      if (a5)
      {
        if (a5 == 2)
        {
          objc_msgSend(a1, "processIdentifier");
          FPExecutableNameForProcessIdentifier();
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = CFSTR("<restricted>");
        }
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v43 = objc_msgSend(a1, "processIdentifier");
          objc_msgSend(v10, "fp_shortDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v43;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v44;
          _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has sandbox access to the parent path of \"%@\", buf, 0x1Cu);

        }
        v26 = 1;
        goto LABEL_66;
      }
LABEL_23:
      v26 = 1;
      goto LABEL_67;
    }
    if (!_CFURLIsItemPromiseAtURL())
    {
      v22 = (void *)_CFURLCopyPromiseURLOfLogicalURL();
      v23 = v22;
      if (v22)
      {
        v16 = objc_retainAutorelease(v22);
        v24 = (const char *)-[NSObject fileSystemRepresentation](v16, "fileSystemRepresentation");
        *(_OWORD *)buf = v50;
        *(_OWORD *)&buf[16] = v51;
        v25 = fpfs_lp_sandbox_check_by_audit_token(buf, a4, v9, v24);
        v26 = v25 == 0;
        if (!v25)
        {
          if (!a5)
            goto LABEL_67;
          if (a5 == 2)
          {
            objc_msgSend(a1, "processIdentifier");
            FPExecutableNameForProcessIdentifier();
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = CFSTR("<restricted>");
          }
          fp_current_or_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            goto LABEL_66;
          v41 = objc_msgSend(a1, "processIdentifier");
          objc_msgSend(v10, "fp_shortDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v41;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v34;
          v35 = "[DEBUG] PID %d (%@) has sandbox access to the promise of \"%@\";
LABEL_60:
          _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, v35, buf, 0x1Cu);

LABEL_66:
          goto LABEL_67;
        }
        v47 = v13;
        v27 = -[NSObject checkResourceIsReachableAndReturnError:](v16, "checkResourceIsReachableAndReturnError:", &v47);
        v28 = v47;

        if (v27)
        {
          if (a5)
          {
            if (a5 == 2)
            {
              objc_msgSend(a1, "processIdentifier");
              FPExecutableNameForProcessIdentifier();
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v21 = CFSTR("<restricted>");
            }
            fp_current_or_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              v45 = objc_msgSend(a1, "processIdentifier");
              objc_msgSend(v10, "fp_shortDescription");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v45;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v21;
              *(_WORD *)&buf[18] = 2112;
              *(_QWORD *)&buf[20] = v46;
              _os_log_debug_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\" or its fault", buf, 0x1Cu);

            }
            v13 = v28;
            goto LABEL_66;
          }
          v13 = v28;
          goto LABEL_67;
        }
        v13 = v28;
      }
      else
      {
        fp_current_or_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[NSXPCConnection(FPAdditions) fp_hasSandboxAccessToFile:accessType:logLevel:].cold.1((uint64_t)v10, v30);

      }
    }
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = (const char *)-[NSObject fileSystemRepresentation](v16, "fileSystemRepresentation");
    *(_OWORD *)buf = v50;
    *(_OWORD *)&buf[16] = v51;
    v32 = fpfs_lp_sandbox_check_by_audit_token(buf, (uint64_t)"file-write-data", v9, v31);
    v26 = v32 == 0;
    if (v32)
    {
      if (!a5)
        goto LABEL_67;
      if (a5 == 2)
      {
        objc_msgSend(a1, "processIdentifier");
        FPExecutableNameForProcessIdentifier();
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("<restricted>");
      }
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_66;
      v33 = objc_msgSend(a1, "processIdentifier");
      objc_msgSend(v10, "fp_shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v33;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v21;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v34;
      v35 = "[DEBUG] PID %d (%@) doesn't have sandbox access to \"%@\" or its fault";
    }
    else
    {
      if (!a5)
        goto LABEL_67;
      if (a5 == 2)
      {
        objc_msgSend(a1, "processIdentifier");
        FPExecutableNameForProcessIdentifier();
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("<restricted>");
      }
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_66;
      v36 = objc_msgSend(a1, "processIdentifier");
      objc_msgSend(v10, "fp_shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v36;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v21;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v34;
      v35 = "[DEBUG] PID %d (%@) has sandbox access to non-existent \"%@\";
    }
    goto LABEL_60;
  }
  if (a5)
  {
    if (a5 == 2)
    {
      objc_msgSend(a1, "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("<restricted>");
    }
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v37 = objc_msgSend(a1, "processIdentifier");
      objc_msgSend(v10, "fp_shortDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v37;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v38;
      _os_log_debug_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has sandbox access to \"%@\", buf, 0x1Cu);

    }
    goto LABEL_23;
  }
  v26 = 1;
LABEL_68:

  return v26;
}

- (NSObject)fp_applicationGroups
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.security.application-groups"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
LABEL_18:
    v7 = MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(FPAdditions) fp_applicationGroups].cold.1();
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = v1;
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          fp_current_or_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[NSXPCConnection(FPAdditions) fp_applicationGroups].cold.1();

          goto LABEL_17;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }

  v7 = v2;
LABEL_19:

  return v7;
}

- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions
{
  return objc_msgSend(a1, "fp_hasSandboxAccessToFile:logLevel:", a3, 0);
}

- (uint64_t)fp_hasSandboxAccessToFile:()FPAdditions logLevel:
{
  return objc_msgSend(a1, "fp_hasSandboxAccessToFile:accessType:logLevel:", a3, "file-write-data", a4);
}

- (uint64_t)fp_isNonSandboxedConnection
{
  return 0;
}

- (id)fp_userInfo
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v7;
  NSObject *v8;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSXPCConnection userInfo is wrong type: %@"), v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[NSXPCConnection(FPAdditions) fp_userInfo].cold.1((uint64_t)v7, v8);

      __assert_rtn("-[NSXPCConnection(FPAdditions) fp_userInfo]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSXPCConnection+FPAdditions.m", 291, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v2, "mutableCopy");
    else
      v3 = objc_opt_new();
    v4 = (void *)v3;

    objc_msgSend(a1, "setUserInfo:", v4);
    v2 = v4;
  }
  v5 = v2;

  return v5;
}

- (void)fp_hasSandboxAccessToFile:()FPAdditions accessType:logLevel:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] can't create physical URL from \"%@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)fp_applicationGroups
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_2(&dword_1A0A34000, v0, v1, "[ERROR] malformed %@ entitlement on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)fp_userInfo
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)fp_annotateInvocation:()FPAdditions withLogSection:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a2;
  OUTLINED_FUNCTION_21();
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc to %@ without reply", (uint8_t *)&v6, 0x16u);

}

@end
