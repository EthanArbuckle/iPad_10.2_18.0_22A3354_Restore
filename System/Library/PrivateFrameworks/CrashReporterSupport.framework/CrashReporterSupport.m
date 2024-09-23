uint64_t DiagnosticLogSubmissionEnabled()
{
  return checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &DiagnosticLogSubmissionEnabled_featureDiagnosticsSubmissionAllowed);
}

void CRCreateDirectoryStructure()
{
  uid_t v0;
  _BOOL4 v1;
  passwd *v2;
  uid_t pw_uid;
  passwd *v4;
  uid_t v5;
  group *v6;
  gid_t gr_gid;
  mode_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v21;
  const __CFString *v23;
  const __CFString *v24;
  gid_t v25;
  uid_t v26;
  gid_t v27;
  uid_t v28;
  char v29;
  uint64_t v30;
  uint8_t v31[16];
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v0 = getuid();
  v1 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Called to create CR directory as non-root user. Weird!!", buf, 2u);
    }
    return;
  }
  if (v1)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to create CR directory structure as root", buf, 2u);
  }
  v2 = getpwnam("mobile");
  if (v2)
    pw_uid = v2->pw_uid;
  else
    pw_uid = 0;
  endpwent();
  v4 = getpwnam("_analyticsd");
  if (v4)
    v5 = v4->pw_uid;
  else
    v5 = 0;
  endpwent();
  v6 = getgrnam("_analyticsusers");
  if (v6)
    gr_gid = v6->gr_gid;
  else
    gr_gid = 0;
  endgrent();
  v8 = umask(2u);
  ensure_dir_perms_analytics("/private/var/logs");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter/Baseband");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter/Panics");
  ensure_dir_perms_analytics("/Library/Logs/AppleSupport");
  ensure_dir_perms_analytics("/Library/Logs/OTACrashCopier");
  if (!pw_uid || !gr_gid)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not attempting to create CR directory as UID/GID information is missing", buf, 2u);
    }
    goto LABEL_62;
  }
  if (!access("/Library/CoreAnalytics", 0))
  {
    *(_QWORD *)v31 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", CFSTR("/Library/CoreAnalytics"), v31);
    v23 = *(const __CFString **)v31;
    if (*(_QWORD *)v31)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v23;
        _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't delete /Library/CoreAnalytics, error = %@", buf, 0xCu);
      }
    }
  }
  create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs", 509, pw_uid, gr_gid);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "multiUserMode"))
  {
    create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs/CrashReporter", 509, pw_uid, gr_gid);
    goto LABEL_61;
  }
  v28 = v5;
  if (create_symlink_to_system_container_onceToken != -1)
    dispatch_once(&create_symlink_to_system_container_onceToken, &__block_literal_global_163);
  v30 = 0;
  v9 = (void *)create_symlink_to_system_container_containerLocation;
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  if ((objc_msgSend(v9, "setResourceValue:forKey:error:", v10, *MEMORY[0x1E0C999D8], &v30) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend((id)create_symlink_to_system_container_containerLocation, "lastPathComponent");
    *(_DWORD *)buf = 138412546;
    v33 = (const __CFString *)v11;
    v34 = 2112;
    v35 = v30;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error excluding %@ from backup %@", buf, 0x16u);
  }
  v26 = geteuid();
  v25 = getegid();
  v27 = gr_gid;
  setegid(gr_gid);
  seteuid(pw_uid);
  v12 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"));
  v13 = -5;
  v29 = 0;
  v14 = *MEMORY[0x1E0CB2B18];
  v15 = *MEMORY[0x1E0CB2B30];
  v16 = MEMORY[0x1E0C81028];
  while (1)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), &v29);
    v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "attributesOfItemAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), 0), "objectForKeyedSubscript:", v14), "isEqualToString:", v15);
    if (v18 && v29 != 0)
      break;
    if (((v18 | v19 ^ 1) & 1) == 0
      && (objc_msgSend(v17, "removeItemAtPath:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), &v30) & 1) == 0
      && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CRCreateDirectoryStructure_cold_1(v31, &v31[4]);
    }
    if ((objc_msgSend(v17, "createSymbolicLinkAtURL:withDestinationURL:error:", v12, create_symlink_to_system_container_containerLocation, &v30) & 1) != 0)goto LABEL_60;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = (const __CFString *)v12;
      v34 = 2112;
      v35 = create_symlink_to_system_container_containerLocation;
      v36 = 2112;
      v37 = v30;
      _os_log_impl(&dword_1AA8D9000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't symlink %@ to %@. Error: %@", buf, 0x20u);
    }
LABEL_48:
    if (__CFADD__(v13++, 1))
      goto LABEL_60;
  }
  if ((v19 & 1) != 0)
    goto LABEL_60;
  v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter-%d"), (v13 + 6));
  if (objc_msgSend(v17, "moveItemAtPath:toPath:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), v21, &v30))
  {
    objc_msgSend(v17, "removeItemAtPath:error:", v21, 0);
    if ((objc_msgSend(v17, "createSymbolicLinkAtURL:withDestinationURL:error:", v12, create_symlink_to_system_container_containerLocation, &v30) & 1) != 0)
    {
      v24 = CFSTR("com.apple.osanalytics.system_group_container_symlink_creation.success");
      goto LABEL_59;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = (const __CFString *)v12;
      v34 = 2112;
      v35 = create_symlink_to_system_container_containerLocation;
      v36 = 2112;
      v37 = v30;
      _os_log_impl(&dword_1AA8D9000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't symlink %@ to %@. Error: %@", buf, 0x20u);
    }
    if (v13 == -1)
    {
      v24 = CFSTR("com.apple.osanalytics.system_group_container_symlink_creation.fail");
      goto LABEL_59;
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = CFSTR("/private/var/mobile/Library/Logs/CrashReporter");
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1AA8D9000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't move %@ to %@", buf, 0x16u);
  }
  if (v13 != -1)
  {
LABEL_47:
    usleep(0xC350u);
    goto LABEL_48;
  }
  v24 = CFSTR("com.apple.osanalytics.system_group_container_symlink_creation.movement_fail");
LABEL_59:
  dlaggd_addScalarForKey((uint64_t)v24, 1);
LABEL_60:
  seteuid(v26);
  setegid(v25);
  v5 = v28;
  gr_gid = v27;
LABEL_61:
  create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs/AppleSupport", 509, pw_uid, gr_gid);
LABEL_62:
  if (v5)
    create_dir_with_owners_and_perms_with_analytics("/private/var/db/analyticsd", 488, v5, v5);
  umask(v8);
}

uint64_t checkMCFeature(const char *a1, _QWORD *a2)
{
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  const char *v7;
  uint64_t result;
  int v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1AF42243C]();
  if (!checkMCFeature_dylib_handle)
  {
    checkMCFeature_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4);
    if (!checkMCFeature_dylib_handle)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v9 = 136446210;
      v10 = dlerror();
      v6 = MEMORY[0x1E0C81028];
      v7 = "Unable to load ManagedConfiguration dylib ('%{public}s')";
      goto LABEL_14;
    }
  }
  if (!checkMCFeature_profileConnectionObj)
  {
    checkMCFeature_profileConnectionObj = (uint64_t)objc_getClass("MCProfileConnection");
    if (!checkMCFeature_profileConnectionObj && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to find class MCProfileConnection", (uint8_t *)&v9, 2u);
    }
  }
  if (!*a2)
  {
    v5 = dlsym((void *)checkMCFeature_dylib_handle, a1);
    if (v5)
    {
      *a2 = *v5;
      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446210;
      v10 = (char *)a1;
      v6 = MEMORY[0x1E0C81028];
      v7 = "Unable to load symbol %{public}s";
LABEL_14:
      _os_log_impl(&dword_1AA8D9000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_15:
  objc_autoreleasePoolPop(v4);
  result = checkMCFeature_profileConnectionObj;
  if (checkMCFeature_profileConnectionObj)
    return *a2
        && objc_msgSend((id)objc_msgSend((id)checkMCFeature_profileConnectionObj, "sharedConnection"), "effectiveBoolValueForSetting:", *a2) == 1;
  return result;
}

uint64_t OSAPreferencesSetValue(void *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "multiUserMode");

  if ((v9 & 1) != 0)
  {
    _preferencesForDomain(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v5);
      if (v11)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(v10, "removeObjectForKey:", v5);
      if (v11)
      {
LABEL_6:
        v12 = _savePreferencesForDomain(v11, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  CFPreferencesSetValue(v5, v6, v7, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  v12 = 1;
LABEL_11:

  return v12;
}

id _preferencesForDomain(void *a1)
{
  id v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___preferencesForDomain_block_invoke;
  v4[3] = &unk_1E57ECD28;
  v4[4] = &v5;
  _performOnFileBackingDomain((uint64_t)v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1AA8DB1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _savePreferencesForDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___savePreferencesForDomain_block_invoke;
  v8[3] = &unk_1E57ECD78;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  _performOnFileBackingDomain((uint64_t)v4, v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1AA8DB2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFIndex OSAPreferencesGetIntegerValue(void *a1, void *a2, Boolean *a3)
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  CFIndex AppIntegerValue;

  v5 = a1;
  v6 = (void *)MEMORY[0x1E0D64EE0];
  v7 = a2;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "multiUserMode");

  if ((v6 & 1) != 0)
  {
    if (a3)
      *a3 = 0;
    _preferencesForDomain(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a3)
          *a3 = 1;
        AppIntegerValue = objc_msgSend(v10, "integerValue");
      }
      else
      {
        AppIntegerValue = 0;
      }

    }
    else
    {
      AppIntegerValue = 0;
    }
  }
  else
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(v5, v7, a3);
    v9 = v7;
  }

  return AppIntegerValue;
}

uint64_t OSAPreferencesGetBoolValue(void *a1, void *a2, Boolean *a3)
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int AppBooleanValue;

  v5 = a1;
  v6 = (void *)MEMORY[0x1E0D64EE0];
  v7 = a2;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "multiUserMode");

  if ((v6 & 1) != 0)
  {
    if (a3)
      *a3 = 0;
    _preferencesForDomain(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a3)
          *a3 = 1;
        v11 = objc_msgSend(v10, "BOOLValue");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v7, a3);

    v11 = AppBooleanValue != 0;
  }

  return v11;
}

id OSAPreferencesGetValue(void *a1, void *a2)
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v9;

  v3 = a1;
  v4 = (void *)MEMORY[0x1E0D64EE0];
  v5 = a2;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "multiUserMode");

  if ((v7 & 1) != 0)
  {
    _preferencesForDomain(v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
  }
  else
  {
    v9 = (void *)CFPreferencesCopyValue(v3, v5, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  }

  return v9;
}

BOOL OSAPreferencesSynchronize(void *a1)
{
  __CFString *v1;
  void *v2;
  char v3;
  _BOOL8 v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "multiUserMode");

  v4 = (v3 & 1) != 0 || CFPreferencesSynchronize(v1, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]) != 0;
  return v4;
}

id OSAGetDATaskingValue(void *a1)
{
  return OSAPreferencesGetValue(a1, CFSTR("com.apple.da"));
}

uint64_t OSASetDATaskingValue(void *a1, void *a2)
{
  return OSAPreferencesSetValue(a1, a2, CFSTR("com.apple.da"));
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void _performOnFileBackingDomain(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPathComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v3[2](v3, v9);

  }
}

void ___preferencesForDomain_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void ___savePreferencesForDomain_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[6];
  __int128 v7;

  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___savePreferencesForDomain_block_invoke_2;
  v6[3] = &unk_1E57ECD50;
  v6[4] = v3;
  v6[5] = v4;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  ___savePreferencesForDomain_block_invoke_2((uint64_t)v6);

}

uint64_t ___savePreferencesForDomain_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v6 = *MEMORY[0x1E0CB2AA8];
    v7[0] = &unk_1E57EEFD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createFileAtPath:contents:attributes:", v3, 0, v4);

  }
  result = objc_msgSend(*(id *)(a1 + 48), "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t _createDirectoryIfNeeded(void *a1, char a2, uint64_t *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", a3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *a3;
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ doesn't exist - %@. Creating it.", buf, 0x16u);
    }
    if ((a2 & 1) != 0)
    {
      v8 = *MEMORY[0x1E0CB2AD8];
      v19 = *MEMORY[0x1E0CB2AA8];
      v20 = v8;
      v9 = *MEMORY[0x1E0CB2AE0];
      v21 = &unk_1E57EEFF0;
      v22 = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v21;
      v12 = &v19;
      v13 = 2;
    }
    else
    {
      v17 = *MEMORY[0x1E0CB2AA8];
      v18 = &unk_1E57EEFF0;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v18;
      v12 = &v17;
      v13 = 1;
    }
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13, v17, v18, v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v14, a3);

  }
  return v6;
}

id LogsContainerLocation()
{
  if (LogsContainerLocation_onceToken != -1)
    dispatch_once(&LogsContainerLocation_onceToken, &__block_literal_global);
  return (id)LogsContainerLocation_sLogsContainerLocation;
}

id OSACreateTempSubmittableLog(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    v9 = v8;
    v10 = a3;
    v11 = a1;
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    v13 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D64FC0]);
    objc_msgSend(v7, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D64FF0]);

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D64FD8]);
  }
  else
  {
    v15 = *MEMORY[0x1E0D64FF0];
    v22[0] = *MEMORY[0x1E0D64FC0];
    v22[1] = v15;
    v23[0] = MEMORY[0x1E0C9AAB0];
    v23[1] = v7;
    v22[2] = *MEMORY[0x1E0D64FD8];
    v23[2] = MEMORY[0x1E0C9AAB0];
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = a3;
    v18 = a1;
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D64EC8], "createForSubmission:metadata:options:error:writing:", a1, a3, v12, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:", fileno((FILE *)objc_msgSend(v19, "stream")));
  return v20;
}

BOOL OSAWriteLogForSubmission(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (v12)
    {
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D64FE8]);

      v12 = v14;
    }
    else
    {
      v18 = *MEMORY[0x1E0D64FE8];
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x1E0D64EC8], "createForSubmission:metadata:options:error:writing:", v9, v11, v12, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

BOOL OSAMoveFileForSubmissions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v6)
  {
    v7 = v6;
    v8 = a3;
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D64FD0]);
  }
  else
  {
    v16 = *MEMORY[0x1E0D64FD0];
    v11 = a3;
    objc_msgSend(v11, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v15 = 0;
  v12 = (id)objc_msgSend(MEMORY[0x1E0D64EC8], "createForSubmission:metadata:options:error:writing:", v5, 0, v9, &v15, 0);
  v13 = v15 == 0;

  return v13;
}

uint64_t OSAMoveFileForSyncing()
{
  return 0;
}

void OSAIterateSubmittableLogsWithBlock(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1AF42243C]();
  if (v3)
    v6 = objc_msgSend(v3, "mutableCopy");
  else
    v6 = objc_opt_new();
  v7 = (void *)v6;
  v8 = *MEMORY[0x1E0D64FF8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D64FF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
  v10 = (void *)MEMORY[0x1E0D64EC8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __OSAIterateSubmittableLogsWithBlock_block_invoke;
  v12[3] = &unk_1E57ECE90;
  v13 = &unk_1E57EF098;
  v11 = v4;
  v14 = v11;
  objc_msgSend(v10, "iterateLogsWithOptions:usingBlock:", v7, v12);

  objc_autoreleasePoolPop(v5);
}

id OSAGetSubmittableLogs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = (void *)objc_msgSend(v1, "mutableCopy");
  else
    v3 = (void *)objc_opt_new();
  v4 = v3;
  v5 = *MEMORY[0x1E0D64FC8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D64FC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __OSAGetSubmittableLogs_block_invoke;
  v13[3] = &unk_1E57ECEB8;
  v14 = v4;
  v8 = v7;
  v15 = v8;
  v9 = v4;
  OSAIterateSubmittableLogsWithBlock(v9, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

id OSASubmittableLogs()
{
  void *v0;
  void *v1;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D64FC8];
  v4[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OSAGetSubmittableLogs(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t OSAGetSyncableLogs()
{
  return 0;
}

id OSAOSVersion()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productNameVersionBuildString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id OSAProductName()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t OSAInMultiUserMode()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "multiUserMode");

  return v1;
}

uint64_t OSAContainerOTALoggingLibraryLocation()
{
  return 0;
}

id OSACreateRelPathInContainer(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int DirectoryIfNeeded;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2)
  {
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "multiUserMode") & 1) != 0)
    LogsContainerLocation();
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v26 = 0;
    DirectoryIfNeeded = _createDirectoryIfNeeded(v9, 1, (uint64_t *)&v26);
    v12 = v26;
    v13 = v12;
    if (DirectoryIfNeeded)
    {
      if (v6)
      {
        objc_msgSend(v10, "URLByAppendingPathComponent:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        v16 = objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", &v25);
        v17 = v25;

        if ((v16 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v14;
            v31 = 2112;
            v32 = v17;
            _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ doesn't exist - %@. Creating it.", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *MEMORY[0x1E0CB2AD8];
          v27[0] = *MEMORY[0x1E0CB2AA8];
          v27[1] = v18;
          v19 = *MEMORY[0x1E0CB2AE0];
          v28[0] = &unk_1E57EF008;
          v28[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v23, "createFileAtPath:contents:attributes:", v24, 0, v20);

          if ((v22 & 1) == 0)
          {

            v15 = 0;
          }
        }

      }
      else
      {
        objc_msgSend(v10, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
      }
      goto LABEL_21;
    }
    v17 = v12;
  }
  else
  {
    v17 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v10;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't create directory %@. Error: %@", buf, 0x16u);
  }
  v15 = 0;
LABEL_21:

  return v15;
}

uint64_t CRIsAppleInternal()
{
  return MGGetBoolAnswer();
}

void logForAppleCare(void *a1, double a2)
{
  void *v4;
  int v5;
  void *v6;

  v4 = (void *)MEMORY[0x1AF42243C]();
  if (objc_msgSend(a1, "count"))
  {
    initR3();
    v5 = openR3((uint64_t)&initR3_r3, objc_msgSend((id)qword_1EEB88118, "containsObject:", objc_msgSend(a1, "objectAtIndexedSubscript:", 0)), a2);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@\n"), OSADateFormat(), objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","))), "dataUsingEncoding:allowLossyConversion:", 4, 1);
      if (v6)
      {
        write(v5, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          logForAppleCare_cold_1(a1);
      }
    }
    close(v5);
  }
  objc_autoreleasePoolPop(v4);
}

void initR3()
{
  initR3_r3 = (int)time(0) / 86400;
  if (initR3_onceToken != -1)
    dispatch_once(&initR3_onceToken, &__block_literal_global_0);
}

uint64_t openR3(uint64_t a1, int a2, double a3)
{
  void *v4;
  const std::__fs::filesystem::path *v7;
  mode_t v8;
  uint64_t R3;
  int v10;
  uint64_t v11;
  ssize_t v12;
  int v13;
  uint64_t v14;
  char *v15;
  double v16;
  double v17;
  void *v19;
  const std::__fs::filesystem::path *v20;
  std::error_code *v21;
  int v22;
  int v23;
  int *v24;
  char *v25;
  int v26;
  int *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  unsigned int v38;
  stat v39;
  uint8_t buf[4];
  _BYTE v41[14];
  _OWORD value[4];
  stat v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    v7 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("general.log")), "fileSystemRepresentation");
    memset(&v39, 0, sizeof(v39));
    v8 = umask(0);
    if (lstat((const char *)v7, &v39) < 0)
    {
      if (*__error() != 2)
        goto LABEL_30;
      v14 = a1;
      v15 = (char *)v7;
      v16 = a3;
      v17 = a3;
    }
    else
    {
      R3 = 0xFFFFFFFFLL;
      if ((v39.st_mode & 0xF000) != 0x8000 || v39.st_nlink != 1 || v39.st_uid != *(_DWORD *)(a1 + 4))
        goto LABEL_31;
      v10 = v39.st_uid ? 384 : 420;
      if ((v39.st_mode & 0xFFF) != v10)
        goto LABEL_31;
      v11 = open((const char *)v7, 42);
      R3 = v11;
      if ((v11 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v26 = *__error();
          v27 = __error();
          v28 = strerror(*v27);
          v43.st_dev = 67109634;
          *(_DWORD *)&v43.st_mode = v26;
          LOWORD(v43.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v43.st_ino + 2) = (__darwin_ino64_t)v7;
          HIWORD(v43.st_uid) = 2080;
          *(_QWORD *)&v43.st_gid = v28;
          _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] opening %s, %s", (uint8_t *)&v43, 0x1Cu);
        }
        goto LABEL_31;
      }
      memset(&v43, 0, sizeof(v43));
      if (fstat(v11, &v43)
        && v43.st_nlink == v39.st_nlink
        && v43.st_uid == v39.st_uid
        && v43.st_mode == v39.st_mode
        && v43.st_ino == v39.st_ino
        && v43.st_dev == v39.st_dev)
      {
        goto LABEL_25;
      }
      value[0] = *(_OWORD *)"<legacy>";
      memset(&value[1], 0, 48);
      v38 = 0;
      v36 = a3;
      v37 = a3;
      v12 = fgetxattr(R3, "Version", value, 0x3FuLL, 0, 0);
      if (v12 >= 1)
        *((_BYTE *)value + v12) = 0;
      v13 = objc_msgSend(*(id *)(a1 + 24), "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", value));
      fgetxattr(R3, "Day_Seq", &v38, 4uLL, 0, 0);
      fgetxattr(R3, "Install", &v37, 8uLL, 0, 0);
      if (v13)
      {
        fgetxattr(R3, "Upgrade", &v36, 8uLL, 0, 0);
        if (v38 == *(_DWORD *)a1)
        {
          if (!a2 || v43.st_size <= 307200)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              openR3_cold_1((uint64_t)v7, v29, v30, v31, v32, v33, v34, v35);
            goto LABEL_31;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AppleCareSupport: WARN: limit exceeded, ignoring event", buf, 2u);
          }
LABEL_25:
          close(R3);
LABEL_30:
          R3 = 0xFFFFFFFFLL;
          goto LABEL_31;
        }
      }
      close(R3);
      v19 = (void *)objc_msgSend(*(id *)(a1 + 16), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("general-%d-%s.log"), v38, value));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v41 = v19;
        _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: rolling log -> %@", buf, 0xCu);
      }
      v20 = (const std::__fs::filesystem::path *)objc_msgSend(v19, "fileSystemRepresentation");
      rename(v7, v20, v21);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v23 = *__error();
          v24 = __error();
          v25 = strerror(*v24);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v41 = v23;
          *(_WORD *)&v41[4] = 2080;
          *(_QWORD *)&v41[6] = v25;
          _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] rename failed, %s", buf, 0x12u);
        }
        unlink((const char *)v7);
      }
      v17 = v36;
      v16 = v37;
      v14 = a1;
      v15 = (char *)v7;
    }
    R3 = createR3(v14, v15, v16, v17);
LABEL_31:
    umask(v8);
    return R3;
  }
  return 0xFFFFFFFFLL;
}

uint64_t logEventForAppleCare(void *a1)
{
  double Current;

  Current = CFAbsoluteTimeGetCurrent();
  logForAppleCare(a1, Current);
  return 0;
}

void logLineForAppleCare(uint64_t a1, uint64_t a2, double a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, v6, 0);
  logForAppleCare(v7, a3);

}

void rollAppleCareLogs()
{
  void *v0;
  uid_t v1;
  double Current;
  int v3;
  int v4;
  int v5;
  uid_t v6;
  uint64_t v7;
  const __CFString *v8;
  __int128 v9;

  v0 = (void *)MEMORY[0x1AF42243C]();
  initR3();
  v5 = initR3_r3;
  v9 = (unint64_t)qword_1EEB88110;
  v1 = getuid();
  v6 = v1;
  v7 = getgid();
  v8 = CFSTR("/Library/Logs/AppleSupport/");
  Current = CFAbsoluteTimeGetCurrent();
  v3 = openR3((uint64_t)&initR3_r3, 0, Current);
  if ((v3 & 0x80000000) == 0)
    close(v3);
  if (!v1)
  {
    v4 = openR3((uint64_t)&v5, 0, Current);
    if ((v4 & 0x80000000) == 0)
      close(v4);
  }
  purgeR3Logs(&initR3_r3);
  if (!v6)
    purgeR3Logs(&v5);
  objc_autoreleasePoolPop(v0);
}

void purgeR3Logs(int *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DIR *v11;
  DIR *v12;
  dirent *v13;
  __int128 v14;
  dirent *v15;
  char *d_name;
  uint64_t v17;
  const char *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int *v25;
  char *v26;
  __int128 v27;
  int value;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  _BYTE v32[18];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*((_QWORD *)a1 + 2);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      purgeR3Logs_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = opendir(v3);
    if (v11)
    {
      v12 = v11;
      v13 = readdir(v11);
      if (v13)
      {
        v15 = v13;
        *(_QWORD *)&v14 = 67109634;
        v27 = v14;
        do
        {
          d_name = v15->d_name;
          v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15->d_name, v27), "rangeOfString:options:", CFSTR("general.*\\.log"), 1024);
          if (v15->d_type == 8 && v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            value = 0;
            v19 = (const char *)objc_msgSend((id)objc_msgSend(*((id *)a1 + 2), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", d_name)), "fileSystemRepresentation");
            getxattr(v19, "Day_Seq", &value, 4uLL, 0, 0);
            v20 = value;
            v21 = *a1;
            v22 = privacyWindow;
            if (value <= *a1 - privacyWindow)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                v23 = v21 - v20;
                *(_DWORD *)buf = v27;
                if (v21 - v20 >= 365)
                  v23 = -1;
                v30 = v22;
                v31 = 1024;
                *(_DWORD *)v32 = v23;
                *(_WORD *)&v32[4] = 2080;
                *(_QWORD *)&v32[6] = d_name;
                _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: purging old (limit %d vs actual %d) %s", buf, 0x18u);
              }
              unlink(v19);
            }
          }
          v15 = readdir(v12);
        }
        while (v15);
      }
      closedir(v12);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 67109634;
      v30 = v24;
      v31 = 2080;
      *(_QWORD *)v32 = v3;
      *(_WORD *)&v32[8] = 2080;
      *(_QWORD *)&v32[10] = v26;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] scanning '%s', %s", buf, 0x1Cu);
    }
  }
}

uint64_t __initR3_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  passwd *v3;
  uint64_t result;
  uint8_t v5[16];

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "getPrefsKey:forDomain:withOptions:", CFSTR("R3PrivacyWindow"), CFSTR("com.apple.CrashReporterSupport"), 0);
  if (v0 && (v1 = v0, (int)objc_msgSend(v0, "intValue") >= 1))
    v2 = objc_msgSend(v1, "intValue");
  else
    v2 = 14;
  privacyWindow = v2;
  qword_1EEB880FC = 0;
  v3 = getpwnam("mobile");
  if (v3)
  {
    qword_1EEB880FC = *(_QWORD *)&v3->pw_uid;
    *(_QWORD *)&algn_1EEB88104[4] = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->pw_dir), "stringByAppendingPathComponent:", CFSTR("/Library/Logs/AppleSupport/"));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR unable to intialize data", v5, 2u);
  }
  endpwent();
  qword_1EEB88110 = MGCopyAnswer();
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E57EF0B0);
  qword_1EEB88118 = result;
  return result;
}

uint64_t createR3(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uid_t v9;
  const char *v10;
  const char *v11;
  size_t v12;
  int v13;
  int *v14;
  char *v15;
  __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  int v24;
  int *v25;
  char *v26;
  uint64_t v28;
  double v29;
  double value;
  _QWORD v31[7];
  _QWORD v32[7];
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a4;
  value = a3;
  v6 = 384;
  if (!*(_DWORD *)(a1 + 4))
    v6 = 420;
  v7 = open_dprotected_np(a2, 2594, 4, 0, v6);
  v8 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v34 = v24;
      *(_WORD *)&v34[4] = 2080;
      *(_QWORD *)&v34[6] = a2;
      v35 = 2080;
      v36 = v26;
      v21 = MEMORY[0x1E0C81028];
      v22 = "AppleCareSupport: ERROR[%d] failed to create %s, %s";
      v23 = 28;
      goto LABEL_20;
    }
  }
  else
  {
    v9 = *(_DWORD *)(a1 + 4);
    if (v9)
      fchown(v7, v9, *(_DWORD *)(a1 + 8));
    v10 = (const char *)objc_msgSend(*(id *)(a1 + 24), "UTF8String");
    if (!v10
      || (v11 = v10, !*v10)
      || (v12 = strlen(v10), fsetxattr(v8, "Version", v11, v12, 0, 0))
      || fsetxattr(v8, "Install", &value, 8uLL, 0, 0)
      || fsetxattr(v8, "Upgrade", &v29, 8uLL, 0, 0)
      || fsetxattr(v8, "Day_Seq", (const void *)a1, 4uLL, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v34 = v13;
        *(_WORD *)&v34[4] = 2080;
        *(_QWORD *)&v34[6] = a2;
        v35 = 2080;
        v36 = v15;
        _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] setting xattrs on %s, %s", buf, 0x1Cu);
      }
    }
    v28 = 0;
    v16 = (__CFString *)MGCopyAnswer();
    v31[0] = CFSTR("report");
    v31[1] = CFSTR("version");
    v32[0] = CFSTR("Device Software Diagnostic Log");
    v32[1] = &unk_1E57EF020;
    v31[2] = CFSTR("os_build");
    v32[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "productNameVersionBuildString");
    v31[3] = CFSTR("model");
    v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "modelCode");
    v18 = CFSTR("<no_sn>");
    if (v16)
      v18 = v16;
    v32[3] = v17;
    v32[4] = v18;
    v31[4] = CFSTR("serial");
    v31[5] = CFSTR("installed");
    v32[5] = OSADateFormat();
    v31[6] = CFSTR("updated");
    v32[6] = OSADateFormat();
    v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);

    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v19, 0, &v28);
    write(v8, (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
    write(v8, "\n", 1uLL);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v34 = a2;
      v21 = MEMORY[0x1E0C81028];
      v22 = "AppleCareSupport: new %s";
      v23 = 12;
LABEL_20:
      _os_log_impl(&dword_1AA8D9000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
    }
  }
  return v8;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1AA8DDBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA8DDD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA8DDE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1AA8DE014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1AA8DE5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ConfigureCarrierDebugging(uint64_t a1)
{
  ConfigureCarrierDebuggingWithPower(a1);
}

void ConfigureCarrierDebuggingWithPower(uint64_t a1)
{
  uint64_t (*v2)(void);
  void *v3;
  BOOL v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  _OWORD v8[2];
  uint64_t v9;

  if (ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle)
  {
    v2 = ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle;
  }
  else
  {
    v3 = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
    ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle = (uint64_t)v3;
    if (!v3)
    {
      NSLog(CFSTR("CrashReporterSupport.framework unable to load CoreTelephony framework"));
      return;
    }
    ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle = dlsym(v3, "_CTServerConnectionCreate");
    v2 = (uint64_t (*)(void))dlsym((void *)ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle, "_CTServerConnectionSetTraceProperty");
    ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle = v2;
  }
  if (ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    NSLog(CFSTR("Unable to locate _CTServerConnectionCreate/_CTServerConnectionSetTraceProperty in CoreTelephony"));
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    v5 = ((uint64_t (*)(_QWORD, uint64_t (*)(), _OWORD *))ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle)(*MEMORY[0x1E0C9AE00], _ServerConnectionCallBack, v8);
    if (v5)
    {
      v6 = (const void *)v5;
      ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle();
      CFRelease(v6);
    }
    OSAPreferencesSetValue(CFSTR("DisableLogObfuscation"), (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1), CFSTR("com.apple.CrashReporter"));
    if ((_DWORD)a1)
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    else
      v7 = 0;
    OSAPreferencesSetValue(CFSTR("BasebandLogLimit"), v7, CFSTR("com.apple.CrashReporter"));
    OSAPreferencesSynchronize(CFSTR("com.apple.CrashReporter"));
  }
}

void ConfigureInternalDebugging(uint64_t a1)
{
  ConfigureCarrierDebuggingWithPower(a1);
}

void ConfigureInternalDebuggingWithPower(uint64_t a1)
{
  ConfigureCarrierDebuggingWithPower(a1);
}

void *GetThermalState()
{
  void *v0;
  char *v1;
  unsigned int i;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  int out_token;
  char state64[37];
  char v12;
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  out_token = 0;
  if (!notify_register_check("com.apple.system.maxthermalsensorvalue", &out_token))
  {
    *(_QWORD *)state64 = 0;
    if (!notify_get_state(out_token, (uint64_t *)state64))
      objc_msgSend(v0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)state64));
    notify_cancel(out_token);
  }
  strcpy(state64, "com.apple.system.thermalSensorValues");
  v12 = 0;
  v13 = 0;
  v1 = &state64[strlen(state64)];
  for (i = 1; i != 20; ++i)
  {
    if (i >= 2)
      sprintf(v1, "%d", i);
    v9 = 0;
    if (!notify_register_check(state64, &out_token))
    {
      notify_get_state(out_token, &v9);
      notify_cancel(out_token);
    }
    if (!v9)
      break;
    objc_msgSend(v0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)v9));
    objc_msgSend(v0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", WORD1(v9)));
    objc_msgSend(v0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", WORD2(v9)));
    objc_msgSend(v0, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIWORD(v9)));
  }
  v3 = objc_msgSend(v0, "count");
  v4 = v3;
  if (v3 <= 4)
    v5 = 4;
  else
    v5 = v3;
  v6 = v5 - 3;
  if (v5 - 3 < v3)
  {
    v7 = (v3 - 1);
    do
    {
      if (objc_msgSend((id)objc_msgSend(v0, "objectAtIndex:", v7), "intValue"))
        break;
      objc_msgSend(v0, "removeLastObject");
      --v7;
      --v4;
    }
    while (v6 < v4);
  }
  if (objc_msgSend(v0, "count"))
    return v0;
  else
    return 0;
}

uint64_t AppAnalyticsEnabled()
{
  return checkMCFeature("MCFeatureAppAnalyticsAllowed", &AppAnalyticsEnabled_featureAppAnalyticsAllowed);
}

uint64_t DiagnosticLogSubmissionPreferenceExists()
{
  return 1;
}

uint64_t setDiagnosticLogSubmission()
{
  return 0;
}

void SubmitDiagnosticLogs()
{
  softLinkAndSubmit(0);
}

void softLinkAndSubmit(uint64_t a1)
{
  void *v2;
  id v3;
  uint8_t v4[16];

  v2 = (void *)MEMORY[0x1AF42243C]();
  if (softLinkAndSubmit_onceToken != -1)
    dispatch_once(&softLinkAndSubmit_onceToken, &__block_literal_global_103);
  if (softLinkAndSubmit_submissionClientObj)
  {
    v3 = objc_alloc_init((Class)softLinkAndSubmit_submissionClientObj);
    objc_msgSend(v3, "submitWithOptions:resultsCallback:", a1, 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to dylink OSASubmissionClient", v4, 2u);
  }
  objc_autoreleasePoolPop(v2);
}

void SubmitDiagnosticLogsIfFavorable()
{
  softLinkAndSubmit(0);
}

void SubmitDiagnosticLogPathsWithIdentifier(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v4[3];
  _QWORD v5[3];
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 4)
  {
    v4[0] = CFSTR("mode");
    v4[1] = CFSTR("logs");
    v5[0] = CFSTR("appletv-diagnostic");
    v5[1] = a1;
    v4[2] = CFSTR("submission_info");
    v5[2] = a2;
    softLinkAndSubmit(objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v7 = a3;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logs not submitted: unrecognized submission routing type %d.", buf, 8u);
  }
}

uint64_t GetHardwareModel()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "modelCode");
}

__CFString *GetIncidentID()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

uint64_t GetSystemVersion()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "productNameVersionBuildString");
}

const __CFString *GetSysIDWithDescription(int a1)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  CFTypeID v5;
  const __CFString *v6;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  if (stat("/AppleInternal/Library/PreferenceBundles/Carrier Settings.bundle", &v8))
    return &stru_1E57EE0A0;
  v3 = (const __CFString *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      v4 = CFSTR("ERROR UDID was not a string");
    }
  }
  else
  {
    v4 = CFSTR("UDID was null");
  }
  if (a1)
    v6 = CFSTR("UDID:            %@\n");
  else
    v6 = CFSTR("%@");
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v4);
  CFRelease(v4);
  return (const __CFString *)v2;
}

const __CFString *GetNameForLogType(int a1)
{
  const __CFString *result;

  if (a1 > 183)
  {
    if (a1 == 184)
    {
      return CFSTR("GPURestart");
    }
    else if (a1 == 201)
    {
      return CFSTR("Siri");
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a1)
    {
      case 166:
        result = CFSTR("KeyboardAccuracy");
        break;
      case 167:
        result = CFSTR("TCCService");
        break;
      case 168:
        result = CFSTR("Ultra_1");
        break;
      case 169:
      case 170:
      case 171:
      case 173:
      case 174:
      case 175:
        return 0;
      case 172:
        result = CFSTR("ECCEvent");
        break;
      case 176:
        result = CFSTR("FlashStatus");
        break;
      default:
        if (a1 != 156)
          return 0;
        result = CFSTR("CoreTime");
        break;
    }
  }
  return result;
}

uint64_t GetDeviceConfig()
{
  uint64_t result;
  id v1;
  uint64_t v2;

  result = config;
  if (!config)
  {
    v1 = objc_alloc(MEMORY[0x1E0CB3940]);
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "modelCode");
    result = objc_msgSend(v1, "initWithFormat:", CFSTR("Hardware Model: %@\nOS Version: %@\nSystem ID: %@"), v2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "productNameVersionBuildString"), GetSysIDWithDescription(0));
    config = result;
  }
  return result;
}

void CRLogStructuredData(int a1, void *a2)
{
  CFAbsoluteTime Current;
  id v5;
  _QWORD block[6];
  int v7;

  if (a2)
  {
    if (CRLogStructuredData_onceToken != -1)
      dispatch_once(&CRLogStructuredData_onceToken, &__block_literal_global_2);
    if (CRLogStructuredData_opt_in)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v5 = (id)objc_msgSend(a2, "copy");
      if (initForLoggingStructuredData_once != -1)
        dispatch_once(&initForLoggingStructuredData_once, &__block_literal_global_106);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __CRLogStructuredData_block_invoke_2;
      block[3] = &unk_1E57ED138;
      v7 = a1;
      *(CFAbsoluteTime *)&block[5] = Current;
      block[4] = v5;
      dispatch_async((dispatch_queue_t)dispatchQueue, block);
    }
  }
}

uint64_t CRDumpOldStructuredLog(uint64_t a1, void *a2, double a3)
{
  uint64_t result;
  const char *v7;
  StructuredDataReport *v8;
  stat v9;

  result = objc_msgSend(a2, "length");
  if (result)
  {
    result = objc_msgSend(a2, "fileSystemRepresentation");
    if (result)
    {
      v7 = (const char *)result;
      memset(&v9, 0, sizeof(v9));
      result = stat((const char *)result, &v9);
      if (!(_DWORD)result
        && v9.st_mtimespec.tv_sec / 86400 != (uint64_t)(*MEMORY[0x1E0C9ADF8] + (double)(uint64_t)floor(a3)) / 86400)
      {
        v8 = -[StructuredDataReport initWithType:withFile:]([StructuredDataReport alloc], "initWithType:withFile:", a1, a2);
        -[OSAReport saveWithOptions:](v8, "saveWithOptions:", 0);

        return unlink(v7);
      }
    }
  }
  return result;
}

uint64_t CRDumpAllOldStructuredDataLogs()
{
  double Current;
  uint64_t i;
  uint64_t v2;
  void *v3;
  uint64_t result;

  if (initForLoggingStructuredData_once != -1)
    dispatch_once(&initForLoggingStructuredData_once, &__block_literal_global_106);
  dispatch_sync((dispatch_queue_t)dispatchQueue, &__block_literal_global_84);
  Current = CFAbsoluteTimeGetCurrent();
  for (i = 0; i != 8; ++i)
  {
    v2 = dword_1AA8E09FC[i];
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.log"), CFSTR("/var/mobile/Library/Logs/"), GetNameForLogType(dword_1AA8E09FC[i]));
    result = CRDumpOldStructuredLog(v2, v3, Current);
  }
  return result;
}

void *IsCarryDeviceWithHangtracerEnabled()
{
  void *result;
  uint64_t v1;

  result = (void *)MGGetBoolAnswer();
  if ((_DWORD)result)
  {
    result = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"));
    if (result)
    {
      v1 = 0;
      result = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", result, 0, 0, &v1);
      if (result)
        return (void *)objc_msgSend((id)objc_msgSend(result, "valueForKey:", CFSTR("HangTracerEnabled")), "BOOLValue");
    }
  }
  return result;
}

void dlaggd_addScalarForKey(uint64_t a1, uint64_t a2)
{
  if (dlaggd_addScalarForKey_onceToken != -1)
    dispatch_once(&dlaggd_addScalarForKey_onceToken, &__block_literal_global_93);
  if (dlaggd_addScalarForKey___ADClientAddValueForScalarKey)
    dlaggd_addScalarForKey___ADClientAddValueForScalarKey(a1, a2);
}

void *__dlaggd_addScalarForKey_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    result = dlsym(result, "ADClientAddValueForScalarKey");
    dlaggd_addScalarForKey___ADClientAddValueForScalarKey = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

void dlaggd_pushDistrubtionForKey(uint64_t a1, double a2)
{
  if (dlaggd_pushDistrubtionForKey_onceToken != -1)
    dispatch_once(&dlaggd_pushDistrubtionForKey_onceToken, &__block_literal_global_96);
  if (dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey)
    dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey(a1, a2);
}

void *__dlaggd_pushDistrubtionForKey_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    result = dlsym(result, "ADClientPushValueForDistributionKey");
    dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey = (uint64_t (*)(_QWORD, double))result;
  }
  return result;
}

uint64_t CRGetReporterKey()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "crashReporterKey");
}

Class __softLinkAndSubmit_block_invoke()
{
  Class result;

  softLinkAndSubmit_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/OSASubmissionClient.framework/OSASubmissionClient", 4);
  result = objc_getClass("OSASubmissionClient");
  softLinkAndSubmit_submissionClientObj = (uint64_t)result;
  return result;
}

dispatch_queue_t __initForLoggingStructuredData_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  result = dispatch_queue_create("com.apple.CrashReporterSupport.LoggingQueue", v0);
  dispatchQueue = (uint64_t)result;
  return result;
}

int *ensure_dir_perms_analytics(const char *a1)
{
  int *result;
  int v3;
  int v4;
  stat v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  int st_mode;
  __int16 v16;
  int v17;
  char v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = (int *)mkdir(a1, 0x1EDu);
  if ((_DWORD)result == -1)
  {
    result = __error();
    if (*result == 17)
    {
      bzero(v18, 0x400uLL);
      getcwd(v18, 0x400uLL);
      memset(&v5, 0, sizeof(v5));
      v3 = stat(a1, &v5);
      v4 = fchmodat(-2, a1, 0x1EDu, 32);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447490;
        v7 = a1;
        v8 = 2082;
        v9 = v18;
        v10 = 1024;
        v11 = v3 == 0;
        v12 = 1024;
        v13 = v4 == 0;
        v14 = 1024;
        st_mode = v5.st_mode;
        v16 = 1024;
        v17 = 493;
        _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "=== CC ensured dir %{public}s had correct permissions {startPath: %{public}s, statSuccess: %d, successModifyPerms: %d, origninalMode: 0x%X, modifyMode: 0x%X}", buf, 0x2Eu);
      }
      return (int *)send_analytics();
    }
  }
  return result;
}

int *create_dir_with_owners_and_perms_with_analytics(const char *a1, int a2, uid_t a3, gid_t a4)
{
  int *result;
  int v9;
  int v10;
  int v11;
  stat v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  gid_t st_gid;
  __int16 v23;
  gid_t v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  int st_mode;
  __int16 v29;
  int v30;
  char v31[1024];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!mkdir(a1, a2) || (result = __error(), *result == 17))
  {
    bzero(v31, 0x400uLL);
    getcwd(v31, 0x400uLL);
    memset(&v12, 0, sizeof(v12));
    v9 = stat(a1, &v12);
    v10 = fchownat(-2, a1, a3, a4, 32);
    v11 = fchmodat(-2, a1, a2, 32);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136448258;
      v14 = a1;
      v15 = 2082;
      v16 = v31;
      v17 = 1024;
      v18 = v9 == 0;
      v19 = 1024;
      v20 = v10 == 0;
      v21 = 1024;
      st_gid = v12.st_gid;
      v23 = 1024;
      v24 = a4;
      v25 = 1024;
      v26 = v11 == 0;
      v27 = 1024;
      st_mode = v12.st_mode;
      v29 = 1024;
      v30 = a2;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "=== CC create dir %{public}s with owners and permissions {startPath: %{public}s, statSuccess: %d, successModifyGID: %d, origninalGID: %d, modifyGID: %d, successModifyPerms: %d, origninalMode: 0x%X, modifyMode: 0x%X}", buf, 0x40u);
    }
    return (int *)send_analytics();
  }
  return result;
}

uint64_t send_analytics()
{
  id v0;
  uint64_t v1;
  void *v2;
  pid_t v3;
  uint64_t v4;
  void *v5;
  size_t v7;
  _OWORD v8[40];
  int v9[2];
  int v10;
  pid_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setUsesSignificantDigits:", 1);
  objc_msgSend(v0, "setMaximumSignificantDigits:", 2);
  getprogname();
  *(_QWORD *)v9 = 0x1500000001;
  v8[0] = 0uLL;
  v7 = 16;
  if (sysctl(v9, 2u, v8, &v7, 0, 0) != -1)
  {
    if (*(_QWORD *)&v8[0])
    {
      v1 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*(uint64_t *)&v8[0]);
      if (v1)
      {
        v2 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", v1);
        objc_msgSend(v0, "stringForObjectValue:", objc_msgSend(v2, "numberWithDouble:"));
      }
    }
  }
  v3 = getpid();
  *(_QWORD *)v9 = 0xE00000001;
  v10 = 1;
  v11 = v3;
  memset(v8, 0, 512);
  v7 = 648;
  if ((sysctl(v9, 4u, v8, &v7, 0, 0) & 0x80000000) == 0)
  {
    v4 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*(uint64_t *)&v8[0]);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", v4);
      objc_msgSend(v0, "stringForObjectValue:", objc_msgSend(v5, "numberWithDouble:"));
    }
  }

  return AnalyticsSendEventLazy();
}

uint64_t __send_analytics_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  _QWORD v8[14];
  _QWORD v9[11];
  __int128 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("progname");
  if (*(_QWORD *)(a1 + 48))
    v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    v2 = CFSTR("<unknown>");
  v9[0] = v2;
  v8[1] = CFSTR("path");
  if (*(_QWORD *)(a1 + 56))
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    v3 = CFSTR("<unknown>");
  v9[1] = v3;
  v8[2] = CFSTR("start_path");
  if (*(_QWORD *)(a1 + 64))
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    v4 = CFSTR("<unknown>");
  v9[2] = v4;
  v8[3] = CFSTR("original_perms");
  if (*(_BYTE *)(a1 + 84))
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 80));
  else
    v5 = &unk_1E57EF038;
  v9[3] = v5;
  v8[4] = CFSTR("modify_perms");
  v9[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 85));
  v8[5] = CFSTR("modify_perms_success");
  v9[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 86));
  v8[6] = CFSTR("modify_perms_value");
  v9[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 82));
  v8[7] = CFSTR("original_gid");
  if (*(_BYTE *)(a1 + 84))
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  else
    v6 = &unk_1E57EF038;
  v9[7] = v6;
  v8[8] = CFSTR("modify_gid");
  v9[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 87));
  v8[9] = CFSTR("modify_gid_success");
  v9[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
  v8[10] = CFSTR("modify_gid_value");
  v9[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v8[11] = CFSTR("boot_time_appx");
  v8[12] = CFSTR("proc_uptime_appx");
  v10 = *(_OWORD *)(a1 + 32);
  v8[13] = CFSTR("framework");
  v11 = CFSTR("CrashCatcher");
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 14);
}

void __create_symlink_to_system_container_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t buf[4];
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(LogsContainerLocation(), "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Logs/DiagnosticReports"), 1);
  v1 = (uint64_t)v0;
  v2 = 0;
  if (v0 && _createDirectoryIfNeeded(v0, 1, &v2))
  {
    create_symlink_to_system_container_containerLocation = v1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v4 = v1;
    v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't create directory %@. Error: %@", buf, 0x16u);
  }
}

void logForAppleCare_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  OUTLINED_FUNCTION_0(&dword_1AA8D9000, MEMORY[0x1E0C81028], v1, "AppleCareSupport: event \"%@\"", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void openR3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA8D9000, MEMORY[0x1E0C81028], a3, "AppleCareSupport: existing log is valid, %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void purgeR3Logs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA8D9000, MEMORY[0x1E0C81028], a3, "AppleCareSupport: scanning '%s'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void CRCreateDirectoryStructure_cold_1(uint8_t *buf, _QWORD *a2)
{
  *(_DWORD *)buf = 138543362;
  *a2 = CFSTR("/private/var/mobile/Library/Logs/CrashReporter");
  _os_log_error_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error removing old symlink at %{public}@", buf, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t OSADateFormat()
{
  return MEMORY[0x1E0D64F18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void endgrent(void)
{
  MEMORY[0x1E0C831C0]();
}

void endpwent(void)
{
  MEMORY[0x1E0C831C8]();
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1E0C832D8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return MEMORY[0x1E0C832E8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1E0C83648](a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C83658]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1E0C83690](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int setegid(gid_t a1)
{
  return MEMORY[0x1E0C85320](*(_QWORD *)&a1);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1E0C85330](*(_QWORD *)&a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1E0C85998](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

