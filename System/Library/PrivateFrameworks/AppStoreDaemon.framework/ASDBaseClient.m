@implementation ASDBaseClient

- (void)_call:(id)a3 run:(id)a4 error:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = (void (**)(id, void *))a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__ASDBaseClient__call_run_error___block_invoke;
  v12[3] = &unk_1E37BDB60;
  v9 = v8;
  v13 = v9;
  objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v7[2](v7, v10);
  }
  else
  {
    ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 508, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v11);

  }
}

- (BOOL)_clientHasEntitlement:(uint64_t)a1
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  CFTypeID TypeID;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;
  CFErrorRef error;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  CFErrorRef v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = SecTaskCreateFromSelf(0);
    if (v4)
    {
      v5 = v4;
      error = 0;
      v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
      if (error && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v17 = v11;
        v18 = 2112;
        v19 = v3;
        v20 = 2112;
        v21 = error;
        v12 = v11;
        _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: Unable to get entitlements: %@ error: %@", buf, 0x20u);

        if (v6)
          goto LABEL_6;
      }
      else if (v6)
      {
LABEL_6:
        TypeID = CFBooleanGetTypeID();
        v8 = TypeID == CFGetTypeID(v6) && CFBooleanGetValue((CFBooleanRef)v6) != 0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v17 = v9;
          v18 = 2112;
          v19 = v3;
          v20 = 1024;
          LODWORD(v21) = v8;
          v10 = v9;
          _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@]: We have the entitlement: %@ result: %d", buf, 0x1Cu);

        }
        CFRelease(v6);
        goto LABEL_17;
      }
      v8 = 0;
LABEL_17:
      CFRelease(v5);
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = (id)objc_opt_class();
      v18 = 2112;
      v19 = v3;
      v14 = v17;
      _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: No task for entitlement: %@", buf, 0x16u);

    }
  }
  v8 = 0;
LABEL_18:

  return v8;
}

uint64_t __33__ASDBaseClient__call_run_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_clientHasASDEntitlement:(uint64_t)a1
{
  id v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  CFTypeID TypeID;
  int v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  CFErrorRef error;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  CFErrorRef v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = SecTaskCreateFromSelf(0);
    if (v4)
    {
      v5 = v4;
      error = 0;
      v6 = (void *)SecTaskCopyValueForEntitlement(v4, CFSTR("com.apple.private.appstored"), &error);
      if (error && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v18 = v12;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = error;
        v13 = v12;
        _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: Unable to get entitlements: %@ error: %@", buf, 0x20u);

        if (v6)
          goto LABEL_6;
      }
      else if (v6)
      {
LABEL_6:
        TypeID = CFArrayGetTypeID();
        if (TypeID == CFGetTypeID(v6))
          v8 = objc_msgSend(v6, "containsObject:", v3);
        else
          v8 = 0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v18 = v10;
          v19 = 2112;
          v20 = v3;
          v21 = 1024;
          LODWORD(v22) = v8;
          v11 = v10;
          _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@]: Results for entitlement: %@ result: %d", buf, 0x1Cu);

        }
        CFRelease(v6);
        goto LABEL_17;
      }
      v8 = 0;
LABEL_17:
      CFRelease(v5);
      v9 = v8 != 0;
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = (id)objc_opt_class();
      v19 = 2112;
      v20 = v3;
      v15 = v18;
      _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@]: No task for entitlement: %@", buf, 0x16u);

    }
  }
  v9 = 0;
LABEL_18:

  return v9;
}

@end
