uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_1E6CB74C8;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B76F8374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUMUserManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_1E6CB6D70;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B76F8E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B76F92A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
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

void sub_1B76F94F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B76F980C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6CB6D90;
    v5 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UserManagementLibraryCore_frameworkLibrary)
    __getUMUserManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUMUserManagerClass_block_invoke_cold_2();
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *MICopyProcessNameForPid()
{
  int v0;
  int v1;
  void *v2;
  void *v3;
  _BYTE buffer[4096];
  uint64_t v6;

  v0 = MEMORY[0x1E0C80A78]();
  v6 = *MEMORY[0x1E0C80C00];
  v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
    return CFSTR("Unknown Process Name");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v1, 4);
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, _QWORD *a4)
{
  uint64_t v8;
  size_t v9;
  id result;
  int v11;
  char *v12;
  uint64_t v13;
  passwd *v14;
  passwd v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;
  _OWORD v20[5];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (sysconf(71) == -1)
    MIFetchInfoForUsername_cold_1(&v15, v20);
  v8 = MEMORY[0x1E0C80A78]();
  memset(&v15, 0, sizeof(v15));
  v14 = 0;
  result = (id)getpwnam_r(a1, &v15, (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9, &v14);
  if ((_DWORD)result)
  {
    v13 = 0;
    memset(v20, 0, sizeof(v20));
    v11 = (int)result;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v12 = strerror(v11);
    v16 = 136315394;
    v17 = a1;
    v18 = 2080;
    v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_13:
    MIFetchInfoForUsername_cold_2(&v16, v20);
  }
  if (!v14)
    goto LABEL_13;
  if (a2)
    *a2 = v15.pw_uid;
  if (a3)
    *a3 = v15.pw_gid;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v15.pw_dir, 1, 0);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a4 = result;
  }
  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, _QWORD *a2, gid_t *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v10;
  size_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  passwd *v26;
  passwd v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (sysconf(71) == -1)
  {
    v19 = *__error();
    v20 = (void *)*MEMORY[0x1E0CB2FE0];
    v21 = v19;
    v22 = strerror(v19);
    _CreateError((uint64_t)"MIFetchInfoForUID", 140, v20, v21, 0, 0, CFSTR("Failed to get home dir path size: %s"), v23, (uint64_t)v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_8;
  }
  v10 = MEMORY[0x1E0C80A78]();
  memset(&v27, 0, sizeof(v27));
  v26 = 0;
  v12 = getpwuid_r(a1, &v27, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, &v26);
  if (v12)
  {
    v14 = (void *)*MEMORY[0x1E0CB2FE0];
    v15 = v12;
    strerror(v12);
    _CreateError((uint64_t)"MIFetchInfoForUID", 150, v14, v15, 0, 0, CFSTR("getpwuid_r failed for uid %d : %s"), v16, a1);
LABEL_4:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_5;
  }
  if (!v26)
  {
    _CreateError((uint64_t)"MIFetchInfoForUID", 155, (void *)*MEMORY[0x1E0CB2FE0], 2, 0, 0, CFSTR("getpwuid_r succeeded but no user was found with uid %d"), v13, a1);
    goto LABEL_4;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27.pw_name);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    *a3 = v27.pw_gid;
  if (a4)
  {
    v18 = 1;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v27.pw_dir, 1, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
LABEL_5:
  if (!a5)
    goto LABEL_10;
LABEL_8:
  if ((v18 & 1) == 0)
    *a5 = objc_retainAutorelease(v17);
LABEL_10:

  return v18;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1)
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global);
  *a1 = MIGetCurrentMobileUserInfo_uid;
  *a2 = MIGetCurrentMobileUserInfo_gid;
}

uint64_t MIAssumeIdentityOfUsername(const char *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = 0;
  MIFetchInfoForUsername(a1, (uid_t *)&v4 + 1, (gid_t *)&v4, 0);
  return MIAssumeIdentity(HIDWORD(v4), v4, a2);
}

uint64_t MIAssumeIdentity(uint64_t a1, gid_t a2, _QWORD *a3)
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  int *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  id v28;

  if (!(a2 | a1))
  {
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v6)
      MIAssumeIdentity_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  v27 = 0;
  v28 = 0;
  v14 = MIFetchInfoForUID(a1, &v28, 0, 0, &v27);
  v15 = v28;
  v16 = v27;
  if (v14)
  {
    if (pthread_setugid_np(a1, a2))
    {
      v17 = __error();
      v18 = (void *)*MEMORY[0x1E0CB2FE0];
      v26 = *v17;
      strerror(*v17);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 228, v18, v26, 0, 0, CFSTR("pthread_setugid_np failed for uid %d gid %d; error %d (%s)"),
        v19,
        a1);
    }
    else
    {
      if (!initgroups((const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), a2))
      {
        v24 = 1;
        goto LABEL_16;
      }
      v20 = *__error();
      MIRestoreIdentity();
      v21 = (void *)*MEMORY[0x1E0CB2FE0];
      strerror(v20);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 238, v21, v20, 0, 0, CFSTR("SYS_initgroups failed; error %d (%s)"),
        v22,
        v20);
    }
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v23;
  }
  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v24 = 0;
    *a3 = v16;
  }
  else
  {
    v24 = 0;
  }
LABEL_16:

  return v24;
}

uint64_t MIRestoreIdentity()
{
  uid_t v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;

  v0 = getuid();
  if (!(v0 | getgid()))
  {
    v1 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v1)
      MIRestoreIdentity_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((_DWORD)result)
  {
    v10 = *__error();
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    strerror(v10);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  return result;
}

uint64_t MIAssumeMobileIdentity(_QWORD *a1)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1)
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global);
  return MIAssumeIdentity(MIGetCurrentMobileUserInfo_uid, MIGetCurrentMobileUserInfo_gid, a1);
}

id MILoadInfoPlist(void *a1, void *a2)
{
  return MILoadInfoPlistWithError(a1, a2, 0);
}

id MILoadInfoPlistWithError(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  __CFBundle *v7;
  id v8;
  uint64_t FilteredInfoPlist;
  uint64_t v10;
  const void *v11;
  CFTypeID TypeID;
  void *v13;
  CFDictionaryRef InfoDictionary;
  void *v15;
  uint64_t v16;
  CFTypeID v17;
  CFStringRef v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;

  v5 = a1;
  v6 = a2;
  v24 = 0;
  v7 = (__CFBundle *)_CreateCFBundle(v5, 0, &v24);
  v8 = v24;
  if (v7)
  {
    if (v6)
    {
      FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        v11 = (const void *)FilteredInfoPlist;
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v11))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v11);
        }
        else
        {
          v17 = CFGetTypeID(v11);
          v18 = CFCopyTypeIDDescription(v17);
          _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 363, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@"), v19, (uint64_t)v18);
          v20 = objc_claimAutoreleasedReturnValue();

          if (v18)
            CFRelease(v18);
          CFRelease(v11);
          v13 = 0;
          v8 = (id)v20;
        }
        goto LABEL_17;
      }
      _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 357, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Failed to get filtered Info.plist with keys %@ from bundle %@"), v10, (uint64_t)v6);
      v16 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      InfoDictionary = CFBundleGetInfoDictionary(v7);
      if (InfoDictionary)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", InfoDictionary);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15;
        if (v15)
          objc_msgSend(v15, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
LABEL_17:
        CFRelease(v7);
        if (!a3)
          goto LABEL_20;
        goto LABEL_18;
      }
      objc_msgSend(v5, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 378, CFSTR("MIInstallerErrorDomain"), 35, 0, 0, CFSTR("CFBundleGetInfoDictionary failed for bundle at %@"), v22, (uint64_t)v21);
      v16 = objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
    v8 = (id)v16;
    goto LABEL_17;
  }
  v13 = 0;
  if (!a3)
    goto LABEL_20;
LABEL_18:
  if (!v13)
    *a3 = objc_retainAutorelease(v8);
LABEL_20:

  return v13;
}

const void *_CreateCFBundle(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t Unique;
  const void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  const void *v26;
  uint64_t v27;
  id v28;

  v5 = a1;
  Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"_CreateCFBundle", 296, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Failed to create CFBundle for %@"), v13, (uint64_t)v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (!a3)
    {
LABEL_23:
      v7 = 0;
      goto LABEL_24;
    }
LABEL_11:
    v11 = objc_retainAutorelease(v11);
    v7 = 0;
    *a3 = v11;
    goto LABEL_24;
  }
  v7 = (const void *)Unique;
  v8 = (id)_CFBundleCopyInfoPlistURL();
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v26 = v7;
      MOLogWrite();
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0, v26);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v9, "itemIsFileAtURL:error:", v8, &v28);
  v11 = v28;

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CB2FE0];
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v16 = objc_msgSend(v11, "code");

      if (v16 == 2)
      {
        objc_msgSend(v8, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"_CreateCFBundle", 310, CFSTR("MIInstallerErrorDomain"), 35, v11, 0, CFSTR("Info.plist missing at %@"), v18, (uint64_t)v17);
        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v15))
    {
      v20 = objc_msgSend(v11, "code");

      if (v20 == 22)
      {
        objc_msgSend(v8, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (uint64_t)v17;
        v22 = CFSTR("Expected Info.plist file at %@ but found something that was not a file.");
        v23 = 312;
LABEL_21:
        _CreateAndLogError((uint64_t)"_CreateCFBundle", v23, CFSTR("MIInstallerErrorDomain"), 3, v11, 0, v22, v21, v27);
LABEL_22:
        v24 = objc_claimAutoreleasedReturnValue();

        CFRelease(v7);
        v11 = (id)v24;
        if (!a3)
          goto LABEL_23;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (uint64_t)v17;
    v22 = CFSTR("Error when introspecting %@");
    v23 = 314;
    goto LABEL_21;
  }
  if (a2)
  {
    v8 = objc_retainAutorelease(v8);
    *a2 = v8;
  }
LABEL_24:

  return v7;
}

id MILoadRawInfoPlist(void *a1, _QWORD *a2)
{
  const void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v3 = _CreateCFBundle(a1, &v12, &v11);
  v4 = v12;
  v5 = v11;
  if (v3)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "MI_dictionaryWithContentsOfURL:options:error:", v4, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    CFRelease(v3);
    v5 = v7;
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if (!v8)
    *a2 = objc_retainAutorelease(v5);
LABEL_7:

  return v8;
}

void MIRecordCurrentBuildVersion(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = a1;
  v2 = (void *)_CFCopySystemVersionDictionary();
  v7 = 0;
  v3 = objc_msgSend(v2, "MI_writeToURL:format:options:error:", v1, 200, 268435457, &v7);
  v4 = v7;
  if ((v3 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

LABEL_8:
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    goto LABEL_8;
  }

}

uint64_t MIIsBuildUpgrade(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
      goto LABEL_16;
LABEL_15:
    MOLogWrite();
LABEL_16:
    v12 = 0;
    v13 = 0;
    v9 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_26;
  }
  v5 = *MEMORY[0x1E0C9AB90];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = (id)v6;
  v8 = (void *)_CFCopySystemVersionDictionary();
  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v12 = 0;
    v13 = 0;
    v9 = 0;
    goto LABEL_25;
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v12 = 0;
    v13 = 0;
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v11))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v14 = 0;
    goto LABEL_29;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
LABEL_26:
  if (a2)
  {
    v7 = objc_retainAutorelease(v7);
    *a2 = v7;
  }
  v14 = 1;
LABEL_29:

  return v14;
}

id MILoadFilteredPlist(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int Filtered;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  id v24;
  CFTypeRef v25;
  CFTypeRef cf;

  v5 = a1;
  v6 = a2;
  v25 = 0;
  cf = 0;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 3, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (!v7)
  {
    objc_msgSend(v5, "path");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 502, CFSTR("MIInstallerErrorDomain"), 4, v8, 0, CFSTR("Failed to read plist from %@"), v15, (uint64_t)v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v6)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;

    if (!v10)
    {
      objc_msgSend(v5, "path");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 520, CFSTR("MIInstallerErrorDomain"), 4, v13, 0, CFSTR("Failed to decode plist from %@"), v20, (uint64_t)v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v8 = v13;
    goto LABEL_12;
  }
  Filtered = _CFPropertyListCreateFiltered();
  v10 = (void *)v25;
  if (Filtered)
    v11 = v25 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v25 = 0;
LABEL_12:
    objc_opt_class();
    v12 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v12;
    else
      v17 = 0;

    if (v17)
    {
      v16 = v8;
      goto LABEL_24;
    }
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 526, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@"), v19, (uint64_t)v13);
    goto LABEL_18;
  }
  v12 = (id)cf;
  cf = 0;
  objc_msgSend(v5, "path");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 511, CFSTR("MIInstallerErrorDomain"), 4, v12, 0, CFSTR("Failed to decode plist from %@"), v14, (uint64_t)v13);
LABEL_18:
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  v8 = v13;
LABEL_21:

  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v12 = 0;
    *a3 = v16;
  }
  else
  {
    v12 = 0;
  }
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v25)
  {
    CFRelease(v25);
    v25 = 0;
  }
  v21 = v12;

  return v21;
}

id MICopyCurrentBuildVersion()
{
  if (MICopyCurrentBuildVersion_onceToken != -1)
    dispatch_once(&MICopyCurrentBuildVersion_onceToken, &__block_literal_global_72);
  return (id)MICopyCurrentBuildVersion_buildVersion;
}

uint64_t MIAssertHighResourceUsage()
{
  unsigned int v0;
  uint64_t result;

  do
    v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
  while (__stlxr(v0 + 1, (unsigned int *)&sResourceExpectationCount));
  if (!v0)
  {
    getpid();
    return proc_disable_cpumon();
  }
  return result;
}

uint64_t MIClearResourceAssertion()
{
  unsigned int v0;
  unsigned int v1;
  uint64_t result;

  do
  {
    v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
    v1 = v0 - 1;
  }
  while (__stlxr(v1, (unsigned int *)&sResourceExpectationCount));
  if (!v1)
  {
    getpid();
    return proc_set_cpumon_defaults();
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void _InitTraversalState(void *a1)
{
  bzero(a1, 0x420uLL);
}

_QWORD *_DestroyTraversalState(uint64_t a1)
{
  _QWORD *i;
  _QWORD *v3;
  _QWORD *result;

  for (i = *(_QWORD **)a1; *(_QWORD *)a1; i = *(_QWORD **)a1)
  {
    *(_QWORD *)a1 = *i;
    --*(_BYTE *)(a1 + 1051);
    _FreeContinuation(a1, (uint64_t)i);
  }
  while (1)
  {
    v3 = *(_QWORD **)(a1 + 8);
    if (!v3)
      break;
    *(_QWORD *)(a1 + 8) = *v3;
    free(v3);
  }
  while (1)
  {
    result = *(_QWORD **)(a1 + 16);
    if (!result)
      break;
    *(_QWORD *)(a1 + 16) = *result;
    free(result);
  }
  return result;
}

_QWORD *_PopContinuation(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)a1;
  if (result)
  {
    *(_QWORD *)a1 = *result;
    --*(_BYTE *)(a1 + 1051);
  }
  return result;
}

uint64_t _FreeContinuation(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;

  v4 = *(_QWORD **)(a2 + 8);
  if (v4)
  {
    *v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
  }
  result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    result = close(result);
    *(_DWORD *)(a2 + 24) = -1;
  }
  *(_QWORD *)a2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  return result;
}

_QWORD *_CreateAndPushContinuation(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *AttrBuffer;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = *v2;
  }
  else
  {
    v2 = malloc_type_malloc(0x20uLL, 0x103004057E7F81CuLL);
    if (!v2)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      return 0;
    }
  }
  AttrBuffer = _GetAttrBuffer(a1);
  v2[1] = AttrBuffer;
  if (!AttrBuffer)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    free(v2);
    return 0;
  }
  v2[2] = 0;
  v2[3] = 0xFFFFFFFFLL;
  *v2 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v2;
  ++*(_BYTE *)(a1 + 1051);
  return v2;
}

_QWORD *_GetAttrBuffer(uint64_t a1)
{
  _QWORD *v1;
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;

  v1 = *(_QWORD **)(a1 + 8);
  if (v1)
  {
    *(_QWORD *)(a1 + 8) = *v1;
    return v1;
  }
  v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    v4 = *(_QWORD **)a1;
    if (*(_QWORD *)a1 && v4[1])
    {
      while (1)
      {
        v5 = v4;
        v4 = (_QWORD *)*v4;
        if (!v4)
          break;
        if (!v4[1])
        {
          if (!v5)
            goto LABEL_13;
          break;
        }
      }
      v1 = (_QWORD *)v5[1];
      v5[1] = 0;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      v6 = *((_DWORD *)v5 + 6);
      if ((v6 & 0x80000000) == 0)
      {
        close(v6);
        *((_DWORD *)v5 + 6) = -1;
      }
    }
    else
    {
LABEL_13:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      return 0;
    }
    return v1;
  }
  *(_BYTE *)(a1 + 1050) = v3 + 1;
  return malloc_type_malloc(0x4000uLL, 0x8D484474uLL);
}

uint64_t _PushContinuation(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)result;
  *(_QWORD *)result = a2;
  ++*(_BYTE *)(result + 1051);
  return result;
}

BOOL _PushPathBuf(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v3 = *(unsigned __int16 *)(a1 + 1048);
  v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    v6 = a1 + 24;
    *(_BYTE *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 1048) = v4;
    *(_BYTE *)(v6 + v4) = 0;
  }
  return v4 < 0x400;
}

uint64_t _PopPathBuf(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      v2 = *(_BYTE *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }
    while (!v2);
  }
  *(_BYTE *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 1048) = v1;
  return result;
}

uint64_t _LastPathElement(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v3 = 0;
  v4 = a1 + a2;
  while (1)
  {
    v5 = v3;
    v6 = v4 + v3;
    v7 = *(unsigned __int8 *)(v6 - 1);
    if (v6 - 1 <= a1)
      break;
    v3 = v5 - 1;
    if (v7 == 47)
      goto LABEL_6;
  }
  if (v7 == 47)
  {
LABEL_6:
    *a3 = -v5;
    return v4 + v5;
  }
  return 0;
}

uint64_t TraverseDirectory(uint64_t a1, char a2, unsigned int a3, _QWORD *a4, void *a5)
{
  return TraverseDirectoryWithPostTraversal(a1, a2, a3, a4, a5, 0);
}

uint64_t TraverseDirectoryWithPostTraversal(uint64_t a1, char a2, unsigned int a3, _QWORD *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  int ContinuationFD;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  int32x2_t *v32;
  _QWORD *AttrBuffer;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned __int32 v37;
  unsigned __int32 v38;
  unsigned int v39;
  uint64_t v40;
  int32x2_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  int v49;
  void *v50;
  int v51;
  uint64_t v52;
  unsigned __int16 v53;
  BOOL v54;
  int v55;
  id v56;
  int v57;
  void *v58;
  uint64_t v59;
  unsigned __int16 v60;
  BOOL v61;
  _QWORD *v62;
  int v63;
  id v64;
  int v65;
  int v66;
  void *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  int v73;
  _BOOL4 v74;
  int v75;
  __CFString *v76;
  __CFString *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  _QWORD *v84;
  int v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  int v93;
  uint64_t v94;
  _QWORD *v95;
  int v96;
  uint64_t v97;
  _QWORD *v98;
  char v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  id v107;
  const void *v108;
  __int128 v109;
  int __errnum[4];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  int32x2_t *v121;
  _QWORD *v122;
  int32x2_t *v123;
  _BYTE v124[1024];
  unsigned __int16 v125;
  char v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v104 = 0;
  v105 = 0;
  v103 = 5;
  if ((a3 & 1) != 0)
    v13 = -1610579959;
  else
    v13 = -1610612727;
  LODWORD(v105) = (a3 >> 6) & 4 | (a3 >> 7) & 1;
  HIDWORD(v103) = v13 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  HIDWORD(v104) = 6;
  bzero(&v121, 0x420uLL);
  if (!a1)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 891, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, CFSTR("%s was called with a NULL path parameter."), v14, (uint64_t)"_Bool TraverseDirectoryWithPostTraversal(const char *, TraverseDirectoryOptions, TraverseDirectoryAdditionalFetchProperties, NSError *__autoreleasing *, __strong TraverseDirectoryItemBlock, __strong TraverseDirectoryPostTraversalBlock)");
    goto LABEL_15;
  }
  v15 = __strlcpy_chk();
  if (v15 >= 0x400)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 898, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to iterate directories starting at a path that was too long: %s"), v16, a1);
LABEL_15:
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v125 = v15;
  v17 = _CreateAndPushContinuation((uint64_t)&v121);
  if (!v17)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 906, (void *)*MEMORY[0x1E0CB2FE0], 12, 0, 0, CFSTR("Failed to create a continuation"), v18, v97);
    goto LABEL_15;
  }
  if ((a2 & 1) == 0)
  {
    v19 = (uint64_t)v17;
    v20 = a2;
    v21 = v11;
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    *(_OWORD *)__errnum = 0u;
    v120 = 0;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v115 = 0u;
    v107 = 0;
    v108 = 0;
    v106 = 0;
    ContinuationFD = _GetContinuationFD((uint64_t)&v121, v19, 0, &v107);
    v23 = v107;
    if (ContinuationFD == -1)
    {
      a2 = v20;
    }
    else
    {
      if (!fgetattrlist(ContinuationFD, &v103, *(void **)(v19 + 8), 0x4000uLL, 0))
      {
        _ParseAttributeBuf((uint64_t)v124, *(_QWORD *)(v19 + 8), (uint64_t)&v109, &v108, 0, &v106);
        a2 = v20;
        if (DWORD1(v111) != 2)
        {
          v69 = *(_DWORD *)(v19 + 24);
          if ((v69 & 0x80000000) == 0)
          {
            close(v69);
            *(_DWORD *)(v19 + 24) = -1;
          }
        }
        v70 = 0;
        while (1)
        {
          v71 = v70;
          v72 = (char *)&v121 + v125 + v70;
          v73 = v72[23];
          if (v72 + 23 <= v124)
            break;
          v70 = v71 - 1;
          if (v73 == 47)
            goto LABEL_102;
        }
        if (v73 != 47)
        {
          _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 839, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to locate last path element in %s"), v68, (uint64_t)v124);
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_102:
        v74 = _CallClientBlock(v20, (uint64_t)v124, v125, (uint64_t)&v124[v125 + v71], -v71, 0, (uint64_t)&v109, (uint64_t)&v115, (uint64_t)v108, v21)- 1 < 2;
        v75 = DWORD1(v111) != 2 || v74;
        if (v106)
          v65 = 1;
        else
          v65 = v75;
        v64 = 0;
        v66 = 1;
        goto LABEL_89;
      }
      v24 = *__error();
      v25 = (void *)*MEMORY[0x1E0CB2FE0];
      v26 = v24;
      strerror(v24);
      _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 823, v25, v26, 0, 0, CFSTR("fgetattrlist for %s failed: %s"), v27, (uint64_t)v124);
      v28 = objc_claimAutoreleasedReturnValue();
      a2 = v20;
LABEL_13:

      v23 = (id)v28;
    }
    v64 = objc_retainAutorelease(v23);
    v65 = 0;
    v66 = 0;
    v23 = v64;
LABEL_89:

    v29 = v64;
    if (!v66)
      goto LABEL_16;
    if (v65)
      goto LABEL_91;
    goto LABEL_21;
  }
  v29 = 0;
LABEL_21:
  v32 = v121;
  if (!v121)
    goto LABEL_91;
  v98 = a4;
  v99 = a2;
  while (1)
  {
    v121 = (int32x2_t *)*v32;
    --v126;
    if (!*(_QWORD *)&v32[1])
    {
      AttrBuffer = _GetAttrBuffer((uint64_t)&v121);
      v32[1] = (int32x2_t)AttrBuffer;
      if (!AttrBuffer)
        break;
    }
    while (1)
    {
      v102 = v11;
      v101 = v12;
      v120 = 0;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      *(_OWORD *)__errnum = 0u;
      v111 = 0u;
      v109 = 0u;
      v36 = v32[3].u16[2];
      if (!v32[3].i16[2])
        goto LABEL_62;
      v37 = v32[2].u32[0];
      v38 = v32[2].u32[1];
      v39 = v37 - v38;
      if (v37 < v38)
      {
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 650, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)"), v35, v32[2].u32[0]);
LABEL_93:
        v67 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_117:
        v82 = objc_retainAutorelease(v67);

LABEL_118:
        v83 = v82;

        v84 = (_QWORD *)v32[1];
        if (v84)
        {
          *v84 = v122;
          v122 = v84;
        }
        v85 = v32[3].i32[0];
        if ((v85 & 0x80000000) == 0)
        {
          close(v85);
          v32[3].i32[0] = -1;
        }
        *v32 = (int32x2_t)v123;
        v123 = v32;
        v29 = v83;
        goto LABEL_123;
      }
      if (v37 == v38)
      {
        v40 = v32[3].u16[3];
      }
      else
      {
        if (v39 >= v36)
        {
          v32[2].i32[1] = v38 + v36;
          v32[3].i16[3] = v36;
          goto LABEL_62;
        }
        v40 = (unsigned __int16)(v37 - v38);
        v32[3].i16[3] = v39;
        v32[2].i32[1] = v37;
      }
      v41 = v32[1];
      if ((_DWORD)v40)
      {
        v42 = 0;
        v43 = 0;
        while (1)
        {
          v44 = *(unsigned int *)(*(_QWORD *)&v41 + v43);
          v43 += v44;
          if (v43 > 0x4000)
            break;
          if (++v42 >= v40)
            goto LABEL_37;
        }
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 685, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Read entry length %u for entry %hu but that put us off the end of the buffer"), v35, v44);
        goto LABEL_93;
      }
      v43 = 0;
LABEL_37:
      v100 = v11;
      if (v40 < v36)
      {
        while (1)
        {
          v107 = 0;
          v108 = 0;
          v106 = 0;
          _ParseAttributeBuf((uint64_t)v124, *(_QWORD *)&v41 + v43, (uint64_t)&v109, &v107, &v108, &v106);
          v46 = (uint64_t)v108;
          if (!v108)
            break;
          v43 += v109;
          if (v43 > 0x4000)
          {
            v76 = CFSTR("MIInstallerErrorDomain");
            v97 = v109;
            v77 = CFSTR("Read entry length %u for entry %hu but that put us off the end of the buffer");
            v78 = 709;
            goto LABEL_112;
          }
          v47 = __errnum[2];
          if (__errnum[2])
          {
            v80 = (void *)*MEMORY[0x1E0CB2FE0];
            strerror(__errnum[2]);
            _CreateAndLogError((uint64_t)"_ProcessContinuation", 716, v80, v47, 0, 0, CFSTR("got error while processing entry %hu in %s : %s"), v81, v40);
            goto LABEL_116;
          }
          v48 = (v111 - 1);
          if (!_PushPathBuf((uint64_t)&v121, v108, v48))
          {
            v76 = (__CFString *)*MEMORY[0x1E0CB2FE0];
            v97 = v46;
            v77 = CFSTR("Could not append element \"%s\" of length %zd to path \"%s\" because it would make the path longer than MAXPATHLEN");
            v78 = 723;
            v79 = 63;
            goto LABEL_115;
          }
          v49 = _CallClientBlock(v99, (uint64_t)v124, v125, v46, v48, v126 + 1, (uint64_t)&v109, (uint64_t)&v115, (uint64_t)v107, v102);
          if (v49 == 2)
          {
            v106 = 1;
          }
          else if (v49 == 1)
          {
            goto LABEL_127;
          }
          ++v32[3].i16[3];
          v32[2] = vadd_s32(v32[2], (int32x2_t)0x100000001);
          if (DWORD1(v111) == 2)
          {
            if (!v106)
            {
              *v32 = (int32x2_t)v121;
              v121 = v32;
              ++v126;
              if (_CreateAndPushContinuation((uint64_t)&v121))
              {

                v11 = v100;
                goto LABEL_85;
              }
              v76 = (__CFString *)*MEMORY[0x1E0CB2FE0];
              v77 = CFSTR("Failed to create a continuation");
              v78 = 753;
              v79 = 12;
LABEL_115:
              _CreateAndLogError((uint64_t)"_ProcessContinuation", v78, v76, v79, 0, 0, v77, v45, v97);
LABEL_116:
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v100;
              goto LABEL_117;
            }
            if (v12)
            {
              v50 = (void *)MEMORY[0x1BCCAA068]();
              v51 = (*((uint64_t (**)(id, _BYTE *))v12 + 2))(v101, v124);
              objc_autoreleasePoolPop(v50);
              if (!v51)
              {
LABEL_127:

                v92 = (_QWORD *)v32[1];
                v11 = v100;
                if (v92)
                {
                  *v92 = v122;
                  v122 = v92;
                }
                v93 = v32[3].i32[0];
                if ((v93 & 0x80000000) == 0)
                {
                  close(v93);
                  v32[3].i32[0] = -1;
                }
                *v32 = (int32x2_t)v123;
                v123 = v32;
                goto LABEL_91;
              }
            }
          }
          v52 = v125;
          if (v125)
          {
            v11 = v100;
            do
            {
              v53 = v52 - 1;
              v54 = v124[v52 - 1] == 47 || v52 == 1;
              --v52;
            }
            while (!v54);
            v52 = v53;
          }
          else
          {
            v11 = v100;
          }
          v40 = (v40 + 1);
          v124[v52] = 0;
          v125 = v52;
          if (v40 >= v32[3].u16[2])
            goto LABEL_62;
        }
        v76 = CFSTR("MIInstallerErrorDomain");
        v97 = v40;
        v77 = CFSTR("Entry %hu in %s did not include name information even though we requested it.");
        v78 = 702;
LABEL_112:
        v79 = 4;
        goto LABEL_115;
      }
LABEL_62:

      *(_QWORD *)&v109 = 0;
      v55 = _GetContinuationFD((uint64_t)&v121, (uint64_t)v32, 1, &v109);
      v56 = (id)v109;
      if (v55 == -1)
        goto LABEL_125;
      v57 = getattrlistbulk(v55, &v103, *(void **)&v32[1], 0x4000uLL, 0);
      if (!v57)
        break;
      if (v57 == -1)
      {
        v86 = *__error();
        v87 = (void *)*MEMORY[0x1E0CB2FE0];
        v88 = v86;
        v89 = v32[2].u32[0];
        strerror(v86);
        _CreateAndLogError((uint64_t)"_PopulateAttrBuf", 410, v87, v88, 0, 0, CFSTR("getattrlistbulk failed on entry %u in %s : %s"), v90, v89);
        v91 = objc_claimAutoreleasedReturnValue();

        v56 = (id)v91;
LABEL_125:
        v82 = objc_retainAutorelease(v56);

        goto LABEL_118;
      }
      v32[3].i16[2] = v57;
      v32[3].i16[3] = 0;

    }
    if (!v12 || (v99 & 1) != 0 && !v121)
      goto LABEL_71;
    v58 = (void *)MEMORY[0x1BCCAA068]();
    if (!(*((unsigned int (**)(id, _BYTE *))v12 + 2))(v101, v124))
    {
      v95 = (_QWORD *)v32[1];
      if (v95)
      {
        *v95 = v122;
        v122 = v95;
      }
      v96 = v32[3].i32[0];
      if ((v96 & 0x80000000) == 0)
      {
        close(v96);
        v32[3].i32[0] = -1;
      }
      *v32 = (int32x2_t)v123;
      v123 = v32;
      objc_autoreleasePoolPop(v58);
      goto LABEL_91;
    }
    objc_autoreleasePoolPop(v58);
LABEL_71:
    v59 = v125;
    if (v125)
    {
      do
      {
        v60 = v59 - 1;
        v61 = v124[v59 - 1] == 47 || v59 == 1;
        --v59;
      }
      while (!v61);
      v59 = v60;
    }
    v124[v59] = 0;
    v125 = v59;
    v62 = (_QWORD *)v32[1];
    if (v62)
    {
      *v62 = v122;
      v122 = v62;
    }
    v63 = v32[3].i32[0];
    if ((v63 & 0x80000000) == 0)
    {
      close(v63);
      v32[3].i32[0] = -1;
    }
    *v32 = (int32x2_t)v123;
    v123 = v32;
LABEL_85:
    v32 = v121;
    if (!v121)
    {
LABEL_91:
      _DestroyTraversalState((uint64_t)&v121);
      v30 = 1;
      goto LABEL_19;
    }
  }
  _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 931, (void *)*MEMORY[0x1E0CB2FE0], 12, 0, 0, CFSTR("Failed to locate an attrBuf"), v34, v97);
  v94 = objc_claimAutoreleasedReturnValue();

  v29 = (id)v94;
LABEL_123:
  a4 = v98;
LABEL_16:
  _DestroyTraversalState((uint64_t)&v121);
  if (a4)
  {
    v29 = objc_retainAutorelease(v29);
    v30 = 0;
    *a4 = v29;
  }
  else
  {
    v30 = 0;
  }
LABEL_19:

  return v30;
}

uint64_t _GetContinuationFD(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  uint64_t v4;
  id v5;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v4 == -1)
  {
    if (a3)
      v8 = 1048832;
    else
      v8 = 0x200000;
    v9 = a1 + 24;
    v10 = open((const char *)(a1 + 24), v8);
    if ((v10 & 0x80000000) == 0)
    {
      v4 = v10;
      v5 = 0;
      *(_DWORD *)(a2 + 24) = v4;
      goto LABEL_14;
    }
    v11 = __error();
    v12 = *v11;
    v13 = (void *)*MEMORY[0x1E0CB2FE0];
    if ((_DWORD)v12 == 2)
    {
      strerror(2);
      _CreateError((uint64_t)"_GetContinuationFD", 301, v13, 2, 0, 0, CFSTR("Failed to open %s : %s"), v14, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_13;
    }
    else
    {
      strerror(*v11);
      _CreateAndLogError((uint64_t)"_GetContinuationFD", 303, v13, v12, 0, 0, CFSTR("Failed to open %s : %s"), v15, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_13:
        v4 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
    }
    v5 = objc_retainAutorelease(v5);
    *a4 = v5;
    goto LABEL_13;
  }
  v5 = 0;
LABEL_14:

  return v4;
}

uint64_t _ParseAttributeBuf(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, _BYTE *a6)
{
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t result;
  int v27;
  int v28;

  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = *(_DWORD *)a2;
  v9 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a3 + 4) = *(_OWORD *)(a2 + 4);
  *(_DWORD *)(a3 + 20) = v9;
  v10 = *(_DWORD *)(a3 + 4);
  if ((v10 & 0x20000000) == 0)
  {
    v11 = (uint64_t *)(a2 + 24);
    if ((v10 & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    if ((v10 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a2 + 24);
  v11 = (uint64_t *)(a2 + 28);
  if ((v10 & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v12 = *v11;
  *(_QWORD *)(a3 + 28) = *v11;
  v13 = (char *)v11++ + (int)v12;
  if ((v10 & 8) != 0)
  {
LABEL_7:
    v14 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 36) = v14;
  }
LABEL_8:
  if ((v10 & 0x8000) != 0)
  {
    v16 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 40) = v16;
    if ((v10 & 0x10000) == 0)
    {
LABEL_10:
      if ((v10 & 0x20000) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((v10 & 0x10000) == 0)
  {
    goto LABEL_10;
  }
  v17 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 44) = v17;
  if ((v10 & 0x20000) == 0)
  {
LABEL_11:
    if ((v10 & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  v18 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 48) = v18;
  if ((v10 & 0x40000) == 0)
  {
LABEL_12:
    if ((v10 & 0x400000) == 0)
      goto LABEL_13;
LABEL_19:
    v20 = *v11;
    *(_QWORD *)(a3 + 56) = *v11;
    v15 = (char *)v11++ + (int)v20;
    if ((v10 & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_18:
  v19 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 52) = v19;
  if ((v10 & 0x400000) != 0)
    goto LABEL_19;
LABEL_13:
  v15 = 0;
  if ((v10 & 0x2000000) != 0)
  {
LABEL_20:
    v21 = *v11++;
    *(_QWORD *)(a3 + 64) = v21;
  }
LABEL_21:
  if ((v10 & 0x40000000) != 0)
  {
    v22 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 72) = v22;
  }
  if (*(_DWORD *)(a3 + 36) == 2)
  {
    v23 = *(_DWORD *)(a3 + 12);
    if ((v23 & 2) != 0)
    {
      v24 = *(_DWORD *)v11;
      v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v24;
      if (!v24)
        *a6 = 1;
    }
    if ((v23 & 4) != 0)
    {
      v25 = *(_DWORD *)v11;
      *(_DWORD *)(a3 + 84) = v25;
      if ((v25 & 3) != 0)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          result = MOLogWrite();
        *a6 = 1;
      }
    }
  }
  else
  {
    v27 = *(_DWORD *)(a3 + 16);
    if ((v27 & 1) != 0)
    {
      v28 = *(_DWORD *)v11;
      v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v28;
    }
    if ((v27 & 4) != 0)
      *(_QWORD *)(a3 + 88) = *v11;
  }
  if (a5)
    *a5 = v13;
  if (a4)
    *a4 = v15;
  return result;
}

uint64_t _CallClientBlock(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  unsigned int (**v18)(id, _QWORD, char *);
  int v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  void *v26;
  char v28;

  v18 = a10;
  v19 = *(_DWORD *)(a7 + 36);
  if ((a1 & 2) != 0 && v19 == 2)
  {
    v20 = 0;
  }
  else
  {
    v21 = a9;
    *(_QWORD *)a8 = *(_QWORD *)(a7 + 64);
    *(_QWORD *)(a8 + 8) = *(_QWORD *)(a7 + 88);
    *(_QWORD *)(a8 + 16) = a2;
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v22 = *(unsigned int *)(a7 + 52);
    *(_QWORD *)(a8 + 40) = a5;
    *(_QWORD *)(a8 + 48) = v22;
    *(_DWORD *)(a8 + 56) = v19;
    v23 = *(_DWORD *)(a7 + 72);
    *(_DWORD *)(a8 + 60) = *(_DWORD *)(a7 + 80);
    *(_DWORD *)(a8 + 64) = v23;
    *(_QWORD *)(a8 + 68) = *(_QWORD *)(a7 + 40);
    *(_DWORD *)(a8 + 76) = *(_DWORD *)(a7 + 80);
    v24 = *(_WORD *)(a7 + 48) & 0xFFF;
    *(_WORD *)(a8 + 80) = v24;
    v25 = v19 - 1;
    if (v25 <= 6)
      *(_WORD *)(a8 + 80) = word_1B7795808[v25] | v24;
    if (a9)
      v21 = *(_DWORD *)(a9 + 36) != -1;
    *(_BYTE *)(a8 + 82) = v21;
    *(_BYTE *)(a8 + 83) = a6;
    v26 = (void *)MEMORY[0x1BCCAA068]();
    v28 = 1;
    if (v18[2](v18, a8, &v28))
      v20 = 2 * (v28 == 0);
    else
      v20 = 1;
    objc_autoreleasePoolPop(v26);
  }

  return v20;
}

void sub_1B76FDF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

uint64_t MIUpdateSinfWithData(void *a1, void *a2, void *a3, unsigned int a4, unsigned int a5, _QWORD *a6)
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;

  v11 = a1;
  v15 = 0;
  _sinfURLsForBundle(a2, a3, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = _writeSinfData(v11, v12, a4, a5, a6);
  else
    v13 = 0;

  return v13;
}

id _sinfURLsForBundle(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  _QWORD *v38;
  id v39;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("SC_Info/Manifest.plist"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "MI_dictionaryWithContentsOfURL:options:error:", v7, 0, &v48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v48;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v16 = objc_msgSend(v10, "code");

      if (v16 == 260)
        goto LABEL_20;
    }
    else
    {

    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_20;
    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v17;
    v37 = v10;
LABEL_19:
    MOLogWrite();

LABEL_20:
    v13 = 0;
    v42 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SinfReplicationPaths"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_20;
    objc_msgSend(v7, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v17;
    goto LABEL_19;
  }
  v12 = (void *)v11;
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (v14)
  {
    objc_opt_class();
    if ((MIArrayContainsOnlyClass(v13) & 1) != 0)
    {
      v13 = v13;
      v42 = v13;
      goto LABEL_28;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_27;
  }
  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
  {
    goto LABEL_27;
  }
  objc_msgSend(v7, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  MOLogWrite();

LABEL_27:
  v42 = 0;
LABEL_28:

  _rootSinfURLForBundle(v5, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "realPathForURL:ifChildOfURL:", v18, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    _CreateAndLogError((uint64_t)"_sinfURLsForBundle", 76, CFSTR("MIInstallerErrorDomain"), 61, 0, &unk_1E6CD3640, CFSTR("Root sinf URL points outside of bundle"), v21, (uint64_t)v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;
    if (a3)
      goto LABEL_50;
    goto LABEL_52;
  }
  objc_msgSend(v43, "addObject:", v18);
  v22 = v42;
  if (!v42)
    goto LABEL_41;
  v40 = v18;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v42;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v23)
  {
LABEL_40:

    v22 = v42;
    v18 = v40;
LABEL_41:
    v20 = (void *)objc_msgSend(v43, "copy", v36);
    v34 = 0;
    if (a3)
      goto LABEL_50;
    goto LABEL_52;
  }
  v24 = v23;
  v25 = *(_QWORD *)v45;
  v38 = a3;
  v39 = v6;
LABEL_32:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v25)
      objc_enumerationMutation(obj);
    v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v26);
    if (objc_msgSend(v27, "containsDotDotPathComponents", v36, v37))
    {
      _CreateAndLogError((uint64_t)"_sinfURLsForBundle", 84, CFSTR("MIInstallerErrorDomain"), 61, 0, &unk_1E6CD3668, CFSTR("sinf subpath %@ contains illegal '..' segment"), v28, (uint64_t)v27);
LABEL_47:
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    if (objc_msgSend(v27, "hasPrefix:", CFSTR("/")))
    {
      _CreateAndLogError((uint64_t)"_sinfURLsForBundle", 89, CFSTR("MIInstallerErrorDomain"), 61, 0, &unk_1E6CD3690, CFSTR("sinf subpath %@ is absolute"), v29, (uint64_t)v27);
      goto LABEL_47;
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v27, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "realPathForURL:ifChildOfURL:", v30, v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      break;
    objc_msgSend(v43, "addObject:", v32);

    if (v24 == ++v26)
    {
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      a3 = v38;
      v6 = v39;
      if (v24)
        goto LABEL_32;
      goto LABEL_40;
    }
  }
  _CreateAndLogError((uint64_t)"_sinfURLsForBundle", 98, CFSTR("MIInstallerErrorDomain"), 61, 0, &unk_1E6CD36B8, CFSTR("sinf subpath %@ points outside of bundle"), v33, (uint64_t)v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
  v20 = 0;
  a3 = v38;
  v6 = v39;
  v22 = v42;
  v18 = v40;
  if (!v38)
    goto LABEL_52;
LABEL_50:
  if (!v20)
    *a3 = objc_retainAutorelease(v34);
LABEL_52:

  return v20;
}

uint64_t _writeSinfData(void *a1, void *a2, unsigned int a3, unsigned int a4, _QWORD *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v28;
  id v29;
  _QWORD *v30;
  id obj;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = a1;
  v7 = a2;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v28 = (void *)objc_msgSend(v34, "length");
    v29 = v7;
    MOLogWrite();
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v9)
  {
    v10 = v9;
    v30 = a5;
    v11 = 0;
    v12 = *(_QWORD *)v39;
    obj = v8;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        +[MIFileManager defaultManager](MIFileManager, "defaultManager", v28, v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByDeletingLastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v11;
        v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v16, 1, 493, &v37);
        v18 = v37;

        if ((v17 & 1) != 0)
        {
          v36 = v18;
          v19 = objc_msgSend(v34, "writeToURL:options:error:", v14, 1, &v36);
          v20 = v36;

          if ((v19 & 1) == 0)
          {
            objc_msgSend(v14, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"_writeSinfData", 130, CFSTR("MIInstallerErrorDomain"), 24, v20, &unk_1E6CD36E0, CFSTR("Failed to write sinf to %@ : %@"), v26, (uint64_t)v25);
            v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
            v8 = obj;

            if (v30)
            {
              v11 = objc_retainAutorelease(v11);
              v24 = 0;
              *v30 = v11;
            }
            else
            {
              v24 = 0;
            }
            goto LABEL_26;
          }
          +[MIFileManager defaultManager](MIFileManager, "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v20;
          v22 = objc_msgSend(v21, "setOwnerOfURL:toUID:gid:error:", v14, a3, a4, &v35);
          v11 = v35;

          if (!v22)
            goto LABEL_23;
        }
        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v14, "URLByDeletingLastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v18;
            MOLogWrite();

          }
          v11 = v18;
        }
      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v24 = 1;
LABEL_26:

  return v24;
}

uint64_t MIReplicateRootSinf(void *a1, void *a2, unsigned int a3, unsigned int a4, _QWORD *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;
  id v26;

  v9 = a2;
  v10 = a1;
  _rootSinfURLForBundle(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  _sinfURLsForBundle(v10, v9, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v26;
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v14)
  {
    objc_msgSend(v14, "removeObject:", v11);
    if (!objc_msgSend(v14, "count"))
    {
      v17 = 1;
      goto LABEL_20;
    }
    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 2, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;

    if (v15)
    {
      v24 = v16;
      v17 = _writeSinfData(v15, v14, a3, a4, &v24);
      v18 = v24;
    }
    else
    {
      objc_msgSend(v16, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        v20 = objc_msgSend(v16, "code");

        if (v20 == 260)
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
          {
            v17 = 1;
LABEL_17:

            v13 = v16;
            if (!a5)
              goto LABEL_20;
            goto LABEL_18;
          }
          objc_msgSend(v11, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
          v17 = 1;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

      }
      _CreateAndLogError((uint64_t)"MIReplicateRootSinf", 181, CFSTR("MIInstallerErrorDomain"), 24, v16, &unk_1E6CD3618, CFSTR("Failed to read sinf at %@ : %@"), v21, (uint64_t)v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }
    v22 = v16;
    v16 = v18;
    goto LABEL_16;
  }
  v17 = 0;
  if (!a5)
    goto LABEL_20;
LABEL_18:
  if ((v17 & 1) == 0)
  {
    v13 = objc_retainAutorelease(v13);
    v17 = 0;
    *a5 = v13;
  }
LABEL_20:

  return v17;
}

id _rootSinfURLForBundle(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("SC_Info"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.sinf"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void MIRemoveSinf(void *a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  _sinfURLsForBundle(a1, a2, &v20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v20;
  if (v2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          v9 = v3;
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[MIFileManager defaultManager](MIFileManager, "defaultManager", v13, v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v3;
          v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v15);
          v3 = v15;

          if ((v12 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
          {
            objc_msgSend(v10, "path");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v3;
            MOLogWrite();

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v6);
    }

  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

}

uint64_t MIGetSinfDataType(void *a1, _DWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  unsigned int v18;

  v5 = a1;
  v18 = -1;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "dataForExtendedAttributeNamed:length:fromURL:error:", CFSTR("com.apple.managed_drm_id"), 4, v5, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v7)
  {
    if (objc_msgSend(v7, "length") != 4)
    {
      objc_msgSend(v5, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "length");
      _CreateAndLogError((uint64_t)"MIGetSinfDataType", 229, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Got value for %s extended attribute on %@ with unexpected length %lu"), v14, (uint64_t)"com.apple.managed_drm_id");
      goto LABEL_12;
    }
    objc_msgSend(v7, "getBytes:length:", &v18, 4);
    v9 = v18;
    if (v18 >= 2)
    {
      objc_msgSend(v5, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"MIGetSinfDataType", 242, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Got unknown value %u for %s extended attribute on %@"), v11, v9);
LABEL_12:
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v15;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
LABEL_13:

LABEL_14:
      if (a3)
      {
        v8 = objc_retainAutorelease(v8);
        v13 = 0;
        *a3 = v8;
      }
      else
      {
        v13 = 0;
      }
      goto LABEL_17;
    }
    v12 = objc_msgSend(v8, "code");

    if (v12 != 93)
      goto LABEL_14;
    v18 = 0;

    v8 = 0;
    LODWORD(v9) = 0;
  }
  if (a2)
    *a2 = v9;
  v13 = 1;
LABEL_17:

  return v13;
}

uint64_t MISetSinfDataType(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  id v15;
  int v16;

  v5 = a1;
  v16 = a2;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2 < 2)
  {
    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v10 = objc_msgSend(v7, "setData:forExtendedAttributeNamed:onURL:error:", v11, CFSTR("com.apple.managed_drm_id"), v5, &v14);
      v9 = v14;

      if (!a3)
        goto LABEL_10;
    }
    else
    {
      v15 = 0;
      v10 = objc_msgSend(v6, "removeExtendedAttributeNamed:fromURL:error:", CFSTR("com.apple.managed_drm_id"), v5, &v15);
      v9 = v15;
      if (!a3)
        goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MISetSinfDataType", 267, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Got unknown value %u for Sinf data type to set on %@"), v8, a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!a3)
      goto LABEL_10;
  }
  if ((v10 & 1) == 0)
    *a3 = objc_retainAutorelease(v9);
LABEL_10:

  return v10;
}

id _GenerateBuiltInAppInstallSessionID(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  v3 = v2;
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v4, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _HashForString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _GenerateBuiltInAppInstallID(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = _GenerateBuiltInAppInstallID_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_GenerateBuiltInAppInstallID_onceToken, &__block_literal_global_0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v2, _GenerateBuiltInAppInstallID_osVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _HashForString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _IdentifierStorageLocationForBundle(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "isPlaceholder"))
    objc_msgSend(v1, "bundleURL");
  else
    objc_msgSend(v1, "executableURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _HashForString(void *a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = (const void *)objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "length");

  CC_SHA256(v2, v3, md);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _UUIDData()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  v1[1] = 0;
  MEMORY[0x1BCCAA59C](v1);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v1, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ICLSetLoggingHandle(uint64_t result)
{
  gLogHandle = result;
  return result;
}

unint64_t MIReserveMemoryForValidation(unint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;

  v3 = a2;
  if (a1)
  {
    if (sAvailableMemoryOnceToken != -1)
      dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
    if (sMaxAvailableMemoryForResourceValidation < a1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        MIReserveMemoryForValidation_cold_1((uint64_t)v3, a1, v4, v5, v6, v7, v8, v9);
      a1 = sMaxAvailableMemoryForResourceValidation;
    }
    pthread_mutex_lock(&sAvailableMemoryForResourceValidationMutex);
    for (i = sAvailableMemoryForResourceValidation;
          sAvailableMemoryForResourceValidation < a1;
          i = sAvailableMemoryForResourceValidation)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        MOLogWrite();
      pthread_cond_wait(&sAvailableMemoryForResourceValidationCondition, &sAvailableMemoryForResourceValidationMutex);
    }
    sAvailableMemoryForResourceValidation = i - a1;
    pthread_mutex_unlock(&sAvailableMemoryForResourceValidationMutex);
  }

  return a1;
}

unint64_t MIReturnMemoryUsedForValidation(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    if (sAvailableMemoryOnceToken != -1)
      dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
    v2 = v1;
    if (sMaxAvailableMemoryForResourceValidation < v1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        MIReturnMemoryUsedForValidation_cold_2();
      v2 = sMaxAvailableMemoryForResourceValidation;
    }
    pthread_mutex_lock(&sAvailableMemoryForResourceValidationMutex);
    v3 = sAvailableMemoryForResourceValidation + v2;
    if (v3 > sMaxAvailableMemoryForResourceValidation)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        MIReturnMemoryUsedForValidation_cold_1();
      v3 = sMaxAvailableMemoryForResourceValidation;
    }
    sAvailableMemoryForResourceValidation = v3;
    pthread_cond_broadcast(&sAvailableMemoryForResourceValidationCondition);
    return pthread_mutex_unlock(&sAvailableMemoryForResourceValidationMutex);
  }
  return result;
}

void *MIReduceAvailableMemoryForValidationForTesting()
{
  unint64_t v0;
  uint64_t v2;
  _OWORD v3[5];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (sAvailableMemoryOnceToken != -1)
    dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
  v0 = sMaxAvailableMemoryForResourceValidation - 10485760;
  if ((unint64_t)sMaxAvailableMemoryForResourceValidation <= 0xA00000)
    MIReduceAvailableMemoryForValidationForTesting_cold_1(&v2, v3);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  MIReserveMemoryForValidation(v0, CFSTR("Testing"));
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  sReservedMemoryForTesting = v0;
  sReservedMemoryForTestingAllocation = (uint64_t)malloc_type_malloc(v0, 0x8B67CEAFuLL);
  return memset((void *)sReservedMemoryForTestingAllocation, 120, v0);
}

uint64_t MIRestoreAvailableMemoryForValidationAfterTesting()
{
  unint64_t v0;
  uint64_t result;

  if (sAvailableMemoryOnceToken != -1)
    dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
  v0 = sReservedMemoryForTesting;
  sReservedMemoryForTesting = 0;
  MIReturnMemoryUsedForValidation(v0);
  free((void *)sReservedMemoryForTestingAllocation);
  sReservedMemoryForTestingAllocation = 0;
  result = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    return MOLogWrite();
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_1B7708B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B7709E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B770B154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B770F6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B770FADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7710094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7713F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_crash_msg();
}

id _ErrorDict()
{
  uint64_t path;
  __CFString *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  path = container_error_get_path();
  if (path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:", path);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("Failed to read container error path");
  }
  v4 = *MEMORY[0x1E0CB2AA0];
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *_RawContainerDescription()
{
  void *v0;
  __CFString *v1;

  v0 = (void *)container_copy_unlocalized_description();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("<No container description>");
  }
  free(v0);
  return v1;
}

void sub_1B7716784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B7716B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MIInstallProfileAtURL(void *a1)
{
  id v1;
  void *v2;
  const void *v3;
  uint64_t v4;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const void *)MISProfileCreateWithFile();

  if (v3)
  {
    v4 = _InstallProvisioningProfile();
    CFRelease(v3);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v1, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v4 = 0;
  }

  return v4;
}

uint64_t _InstallProvisioningProfile()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;

  v0 = MISInstallProvisioningProfile();
  v1 = v0;
  if ((_DWORD)v0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MIErrorStringForMISError(v0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return v1;
}

uint64_t MIInstallProfileWithData(void *a1)
{
  id v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = MISProfileCreateWithData();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = _InstallProvisioningProfile();
    CFRelease(v3);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v1, "length");
      MOLogWrite();
    }
    v4 = 0;
  }

  return v4;
}

void MIUninstallProfilesForAppIdentifier(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  v2 = v1;
  v3 = MISEnumerateMatchingProfilesUnauthoritative();
  if ((_DWORD)v3 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MIErrorStringForMISError(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
}

id MIErrorStringForMISError(uint64_t a1)
{
  unsigned int v1;
  void *v2;
  uint64_t v4;

  v1 = (a1 >> 14) & 0xFFF;
  if (a1 >> 26 == 58 && v1 == 2)
  {
    v2 = (void *)MISCopyErrorStringForErrorCode();
  }
  else
  {
    if (a1 >> 26 || v1 != 3)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown error: 0x%x"), a1, v4);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("POSIX error %d (%s)"), a1 & 0x3FFF, strerror(a1 & 0x3FFF));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id MIFetchSignatureVersionForExecutableURL(void *a1, _DWORD *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MISValidationCopySignatureVersion();

  if (v4 && a2)
    *a2 = v4;
  return 0;
}

uint64_t MIIsFatalMISProfileInstallationError(int a1, unsigned int a2)
{
  unsigned int v2;

  if (a1)
    v2 = a2;
  else
    v2 = 0;
  if (a1 == -402620383)
    return 1;
  else
    return v2;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, a8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("FunctionName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("SourceFileLine"));

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v15 = a5;
  _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v15, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "code");
      objc_msgSend(v15, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
    && objc_msgSend(v1, "code") == 12)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
      && objc_msgSend(v1, "code") == 11)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v1, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
        v3 = objc_msgSend(v1, "code") == 35;
      else
        v3 = 0;

    }
  }

  return v3;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;

  v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }
  else
  {
    v2 = CFSTR("(container_error_copy_unlocalized_description returned NULL)");
  }
  return v2;
}

id _MIValidateObject(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

BOOL MIIsValidInstallationDomain(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *MIStringForInstallationDomain(unint64_t a1)
{
  if (a1 < 5)
    return off_1E6CB7178[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown MIInstallationDomain: %lu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id MIDiskImageManagerProxy()
{
  void *v0;

  if (MIDiskImageManagerProxy_onceToken != -1)
    dispatch_once(&MIDiskImageManagerProxy_onceToken, &__block_literal_global_4);
  v0 = (void *)MIDiskImageManagerProxy_miDiskImageManager;
  if (MIDiskImageManagerProxy_miDiskImageManager)
  {
    objc_msgSend((id)MIDiskImageManagerProxy_miDiskImageManager, "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

id MobileInstallerDelegateProtocolInterface()
{
  void *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerDelegateProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF18F968);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallerDelegateProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  return WeakRetained;
}

id MobileInstallerProtocolInterface()
{
  void *WeakRetained;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF18FFB0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    ICLKnownBundleRecordClasses();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setByAddingObject:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_checkCapabilities_withOptions_completion_, 0, 0);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_uninstallIdentifiers_withOptions_completion_, 0, 1);

    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_, 1, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchInfoForFrameworkAtURL_options_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cancelUpdateForStagedUUID_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_finalizeStagedInstallForUUID_returningResultInfo_completion_, 1, 1);
    objc_storeWeak(&MobileInstallerProtocolInterface_weakInterface, WeakRetained);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  return WeakRetained;
}

void sub_1B7720AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B772623C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B7726DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7727078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id getUMUserManagerClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass_0;
  v7 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke_0;
    v3[3] = &unk_1E6CB6D70;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B7727388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7728A58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728AE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728B70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728C70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728EFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7728FC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7729248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B7729490(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!UserManagementLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E6CB74A8;
    v5 = 0;
    UserManagementLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!UserManagementLibraryCore_frameworkLibrary_0)
    __getUMUserManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUMUserManagerClass_block_invoke_cold_2();
  getUMUserManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ICLKnownBundleRecordClasses()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
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
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

id MIStringifyObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v1);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MIArrayContainsOnlyClass(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || objc_msgSend(v3, "isEqual:", v4));

  return v6;
}

id MICreateSHA256Digest(void *a1, _QWORD *a2)
{
  id v3;
  int *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  _QWORD *v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  void *v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char *v28;
  int64_t st_size;
  off_t v31;
  off_t v32;
  int64_t v33;
  ssize_t v34;
  ssize_t v35;
  int *v36;
  id v37;
  _QWORD v38[2];
  uint64_t (*v39)(uint64_t, const void *, CC_LONG);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  const char *v45;
  CC_SHA256_CTX v46;
  id v47;
  stat v48;
  stat v49;
  _OWORD md[2];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  memset(md, 0, sizeof(md));
  memset(&v48, 0, sizeof(v48));
  v3 = objc_retainAutorelease(a1);
  if (lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v48))
  {
    v4 = __error();
    v5 = *v4;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    strerror(v5);
    _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 121, CFSTR("MIInstallerErrorDomain"), 4, v6, 0, CFSTR("Failed to stat path %s : %s"), v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (v48.st_size <= 0xFFFFFFF)
  {
    v47 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v3, 3, &v47);
    v9 = v47;
    if (v11)
    {
      v12 = objc_retainAutorelease(v11);
      CC_SHA256((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (unsigned __int8 *)md);

LABEL_28:
      v23 = (char *)malloc_type_calloc(1uLL, 0x41uLL, 0x67229F93uLL);
      v24 = v23;
      v25 = 0;
      v26 = (unsigned __int8 *)md;
      do
      {
        v27 = *v26++;
        v28 = &v23[v25];
        *v28 = _HexToASCII_hex[(unint64_t)v27 >> 4];
        v25 += 2;
        v28[1] = _HexToASCII_hex[v27 & 0xF];
      }
      while (v25 != 64);
      v23[64] = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      free(v24);
      if (!a2)
        goto LABEL_33;
      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    goto LABEL_3;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x8810000000;
  v45 = "";
  memset(&v46, 0, sizeof(v46));
  CC_SHA256_Init(&v46);
  v13 = objc_retainAutorelease(v3);
  v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v39 = __MICreateSHA256Digest_block_invoke;
  v40 = &unk_1E6CB74F8;
  v41 = &v42;
  v15 = v38;
  memset(&v49, 0, sizeof(v49));
  v16 = open(v14, 256);
  v17 = v16;
  if (v16 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v21 = __error();
      strerror(*v21);
      MOLogWrite();
    }
    v20 = 0;
LABEL_21:
    v19 = 0;
  }
  else
  {
    if (fstat(v16, &v49))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
      goto LABEL_12;
    }
    if (v49.st_size >= 0x10000)
      st_size = 0x10000;
    else
      st_size = v49.st_size;
    v20 = malloc_type_malloc(st_size, 0xBF9B6362uLL);
    if (!v20)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
LABEL_12:
      v18 = __error();
      strerror(*v18);
      MOLogWrite();
LABEL_13:
      v19 = 0;
      v20 = 0;
LABEL_23:
      close(v17);
      goto LABEL_24;
    }
    v31 = v49.st_size;
    if (v49.st_size < 1)
    {
      v19 = 1;
      goto LABEL_23;
    }
    v37 = v13;
    v32 = 0;
    while (1)
    {
      v33 = v31 - v32;
      if (st_size >= v33)
        st_size = v33;
      v34 = read(v17, v20, st_size);
      v35 = v34;
      if (v34 == -1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v36 = __error();
          v13 = v37;
          strerror(*v36);
          MOLogWrite();
          goto LABEL_21;
        }
        goto LABEL_58;
      }
      if (v34 <= 0)
        break;
      v19 = v39((uint64_t)v15, v20, v34);
      if (v19)
      {
        v32 += v35;
        v31 = v49.st_size;
        if (v32 < v49.st_size)
          continue;
      }
      goto LABEL_59;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      v13 = v37;
      goto LABEL_21;
    }
LABEL_58:
    v19 = 0;
LABEL_59:
    v13 = v37;
  }
  if (v17 != -1)
    goto LABEL_23;
LABEL_24:
  if (v20)
    free(v20);

  CC_SHA256_Final((unsigned __int8 *)md, (CC_SHA256_CTX *)(v43 + 4));
  if (v19)
  {
    _Block_object_dispose(&v42, 8);
    v9 = 0;
    goto LABEL_28;
  }
  _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 148, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to read %@"), v22, (uint64_t)v13);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v42, 8);
LABEL_3:
  v10 = 0;
  if (!a2)
    goto LABEL_33;
LABEL_31:
  if (!v10)
    *a2 = objc_retainAutorelease(v9);
LABEL_33:

  return v10;
}

void sub_1B772AA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MIRunTransactionalTask(void *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = a1;
  v6 = (void *)os_transaction_create();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __MIRunTransactionalTask_block_invoke;
  v9[3] = &unk_1E6CB7520;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  dispatch_async(v5, v9);

}

void sub_1B772B080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B772B3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B772B788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B772BB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ProtectionClassForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AC0]) & 1) != 0)
    {
      v2 = 3;
      goto LABEL_15;
    }
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AE0]) & 1) != 0)
    {
      v2 = 4;
      goto LABEL_15;
    }
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AD0]) & 1) != 0)
    {
      v2 = 7;
      goto LABEL_15;
    }
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AE8]) & 1) != 0)
    {
LABEL_4:
      v2 = 2;
    }
    else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AC8]))
    {
      v2 = 3;
    }
    else
    {
      v2 = 0;
    }
  }
LABEL_15:

  return v2;
}

uint64_t _hasNoConflictWithSystemAppBundleIDs(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  id v14;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v13 = objc_msgSend(a1, "containsObject:", v9);
  if (v13)
  {
    _CreateAndLogError((uint64_t)"_hasNoConflictWithSystemAppBundleIDs", 1290, CFSTR("MIInstallerErrorDomain"), 81, 0, &unk_1E6CD4220, CFSTR("Identifier %@ is a %@, so we can't install %@ with that same identifier."), v12, (uint64_t)v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      *a5 = v14;
    }
  }
  else
  {
    v14 = 0;
  }

  return v13 ^ 1u;
}

uint64_t _checkIdentifierForConflict(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v23;

  v11 = a1;
  v12 = a4;
  v13 = a5;
  v23 = 0;
  +[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:](MIContainer, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v11, a2, a3, 0, 0, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;

  if (v14)
  {
    _CreateAndLogError((uint64_t)"_checkIdentifierForConflict", 1246, CFSTR("MIInstallerErrorDomain"), 81, 0, &unk_1E6CD4248, CFSTR("%@ with identifier %@ is already installed, so we can't install %@ with that same identifier."), v16, (uint64_t)v12);
  }
  else
  {
    objc_msgSend(v15, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
    {
      v18 = objc_msgSend(v15, "code");

      if (v18 == 21)
      {

        v20 = 0;
        v21 = 1;
        goto LABEL_11;
      }
    }
    else
    {

    }
    _CreateAndLogError((uint64_t)"_checkIdentifierForConflict", 1249, CFSTR("MIInstallerErrorDomain"), 4, v15, 0, CFSTR("Unable to check if %@ with bundle identifier %@ is already installed."), v19, (uint64_t)v12);
  }
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a6 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_11:

  return v21;
}

uint64_t _hasNoConflictWithNonContainerizedSystemApp(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  id v12;

  v5 = a1;
  v6 = a2;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "builtInApplicationBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "containsObject:", v5);
  if (v10)
  {
    _CreateAndLogError((uint64_t)"_hasNoConflictWithNonContainerizedSystemApp", 1272, CFSTR("MIInstallerErrorDomain"), 81, 0, &unk_1E6CD4270, CFSTR("%@ with identifier %@ is already installed, so we can't install %@ with that same identifier."), v9, (uint64_t)CFSTR("App"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
    {
      v12 = objc_retainAutorelease(v11);
      *a3 = v12;
    }
  }
  else
  {
    v12 = 0;
  }

  return v10 ^ 1u;
}

void sub_1B7731D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B7732DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t MIGetBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = objc_msgSend(v6, "BOOLValue");
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }
    else
    {
      a3 = 0;
    }

  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((MIGetBooleanEntitlement(v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10), a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

uint64_t MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.mobileinstall.upgrade-enabled"), 0);
}

uint64_t MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.container-required"), 1);
}

uint64_t MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.no-container"), 0);
}

uint64_t MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.no-sandbox"), 0);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("seatbelt-profiles"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("platform-application"), 0);
}

uint64_t MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.security.system-container"), 0);
}

uint64_t MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.mobileinstall.xpc-services-enabled"), 0);
}

uint64_t MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.system-application"), 0);
}

uint64_t MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.webkit.pushbundle"), 0);
}

uint64_t MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.marketplace.app-installation"), 0);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return _MICommonCopyGroupEntitlement(a1, CFSTR("com.apple.security.application-groups"));
}

id _MICommonCopyGroupEntitlement(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_7;
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_14:
      v6 = 0;
      goto LABEL_15;
    }
LABEL_13:
    MOLogWrite();
    goto LABEL_14;
  }
  if ((MIArrayContainsOnlyClass(v4) & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v6 = v4;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v8;
}

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  void *v1;
  _BOOL8 v2;

  _MICommonCopyGroupEntitlement(a1, CFSTR("com.apple.security.application-groups"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  _MICommonCopyGroupEntitlement(v1, CFSTR("com.apple.security.system-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || !objc_msgSend(v2, "count"))
  {
    _MICommonCopyGroupEntitlement(v1, CFSTR("com.apple.security.system-group-containers"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  void *v1;
  _BOOL8 v2;

  MICopySystemGroupEntitlement(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.on-demand-install-capable"), 0);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.parent-application-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("application-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("previous-application-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  MIArrayifyThing(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("beta-reports-active"), 0);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("keychain-access-groups"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.swift-playgrounds-app"), 0);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.app-management-domain"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("swift-playgrounds")) & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.WebKit.PushBundles")))
    {
      v3 = 3;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  MICopyAppManagementDomainEntitlement(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.networking.networkextension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.associated-appclip-app-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.driverkit"), 0);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (!v4)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("data-protection-class"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DataProtectionClass"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v8;
      else
        v4 = 0;

    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection-if-available"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    v4 = v2;
  }
  else
  {
    objc_opt_class();
    v5 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

uint64_t MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.host"), 0);
}

uint64_t MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.embedded-web-browser-engine"), 0);
}

uint64_t MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.rendering"), 0);
}

uint64_t MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.networking"), 0);
}

uint64_t MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.webcontent"), 0);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-accept"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-send"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser"), 0);
}

uint64_t MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.browser.app-installation"), 0);
}

id MICopyExtensionCacheEntryWithPlatform(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a1;
  if (sExtensionPointCatalogOnce != -1)
    dispatch_once_f(&sExtensionPointCatalogOnce, 0, (dispatch_function_t)_SetUpExtensionCacheOnce);
  objc_msgSend((id)sExtensionPointCatalog, "extensionPointForIdentifier:platform:", v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SDKDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9 = 0;
  }
  else
  {
    _CreateAndLogError((uint64_t)"MICopyExtensionCacheEntryWithPlatform", 46, CFSTR("MIInstallerErrorDomain"), 142, 0, 0, CFSTR("Extension cache does not have an entry for %@"), v8, (uint64_t)v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v9 = objc_retainAutorelease(v9);
      *a3 = v9;
    }
  }

  return v7;
}

void _SetUpExtensionCacheOnce()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getEXExtensionPointCatalogClass_softClass;
  v8 = getEXExtensionPointCatalogClass_softClass;
  if (!getEXExtensionPointCatalogClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getEXExtensionPointCatalogClass_block_invoke;
    v4[3] = &unk_1E6CB6D70;
    v4[4] = &v5;
    __getEXExtensionPointCatalogClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)sExtensionPointCatalog;
  sExtensionPointCatalog = (uint64_t)v2;

}

void sub_1B7734C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MICopyExtensionCacheEntry(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t active_platform;
  void *v5;

  v3 = a1;
  active_platform = dyld_get_active_platform();
  MICopyExtensionCacheEntryWithPlatform(v3, active_platform, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

Class __getEXExtensionPointCatalogClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ExtensionFoundationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6CB7678;
    v5 = 0;
    ExtensionFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ExtensionFoundationLibraryCore_frameworkLibrary)
    __getEXExtensionPointCatalogClass_block_invoke_cold_1(&v3);
  result = objc_getClass("EXExtensionPointCatalog");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getEXExtensionPointCatalogClass_block_invoke_cold_2();
  getEXExtensionPointCatalogClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL MIHasStringValueOfNonZeroLength(void *a1, uint64_t a2, _BOOL8 a3)
{
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    a3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length");
  }

  return a3;
}

BOOL MIHasStringValueOfNonZeroLengthIfDefined(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 1);
}

BOOL MIHasStringValueOfNonZeroLengthIfDefinedCF(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 1);
}

BOOL MIHasRequiredStringValueOfNonZeroLength(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 0);
}

BOOL MIHasRequiredStringValueOfNonZeroLengthCF(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 0);
}

uint64_t MIIsValidRDNSString(void *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "count") >= 2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "length", (_QWORD)v9))
          {
            v2 = 0;
            goto LABEL_13;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
    v2 = 1;
LABEL_13:

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t MIIsCompatibleWithDeviceFamily(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MIIsCompatibleWithAtLeastOneDeviceFamily(v4, v6, 0);

  return v7;
}

uint64_t MIIsCompatibleWithAtLeastOneDeviceFamily(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    a3 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (a3)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = objc_msgSend(v10, "intValue", (_QWORD)v15);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v6, "containsObject:", v12);

            if ((v13 & 1) != 0)
            {
              a3 = 1;
              goto LABEL_13;
            }
          }
          ++v9;
        }
        while (a3 != v9);
        a3 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (a3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return a3;
}

uint64_t MIIsApplicableToCurrentDeviceFamilyWithError(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v3 = a1;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "skipDeviceFamilyCheck");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
    v7 = 0;
    v8 = 1;
    goto LABEL_16;
  }
  v9 = (void *)MGCopyAnswer();
  objc_opt_class();
  v10 = v9;
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;

  if (v6)
  {
    objc_opt_class();
    if ((MIArrayContainsOnlyClass(v6) & 1) == 0)
    {
      _CreateAndLogError((uint64_t)"MIIsApplicableToCurrentDeviceFamilyWithError", 81, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Array of supported device families returned from MobileGestalt was not an array of numbers; got: %@"),
        v12,
        (uint64_t)v6);
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
    v14 = MIIsCompatibleWithAtLeastOneDeviceFamily(v3, v13, 1);

    if ((v14 & 1) != 0)
    {
      v7 = 0;
      goto LABEL_16;
    }
    v20 = (uint64_t)v3;
    v15 = &unk_1E6CD4400;
    v16 = CFSTR("This app was not built to support this device family; app is compatible with %@ but this device supports %@");
    v17 = 86;
  }
  else
  {
    v15 = &unk_1E6CD43D8;
    v16 = CFSTR("Couldn't fetch list of supported device families.");
    v17 = 76;
  }
  _CreateAndLogError((uint64_t)"MIIsApplicableToCurrentDeviceFamilyWithError", v17, CFSTR("MIInstallerErrorDomain"), 10, 0, v15, v16, v11, v20);
LABEL_13:
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (a2)
  {
    v7 = objc_retainAutorelease(v18);
    v8 = 0;
    *a2 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_16:

  return v8;
}

void sub_1B7739838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

uint64_t _ItemIsIgnoredContainerContentForStash(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR(".")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileinstallation.placeholder")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileinstallation.stash"));
  }

  return v2;
}

void sub_1B773A158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst;

  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    dst = 2;
  }
  else if (dst != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    strerror(dst);
    MOLogWrite();
  }
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

uint64_t _CopyfileStatusCallback(uint64_t a1, int a2, uint64_t a3, const char *a4, uint64_t a5, void *a6)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  stat v23;

  if (a2 == 3)
  {
    v8 = a6;
    v9 = *__error();
    if (objc_msgSend(v8, "ignoreErrors"))
    {
      if ((_DWORD)a1)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_17;
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_17;
      }
      strerror(v9);
LABEL_16:
      MOLogWrite();
LABEL_17:
      v10 = 1;
LABEL_28:

      return v10;
    }
    if ((_DWORD)v9 == 45)
    {
      memset(&v23, 0, sizeof(v23));
      if (lstat(a4, &v23))
      {
        v12 = *__error();
        _CreateError((uint64_t)"_CopyfileStatusCallback", 237, (void *)*MEMORY[0x1E0CB2FE0], v12, 0, 0, CFSTR("lstat returned an error when trying to determine type for %s"), v13, (uint64_t)a4);
LABEL_27:
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setError:", v20);

        v10 = 2;
        goto LABEL_28;
      }
      v17 = v23.st_mode & 0xF000;
      if (v17 >= 0x6000)
      {
        if (v17 == 24576)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (v17 == 49152)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      else
      {
        if (v17 == 4096)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (v17 == 0x2000)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      v18 = (void *)*MEMORY[0x1E0CB2FE0];
      if ((_DWORD)a1)
      {
        v22 = a1;
        v15 = CFSTR("copyfile hit ENOTSUP at %d while copying %s to %s; src mode: 0%o");
        v16 = 258;
      }
      else
      {
        v22 = (uint64_t)a4;
        v15 = CFSTR("copyfile hit ENOTSUP in source hierarchy while copying %s to %s; src mode: 0%o");
        v16 = 256;
      }
      v19 = 45;
    }
    else
    {
      v14 = (void *)*MEMORY[0x1E0CB2FE0];
      strerror(v9);
      if ((_DWORD)a1)
      {
        v22 = a1;
        v15 = CFSTR("copyfile failed at %d while copying %s to %s: %s (%d)");
        v16 = 267;
      }
      else
      {
        v22 = (uint64_t)a4;
        v15 = CFSTR("copyfile failed in source hierarchy while copying %s to %s: %s (%d)");
        v16 = 265;
      }
      v18 = v14;
      v19 = v9;
    }
    _CreateError((uint64_t)"_CopyfileStatusCallback", v16, v18, v19, 0, 0, v15, v11, v22);
    goto LABEL_27;
  }
  return 0;
}

void sub_1B773C114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1B773CAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1B773D57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B773D7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B773DDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _dataForEAKey(char *name, int fd, _QWORD *a3)
{
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  ssize_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;

  v6 = fgetxattr(fd, name, 0, 0, 0, 32);
  if ((v6 & 0x8000000000000000) != 0)
  {
    v11 = *__error();
    v12 = (void *)*MEMORY[0x1E0CB2FE0];
    v13 = v11;
    strerror(v11);
    _CreateError((uint64_t)"_dataForEAKey", 1549, v12, v13, 0, 0, CFSTR("Could not get data length for extended attribute key %s: %s"), v14, (uint64_t)name);
LABEL_8:
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_9;
  }
  v8 = v6;
  if (!v6)
  {
    v30 = name;
    v9 = CFSTR("Data for extended attribute key %s was empty");
    v10 = 1552;
    goto LABEL_7;
  }
  if (v6 > 0x1000)
  {
    v30 = name;
    v9 = CFSTR("Data length is more than 4 KB for extended attribute key %s: length is %zd bytes");
    v10 = 1555;
LABEL_7:
    _CreateError((uint64_t)"_dataForEAKey", v10, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, v9, v7, (uint64_t)v30);
    goto LABEL_8;
  }
  v19 = malloc_type_malloc(v6, 0x1F5EDC03uLL);
  if (!v19)
  {
    v22 = *__error();
    v23 = (void *)*MEMORY[0x1E0CB2FE0];
    v24 = v22;
    strerror(v22);
    _CreateError((uint64_t)"_dataForEAKey", 1561, v23, v24, 0, 0, CFSTR("Failed to malloc %zd bytes for extended attribute key %s: %s"), v25, v8);
    goto LABEL_8;
  }
  v16 = v19;
  v20 = fgetxattr(fd, name, v19, v8, 0, 32);
  if (v20 < 0)
  {
    v26 = *__error();
    v27 = (void *)*MEMORY[0x1E0CB2FE0];
    v28 = v26;
    strerror(v26);
    _CreateError((uint64_t)"_dataForEAKey", 1567, v27, v28, 0, 0, CFSTR("Failed to malloc %zd bytes for extended attribute key %s: %s"), v29, v8);
  }
  else
  {
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v16, v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      if (v17)
        goto LABEL_12;
      goto LABEL_9;
    }
    _CreateError((uint64_t)"_dataForEAKey", 1570, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Data for key %s returned length 0, expected length %zd"), v21, (uint64_t)name);
  }
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  free(v16);
  if (a3)
  {
    v15 = objc_retainAutorelease(v15);
    v17 = 0;
    *a3 = v15;
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25[128];
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  bzero(v26, 0x400uLL);
  v20 = objc_retainAutorelease(v3);
  realpath_DARWIN_EXTSN((const char *)objc_msgSend(v20, "fileSystemRepresentation"), v26);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:", v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      v12 = v4;
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v10 + i < (unint64_t)objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
            continue;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          v17 = 0;
          v4 = v12;
        }
        else
        {
          objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
          v4 = v12;
          objc_msgSend(v12, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          v17 = 0;
        }
        goto LABEL_16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 += i;
      v17 = 1;
      v4 = v12;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_16:

  return v17;
}

void sub_1B7742018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AllPersonasAssociatedWithIdentifier(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  Class Class;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  v3 = a1;
  +[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "personaForBundleID:error:", v3, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (!v5)
  {
    v11 = 0;
    goto LABEL_7;
  }
  if (!+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled"))
  {
    v11 = (void *)objc_opt_new();
    goto LABEL_11;
  }
  Class = objc_getClass("MIAppReferenceManager");
  if (!Class)
  {
    v11 = 0;
LABEL_11:
    objc_msgSend(v11, "addObject:", v5);
    if (!a2)
      goto LABEL_14;
    goto LABEL_12;
  }
  -[objc_class defaultManager](Class, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(v8, "personaUniqueStringsForAppWithBundleID:error:", v3, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  v6 = v10;
  if (v11)
    goto LABEL_11;
LABEL_7:
  if (!a2)
    goto LABEL_14;
LABEL_12:
  if (!v11)
    *a2 = objc_retainAutorelease(v6);
LABEL_14:
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

uint64_t MIMachOFileMatchesMyArchitecture(const char *a1, _QWORD *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  char v13;
  int v14;
  char v15;

  v15 = 0;
  v14 = 0;
  if (parse_macho_is_file_runnable_for_apps(a1, &v15, &v14) && v15)
  {
    v5 = 0;
    v6 = 1;
    goto LABEL_19;
  }
  if (v14)
  {
    _CreateAndLogError((uint64_t)"MIMachOFileMatchesMyArchitecture", 58, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to determine if file matches arch for input file: %s because libparsemacho returned error code: %u"), v4, (uint64_t)a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!a2)
      goto LABEL_19;
    goto LABEL_17;
  }
  v13 = 0;
  +[MITestManager sharedInstance](MITestManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "isRunningInTestMode:outError:", &v13, &v12);
  v5 = v12;
  if (v8)
  {
    if (v13 && objc_msgSend(v7, "testFlagsAreSet:", 128))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v6 = 1;
    }
    else
    {
      _CreateAndLogError((uint64_t)"MIMachOFileMatchesMyArchitecture", 56, CFSTR("MIInstallerErrorDomain"), 15, 0, &unk_1E6CD4720, CFSTR("Failed to find matching arch for input file: %s"), v9, (uint64_t)a1);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = (id)v10;
    }
  }
  else
  {
    v6 = 0;
  }

  if (a2)
  {
LABEL_17:
    if ((v6 & 1) == 0)
    {
      v5 = objc_retainAutorelease(v5);
      v6 = 0;
      *a2 = v5;
    }
  }
LABEL_19:

  return v6;
}

__CFString *MIMachOStringForPlatform(uint64_t a1)
{
  if ((a1 - 1) < 0xC)
    return off_1E6CB7930[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown platform: %u"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t MIMachOFileIterateImageVersions(const char *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  int *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __MIMachOFileIterateImageVersions_block_invoke;
  v15[3] = &unk_1E6CB78E8;
  v16 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x1BCCAA218](v15);
  *__error() = 0;
  v8 = parse_macho_iterate_slices(a1, (uint64_t)v7);
  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = __error();
    _CreateError((uint64_t)"MIMachOFileIterateImageVersions", 124, (void *)*MEMORY[0x1E0CB2FE0], *v10, 0, 0, CFSTR("parse_macho_iterate_slices failed for %s"), v11, (uint64_t)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MIMachOFileIterateImageVersions", 124, CFSTR("MIInstallerErrorDomain"), 73, v12, 0, CFSTR("Failed to iterate on macho slices for input file: %s"), v13, (uint64_t)a1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a2)
    {
      v9 = objc_retainAutorelease(v9);
      *a2 = v9;
    }
  }

  return v8;
}

void sub_1B774880C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id MIMachOFileImageSlices(const char *a1, _QWORD *a2)
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MIMachOFileImageSlices_block_invoke;
  v12[3] = &unk_1E6CB7910;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x1BCCAA218](v12);
  v11 = 0;
  v7 = MIMachOFileIterateImageVersions(a1, &v11, v6);
  v8 = v11;
  v9 = 0;
  if (v7)
    v9 = (void *)objc_msgSend(v5, "copy");
  if (a2 && !v9)
    *a2 = objc_retainAutorelease(v8);

  return v9;
}

uint64_t MIMachOSimPlatformForPlatform(uint64_t a1)
{
  int v2;
  void *v4;

  v2 = a1 - 2;
  if ((a1 - 2) < 0xB && ((0x6E7u >> v2) & 1) != 0)
    return dword_1B7795944[v2];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    MIMachOSimPlatformForPlatform_cold_1(a1);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MIMachOStringForPlatform(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return 0;
}

uint64_t MIMachOActiveIOSPlatform()
{
  return 2;
}

BOOL MIDistributorTypeIsFirstPartyApple(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL MIDistributorTypeIsThirdParty(uint64_t a1)
{
  return a1 == -1;
}

BOOL _IsDictionaryWithKeyStringAndValueArrayOfString(void *a1)
{
  id v1;
  id v2;
  id v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___IsDictionaryWithKeyStringAndValueArrayOfString_block_invoke;
    v6[3] = &unk_1E6CB7998;
    v6[4] = &v7;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v4 = 0;
    *((_BYTE *)v8 + 24) = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_1B7749824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_1B774DCF4(_QWORD *result)
{
  *result = ++qword_1EF181A78;
  return result;
}

uint64_t sub_1B774DD10(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, _QWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v17;
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  mach_msg_header_t msg;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v30 = 1;
  v31 = a4;
  v32 = 16777472;
  v33 = a5;
  v34 = *MEMORY[0x1E0C804E8];
  v17 = *a3;
  v35 = a2;
  v36 = v17;
  v37 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            v21 = v33;
            if (v33 == v47)
            {
              v20 = 0;
              v22 = v34;
              *a3 = v38;
              v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v31);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_1B774DF68(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_msg_header_t msg;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3[5];
  v19 = a3[4];
  v20 = v4;
  v5 = a3[7];
  v21 = a3[6];
  v22 = v5;
  v6 = a3[1];
  v15 = *a3;
  v16 = v6;
  v7 = a3[3];
  v17 = a3[2];
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a2;
  v18 = v7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    v10 = 4294966995;
    goto LABEL_17;
  }
  v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v10 = v14;
  if (v14)
    goto LABEL_17;
  return v10;
}

uint64_t sub_1B774E0F4(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE v23[28];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 1;
  v19 = a6;
  v20 = 16777472;
  v21 = a7;
  v22 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  v24 = a7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_1B774E2E0(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  int v16;
  mach_msg_header_t msg;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            v12 = v18;
            if (!v18)
            {
              v15 = v20;
              *a2 = v19;
              *a3 = v15;
              v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = v18 == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = v18;
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

void sub_1B774E458(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05) + 927733813;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05) + 927733813;
  v4 = (v2 < -658532018) ^ (v3 < -658532018);
  v5 = v2 > v3;
  if (v4)
    v5 = v2 < -658532018;
  v1 = *(_DWORD *)a1 ^ (1374699841 * ((((2 * a1) | 0x4FD35BAC) - a1 + 1477857834) ^ 0xCA1DB5DF));
  __asm { BR              X15 }
}

uint64_t sub_1B774E530()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v1 - 467715196;
  v5 = v4 < (v2 ^ 0x5F4) - 2053981206;
  v6 = v3 - 467715196 < v4;
  if (v5 != v3 - 467715196 < (int)((193 * (v2 ^ 0x540)) ^ 0x8592B9DA))
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((962 * !v6) ^ v2 ^ 0x5F4)) - 12))();
}

uint64_t sub_1B774E5B8(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  if (v3 + 1586265656 + v2 - 775 >= 0)
    v3 = 1122435634 - v3;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * (((v3 - 561217818 <= (int)((((v2 - 775) ^ 0x6E) + 1158) ^ 0xFFFFFAB8))
                                                        * ((7 * ((v2 - 775) ^ 0x6E)) ^ 0x55B)) ^ (v2 - 775)))
                                          - 12))(a1);
}

uint64_t sub_1B774E668(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  unsigned int v9;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((*(_DWORD *)(*v7 + 4 * v9) ^ v5) <= (*(_DWORD *)(*v6 + 4 * v9) ^ v5))
                                * ((v8 - 406) ^ a4)) ^ v8)))();
}

uint64_t sub_1B774E6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7, int a8)
{
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((7 * (((v9 < v10) ^ ((a8 ^ a5) * a6)) & 1)) ^ a8))
                            - 8))();
}

void sub_1B774E6D8()
{
  JUMPOUT(0x1B774E62CLL);
}

uint64_t sub_1B774E6E0(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;

  *(_DWORD *)(result + 4) = (((a8 ^ a3) + 281142468) & 0xEF3E1FCF) - v8 - 1272783585;
  return result;
}

void sub_1B774E71C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 628203409 * ((-2 - ((~(_DWORD)a1 | 0x96C77CC6) + (a1 | 0x69388339))) ^ 0x144F70F5);
  __asm { BR              X9 }
}

void sub_1B774E800()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 4) = -1973446408;
}

uint64_t sub_1B774F090(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0
                                                  + (int)((*(_DWORD *)a1 - 1225351577 * (a1 ^ 0x7EFF9A32)) ^ 0x4CB))
                                        + 8
                                        * (int)(((4 * (*(_QWORD *)(a1 + 8) != 0x1E6EF7153090DC2)) | ((*(_QWORD *)(a1 + 8) != 0x1E6EF7153090DC2) << 8)) ^ (*(_DWORD *)a1 - 1225351577 * (a1 ^ 0x7EFF9A32)))
                                        - 4)
                            - 12))();
}

uint64_t sub_1B774F104()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8
                                             * ((461 * (*(_DWORD *)(v2 - 0x1E6EF7153090DAALL) == 1973469985)) ^ v0))
                            - 12))();
}

uint64_t sub_1B774F144()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v2 - 0x1E6EF7153090DB2) + 1212779490;
  v4 = *(_DWORD *)(v2 - 0x1E6EF7153090DB6) - 1846618221;
  v5 = v4 < 0xB41041E0;
  v6 = v3 < v4;
  if (v3 < 0xB41041E0 != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((54 * v6) ^ v0)) - 12))();
}

uint64_t sub_1B774F1D0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  _DWORD *v2;

  *v2 = a2;
  *(_DWORD *)(result + 4) = -1973446636;
  return result;
}

void sub_1B774F1E4(uint64_t a1)
{
  int v1;
  int v2;

  v1 = 535753261 * (((a1 | 0x8E29127E) - a1 + (a1 & 0x71D6ED81)) ^ 0x84DD1C51);
  v2 = *(_DWORD *)(a1 + 12) - v1;
  __asm { BR              X15 }
}

uint64_t sub_1B774F2AC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v6 = (((~v8 & 0x74D3750E) - (~v8 | 0x74D3750F)) ^ 0x7E277B20) * v3;
  v9 = v2;
  v8[0] = v4 - v6 - 142;
  v8[1] = v6 - a1 - ((((v4 - 141) | 0x29D) ^ 0xD975265D) & (-1952451112 - v5)) - 1299543235;
  return ((uint64_t (*)(_DWORD *))(*(_QWORD *)(v1 + 8 * (v4 - 1131)) - 12))(v8);
}

uint64_t sub_1B774F400(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (108757529 * (((a1 | 0x6BA2B686) - (a1 & 0x6BA2B686)) ^ 0x8B3ED4AD));
  return (*(uint64_t (**)(void))((char *)*(&off_1E6CBBAA0 + v1 - 383)
                              + 8 * ((222 * (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8))) ^ v1)
                              - 4))();
}

uint64_t sub_1B774F470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v4 = *(_DWORD *)(v2 - 0x709331AC20D1CC05);
  v5 = v4 - 561217817;
  if (v4 - 561217817 < 0)
    v5 = 561217817 - v4;
  *(_DWORD *)(v1 - 0x709331AC20D1CC05) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((1828
                                * ((v5 ^ 0x7BAFFFBD) - 850185368 + ((2 * v5) & 0xF75FFF7A) != ((v3 + 594) ^ 0x49033780))) ^ v3)))();
}

uint64_t sub_1B774F4FC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(v2 - 0x709331AC20D1CC01) + 4 * (v5 - 1224946470)) = *(_DWORD *)(*(_QWORD *)(v3 - 0x709331AC20D1CC01)
                                                                                            + 4 * (v5 - 1224946470));
  return (*(uint64_t (**)(void))(a1 + 8 * ((1782 * (v5 - 1 != v1)) ^ (v4 - 594))))();
}

uint64_t sub_1B774F558@<X0>(uint64_t a1@<X8>)
{
  int v1;
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_DWORD *)(*v2 + 4 * (v6 + v5)) = *(_DWORD *)(*v3 + 4 * (v6 + v5));
  return (*(uint64_t (**)(void))(a1 + 8 * (((v6 - 1 != v1) * v7) ^ v4)))();
}

uint64_t sub_1B774F590(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05);
  v4 = v2 - 561217817;
  v3 = v2 - 561217817 < 0;
  v5 = 561217817 - v2;
  if (!v3)
    v5 = v4;
  v1 = *(_DWORD *)(a1 + 4) - 460628867 * ((a1 & 0x873FB66C | ~(a1 | 0x873FB66C)) ^ 0x3456CBEE) - 388;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + v1 - 63)
                                        + 8
                                        * ((1904
                                          * ((v5 ^ 0x7F3DEF7F) - 554237965 + ((v1 ^ 0xFE7BDFED) & (2 * v5)) - 1580527475 < 0x7FFFFFFF)) ^ v1)
                                        - 4)
                            - ((v1 - 253) | 0x281u)
                            + 659))();
}

uint64_t sub_1B774F6A0(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((*(_DWORD *)(*v7 + 4 * a4) == (v5 ^ (v4 + 243))) * (((v5 - 239) | a3) - 1564)) ^ (v5 + 379))))();
}

void sub_1B774F6DC()
{
  JUMPOUT(0x1B774F668);
}

_DWORD *sub_1B774F6E4(_DWORD *result)
{
  *result = 916476699;
  return result;
}

uint64_t sub_1B774F6F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  uint64_t v5;
  int v6;

  return (*(uint64_t (**)(void))(v5 + 8 * (int)((169 * ((a4 ^ v4) >> 31)) ^ v6)))();
}

uint64_t sub_1B774F728()
{
  unsigned int v0;
  uint64_t v1;
  char v2;
  int v3;
  int v4;

  return (*(uint64_t (**)(void))(v1 + 8 * (int)((((v0 >> v2) & 1) * v3) ^ v4)))();
}

_DWORD *sub_1B774F748@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;

  *result = v3 + 32 * a2 + ((v2 - 786569492) & 0x2EE21A97 ^ 0x7002662B);
  return result;
}

void sub_1B774F77C(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  _DWORD v5[4];
  unint64_t *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  v3 = 628203409 * (((v5 | 0x75E43ED) + (~v5 | 0xF8A1BC12)) ^ 0x85D64FDF);
  v6 = &STACK[0xD547898781B13E4];
  v5[0] = v3 + 1172345435;
  v5[2] = v3 + 2122148333;
  sub_1B7776B68((uint64_t)v5);
  __asm { BR              X8 }
}

uint64_t sub_1B774F924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  _BOOL4 v17;

  v16 = a13 + 606622207;
  if ((a13 + 606622207) < 0x679AB2C2 != v13 + 907624519 < ((v14 - 909) ^ 0x679AB2F2u))
    v17 = v16 < 0x679AB2C2;
  else
    v17 = v13 + 907624519 < v16;
  return (*(uint64_t (**)(void))(v15 + 8 * ((101 * v17) ^ v14)))();
}

uint64_t sub_1B774F98C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v20;

  v20 = (a4 + 248) | 6;
  v15 = a8 + a4 - 48;
  v16 = 3804331 * ((((v14 - 120) | 0xCE8FB339) - ((v14 - 120) & 0xCE8FB339)) ^ 0x3411406F);
  *(_DWORD *)(v14 - 120) = v16 + a4 + 518;
  *(_DWORD *)(v14 - 116) = (a13 + 254127919) ^ v16;
  *(_QWORD *)(v14 - 112) = a10;
  v17 = sub_1B776B710(v14 - 120);
  v18 = *(_DWORD *)(v14 - 152) & (v15 - 1716486604);
  *(_BYTE *)(v14 - 220 + (v18 ^ 0x13)) = -29;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13
                                                      + 8 * ((((v18 ^ 0x13) > 0x37) * (v20 + 741)) ^ a4))
                                          - 12))(v17);
}

uint64_t sub_1B774FA84()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((2024 * (((v0 == 63) ^ (v1 - 3)) & 1)) ^ v1))
                            - (v1 + 218)
                            + 512))();
}

uint64_t sub_1B774FAD4@<X0>(int a1@<W7>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((28
                                          * ((a2 ^ 0x133 ^ (7
                                                          * (((v2 + 101449208) | 0x6043820B) ^ (a1 + 23)))) < 8)) ^ v2))
                            - 8))();
}

uint64_t sub_1B774FB2C()
{
  char v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 220 + v2 - 149885707) = 0x6363636363636363;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v0 & 0x38) == 8) * (((v1 + 13) | 2) ^ 0x52C)) ^ v1)))();
}

uint64_t sub_1B774FB7C(double a1)
{
  double *v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 == 0) * v3) ^ v2)))();
}

uint64_t sub_1B774FB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8 * ((826 * (((v9 == v8) ^ (v10 ^ (a8 + 26))) & 1)) ^ v10))
                            - (((v10 + 71827675) | 0x62078002u) ^ 0x664F8203)))();
}

uint64_t sub_1B774FBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t (*a19)(__n128, __n128, __n128, __n128, __n128), uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int32x4_t a27,int32x4_t a28,int32x4_t a29,int32x4_t a30)
{
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  __n128 v39;
  const char *v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint8x16_t v51;
  uint16x8_t v52;
  int8x16_t v53;
  int8x16_t v54;
  uint16x8_t v55;
  int8x16_t v56;
  int8x16_t v57;
  uint8x16_t v58;
  uint16x8_t v59;
  uint16x8_t v60;
  uint8x16_t v61;
  int8x16_t v64;
  int8x16_t v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  uint8x16_t v75;
  uint16x8_t v76;
  uint16x8_t v77;
  uint8x16_t v78;
  uint8x16_t v83;
  uint16x8_t v84;
  uint16x8_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int32x4_t v89;
  uint64_t v90;
  _DWORD *v91;
  int v92;
  uint64_t v93;
  int v94;
  int v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  int8x16x4_t v100;
  int8x16x4_t v101;

  v39 = (__n128)vdupq_n_s32(0x75A0C33Bu);
  v40 = (const char *)(v38 - 220);
  v41 = (__n128)vdupq_n_s32(0x75A0C321u);
  v42.n128_u64[0] = 0x6363636363636363;
  v42.n128_u64[1] = 0x6363636363636363;
  v43.n128_u64[0] = 0xC6C6C6C6C6C6C6C6;
  v43.n128_u64[1] = 0xC6C6C6C6C6C6C6C6;
  v44 = (__n128)vdupq_n_s32(0x75A0C337u);
  v46 = *(_DWORD *)(v38 - 148);
  v45 = *(_DWORD *)(v38 - 144);
  v47 = *(unsigned int *)(v38 - 140);
  v48 = *(unsigned int *)(v38 - 136);
  v49 = *(unsigned __int8 *)(v38 - 124) ^ 0x5C;
  v50 = *(_BYTE *)(v38 - 124) ^ 0x5C;
  a19 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v32 + 8 * (v33 + v30 - 226))
                                                                       - 12);
  LODWORD(v98) = v49;
  v99 = __PAIR64__(v45, v46);
  if (v50 == 2)
  {
    v101 = vld4q_s8(v40);
    HIDWORD(a15) = *(_DWORD *)(v38 - 132);
    v75 = (uint8x16_t)veorq_s8(v101.val[0], (int8x16_t)v42);
    v76 = vmovl_u8(*(uint8x8_t *)v75.i8);
    v77 = vmovl_high_u8(v75);
    v78 = (uint8x16_t)veorq_s8(v101.val[1], (int8x16_t)v42);
    _Q22 = vmovl_u8(*(uint8x8_t *)v78.i8);
    _Q21 = vmovl_high_u8(v78);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v83 = (uint8x16_t)veorq_s8(v101.val[2], (int8x16_t)v42);
    v84 = vmovl_high_u8(v83);
    v85 = vmovl_u8(*(uint8x8_t *)v83.i8);
    v101.val[0] = veorq_s8(v101.val[3], (int8x16_t)v42);
    v101.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v101.val[0]);
    v101.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v101.val[1]);
    v101.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v101.val[1].i8);
    v101.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v101.val[0].i8);
    v101.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v101.val[0]);
    v101.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v101.val[0].i8);
    v86 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v85.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v76.i8), 0x18uLL)), v101.val[0]);
    v87 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v85, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v76), 0x18uLL)), v101.val[3]);
    v88 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v84.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v77.i8), 0x18uLL)), v101.val[1]);
    v89 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v84, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v77), 0x18uLL)), v101.val[2]);
    v101.val[0] = veorq_s8(vandq_s8((int8x16_t)v86, (int8x16_t)v39), (int8x16_t)(*(_OWORD *)v101.val & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v101.val[3] = veorq_s8(vandq_s8((int8x16_t)v87, (int8x16_t)v39), (int8x16_t)(*(_OWORD *)&v101.val[3] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v101.val[1] = veorq_s8(vandq_s8((int8x16_t)v88, (int8x16_t)v39), (int8x16_t)(*(_OWORD *)&v101.val[1] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v101.val[2] = veorq_s8(vandq_s8((int8x16_t)v89, (int8x16_t)v39), (int8x16_t)(*(_OWORD *)&v101.val[2] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    a29 = vaddq_s32(vsubq_s32(v88, vaddq_s32((int32x4_t)v101.val[1], (int32x4_t)v101.val[1])), (int32x4_t)v41);
    a30 = vaddq_s32(vsubq_s32(v89, vaddq_s32((int32x4_t)v101.val[2], (int32x4_t)v101.val[2])), (int32x4_t)v41);
    a27 = vaddq_s32(vsubq_s32(v86, vaddq_s32((int32x4_t)v101.val[0], (int32x4_t)v101.val[0])), (int32x4_t)v41);
    a28 = vaddq_s32(vsubq_s32(v87, vaddq_s32((int32x4_t)v101.val[3], (int32x4_t)v101.val[3])), (int32x4_t)v41);
    v90 = (v33 + a8 + 1299);
    v91 = (_DWORD *)&a27 + v37 + v35 + 16;
    v92 = *((_DWORD *)&a27 + v37 + v35 + v90 - 1565) ^ *(v91 - 3);
    v93 = *(v91 - 16);
    v94 = v93 ^ *(v91 - 14) ^ (v92 + v36 - ((2 * v92) & 0xEB418642));
    HIDWORD(v96) = v94 ^ v36;
    LODWORD(v96) = v94;
    v95 = v96 >> 31;
    v97 = (2 * v95) & 0xEB418642;
    *v91 = v95 + v36 - v97;
    HIDWORD(v98) = HIDWORD(a12) - 1916325933;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * ((738 * (v37 + 17 == v37 + 80)) ^ (v33 + (int)a8 + 949))) - 12))(v47, v97, v48, v93, v90, 3946939970, a7, a8, a9, a10, a11, a12, a13, a14, a15, v98, v99, __PAIR64__(v48, v47), a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26);
  }
  else if (v50 == 1)
  {
    v100 = vld4q_s8(v40);
    v51 = (uint8x16_t)veorq_s8(v100.val[0], (int8x16_t)v42);
    v52 = vmovl_u8(*(uint8x8_t *)v51.i8);
    v53 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v52.i8);
    v54 = (int8x16_t)vmovl_high_u16(v52);
    v55 = vmovl_high_u8(v51);
    v56 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v55.i8);
    v57 = (int8x16_t)vmovl_high_u16(v55);
    v58 = (uint8x16_t)veorq_s8(v100.val[1], (int8x16_t)v42);
    v59 = vmovl_high_u8(v58);
    v60 = vmovl_u8(*(uint8x8_t *)v58.i8);
    v61 = (uint8x16_t)veorq_s8(v100.val[2], (int8x16_t)v42);
    _Q26 = (int8x16_t)vmovl_high_u8(v61);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v61.i8);
    v64 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v69 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v100.val[0] = veorq_s8(v100.val[3], (int8x16_t)v42);
    v100.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v100.val[0]);
    v100.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[1]);
    v100.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v100.val[0].i8);
    v100.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v100.val[0]);
    v100.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v100.val[0].i8), 0x18uLL), v64), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v60.i8, 8uLL), v53));
    v100.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v100.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v60, 8uLL), v54));
    v100.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v100.val[1].i8), 0x18uLL), v69), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v59.i8, 8uLL), v56));
    v100.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v100.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v59, 8uLL), v57));
    v70 = (int32x4_t)veorq_s8(vandq_s8(v100.val[0], (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v53 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v71 = (int32x4_t)veorq_s8(vandq_s8(v100.val[3], (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v54 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v72 = (int32x4_t)veorq_s8(vandq_s8(v100.val[1], (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v100.val[2], (int8x16_t)v44), (int8x16_t)(*(_OWORD *)&v57 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    a29 = vaddq_s32(vsubq_s32((int32x4_t)v100.val[1], vaddq_s32(v72, v72)), (int32x4_t)v41);
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v100.val[2], vaddq_s32(v73, v73)), (int32x4_t)v41);
    a27 = vaddq_s32(vsubq_s32((int32x4_t)v100.val[0], vaddq_s32(v70, v70)), (int32x4_t)v41);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v100.val[3], vaddq_s32(v71, v71)), (int32x4_t)v41);
    return ((uint64_t (*)(__n128))(*(_QWORD *)(v32 + 8
                                                             * (int)((v37 == 1504166545) | (75 * (a8 ^ (a8 + 18)))))
                                           - 8))(v39);
  }
  else
  {
    *(_DWORD *)(v38 - 148) = 2 * (v46 ^ v31) + v31 - (v34 & (4 * (v46 ^ v31)));
    *(_DWORD *)(v38 - 144) = 2 * (v45 ^ v31) + v31 - (v34 & (4 * (v45 ^ v31)));
    *(_DWORD *)(v38 - 140) = 2 * (v47 ^ v31) + v31 - (v34 & (4 * (v47 ^ v31)));
    *(_DWORD *)(v38 - 136) = 2 * (v48 ^ v31) + v31 - (v34 & (4 * (v48 ^ v31)));
    return a19(v39, v41, v42, v43, v44);
  }
}

uint64_t sub_1B7750B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, int a16, unsigned int a17)
{
  uint64_t v17;
  _BOOL4 v18;

  if (a17 < 0xD1399096 != (a14 - 1615323557) < 0xD1399096)
    v18 = (a14 - 1615323557) < 0xD1399096;
  else
    v18 = a14 - 1615323557 > a17;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * ((842 * !v18) ^ (a8 - 1716485200)))
                                                   - ((((a8 - 1716486027) | 0x100u) + 61) ^ 0x3B9)))(3464400261, 1825);
}

uint64_t sub_1B7750C10(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  int v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * (((v9 + a1 + 63 < (v9 + a1)) ^ (v8 ^ (a8 + 0x80))) & 1 ^ v8))
                            - 12))();
}

uint64_t sub_1B7750C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * ((47 * (a13 + v15 - v14 >= (v16 ^ 0x664F821BuLL))) ^ v13)) - 12))();
}

uint64_t sub_1B7750C88(int a1, int a2, double a3, double a4, int8x16_t a5, int8x16_t a6)
{
  int8x16_t *v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  *v6 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v12 + (v8 + a1)), vandq_s8(vaddq_s8(*(int8x16_t *)(v12 + (v8 + a1)), *(int8x16_t *)(v12 + (v8 + a1))), a6)), a5);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((((((v11 + v7 - 225) | 8u) ^ v9) != 64) * a2) ^ (v11 + v7 + 18)))
                            - 12))();
}

uint64_t sub_1B7750CE8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(v2 + a2) = *(_BYTE *)(v7 + (v4 + a1))
                      - ((((v6 + v3 + 7) | 0x20) - 115) & (2 * *(_BYTE *)(v7 + (v4 + a1))))
                      + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((4 * (a2 != 63)) | (8 * (a2 != 63))) ^ (v6 + v3 + 18))) - 12))();
}

uint64_t sub_1B7750D40()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v2 - 1716486377) ^ (8 * ((v0 - 149885707) < 0x38))))
                            - ((v2 - 1716486621) ^ 0x22)))();
}

uint64_t sub_1B7750D88()
{
  int v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = 56;
  if ((unint64_t)v1 - 149885706 > 0x38)
    v3 = v1 - 149885706;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 ^ (94 * (v3 - (unint64_t)v1 + 149885707 > 7))))
                            - 110 * ((v0 + 1061512145) & 0xC0BA9F87 ^ 0x38F)
                            + 868))();
}

uint64_t sub_1B7750E04()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = (v1 - 763306906) & 0x2D7F237F;
  *(_QWORD *)(v2 + v4 - 220 + (v5 - 808) - 46) = 0x6363636363636363;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((38 * (((v5 - 862) & v0) != 8)) ^ v5)) - 8))();
}

uint64_t sub_1B7750E70(double a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(double *)(v3 + v5) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v2 != v5) * v4) ^ v1)) - 8))();
}

uint64_t sub_1B7750E94()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (268 * (v0 == v1))))
                            - ((v2 - 428871955) & 0x7FDF92EF ^ ((v2 + 857) + 1716485760))))();
}

void sub_1B7750EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v8;
  uint64_t v9;
  int v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  char v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;

  v10 = *(unsigned __int8 *)(v9 - 124) ^ 0x5C;
  if (v10 == 1)
  {
    v17 = *(_DWORD *)(v9 - 156);
    v16 = *(_DWORD *)(v9 - 152);
    *(_BYTE *)(v9 - 164) = ((8 * v16) ^ 0x98) - ((v8 + a8 - 82) & (16 * v16)) + 99;
    *(_BYTE *)(v9 - 163) = ((v16 >> 5) ^ 0xAC) - ((2 * ((v16 >> 5) ^ 0xAC)) & 0xC7) + 99;
    *(_BYTE *)(v9 - 162) = ((v16 >> 13) ^ 0x41) - 2 * (((v16 >> 13) ^ 0x41) & 0x6B ^ (v16 >> 13) & 8) + 99;
    *(_BYTE *)(v9 - 161) = ((v16 >> 21) ^ 0x4D) + (~(2 * ((v16 >> 21) ^ 0x4D)) | 0x39) + 100;
    HIDWORD(v18) = v17 ^ 0x12;
    LODWORD(v18) = v16 ^ 0xC0000000;
    *(_BYTE *)(v9 - 160) = (v18 >> 29) - ((2 * (v18 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v9 - 159) = ((v17 >> 5) ^ 0xEB) - 2 * (((v17 >> 5) ^ 0xEB) & 0xE7 ^ (v17 >> 5) & 4) + 99;
    *(_BYTE *)(v9 - 158) = ((v17 >> 13) ^ 0xC2) - 2 * (((v17 >> 13) ^ 0xC2) & 0xE7 ^ (v17 >> 13) & 4) + 99;
    v11 = v8 + a8 + 7;
    v15 = (v17 >> 21) ^ 0x68;
    v14 = (2 * v15) & 0xC7;
  }
  else
  {
    if (v10 != 2)
      goto LABEL_6;
    v11 = v8 + a8 + 7;
    v15 = *(_DWORD *)(v9 - 156);
    v12 = *(_DWORD *)(v9 - 152);
    *(_BYTE *)(v9 - 164) = ((v15 >> 21) ^ 0x68)
                         + ~(2 * (((v15 >> 21) ^ 0x68) & 0xE7 ^ (v15 >> 21) & (v11 ^ 0x1D)))
                         + 100;
    *(_BYTE *)(v9 - 163) = ((v15 >> 13) ^ 0xC2) - 2 * (((v15 >> 13) ^ 0xC2) & 0xE7 ^ (v15 >> 13) & 4) + 99;
    *(_BYTE *)(v9 - 162) = ((v15 >> 5) ^ 0xEB) - ((2 * ((v15 >> 5) ^ 0xEB)) & 0xC7) + 99;
    HIDWORD(v13) = v15 ^ 0x12;
    LODWORD(v13) = v12 ^ 0xC0000000;
    *(_BYTE *)(v9 - 161) = (v13 >> 29) - ((2 * (v13 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v9 - 160) = ((v12 >> 21) ^ 0x4D) - ((2 * ((v12 >> 21) ^ 0x4D)) & 0xC7) + 99;
    *(_BYTE *)(v9 - 159) = ((v12 >> 13) ^ 0x41) - ((2 * ((v12 >> 13) ^ 0x41)) & 0xC7) + 99;
    *(_BYTE *)(v9 - 158) = ((v12 >> 5) ^ 0xAC) - ((2 * ((v12 >> 5) ^ 0xAC)) & 0xC7) + 99;
    v14 = (16 * v12) & 0xC0;
    LOBYTE(v15) = (8 * v12) ^ 0x98;
  }
  *(_BYTE *)(v9 - 157) = v15 - v14 + ((v11 - 106) & 0x5B) + 88;
LABEL_6:
  JUMPOUT(0x1B774FF28);
}

uint64_t sub_1B775139C@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v8 = v5 + 494491561 + ((v3 - 11541272) & 0x66FF9BDFu);
  v9 = *(_DWORD *)(v7 - 220 + v8 + 72);
  *(_BYTE *)(a1 + v8) = (HIBYTE(v9) ^ 0xE8) - ((2 * (HIBYTE(v9) ^ 0xE8)) & 0xC7) + 99;
  *(_BYTE *)(a1 + (v5 + a2)) = (BYTE2(v9) ^ 0x19) + (~(2 * (BYTE2(v9) ^ 0x19)) | 0x39) + 100;
  *(_BYTE *)(a1 + (v5 + a2 + 1)) = (BYTE1(v9) ^ 0x59)
                                               - 2 * ((BYTE1(v9) ^ 0x59) & 0xE7 ^ BYTE1(v9) & 4)
                                               + 99;
  *(_BYTE *)(a1 + (v5 + a2 + 2)) = v9 ^ 0xAD;
  LODWORD(v8) = *(_DWORD *)(v7 - 128) + 623938627;
  v10 = v8 < v2;
  v11 = v5 - 435894108 < v8;
  if (v5 - 435894108 < v2 != v10)
    v11 = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((v11 * v4) ^ v3)) - 4))();
}

void sub_1B7751544()
{
  JUMPOUT(0x1B775150CLL);
}

uint64_t sub_1B7751550()
{
  return 0;
}

void sub_1B7751590(uint64_t a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 + 535753261 * ((a1 & 0x658A5D69 | ~(a1 | 0x658A5D69)) ^ 0x9081ACB9);
  v3 = *(_QWORD *)(a1 + 8);
  v2[0] = v1 + 235795823 * ((v2 & 0xC687DC9D | ~(v2 | 0xC687DC9D)) ^ 0xADD56A3B) - 226;
  sub_1B7789BDC((uint64_t)v2);
  __asm { BR              X9 }
}

uint64_t sub_1B77516D8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v7;

  v5 = ((19 * (v1 ^ 0x266)) ^ 0xED15F31F)
     + (((v4 - v3) >> 4) & 0xF7FBA1E ^ 0x64BA804)
     + (((v4 - v3) >> 5) ^ 0x64DA098D);
  v7 = v5 > 0x54D5D48C && v5 < v2 + 1423298836 + 7 * (v1 ^ 0x222u);
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1126 * v7) ^ v1)) - 4))();
}

uint64_t sub_1B775176C@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v2 ^ 0x393) * ((v1 & 0x1F) == 0x11)) ^ v2)) - 4))();
}

uint64_t sub_1B77517A0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  _DWORD *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v6 = v1 - 344324;
  v7 = v3 ^ 0xD4;
  if (*v4 + 1586265831 < 0)
    v6 = -814057190 - v1;
  *v4 = *v4 - 1740282891 + v6;
  v8 = v2 - 531657649;
  **(_DWORD **)(v5 - 0x709331AC20D1CC01) = *(_DWORD *)(*(_QWORD *)(v5 - 0x709331AC20D1CC01) + 4
                                                                                                * (v1 - 1740627215));
  v9 = v7 + 2022681492 < v8;
  if (v8 < -124801216 != v7 + 2022681492 < -124801216)
    v9 = v8 < -124801216;
  return (*(uint64_t (**)(void))(a1 + 8 * ((1996 * !v9) ^ v7)))();
}

void sub_1B775188C()
{
  JUMPOUT(0x1B7751838);
}

void sub_1B7751894()
{
  _DWORD *v0;

  *v0 = 561217817;
}

void sub_1B7751AC0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1B7751B30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W8>)
{
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                                          + 8
                                                                                          * ((37
                                                                                            * (((a5 - 1123162719) ^ 0x357B5FF7DCFF6BEBLL)
                                                                                             - 0x357B5FF765CC6B0FLL
                                                                                             + ((2
                                                                                               * (a5 - 1123162719)) & 0x1B9FED7D6) != 1999831260)) ^ 0x24Du))
                                                                              - 12))(a1, a2, a3, a4, 3832684606);
}

uint64_t sub_1B7751BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v11 = *(unsigned __int8 *)(v8 + v9 - 0x58567493A9AD4A3ELL) - *(unsigned __int8 *)(v6 + v9 - 0x58567493A9AD4A3ELL);
  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * ((((((v7 ^ (a5 + 325)) + 436854400) & (2 * v11)) + (v11 ^ v5) == v5)
                                              * ((31 * (v7 ^ 0x1AE)) ^ 0x510)) ^ v7)))(4294925278);
}

uint64_t sub_1B7751C48()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = v1 < v0;
  if (v5 == v2 - 0x58567493327A4961 < (((v3 - 428) | 0x11Cu) ^ (v0 + 133)))
    v5 = v2 - 0x58567493327A4961 < v1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((37 * v5) ^ v3)) - 12))();
}

uint64_t sub_1B7751CC4@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((850 * (a1 == v1 + 1123161511 + v1 + 327)) ^ v1)))(4294925278);
}

uint64_t sub_1B7751CF8()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1388
                                          * (((2 * (*v0 - 42)) & 0xFDAD9DDE) + ((*v0 - 42) ^ 0xFED6CEEF) == -19476753)) ^ v1))
                            - (v1 - 256)
                            + 504))();
}

uint64_t sub_1B7751D50()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1462
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                 + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0 + 258 * ((v3 - 533) ^ 0xED) - 516)) ^ (v3 - 533))))();
}

uint64_t sub_1B7751DA0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((563
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
                                 + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0 + v3 + 277 - 516)) ^ v3)))();
}

uint64_t sub_1B7751DE0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned int v6;

  v6 = *(unsigned __int8 *)(v3 + 3) + (v2 ^ 0xFFFFFD7E);
  return (*(uint64_t (**)(void))(v5 + 8 * ((1646 * ((v1 & (2 * v6)) + (v6 ^ v0) == v0)) ^ v4)))();
}

uint64_t sub_1B7751E1C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = *(unsigned __int8 *)(v2 + 4) + ((v3 + 533) ^ 0xFFFFFC0D);
  return (*(uint64_t (**)(void))(v4 + 8 * ((1711 * (((v5 << ((v3 + 21) ^ 5)) & v1) + (v5 ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_1B7751E6C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)
                                          * ((((v3 - 260) | 4) - 277) ^ 0x568)) ^ v3))
                            - 12))();
}

uint64_t sub_1B7751EB4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((((v1 + 258 * (v4 ^ 0xED) - 516) & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
                                 + ((*(unsigned __int8 *)(v3 + 6) - 1) ^ v0) == v0)
                                * v2) ^ v4)))();
}

uint64_t sub_1B7751EF8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((533
                                * (((v1 + 12 * (v3 ^ 0xC4) - 516) & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                 + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_1B7751F44()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;

  v5 = ((3 * (v3 ^ 0x43)) ^ 0xFFFFFDF8) + *(unsigned __int8 *)(v2 + 8);
  return (*(uint64_t (**)(void))(v4 + 8 * ((971 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_1B7751F8C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 920534384;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((297 * (*(_DWORD *)(a2 + 4) == v2 + 1217)) ^ v3 ^ 0x2C2))
                            - (((v3 ^ 0x2C2u) + 569) ^ 0x46ALL)))();
}

uint64_t sub_1B7751FEC(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1258 * ((v3 & (2 * v6)) + ((2 * v4) ^ 0x570 ^ (v2 + 168) ^ v6) == v2)) | v4))
                            - 12))();
}

uint64_t sub_1B7752034()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2041
                                          * ((((*(unsigned __int8 *)(v3 + 1) - 134) << ((v2 - 6) & 0x79 ^ 0x79)) & v1)
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B775208C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1878
                                          * (((((v2 - 428) | 0x120) ^ (v1 - 312)) & (2
                                                                                   * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_1B77520D4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((284
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == ((v2 - 93785226) & 0x5970BFD ^ (v0 + 168)))) ^ v2))
                            - 12))();
}

uint64_t sub_1B7752128()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)
                                          * ((2 * v2) ^ 0x2C7)) ^ v2))
                            - 12))();
}

uint64_t sub_1B775216C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1579
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == v0)) ^ v2))
                            - (((v2 - 404) | 0x108u) ^ 0x174)))();
}

uint64_t sub_1B77521B4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v5 = (v2 ^ 0x37C) + *(unsigned __int8 *)(v3 + 6) - 377;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1037 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_1B77521F4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = ((v2 - 570679941) & 0x2203E1F8 ^ 0xFFFFFE87) + *(unsigned __int8 *)(v3 + 7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1866 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_1B7752248()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((330
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 8) - 5)))
                                           + ((*(unsigned __int8 *)(v3 + 8) - 5) ^ v0) == (v2 ^ 0x37C ^ (v0 + 168)))) ^ v2))
                            - 12))();
}

uint64_t sub_1B775228C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 920534388;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((41 * (*(_DWORD *)(a2 + 4) != ((94 * (v3 ^ 0x200)) ^ (v2 + 1385)))) ^ v3))
                            - 12))();
}

uint64_t sub_1B77522EC(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((731 * ((v3 & (2 * v6)) + (v6 ^ (v2 + ((v4 + 172) | 9) - 557)) == v2)) ^ v4))
                            - 12))();
}

uint64_t sub_1B7752338()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1091
                                          * ((((v3 + 181) ^ (v1 + 533)) & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B7752378()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1021
                                          * ((((*(unsigned __int8 *)(v2 + 2) - 72) << (v3 ^ 0x79)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B77523C0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1382
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)) ^ v3))
                            - ((v3 + 169) | 0xCu)
                            + 545))();
}

uint64_t sub_1B7752400()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1126
                                          * ((((v3 - 1323321217) & 0x4EE0476E ^ (v1 - 294)) & (2
                                                                                             * (*(unsigned __int8 *)(v2 + 4)
                                                                                              - 247)))
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B7752458()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((30
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((v0 + ((v3 + 158) | 0x29) - 181 - 376) ^ (*(unsigned __int8 *)(v2 + 5) - 13)) != v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B77524A4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1084
                                          * ((((v3 + 181) ^ (v1 + 533)) & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_1B77524E4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1856
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ (v0 + v3 - 557)) == v0)) ^ v4))
                            - 12))();
}

uint64_t sub_1B7752520()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((212
                                          * ((((*(unsigned __int8 *)(v2 + 8) - 11) << ((v3 + 53) & 0x7F ^ 0x2C)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 8) - 11) ^ v0) == v0)) ^ v3))
                            - (v3 + 181)
                            + 545))();
}

void sub_1B7752580()
{
  int v0;
  uint64_t v1;
  uint64_t v3;
  unsigned int v4;
  int v5;

  v4 = (v0 + 589277881) & 0xDCE0577F;
  *(_DWORD *)(*(_QWORD *)(v1 + 96) + 1428) = 920534400;
  v5 = 628203409 * ((2 * ((v3 - 120) & 0x3B7F2A8) - (v3 - 120) + 2085096789) ^ 0xFEC00166);
  *(_DWORD *)(v3 - 120) = v5 + v4 + 1172344309;
  *(_DWORD *)(v3 - 112) = v5
                        - 1251316650
                        - ((((v4 - 886) | 8) - 1814660102 * ((v4 - 699) ^ 0x424F5325) - 1792334238) & 0xFCFAD3DE)
                        - 921502308;
  *(_QWORD *)(v3 - 104) = v3 + 0xD547898781B10E4;
  sub_1B7776B68(v3 - 120);
  __asm { BR              X9 }
}

uint64_t sub_1B77527D0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  unsigned int v25;

  v25 = v23 + 535748821 + a21 - 462283117;
  if (v25 <= 0x40)
    v25 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v24 + 8 * ((74 * (a4 - v21 - v22 + v25 < a21 - 412)) ^ a21)) - 4))();
}

uint64_t sub_1B7752850(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;

  v11 = v7 + v6;
  if ((v11 + 73466131) > 0x40)
    v8 = v11 + 73466131;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((98
                                          * (((a5 + ((a6 + 537919119) | 0xC4622004) + 121) ^ (a4 + 31)) - v11 < v9 + v8)) ^ (a6 + 886)))
                            - 8))();
}

uint64_t sub_1B77528C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15
                                        + 8
                                        * (((v14 + 871) * ((unint64_t)(a13 + v16 - 220 + v13) > 0xF)) ^ v14))
                            - 4))();
}

uint64_t sub_1B7752900@<X0>(int a1@<W2>, int a2@<W4>, int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;

  v9.i64[0] = 0xC6C6C6C6C6C6C6C6;
  v9.i64[1] = 0xC6C6C6C6C6C6C6C6;
  v10.i64[0] = 0x6363636363636363;
  v10.i64[1] = 0x6363636363636363;
  *(int8x16_t *)(v5 + (a3 + v3)) = vaddq_s8(vsubq_s8(*v7, vandq_s8(vaddq_s8(*v7, *v7), v9)), v10);
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((122 * (((v4 - a1 + 481) ^ 0x1F1) != ((v6 + 1) & 0x1FFFFFFF0))) ^ (a2 + v4 + 1093))))();
}

uint64_t sub_1B7752978(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4 + 8 * (v3 ^ (1219 * (v1 == v2))))
                                                   - (v3 ^ 0xE47221DF ^ v5 ^ (6 * (v3 ^ 0x1E4u)))))(a1, 2665595186);
}

uint64_t sub_1B77529D4@<X0>(int a1@<W1>, int a2@<W4>, int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v8 - 220 + (a3 + v3)) = *(_BYTE *)(v5 + v6 - 757022649)
                                                 - ((2 * *(_BYTE *)(v5 + v6 - 757022649)) & 0xC7)
                                                 + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((16 * ((a1 + a3 + 1) < 0x40)) | (((a1 + a3 + 1) < 0x40) << 6) | (a2 + v4 + 828)))
                            - 8))();
}

uint64_t sub_1B7752A58(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19, int a20,unsigned int a21,uint64_t (*a22)(__n128, __n128, __n128, __n128, __n128),int a23,int a24,unint64_t a25,uint64_t a26,uint64_t a27,int32x4_t a28,int32x4_t a29,int32x4_t a30,int32x4_t a31)
{
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(__n128, __n128, __n128, __n128, __n128);
  unsigned int v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  uint64_t v52;
  int v53;
  uint8x16_t v54;
  uint16x8_t v55;
  int8x16_t v56;
  int8x16_t v57;
  uint16x8_t v58;
  int8x16_t v59;
  int8x16_t v60;
  uint8x16_t v61;
  uint16x8_t v62;
  uint16x8_t v63;
  uint8x16_t v64;
  int8x16_t v67;
  int8x16_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  uint8x16_t v78;
  uint16x8_t v79;
  uint16x8_t v80;
  uint8x16_t v81;
  uint8x16_t v86;
  uint16x8_t v87;
  uint16x8_t v88;
  int32x4_t v89;
  int32x4_t v90;
  int32x4_t v91;
  int32x4_t v92;
  _DWORD *v93;
  int v94;
  int v95;
  unint64_t v96;
  int8x16x4_t v97;
  int8x16x4_t v98;

  v40 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(v32 + 8 * v31);
  a18 = a13 + ((71 * (v31 ^ 0x1D)) ^ (a3 + 173)) + 574431266;
  v41 = (a3 + 658263358) & 0xF451968B;
  v42 = (const char *)(v39 - 220);
  v43 = (__n128)vdupq_n_s32(0x75A0C33Bu);
  v44 = (__n128)vdupq_n_s32(0x75A0C321u);
  v45.n128_u64[0] = 0x6363636363636363;
  v45.n128_u64[1] = 0x6363636363636363;
  a25 = v36 - 1026;
  a26 = v38 - 16;
  v46.n128_u64[0] = 0xC6C6C6C6C6C6C6C6;
  v46.n128_u64[1] = 0xC6C6C6C6C6C6C6C6;
  v47 = (__n128)vdupq_n_s32(0x75A0C337u);
  v48 = *(_DWORD *)(v39 - 148);
  v49 = *(_DWORD *)(v39 - 144);
  a24 = v48;
  v51 = *(_DWORD *)(v39 - 140);
  v50 = *(_DWORD *)(v39 - 136);
  v52 = v50;
  v53 = *(_BYTE *)(v39 - 124) ^ 0x5C;
  a17 = *(unsigned __int8 *)(v39 - 124) ^ 0x5C;
  if (v53 == 2)
  {
    a19 = v49;
    a20 = v51;
    a21 = v50;
    a22 = v40;
    v98 = vld4q_s8(v42);
    v78 = (uint8x16_t)veorq_s8(v98.val[0], (int8x16_t)v45);
    v79 = vmovl_u8(*(uint8x8_t *)v78.i8);
    v80 = vmovl_high_u8(v78);
    v81 = (uint8x16_t)veorq_s8(v98.val[1], (int8x16_t)v45);
    _Q22 = vmovl_u8(*(uint8x8_t *)v81.i8);
    _Q21 = vmovl_high_u8(v81);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v86 = (uint8x16_t)veorq_s8(v98.val[2], (int8x16_t)v45);
    v87 = vmovl_high_u8(v86);
    v88 = vmovl_u8(*(uint8x8_t *)v86.i8);
    v98.val[0] = veorq_s8(v98.val[3], (int8x16_t)v45);
    v98.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v98.val[0]);
    v98.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[1]);
    v98.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[1].i8);
    v98.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v98.val[0].i8);
    v98.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v98.val[0]);
    v98.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v98.val[0].i8);
    v89 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v88.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v79.i8), 0x18uLL)), v98.val[0]);
    v90 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v88, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v79), 0x18uLL)), v98.val[3]);
    v91 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v87.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v80.i8), 0x18uLL)), v98.val[1]);
    v92 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v87, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v80), 0x18uLL)), v98.val[2]);
    v98.val[0] = veorq_s8(vandq_s8((int8x16_t)v89, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)v98.val & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v98.val[3] = veorq_s8(vandq_s8((int8x16_t)v90, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[3] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v98.val[1] = veorq_s8(vandq_s8((int8x16_t)v91, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[1] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v98.val[2] = veorq_s8(vandq_s8((int8x16_t)v92, (int8x16_t)v43), (int8x16_t)(*(_OWORD *)&v98.val[2] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    a30 = vaddq_s32(vsubq_s32(v91, vaddq_s32((int32x4_t)v98.val[1], (int32x4_t)v98.val[1])), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32(v92, vaddq_s32((int32x4_t)v98.val[2], (int32x4_t)v98.val[2])), (int32x4_t)v44);
    a28 = vaddq_s32(vsubq_s32(v89, vaddq_s32((int32x4_t)v98.val[0], (int32x4_t)v98.val[0])), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32(v90, vaddq_s32((int32x4_t)v98.val[3], (int32x4_t)v98.val[3])), (int32x4_t)v44);
    v93 = (_DWORD *)&a28 + v36 + 482001494;
    v94 = *((_DWORD *)&a28 + ((v41 + 2) ^ a25) + 482001494) ^ *(v93 - 3);
    v95 = *(v93 - 16) ^ *(v93 - 14) ^ (v94 + v34 - (v35 & (2 * v94)));
    HIDWORD(v96) = v95 ^ v34;
    LODWORD(v96) = v95;
    *v93 = (v96 >> 31) + v34 - (v35 & (2 * (v96 >> 31)));
    return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v32 + 8 * (int)(v41 ^ (2 * (v38 == 482001431))))
                                                    - 4))(v52, (v37 - 2));
  }
  else if (v53 == 1)
  {
    a19 = v49;
    a20 = v51;
    a21 = v50;
    a22 = v40;
    v97 = vld4q_s8(v42);
    v54 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v45);
    v55 = vmovl_u8(*(uint8x8_t *)v54.i8);
    v56 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v55.i8);
    v57 = (int8x16_t)vmovl_high_u16(v55);
    v58 = vmovl_high_u8(v54);
    v59 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v58.i8);
    v60 = (int8x16_t)vmovl_high_u16(v58);
    v61 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v45);
    v62 = vmovl_high_u8(v61);
    v63 = vmovl_u8(*(uint8x8_t *)v61.i8);
    v64 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v45);
    _Q26 = (int8x16_t)vmovl_high_u8(v64);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v64.i8);
    v67 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v72 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v45);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]);
    v97.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8), 0x18uLL), v67), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), v56));
    v97.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v57));
    v97.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8), 0x18uLL), v72), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), v59));
    v97.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v97.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v60));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v97.val[0], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v74 = (int32x4_t)veorq_s8(vandq_s8(v97.val[3], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v57 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v75 = (int32x4_t)veorq_s8(vandq_s8(v97.val[1], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v76 = (int32x4_t)veorq_s8(vandq_s8(v97.val[2], (int8x16_t)v47), (int8x16_t)(*(_OWORD *)&v60 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[1], vaddq_s32(v75, v75)), (int32x4_t)v44);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[2], vaddq_s32(v76, v76)), (int32x4_t)v44);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[0], vaddq_s32(v73, v73)), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32((int32x4_t)v97.val[3], vaddq_s32(v74, v74)), (int32x4_t)v44);
    return (*(uint64_t (**)(__n128))(v32 + 8 * ((30 * (a26 + 1 == v38)) ^ (a5 + a3 + 327))))(v43);
  }
  else
  {
    *(_DWORD *)(v39 - 148) = (v48 ^ v37) + (a24 ^ v37) + v37 - (v33 & (2 * ((v48 ^ v37) + (a24 ^ v37))));
    *(_DWORD *)(v39 - 144) = 2 * (v49 ^ v37) + v37 - (v33 & (4 * (v49 ^ v37)));
    *(_DWORD *)(v39 - 140) = 2 * (v51 ^ v37) + v37 - (v33 & (4 * (v51 ^ v37)));
    *(_DWORD *)(v39 - 136) = 2 * (v50 ^ v37) + v37 - (v33 & (4 * (v50 ^ v37)));
    return v40(v43, v44, v45, v46, v47);
  }
}

void sub_1B7752B0C()
{
  JUMPOUT(0x1B7752B40);
}

void sub_1B7752DB0()
{
  JUMPOUT(0x1B7752CB8);
}

uint64_t sub_1B7752DC0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v1 + 8 * (((v0 + 1 == v3 + 16) | (4 * (v0 + 1 == v3 + 16))) ^ v2)))();
}

uint64_t sub_1B7752EA8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1655 * (v1 + 1 == v3 + 32)) ^ a1)))();
}

uint64_t sub_1B7752F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v6 + 8 * ((235 * (v7 + 1 != v8 + 48)) ^ a6)))();
}

void sub_1B775306C()
{
  JUMPOUT(0x1B7753604);
}

uint64_t sub_1B7753270@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * ((315 * (v2 + 1 == v4 + 4)) ^ a1)) - 4))(a2);
}

uint64_t sub_1B7753348(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v5 + 1 == v6 + 24) | (4 * (v5 + 1 == v6 + 24))) ^ a4)) - 4))();
}

uint64_t sub_1B7753408(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v7 + 8 * ((504 * (a5 + 1 != v8 + 44)) ^ a3)) - 4))(a7);
}

uint64_t sub_1B77534C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((2 * (a4 + 1 == v5 + 64)) | (16 * (a4 + 1 == v5 + 64))) ^ a3))
                            - 4))();
}

void sub_1B7753594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v12 = (v8 ^ 0xC6B79F0 ^ (a5 - 462283754)) + (a8 ^ v10);
  *(_DWORD *)(v11 - 132) = v12 + v10 - (v9 & (2 * v12));
  JUMPOUT(0x1B7753600);
}

uint64_t sub_1B7753684(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16)
{
  uint64_t v16;
  _BOOL4 v17;

  if (a16 < 0x4A21A123 != (a14 + 486695338) < 0x4A21A123)
    v17 = (a14 + 486695338) < 0x4A21A123;
  else
    v17 = a14 + 486695338 > a16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((229 * !v17) ^ (a5 + a3 + 766)))
                            - (((a5 + a3 - 328) | 0xD8u) ^ 0xFCLL)))();
}

uint64_t sub_1B7753714(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5
                                                      + 8
                                                      * ((450 * (v3 + a3 + 3 * ((v4 + 1381) ^ 0x48Eu) - 1674 >= v3 + a3)) ^ (v4 + 1381)))
                                          - 8))(118);
}

uint64_t sub_1B7753770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * (((a13 + v13 - v15 < ((v14 - a5 - 1377) ^ (unint64_t)(v17 + 10)))
                                          * (v14 - 1733)) | v14))
                            - 8))();
}

uint64_t sub_1B77537B0@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W5>, int a6@<W8>)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v11 = *(_BYTE *)(v9 + ((a6 + a3) & a5 ^ (a2 + 52)) + v7);
  *(_BYTE *)(v8 + v6) = v11 - ((2 * v11) & 0xC7) + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((v6 == 63) * a1) ^ (a4 + a6 - 196))) - 8))();
}

uint64_t sub_1B775380C@<X0>(int a1@<W2>, int a2@<W4>, int a3@<W8>, int8x16_t a4@<Q2>, int8x16_t a5@<Q3>)
{
  int v5;
  int8x16_t *v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;

  v9 = *(int8x16_t *)(v7 + v5 + ((a2 + a3 - 300) ^ (a1 + 52)));
  *v6 = vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), a5)), a4);
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((a2 + a3 - 150) ^ 0xE)) - 8))();
}

uint64_t sub_1B7753870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  _BOOL4 v17;

  v16 = a13 + v15 + 1193 - 2113397117;
  if (v16 < 0xC57A84E7 != (v13 - 1738848978) < 0xC57A84E7)
    v17 = v16 < 0xC57A84E7;
  else
    v17 = v13 - 1738848978 < v16;
  return (*(uint64_t (**)(void))(v14 + 8 * ((493 * v17) ^ v15)))();
}

uint64_t sub_1B77538DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;

  v15 = ((a2 - 845663658) & 0x3267CA3F) - a5 - 207;
  v16 = 3804331 * ((((v14 - 120) | 0x75EBD8D4) - (v14 - 120) + ((v14 - 120) & 0x8A142728)) ^ 0x8F752B82);
  *(_DWORD *)(v14 - 120) = v16 + a2 - 875;
  *(_DWORD *)(v14 - 116) = (a13 + 254127919) ^ v16;
  *(_QWORD *)(v14 - 112) = a10;
  v17 = sub_1B776B710(v14 - 120);
  v18 = v15 ^ 0xE472202D ^ *(_DWORD *)(v14 - 152) & 0x3F;
  *(_BYTE *)(v14 - 220 + v18) = -29;
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * ((2 * (v18 > 0x37)) | (16 * (v18 > 0x37)) | a2)))(v17);
}

uint64_t sub_1B77539EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned int a20)
{
  int v20;
  uint64_t v21;

  return ((uint64_t (*)(void))(*(_QWORD *)(v21
                                        + 8
                                        * ((76
                                          * (v20 == ((a20 + 582276232) ^ 0x22B4D6FE ^ (a20 + 582276232) & 0x5D4B2FEA ^ 0x6D4))) ^ a20))
                            - 12))();
}

uint64_t sub_1B7753A3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v5 ^ 0x2Cu) >= a5 + (v6 ^ (a3 + 1622)) - 352) | v6)) - 12))();
}

uint64_t sub_1B7753A6C@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 220 + a2 - 1145630530) = 0x6363636363636363;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v3 & 0x38) == 8) * ((v2 - 983737155) & 0x563087EF ^ 0x31A)) ^ (a1 + v2 + 366)))
                            - 8))();
}

void sub_1B7753AD8()
{
  JUMPOUT(0x1B7753AB0);
}

uint64_t sub_1B7753AE0@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  char v14;
  unsigned int v15;
  int v16;
  _BOOL4 v17;

  v13 = v4 < v7;
  v14 = *(_BYTE *)(v9 + (a3 + a2 + v5 - 1441));
  *(_BYTE *)(v12 - 220 + (a4 + v8)) = v14 - ((2 * v14) & 0xC7) + 99;
  v15 = v5 + 1 + a1;
  v16 = v13 ^ (v15 < v7);
  v17 = v15 < v4;
  if (!v16)
    v13 = v17;
  return (*(uint64_t (**)(void))(v10 + 8 * ((v13 * v6) ^ v11)))();
}

uint64_t sub_1B7753B4C@<X0>(int a1@<W4>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2
                              + 8 * ((((a2 - 1145630530) < 0x38) * (a1 + v3 + 885)) ^ (a1 + v3 - 48))))();
}

uint64_t sub_1B7753B7C@<X0>(int a1@<W4>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = a2;
  v5 = a2 - 0x128BB0F7FLL + ((v2 + 1613758138) | 0x8442201C);
  if (v5 <= 0x38)
    v5 = 56;
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((1451 * (((v2 - a1) ^ 0xA03ACF7CLL) - v4 + v5 > 7)) ^ (v2 - 35))))();
}

uint64_t sub_1B7753BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v9 - 220 + v6 - 1145630530) = 0x6363636363636363;
  return (*(uint64_t (**)(void))(v8 + 8 * ((49 * ((v5 & 0xFFFFFFFFFFFFFFF8) != 8)) ^ (a5 + v7 + 739))))();
}

uint64_t sub_1B7753C5C(double a1)
{
  double *v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 != 0) * v3) ^ v2)))();
}

uint64_t sub_1B7753C7C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)(((((v5 - 277171385) & 0xF4F76BBE) + (v5 ^ (a3 + 200) ^ 0xFFFFC001)) * (v3 != v4)) ^ v5)))();
}

void sub_1B7753CBC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  int v14;

  v4 = *(unsigned __int8 *)(v3 - 124) ^ 0x5C;
  if (v4 == 1)
  {
    v11 = *(_DWORD *)(v3 - 156);
    v10 = *(_DWORD *)(v3 - 152);
    *(_BYTE *)(v3 - 164) = ((8 * v10) ^ 0x98) - ((16 * v10) & 0xC0) + 99;
    *(_BYTE *)(v3 - 163) = ((6 * (a3 ^ (a3 + 102)) + 16) ^ (v10 >> 5))
                         - ((2 * ((6 * (a3 ^ (a3 + 102)) + 16) ^ (v10 >> 5))) & 0xC7)
                         + 99;
    *(_BYTE *)(v3 - 162) = ((v10 >> 13) ^ 0x41) + (~(2 * ((v10 >> 13) ^ 0x41)) | 0x39) + 100;
    *(_BYTE *)(v3 - 161) = ((v10 >> 21) ^ 0x4D) - ((2 * ((v10 >> 21) ^ 0x4D)) & 0xC7) + 99;
    HIDWORD(v12) = v11 ^ 0x12;
    LODWORD(v12) = v10 ^ 0xC0000000;
    *(_BYTE *)(v3 - 160) = (v12 >> 29) - ((2 * (v12 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v3 - 159) = ((v11 >> 5) ^ 0xEB) - 2 * (((v11 >> 5) ^ 0xEB) & 0xE7 ^ (v11 >> 5) & 4) + 99;
    *(_BYTE *)(v3 - 158) = ((v11 >> 13) ^ 0xC2) - ((2 * ((v11 >> 13) ^ 0xC2)) & 0xC7) + 99;
    v13 = v11 >> 21;
    v14 = (v11 >> 21) ^ 0x68;
    LOBYTE(v11) = v14 & 0x67;
    v9 = v14 + 99;
    v8 = 2 * (v11 ^ v13 & 4);
  }
  else
  {
    if (v4 != 2)
      goto LABEL_6;
    v5 = *(_DWORD *)(v3 - 156);
    v6 = *(_DWORD *)(v3 - 152);
    *(_BYTE *)(v3 - 164) = ((v5 >> 21) ^ 0x68)
                         - 2 * (((v5 >> 21) ^ 0x68) & 0xE7 ^ (84 * (a3 ^ (a3 - 9)) + 104) & (v5 >> 21))
                         + 99;
    *(_BYTE *)(v3 - 163) = ((v5 >> 13) ^ 0xC2) - ((2 * ((v5 >> 13) ^ 0xC2)) & 0xC7) + 99;
    *(_BYTE *)(v3 - 162) = ((v5 >> 5) ^ 0xEB) - ((2 * ((v5 >> 5) ^ 0xEB)) & 0xC7) + 99;
    HIDWORD(v7) = v5 ^ 0x12;
    LODWORD(v7) = v6 ^ 0xC0000000;
    *(_BYTE *)(v3 - 161) = (v7 >> 29) - ((2 * (v7 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v3 - 160) = ((v6 >> 21) ^ 0x4D) - ((2 * ((v6 >> 21) ^ 0x4D)) & 0xC7) + 99;
    *(_BYTE *)(v3 - 159) = ((v6 >> 13) ^ 0x41) - 2 * (((v6 >> 13) ^ 0x41) & 0xE7 ^ (v6 >> 13) & 4) + 99;
    *(_BYTE *)(v3 - 158) = ((v6 >> 5) ^ 0xAC) - ((2 * ((v6 >> 5) ^ 0xAC)) & 0xC7) + 99;
    v8 = (16 * v6) & 0xC0;
    v9 = ((8 * v6) ^ 0x98) + 99;
  }
  *(_BYTE *)(v3 - 157) = v9 - v8;
LABEL_6:
  JUMPOUT(0x1B7752B40);
}

uint64_t sub_1B77540EC@<X0>(int a1@<W2>, int a2@<W4>, int a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((((v4 == v3) ^ (a3 + 86)) & 1) * (a2 + a1 + a3 - 1259 - 339)) ^ a3)))();
}

void sub_1B7754128()
{
  JUMPOUT(0x1B7752B40);
}

uint64_t sub_1B7754138@<X0>(int a1@<W2>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 220 + ((v3 - a1 + 65) ^ 0xFFFFFFFFBBB710FFLL) + a3) = 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8 * ((95 * ((unint64_t)(a3 - 1145630529) > 0x3F)) ^ (a2 + v3 + 188)))
                            - 12))();
}

uint64_t sub_1B77541F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  int v6;
  char v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v13 = *(_DWORD *)(v12 - 220 + ((v10 + v6) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a5 + (v10 + v6)) = (HIBYTE(v13) ^ 0xE8)
                                            - (((v9 ^ v7) - 120) & (2 * (HIBYTE(v13) ^ 0xE8)))
                                            + 99;
  *(_BYTE *)(a5 + (v10 + v6 + 1)) = (BYTE2(v13) ^ 0x19) + (~(2 * (BYTE2(v13) ^ 0x19)) | 0x39) + 100;
  *(_BYTE *)(a5 + (v10 + v6 + 2)) = (BYTE1(v13) ^ 0x59)
                                                - 2 * ((BYTE1(v13) ^ 0x59) & 0xE7 ^ BYTE1(v13) & 4)
                                                + 99;
  *(_BYTE *)(a5 + (v10 + v6 + 3)) = v13 ^ 0xAD;
  v14 = *(_DWORD *)(v12 - 128) - 2005229374;
  v15 = v14 < v5;
  v16 = v10 + 2095171090 < v14;
  if (v10 + 2095171090 < v5 != v15)
    v16 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((v16 * v8) ^ v9)) - 8))();
}

void sub_1B7754394()
{
  JUMPOUT(0x1B7754358);
}

void sub_1B775439C(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B7754424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a66;
  uint64_t v66;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(v66 + 4704))(a1, a2, a3, a4, a5, 1886208818, a7, a8, &a66, a10);
}

uint64_t sub_1B7754534()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v2 == ((v0 + 430) | 8) + 1397077870) | v0)) - 4))();
}

uint64_t sub_1B7754570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v16;
  int v17;
  uint64_t v18;

  return (*(uint64_t (**)(void))(v18
                              + 8
                              * ((107
                                * ((((v16 - 122) ^ 0xFFFFFAC2) & v17) - a16 != ((v16 - 1818865785) & 0x6C69AFFE ^ 0xFFFFFAC3))) ^ v16)))();
}

uint64_t sub_1B77545C4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  unsigned int v11;
  int v12;
  uint64_t v13;
  _BOOL4 v15;

  v15 = a1 != 1193962534 && a11 - v12 == v11 + 800417083 + v11 - 213;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((119 * v15) ^ v11)) - 4))();
}

uint64_t sub_1B7754614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  _BOOL4 v25;

  v22 = v18 - v19 - 769;
  v23 = (v22 ^ (a6 + 577)) - 259;
  v24 = v19 + v22 + 299;
  v25 = a18 + 139566520 < (v20 + 939986074);
  if ((a18 + 139566520) < 0x7AF926F9 != v20 + 939986074 < (v23 + 2063147451))
    v25 = v20 + 939986074 < (v23 + 2063147451);
  return ((uint64_t (*)(void))(*(_QWORD *)(v21 + 8 * (v24 ^ (2 * !v25))) - 12))();
}

uint64_t sub_1B77547C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  v10 = *(_DWORD *)(v8 + 48 * (v9 - 1397079335) + 36) == v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * (((2 * ((((a6 + v6 + 1) ^ v10) & 1) == 0)) & 0xF7 | (8
                                                                                             * (((a6 + v6 + 1) ^ ~v10) & 1))) ^ v6))
                            - (((v6 - 1601) | 0x101u) ^ 0x109)))();
}

uint64_t sub_1B775482C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v20 = 628203409 * ((v18 - 152) ^ 0x82880C33);
  *(_QWORD *)(v18 - 112) = v14;
  *(_QWORD *)(v18 - 104) = a12;
  *(_QWORD *)(v18 - 152) = a13;
  *(_QWORD *)(v18 - 144) = a11;
  *(_DWORD *)(v18 - 136) = v15 - v20 - 400;
  *(_DWORD *)(v18 - 132) = v16 - v20 + (v15 ^ 0x1A2738D9);
  *(_QWORD *)(v18 - 128) = a14;
  v21 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * (v15 - 1212)) - 8))(v18 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * ((105 * (*(_DWORD *)(v18 - 120) == v15 + 1973468643)) ^ v15))
                                          - 4))(v21);
}

uint64_t sub_1B77548DC()
{
  char v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v1 | (16
                                               * ((((v1 - v0) ^ (*(_DWORD *)(v3
                                                                                            + 48
                                                                                            * (v4
                                                                                             - 1397079335
                                                                                             + ((v1 + 87) | 0x11E)
                                                                                             - 1342)) == 2105405565)) & 1) == 0))))
                            - 8))();
}

uint64_t sub_1B7754940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((((v6 ^ 0x227818CF ^ (a6 + v7 - 1342)) == v8 - 2122182781) * (v7 - 1193)) ^ v7))
                            - 4))();
}

uint64_t sub_1B775498C@<X0>(int a1@<W5>, int a2@<W7>, int a3@<W8>)
{
  int v3;
  int v4;
  uint64_t v6;
  uint64_t v8;
  int v9;
  int v10;
  int v11;

  if ((v3 - 1377131489) <= 0x10 && ((1 << (v3 + 31)) & 0x12105) != 0)
  {
    v8 = a3 & 0xFFFFFFFFFFFFFFFLL;
    if (v8)
    {
      if (v8 == 3)
      {
        v9 = a1 ^ (a1 - 255);
        v10 = a1 + v4;
        v11 = (*(uint64_t (**)())(v6 + 48 * a3 + 8))();
        __asm { BR              X8 }
      }
      __asm { BR              X2 }
    }
    __asm { BR              X11 }
  }
  return a2 ^ 0x8A5F98FF;
}

void sub_1B7754F40(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }
}

uint64_t sub_1B7754FC0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((*(_DWORD *)(v2 - 0x1E6EF7153090DAELL) & 1) == 110
                                                                                          * ((a1 - 210732126) & 0xC8F83FC ^ 0x1FF)
                                                                                          - 770)
                                          * (191 * ((a1 - 210732126) & 0xC8F83FC ^ 0x1FD) + 209)) ^ (a1 - 210732126) & 0xC8F83FC))
                            - 12))();
}

uint64_t sub_1B7755030(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2
                                                    + 8
                                                    * ((35
                                                      * (*(_DWORD *)(v3 - 0x1E6EF7153090DB6) - 572615245 == ((((v1 - 698) | 0x211) - 230) ^ v1 ^ 0x271))) ^ v1)))(a1, *(_QWORD *)(v3 - 0x1E6EF7153090DC2));
}

void sub_1B77550A4(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  unint64_t v7;
  _BYTE v8[80];

  v6 = v2 ^ 0x1E2;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 8 * (v2 ^ 0x2E3)))(**(unsigned int **)(v3 + 8 * (v2 ^ 0x29F)), a1, *(_DWORD *)(v5 - 0x1E6EF7153090DBALL) + (v2 ^ 0x1E2 ^ (a2 + 85)));
  v7 = ((unint64_t)v8 ^ 0xBDEFDFB75FFFFE3FLL)
     + 0x7FF7FDEFB5FE62C1
     + ((2 * (_QWORD)v8) & 0x7BDFBF6EBFFFFC70);
  *(_BYTE *)(v5 - 0x1E6EF7153090DA3) = (v7 ^ 0xBA) * (v7 + 17);
  __asm { BR              X15 }
}

void sub_1B7755264()
{
  JUMPOUT(0x1B7755234);
}

void sub_1B7755270()
{
  int v0;
  uint64_t v1;

  (*(void (**)(void))(v1 + 8 * (v0 - 375)))();
  JUMPOUT(0x1B7755288);
}

void sub_1B77552A4(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1B7755348@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((97 * (*v1 == ((a1 + 1999959310) & 0x88CB0AF2 ^ 0x212))) ^ a1))
                            - ((a1 + 95) ^ 0x274)))();
}

uint64_t sub_1B77553B0()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 == ((v0 - 2059879331) & 0x7AC745FD ^ 0x46D)) * (v0 ^ 0x232)) ^ v0)))();
}

uint64_t sub_1B77553F4()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  unsigned int *v4;
  int v5;
  uint64_t v6;

  v5 = v0 ^ 0x62;
  v6 = v3(*v4);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (((*v1 == ((v5 - 2059879331) & 0x7AC745FD ^ 0x46D)) * (v5 ^ 0x232)) ^ v5)))(v6);
}

uint64_t sub_1B7755448()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int *v3;
  uint64_t result;

  result = v2(*v3);
  *v1 = 0;
  *(_DWORD *)v0 = 0;
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 352) = 0;
  *(_DWORD *)(v0 + 360) = 638866193;
  *(_DWORD *)(v0 + 56) = 2040561642;
  return result;
}

void g9eargdzvoj3()
{
  _DWORD v0[8];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  v0[0] = 108757529 * ((1554552142 - (v0 | 0x5CA8954E) + (v0 | 0xA3576AB1)) ^ 0x43CB089A)
        + 1695027452;
  sub_1B778DF28(v0);
  __asm { BR              X8 }
}

uint64_t sub_1B775556C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  a14 = 479 - 460628867 * ((&a12 & 0x11E81363 | ~(&a12 | 0x11E81363)) ^ 0xA2816EE1);
  a12 = &STACK[0x6A4735A87A2643ED];
  sub_1B7787F10((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15
                                                                              + v18
                                                                              + *(_QWORD *)(v17
                                                                                          + 8
                                                                                          * ((101 * (a13 == v14)) ^ v16))))(v19, v20, v21, v22, v23);
}

uint64_t sub_1B77555F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a14 = v15;
  a15 = a10;
  a12 = 1178560073
      * (((&a12 | 0xD0FE0D10) - &a12 + (&a12 & 0x2F01F2E8)) ^ 0x6A6A7572)
      + 551;
  v19 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v17 + 1376) - 12))(&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((950 * (a13 == ((v16 - 411) ^ 0x2A7))) ^ 0x4B6u))
                                          - 8))(v19);
}

uint64_t sub_1B77556B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, int a15)
{
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = 3804331 * (v20 ^ 0x698B7B55FA9EF356);
  a15 = v21 + v19 - 43;
  a13 = v21 + 0x33B8EB9294F2A65DLL * v15 + 0x2420EE4103E21B62;
  a14 = a10;
  v22 = ((uint64_t (*)(int *))(*(_QWORD *)(v17 + 8 * (v19 ^ 0x4BD)) - 4))(&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * (((8 * (a12 != v16)) | (32 * (a12 != v16))) ^ v19))
                                          - 97 * (v19 ^ 0x499)
                                          + 671))(v22);
}

uint64_t sub_1B7755760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, int a15, unsigned int a16, unint64_t *a17)
{
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  v20 = 18 * (v19 ^ 0x4DD);
  v21 = 1759421093
      * (((&a12 | 0x805BE6CF) - &a12 + (&a12 & 0x7FA41930)) ^ 0x3326569B);
  a12 = -1796198107 - v21;
  a17 = &STACK[0x722739E86E9FC718];
  a14 = a10;
  a15 = v21 ^ 0x655A87F7;
  a16 = v21 + v20 + 2138962154;
  v22 = sub_1B778D6D8((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((728 * (a13 == v17 + v20 - 527 - 679)) ^ v20))
                                          - 8))(v22);
}

uint64_t sub_1B7755838()
{
  int v0;
  void (*v1)(unsigned int *);
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unint64_t *v7;
  unint64_t *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t *v12;
  unint64_t *v13;

  v4 = 97 * (v0 ^ 0x4B1);
  v10 = (v0 - 68) ^ (1374699841
                   * (((&v10 ^ 0x134432AE) & 0x95A0AE03 | ~(&v10 ^ 0x134432AE | 0x95A0AE03)) ^ 0x14EF7B5B));
  v12 = &STACK[0x31FD77B69BC3E0F9];
  v13 = v7;
  (*(void (**)(unsigned int *))(v3 + 8 * (v0 - 1083)))(&v10);
  v12 = v7;
  v10 = v0 + 1225351577 * (((&v10 | 0x4BC931BB) + (~&v10 | 0xB436CE44)) ^ 0x3536AB88) - 151;
  sub_1B774F090((uint64_t)&v10);
  if (v11 == v2 + v4 - 679)
    v5 = v9;
  else
    v5 = v11;
  v12 = v7;
  v11 = v0 + 535753261 * (&v10 ^ 0xAF40E2F) - 605;
  v1(&v10);
  v12 = v8;
  v11 = v4 + 535753261 * (((&v10 | 0x2E820EE1) - (&v10 & 0x2E820EE1)) ^ 0x247600CE) - 78;
  v1(&v10);
  return v5 ^ v2;
}

void sub_1B77559EC(uint64_t a1)
{
  int v1;

  v1 = ((*(_DWORD *)(a1 + 16) ^ (235795823 * ((a1 + 1866794728 - 2 * (a1 & 0x6F4506E8)) ^ 0xFBE84FB1))) + 540961611) & 0xDFC1933B;
  __asm { BR              X26 }
}

uint64_t sub_1B7755BB8(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (((v11 + 1 == (((a2 ^ a1) * a3) ^ a7) * a8 - 85)
                                          * (((((a2 ^ a1) * a3) ^ a6) * v8) ^ v10)) ^ ((a2 ^ a1) * a3)))
                            - 8))();
}

uint64_t sub_1B7755C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;

  *(_DWORD *)(a12 - 0x5CF1D1600198EA00) = 1918212064 - v16;
  v21 = 460628867 * ((((v20 - 136) | 0x6316D9D1) - (v20 - 136) + ((v20 - 136) & 0x9CE92628)) ^ 0x2F805BAC);
  *(_QWORD *)(v20 - 128) = a13;
  *(_DWORD *)(v20 - 120) = v21 + v19 + 1557;
  *(_DWORD *)(v20 - 136) = 1662039774 - v21;
  sub_1B7780BBC((_DWORD *)(v20 - 136));
  v22 = 535753261 * ((2 * ((v20 - 136) & 0x59E62C60) - (v20 - 136) + 639226782) ^ 0x2CEDDDB1);
  *(_QWORD *)(v20 - 136) = a13;
  *(_DWORD *)(v20 - 128) = v22
                         + ((v19 - 1616904373) & (v17 << 6))
                         + ((32 * v17) ^ 0x4FCFFF67 ^ (v19 + 848495126) & 0xCD6CFDFF)
                         - 167773440;
  *(_DWORD *)(v20 - 124) = v22 + v19 + 1674;
  sub_1B774F1E4(v20 - 136);
  *(_DWORD *)(v20 - 120) = (v19 + 478) ^ (108757529
                                        * ((((v20 - 136) | 0x8BBB1853) - ((v20 - 136) & 0x8BBB1853)) ^ 0x6B277A78));
  *(_QWORD *)(v20 - 136) = a16;
  *(_QWORD *)(v20 - 128) = &STACK[0x709331AC20D1CC49];
  sub_1B774F400(v20 - 136);
  *(_DWORD *)(v20 - 136) = (v19 + 1234) ^ (1374699841
                                         * (((v20 - 136) & 0x864C299C | ~((v20 - 136) | 0x864C299C)) ^ 0x1447CE6A));
  *(_QWORD *)(v20 - 128) = a13;
  *(_QWORD *)(v20 - 120) = a16;
  v23 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (v19 ^ 0x7E)) - 4))(v20 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((234
                                                        * ((*(_DWORD *)(v20 - 132) - 1511092531) >= 0xF3DFEB0F)) ^ v19))
                                          - 4))(v23);
}

uint64_t sub_1B7755E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_DWORD *)(v19 - 120) = (v17 + 456) ^ (108757529
                                        * ((1238286458 - ((v19 - 136) | 0x49CEC07A) + ((v19 - 136) | 0xB6313F85)) ^ 0x56AD5DAE));
  *(_QWORD *)(v19 - 136) = v18;
  *(_QWORD *)(v19 - 128) = a16;
  v20 = sub_1B774F400(v19 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16
                                                      + 8
                                                      * (((16 * (a12 >= ((3 * (v17 ^ 2)) ^ 0x19A))) | ((a12 >= ((3 * (v17 ^ 2)) ^ 0x19A)) << 8)) ^ v17))
                                          - 4))(v20);
}

uint64_t sub_1B7755F30@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  char v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((709
                                          * (((((a1 << (v6 + 101)) ^ v2) + v4 - (v2 & (2 * ((a1 << (v6 + 101)) ^ v2)))) ^ v4) > v1)) ^ v5))
                            - 4))();
}

uint64_t sub_1B7755F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  *(_DWORD *)(v20 - 120) = (v19 - 585) ^ (108757529
                                        * ((((2 * (v20 - 136)) | 0xAAF27EC8) - (v20 - 136) + 713474204) ^ 0x35E55D4F));
  *(_QWORD *)(v20 - 136) = a16;
  *(_QWORD *)(v20 - 128) = v16;
  sub_1B774F400(v20 - 136);
  v21 = 535753261 * ((2 * ((v20 - 136) & 0x2859B5B8) - (v20 - 136) - 676967872) ^ 0xDD52446F);
  *(_DWORD *)(v20 - 128) = v21 + 1171258093;
  *(_DWORD *)(v20 - 124) = v21 + v19 + 611;
  *(_QWORD *)(v20 - 136) = a15;
  sub_1B774F1E4(v20 - 136);
  *(_DWORD *)(v20 - 136) = (v19 + 171) ^ (1374699841
                                        * (((v20 - 136) & 0x5473D2EE | ~((v20 - 136) | 0x5473D2EE)) ^ 0xC6783518));
  *(_QWORD *)(v20 - 128) = a15;
  *(_QWORD *)(v20 - 120) = a16;
  v22 = v17(v20 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((*(_DWORD *)(v20 - 132) <= 0x5A117132u)
                                                        * (((v19 - 1468665022) & 0x578A0AFF) - 700)) ^ (v19 - 538)))
                                          - 8))(v22);
}

uint64_t sub_1B77563CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, int a13)
{
  uint64_t v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8
                                        * ((116
                                          * ((a11 ^ 0x7FDFF1AF)
                                           - 1610846245
                                           + (((590 * (a13 ^ 0xB7)) ^ 0xFFBFE7C2) & (2 * a11))
                                           - 534536588 < 0x7FFFFFFE)) ^ a13))
                            - ((67 * (a13 ^ 0xB8u)) ^ 0x36FLL)))();
}

void sub_1B7756CA4(uint64_t a1)
{
  int v1;
  unsigned int v2;
  _DWORD v4[4];
  unint64_t *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 8) + 1759421093 * ((((2 * a1) | 0x1851ADD4) - a1 - 204003050) ^ 0xBF5566BE);
  v2 = 628203409 * ((2063153396 - (v4 | 0x7AF938F4) + (v4 | 0x8506C70B)) ^ 0x78ECB38);
  v4[0] = v1 + v2 + 1172345383;
  v4[2] = v2 + 2122148333;
  v5 = &STACK[0xD547898781B1454];
  sub_1B7776B68((uint64_t)v4);
  __asm { BR              X14 }
}

uint64_t sub_1B775709C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,char a40,char a41)
{
  int v41;
  int v42;
  uint64_t v43;

  *(_BYTE *)(a7 + (v41 + a3 + v42 - 118)) = a40;
  *(_BYTE *)(a7 + a9 + ((2 * (v42 - 118)) ^ 0xF90A7367)) = a41;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 8 * ((v42 - 118) ^ 0x57)))(a1, a2, a3, a4, a5, a6, a7, a8, a10);
}

uint64_t sub_1B7757138@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(a1 + (v5 + a2 + 1)) = *(_BYTE *)(v7 + (v4 - 1730004585));
  return (*(uint64_t (**)(void))(v8 + 8 * ((1020 * ((((v3 - 356) ^ 0xFFFFFFC8) & v2) == v6)) ^ v3)))();
}

uint64_t sub_1B7757184@<X0>(uint64_t a1@<X6>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  *(_BYTE *)(a1 + (a2 + 2)) = *(_BYTE *)(v14 + ((v12 + 4294967243) & (v13 + 2564962712)));
  v16 = 3804331 * ((v15 - 168) ^ 0xFA9EF356);
  *(_DWORD *)(v15 - 168) = v16 + v12 + 514;
  *(_DWORD *)(v15 - 164) = v16 ^ 0x52980FF6;
  *(_QWORD *)(v15 - 160) = a12;
  v17 = sub_1B776B710(v15 - 168);
  return a11(v17);
}

uint64_t sub_1B77571FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, int a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,unsigned int a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v36;
  uint64_t v37;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, _QWORD))(*(_QWORD *)(v37 + 8 * ((45 * (a13 + ((LODWORD(STACK[0x2D8]) << (a16 + 63)) & 0x2E ^ 0x26) + (STACK[0x2D8] & 0x3F ^ 0x1BCDD3C4u) < 0xFFFFFFC0)) ^ (v36 + 1051))) - 4))(a1, 3893073210, a36, 3875223889, 3347523796, 2945629710, &STACK[0x294], a33);
}

uint64_t sub_1B77572A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;

  v31 = v29 - 466473942;
  if ((v29 - 466473942) <= 0x40)
    v31 = 64;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((22 * (((BYTE4(a14) + 61) ^ (v31 + -v27 - v28 + ((9 * (HIDWORD(a14) ^ 0x641)) ^ 0x1BCDD74Du) < 0xF)) & 1)) ^ HIDWORD(a14))) - 8))(HIDWORD(a14), a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1B7757334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  _BOOL4 v35;

  v33 = v28 + v27 - 466473942;
  if (v33 <= 0x40)
    v34 = 64;
  else
    v34 = v33;
  v35 = !__CFADD__(v33 - 1, v30 + 466473924 + v31 + v34 + 18);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * (v29 ^ ((2 * v35) | (4 * v35)))) - ((v29 + 358423140) & 0xEAA2E1FF ^ ((v29 - 758) - 178))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1B77573C4@<X0>(uint64_t a1@<X1>, int8x16_t *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int8x16_t v31;
  int8x16_t v32;

  *(int8x16_t *)(a6 + (((19 * (v27 ^ 0x1AEu)) ^ 0xFFFFFF2ELL) & (a8 + v29))) = vaddq_s8(vsubq_s8(*a2, vandq_s8(vaddq_s8(*a2, *a2), v31)), v32);
  return ((uint64_t (*)(uint64_t, uint64_t, int8x16_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((677 * (((v28 + 1) & 0x1FFFFFFF0) == 16)) ^ v27)) - 4))(677, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_1B7757444()
{
  JUMPOUT(0x1B77573ECLL);
}

uint64_t sub_1B7757450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;

  v9 = v4 + 409;
  if (v9 <= 0x40)
    v9 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * (v3 ^ (112 * (v7 - v5 - v6 + v9 < 0xF))))
                                                                                       - ((v3 - 691) ^ 0xFFFFFFFFFFFFFA9DLL)
                                                                                       - ((v3 - 173166404) & 0xA5249F7)))(4178210902, 4178210903, a3, 3875223889, 3347523796, 2945629710);
}

uint64_t sub_1B7757504(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  _BOOL4 v10;

  v8 = v4 + v3;
  v9 = v8 + ((v5 + 808) ^ (a3 + 1564));
  if (v9 <= 0x40)
    v9 = 64;
  v10 = __CFADD__(a3 + v8 + 408, v6 + v9);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((v10 * (((v5 - 359) | 0x400) - 1001)) ^ v5)) - 8))();
}

uint64_t sub_1B7757560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,arg33_1B7757560 a33)
{
  unsigned int v33;
  uint64_t v34;

  *(_OWORD *)(a2 + ((92 * (v33 ^ 0x48B) + 4294966927) & (a3 + a1))) = *(_OWORD *)&a33.arr[4];
  return ((uint64_t (*)(void))(*(_QWORD *)(v34 + 8 * ((21 * (((a31 + 1) & 0x1FFFFFFF0) == 16)) ^ v33)) - 4))();
}

void sub_1B77575CC()
{
  JUMPOUT(0x1B775758CLL);
}

uint64_t sub_1B77575D8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (1481 * (v0 == v1))))
                            - ((v2 + 568254066) & 0xDE21241D)
                            + 1016))();
}

uint64_t sub_1B7757634@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X6>, int a4@<W8>)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(a3 + (a4 + a1)) = *(_BYTE *)(v5 + v7 + v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((((a4 + a2) > 0x3F) * v6) ^ v4)) - 8))();
}

uint64_t sub_1B7757678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unint64_t a28)
{
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v43;
  BOOL v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t);

  v48 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v32 + 8 * v28);
  v47 = v29;
  v35 = STACK[0x2E0];
  v36 = STACK[0x2E0];
  v37 = STACK[0x2E4];
  v38 = STACK[0x2E8];
  v39 = STACK[0x2E4];
  v40 = STACK[0x2E8];
  v41 = LOBYTE(STACK[0x2F4]) ^ 0x5Cu;
  if ((_DWORD)v41 == 2)
  {
    v46 = (unint64_t)&STACK[0x294] < a28 && v33 < (unint64_t)&STACK[0x2D4];
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v32
                                                        + 8
                                                        * ((((v46 ^ (v30 - 67)) & 1)
                                                          * ((115 * (v30 ^ 0x3F)) ^ 0x4C2)) ^ (v30 + 1701)))
                                            - 4))(1661390);
  }
  else if ((_DWORD)v41 == 1)
  {
    v43 = (unint64_t)&STACK[0x294] >= a28 || v33 >= (unint64_t)&STACK[0x2D4];
    return ((uint64_t (*)(_QWORD, uint64_t, unint64_t *))(*(_QWORD *)(v32
                                                                                    + 8
                                                                                    * (((2 * v43) | (v43 << 6)) ^ (v30 + 1503)))
                                                                        - (((v30 - 52) | 0x325u) ^ 0x32DLL)))((v30 + 240) | 0x201u, 1062526751, &STACK[0x294]);
  }
  else
  {
    LODWORD(STACK[0x2DC]) = 2 * (LODWORD(STACK[0x2DC]) ^ v34) + v34 - (v31 & (4 * (LODWORD(STACK[0x2DC]) ^ v34)));
    LODWORD(STACK[0x2E0]) = (v36 ^ v34) + (v35 ^ v34) + v34 - (v31 & (2 * ((v36 ^ v34) + (v35 ^ v34))));
    LODWORD(STACK[0x2E4]) = (v39 ^ v34) + (v37 ^ v34) + v34 - (v31 & (2 * ((v39 ^ v34) + (v37 ^ v34))));
    LODWORD(STACK[0x2E8]) = (v40 ^ v34) + (v38 ^ v34) + v34 - (v31 & (2 * ((v40 ^ v34) + (v38 ^ v34))));
    return v48(v41, 3893073210, &STACK[0x294], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             v47,
             a25,
             a26,
             a27,
             a28);
  }
}

uint64_t sub_1B7758454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,unsigned int a31,unsigned int a32,unsigned int a33,uint64_t a34,uint64_t a35,int a36)
{
  int v36;
  uint64_t v37;
  _BOOL4 v38;

  if (a33 < a32 != a36 + 2140405903 < a31)
    v38 = a36 + 2140405903 < a31;
  else
    v38 = a36 + 2140405903 > a33;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37
                                                                        + 8
                                                                        * ((v38 * (((v36 + 32) | 0x83) ^ 0xDD)) | (v36 + 1041)))
                                                            - 4))(a1, a2, a34);
}

uint64_t sub_1B77584E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((262 * (((v7 ^ 0x241 ^ (v5 + a5 + 63 < (v5 + a5))) & 1) == 0)) ^ v7))
                            - 4))();
}

uint64_t sub_1B7758528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int8x16_t *a7)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int8x16_t v11;
  int8x16_t v12;

  *a7 = vaddq_s8(vsubq_s8(*(int8x16_t *)(a3 + (v7 + a5)), vandq_s8(vaddq_s8(*(int8x16_t *)(a3 + (v7 + a5)), *(int8x16_t *)(a3 + (v7 + a5))), v11)), v12);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (v9 ^ (v8 + 581))) - 4))();
}

uint64_t sub_1B7758580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  *(_BYTE *)(a7 + v8) = *(_BYTE *)(a3 + (v7 + a5))
                      - ((2 * *(_BYTE *)(a3 + (v7 + a5))) & 0xC7)
                      + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (((v8 == 63) * (((v12 + v9) & v10) - 19)) ^ v12)) - 4))();
}

uint64_t sub_1B77585D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24)
{
  int v24;
  uint64_t v25;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25
                                                                        + 8
                                                                        * ((31
                                                                          * ((((a24 - 1730004528) < 0xFFFFFFFB) ^ (v24 + 84 + v24 + 1)) & 1)) ^ (v24 + 1266)))
                                                            - 8))(a1, a2, a3);
}

void sub_1B7758638()
{
  JUMPOUT(0x1B775777CLL);
}

uint64_t sub_1B7758668(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;

  v11 = a8 < a2;
  if (v11 == v8 + a6 < ((v9 - 1285982526) & 0x4CA68DFE ^ (a2 - 1176)))
    v11 = v8 + a6 < a8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((58 * v11) ^ v9)) - 4))();
}

uint64_t sub_1B77586D8@<X0>(unsigned int a1@<W1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, int a5@<W5>, uint64_t a6@<X6>, unsigned int a7@<W7>, int a8@<W8>)
{
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  int v16;
  _BOOL4 v17;

  v14 = a7 < a1;
  *(_BYTE *)(a6 + a8 + a3 + ((v9 + v11) & v12)) = *(_BYTE *)(a2 + (v8 + a4))
                                                - ((2 * *(_BYTE *)(a2 + (v8 + a4))) & 0xC7)
                                                + 99;
  v15 = v8 + 1 + a5;
  v16 = v14 ^ (v15 < a1);
  v17 = v15 < a7;
  if (!v16)
    v14 = v17;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((v14 * v10) ^ v9)) - 4))();
}

uint64_t sub_1B7758748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v21 = 3804331 * ((~((v20 - 168) | 0x6760E8E7) + ((v20 - 168) & 0x6760E8E7)) ^ 0x6201E44E);
  *(_QWORD *)(v20 - 160) = a18;
  *(_DWORD *)(v20 - 168) = v21 + v18 - 866;
  *(_DWORD *)(v20 - 164) = v21 ^ a14;
  v22 = sub_1B776B710(v20 - 168);
  v23 = STACK[0x2D8] & 0x3F;
  *((_BYTE *)&STACK[0x294] + (v23 ^ 0x13)) = -29;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v19
                                                     + 8
                                                     * ((((v23 ^ 0x13) < 0x38) * ((v18 ^ 0x8E) - 1256)) ^ v18)))(v22, 3893073210);
}

uint64_t sub_1B7758840()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v0 - 1583842651) > 0x37) * (((v1 + 214) | 0x220) ^ 0x31D)) ^ (v1 + 1377)))
                            - 12))();
}

uint64_t sub_1B7758890()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = v0;
  v5 = v0 + v2;
  if (v5 <= 0x38)
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((105
                                          * (v5 - v4 + ((v1 + 314) ^ 0x5E67813FLL) >= (unint64_t)(13 * (v1 ^ 0x32Eu)) - 44)) ^ v1))
                            - 12))();
}

uint64_t sub_1B77588F4@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a1 + v3 + (((a2 - 1084) | v5) ^ (unint64_t)(v4 - 279))) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((230 * ((v2 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ a2)) - 4))();
}

void sub_1B7758938()
{
  JUMPOUT(0x1B7758904);
}

uint64_t sub_1B7758944(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * ((56 * (v2 == ((v3 - 1280) ^ 0x29))) ^ v3)))(23, a2, 1014);
}

uint64_t sub_1B7758984@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((123 * ((((v1 ^ 0x604) - 1510) ^ a1) < 8)) ^ v1 ^ 0x604))
                            - ((((v1 ^ 0x604) - 1506) | 4u) ^ 0x30)))();
}

uint64_t sub_1B77589C4@<X0>(char a1@<W8>, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a2 + v2) = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((a1 & 0x38) == 8) * (((v3 - 710) ^ 0x3EF) - 117)) ^ (v3 - 710))))();
}

uint64_t sub_1B7758A04()
{
  int v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 == 0) * v2) ^ v0)))();
}

uint64_t sub_1B7758A24@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 + 8 * (v2 ^ (117 * (v3 == a2))))
                                                            - ((v2 + 648887964) & 0xD952C0D6)
                                                            - ((2 * v2) ^ 0xFFFFFFFFFFFFFEB4)))(23, a1, 1014);
}

uint64_t sub_1B7758A88(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v7 + v10 + a7 - 1) = v9;
  return (*(uint64_t (**)(void))(v11 + 8 * ((((unint64_t)(v7 + v10) < 0x40) * a3) ^ (v8 + 1274))))();
}

void sub_1B7758AC0()
{
  JUMPOUT(0x1B7757768);
}

uint64_t sub_1B7758AD0()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)((((13 * (v2 ^ 0x32E)) ^ 0x6BC) * (v0 == v1)) ^ v2))
                            - (v2 ^ 0x326)))();
}

uint64_t sub_1B7758B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)(v8 + v11 + a7 - 1) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((((unint64_t)(v8 + v11) < 0x38) * v10) ^ (v7 + 1390)))
                            - 12))();
}

void sub_1B7758B4C()
{
  char v0;
  int v1;
  unsigned int v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;

  v1 = LOBYTE(STACK[0x2F4]) ^ 0x5C;
  if (v1 == 1)
  {
    v5 = STACK[0x2D8];
    v6 = STACK[0x2D4];
    v7 = (LODWORD(STACK[0x2D8]) >> 5) ^ 0xFFFFFFAC;
    LOBYTE(STACK[0x2CC]) = ((8 * LOBYTE(STACK[0x2D8])) ^ 0x98) - ((16 * LOBYTE(STACK[0x2D8])) & 0xC0) + 99;
    LOBYTE(STACK[0x2CD]) = v7 - ((v7 << ((v0 ^ 0xD7) + 30)) & 0xC6) + 99;
    LOBYTE(STACK[0x2CE]) = ((v5 >> 13) ^ 0x41) - 2 * (((v5 >> 13) ^ 0x41) & 0xE7 ^ (v5 >> 13) & 4) + 99;
    LOBYTE(STACK[0x2CF]) = ((v5 >> 21) ^ 0x4D) - ((2 * ((v5 >> 21) ^ 0x4D)) & 0xC7) + 99;
    HIDWORD(v8) = v6 ^ 0x12;
    LODWORD(v8) = v5 ^ 0xC0000000;
    LOBYTE(STACK[0x2D0]) = (v8 >> 29) + (~(2 * (v8 >> 29)) | 0x39) + 100;
    LOBYTE(STACK[0x2D1]) = ((v6 >> 5) ^ 0xEB) - 2 * (((v6 >> 5) ^ 0xEB) & 0xE7 ^ (v6 >> 5) & 4) + 99;
    LOBYTE(STACK[0x2D2]) = ((v6 >> 13) ^ 0xC2) - 2 * (((v6 >> 13) ^ 0xC2) & 0xE7 ^ (v6 >> 13) & 4) + 99;
    v4 = ((v6 >> 21) ^ 0x68) - ((2 * ((v6 >> 21) ^ 0x68)) & 0xFFFFFFC7) + 99;
  }
  else
  {
    if (v1 != 2)
      goto LABEL_6;
    v4 = STACK[0x2D4];
    v2 = STACK[0x2D8];
    LOBYTE(STACK[0x2CC]) = ((LODWORD(STACK[0x2D4]) >> 21) ^ 0x68)
                         - ((2 * ((LODWORD(STACK[0x2D4]) >> 21) ^ 0x68)) & 0xC7)
                         + 99;
    LOBYTE(STACK[0x2CD]) = ((v4 >> 13) ^ 0xC2)
                         - ((((v4 >> 13) ^ 0xFFFFFFC2) << ((((v0 - 20) | 0xC3) ^ 0x20) & 0x3D)) & 0xC6)
                         + 99;
    HIDWORD(v3) = v4 ^ 0x12;
    LODWORD(v3) = v2 ^ 0xC0000000;
    LOBYTE(STACK[0x2CE]) = ((v4 >> 5) ^ 0xEB) - 2 * (((v4 >> 5) ^ 0xEB) & 0xE7 ^ (v4 >> 5) & 4) + 99;
    LOBYTE(STACK[0x2CF]) = (v3 >> 29) - ((2 * (v3 >> 29)) & 0xC7) + 99;
    LOBYTE(STACK[0x2D0]) = ((v2 >> 21) ^ 0x4D) - ((2 * ((v2 >> 21) ^ 0x4D)) & 0xC7) + 99;
    LOBYTE(STACK[0x2D1]) = ((v2 >> 13) ^ 0x41) - 2 * (((v2 >> 13) ^ 0x41) & 0xE7 ^ (v2 >> 13) & 4) + 99;
    LOBYTE(STACK[0x2D2]) = ((v2 >> 5) ^ 0xAC) - ((2 * ((v2 >> 5) ^ 0xAC)) & 0xC7) + 99;
    LOBYTE(v4) = ((8 * v2) ^ 0x98) + (~(16 * v2) | 0x3F) + 100;
  }
  LOBYTE(STACK[0x2D3]) = v4;
LABEL_6:
  JUMPOUT(0x1B7757778);
}

uint64_t sub_1B7758DC4@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1120 * (v1 - 1730004639 + 13 * ((a1 | 0x10) ^ 0x19Cu) < 4)) | a1 | 0x10)))();
}

uint64_t sub_1B7758E04@<X0>(unsigned int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  LOBYTE(STACK[0x294]) = *(_BYTE *)(v3 + a1);
  return (*(uint64_t (**)(void))(v4 + 8 * ((918 * (((v2 - 356) ^ 0x98E239A2) + v1 < 4)) ^ v2)))();
}

void sub_1B7758E40()
{
  JUMPOUT(0x1B77570CCLL);
}

uint64_t sub_1B7758E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  unsigned int v38;
  uint64_t v39;
  unint64_t v41;

  if (a33 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t *))(*(_QWORD *)(v39
                                                                                              + 8
                                                                                              * (int)((116 * (LODWORD(STACK[0x2F0]) == ((v38 - 2145035391) & 0x7FDAA7CF ^ 0x3D0B612C))) ^ (v38 + 849)))
                                                                                  - 4))(a16, a2, a3, &STACK[0x284]);
  if (a33 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(_QWORD *)(v39 + 8 * (int)((1997 * (LODWORD(STACK[0x2F0]) != ((v38 + 957) ^ 0x3D0B6158))) ^ (v38 + 957)))
                                                                                           - 4))(a1, a2, a3, &STACK[0x284], a16);
  v41 = (((v38 ^ 0x40F) - 0x63010A850442083ELL) ^ (unint64_t)&a38)
      + ((2 * (_QWORD)&a38) & 0x39FDEAF5F77BF7F0)
      + 0x637DABFFAEFABF03;
  LOBYTE(STACK[0x2EF]) = (v41 ^ 0xBA) * (v41 + 17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(_QWORD *)(v39 + 8 * (int)(v38 ^ 0x40F))
                                                                                         - v38
                                                                                         + 40))(a1, a2, a3, &STACK[0x284], a16);
}

void sub_1B77591C4()
{
  JUMPOUT(0x1B7759188);
}

uint64_t sub_1B77591CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t v11;

  v6 = v10[2];
  v7 = *v10;
  memset(a4, 99, 16);
  v8 = 235795823 * (((v5 - 168) & 0x4A404AB8 | ~((v5 - 168) | 0x4A404AB8)) ^ 0x2112FC1E);
  *(_QWORD *)(v5 - 128) = &STACK[0x74538802C908DFAF];
  *(_DWORD *)(v5 - 160) = v8 + 1157248585;
  *(_QWORD *)(v5 - 168) = v6;
  *(_DWORD *)(v5 - 132) = (v4 + 1706) ^ v8;
  *(_QWORD *)(v5 - 152) = &v11;
  *(_QWORD *)(v5 - 144) = v7;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (v4 ^ 0x82)) - 12))(v5 - 168);
  *((_DWORD *)v10 + 7) = *(_DWORD *)(v5 - 136);
  return result;
}

uint64_t sub_1B77592CC(_DWORD *a1)
{
  unsigned int v1;
  int v2;

  v1 = 1374699841 * ((-2 - ((a1 | 0xA88133EE) + (~(_DWORD)a1 | 0x577ECC11))) ^ 0x3A8AD418);
  v2 = *a1 ^ v1;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + (v2 ^ 0x64E))
                                        + 8 * ((((a1[4] ^ v1 ^ 0x75A0C321) - 1 > 0x62) * ((v2 - 1054) ^ 0x223)) ^ v2)
                                        - 4)
                            - (((v2 - 1666) | 0x264u) ^ 0x278)))();
}

uint64_t sub_1B775937C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1164 * (v0 - 100 >= (v1 - 480))) ^ v1)) - 8))();
}

uint64_t sub_1B77593AC@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;

  if (v2 + 49998 < ((v4 - 484) | 0x602u) + 6308)
    v3 = a2;
  *(_DWORD *)(*(_QWORD *)(result + 8) - 0x76D4F6DCACF2CD9ELL) = v3;
  return result;
}

void sub_1B7759434(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 24) != 0x1E6EF7153090DC2
    && *(_QWORD *)(a1 + 8) != 0xB36971A36B56DBCLL
    && *(_QWORD *)(a1 + 40) != 0xE249DD063F19B7CLL;
  v1 = *(_DWORD *)a1 - 1224239923 * ((-2 - ((~(_DWORD)a1 | 0x50890EB9) + (a1 | 0xAF76F146))) ^ 0xA23AF36E);
  __asm { BR              X9 }
}

uint64_t sub_1B7759554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19
                                                                                          + 8
                                                                                          * ((880
                                                                                            * (*(_DWORD *)(a19 - 0x1E6EF7153090DAALL) == 1973469985)) ^ v20))
                                                                              - 6 * (v20 ^ 0xADu)
                                                                              + 368))(a1, a2, a3, a4, a5);
}

uint64_t sub_1B77595B0@<X0>(int a1@<W8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  __n128 v20;
  __n128 v21;
  _BOOL4 v22;
  unsigned int v24;

  v19 = 27 * (v16 ^ 0x165);
  v24 = *(_DWORD *)(a16 - 0x1E6EF7153090DB2) - 924100996;
  *(_DWORD *)(v18 - 140) = (~(21519946 * (*(_DWORD *)(a11 + 32) - a1) + 35656958) | 0xFDD4A079)
                         - 425447643 * (*(_DWORD *)(a11 + 32) - a1)
                         + 1243986499;
  v20.n128_u64[0] = 0xC6C6C6C6C6C6C6C6;
  v20.n128_u64[1] = 0xC6C6C6C6C6C6C6C6;
  v21.n128_u64[0] = 0x6363636363636363;
  v21.n128_u64[1] = 0x6363636363636363;
  v22 = v24 < (v19 ^ 0x34B20DB1u);
  if (v22 == (v19 + 884083375) < 0x34B20C7A)
    v22 = v19 + 884083375 < v24;
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v17
                                                                                             + 8
                                                                                             * ((!v22 * (v19 ^ 0x1E5)) ^ v19))
                                                                                 - 12))(a2, a3, a4, a5, v20, v21);
}

uint64_t sub_1B77597F0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _DWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v26;

  v23 = 1178560073 * ((((v22 - 136) | 0x713482D) + (~(v22 - 136) | 0xF8ECB7D2)) ^ 0xBD87304E);
  *(_DWORD *)(v22 - 136) = v23 + a2 - a13 + 1754976943;
  *(_DWORD *)(v22 - 132) = v23 + ((a2 - 1196935083) & 0xFFFFFFF0) + 5875204;
  *(_QWORD *)(v22 - 128) = a20;
  *(_DWORD *)(v22 - 120) = (v20 + 1517) ^ v23;
  v26 = v20;
  v24 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + v20 - 72) - 4))(v22 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((700 * (*a14 == 1973469985)) ^ v26)) - 4))(v24);
}

uint64_t sub_1B77598D0(__n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v21;
  uint64_t v22;
  __n128 v23;
  __n128 v24;

  HIDWORD(a21) = a21 + v21 - 50 + 1599272632;
  v23.n128_u64[0] = 0xC6C6C6C6C6C6C6C6;
  v23.n128_u64[1] = 0xC6C6C6C6C6C6C6C6;
  v24.n128_u64[0] = 0x6363636363636363;
  v24.n128_u64[1] = 0x6363636363636363;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * ((v21 - 50) ^ (1431 * (a16 < 0xFFFFFFFE)))) - ((v21 - 793227956) & 0x2F47B27D) - ((49 * ((v21 - 50) ^ 0x62u)) ^ 0xFFFFFFFFFFFFFF38)))(3002557221, 2165682115, 1292410075, 950042527, 413609243, 3554061395, 41, 3881358053, a1, a2, a3, a4, v23, v24, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21);
}

uint64_t sub_1B775999C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  unsigned int v22;

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * v14) + (v14 + 475) - 580);
  v21 = *v19;
  v22 = a1 + 1292410075;
  *(_BYTE *)(*v19 + v22) = 99;
  *(_BYTE *)(v21 + v22 + 1) = (v17 ^ 0xEE) + (v16 | ~(2 * (v17 ^ 0xEE))) + 100;
  *(_BYTE *)(v21 + (a1 + 1292410077)) = 122;
  *(_BYTE *)(v21 + v22 + 3) = v15 ^ 0x9B;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_1B7759DCC()
{
  JUMPOUT(0x1B7759D4CLL);
}

void sub_1B7759DE0()
{
  JUMPOUT(0x1B7759D4CLL);
}

uint64_t sub_1B7759DFC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23)
{
  uint64_t v23;
  int v24;
  int v25;
  unsigned int v26;

  v26 = (a23 ^ v25) + ((v24 - 83) ^ 0x218) - (((a23 ^ v25) << (((v24 - 83) | 0x21) ^ 0x60)) & 0xD908305E) - 326887977;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23
                                        + 8
                                        * ((245
                                          * (((2 * v26) & 0x7D70FF3E ^ 0x5900301E) + (v26 ^ 0x523C67B0) + 2045247488 != a4)) ^ (v24 + 1000)))
                            - 4))();
}

uint64_t sub_1B7759EAC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8 * (v3 | ((v1 + v0 + ((v3 - 453) ^ 0x414780F2u) > 7) << 8)))
                                          - 97 * (v3 ^ 0x25Eu)
                                          + 574))(v2);
}

uint64_t sub_1B7759F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v23
                                                      + 8
                                                      * (((((487 * (a5 ^ 0x245) - 1444) | 0x82) - 117)
                                                        * ((unint64_t)(a21 - v21 - a3 - 0x36BFEA2E21032E05) < 0x20)) ^ a5))
                                          - 8))(v22);
}

uint64_t sub_1B7759F78(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((100 * (v4 < ((a4 - 1461) | 0xC0u) - 160)) ^ a4)) - 8))();
}

uint64_t sub_1B7759FA8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int8x8_t v11;
  int8x8_t v12;
  unsigned int v13;
  int8x8_t v14;

  v13 = v7 + 1095204960 + v6 - v9;
  v14 = vrev64_s8(*(int8x8_t *)(v4 - 7 + v13));
  *(int8x8_t *)(v3 - 7 + v13) = vrev64_s8(vadd_s8(vsub_s8(v14, vand_s8(vadd_s8(v14, v14), v11)), v12));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v10
                                                     + 8
                                                     * (((v9 - (v5 & 0xFFFFFFF8) == -8) * (((a3 - 189) | 0x10C) ^ 0x484)) ^ a3))
                                         - 12))(v8 - (v5 & 0xFFFFFFF8));
}

void sub_1B775A028()
{
  JUMPOUT(0x1B7759FD8);
}

uint64_t sub_1B775A034()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 ^ (956 * (v0 - v2 != -1024858990)))) - 8))();
}

uint64_t sub_1B775A0AC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1392 * (v0 != v1 + 281128479)) ^ v1)) - 8))();
}

uint64_t sub_1B775A0E4@<X0>(int a1@<W7>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;

  *(_BYTE *)(*v7 + (v5 + a1)) = *(_BYTE *)(*v7 + (a2 + v4 + 566));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v2 != 281128577) * (v3 ^ 0x511)) ^ v3)) - 8))();
}

uint64_t sub_1B775A148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25)
{
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  _BOOL4 v33;

  v29 = (v27 - 379) | 0x13;
  v30 = v25 - 281128685 + v26 - 480367769;
  v31 = ((v29 + 253) ^ 0x7797756C) + a25;
  v32 = (v31 < 0xBEEF3CA7) ^ (v30 < 0xBEEF3CA7);
  v33 = v30 < v31;
  if (v32)
    v33 = v31 < 0xBEEF3CA7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v28 + 8 * ((37 * !v33) ^ (v29 + 501))) - 8))();
}

void sub_1B775A408()
{
  JUMPOUT(0x1B775A424);
}

uint64_t sub_1B775A4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  _BOOL4 v22;

  *(_BYTE *)(*v21 + (v18 + a8)) = -29;
  v22 = v18 + 1645682333 < (a18 + 460018862);
  if ((a18 + 460018862) < 0x7ABE4BB7 != (v18 + 1645682333) < 0x7ABE4BB7)
    v22 = (a18 + 460018862) < 0x7ABE4BB7;
  return (*(uint64_t (**)(void))(v20 + 8 * (((((v19 - 256) | 3) ^ 0xB2) * v22) | v19)))();
}

uint64_t sub_1B775A574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD *v14;
  _BOOL4 v15;
  int v16;

  v15 = v12 < v8;
  v16 = v9 + 1;
  *(_BYTE *)(*v14 + (v16 + a8)) = 99;
  if (v15 == v16 + v10 < v8)
    v15 = v16 + v10 < v12;
  return (*(uint64_t (**)(void))(v13 + 8 * ((v15 * (v11 - 367)) | v11)))();
}

void sub_1B775A5C4(int a1@<W8>)
{
  _QWORD *v1;
  unsigned int v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 - 0xB36971A36B56DBCLL) = *v1;
  *(_DWORD *)(v5 - 0xE249DD063F19B7CLL) = a1;
  *v1 = 0;
  *(_QWORD *)(v8 - 0x1E6EF7153090DBALL) = 0x22216A4D22216A4DLL;
  *v3 = 1808184830;
  v2 = (((2 * (*(_DWORD *)(v8 - 0x1E6EF7153090DAELL) & 0xFFFFFFFE ^ 0x3D281E8)) | 0x1714C5EC)
      - (*(_DWORD *)(v8 - 0x1E6EF7153090DAELL) & 0xFFFFFFFE ^ 0x3D281E8)
      - 193618678) ^ 0x4BCABA30;
  *(_DWORD *)(v8 - 0x1E6EF7153090DAELL) = (((2 * v2) | 0x41FDCB26) - v2 - 553575827) ^ 0x636CBCBC;
  *(_DWORD *)(v7 + 48) = *v6;
}

void sub_1B775A6FC()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  int v3;

  v0 = MEMORY[0x1E0C80A78]();
  if (*(_QWORD *)v0)
    v2 = *(_QWORD *)(v0 + 16) == 0x722739E86E9FC718;
  else
    v2 = 1;
  v3 = !v2;
  v1 = *(_DWORD *)(v0 + 24) + 1374699841 * ((~(_DWORD)v0 & 0x2CB30A96 | v0 & 0xD34CF569) ^ 0x4147129F);
  __asm { BR              X8 }
}

uint64_t sub_1B775A814()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  int v7;
  uint64_t v8;

  LODWORD(STACK[0x42C]) = v0;
  STACK[0x260] = (unint64_t)&STACK[0x5412677448247EB4];
  *(_QWORD *)(v4 - 184) = &STACK[0x5412677448247EB4];
  STACK[0x258] = (unint64_t)&STACK[0xB0A4D7BDB51EE2D];
  *(_QWORD *)(v4 - 168) = &STACK[0xB0A4D7BDB51EE2D];
  *(_DWORD *)(v4 - 192) = (v1 - 703) ^ (1224239923
                                      * ((v4 - 192 - 2 * ((v4 - 192) & 0x45CC53C4) + 1171018692) ^ 0xB77FAE13));
  *(_BYTE *)(v4 - 160) = (51 * ((v4 + 64 - 2 * ((v4 + 64) & 0xC4) - 60) ^ 0x13)) ^ 0x2E;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (int)(v1 & 0xEB7BC8B4)) - 8);
  STACK[0x250] = (unint64_t)v5;
  v6 = v5(v4 - 192);
  v7 = *(_DWORD *)(v4 - 176);
  v8 = *(_QWORD *)(v3 + 8 * (((v7 != 1973469985) | (2 * (v7 != 1973469985))) ^ v1));
  LODWORD(STACK[0x56C]) = v7;
  return ((uint64_t (*)(uint64_t))(v8
                                          - ((v1 - 665)
                                           + ((v1 + 75) ^ 0xFFFFFFFFFFFFF8ECLL))))(v6);
}

#error "1B775B06C: call analysis failed (funcsize=324)"

uint64_t sub_1B775B070()
{
  unint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  STACK[0x278] = v0;
  STACK[0x2C8] = v2;
  STACK[0x4D0] = 0;
  v6 = 235795823 * ((2 * ((v5 - 192) & 0xED72FD0) - (v5 - 192) + 1898500137) ^ 0xE5859970);
  *(_DWORD *)(v5 - 168) = v6 + v1 - 807;
  *(_DWORD *)(v5 - 184) = 1265877118 - v6;
  *(_QWORD *)(v5 - 192) = 0x15227257BF786DCCLL;
  *(_QWORD *)(v5 - 176) = STACK[0x268];
  *(_QWORD *)(v5 - 160) = STACK[0x270];
  v7 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v1 - 878)) - 8))(v5 - 192);
  return (*(uint64_t (**)(uint64_t))(v4
                                            + 8
                                            * (v1 | (((((v1 + 87) ^ (v1 + 76)) ^ (*(_DWORD *)(v5 - 152) == 1973469985)) & 1) << 6))))(v7);
}

uint64_t sub_1B775B148(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;

  LODWORD(STACK[0x5A0]) = v3;
  STACK[0x530] = STACK[0x420];
  LODWORD(STACK[0x56C]) = v3;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * (((v3 == ((((v2 - 1190) ^ 0x27) + 1227) ^ (v5 + 780)))
                                                                          * ((19 * ((v2 - 1190) ^ 0x27)) ^ 0x69D)) ^ (v2 - 1190)))
                                                            - 12))(a1, a2, 2321520888);
}

void sub_1B775FEC8()
{
  JUMPOUT(0x1B775FEE4);
}

uint64_t sub_1B775FF80()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  *(_DWORD *)(v2 - 192) = v0
                        + 460628867 * ((((2 * (v2 - 192)) | 0x28B09112) - (v2 - 192) - 341330057) ^ 0x58CECAF4)
                        - 231789787;
  nullsub_1(v2 - 192);
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v1
                                     + 8
                                     * ((1954
                                       * (((uint64_t (*)(uint64_t, uint64_t))STACK[0x3C0])(336, 318119320) != 0)) ^ v0))
                         - ((122 * (v0 ^ 0x3E7u) + 32) ^ ((v0 - 985) | 0x110u)));
  return v3();
}

uint64_t sub_1B7760044()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((504
                                * ((((v0 + 24) ^ ((unint64_t)(*(_QWORD *)(v2 + 8 * (v0 - 183)) - 4 - v1) < 0x20)) & 1) == 0)) ^ v0)))();
}

uint64_t sub_1B77600A0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v5 = (335 - v1);
  v6 = *(_OWORD *)(a1 + v5 - 15);
  v7 = *(_OWORD *)(a1 + v5 - 31);
  v8 = v3 + v5;
  *(_OWORD *)(v8 - 15) = v6;
  *(_OWORD *)(v8 - 31) = v7;
  return (*(uint64_t (**)(void))(v4 + 8 * ((626 * (v2 + 1024 + v1 == 1580)) | v2)))();
}

uint64_t sub_1B77600E8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 - 7 + ((v1 - 587) | v2) - 982) = *(_QWORD *)(a1 + ((v1 - 587) | v2) - 982 - 7);
  return (*(uint64_t (**)(void))(v4 + 8 * (v1 - 495)))();
}

uint64_t sub_1B7760130@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + (v1 + v3)) = *(_BYTE *)(a1 + (v1 + v3));
  return (*(uint64_t (**)(void))(v8 + 8 * (((v1 - 1 == (v5 ^ v2) + v6) * v4) ^ v5)))();
}

uint64_t sub_1B7760160()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((25 * (v0 ^ 0x3C4) - 822) * (v1 != 0)) ^ v0))
                            - ((4 * v0) ^ 0xF9CLL)))();
}

uint64_t sub_1B77601A4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (_QWORD *)(v0 - 208);
  STACK[0x458] = v2 + 0x17DD4E171F589EA4;
  *v5 = 0x9C9C9C9C9C9C9C9CLL;
  v5[1] = 0x6363636365636371;
  v6 = 460628867 * ((((v4 - 192) | 0xCC5942B9) + (~(v4 - 192) | 0x33A6BD46)) ^ 0x80CFC0C5);
  *(_DWORD *)(v4 - 188) = v6 + 2107506562;
  *(_DWORD *)(v4 - 184) = (v1 + 1064655866) ^ v6;
  nullsub_1(v4 - 192);
  LODWORD(STACK[0x4C4]) = 1123163055;
  v7 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x3C0])(336, 1690680581);
  STACK[0x510] = v7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * (int)(((((v1 - 120) ^ (v7 == 0)) & 1) * (((v1 + 1081228310) & 0xBF8DC5BC) - 1180)) ^ v1))
                                                                                                - 8))(v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_1B77602AC(unint64_t a1)
{
  int v1;
  unint64_t v2;
  uint64_t v3;

  STACK[0x530] = STACK[0x380] + (v1 + 146) - 1147;
  STACK[0x4E8] = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v1 + 135) ^ (1796 * (v2 > a1)))) - 8))();
}

uint64_t sub_1B7760354@<X0>(uint64_t a1@<X0>, char a2@<W6>, char a3@<W7>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = (v7 + v9);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(v5 + (v12 & 0xF)) ^ *(_BYTE *)(v4 + (v12 & 0xF)) ^ *(_BYTE *)((v12 & 0xF) + a4 + 2) ^ ((*(_BYTE *)(v10 + v12) | 0xC7) + (*(_BYTE *)(v10 + v12) | 0x38) - 26) ^ ((v12 & 0xF) * (((v6 + a2) & a3) + 37));
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((v7 + 1 + v9) < 0x150) * v8) ^ v6)) - 8))();
}

uint64_t sub_1B77603C8@<X0>(uint64_t a1@<X0>, int a2@<W2>, unsigned int a3@<W3>, int a4@<W4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = v9 + a4 + 134 * (v8 ^ a3);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(v6 + (v13 & 0xF)) ^ (*(_BYTE *)(v11 + v13) - 27) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + a6 + 2) ^ ((v13 & 0xF) * a5);
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (((v9 - 1 == v10) * a2) | v8)) - 8))();
}

uint64_t sub_1B7760430(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int8x16_t a37)
{
  int v37;
  int8x16_t *v38;
  uint64_t v39;
  int8x16_t *v40;

  v40 = (int8x16_t *)((char *)&STACK[0x690] + STACK[0x380] - 0x2950B4715420C103);
  v40[-12] = veorq_s8(*v38, a37);
  STACK[0x630] += 32;
  STACK[0x638] = a1;
  STACK[0x640] = a1;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 + 8 * (((((v37 + 198) | 0x1A1) - 1013) * (&v40[-12] == (int8x16_t *)a1)) ^ v37))
                                                                                                - 12))(a1, a2, a3, 247, a5, a6);
}

uint64_t sub_1B77604AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char *v10;
  char v11;
  uint64_t v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  char v22;
  char v23;
  int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned __int8 v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  unsigned __int8 v38;
  int v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  int v49;
  char v50;
  int v51;
  int v52;
  int v53;
  int v54;
  BOOL v55;
  char v56;
  char v57;
  int v58;
  char v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  int v89;
  int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  int v95;
  unsigned int v96;
  int v97;
  int v98;
  int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  int v107;
  int v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  int v113;
  int v114;
  int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  int v124;
  unsigned int v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  int v129;
  int v130;
  unsigned int v131;
  int v132;
  int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  int v139;
  unint64_t v140;
  unsigned int v141;
  int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  int v146;
  unsigned int v147;
  int v148;
  unsigned int v149;
  int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  int v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  int v158;
  unsigned int v159;
  int v160;
  int v161;
  int v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  unsigned int v166;
  unsigned int v167;
  int v168;
  int v169;
  unsigned int v170;
  int v171;
  int v172;
  int v173;
  unsigned int v174;
  int v175;
  int v176;
  int v177;
  unsigned int v178;
  int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  int v187;
  int v188;
  unsigned int v189;
  unsigned int v190;
  int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  int v196;
  unsigned int v197;
  int v198;
  int v199;
  int v200;
  unsigned int v201;
  int v202;
  int v203;
  unsigned int v204;
  unsigned int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  unsigned int v212;
  unsigned int v213;
  int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  unint64_t v221;
  int v222;
  unsigned int v223;
  int v224;
  unsigned int v225;
  int v226;
  char *v227;
  unsigned int v228;
  unsigned int v229;
  int v230;
  char *v231;
  uint64_t v232;
  unsigned int v233;
  int v234;
  int v235;
  int v236;
  char *v237;
  int v238;
  int v239;
  unsigned int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  unsigned int v246;
  char *v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  uint64_t v251;
  char *v252;
  unsigned int v253;
  char *v254;
  int v255;
  int v256;
  int v257;
  int v258;
  unsigned int v259;
  char *v260;
  char v261;
  int v262;
  unint64_t v263;
  unint64_t v264;
  int v265;
  unsigned int v266;
  int v267;
  unsigned int v268;
  unsigned int v269;
  int v270;
  unint64_t v271;
  unsigned int v272;
  int v273;
  unint64_t v275;
  unsigned __int8 *v276;
  int v277;
  int v278;
  char v279;
  int v280;
  char v281;
  unsigned int v282;
  char v283;
  int v284;
  int v285;

  v9 = v4 ^ 0x26B;
  v10 = (char *)&STACK[0x1930] + v5;
  v11 = *(_BYTE *)a1;
  *(_QWORD *)(v10 + 17) = *(_QWORD *)(a1 + 1);
  *(_DWORD *)(v10 + 25) = *(_DWORD *)(a1 + 9);
  *(_WORD *)(v10 + 29) = *(_WORD *)(a1 + 13);
  v10[31] = *(_BYTE *)(a1 + 15);
  v12 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v10 = *(_QWORD *)a1;
  *((_QWORD *)v10 + 1) = v12;
  v10[16] = v11;
  v13 = (unsigned __int8 *)&STACK[0x1930] + v5 + 16;
  v14 = v9 ^ 0x346;
  v15 = *(_QWORD *)(v6 + 8 * (v9 & 0x602DC49A));
  v16 = (*((_BYTE *)&STACK[0x1930] + v5 + 19) ^ 0xB8)
      + *(_BYTE *)(v15 + (((v9 ^ 0x46) - 107) ^ *((_BYTE *)&STACK[0x1930] + v5 + 19)))
      - 64;
  v17 = *(_QWORD *)(v6 + 8 * (v9 - 884)) - 4;
  v18 = *(_QWORD *)(v6 + 8 * (v9 - 962)) - 4;
  LOBYTE(v12) = *(_BYTE *)(v18 + (*((unsigned __int8 *)&STACK[0x1930] + v5 + 26) ^ 0xCBLL));
  v19 = *(_QWORD *)(v6 + 8 * (v9 - 891)) - 4;
  v20 = *(unsigned __int8 *)(v19 + (*((unsigned __int8 *)&STACK[0x1930] + v5 + 17) ^ 0x1ALL));
  v21 = ((((v20 ^ 0x2F) + (v20 & 0xD5 ^ 0xFA) + 1) ^ v20 & 0xDF) >> 4) ^ (v20 >> 1);
  v22 = v21 ^ 0x70;
  v23 = (v21 ^ 0x70) & 0x5B ^ v21 & 8;
  LOBYTE(v21) = *(_BYTE *)(v18 + (*((unsigned __int8 *)&STACK[0x1930] + v5 + 30) ^ 0x86));
  v24 = v16 | (((v20 ^ (v22 + ~(2 * v23) - 44)) ^ 0x3F) << 16);
  v25 = (((*(unsigned __int8 *)(v17 + (v13[8] ^ 0x65)) + (v13[8] ^ 0x34) - 77) ^ 0xF5) << 24) | (((v12 ^ (16 * v12)) ^ 0x12) << 8) | ((v13[11] ^ 0x3E) + *(_BYTE *)(v15 + (v13[11] ^ 0xD2)) - 64);
  LOBYTE(v20) = *(_BYTE *)(v18 + (v13[6] ^ 0x2ELL));
  v26 = *(_BYTE *)(v19 + (v13[13] ^ 0x5BLL)) ^ 0xFA;
  LODWORD(v12) = ((v13[7] ^ 0x90) + *(_BYTE *)(v15 + (v13[7] ^ 0x7CLL)) - 64) | ((((v13[4] ^ 0x13)
                                                                                                  + *(unsigned __int8 *)(v17 + (v13[4] ^ 0x42))
                                                                                                  - 77) ^ v8) << 24) | (((v20 ^ (16 * v20)) ^ 0xE) << 8);
  v27 = *(unsigned __int8 *)(v19 + (v13[13] ^ 0x5BLL)) ^ 0xFFFFFFFA ^ (v26 >> 4) ^ (v26 >> 1);
  v28 = (((v21 ^ (16 * v21)) ^ 0xDE) << 8) | ((v27 - ((2 * v27) & 0x2E) + 23) << 16);
  v29 = *(_BYTE *)(v19 + (v13[5] ^ 0xEDLL));
  v30 = ((v29 ^ 0xFA) >> 4) ^ ((v29 ^ 0xFA) >> 1);
  v31 = v25 & 0xFF00FFFF | (((*(_BYTE *)(v19 + (v13[9] ^ 0x38)) ^ ((*(_BYTE *)(v19 + (v13[9] ^ 0x38)) ^ 0xFA) >> 4) ^ ((*(_BYTE *)(v19 + (v13[9] ^ 0x38)) ^ 0xFA) >> 1)) ^ 0x51) << 16);
  v32 = v24 & 0xFFFF00FF | (((*(unsigned __int8 *)(v17 + (*v13 ^ 0x81)) + (*v13 ^ 0xD0) - 77) ^ 0x3C) << 24) | (((*(_BYTE *)(v18 + (v13[2] ^ 0x22)) ^ (16 * *(_BYTE *)(v18 + (v13[2] ^ 0x22)))) ^ 0x20) << 8);
  LODWORD(STACK[0x3E0]) = (v28 & 0xFFFFFF00 | ((((v13[12] ^ 0x13) + *(unsigned __int8 *)(v17 + (v13[12] ^ 0x42)) - 77) ^ v8) << 24) | (*(_BYTE *)(v15 + (v13[15] ^ 0x38)) + (v13[15] ^ 0xD4) - 64)) ^ 0x5EA14479;
  LODWORD(STACK[0x3B8]) = v32 ^ 0xC2BD173A;
  v276 = (unsigned __int8 *)STACK[0x638];
  LODWORD(STACK[0x2E8]) = (v12 & 0xFF00FFFF | ((v29 ^ 0x6C ^ (v30 - ((2 * v30) & 0x72) - 71)) << 16)) ^ 0x77F9B69D;
  LODWORD(STACK[0x3D0]) = v31 ^ 0xC006883;
  v275 = STACK[0x640];
  STACK[0x3F0] = 14;
  v33 = v18;
  v34 = *(unsigned __int8 *)(v18 + (v276[14] ^ 0xD9));
  STACK[0x378] = 4;
  v35 = v276[4];
  v36 = (125 - ((v34 << (((v14 ^ 0x46) - 30) ^ 0xDF)) ^ 0xFFFFFFD0)) ^ v34;
  LOBYTE(v34) = v35 ^ 0xB7;
  LOBYTE(v12) = *(_BYTE *)(v17 + (v35 ^ v8));
  STACK[0x418] = 15;
  v37 = v276[15];
  v38 = v12 + v34 - 77;
  if ((v37 & 0x20) != 0)
    v39 = -32;
  else
    v39 = 32;
  v283 = *(_BYTE *)(v15 + ((v39 + v37) ^ 0xDDLL)) + ((v39 + v37) ^ 0x31);
  STACK[0x3D8] = 6;
  v40 = *(unsigned __int8 *)(v18 + (v276[6] ^ 0x51));
  STACK[0x388] = 12;
  HIDWORD(v41) = v40 ^ (((32 * v40) ^ 0x5F) + ((16 * v40) ^ 0x50) - 2) ^ 0x3F;
  LODWORD(v41) = BYTE4(v41) & 0xF8;
  STACK[0x2E0] = 0;
  v42 = ((v41 >> 3) | ((unint64_t)(v38 ^ 0xE5u) << 13)) ^ 0x58F620A6;
  v43 = (v42 >> 21) | ((_DWORD)v42 << 11);
  v281 = *(_BYTE *)(v17 + (v276[12] ^ a4) - 2 * ((v276[12] ^ a4) & 0xAEu) + 174) - (v276[12] ^ a4);
  v44 = *v276;
  STACK[0x3B0] = 3;
  v45 = v276[3];
  v46 = *(_BYTE *)(v17 + (v44 ^ 0xD8)) + (v44 ^ 0x76) - 2 * (v44 ^ 0x76);
  v47 = *(_BYTE *)(v15 + (v45 ^ 0x57));
  STACK[0x3C8] = 8;
  v279 = (v45 ^ 0xBB) + v47;
  v48 = (v276[8] ^ 0xA7) + *(_BYTE *)(v17 + (v276[8] ^ 0xF6));
  STACK[0x380] = 7;
  LOBYTE(v45) = (v276[7] ^ 0xE9) + *(_BYTE *)(v15 + (v276[7] ^ 5));
  STACK[0x2B0] = 13;
  v49 = *(unsigned __int8 *)(v19 + (v276[13] ^ 0x12));
  STACK[0x210] = 5;
  v50 = *(_BYTE *)(v19 + (v276[5] ^ 0x9CLL));
  v51 = ((v50 ^ 0xFA) >> 4) ^ ((v50 ^ 0xFA) >> 1);
  v52 = (v45 - 64) | ((v50 ^ v8 ^ (v51 - ((2 * v51) & 0x72) - 71)) << 16);
  STACK[0x288] = 9;
  v53 = *(unsigned __int8 *)(v19 + (v276[9] ^ 0x76));
  LODWORD(v45) = v53 & 8 ^ 0xFFFFFFDF;
  v54 = (v53 ^ 0xFA) >> 3;
  v55 = (((_DWORD)v45 + 9) & v54) == 0;
  v56 = v45 + 109;
  v57 = 27 - v45;
  if (v55)
    v57 = v56;
  STACK[0x248] = 10;
  STACK[0x218] = 11;
  v58 = v53 ^ ((((v54 + v57 - 68) ^ (v53 ^ 0xFA) & 0xF7) & 0xFE) >> 1);
  v59 = *(_BYTE *)(v15 + (v276[11] ^ 0x12)) + (v276[11] ^ 0xFE);
  STACK[0x240] = 1;
  v60 = *(unsigned __int8 *)(v19 + (v276[1] ^ 0xCFLL)) ^ 0xFFFFFFFA;
  v61 = v60 ^ (v60 >> 4) ^ (v60 >> 1);
  LOBYTE(v60) = *(_BYTE *)(v33 + (v276[10] ^ 0xFBLL));
  v62 = *(_QWORD *)(v6 + 8 * (v14 + 23)) - 12;
  v63 = *(_DWORD *)(v62
                  + 4
                  * (v49 ^ ((((v49 ^ 0xFA) >> 3) & 4 ^ v49 & 0xA4 | ((v49 ^ 0xFA) >> 3) & 0xFB ^ (v49 ^ 0xFFFFFFFA) & 0x5A) >> 1) ^ 0xDF));
  v64 = *(_QWORD *)(v6 + 8 * (v14 - 72)) - 12;
  v65 = *(_DWORD *)(v64 + 4 * ((v60 ^ (16 * v60)) ^ 0x9Bu));
  HIDWORD(v66) = v65 ^ 0x147D;
  LODWORD(v66) = v65 ^ 0x964C0000;
  v285 = v14;
  v67 = v6;
  v68 = *(_QWORD *)(v6 + 8 * (v14 - 106)) - 4;
  v69 = (v66 >> 16) ^ *(_DWORD *)(v68 + 4 * ((v46 - 78) ^ 0xF9u)) ^ (16 * (v63 ^ 0xC689806C)
                                                                                      - 1090382546
                                                                                      - ((32 * (v63 ^ 0xC689806C)) & 0x7E042A40));
  v70 = v63 ^ (v69 + 1144437947 - ((2 * v69) & 0x886D7976));
  v71 = *(_DWORD *)(v64 + 4 * (v36 ^ 0x71u));
  HIDWORD(v66) = v71 ^ 0x147D;
  LODWORD(v66) = v71 ^ 0x964C0000;
  v72 = v52 ^ v43 ^ 0xDD03A24B;
  v73 = *(_QWORD *)(v67 + 8 * (int)(v14 & 0xD8D6777A)) - 4;
  v74 = *(_DWORD *)(v73 + 4 * (v72 ^ 0x33u)) ^ v70;
  v75 = *(_DWORD *)(v62 + 4 * (v61 ^ 0xBFu)) ^ 0xC689806C;
  v76 = (v66 >> 16) ^ (16 * v75 - 1090382546 - ((32 * v75) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * HIBYTE(v72));
  v77 = *(_DWORD *)(v73 + 4 * ((v59 - 64) ^ 0xB9u)) ^ v75 ^ (v76
                                                                              + 1144437947
                                                                              - ((2 * v76) & 0x886D7976));
  v78 = *(_DWORD *)(v62 + 4 * BYTE2(v72)) ^ 0xC689806C;
  LOBYTE(v75) = *(_BYTE *)(v33 + (v276[2] ^ 0x26)) ^ 0xC5;
  v79 = *(_DWORD *)(v64 + 4 * ((v75 ^ (16 * v75)) ^ 0xFBu));
  HIDWORD(v66) = v79 ^ 0x147D;
  LODWORD(v66) = v79 ^ 0x964C0000;
  v80 = (v66 >> 16) ^ *(_DWORD *)(v68 + 4 * ((v48 - ((2 * v48 + 102) & 0x4E) - 38) ^ 0x40u)) ^ (16 * v78 - 1090382546 - ((32 * v78) & 0x7E042A40));
  v81 = *(_DWORD *)(v73 + 4 * ((v283 - 64) ^ 0xEBu)) ^ v78 ^ (v80
                                                                               + 1144437947
                                                                               - ((2 * v80) & 0x886D7976));
  v82 = *(_DWORD *)(v62 + 4 * (v58 ^ 0x86u)) ^ 0xC689806C;
  v83 = *(_DWORD *)(v64 + 4 * (BYTE1(v43) ^ 0x31u));
  HIDWORD(v66) = v83 ^ 0x147D;
  LODWORD(v66) = v83 ^ 0x964C0000;
  v84 = (v66 >> 16) ^ *(_DWORD *)(v68 + 4 * ((v281 - 78) ^ 0xF7u)) ^ (16 * v82
                                                                                       - 1090382546
                                                                                       - ((32 * v82) & 0x7E042A40));
  v85 = *(_DWORD *)(v73 + 4 * ((v279 - 64) ^ 0x33u)) ^ v82 ^ (v84
                                                                               + 1144437947
                                                                               - ((2 * v84) & 0x886D7976));
  v86 = *(_DWORD *)(v62 + 4 * (BYTE2(v85) ^ 0xBBu)) ^ 0xC689806C;
  v87 = *(_DWORD *)(v64 + 4 * (BYTE1(v81) ^ 0xF4u));
  HIDWORD(v66) = v87 ^ 0x147D;
  LODWORD(v66) = v87 ^ 0x964C0000;
  BYTE1(v58) = BYTE1(v77) ^ 0xAD;
  v88 = v86 ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v74) ^ 0x91)) ^ *(_DWORD *)(v73 + 4 * (v77 ^ 0xDBu)) ^ (16 * v86 - 1090382546 - ((32 * v86) & 0x7E042A40)) ^ (v66 >> 16);
  v89 = *(_DWORD *)(v62 + 4 * (BYTE2(v74) ^ 0x65u));
  v90 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v85 ^ 0x22E) >> 8));
  HIDWORD(v66) = v90 ^ 0x147D;
  LODWORD(v66) = v90 ^ 0x964C0000;
  v91 = (16 * (v89 ^ 0xC689806C) - 1090382546 - ((32 * (v89 ^ 0xC689806C)) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * ((v77 ^ 0xF15ADDB) >> 24)) ^ (v66 >> 16);
  v92 = *(_DWORD *)(v73 + 4 * (v81 ^ 0x80u)) ^ v89 ^ (v91 + 1144437947 - ((2 * v91) & 0x886D7976));
  v93 = *(_DWORD *)(v62 + 4 * (BYTE2(v77) ^ 0xD6u)) ^ 0xC689806C;
  v94 = (16 * v93 - 1090382546 - ((32 * v93) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v81) ^ 0x19));
  v95 = *(_DWORD *)(v64 + 4 * (BYTE1(v74) ^ 0x66u));
  HIDWORD(v66) = v95 ^ 0x147D;
  LODWORD(v66) = v95 ^ 0x964C0000;
  v96 = *(_DWORD *)(v73 + 4 * (v85 ^ 0x2Eu)) ^ v93 ^ (v66 >> 16) ^ (v94
                                                                                     + 1144437947
                                                                                     - ((2 * v94) & 0x886D7976));
  v97 = *(_DWORD *)(v64 + 4 * BYTE1(v58));
  HIDWORD(v66) = v97 ^ 0x147D;
  LODWORD(v66) = v97 ^ 0x964C0000;
  v98 = *(_DWORD *)(v62 + 4 * (BYTE2(v81) ^ 0x32u));
  v99 = (v66 >> 16) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v85) ^ 0xBD)) ^ (16 * (v98 ^ 0xC689806C)
                                                                     - 1090382546
                                                                     - ((32 * (v98 ^ 0xC689806C)) & 0x7E042A40));
  v100 = v98 ^ *(_DWORD *)(v73 + 4 * (v74 ^ 0xCCu)) ^ 0xB74056A8 ^ (v99
                                                                                     + 1144437947
                                                                                     - ((2 * v99) & 0x886D7976));
  v101 = v100
       - ((2 * v100) & 0x5F186BF6)
       + 797718011
       - ((2 * (v100 - ((2 * v100) & 0x5F186BF6) + 797718011)) & 0x51AE5188)
       + 685189316;
  v102 = *(_DWORD *)(v62 + 4 * (BYTE2(v101) ^ 0x14u));
  BYTE2(v81) = BYTE2(v96) ^ 0xEB;
  v103 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v96 ^ 0xDFF9) >> 8));
  v104 = (16 * (v102 ^ 0xC689806C) - 1090382546 - ((32 * (v102 ^ 0xC689806C)) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v88) ^ 0xD2)) ^ (((v103 ^ 0x964C147D) >> (v88 & 0x10 ^ 0x10) >> (v88 & 0x10)) + ((v103 << 16) ^ 0x147D0000));
  v105 = *(_DWORD *)(v73 + 4 * (v92 ^ 0xB5u)) ^ v102 ^ (v104 + 1144437947 - ((2 * v104) & 0x886D7976));
  v88 ^= 0x3B6C689Bu;
  v106 = *(_DWORD *)(v62 + 4 * BYTE2(v88)) ^ 0xC689806C;
  v107 = *(_DWORD *)(v64 + 4 * (BYTE1(v101) ^ 0xBBu));
  HIDWORD(v66) = v107 ^ 0x147D;
  LODWORD(v66) = v107 ^ 0x964C0000;
  v108 = (16 * v106 - 1090382546 - ((32 * v106) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v92) ^ 0x8D)) ^ (v66 >> 16);
  v109 = *(_DWORD *)(v73 + 4 * (v96 ^ 0xF9u)) ^ v106 ^ (v108 + 1144437947 - ((2 * v108) & 0x886D7976));
  v110 = *(_DWORD *)(v68 + 4 * (HIBYTE(v96) ^ 5));
  HIDWORD(v66) = v110 ^ 0x12E;
  LODWORD(v66) = v110 ^ 0xBF021400;
  v111 = *(_DWORD *)(v62 + 4 * (BYTE2(v92) ^ 0xBCu)) ^ 0xC689806C;
  v112 = (((v66 >> 10) ^ 0x25EB099C) << 10) ^ (16 * v111) ^ (((v66 >> 10) ^ 0x25EB099C) >> 22);
  v113 = *(_DWORD *)(v64 + 4 * BYTE1(v88));
  HIDWORD(v66) = v113 ^ 0x147D;
  LODWORD(v66) = v113 ^ 0x964C0000;
  v114 = *(_DWORD *)(v73 + 4 * (v101 ^ 0xF7u)) ^ v111 ^ (v66 >> 16) ^ (v112
                                                                                        + 1144437947
                                                                                        - ((2 * v112) & 0x886D7976));
  v115 = *(_DWORD *)(v64 + 4 * (BYTE1(v92) ^ 0x4Du));
  HIDWORD(v66) = v115 ^ 0x147D;
  LODWORD(v66) = v115 ^ 0x964C0000;
  v116 = *(_DWORD *)(v62 + 4 * BYTE2(v81)) ^ 0xC689806C;
  v117 = (v66 >> 16) ^ (16 * v116 - 1090382546 - ((32 * v116) & 0x7E042A40)) ^ *(_DWORD *)(v68
                                                                                         + 4 * (HIBYTE(v101) ^ 0xC1));
  v118 = *(_DWORD *)(v73 + 4 * (v88 ^ 0x33u)) ^ v116 ^ (v117 + 1144437947 - ((2 * v117) & 0x886D7976));
  v119 = *(_DWORD *)(v62 + 4 * (BYTE2(v118) ^ 0x62u)) ^ 0xC689806C;
  v120 = (16 * v119 - 1090382546 - ((32 * v119) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v105) ^ 0x1B));
  v121 = v114 ^ 0xF1F7E4A6;
  v122 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v114 ^ 0xE4A6) >> 8));
  HIDWORD(v66) = v122 ^ 0x147D;
  LODWORD(v66) = v122 ^ 0x964C0000;
  v123 = *(_DWORD *)(v73 + 4 * (v109 ^ 0x68u)) ^ v119 ^ (v66 >> 16) ^ (v120
                                                                                        + 1144437947
                                                                                        - ((2 * v120) & 0x886D7976));
  v124 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v118 ^ 0x2957) >> 8));
  HIDWORD(v66) = v124 ^ 0x147D;
  LODWORD(v66) = v124 ^ 0x964C0000;
  v125 = *(_DWORD *)(v62 + 4 * (BYTE2(v105) ^ 0xD2u)) ^ 0xC689806C;
  v126 = (16 * v125 - 1090382546 - ((32 * v125) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v109) ^ 0xCE)) ^ (v66 >> 16);
  v127 = *(_DWORD *)(v73 + 4 * (v114 ^ 0x15u)) ^ v125 ^ (v126 + 1144437947 - ((2 * v126) & 0x886D7976));
  v128 = *(_DWORD *)(v62 + 4 * (BYTE2(v109) ^ 0x60u)) ^ 0xC689806C;
  v129 = *(_DWORD *)(v64 + 4 * (BYTE1(v105) ^ 0x1Bu));
  HIDWORD(v66) = v129 ^ 0x147D;
  LODWORD(v66) = v129 ^ 0x964C0000;
  v130 = (16 * v128 - 1090382546 - ((32 * v128) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * HIBYTE(v121)) ^ (v66 >> 16);
  v131 = *(_DWORD *)(v73 + 4 * (v118 ^ 0x57u)) ^ v128 ^ (v130 + 1144437947 - ((2 * v130) & 0x886D7976));
  v132 = *(_DWORD *)(v62 + 4 * BYTE2(v121));
  v133 = BYTE1(v109) ^ 0xC;
  if ((v109 & 0x1000) != 0)
    v134 = -16;
  else
    v134 = 16;
  v135 = v132 ^ 0xC689806C;
  v136 = *(_DWORD *)(v64 + 4 * ((v133 + v134) ^ 0x83u));
  v137 = *(_DWORD *)(v68 + 4 * (HIBYTE(v118) ^ 0xA1)) ^ HIWORD(v136) ^ (v136 << 16) ^ (16 * v135
                                                                                       - 1090382546
                                                                                       - ((32 * v135) & 0x7E042A40)) ^ 0x147D964C;
  v138 = *(_DWORD *)(v73 + 4 * (v105 ^ 0xFu)) ^ v135 ^ (v137 + 1144437947 - ((2 * v137) & 0x886D7976));
  v139 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v131 ^ 0x8D48) >> 8));
  HIDWORD(v140) = v139 ^ 0x147D;
  LODWORD(v140) = v139 ^ 0x964C0000;
  v141 = *(_DWORD *)(v62 + 4 * ((v138 ^ 0xEFBC3B44) >> 16)) ^ 0xC689806C;
  v142 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v123) ^ 0xCC)) ^ (16 * v141
                                                                        - 1090382546
                                                                        - ((32 * v141) & 0x7E042A40));
  v143 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v138 ^ 0x3B44) >> 8));
  HIDWORD(v140) = v143 ^ 0x147D;
  LODWORD(v140) = v143 ^ 0x964C0000;
  v144 = *(_DWORD *)(v73 + 4 * (v127 ^ 0xA9u)) ^ v141 ^ (v142 + 1144437947 - ((2 * v142) & 0x886D7976));
  LOWORD(v142) = v123 ^ 0xD583;
  v145 = *(_DWORD *)(v62 + 4 * (((v123 ^ 0x255FD583) >> 16) ^ 0xC3u)) ^ 0xC689806C;
  v146 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * HIBYTE(v127)) ^ (16 * v145 - 1090382546 - ((32 * v145) & 0x7E042A40));
  v147 = *(_DWORD *)(v73 + 4 * (v131 ^ 0x48u)) ^ v145 ^ (v146 + 1144437947 - ((2 * v146) & 0x886D7976));
  v148 = *(_DWORD *)(v64 + 4 * BYTE1(v142));
  HIDWORD(v140) = v148 ^ 0x147D;
  LODWORD(v140) = v148 ^ 0x964C0000;
  v149 = *(_DWORD *)(v62 + 4 * ((v127 ^ 0xE93411A9) >> 16)) ^ 0xC689806C;
  v150 = (16 * v149 - 1090382546 - ((32 * v149) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * ((v131 ^ 0x807D8D48) >> 24)) ^ (v140 >> 16);
  v151 = *(_DWORD *)(v64 + 4 * (BYTE1(v127) ^ 0x82u));
  v152 = *(_DWORD *)(v73 + 4 * (v138 ^ 0x77u)) ^ v149 ^ (v150 + 1144437947 - ((2 * v150) & 0x886D7976));
  HIDWORD(v140) = v151 ^ 0x147D;
  LODWORD(v140) = v151 ^ 0x964C0000;
  v153 = *(_DWORD *)(v62 + 4 * (BYTE2(v131) ^ 0xBEu)) ^ 0xC689806C;
  v154 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * ((v138 ^ 0xEFBC3B44) >> 24)) ^ (16 * v153
                                                                              - 1090382546
                                                                              - ((32 * v153) & 0x7E042A40));
  v155 = *(_DWORD *)(v73 + 4 * v142) ^ v153 ^ (v154 + 1144437947 - ((2 * v154) & 0x886D7976));
  v156 = *(_DWORD *)(v62 + 4 * ((v155 ^ 0x950DA39D) >> 16)) ^ 0xC689806C;
  v157 = *(_DWORD *)(v64 + 4 * (BYTE1(v152) ^ 0x89u));
  v158 = (16 * v156 - 1090382546 - ((32 * v156) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * ((v144 ^ 0x11521BCA) >> 24));
  HIDWORD(v140) = v157 ^ 0x147D;
  LODWORD(v140) = v157 ^ 0x964C0000;
  v159 = v158 + 1144437947 - ((2 * v158) & 0x886D7976);
  BYTE1(v158) = BYTE1(v147) ^ 0xD1;
  v160 = v156 ^ *(_DWORD *)(v73 + 4 * (v147 ^ 0x88u)) ^ (v140 >> 16) ^ v159;
  v161 = *(_DWORD *)(v62 + 4 * ((v144 ^ 0x11521BCA) >> 16));
  v162 = *(_DWORD *)(v64 + 4 * (BYTE1(v155) ^ 0x30u));
  HIDWORD(v140) = v162 ^ 0x147D;
  LODWORD(v140) = v162 ^ 0x964C0000;
  v163 = (v160 ^ 0x71C9D6C4) + 1615192458 - 2 * ((v160 ^ 0x71C9D6C4) & 0x6045E18B ^ v160 & 1);
  v164 = (16 * (v161 ^ 0xC689806C) - 1090382546 - ((32 * (v161 ^ 0xC689806C)) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v147) ^ 0xDF)) ^ (v140 >> 16);
  v165 = v152 ^ 0x7A851A70;
  v166 = *(_DWORD *)(v73 + 4 * (v152 ^ 0x43u)) ^ v161 ^ (v164 + 1144437947 - ((2 * v164) & 0x886D7976));
  v167 = *(_DWORD *)(v62 + 4 * (BYTE2(v147) ^ 0xA7u)) ^ 0xC689806C;
  v168 = *(_DWORD *)(v64 + 4 * (BYTE1(v144) ^ 0x88u));
  HIDWORD(v140) = v168 ^ 0x147D;
  LODWORD(v140) = v168 ^ 0x964C0000;
  v169 = (16 * v167 - 1090382546 - ((32 * v167) & 0x7E042A40)) ^ *(_DWORD *)(v68
                                                                           + 4
                                                                           * ((HIBYTE(v165) ^ -HIBYTE(v165) ^ ((HIBYTE(v165) ^ 0xFFFFFF16) + 234))
                                                                            + 233)) ^ (v140 >> 16);
  v170 = *(_DWORD *)(v73 + 4 * (v155 ^ 0x9Du)) ^ v167 ^ (v169 + 1144437947 - ((2 * v169) & 0x886D7976));
  v171 = *(_DWORD *)(v62 + 4 * BYTE2(v165));
  v172 = *(_DWORD *)(v64 + 4 * BYTE1(v158));
  HIDWORD(v140) = v172 ^ 0x147D;
  LODWORD(v140) = v172 ^ 0x964C0000;
  v173 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v155) ^ 0x7C)) ^ (16 * (v171 ^ 0xC689806C)
                                                                        - 1090382546
                                                                        - ((32 * (v171 ^ 0xC689806C)) & 0x7E042A40));
  v174 = *(_DWORD *)(v73 + 4 * (v144 ^ 0xF9u)) ^ v171 ^ (v173 + 1144437947 - ((2 * v173) & 0x886D7976));
  v175 = *(_DWORD *)(v62 + 4 * (BYTE2(v174) ^ 0xEu));
  v176 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v170 ^ 0xDE69) >> 8));
  HIDWORD(v140) = v176 ^ 0x147D;
  LODWORD(v140) = v176 ^ 0x964C0000;
  v177 = (v140 >> 16) ^ (16 * (v175 ^ 0xC689806C) - 1090382546 - ((32 * (v175 ^ 0xC689806C)) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v163) ^ 9));
  v178 = *(_DWORD *)(v73 + 4 * (v166 ^ 0xBFu)) ^ v175 ^ (v177 + 1144437947 - ((2 * v177) & 0x886D7976));
  v179 = *(_DWORD *)(v64 + 4 * (BYTE1(v174) ^ 0xBFu));
  HIDWORD(v140) = v179 ^ 0x147D;
  LODWORD(v140) = v179 ^ 0x964C0000;
  v180 = *(_DWORD *)(v62 + 4 * (BYTE2(v163) ^ 0x2Fu)) ^ 0xC689806C;
  v181 = v180 ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v166) ^ 0x1B)) ^ *(_DWORD *)(v73 + 4 * (v170 ^ 0x69u)) ^ ((v140 >> 16) + 1144437947 - ((2 * (v140 >> 16)) & 0x886D7976)) ^ (16 * v180 - 1090382546 - ((32 * v180) & 0x7E042A40));
  v182 = *(_DWORD *)(v62 + 4 * (BYTE2(v166) ^ 0x73u)) ^ 0xC689806C;
  v183 = *(_DWORD *)(v64 + 4 * (BYTE1(v163) ^ 0x8Au));
  HIDWORD(v140) = v183 ^ 0x147D;
  LODWORD(v140) = v183 ^ 0x964C0000;
  v184 = (16 * v182 - 1090382546 - ((32 * v182) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * ((v170 ^ 0x5FEEDE69) >> 24)) ^ (v140 >> 16);
  v185 = *(_DWORD *)(v73
                   + 4
                   * ((((v174 ^ 0x23) + (v174 ^ 0xFFFFFFEF) + 1) ^ 0xFFFFFFFE)
                    + (v174 ^ 0x23))) ^ v182 ^ (v184 + 1144437947 - ((2 * v184) & 0x886D7976));
  v186 = *(_DWORD *)(v62 + 4 * (BYTE2(v170) ^ 0x2Du)) ^ 0xC689806C;
  v187 = *(_DWORD *)(v64 + 4 * (BYTE1(v166) ^ 0x5Fu));
  HIDWORD(v140) = v187 ^ 0x147D;
  LODWORD(v140) = v187 ^ 0x964C0000;
  v188 = (v140 >> 16) ^ (16 * v186 - 1090382546 - ((32 * v186) & 0x7E042A40)) ^ *(_DWORD *)(v68
                                                                                          + 4
                                                                                          * ((HIBYTE(v174) ^ 0xD3) & 0x90 ^ 0x86u ^ (~(2 * (HIBYTE(v174) ^ 0xD3 | 0x90)) + (HIBYTE(v174) ^ 0xD3 | 0x90))));
  v189 = *(_DWORD *)(v73 + 4 * (v163 ^ 0xD1u)) ^ v186 ^ (v188 + 1144437947 - ((2 * v188) & 0x886D7976));
  v190 = *(_DWORD *)(v62 + 4 * ((v189 ^ 0x59A5F4B7) >> 16)) ^ 0xC689806C;
  v191 = *(_DWORD *)(v64 + 4 * ((unsigned __int16)(v185 ^ 0x872B) >> 8));
  HIDWORD(v140) = v191 ^ 0x147D;
  LODWORD(v140) = v191 ^ 0x964C0000;
  v192 = (16 * v190 - 1090382546 - ((32 * v190) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v178) ^ 0x14)) ^ (v140 >> 16);
  v193 = *(_DWORD *)(v73 + 4 * (v181 ^ 0xEEu)) ^ v190 ^ (v192 + 1144437947 - ((2 * v192) & 0x886D7976));
  v194 = *(_DWORD *)(v62 + 4 * (BYTE2(v178) ^ 0xACu)) ^ 0xC689806C;
  v195 = *(_DWORD *)(v64 + 4 * (BYTE1(v189) ^ 0x67u));
  HIDWORD(v140) = v195 ^ 0x147D;
  LODWORD(v140) = v195 ^ 0x964C0000;
  v196 = v194 ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v181) ^ 0xD6)) ^ *(_DWORD *)(v73 + 4 * (v185 ^ 0x18u)) ^ (16 * v194 - 1090382546 - ((32 * v194) & 0x7E042A40)) ^ ((v140 >> 16) + 1144437947 - ((2 * (v140 >> 16)) & 0x886D7976));
  v197 = *(_DWORD *)(v62 + 4 * (BYTE2(v181) ^ 0x56u)) ^ 0xC689806C;
  v198 = *(_DWORD *)(v64 + 4 * (BYTE1(v178) ^ 0x3Bu));
  HIDWORD(v140) = v198 ^ 0x147D;
  LODWORD(v140) = v198 ^ 0x964C0000;
  v199 = *(_DWORD *)(v68 + 4 * ((v185 ^ 0x911B872B) >> 24)) ^ v197 ^ 0x6D41727E ^ (16 * v197
                                                                                   - 1090382546
                                                                                   - ((32 * v197) & 0x7E042A40)) ^ (v140 >> 16);
  HIDWORD(v140) = *(_DWORD *)(v73 + 4 * (v189 ^ 0xB7u)) ^ 0x58BE1801;
  LODWORD(v140) = HIDWORD(v140);
  v200 = (v140 >> 21) ^ __ROR4__(v199, 21);
  v201 = *(_DWORD *)(v62 + 4 * (BYTE2(v185) ^ 0xD8u)) ^ 0xC689806C;
  v202 = *(_DWORD *)(v64 + 4 * (BYTE1(v181) ^ 0xE4u));
  HIDWORD(v140) = v202 ^ 0x147D;
  LODWORD(v140) = v202 ^ 0x964C0000;
  v203 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v189) ^ 0xB0)) ^ (16 * v201
                                                                        - 1090382546
                                                                        - ((32 * v201) & 0x7E042A40));
  v204 = *(_DWORD *)(v73 + 4 * (v178 ^ 0xCAu)) ^ v201 ^ (v203 + 1144437947 - ((2 * v203) & 0x886D7976));
  v205 = *(_DWORD *)(v62 + 4 * (BYTE2(v193) ^ 0x74u)) ^ 0xC689806C;
  v206 = *(_DWORD *)(v64 + 4 * (BYTE1(v204) ^ 0x66u));
  HIDWORD(v140) = v206 ^ 0x147D;
  LODWORD(v140) = v206 ^ 0x964C0000;
  v207 = v196 ^ 0x177CD9D9;
  v208 = *(_DWORD *)(v68 + 4 * ((v196 ^ 0x177CD9D9u) >> 24)) ^ 0x6D41727E ^ v205 ^ (16 * v205
                                                                                    - 1090382546
                                                                                    - ((32 * v205) & 0x7E042A40)) ^ (v140 >> 16);
  HIDWORD(v140) = v200 ^ 0x549BF9D9;
  LODWORD(v140) = v200 ^ 0x549BF9D9;
  v209 = v140 >> 11;
  v210 = *(_DWORD *)(v64 + 4 * (BYTE1(v209) ^ 0xA0u));
  v211 = *(_DWORD *)(v73 + 4 * ((v140 >> 11) ^ 0xEFu));
  v212 = (v208 & 0x200 | ((((unsigned __int16)(v208 & 0x200) >> 9) & 1) << 10)) ^ 0xF3F7FA5F;
  v55 = ((v212 + 201852321) & (v211 ^ 0x4436BCBB)) == 0;
  HIDWORD(v140) = v210 ^ 0x147D;
  LODWORD(v140) = v210 ^ 0x964C0000;
  v213 = *(_DWORD *)(v62 + 4 * (BYTE2(v204) ^ 0x72u)) ^ 0xC689806C;
  v214 = (v140 >> 16) ^ *(_DWORD *)(v68 + 4 * ((v193 ^ 0xD4B73D47) >> 24)) ^ (16 * v213
                                                                              - 1090382546
                                                                              - ((32 * v213) & 0x7E042A40));
  v215 = *(_DWORD *)(v73 + 4 * (v196 ^ 0xEAu)) ^ v213 ^ (v214 + 1144437947 - ((2 * v214) & 0x886D7976));
  v216 = v212 + 2134458290;
  v217 = 1730753648 - v212;
  if (!v55)
    v216 = v217;
  v218 = ((v211 ^ 0x58BE1801) - 1932605969 + v216) ^ v208 & 0xFFFFFDFF;
  v219 = *(_DWORD *)(v62 + 4 * BYTE2(v207)) ^ 0xC689806C;
  v220 = *(_DWORD *)(v64 + 4 * (BYTE1(v193) ^ 0xAEu));
  HIDWORD(v221) = v220 ^ 0x147D;
  LODWORD(v221) = v220 ^ 0x964C0000;
  v222 = (16 * v219 - 1090382546 - ((32 * v219) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * ((v209 ^ 0x1EA133EFu) >> 24));
  v223 = *(_DWORD *)(v73 + 4 * (v204 ^ 0xDu)) ^ v219 ^ (v221 >> 16) ^ (v222
                                                                                        + 1144437947
                                                                                        - ((2 * v222) & 0x886D7976));
  v224 = *(_DWORD *)(v64 + 4 * BYTE1(v207));
  v225 = *(_DWORD *)(v62 + 4 * (BYTE2(v209) ^ 0x62u)) ^ 0xC689806C;
  HIDWORD(v221) = v224 ^ 0x147D;
  LODWORD(v221) = v224 ^ 0x964C0000;
  v226 = (16 * v225 - 1090382546 - ((32 * v225) & 0x7E042A40)) ^ *(_DWORD *)(v68 + 4 * (HIBYTE(v204) ^ 0x32)) ^ (v221 >> 16);
  v227 = (char *)*(&off_1E6CBBAA0 + (int)(v14 & 0xE44A148F)) - 12;
  v228 = *(_DWORD *)(v73 + 4 * (v193 ^ 0x74u)) ^ v225 ^ (v226 + 1144437947 - ((2 * v226) & 0x886D7976));
  v229 = *(_DWORD *)&v227[4 * (((v218 ^ 0xF137909F) >> 24) ^ 0xB4)]
       + (((v218 ^ 0xF137909F) >> 24) ^ 0x9FD52929)
       - 799925977;
  v230 = *(_DWORD *)&v227[4 * (((v215 ^ 0x6792B6A6) >> 24) ^ 0xB4)];
  v278 = *(_DWORD *)&v227[4 * (HIBYTE(v223) ^ 0xB4)];
  LOBYTE(v224) = v228 ^ 0x9C;
  v282 = (v228 ^ 0x250E7C9C) >> 24;
  v284 = *(_DWORD *)&v227[4 * (v282 ^ 0xB4)];
  v231 = (char *)*(&off_1E6CBBAA0 + (v14 ^ 0xE4)) - 12;
  v232 = (uint64_t)*(&off_1E6CBBAA0 + (v14 ^ 0xD1));
  v233 = *(_DWORD *)&v231[4 * (BYTE2(v215) ^ 0x99)] ^ 0xCB8B46F5;
  v234 = v229 ^ ((v223 ^ 0x7B)
               - 1127262170
               - ((2 * (v223 ^ 0x7B) + 2044928224) & 0x79A3036C)) ^ v233 ^ (v233 >> 2) ^ *(_DWORD *)(v232 + 4 * (v223 ^ 0x79u));
  v235 = *(_DWORD *)&v231[4 * (BYTE2(v228) ^ 5)];
  v236 = *(_DWORD *)&v231[4 * ((v218 ^ 0xF137909F) >> 16)];
  v280 = *(_DWORD *)&v231[4 * ((v223 ^ 0xBC37B) >> 16)];
  v237 = (char *)*(&off_1E6CBBAA0 + (int)(v14 & 0x8D57A1F7)) - 12;
  v238 = *(_DWORD *)&v237[4 * ((unsigned __int16)(v223 ^ 0xC37B) >> 8)];
  v239 = v234 ^ (v233 >> 4);
  v240 = *(_DWORD *)&v237[4 * ((unsigned __int16)(v228 ^ 0x7C9C) >> 8)] ^ 0xC8DEAB27;
  v241 = v240 ^ (1515496080 * v240);
  v242 = *(_DWORD *)&v237[4 * ((unsigned __int16)(v215 ^ 0xB6A6) >> 8)];
  v243 = *(_DWORD *)&v237[4 * (BYTE1(v218) ^ 0x5E)];
  v244 = *(_DWORD *)(v232 + 4 * (v218 ^ 0x9Du));
  LODWORD(v237) = v239 ^ v241;
  v245 = *(_DWORD *)(v232 + 4 * (v228 ^ 0x9Eu));
  v277 = *(_DWORD *)(v232 + 4 * (v215 ^ 0xA4u));
  v246 = ((_DWORD)v237 + 2012853917 - ((2 * (_DWORD)v237) & 0xEFF36D6A) + 24) ^ LODWORD(STACK[0x2E8]);
  v247 = (char *)*(&off_1E6CBBAA0 + (v285 ^ 0xE2)) - 4;
  *(_BYTE *)(v275 + STACK[0x210]) = v247[((v246 ^ 0x5244C6B3) >> 16) ^ 0x5ELL] ^ ((v246 ^ 0x5244C6B3) >> 16) ^ 0x8A ^ ((((v246 ^ 0x5244C6B3) >> 16) ^ 0x8A) - ((2 * (((v246 ^ 0x5244C6B3) >> 16) ^ 0x8A) + 14) & 0x18) - 125) ^ 0xB9;
  v248 = v235 ^ 0xCB8B46F5 ^ ((((v215 ^ 0x6792B6A6) >> 24) ^ 0x9FD52929) - 799925977 + v230) ^ ((v235 ^ 0xCB8B46F5) >> 2) ^ ((v235 ^ 0xCB8B46F5) >> 4) ^ v238 ^ 0xC8DEAB27 ^ v244 ^ (1515496080 * (v238 ^ 0xC8DEAB27)) ^ ((v218 ^ 0x9F) - 1127262170 + ((2 * (((v218 ^ 0x9F) + 112) & 0x1B7 ^ (v218 ^ 0xF137909F | 0x7FFFFFFE))) ^ 0x79A30003) + 1);
  v249 = (v248 - 1027795142 - ((2 * v248) & 0x857A2F02) + 71) ^ LODWORD(STACK[0x3B8]);
  v250 = v249 ^ 0x22A932A6;
  v251 = (BYTE1(v250) | 0x88) ^ (v250 >> 8) & 0x88;
  v252 = (char *)*(&off_1E6CBBAA0 + (v285 ^ 0xA7)) - 8;
  *(_BYTE *)(v275 + 2) = (((unsigned __int16)(v249 ^ 0x32A6) >> 8) | 0x88) ^ ((unsigned __int16)(v249 ^ 0x32A6) >> 8) & 0x88 ^ 0x35 ^ ((v252[v251 ^ 0x14] ^ 0x4B) - ((2 * v252[v251 ^ 0x14]) & 0x20) - 112);
  v253 = v236 ^ 0xCB8B46F5 ^ ((HIBYTE(v223) ^ 0x9FD52929) - 799925977 + v278) ^ ((v236 ^ 0xCB8B46F5) >> 2) ^ ((v236 ^ 0xCB8B46F5) >> 4);
  LODWORD(v237) = (v253 & 0x1000000 ^ 0x7B6FF67F) + 2 * (v253 & 0x1000000);
  v55 = (((_DWORD)v237 - 2070935167) & (v245 ^ 0x3F000000)) == 0;
  v254 = (char *)*(&off_1E6CBBAA0 + v285 - 107) - 8;
  v255 = v254[HIBYTE(v246) ^ 0xEFLL];
  HIDWORD(v221) = v255 ^ 0x17;
  LODWORD(v221) = (v255 ^ 0xC0) << 24;
  *(_BYTE *)(v275 + STACK[0x378]) = (v221 >> 29) ^ 0x83;
  v256 = v245 ^ (v224 - 1127262170 - ((2 * v224 + 2044928224) & 0x79A3036C));
  v257 = (_DWORD)v237 - 134480424;
  v258 = -287577386 - (_DWORD)v237;
  if (v55)
    v258 = v257;
  v259 = v242 ^ 0xC8DEAB27 ^ LODWORD(STACK[0x3D0]) ^ ((v253 & 0xFEFFFFFF ^ (1515496080 * (v242 ^ 0xC8DEAB27)) ^ (v256 - 1936454743 + v258))
                                                    + 201353347
                                                    - ((2
                                                      * (v253 & 0xFEFFFFFF ^ (1515496080 * (v242 ^ 0xC8DEAB27)) ^ (v256 - 1936454743 + v258))) & 0x1800D18A)
                                                    + 66);
  v260 = (char *)*(&off_1E6CBBAA0 + v285 - 101) - 8;
  v261 = v260[v242 ^ 0x27u ^ LOBYTE(STACK[0x3D0]) ^ ((v253 ^ (-112 * (v242 ^ 0x27)) ^ (v256 - 87 + v258))
                                                                                     - 125
                                                                                     - ((2
                                                                                       * (v253 ^ (-112 * (v242 ^ 0x27)) ^ (v256 - 87 + v258))) & 0x8A)
                                                                                     + 66) ^ 0x28];
  *(_BYTE *)(v275 + STACK[0x218]) = v261 & 0xFB ^ 0xFA ^ ((v261 | 0xFB) + 24);
  v262 = v254[HIBYTE(v249) ^ 0xF9];
  HIDWORD(v263) = v262 ^ 0x17;
  LODWORD(v263) = (v262 ^ 0xC0) << 24;
  v264 = STACK[0x2E0];
  *(_BYTE *)(v275 + STACK[0x2E0]) = (v263 >> 29) ^ 0xFB;
  *(_BYTE *)(v275 + STACK[0x240]) = BYTE2(v250) ^ 0x61 ^ ((BYTE2(v250) ^ 0x61)
                                                        - ((2 * (BYTE2(v250) ^ 0x61) + 14) & 0x18)
                                                        - 125) ^ 0xB8 ^ v247[BYTE2(v250) ^ 0xB5];
  v265 = (v282 ^ 0x9FD52929) - 799925977 + v284;
  v266 = v280 ^ 0xCB8B46F5 ^ ((v280 ^ 0xCB8B46F5) >> 4) ^ ((v280 ^ 0xCB8B46F5) >> 2);
  v267 = v266 & 0x80000 | 0x26C64076;
  if ((v266 & 0x80000 & v265) != 0)
    v267 = 1301053676 - v267;
  v268 = v277 ^ ((v215 ^ 0xA6) + 2096205936) ^ (((v265 - 650526838 + v267) ^ v266 & 0xFFF7FFFF ^ (1515496080 * (v243 ^ 0xC8DEAB27)))
                                                               + 1071499190
                                                               - 2
                                                               * (((v265 - 650526838 + v267) ^ v266 & 0xFFF7FFFF ^ (1515496080 * (v243 ^ 0xC8DEAB27))) & 0x3FDDC7BF ^ ((v265 - 650526838 + v267) ^ v266 & 0xFFF7FFFF) & 9));
  v269 = v243 ^ LODWORD(STACK[0x3E0]) ^ (v268 + 1587627081 - ((2 * v268) & 0xBD428892));
  *(_BYTE *)(v275 + STACK[0x2B0]) = v247[(BYTE2(v269) ^ 0x45) + 213 + ((v269 >> 15) & 0x1A8 ^ 0xFFFFFF77)] ^ BYTE2(v269) ^ ((BYTE2(v269) ^ 0x45) - ((2 * (BYTE2(v269) ^ 0x45) + 14) & 0x18) - 125) ^ 0xC3;
  v270 = v254[HIBYTE(v269) ^ 0x32];
  HIDWORD(v271) = v270 ^ 0x17;
  LODWORD(v271) = (v270 ^ 0xC0) << 24;
  *(_BYTE *)(v275 + STACK[0x388]) = (v271 >> 29) ^ 0x50;
  *(_BYTE *)(v275 + STACK[0x288]) = ((v259 ^ 0xCFDDD967) >> 16) ^ 0x94 ^ ((((v259 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                        - ((2 * (((v259 ^ 0xCFDDD967) >> 16) ^ 0x94) + 14) & 0x18)
                                                                        - 125) ^ v247[((v259 ^ 0xCFDDD967) >> 16) ^ 0x40] ^ 0xC;
  v272 = (((v269 ^ 0x97EB3908) >> 4) & 0xF0 | ((unsigned __int16)(v269 ^ 0x3908) >> 12)) ^ 0xE6;
  *(_BYTE *)(v275 + STACK[0x3F0]) = v252[((v272 >> 4) & 0xFFFFFF0F | (16 * (v272 & 0xF))) ^ 0xAELL] ^ (((v272 >> 4) & 0xF | (16 * (v272 & 0xF))) + (~(2 * ((v272 >> 4) & 0xF | (16 * (v272 & 0xF)))) | 0x69) + 76) ^ 0x2B;
  *(_BYTE *)(v275 + STACK[0x248]) = (((unsigned __int16)(v259 ^ 0xD967) >> 8) - (((v259 ^ 0xCFDDD967) >> 7) & 0x96) + 75) ^ 0xDB ^ v252[((unsigned __int16)(v259 ^ 0xD967) >> 8) ^ 0xA0];
  *(_BYTE *)(v275 + STACK[0x3D8]) = (((unsigned __int16)(v246 ^ 0xC6B3) >> 8) - (((v246 ^ 0x5244C6B3) >> 7) & 0x96) + 75) ^ v252[((unsigned __int16)(v246 ^ 0xC6B3) >> 8) ^ 0x75] ^ 0x80;
  *(_BYTE *)(v275 + STACK[0x3B0]) = v260[v249 ^ 0x95] ^ 0x44;
  *(_BYTE *)(v275 + STACK[0x380]) = v260[v246 ^ 0x7FLL] ^ 0xD5;
  *(_BYTE *)(v275 + STACK[0x418]) = v260[v269 ^ 0xA7] ^ 0x7A;
  v273 = v254[HIBYTE(v259) ^ 0x49];
  HIDWORD(v271) = v273 ^ 0x17;
  LODWORD(v271) = (v273 ^ 0xC0) << 24;
  *(_BYTE *)(v275 + STACK[0x3C8]) = (v271 >> 29) ^ 0x2E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                        + 8
                                                                        * ((402
                                                                          * ((((_DWORD)v264
                                                                             + 1365500565
                                                                             - ((2 * (_DWORD)v264 + 32) & 0xA2C7C52A)
                                                                             + 16) ^ 0x5163E290) < 0x150)) ^ v285))
                                                            - 8))(249, 3370036007, 1515496080);
}

void sub_1B77626F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,unsigned __int8 a25,int a26,int a27,unsigned __int8 a28,int a29,unsigned __int8 a30,int a31,int a32,int a33,unsigned __int8 a34,int a35,int a36,char a37,__int16 a38,char a39)
{
  char v39;

  LODWORD(STACK[0x3B8]) = (a25 | ((a33 ^ 0xC) << 24) | ((a34 ^ 0x92) << 16) | ((a28 ^ 0xEF) << ((a39 - 58) ^ 0xB7))) ^ 0x5A3DC4E1;
  LODWORD(STACK[0x2E8]) = a31 ^ 0x7078C236;
  LODWORD(STACK[0x3D0]) = ((a32 << 8) | (a27 << 24) | ((a35 ^ 0xFF) << 16) | a29) ^ 0x25DE427A;
  LODWORD(STACK[0x3E0]) = ((((a36 ^ 0x74) << 16) + ((a26 ^ 0x1A) << 24)) | a30 | ((a37 ^ v39) << 8)) ^ 0x4D30EDD8;
  JUMPOUT(0x1B7760840);
}

uint64_t sub_1B77627EC@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;

  STACK[0x530] = a2 - 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1814 * (a1 == v5)) ^ v2)) - (v2 ^ v3 ^ 0x504)))();
}

void sub_1B7762828()
{
  ((void (*)(unint64_t))STACK[0x2C0])(STACK[0x240]);
  JUMPOUT(0x1B775F394);
}

uint64_t sub_1B77628F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;

  LODWORD(STACK[0x650]) = a16;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18
                                                                        + 8
                                                                        * (((STACK[0x458] != v17)
                                                                          * (((v16 - 359) | 0x40) - 509)) ^ (v16 - 13)))
                                                            - 4))(a1, a2, 2321520888);
}

uint64_t sub_1B7762944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  unint64_t v19;

  v19 = STACK[0x4E8];
  STACK[0x630] -= 32;
  *(_BYTE *)(v19 + 335) = (a18 - 120) ^ *(_BYTE *)(a13 + 335) ^ 0xCD ^ *((_BYTE *)*(&off_1E6CBBAA0 + (a18 ^ 0xE4)) + 11) ^ *((_BYTE *)*(&off_1E6CBBAA0 + (a18 ^ 0xE5)) + 9) ^ *((_BYTE *)*(&off_1E6CBBAA0 + a18 - 205) + 18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8 * a18))(2321520888, 99);
}

void sub_1B7762A04()
{
  JUMPOUT(0x1B7762984);
}

uint64_t sub_1B7762A0C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  STACK[0x530] -= 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a3 + 1065) | 8) ^ (a3 + 820) ^ (a3 + 901))) - 12))();
}

uint64_t sub_1B7762A44@<X0>(int a1@<W8>)
{
  _BYTE *v1;
  char v2;
  uint64_t v3;
  _BYTE *v4;

  v4 = (_BYTE *)STACK[0x510];
  v1[12] = 99;
  v1[13] = 99;
  v1[14] = 99;
  v1[15] = v2 ^ 0xC2;
  v4[16] ^= *v1 ^ 0x63;
  v4[17] ^= v1[1] ^ 0x63;
  v4[18] ^= v1[2] ^ 0x63;
  v4[19] ^= v1[3] ^ 0x63;
  v4[20] ^= v1[4] ^ 0x63;
  v4[21] ^= v1[5] ^ 0x63;
  v4[22] ^= v1[6] ^ 0x63;
  v4[23] ^= v1[7] ^ 0x63;
  v4[24] ^= v1[8] ^ 0x63;
  v4[25] ^= v1[9] ^ 0x63;
  v4[26] ^= v1[10] ^ 0x63;
  v4[27] ^= v1[11] ^ 0x63;
  v4[28] ^= v1[12] ^ 0x63;
  v4[29] ^= v1[13] ^ 0x63;
  v4[30] ^= v1[14] ^ 0x63;
  v4[31] ^= v1[15] ^ 0x63;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (a1 - 1225)) - 8))(3171804577);
}

void sub_1B7762C78()
{
  JUMPOUT(0x1B7762A90);
}

uint64_t sub_1B7762C80(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (((LODWORD(STACK[0x4C4]) != 1123162719) * (v5 ^ a5 ^ (((v5 + 10) ^ a3) * a4))) | (v5 + 10)))
                            - 4))();
}

uint64_t sub_1B7762CD0@<X0>(int a1@<W0>, unsigned int a2@<W5>, int a3@<W6>, int a4@<W8>)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((*(_BYTE *)(v5 + (v4 - 1 + a1)) != 99) * a3) ^ a4))
                            - ((a4 ^ a2)
                             + 440)
                            + 1116))();
}

uint64_t sub_1B7762D08(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v6 != 1123162719) * ((v5 - 10) ^ a5 ^ ((v5 ^ a3) * a4))) | v5))
                            - 4))();
}

uint64_t sub_1B7762D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  int v40;
  uint64_t v41;
  unint64_t v42;

  LODWORD(STACK[0x4C4]) = 1123162719;
  v42 = STACK[0x510];
  STACK[0x488] = 335;
  *(_BYTE *)(v42 + 335) = (a40 ^ 0xBA) * (a40 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v41 + 8 * (((STACK[0x488] == 0) * (v40 - 1185)) ^ (v40 - 723))) - 12))();
}

void sub_1B776324C()
{
  JUMPOUT(0x1B776320CLL);
}

uint64_t sub_1B7763254@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;

  v3 = a1 - 317;
  v4 = (a1 + 9096613) & 0xFF75352D;
  v5 = a1 + 723;
  v6 = ((uint64_t (*)(void))STACK[0x2C0])();
  LODWORD(STACK[0x650]) = v1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * ((v1 != (v5 ^ 0x75A0C321 ^ v4)) | v3)) - 12))(v6);
}

uint64_t sub_1B77632A8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * (((STACK[0x458] != v3)
                                                                          * (((v2 - 359) | 0x40) - 509)) ^ (v2 - 13)))
                                                            - 4))(a1, a2, 2321520888);
}

uint64_t sub_1B77632E4(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v7;

  v4 = LODWORD(STACK[0x42C]);
  v5 = STACK[0x3F8];
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * (v2 - 1249))
                                                                                             - 8);
  v7 = STACK[0x278];
  STACK[0x3F0] = STACK[0x278] + 2353;
  STACK[0x3E0] = v5 + 49;
  STACK[0x3D8] = v7 + 2333;
  STACK[0x3D0] = v5 + 29;
  STACK[0x3C8] = v7 + 2313;
  STACK[0x3C0] = v5 + 9;
  return v6(a1, a2, 2321520888, 1395, v4, 404, 973048872);
}

void sub_1B7763B58()
{
  int v0;

  LODWORD(STACK[0x648]) = v0;
  JUMPOUT(0x1B7763AD8);
}

uint64_t sub_1B7763B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;

  STACK[0x418] = v5;
  v10 = STACK[0x55C];
  *(_DWORD *)(STACK[0x678] + ((LODWORD(STACK[0x55C]) + v6) & 0xFFFFFFFC)) = v7;
  v11 = (a5 ^ 0x41) + v10 - 1353;
  LODWORD(STACK[0x55C]) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((223 * ((v11 & 0xFFFFFFC0) == v8)) ^ a5 ^ 0x41))
                            - (a5 ^ 0x50Au)
                            - 6))();
}

uint64_t sub_1B77650E0@<X0>(unsigned int a1@<W3>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unint64_t v13;

  v10 = v5 + v4;
  v11 = *(_DWORD *)(a2 + 4 * (v10 - 8)) ^ *(_DWORD *)(a2 + 4 * (v10 - 3));
  v12 = *(_DWORD *)(a2 + 4 * (v10 + 7 * (v2 ^ a1) - 450)) ^ *(_DWORD *)(a2 + 4 * (v10 - 14)) ^ (v11 + v9 - (v7 & (2 * v11)));
  HIDWORD(v13) = v12 ^ v9;
  LODWORD(v13) = v12;
  *(_DWORD *)(a2 + 4 * (v3 + v5)) = v9 + (v13 >> 31) - (v7 & (2 * (v13 >> 31)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((v3 + 1 + v5) > 0x4F) * v6) ^ v2)) - 12))();
}

uint64_t sub_1B7765170()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * v0) - 12))();
}

void sub_1B776526C()
{
  JUMPOUT(0x1B776518CLL);
}

uint64_t sub_1B7765288(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((1988 * ((a4 + 1 + v5) > 0x27)) ^ v4)) - 8))();
}

uint64_t sub_1B7765360(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8 + 8 * ((((a2 + 1 + v7) > 0x3B) * a6) | v6))
                                          - 8))(a3);
}

uint64_t sub_1B7765434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((117 * ((a5 + 1 + v6) < 0x50)) ^ v5)))();
}

void sub_1B776550C(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  char v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  int v11;

  LODWORD(STACK[0x584]) = v2;
  LODWORD(STACK[0x53C]) = a2;
  LODWORD(STACK[0x5A4]) = v5;
  LODWORD(STACK[0x4F4]) = v3;
  LODWORD(STACK[0x55C]) = v9 + 80;
  v10 = STACK[0x668];
  v11 = *(_DWORD *)(STACK[0x668] - 0xD547898781B1168);
  LODWORD(STACK[0x440]) = v4;
  *(_DWORD *)(v10 - 0xD547898781B1168) = (v11 ^ v7)
                                         + (v4 ^ v7)
                                         + v7
                                         - ((((v11 ^ v7) + (v4 ^ v7)) << ((v6 - 84) ^ 0xD)) & v8);
  JUMPOUT(0x1B7765590);
}

uint64_t sub_1B7765688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  uint64_t v62;
  unint64_t v63;
  int v64;

  v63 = STACK[0x590];
  v64 = *(unsigned __int8 *)(STACK[0x590] - 0xD547898781B1160) ^ 0x5C;
  if (v64 == 2)
    return ((uint64_t (*)(void))(*(_QWORD *)(v62
                                          + 8
                                          * (((*(_DWORD *)(v63 - 0xD547898781B1164) != 1024156329)
                                            * ((10 * a54) ^ 0x375)) ^ (a5 - 951)))
                              - 12))();
  if (v64 == 1)
    return (*(uint64_t (**)(void))(v62
                                + 8
                                * (((*(_DWORD *)(v63 - 0xD547898781B1164) == 1024156329) * ((a5 - 485) ^ 0x32C)) ^ (a5 + 390))))();
  STACK[0x570] = 91;
  *(_BYTE *)(v63 - 0xD547898781B1165) = (a5 ^ a62 ^ 0xB6) * (a62 + 17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62
                                                                                 + 8
                                                                                 * ((14 * (STACK[0x570] == 0)) | (a5 - 156)))
                                                                     - 8))(a1, a2, a3, 1395);
}

void sub_1B7765FC8()
{
  JUMPOUT(0x1B7765F80);
}

uint64_t sub_1B7765FD0()
{
  return ((uint64_t (*)(void))STACK[0x518])();
}

uint64_t sub_1B7766000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  *(_DWORD *)(STACK[0x2C8] + 52) = ((((LODWORD(STACK[0x64C]) ^ v7) + (v5 ^ v7)) % 0x2710) ^ 0xFCBFF7D8)
                                 + 794713976
                                 + ((2 * (((LODWORD(STACK[0x64C]) ^ v7) + (v5 ^ v7)) % 0x2710)) & 0x6FB0);
  v8 = STACK[0x654];
  LODWORD(STACK[0x5A0]) = STACK[0x654];
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((278 * (v8 == v7)) ^ (a5 - 529))) - 8))();
}

void sub_1B7766090()
{
  _DWORD *v0;

  *v0 = STACK[0x60C];
  v0[85] = STACK[0x57C];
  v0[86] = STACK[0x524];
  v0[87] = STACK[0x504];
  v0[88] = STACK[0x4E4];
  JUMPOUT(0x1B775F3A4);
}

void sub_1B77660C0(uint64_t a1, uint64_t a2, int a3)
{
  STACK[0x530] -= 1616;
  LODWORD(STACK[0x5A0]) = a3 - 226;
  JUMPOUT(0x1B775F3A0);
}

void sub_1B77660DC()
{
  JUMPOUT(0x1B775F3A4);
}

void sub_1B77660E4()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = v0 | 4;
}

uint64_t sub_1B77660EC(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  int v4;
  uint64_t v5;

  STACK[0x368] = v3;
  LODWORD(STACK[0x56C]) = a3 - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((392 * (STACK[0x368] != 0)) ^ (v4 - 74))) - (v4 ^ 0x1CEu) + 1210))();
}

uint64_t sub_1B7766268()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((14 * ((v0 & 0xFFFFFFFE) != ((v1 - 2017892260) & 0x784697FC) + 638864902)) ^ v1))
                            - 12))();
}

uint64_t sub_1B77662B0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _BOOL4 v5;

  LODWORD(STACK[0x56C]) = v2 - 42;
  v4 = STACK[0x628];
  v5 = LODWORD(STACK[0x578]) != 0;
  STACK[0x550] = LODWORD(STACK[0x578]);
  return ((uint64_t (*)(uint64_t, unint64_t))(*(_QWORD *)(v3 + 8 * ((v5 | (16 * v5)) ^ (v1 + 282)))
                                                            - 12))(a1, v4);
}

uint64_t sub_1B77662F4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v4 = ((unint64_t)&STACK[0x550] ^ 0x5FFBDFFFFBFACFEELL)
     - 0x4A0A53AA4A0888EELL
     + ((2 * (_QWORD)&STACK[0x550]) & 0xBFF7BFFFF7F59FD0);
  v5 = v2 + (a2 + 511) - 1575;
  STACK[0x550] = v5;
  *(_BYTE *)(a1 + v5) = (v4 ^ 0xBA) * (v4 + 17);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((STACK[0x550] == 0) | (8 * (STACK[0x550] == 0))) ^ a2)) - 4))();
}

void sub_1B776637C()
{
  JUMPOUT(0x1B776633CLL);
}

void sub_1B7766384()
{
  JUMPOUT(0x1B776638CLL);
}

void sub_1B77663C8(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  v3 = (a2 - 1900117748) & 0x71417F3D;
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2D8])(*(unsigned int *)STACK[0x2D0], a1, (v3 ^ 0xA0AD0DFB) + LODWORD(STACK[0x2F4]));
  *(_DWORD *)(v2 - 192) = 1225351577
                        * ((2 * (((v2 - 192) ^ 0x50DF5AAB) & 0x4A25CCB0) - ((v2 - 192) ^ 0x50DF5AAB) - 1243991221) ^ 0x9BFAF3D2)
                        + 426521725
                        + v3;
  sub_1B778D9C8((_DWORD *)(v2 - 192));
  JUMPOUT(0x1B776646CLL);
}

uint64_t sub_1B77664B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;

  v52 = STACK[0x628];
  v53 = 1672852081 * LODWORD(STACK[0x578]) + 107304275;
  v54 = 1759421093 * ((~(v51 - 192) & 0x553E8987 | (v51 - 192) & 0xAAC17678) ^ 0xE64339D3);
  *(_DWORD *)(v51 - 168) = v45 + v54 + ((v48 + 89) ^ 0x31D153EE);
  *(_BYTE *)(v51 - 164) = -91 * ((~(v51 + 64) & 0x87 | (v51 + 64) & 0x78) ^ 0xD3) + 106;
  *(_DWORD *)(v51 - 144) = v53 ^ v54;
  *(_QWORD *)(v51 - 136) = v47;
  *(_QWORD *)(v51 - 160) = a45;
  *(_QWORD *)(v51 - 152) = v52;
  *(_DWORD *)(v51 - 192) = (v48 - 695) ^ v54;
  *(_QWORD *)(v51 - 184) = v46;
  *(_QWORD *)(v51 - 176) = a44;
  v55 = (*(uint64_t (**)(uint64_t))(v49 + 8 * ((v48 - 331) ^ 0x36C)))(v51 - 192);
  v56 = *(_DWORD *)(v51 - 188);
  LODWORD(STACK[0x56C]) = v56;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50 + 8 * ((v48 - 331) | (4 * (v56 == 1973469985)))) - 4))(v55);
}

uint64_t sub_1B776659C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42)
{
  int v42;
  int v43;
  uint64_t v44;

  return (*(uint64_t (**)(void))(v44
                              + 8
                              * (int)((((LODWORD(STACK[0x624]) ^ v42) != a42 - 2067890218)
                                     * ((((v43 ^ 0x4CD) + 285435419) & 0xEEFC9D2F ^ 0x583)
                                      + (((v43 ^ 0x4CD) - 441) | 0x504))) ^ v43 ^ 0x4CD)))();
}

uint64_t sub_1B7766604@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);

  LODWORD(STACK[0x56C]) = v1 + 135;
  v5 = LODWORD(STACK[0x56C]);
  v6 = 1178560073 * (((v2 | 0x576FD5F7CC5860D8) - v2 + (v2 & 0xA8902A0833A79F20)) ^ 0x4C93851F76CC18BALL);
  *(_DWORD *)(v4 - 168) = (a1 - 504208322) ^ v6;
  *(_DWORD *)(v4 - 160) = (a1 - 2060688228) ^ v6;
  *(_DWORD *)(v4 - 156) = ((a1 - 2060688228) | 0x12) ^ v6;
  *(_QWORD *)(v4 - 176) = 2321520891u - v6;
  *(_DWORD *)(v4 - 184) = v6 + a1 - 2060688228 + 52;
  *(_DWORD *)(v4 - 180) = -1178560073 * (((v2 | 0xCC5860D8) - v2 + (v2 & 0x33A79F20)) ^ 0x76CC18BA);
  *(_QWORD *)(v4 - 192) = v5 ^ v6;
  v7 = ((uint64_t (*)(uint64_t))STACK[0x370])(v4 - 192);
  STACK[0x368] = 0;
  v8 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * *(int *)(v4 - 164)) - 12);
  LODWORD(STACK[0x2F4]) = 1599272713;
  return v8(v7);
}

uint64_t sub_1B7766764()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t (*v4)(void);

  STACK[0x368] = 0;
  v3 = *(_DWORD *)(v1 + 56);
  *(_DWORD *)(v1 + 56) = v3 + 1;
  v4 = (uint64_t (*)(void))(*(_QWORD *)(v2 + 8
                                          * ((1664 * ((v3 - 2040561647) < 0xFFFFFFFA)) ^ (v0 - 1190)))
                         - ((v0 - 1190) ^ 0x6ALL));
  LODWORD(STACK[0x2F4]) = 1599272713;
  return v4();
}

void sub_1B77667BC()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 - 192) = v0
                        + 1190
                        + 1225351577 * (((v1 - 192) & 0x57DCECD1 | ~((v1 - 192) | 0x57DCECD1)) ^ 0xD6DC891C)
                        + 426521725;
  sub_1B778D9C8((_DWORD *)(v1 - 192));
  *(_BYTE *)(v1 - 160) = (51 * ((~(v1 + 64) & 0xE6 | (v1 + 64) & 0x19) ^ 0x31)) ^ 0x2F;
  *(_QWORD *)(v1 - 184) = STACK[0x260];
  *(_QWORD *)(v1 - 168) = STACK[0x258];
  *(_DWORD *)(v1 - 192) = (v0 + 412) ^ (1224239923 * ((~(v1 - 192) & 0xC031CAE6 | (v1 - 192) & 0x3FCE3519) ^ 0x32823731));
  ((void (*)(uint64_t))STACK[0x250])(v1 - 192);
  STACK[0x368] = 0;
  LODWORD(STACK[0x2F4]) = 1599272713;
  JUMPOUT(0x1B7766390);
}

uint64_t sub_1B776689C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v1 = 108757529 * ((((2 * a1) | 0xF677E1C4) - a1 - 2067525858) ^ 0x9BA792C9);
  v2 = *(_DWORD *)a1 ^ v1;
  v3 = *(_DWORD *)(a1 + 4) + v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05);
  v6 = v4 - 561217817;
  v5 = v4 - 561217817 < 0;
  v7 = 561217817 - v4;
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + v2 - 565)
                                        + 8
                                        * ((((v3 - 1045818262) < 4 * (unint64_t)v8)
                                          * ((25 * (v2 ^ 0x33E)) ^ 0x57E)) ^ v2)
                                        - 4)
                            - 12))();
}

uint64_t sub_1B7766970(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v2 + 8 * (v3 ^ (49 * (v1 == 1045818262))))
                                                   - (v3 - 598)
                                                   - ((v3 - 748) ^ 0xFFFFFFFFFFFFFE8CLL)))(a1, 1248496583);
}

uint64_t sub_1B77669B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1B77669C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2
                                                                      + 8
                                                                      * ((103 * (v3 ^ 0x276)) ^ (16
                                                                                               * (((103 * (v3 ^ 0x276)) ^ 0x223) == 32)))))(a1, (103 * (v3 ^ 0x276)) ^ 0x70u, 1971644092, v1);
}

uint64_t sub_1B7766A34@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 8) + (a4 + a5)) = ((a3 ^ v7) >> v8) - ((2 * ((a3 ^ v7) >> v8)) & 0xC7) + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((347 * (a4 - 1 == (a2 ^ 0x274) + 508 + v6)) ^ a2)) - 12))();
}

uint64_t sub_1B7766A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6
                                                                      + 8
                                                                      * (v8 ^ (16
                                                                             * (v7 + ((111 * a5) ^ 0x301) == (v8 ^ 0x223))))))(a1, v8 ^ 0x70u, a3, v5);
}

uint64_t sub_1B7766ACC()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v6;

  v4 = ((v3 - 62636548) & 0x3BBC273 ^ 0xE89F0D45) + v2;
  v6 = v4 > 1827867052 || v4 < v1;
  return (*(uint64_t (**)(void))(v0 + 8 * ((2027 * v6) ^ v3)))();
}

uint64_t sub_1B7766B2C@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v2;
  _QWORD *v3;
  int v4;
  int v5;

  return sub_1B7766A34(a1, v5 + 112, *(_DWORD *)(*v3 + 4 * (v4 - 72612471)), v2, a2);
}

void sub_1B7766B5C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X16 }
}

uint64_t sub_1B7766CA0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((22 * ((2 * (v0 ^ 0x416)) ^ 0x5A9)) ^ 0x49D)
                                          * (((2 * v2) & 0xFF9FFBEE ^ v1) + (v2 ^ 0xFEAA64E7) - 1233241477 != 911095922)) ^ (2 * (v0 ^ 0x416))))
                            - 12))();
}

uint64_t sub_1B7766D14(int a1, int a2)
{
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((59
                                * ((((a1 + v2 - 2144337399) < 8) ^ ((a2 ^ 0x1A) + 84) ^ 0x4B) & 1)) ^ a2 ^ 0x11A)))();
}

uint64_t sub_1B7766D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8
                                                                        + 8
                                                                        * (((((a5 + 1545) | 0x40) ^ 0x6E2)
                                                                          * ((a2 + a7 - 16) > 0xFFFFFFEF)) ^ a5))
                                                            - ((a5 + 107) ^ 0x10CLL)))(a1, a2, v7);
}

uint64_t sub_1B7766DA8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v21;

  v12 = *(_QWORD *)(v11 - 120);
  v13 = (a2 + a4 + 279 + a1 + v9 - 535) + v12;
  v14 = ((_BYTE)a2 + (_BYTE)a4 + (_BYTE)a1 + (_BYTE)v9) & 0xF;
  v15 = v14 + v6 - v13;
  v16 = (v14 | v5) - v13;
  v17 = (v14 | v7) - v13;
  v21 = (unint64_t)(v4 - v12) < 0x10 || v15 < 0x10 || v16 < 0x10 || v17 < 0x10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 + 8 * ((2 * v21) | (8 * v21) | a4))
                                                            - (a4 ^ 0x7DEu)
                                                            + 1754))(a1, a2, v8);
}

uint64_t sub_1B7766E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((55 * (v5 < ((a5 + 320) ^ 0x347u))) ^ a5)) - 8))();
}

uint64_t sub_1B7766E5C(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  int v46;
  int v47;
  uint64_t v48;
  unsigned int v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  int8x16x4_t v56;
  int8x16x4_t v57;

  v56.val[1].i64[0] = (v45 + 11) & 0xF;
  v56.val[1].i64[1] = (v45 + 10) & 0xF;
  v56.val[2].i64[0] = (v45 + 9) & 0xF;
  v56.val[2].i64[1] = (v45 + 8) & 0xF;
  v56.val[3].i64[0] = (v45 + 7) & 0xF;
  v56.val[3].i64[1] = (v45 + 6) & 0xF;
  v57.val[0].i64[0] = (v45 + 5) & 0xF;
  v57.val[0].i64[1] = (v45 + 4) & 0xF;
  v49 = a1 + v46 + a2;
  v57.val[1].i64[0] = (v45 + 3) & 0xF;
  v57.val[1].i64[1] = (v45 + 2) & 0xF;
  v57.val[2].i64[0] = (v45 + 1) & 0xF;
  v57.val[2].i64[1] = v45 & 0xF;
  v57.val[3].i64[0] = (v45 - 1) & 0xF;
  v57.val[3].i64[1] = (v45 + 14) & 0xF;
  v50.i64[0] = 0x6161616161616161;
  v50.i64[1] = 0x6161616161616161;
  v51.i64[0] = 0x6363636363636363;
  v51.i64[1] = 0x6363636363636363;
  v56.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v46 + (_BYTE)a2) & 0xF;
  v56.val[0].i64[1] = (v45 + 12) & 0xF;
  v52.i64[0] = vqtbl4q_s8(v56, (int8x16_t)xmmword_1B77959A0).u64[0];
  v52.i64[1] = vqtbl4q_s8(v57, (int8x16_t)xmmword_1B77959A0).u64[0];
  v53 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v41 - 15 + v49), *(int8x16_t *)(v43 + v56.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v42 + v56.val[0].i64[0] - 15), *(int8x16_t *)(v44 + v56.val[0].i64[0] - 15))));
  v54 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v53, v53, 8uLL), v51), vmulq_s8(v52, v50)));
  *(int8x16_t *)(*(_QWORD *)(v48 - 120) - 15 + v49) = vextq_s8(v54, v54, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(a41
                                        + 8
                                        * (int)((((v47 & 0xFFFFFFF0) == 16) * (((a3 + 1350227872) & 0xAF8527BF) + 620)) ^ a3))
                            - 4))();
}

void sub_1B7766FD8()
{
  JUMPOUT(0x1B7766F54);
}

uint64_t sub_1B7766FE4()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v1 ^ ((v0 ^ 0x27D) + 67) ^ 0x81659DF6) != 0) * ((((v0 ^ 0x27D) - 531) | 0x2A) - 592)) ^ v0 ^ 0x27D)))();
}

uint64_t sub_1B776703C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL4 v14;

  v11 = v6 > 0x9ABD533C;
  v12 = (v8 - 2115786251);
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + v12) = *(_BYTE *)(v0 + v12) ^ *(_BYTE *)(v2 + (v12 & 0xF)) ^ *(_BYTE *)(v1 + (v12 & 0xF)) ^ *(_BYTE *)(v3 + (v12 & 0xF)) ^ (97 * ((v8 - 11) & 0xF)) ^ 0x63;
  v13 = (v5 ^ 0x65C) + v8 - 416919085;
  LODWORD(v12) = v11 ^ (v13 < v4);
  v14 = v13 < v7;
  if (!(_DWORD)v12)
    v11 = v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((1184 * v11) ^ v5)) - 8))();
}

uint64_t sub_1B77670E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((((a7 - 183) | 0x20) ^ 0x22D) * (v7 == a4)) ^ a7)) - 8))();
}

uint64_t sub_1B7767118(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v6;
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v8 + 8
                                                                            * (((a6 - 535) * ((v7 & 8) == 0)) ^ a6))
                                                           - (a6 ^ 0x4FEu)
                                                           + 1750))(a1, a2, (v6 - a4));
}

uint64_t sub_1B7767154(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  char v52;
  uint64_t v53;
  int8x16x4_t v55;

  *(_DWORD *)(v49 - 144) = v48;
  v50 = (a7 - 969) & v48;
  *(_QWORD *)(v49 - 128) = v41 - 7;
  *(_QWORD *)(v49 - 136) = *(_QWORD *)(v49 - 120) - 7;
  v51 = -a4;
  *(_DWORD *)(v49 - 152) = v50;
  v52 = v46 + a1 + v47;
  v53 = (v51 + a1 + v47 + a2);
  v55.val[0].i64[0] = ((_BYTE)v51 + (_BYTE)a1 + (_BYTE)v47 + (_BYTE)a2) & 0xF;
  v55.val[0].i64[1] = ((_BYTE)v51 + v52 + 12) & 0xF;
  v55.val[1].i64[0] = ((_BYTE)v51 + v45 + (((_BYTE)a7 + 60) & 0x97 ^ 0xE)) & 0xF;
  v55.val[1].i64[1] = ((_BYTE)v51 + v52 + 10) & 0xF;
  v55.val[2].i64[0] = ((_BYTE)v51 + v52 + 9) & 0xF;
  v55.val[2].i64[1] = ((_BYTE)v51 + v52 + 8) & 0xF;
  v55.val[3].i64[0] = ((_BYTE)v51 + v52 + 7) & 0xF;
  v55.val[3].i64[1] = ((_BYTE)v51 + v52 + 6) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v49 - 136) + v53) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(*(_QWORD *)(v49 - 128) + v53), *(int8x8_t *)(v43 + (v53 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v42 + (v53 & 0xF) - 7), *(int8x8_t *)(v44 + (v53 & 0xF) - 7)))), (int8x8_t)0x6363636363636363), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v55, (int8x16_t)xmmword_1B77959B0), (int8x8_t)0x6161616161616161)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a41 + 8 * ((115 * (v51 != 8 - v50)) ^ (a7 - 15))) - 8))((__n128)xmmword_1B77959B0);
}

void sub_1B77672C0()
{
  JUMPOUT(0x1B77671E0);
}

uint64_t sub_1B77672E8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((v0 + 1105) ^ 0x1E3) * (*(_DWORD *)(v2 - 144) == *(_DWORD *)(v2 - 152))) ^ v0))
                            - (v0 ^ 0x64Bu)
                            + 1746))();
}

uint64_t sub_1B7767328(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = (a3 - 911095923);
  *(_BYTE *)(*(_QWORD *)(v12 - 120) + v13) = *(_BYTE *)(v6 + v13) ^ *(_BYTE *)(v8 + (v13 & 0xF)) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ *(_BYTE *)(v9 + (v13 & 0xF)) ^ ((v13 & 0xF) * (38 * ~(_BYTE)a6 + 123)) ^ 0x63;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1174 * (a3 - 1 == v10)) ^ (a6 - 1496))) - 12))();
}

uint64_t sub_1B77673A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  char v37;

  v35 = *(_QWORD *)(v32 + 24);
  *(int8x16_t *)(v34 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v32 + 40) - 0x74538802C908E0DBLL), (int8x16_t)xmmword_1B77959C0);
  if (*(_QWORD *)(v34 - 120))
    v36 = v35 == 0x3AC75C5FABFFD319;
  else
    v36 = 1;
  v37 = v36;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 + 8 * (int)((352 * (((a5 + 91) ^ v37) & 1)) ^ a5)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_1B776742C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  _BOOL4 v34;

  v34 = ((BYTE4(a10) + 7) & 0xF) == 0 && HIDWORD(a10) != 1157248569;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * (int)((((a5 + 111) ^ (a5 - 286) ^ 0x7D2) * v34) ^ a5)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_1B7767478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,unsigned int a40,uint64_t a41)
{
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  char *v45;
  int v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  char *v53;
  int v54;
  char *v55;
  char v56;
  unint64_t v57;
  int v58;
  int v59;
  unsigned __int8 v60;
  int v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  uint64_t v65;
  int v66;
  unint64_t v67;
  uint64_t v68;
  unsigned int v69;
  int v70;
  uint64_t v71;
  char *v72;
  int v73;
  unsigned int v74;
  char *v75;
  char *v76;
  char *v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  unsigned int v106;
  int v107;
  int v108;
  uint64_t v109;
  char *v110;
  char *v111;
  int v112;
  char *v113;
  unsigned int v114;
  unsigned __int8 *v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  unsigned __int8 *v121;
  int v122;
  unsigned int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  unsigned int v133;
  char *v134;
  uint64_t v135;
  char *v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  uint64_t v141;
  int v142;
  unsigned int v143;
  int v144;
  int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  int v150;
  unsigned int v151;
  unsigned int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  int v162;
  int v163;
  int v164;
  unsigned int v165;
  int v166;
  unsigned int v167;
  int v168;
  unsigned int v169;
  int v170;
  int v171;
  unsigned int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  unsigned int v178;
  int v179;
  unsigned int v180;
  int v181;
  int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  unsigned int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  int v195;
  unsigned int v196;
  int v197;
  unsigned int v198;
  int v199;
  int v200;
  int v201;
  unsigned int v202;
  int v203;
  int v204;
  unsigned int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  unsigned int v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  char *v217;
  int v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  int v223;
  int v224;
  unsigned int v225;
  char *v226;
  uint64_t v227;
  uint64_t v228;
  char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char *v238;
  char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  __int128 v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  int v255;
  int v256;
  int v257;
  int v258;
  int v259;
  unsigned int v260;
  int v261;
  unsigned int v262;
  unsigned int v263;

  v45 = (char *)*(&off_1E6CBBAA0 + v43 - 783) - 12;
  v46 = v45[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD318) ^ 0x85];
  HIDWORD(v47) = (v43 + 790) ^ v46 ^ 0x30;
  LODWORD(v47) = (v46 ^ 0x80) << 24;
  v48 = (v47 >> 30) ^ 0x9F;
  v49 = (uint64_t)*(&off_1E6CBBAA0 + (int)(v43 & 0xD2B758C1));
  v50 = *(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30ELL) ^ 0xBFLL));
  HIDWORD(v47) = v50 ^ 7;
  LODWORD(v47) = (v50 ^ 0x60) << 24;
  LOBYTE(v50) = v47 >> 28;
  v51 = v48 << 16;
  v52 = v45[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD314) ^ 0x6FLL];
  HIDWORD(v47) = v52 ^ 0x2E;
  LODWORD(v47) = (v52 ^ 0x80) << 24;
  v53 = (char *)*(&off_1E6CBBAA0 + v43 - 758) - 12;
  v54 = v50 | ((v53[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30FLL) ^ 0xB7] ^ 0x9A) << 8);
  v55 = (char *)*(&off_1E6CBBAA0 + (v43 ^ 0x396)) - 4;
  v56 = v55[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30DLL) ^ 0xD8];
  v57 = ((v53[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30BLL) ^ 0xC7] ^ 0x7ALL) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v56 ^ 0xEAu) << 24);
  v58 = (((v47 >> 30) ^ 0x68) << 16) | ((v53[*(unsigned __int8 *)(v42
                                                                                                  - 0x3AC75C5FABFFD313) ^ 0xDFLL] ^ 0xBB) << 8);
  v59 = *(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30ALL) ^ 0xBCLL));
  HIDWORD(v47) = v59 ^ 7;
  LODWORD(v47) = (v59 ^ 0x60) << 24;
  v60 = v47 >> 28;
  v61 = v58 | ((v55[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD315) ^ 0xAFLL] ^ 0x3A) << 24);
  v62 = *(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD312) ^ 0x98));
  HIDWORD(v47) = v62 ^ 7;
  LODWORD(v47) = (v62 ^ 0x60) << 24;
  v63 = v61 & 0xFFFFFF00 | (v47 >> 28);
  LODWORD(v49) = *(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD316) ^ 0xD0));
  HIDWORD(v47) = v49 ^ 7;
  LODWORD(v47) = (v49 ^ 0x60) << 24;
  v64 = v51 | ((v53[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD317) ^ 0x49] ^ 0x31) << 8) | ((v55[*v41 ^ 0xFELL] ^ 0xFFFFFFE3) << 24);
  LODWORD(v53) = v45[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD30CLL) ^ 0xB6];
  LOBYTE(v49) = (v47 >> 28) ^ 0x3C;
  HIDWORD(v47) = v53 ^ 0x2E;
  LODWORD(v47) = (v53 ^ 0x80) << 24;
  v65 = (v47 >> 30) ^ 0x21;
  LODWORD(v45) = v45[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD310) ^ 0xC8];
  HIDWORD(v47) = v45 ^ 0x2E;
  LODWORD(v47) = (v45 ^ 0x80) << 24;
  v66 = v55[*(unsigned __int8 *)(v42 - 0x3AC75C5FABFFD311) ^ 0x18];
  v67 = (v57 | (v65 << 16) | v60 ^ 0x68) ^ 0x75F49EF4;
  v68 = ((unsigned __int16)((v57 | v60 ^ 0x68) ^ 0x9EF4) >> 8);
  v69 = v54 & 0xFF00FFFF | (((v47 >> 30) ^ 0x37) << 16) | ((v66 ^ 0xA5) << 24);
  v70 = v68 + 1387681372 + (~(2 * (v67 >> 8)) | 0xFFFFFF47);
  v71 = v68 ^ 0xF5;
  v72 = (char *)*(&off_1E6CBBAA0 + v43 - 901) - 12;
  v73 = (v70 + 1) ^ *(_DWORD *)&v72[4 * v71];
  v74 = v73 - ((2 * v73) & 0xCC751680);
  v75 = (char *)*(&off_1E6CBBAA0 + v43 - 806) - 8;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (v56 ^ 0xF5)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  v76 = (char *)*(&off_1E6CBBAA0 + v43 - 788) - 12;
  LODWORD(v65) = (v47 >> 2) ^ *(_DWORD *)&v76[4 * (v65 ^ 0xDD)] ^ (v74 - 432370880);
  v77 = (char *)*(&off_1E6CBBAA0 + (v43 ^ 0x3CB)) - 4;
  v262 = v64 & 0xFFFFFF00 | v49;
  v263 = v63;
  v78 = *(_DWORD *)&v77[4 * (v60 ^ 0xD9)] ^ v262 ^ (v65 - ((2 * v65) & 0x83177384) + 1099676098);
  v260 = v69;
  v258 = v78 ^ v63 ^ 0x2789BBD4;
  v79 = v69 ^ 0xE6 ^ v258;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v79 ^ v67) >> 24) ^ 0x21)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  LODWORD(v49) = ((v47 >> 2) - ((2 * (v47 >> 2)) & 0x83177384) + 1099676098) ^ *(_DWORD *)&v77[4
                                                                                             * ((v79 ^ v67) ^ 0xDE)];
  v256 = v79 ^ v67;
  v259 = v78;
  v255 = *(_DWORD *)&v72[4 * (((unsigned __int16)(v79 ^ v67) >> 8) ^ 0x1E)] ^ *(_DWORD *)&v76[4 * (((v79 ^ v67) >> 16) ^ 0x8F)] ^ v78 ^ ((((unsigned __int16)(v79 ^ v67) >> 8) ^ 0xEB) - ((2 * (((v79 ^ v67) >> 8) ^ 0x4BA6EB)) & 0xB8) + 1387681372) ^ (v49 - ((2 * v49) & 0xCC751680) - 432370880);
  v80 = v255 ^ 0x76E748E2 ^ v78 ^ v63;
  v261 = v67;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v80 ^ v67) >> 24) ^ 0xA2)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  v81 = v80 ^ v67 ^ 0xC84590C6;
  v82 = *(_DWORD *)&v72[4 * (BYTE1(v81) ^ 0xF5)] ^ *(_DWORD *)&v76[4
                                                                 * (((v80 ^ v67) >> 16) ^ 0x6C)] ^ (BYTE1(v81) - ((v81 >> 7) & 0xB8) + 1387681372) ^ ((v47 >> 2) - ((2 * (v47 >> 2)) & 0xCC751680) - 432370880);
  LODWORD(v254) = v80 ^ v67;
  HIDWORD(v254) = v80;
  HIDWORD(v253) = v255 ^ 0x76E748E2 ^ *(_DWORD *)&v77[4 * ((v80 ^ v67) ^ 0x83)] ^ (v82
                                                                                                  - ((2 * v82) & 0x83177384)
                                                                                                  + 1099676098);
  LODWORD(v49) = HIDWORD(v253) ^ 0x2789BBD4 ^ v80 ^ 0x8EDEEA78;
  v257 = v79;
  HIDWORD(v252) = v80 ^ v79;
  LODWORD(v253) = HIDWORD(v253) ^ 0x2789BBD4 ^ v80;
  v83 = v49 ^ v80 ^ v79;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v83 ^ v81) >> 24) ^ 0x67)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  v84 = (v47 >> 2) ^ *(_DWORD *)&v72[4 * (((unsigned __int16)(v83 ^ v81) >> 8) ^ 0x97)] ^ ((((unsigned __int16)(v83 ^ v81) >> 8) ^ 0x62) - ((2 * (((v83 ^ v81) >> 8) ^ 0xD8B62)) & 0xB8) + 1387681372);
  v85 = (v84 - ((2 * v84) & 0x83177384) + 1099676098) ^ *(_DWORD *)&v77[4 * ((v83 ^ v81) ^ 0xE1)];
  v86 = HIDWORD(v253) ^ 0x2789BBD4 ^ *(_DWORD *)&v76[4 * (((v83 ^ v81 ^ 0x2142BA5) >> 16) ^ 0xB6)] ^ (v85 - ((2 * v85) & 0xCC751680) - 432370880);
  v87 = v86 ^ v49;
  HIDWORD(v251) = v83 ^ v81;
  LODWORD(v252) = v83;
  LODWORD(v49) = v83 ^ 0x5EF1BA37;
  HIDWORD(v250) = v87;
  v87 ^= 0x307C325Cu;
  LODWORD(v250) = v87 ^ v83 ^ 0x5EF1BA37;
  v88 = v250 ^ v83 ^ v81;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (HIBYTE(v88) ^ 0xA4)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  LODWORD(v65) = ((v47 >> 2) - ((2 * (v47 >> 2)) & 0x83177384) + 1099676098) ^ *(_DWORD *)&v77[4
                                                                                             * (v88 ^ 0x18)];
  LODWORD(v251) = v86;
  v89 = *(_DWORD *)&v76[4 * (BYTE2(v88) ^ 0xCA)] ^ *(_DWORD *)&v72[4
                                                                 * (((unsigned __int16)(v88 ^ 0x7B5D) >> 8) ^ 0xF5)] ^ v86 ^ (((unsigned __int16)(v88 ^ 0x7B5D) >> 8) - (((v88 ^ 0xCEE37B5D) >> 7) & 0xB8) + 1387681372) ^ 0x23CE44E8 ^ (v65 - ((2 * v65) & 0xCC751680) - 432370880);
  v90 = v89 ^ (v49 - ((2 * v49) & 0x479C89D0) + 600720616);
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v90 ^ v88 ^ 0xCEE37B5D) >> 24) ^ 0x70)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  LODWORD(v49) = ((v47 >> 2) - ((2 * (v47 >> 2)) & 0xCC751680) - 432370880) ^ *(_DWORD *)&v76[4
                                                                                            * (((v90 ^ v88 ^ 0xCEE37B5D ^ 0xF3443494) >> 16) ^ 0xE4)];
  LODWORD(v49) = (v49 - ((2 * v49) & 0x83177384) + 1099676098) ^ *(_DWORD *)&v77[4
                                                                               * ((v90 ^ v88 ^ 0x5D) ^ 0x91)];
  LODWORD(v248) = v90 ^ v88 ^ 0xCEE37B5D;
  LODWORD(v49) = (v49 - ((2 * v49) & 0xA56CACB8) + 1387681372) ^ *(_DWORD *)&v72[4
                                                                               * (((unsigned __int16)(v248 ^ 0xBBD4) >> 8) ^ 0xF5)];
  v91 = v89 ^ ((unsigned __int16)(v248 ^ 0xBBD4) >> 8) ^ (v49 - ((2 * v49) & 0x479C89D0) + 600720616);
  HIDWORD(v248) = v90;
  v249 = __PAIR64__(v88, v89);
  LODWORD(v247) = v89 ^ (v87 - ((2 * v87) & 0x479C89D0) + 600720616);
  HIDWORD(v246) = v91 ^ v247;
  LODWORD(v49) = v91 ^ v247 ^ 0xE6F58988;
  v92 = v49 ^ v90;
  v93 = v49 ^ v90 ^ v248 ^ 0x1A89BBD4;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (HIBYTE(v93) ^ 0x43)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  *(_QWORD *)((char *)&v246 + 4) = __PAIR64__(v49 ^ v90, v93);
  v94 = v93 ^ 0x299B7ABE;
  v95 = *(_DWORD *)&v72[4 * (((unsigned __int16)(v93 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)&v76[4 * (((v93 ^ 0x4D501F31) >> 16) ^ 0xE2)] ^ (((unsigned __int16)(v93 ^ 0x7ABE) >> 8) - (((v93 ^ 0x299B7ABE) >> 7) & 0xB8) + 1387681372) ^ ((v47 >> 2) - ((2 * (v47 >> 2)) & 0xCC751680) - 432370880);
  HIDWORD(v247) = v91;
  v96 = v91 ^ *(_DWORD *)&v77[4 * (v93 ^ 0xFB)] ^ (v95 - ((2 * v95) & 0x83177384) + 1099676098);
  HIDWORD(v245) = v96 ^ v49;
  LODWORD(v49) = v96 ^ v49 ^ 0x5BF36347;
  LODWORD(v245) = v49 ^ v92;
  LODWORD(v65) = v49 ^ v92 ^ 0x2745D0FF;
  v97 = v65 ^ v94;
  v98 = v65 ^ v94 ^ 0x516EF336;
  v99 = v65 ^ v94 ^ 0x3DCC6B2B;
  v100 = (((unsigned __int16)(v97 ^ 0x6B2B) >> 8) - (((v97 ^ 0x3DCC6B2B) >> 7) & 0xB8) + 1387681372) ^ *(_DWORD *)&v72[4 * (((unsigned __int16)(v97 ^ 0x6B2B) >> 8) ^ 0xF5)];
  v101 = (v100 - ((2 * v100) & 0x83177384) + 1099676098) ^ *(_DWORD *)&v77[4 * ((v65 ^ v94) ^ 0x6E)];
  HIDWORD(v244) = v97;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (HIBYTE(v97) ^ 0x57)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  LODWORD(v246) = v96;
  LODWORD(v244) = (v47 >> 2) ^ *(_DWORD *)&v76[4 * (BYTE2(v98) ^ 0x8B)] ^ v96 ^ (v101
                                                                               - ((2 * v101) & 0xCC751680)
                                                                               - 432370880);
  HIDWORD(v243) = v244 ^ 0x930000ED ^ v49;
  LODWORD(v243) = HIDWORD(v243) ^ 0x8D06EA22 ^ v65;
  v102 = v243 ^ v99 ^ 0x9289BB39;
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v243 ^ v99) >> 24) ^ 0x39)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  HIDWORD(v242) = v243 ^ v99;
  v103 = ((unsigned __int16)(v243 ^ v99 ^ 0xAA41) >> 8);
  v104 = *(_DWORD *)&v77[4 * ((v243 ^ v99) ^ 4)] ^ *(_DWORD *)&v72[4 * (v103 ^ 0xF5)] ^ 0x133DEF9E ^ (v47 >> 2);
  v105 = *(_DWORD *)&v76[4 * (BYTE2(v102) ^ 0x7E)] ^ v244 ^ 0x930000ED ^ v103 ^ 0xE7BDBEB9 ^ (v104
                                                                                            - ((2 * v104) & 0xCC751680)
                                                                                            - 432370880);
  v106 = (HIDWORD(v243) ^ 0x8D06EA22) - ((2 * (HIDWORD(v243) ^ 0x8D06EA22)) & 0xCF7B7D72);
  LODWORD(v65) = v105 ^ (v65 - ((2 * v65) & 0xCF7B7D72) - 406995271);
  HIDWORD(v47) = *(_DWORD *)&v75[4 * (((v65 ^ HIDWORD(v242) ^ 0x53DEAA41) >> 24) ^ 0x44)];
  LODWORD(v47) = HIDWORD(v47) ^ 0xD2664058;
  v107 = *(_DWORD *)&v72[4 * (((unsigned __int16)(v65 ^ WORD2(v242) ^ 0xAA41) >> 8) ^ 0xFD)] ^ *(_DWORD *)&v77[4 * ((v65 ^ BYTE4(v242) ^ 0x41) ^ 0xC4)] ^ ((((unsigned __int16)(v65 ^ WORD2(v242) ^ 0xAA41) >> 8) ^ 8) - ((2 * (((v65 ^ HIDWORD(v242) ^ 0x53DEAA41) >> 8) ^ 0x2E3F08)) & 0xB8) + 1387681372) ^ ((v47 >> 2) - ((2 * (v47 >> 2)) & 0x83177384) + 1099676098);
  HIDWORD(v241) = v65 ^ HIDWORD(v242) ^ 0x53DEAA41 ^ 0xF5AE5B63;
  LODWORD(v49) = (v107 - 432370880 + (~(2 * v107) | 0x338AE97F) + 1) ^ *(_DWORD *)&v76[4
                                                                                     * (((v65 ^ HIDWORD(v242) ^ 0x53DEAA41) >> 16) ^ 0x16)];
  v108 = v49 - ((2 * v49) & 0xCF7B7D72);
  v109 = (uint64_t)*(&off_1E6CBBAA0 + (v43 ^ 0x3E4));
  v110 = (char *)*(&off_1E6CBBAA0 + (v43 ^ 0x391)) - 12;
  v111 = (char *)*(&off_1E6CBBAA0 + v43 - 887) - 8;
  v112 = v111[*(unsigned __int8 *)(v44 - 109) ^ 0xA5];
  HIDWORD(v47) = v112 ^ 0xB;
  LODWORD(v47) = ~v112 << 24;
  v113 = (char *)*(&off_1E6CBBAA0 + (v43 ^ 0x3AA)) - 12;
  v238 = v111;
  v240 = v109;
  v239 = v110;
  LODWORD(v77) = (((((v47 >> 30) ^ 0xDB) >> 2) | (((v47 >> 30) ^ 0xDB) << 6)) | ((v110[*(unsigned __int8 *)(v44 - 111) ^ 0x7ALL] ^ 0xD8) << 16) | ((v113[*(unsigned __int8 *)(v44 - 112) ^ 0x78] ^ 0xD) << 24) | (((*(_BYTE *)(v109 + (*(unsigned __int8 *)(v44 - 110) ^ 0x5DLL)) + (*(_BYTE *)(v44 - 110) ^ 0x52) + 61) ^ 0x5D) << 8)) ^ 0x60265771;
  LODWORD(v45) = (v111[*(unsigned __int8 *)(v44 - 101) ^ 0x60] | ((v110[*(unsigned __int8 *)(v44 - 103) ^ 5] ^ 0x89) << 16) | (((*(_BYTE *)(v109 + (*(unsigned __int8 *)(v44 - 102) ^ 4)) + (*(_BYTE *)(v44 - 102) ^ 0xB) + 61) ^ 0x33) << 8) | ((v113[*(unsigned __int8 *)(v44 - 104) ^ 0x1CLL] ^ 0xF8) << 24)) ^ 0xDFB8C13A;
  LODWORD(v67) = ((v111[*(unsigned __int8 *)(v44 - 105) ^ 0x28] ^ 0xC1) & 0xFFFF00FF | ((((*(_BYTE *)(v44 - 106) ^ 0xAC) + *(_BYTE *)(v109 + (*(unsigned __int8 *)(v44 - 106) ^ 0xA3)) + 61) ^ 0xF6) << 8) | ((v113[*(unsigned __int8 *)(v44 - 108) ^ 0xB2] ^ 0xF) << 24) | ((v110[*(unsigned __int8 *)(v44 - 107) ^ 0x27] ^ 0xED) << 16)) ^ 0xF3291982;
  v114 = ((v111[*(unsigned __int8 *)(v44 - 97) ^ 0x7BLL] ^ 0xB4) & 0xFFFF00FF | ((((*(_BYTE *)(v44 - 98) ^ 0xD0) + *(_BYTE *)(v109 + (*(unsigned __int8 *)(v44 - 98) ^ 0xDFLL)) + 61) ^ 0xE4) << 8) | ((v110[*(unsigned __int8 *)(v44 - 99) ^ 0xAALL] ^ 0xBB) << 16) | ((v113[*(unsigned __int8 *)(v44 - 100) ^ 0x45] ^ 0x37) << 24)) ^ 0x84E4AA98;
  HIDWORD(v236) = v105 ^ (v106 - 406995271);
  LODWORD(v237) = (v43 + 790) ^ 0x6F0;
  LODWORD(v236) = (v43 + 790) ^ 0x6D2;
  LODWORD(v242) = v105;
  LODWORD(v235) = (v108 - 406995271) ^ v105;
  HIDWORD(v235) = (v43 + 790) ^ 0x61A;
  HIDWORD(v234) = (v43 + 790) & 0xD89B0053;
  LODWORD(v234) = (v43 + 790) ^ 0x609;
  *(_DWORD *)(v44 - 128) = v43 + 790;
  HIDWORD(v233) = (v43 + 790) ^ 0x690;
  LODWORD(v241) = v65 ^ 0x626A2240;
  HIDWORD(v237) = (v106 - 406995271) ^ 0x3DC8BA5D ^ (v108 - 406995271);
  LODWORD(v233) = HIDWORD(v237) ^ v65 ^ 0x626A2240;
  *(_QWORD *)(v44 - 208) = 7;
  v115 = *(unsigned __int8 **)(v44 - 120);
  v116 = v115[7];
  LODWORD(v75) = *(_DWORD *)(v44 - 128);
  v117 = ((_DWORD)v75 - 1771) & 0x76CD56ED ^ 0x76CD56EDu;
  *(_QWORD *)(v44 - 160) = v117;
  v118 = v111[v116 ^ 0x41];
  v119 = v115[v117] ^ 0x60;
  *(_QWORD *)(v44 - 152) = 8;
  *(_QWORD *)(v44 - 136) = 1;
  v120 = v115[1];
  v121 = v115;
  LODWORD(v119) = v113[v119] ^ 0x8C;
  LODWORD(v115) = v113[v115[8] ^ 0xC1] ^ 0x38;
  LODWORD(v111) = v239[v120 ^ 0x66] ^ 0x34;
  *(_QWORD *)(v44 - 144) = 15;
  v122 = (_DWORD)v111 << 16;
  LODWORD(v111) = v238[v121[15] ^ 0xE9];
  *(_QWORD *)(v44 - 176) = 11;
  LODWORD(v111) = v111 ^ 0x16;
  v123 = v111 | ((_DWORD)v119 << 24);
  v124 = v238[v121[11] ^ 0xC3];
  *(_QWORD *)(v44 - 184) = 0;
  LODWORD(v119) = v122 | ((v113[*v121 ^ 0x30] ^ 0xBC) << 24);
  LOBYTE(v104) = v124 ^ 0xDC;
  *(_QWORD *)(v44 - 168) = 2;
  v125 = v124 ^ 0xDC | ((_DWORD)v115 << 24);
  LODWORD(v119) = v119 & 0xFFFF00FF | (((*(_BYTE *)(v240 + (v121[2] ^ 0xC0)) + (v121[2] ^ 0xCF) + 61) ^ 0xF9) << 8);
  LOBYTE(v115) = v118 ^ 0xC6;
  v126 = v118 ^ 0xC6 | ((v113[v121[4] ^ 0xFCLL] ^ 2) << 24);
  *(_QWORD *)(v44 - 224) = 4;
  *(_QWORD *)(v44 - 216) = 5;
  v127 = v239[v121[5] ^ 0xA9];
  *(_QWORD *)(v44 - 232) = 9;
  v128 = v239[v121[9] ^ 0x5DLL] ^ 0xE7;
  *(_QWORD *)(v44 - 200) = 10;
  LODWORD(v71) = (v128 << 16) | (((*(_BYTE *)(v240 + (v121[10] ^ 0xD5)) + (v121[10] ^ 0xDA) + 61) ^ 0xCF) << 8) | v125;
  *(_QWORD *)(v44 - 192) = 14;
  v129 = (*(_BYTE *)(v240 + (v121[14] ^ 0xE4)) + (v121[14] ^ 0xEB) - 67) << 8;
  *(_QWORD *)(v44 - 248) = 13;
  v130 = v129 | ((v239[v121[13] ^ 0x92] ^ 0xDA) << 16);
  *(_QWORD *)(v44 - 240) = 3;
  v131 = v238[v121[3] ^ 0xDCLL] ^ 2;
  *(_QWORD *)(v44 - 256) = 6;
  v132 = ((v127 ^ 9) << 16) | (((*(_BYTE *)(v240 + (v121[6] ^ 0x4FLL)) + (v121[6] ^ 0x40) + 61) ^ 0xB7) << 8) | v126;
  v133 = v77 ^ v262 ^ ((v131 | v119) - 2 * ((v131 | v119) & 0x599FEE5A ^ v131 & 0x12) - 643830200);
  LODWORD(v77) = v67 ^ v263 ^ (v132 + 1250992187 - 2 * (v132 & 0x4A90A03F ^ v115 & 4));
  LODWORD(v111) = v114 ^ v261 ^ ((v130 | v123)
                               + 1029509921
                               - 2 * ((v130 | v123) & 0x3D5D133B ^ v111 & 0x1A));
  LODWORD(v49) = v45 ^ v260 ^ (v71 + 1711372419 - 2 * (v71 & 0x66017893 ^ v104 & 0x10));
  v134 = (char *)*(&off_1E6CBBAA0 + (int)v75 - 1595) - 12;
  v135 = (uint64_t)*(&off_1E6CBBAA0 + (int)v75 - 1701);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0x3F));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v119) = (v47 >> 1) ^ *(_DWORD *)&v134[4 * (BYTE2(v111) ^ 0x34)] ^ ((BYTE2(v111) ^ 0x68)
                                                                           - 891067965
                                                                           - 2
                                                                           * (((v111 >> 16) ^ 0xB768) & 0xD7 ^ (v111 >> 16) & 0x14));
  v136 = (char *)*(&off_1E6CBBAA0 + (int)v237) - 8;
  v137 = *(_DWORD *)&v136[4 * (v49 ^ 0xC6)] ^ ((BYTE2(v133) ^ 0xD5)
                                                              - 891067965
                                                              - ((2 * (HIWORD(v133) ^ 0x6CD5)) & 0x186)) ^ ((v49 ^ 0xAB) - 764586316 + ((2 * (v49 ^ 0xAB) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v134[4 * (BYTE2(v133) ^ 0x89)];
  v138 = *(_DWORD *)&v134[4 * (BYTE2(v77) ^ 0x8C)] ^ *(_DWORD *)&v136[4 * (v111 ^ 0xB6)] ^ ((v111 ^ 0xDB) - 764586316 + ((2 * (v111 ^ 0xDB) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ ((BYTE2(v77) ^ 0xD0) - 891067965 - 2 * (((v77 >> 16) ^ 0xC8D0) & 0xCB ^ (v77 >> 16) & 8));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v77 >> 24) ^ 0xC8));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v45) = ((BYTE2(v49) ^ 0xAD) - 891067965 - ((2 * (WORD1(v49) ^ 0x3FAD)) & 0x186)) ^ *(_DWORD *)&v136[4 * (v133 ^ 0x1C)] ^ ((v133 ^ 0x71) - 764586316 + ((2 * (v133 ^ 0x71) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ (v47 >> 1) ^ *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0xF1)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v133) ^ 0x6C));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v115) = v47 >> 1;
  v139 = (_DWORD)v45 - 1679586482 - ((2 * (_DWORD)v45) & 0x37C7169C);
  v140 = (v77 ^ 0x10) - 764586316 + ((2 * (v77 ^ 0x10) + 126) & 0x68 ^ 0xCDE2FFFF);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0xB7));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v141 = (uint64_t)*(&off_1E6CBBAA0 + (int)v75 - 1662);
  LODWORD(v71) = *(_DWORD *)(v141 + 4 * (BYTE1(v133) ^ 0xDEu)) ^ v257 ^ *(_DWORD *)&v136[4
                                                                                         * (v77 ^ 0x7D)] ^ (v119 - 1679586482 - ((2 * v119) & 0x37C7169C));
  LOWORD(v133) = v71 ^ ((v77 ^ 0x10) + 22196 + ~((2 * (v77 ^ 0x10) + 126) & 0x68));
  LODWORD(v119) = (v137 - 1679586482 - ((2 * v137) & 0x37C7169C)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v77) ^ 0x2Fu)) ^ (v47 >> 1);
  LODWORD(v49) = *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x29u)) ^ v259 ^ v115 ^ (v138
                                                                                             - 1679586482
                                                                                             - ((2 * v138) & 0x37C7169C));
  LODWORD(v111) = *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0x66u)) ^ v258 ^ v139;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v71 ^ ~v140) >> 24));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v142 = v47 >> 1;
  LODWORD(v115) = ((v71 ^ v140) >> 16) ^ 0x49;
  v143 = (_DWORD)v115 - 891067965 - ((2 * (((v71 ^ v140) >> 16) ^ 0xFF49)) & 0x186);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0x91));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v71) = v47 >> 1;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0xA3));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v144 = v71 ^ *(_DWORD *)&v134[4 * (BYTE2(v111) ^ 0xF0)] ^ ((BYTE2(v111) ^ 0xAC)
                                                           - 891067965
                                                           - ((2 * ((v111 >> 16) ^ 0xA3AC)) & 0x186));
  LODWORD(v119) = (v119 - ((2 * v119) & 0xE3B2B508) + 1910069892) ^ v256;
  v145 = (v47 >> 1) ^ *(_DWORD *)&v136[4 * (v49 ^ 0x7B)] ^ *(_DWORD *)&v134[4
                                                                                           * (v115 ^ 0x5C)] ^ v143 ^ ((v49 ^ 0x16) - 764586316 + ((2 * (v49 ^ 0x16) + 126) & 0x68 ^ 0xCDE2FFFF));
  LODWORD(v115) = v145 - 1679586482 - ((2 * v145) & 0x37C7169C);
  v146 = (v144 - 1679586482 - ((2 * v144) & 0x37C7169C)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v133) ^ 0x2Cu));
  v147 = v142 ^ *(_DWORD *)&v136[4 * (v111 ^ 3)] ^ ((v111 ^ 0x6E)
                                                                   - 764586316
                                                                   + ((2 * (v111 ^ 0x6E) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ ((BYTE2(v119) ^ 0xE0) - 891067965 - 2 * ((WORD1(v119) ^ 0x1FE0) & 0xDF ^ WORD1(v119) & 0x1C)) ^ *(_DWORD *)&v134[4 * (BYTE2(v119) ^ 0xBC)];
  v148 = *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0x2E)] ^ ((BYTE2(v49) ^ 0x72)
                                                    - 891067965
                                                    - 2 * ((WORD1(v49) ^ 0x9172) & 0xCF ^ WORD1(v49) & 0xC));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v119) ^ 0x1F));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v111) = ((v133 ^ 0xFC)
                 - 764586317
                 - ((2 * (v133 ^ 0xFC) + 842892542) & 0x321D0068)) ^ *(_DWORD *)(v141
                                                                                                + 4
                                                                                                * (BYTE1(v111) ^ 0xBDu)) ^ *(_DWORD *)&v136[4 * (v133 ^ 0x91)];
  v149 = *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x57u));
  v150 = v111 ^ (v148 - 1679586482 - ((2 * v148) & 0x37C7169C)) ^ (v47 >> 1);
  LODWORD(v49) = ((v119 ^ 0xC9) - 1726037377) ^ v255 ^ *(_DWORD *)&v136[4
                                                                                       * (v119 ^ 0xA4)] ^ (v146 + 961451060 - ((2 * v146) & 0x729D2868));
  LODWORD(v111) = v149 ^ HIDWORD(v252) ^ (v147 - 1679586482 - ((2 * v147) & 0x37C7169C));
  v151 = (v150 - ((2 * v150) & 0xF2E97984) - 109790014) ^ v254;
  LODWORD(v115) = *(_DWORD *)(v141 + 4 * (BYTE1(v119) ^ 0xC1u)) ^ HIDWORD(v254) ^ v115;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v151) ^ 0x14));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v152 = ((v115 ^ 0xA1) - 764586316 + ((2 * (v115 ^ 0xA1) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v115 ^ 0xCC)];
  v153 = *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0xDB)] ^ ((BYTE2(v49) ^ 0x87)
                                                    - 891067965
                                                    - ((2 * (WORD1(v49) ^ 0x3A87)) & 0x186)) ^ (v47 >> 1);
  v154 = (v152 - 1679586482 - ((2 * v152) & 0x37C7169C)) ^ *(_DWORD *)(v141
                                                                     + 4
                                                                     * (((unsigned __int16)(((v119 ^ 0xC9) - 15745) ^ v255 ^ *(_WORD *)&v136[4 * (v119 ^ 0xA4)] ^ (v146 - 27596 - ((2 * v146) & 0x2868))) >> 8) ^ 0xDEu));
  LODWORD(v119) = ((v49 ^ 0x9E)
                 - 764586316
                 + ((2 * (v49 ^ 0x9E) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v49 ^ 0xF3)];
  v155 = (v153 - 1679586482 - ((2 * v153) & 0x37C7169C)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0x57u));
  v156 = ((v111 ^ 0x740CBC3A) >> 16);
  v157 = v156 - 891067965 - ((v111 >> 15) & 0x186);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0x37));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v158 = v47 >> 1;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0x3A));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v49) = BYTE2(v115) ^ *(_DWORD *)&v134[4 * (BYTE2(v115) ^ 0xF6)] ^ *(_DWORD *)(v141
                                                                                      + 4
                                                                                      * ((unsigned __int16)((unsigned __int16)v111 ^ 0xBC3A) >> 8)) ^ 0x5100EA27 ^ (v47 >> 1);
  LODWORD(v49) = ((v151 ^ 0xD2) - 1726037377) ^ HIDWORD(v253) ^ *(_DWORD *)&v136[4
                                                                                                * (v151 ^ 0xBF)] ^ (v49 + 961451060 - ((2 * v49) & 0x729D2868));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0x7C));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v111) = ((v111 ^ 0x3A) - 1726037377) ^ HIDWORD(v251) ^ *(_DWORD *)&v136[4
                                                                                                 * (v111 ^ 0x57)] ^ (v155 + 961451060 - ((2 * v155) & 0x729D2868));
  v159 = *(_DWORD *)&v134[4 * (BYTE2(v151) ^ 0xF2)] ^ v252 ^ BYTE2(v151) ^ v158 ^ (v154
                                                                                 - 891067965
                                                                                 - ((2 * v154) & 0x95C6C386));
  LODWORD(v115) = *(_DWORD *)(v141 + 4 * (BYTE1(v151) ^ 0x5Cu)) ^ v253 ^ v157 ^ *(_DWORD *)&v134[4 * (v156 ^ 0x5C)] ^ (v47 >> 1) ^ (v119 - 1679586482 - ((2 * v119) & 0x37C7169C));
  v160 = v159 ^ 0xFA64A56D;
  v161 = ((v159 ^ 0x6D) - 764586316 + ((2 * (v159 ^ 0xFA64A56D) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * v159];
  v162 = v161 - 1679586482 - ((2 * v161) & 0x37C7169C);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0x5B));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v119) = (v47 >> 1) ^ *(_DWORD *)&v136[4 * (v111 ^ 0x1F)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0x28));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v163 = v47 >> 1;
  LODWORD(v119) = v119 ^ ((v111 ^ 0x72)
                        - 764586316
                        + ((2 * (v111 ^ 0x72) + 126) & 0x68 ^ 0xCDE2FFFF));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v159) ^ 0xB9));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v164 = v47 >> 1;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0xB4));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v165 = v164 ^ *(_DWORD *)&v136[4 * (v115 ^ 0x8B)] ^ ((v115 ^ 0xE6)
                                                                      - 764586316
                                                                      + ((2 * (v115 ^ 0xE6) + 126) & 0x68 ^ 0xCDE2FFFF));
  v166 = BYTE2(v49) ^ 0x95;
  v167 = v166 - 891067965 - ((2 * (WORD1(v49) ^ 0x5B95)) & 0x186);
  v168 = v49;
  LODWORD(v120) = (v49 ^ 0xF4)
                - 764586317
                - ((2 * (v49 ^ 0xF4) + 842892542) & 0x321D0068);
  v169 = ((BYTE2(v111) ^ 0x14) - 891067965 - ((v111 >> 15) & 0x186)) ^ v250 ^ *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x1Fu)) ^ *(_DWORD *)&v134[4 * (BYTE2(v111) ^ 0x48)] ^ (v165 - 1679586482 - ((2 * v165) & 0x37C7169C));
  LODWORD(v49) = *(_DWORD *)(v141 + 4 * BYTE1(v160)) ^ v251 ^ ((BYTE2(v115) ^ 0x59)
                                                               - 891067965
                                                               - ((2 * ((v115 >> 16) ^ 0xB459)) & 0x186)) ^ *(_DWORD *)&v134[4 * (BYTE2(v115) ^ 5)] ^ (v119 - 1679586482 - ((2 * v119) & 0x37C7169C));
  v170 = *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0x34u));
  LODWORD(v115) = (BYTE2(v160) - 891067965 - ((v160 >> 15) & 0x186)) ^ HIDWORD(v250) ^ v120 ^ *(_DWORD *)&v136[4 * (v168 ^ 0x99)] ^ ((v47 >> 1) - 1679586482 - ((2 * (v47 >> 1)) & 0x37C7169C)) ^ *(_DWORD *)&v134[4 * (BYTE2(v160) ^ 0x5C)] ^ *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0x12u));
  LODWORD(v111) = v170 ^ HIDWORD(v249) ^ v167 ^ *(_DWORD *)&v134[4 * (v166 ^ 0x5C)] ^ v162 ^ v163;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0xEB));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v171 = (v47 >> 1) - 1679586482 - ((2 * (v47 >> 1)) & 0x37C7169C);
  LODWORD(v119) = ((BYTE2(v115) ^ 0x81)
                 - 891067965
                 - 2 * (((v115 >> 16) ^ 0x1481) & 0xC7 ^ (v115 >> 16) & 4)) ^ *(_DWORD *)&v134[4 * (BYTE2(v115) ^ 0xDD)];
  v172 = ((v115 ^ 0x51) - 764586316 + ((2 * (v115 ^ 0x51) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v115 ^ 0x3C)];
  v173 = *(_DWORD *)&v134[4 * (BYTE2(v169) ^ 0xDB)] ^ ((BYTE2(v169) ^ 0x87)
                                                     - 891067965
                                                     - ((2 * (HIWORD(v169) ^ 0x7787)) & 0x186));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0x14));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v120) = v47 >> 1;
  v174 = *(_DWORD *)&v134[4 * (((v111 ^ 0xA87CE98B) >> 16) ^ 0x5C)] ^ ((v111 ^ 0xA87CE98B) >> 16) ^ (v172 - 891067965 - ((2 * v172) & 0x95C6C386));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0x9A));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v119) = ((v111 ^ 0x8B)
                 - 764586316
                 + ((2 * (v111 ^ 0xA87CE98B) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v169) ^ 0xDEu)) ^ *(_DWORD *)&v136[4 * (v111 ^ 0xE6)] ^ (v119 - 1679586482 - ((2 * v119) & 0x37C7169C)) ^ (v47 >> 1);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v169) ^ 0x77));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v71) = *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0xBu));
  LODWORD(v111) = *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0x34u)) ^ v248 ^ ((BYTE2(v49) ^ 0xE9)
                                                                          - 891067965
                                                                          - ((2 * (WORD1(v49) ^ 0x9AE9)) & 0x186)) ^ *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0xB5)] ^ ((v169 ^ 0x9E) - 764586316 + ((2 * (v169 ^ 0x9E) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ v171 ^ *(_DWORD *)&v136[4 * (v169 ^ 0xF3)];
  v175 = v71 ^ v247 ^ ((v49 ^ 0xA8)
                     - 764586316
                     + ((2 * (v49 ^ 0xA8) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v49 ^ 0xC5)] ^ (v173 - 1679586482 - ((2 * v173) & 0x37C7169C)) ^ v120;
  LODWORD(v49) = *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x2Du)) ^ HIDWORD(v248) ^ (v47 >> 1) ^ (v174
                                                                                              - 1679586482
                                                                                              - ((2 * v174) & 0x37C7169C));
  v176 = (v119 + 600720616 - ((2 * v119) & 0x479C89D0)) ^ v249;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v175) ^ 0x6D));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v177 = v47 >> 1;
  LODWORD(v119) = *(_DWORD *)(v135 + 4 * (HIBYTE(v176) ^ 0xFD));
  LODWORD(v119) = *(_DWORD *)&v134[4 * (((v175 ^ 0x2E0E654A) >> 16) ^ 0x5C)] ^ ((_DWORD)v119 << 31) ^ (v119 >> 1) ^ (((v175 ^ 0x2E0E654A) >> 16) - 891067965 - (((v175 ^ 0x2E0E654A) >> 15) & 0x186)) ^ 0x49D67767;
  v178 = ((v175 ^ 0x4A) - 764586316 + ((2 * (v175 ^ 0x2E0E654A) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v175 ^ 0x27)];
  v179 = v119 - 1679586482 - ((2 * v119) & 0x37C7169C);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0xAE));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v119) = (v47 >> 1) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v176) ^ 0xA4u)) ^ (v178
                                                                                - 1679586482
                                                                                - ((2 * v178) & 0x37C7169C));
  v180 = *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0x3A)] ^ v177 ^ ((BYTE2(v49) ^ 0x66)
                                                           - 891067965
                                                           - ((2 * (WORD1(v49) ^ 0xAE66)) & 0x186)) ^ *(_DWORD *)&v136[4 * (v176 ^ 0x4D)] ^ ((v176 ^ 0x20) - 764586316 + ((2 * (v176 ^ 0x20) + 126) & 0x68 ^ 0xCDE2FFFF));
  LODWORD(v120) = ((v49 ^ 0xB3)
                 - ((2 * (v49 ^ 0xB3) + 842892542) & 0x3205069C)
                 + 889343437) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v175) ^ 0x65u));
  v181 = (v120 + 961451060 - ((2 * v120) & 0x729D2868)) ^ *(_DWORD *)&v136[4 * (v49 ^ 0xDE)];
  v182 = *(_DWORD *)&v134[4 * (BYTE2(v176) ^ 0x40)] ^ ((BYTE2(v176) ^ 0x1C) - 891067965 - ((v176 >> 15) & 0x186));
  v183 = (v182 ^ 0xD9E215AF ^ -(v182 ^ 0xD9E215AF) ^ ((v181 ^ 0x6500C283) + (v181 ^ v182 ^ 0x431D28D3) + 1))
       + (v181 ^ 0x6500C283);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 ^ 0x3F162902) >> 24));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v184 = ((v111 ^ 0x3F162902) >> 16) ^ DWORD2(v246) ^ *(_DWORD *)&v134[4 * (((v111 ^ 0x3F162902) >> 16) ^ 0x5C)] ^ (v119 - 891067965 - ((2 * v119) & 0x95C6C386));
  v185 = (v47 >> 1) ^ DWORD1(v246) ^ v183;
  LODWORD(v115) = *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0xCBu)) ^ HIDWORD(v246) ^ (v180
                                                                                   - 1679586482
                                                                                   - ((2 * v180) & 0x37C7169C));
  LODWORD(v111) = *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x7Cu)) ^ HIDWORD(v247) ^ ((v111 ^ 2)
                                                                                  - 764586316
                                                                                  + ((2
                                                                                    * (v111 ^ 0x3F162902)
                                                                                    + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v111 ^ 0x6F)] ^ v179;
  LODWORD(v119) = ((BYTE2(v111) ^ 0xE9) - 891067965 - ((2 * ((v111 >> 16) ^ 0xB8E9)) & 0x186)) ^ *(_DWORD *)&v134[4 * (BYTE2(v111) ^ 0xB5)];
  v186 = v119 - 1679586482 - ((2 * v119) & 0x37C7169C);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v184) ^ 0x9D));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v187 = v47 >> 1;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0x61));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v49) = *(_DWORD *)&v136[4 * (v111 ^ 0xC5)] ^ *(_DWORD *)&v134[4 * (BYTE2(v184) ^ 0x28)] ^ ((v111 ^ 0xA8) - 764586316 + ((2 * (v111 ^ 0xA8) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ ((BYTE2(v184) ^ 0x74) - 891067965 - ((2 * (HIWORD(v184) ^ 0x9D74)) & 0x186)) ^ (v47 >> 1);
  v188 = v187 ^ ((BYTE2(v185) ^ 0xE6) - 891067965 - ((2 * (HIWORD(v185) ^ 0xB0E6)) & 0x186)) ^ *(_DWORD *)&v134[4 * (BYTE2(v185) ^ 0xBA)];
  LODWORD(v119) = v184;
  v189 = (v184 ^ 0xD9) - 764586317 - ((2 * (v184 ^ 0xD9) + 842892542) & 0x321D0068);
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 >> 24) ^ 0xB8));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v190 = ((BYTE2(v115) ^ 8) - 891067965 - ((v115 >> 15) & 0x186)) ^ *(_DWORD *)&v134[4
                                                                                                 * (BYTE2(v115) ^ 0x54)] ^ *(_DWORD *)&v136[4 * (v185 ^ 0x29)] ^ ((v185 ^ 0x44) - 764586316 + ((2 * (v185 ^ 0x44) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ (v47 >> 1);
  LODWORD(v49) = *(_DWORD *)(v141 + 4 * (BYTE1(v185) ^ 0xDDu)) ^ HIDWORD(v245) ^ (v49
                                                                                  - 1679586482
                                                                                  - ((2 * v49) & 0x37C7169C));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v185) ^ 0xB0));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v191 = *(_DWORD *)(v141 + 4 * (BYTE1(v184) ^ 0xBDu)) ^ v246 ^ (v190 - 1679586482 - ((2 * v190) & 0x37C7169C));
  v192 = *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0x8Fu)) ^ HIDWORD(v244) ^ *(_DWORD *)&v136[4
                                                                                          * (v119 ^ 0xB4)] ^ v189 ^ (v47 >> 1) ^ v186;
  LODWORD(v115) = ((v115 ^ 0x85)
                 - 764586316
                 + ((2 * (v115 ^ 0x85) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ v245 ^ *(_DWORD *)&v136[4 * (v115 ^ 0xE8)] ^ *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0x2Du)) ^ (v188 - 1679586482 - ((2 * v188) & 0x37C7169C));
  v193 = ((BYTE2(v115) ^ 0x66)
        - 891067965
        - 2 * (((v115 >> 16) ^ 0xAE66) & 0xDB ^ (v115 >> 16) & 0x18)) ^ *(_DWORD *)&v134[4 * (BYTE2(v115) ^ 0x3A)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v192) ^ 0x18));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v119) = ((v47 >> 1) - 891067965 - ((2 * (v47 >> 1)) & 0x95C6C386)) ^ *(_DWORD *)&v134[4 * (BYTE2(v191) ^ 0x40)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v191) ^ 0xEF));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v111) = (v47 >> 1) ^ *(_DWORD *)&v136[4 * (v192 ^ 0x90)] ^ ((v192 ^ 0xFD)
                                                                                     - 764586316
                                                                                     + ((2
                                                                                       * (v192 ^ 0xFD)
                                                                                       + 126) & 0x68 ^ 0xCDE2FFFF));
  v194 = *(_DWORD *)&v136[4 * (v49 ^ 0x27)] ^ ((v49 ^ 0x4A)
                                                              - 764586317
                                                              - ((2 * (v49 ^ 0x4A) + 842892542) & 0x321D0068));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0xAE));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v195 = (v47 >> 1) ^ *(_DWORD *)&v134[4 * (BYTE2(v192) ^ 0xF)] ^ (v194 - 891067965 - ((2 * v194) & 0x95C6C386));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (BYTE3(v49) ^ 0xDC));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v111) = ((BYTE2(v49) ^ 0xE) - 891067965 - ((2 * (WORD1(v49) ^ 0xDC0E)) & 0x186)) ^ v244 ^ *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0x7Cu)) ^ *(_DWORD *)&v134[4 * (BYTE2(v49) ^ 0x52)] ^ ((_DWORD)v111 - 1679586482 - ((2 * (_DWORD)v111) & 0x37C7169C));
  LODWORD(v120) = v115;
  v196 = (v115 ^ 0xB3) - 764586316 + ((2 * (v115 ^ 0xB3) + 126) & 0x68 ^ 0xCDE2FFFF);
  LODWORD(v115) = *(_DWORD *)(v141 + 4 * (BYTE1(v192) ^ 0x1Bu)) ^ HIDWORD(v243) ^ *(_DWORD *)&v136[4 * (v191 ^ 0x4D)] ^ ((v191 ^ 0x20) - 764586316 + ((2 * (v191 ^ 0x20) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ (v47 >> 1) ^ (v193 - 1679586482 - ((2 * v193) & 0x37C7169C));
  LODWORD(v49) = v196 ^ HIDWORD(v242) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0x65u)) ^ *(_DWORD *)&v136[4 * (v120 ^ 0xDE)] ^ (v119 - 1679586482 - ((2 * v119) & 0x37C7169C));
  v197 = v49 ^ BYTE2(v191);
  v198 = *(_DWORD *)(v141 + 4 * (BYTE1(v191) ^ 0xA4u)) ^ v243 ^ (v195 - 1679586482 - ((2 * v195) & 0x37C7169C));
  v199 = (v198 ^ BYTE2(v192));
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v197 ^ 0x7641388Bu) >> 24));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v200 = v47 >> 1;
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v111 ^ 0xF7E9CFA8) >> 24));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  LODWORD(v120) = v47 >> 1;
  LODWORD(v77) = (((v197 ^ 0x7641388Bu) >> 16) - 891067965 - (((v197 ^ 0x7641388Bu) >> 15) & 0x186)) ^ *(_DWORD *)&v134[4 * (((v197 ^ 0x7641388Bu) >> 16) ^ 0x5C)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * (HIBYTE(v198) ^ 0xE7));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v201 = v47 >> 1;
  v202 = v200 ^ *(_DWORD *)&v136[4 * (v199 ^ 0x18)] ^ (((v111 ^ 0xF7E9CFA8) >> 16)
                                                     - 891067965
                                                     - (((v111 ^ 0xF7E9CFA8) >> 15) & 0x186)) ^ *(_DWORD *)&v134[4 * (((v111 ^ 0xF7E9CFA8) >> 16) ^ 0x5C)] ^ ((v199 ^ 0x75) - 764586316 + ((2 * (v199 ^ 0x75) + 126) & 0x68 ^ 0xCDE2FFFF));
  v203 = (v202 - 1679586482 - ((2 * v202) & 0x37C7169C)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v115) ^ 0xECu));
  v204 = v120 ^ *(_DWORD *)&v134[4 * (BYTE2(v115) ^ 0xA7)] ^ ((BYTE2(v115) ^ 0xFB)
                                                            - 891067965
                                                            - ((2 * ((v115 >> 16) ^ 0x57FB)) & 0x186)) ^ ((v197 ^ 0x8B) - 764586316 + ((2 * (v197 ^ 0x7641388B) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ *(_DWORD *)&v136[4 * (v197 ^ 0xE6)];
  HIDWORD(v47) = *(_DWORD *)(v135 + 4 * ((v115 >> 24) ^ 0x57));
  LODWORD(v47) = HIDWORD(v47) ^ 0x93ACEECE;
  v205 = HIWORD(v198);
  v206 = (v204 - 1679586482 - ((2 * v204) & 0x37C7169C)) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v198) ^ 0x6Du));
  v207 = HIWORD(v198) ^ 0xE731;
  v208 = *(_DWORD *)&v134[4 * (v207 ^ 0x5C)];
  v209 = v207 - 891067965 - 2 * (v207 & 0xCF ^ v205 & 0xC);
  v210 = *(_DWORD *)(v141 + 4 * (BYTE1(v111) ^ 0x2Du));
  LODWORD(v119) = ((v111 ^ 0xA8)
                 - 764586316
                 + ((2 * (v111 ^ 0xF7E9CFA8) + 126) & 0x68 ^ 0xCDE2FFFF)) ^ v209 ^ *(_DWORD *)&v136[4 * (v111 ^ 0xC5)] ^ (v47 >> 1) ^ v208;
  v211 = *(_DWORD *)&v136[4 * (v115 ^ 0x42)];
  v212 = (v115 ^ 0x2F) - 764586316 + ((2 * (v115 ^ 0x2F) + 126) & 0x68 ^ 0xCDE2FFFF);
  LODWORD(v111) = HIDWORD(v236) ^ *(_DWORD *)(v141 + 4 * (BYTE1(v49) ^ 0xDAu)) ^ (v119
                                                                                  - 1679586482
                                                                                  - ((2 * v119) & 0x37C7169C));
  LODWORD(v49) = (v206 - 406995271 - ((2 * v206) & 0xCF7B7D72)) ^ v105;
  LODWORD(v115) = (v203 - 611232798 - ((2 * v203) & 0xB722A7C4)) ^ HIDWORD(v241);
  LODWORD(v135) = v210 ^ v241 ^ v212 ^ v201 ^ v211 ^ ((_DWORD)v77 - 1679586482 - ((2 * (_DWORD)v77) & 0x37C7169C));
  LODWORD(v141) = v115 ^ 0x351D74B9;
  v213 = (char *)*(&off_1E6CBBAA0 + SHIDWORD(v235)) - 4;
  v214 = *(unsigned int *)(v44 - 128);
  v215 = (uint64_t)*(&off_1E6CBBAA0 + (int)v214 - 1657);
  v216 = *(_DWORD *)&v213[4 * (v49 ^ 0xA2)];
  v217 = (char *)*(&off_1E6CBBAA0 + (int)v214 - 1752) - 12;
  v218 = (*(_DWORD *)&v217[4 * (BYTE2(v49) ^ 0x9E)] - 765144313) ^ (*(_DWORD *)&v213[4 * (v135 ^ 0xC9)]
                                                                  - 1987175564);
  LODWORD(v120) = *(_DWORD *)&v213[4 * (v111 ^ 0xC8)];
  v219 = *(_QWORD *)(v44 - 120);
  v220 = v120 - ((2 * (_DWORD)v120 + 320616168) & 0x84C1C1CE);
  LODWORD(v119) = (*(_DWORD *)&v217[4 * (BYTE2(v135) ^ 0x38)] - 765144313) ^ (*(_DWORD *)(v215
                                                                                        + 4
                                                                                        * ((v111 ^ 0x898C5DC8) >> 24))
                                                                            - 440955393);
  v221 = *(_DWORD *)&v213[4 * (v115 ^ 0xB9)];
  LODWORD(v77) = *(_DWORD *)(v215 + 4 * (BYTE3(v49) ^ 0xE7));
  LODWORD(v213) = *(_DWORD *)(v215 + 4 * (BYTE3(v135) ^ 0xB8));
  LODWORD(v215) = *(_DWORD *)(v215 + 4 * ((v115 >> 24) ^ 0x65));
  v222 = (uint64_t)*(&off_1E6CBBAA0 + (int)v236);
  LODWORD(v135) = *(_DWORD *)(v222 + 4 * (BYTE1(v135) ^ 0xE9u));
  v223 = (v218 + 1113645287 - ((2 * v218) & 0x84C1C1CE)) ^ *(_DWORD *)(v222 + 4 * (BYTE1(v111) ^ 0x61u)) ^ (v215 - 440955393);
  v224 = *(_DWORD *)&v217[4 * (BYTE2(v111) ^ 0x8C)];
  LODWORD(v136) = *(_DWORD *)(v222 + 4 * BYTE1(v141)) ^ HIDWORD(v237) ^ ((v119 ^ (v216 - 1987175564))
                                                                         + 1113645287
                                                                         - ((2 * (v119 ^ (v216 - 1987175564))) & 0x84C1C1CE));
  v225 = v233 ^ HIDWORD(v241) ^ (v223 - 611232798 - ((2 * v223) & 0xB722A7C4));
  LODWORD(v141) = *(_DWORD *)(v222 + 4 * (BYTE1(v49) ^ 0xA0u)) ^ v233 ^ (v220 - 873530277) ^ ((_DWORD)v213 - 440955393) ^ (*(_DWORD *)&v217[4 * BYTE2(v141)] - 765144313);
  v226 = (char *)*(&off_1E6CBBAA0 + SHIDWORD(v234)) - 4;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 256)) = v226[BYTE1(v136) ^ 0x99] ^ 0x3C;
  v227 = (uint64_t)*(&off_1E6CBBAA0 + (int)v234);
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 248)) = (*(_BYTE *)(v227 + (BYTE2(v225) ^ 0xADLL)) + 30) ^ 0xC5;
  v228 = (uint64_t)*(&off_1E6CBBAA0 + (int)v214 - 1731);
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 208)) = *(_BYTE *)(v228 + (v136 ^ 0xFCLL)) ^ 0x3F;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 232)) = (*(_BYTE *)(v227 + (BYTE2(v141) ^ 0x8CLL)) + 30) ^ 0x47;
  v229 = (char *)*(&off_1E6CBBAA0 + SHIDWORD(v233)) - 4;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 224)) = (v229[(v136 >> 24) ^ 0xDELL] + 8) ^ 0x1B;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 216)) = ((*(_BYTE *)(v227 + (BYTE2(v136) ^ 0x15))
                                              + ((*(_BYTE *)(v227 + (BYTE2(v136) ^ 0x15)) + 30) ^ 0xDA)
                                              + 31) ^ 0xFE)
                                            + *(_BYTE *)(v227 + (BYTE2(v136) ^ 0x15))
                                            + 30;
  v230 = v235 ^ v135 ^ (v224 - 765144313) ^ (v221 - 1987175564) ^ ((_DWORD)v77
                                                                                             - ((2 * (_DWORD)v77
                                                                                               - 881910786) & 0x84C1C1CE)
                                                                                             + 672689894);
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 240)) = *(_BYTE *)(v228
                                                       + ((v235 ^ v135 ^ (v224 + 7) ^ (v221 + 116) ^ ((_BYTE)v77 - ((2 * (_BYTE)v77 - 2) & 0xCE) - 26)) ^ 5)) ^ 0xCD;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 160)) = (v229[HIBYTE(v225) ^ 0x4ELL] + 8) ^ 0xE6;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 152)) = (v229[BYTE3(v141) ^ 0x9CLL] + 8) ^ 0xB8;
  v231 = *(_QWORD *)(v44 - 184);
  *(_BYTE *)(v219 + v231) = (v229[BYTE3(v230) ^ 0x67] + 8) ^ 0x91;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 176)) = *(_BYTE *)(v228 + (v141 ^ 0xF2)) ^ 0xC7;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 200)) = v226[BYTE1(v141) ^ 0x1ELL] ^ 0x9F;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 168)) = v226[((unsigned __int16)(v235 ^ v135 ^ (v224 - 11513) ^ (v221 + 7028) ^ ((_WORD)v77 - ((2 * (_WORD)v77 + 7166) & 0xC1CE) + 28390)) >> 8) ^ 0x33] ^ 0x86;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 192)) = v226[BYTE1(v225) ^ 0xBCLL] ^ 0x48;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 144)) = *(_BYTE *)(v228 + (v225 ^ 0x9FLL)) ^ 0x3F;
  *(_BYTE *)(v219 + *(_QWORD *)(v44 - 136)) = (*(_BYTE *)(v227 + (BYTE2(v230) ^ 0xDLL)) + 30) ^ 0x8E;
  LODWORD(v229) = (((_DWORD)v231 + 1993168621 - ((2 * (_DWORD)v231 + 32) & 0xED9AADDA) + 16) ^ 0x76CD56ED) < a40;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a41 + 8 * (int)((v229 | (16 * (_DWORD)v229)) ^ (v214 - 504))) - 12))(v220, v228, v214, v230, 218, 184, 2227290574, 3529822983, a9, a10, v233, v234, v235, v236, v237, v113, v238, v239, v240,
           v241,
           v242,
           v243,
           v244,
           v245,
           v246,
           *((_QWORD *)&v246 + 1),
           v247,
           v248,
           v249,
           v250,
           v251,
           v252,
           v253,
           v254);
}

void sub_1B776A2FC()
{
  JUMPOUT(0x1B7768268);
}

uint64_t sub_1B776A330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41)
{
  int v41;
  uint64_t v42;
  unsigned int v43;

  v43 = ((v41 + 209400458) & 0xF384CEFE ^ 0xE1629AB) + a11 - ((a41 << ((94 * (v41 ^ 0x50)) ^ 0xD7)) & 0xA620CB5C);
  return (*(uint64_t (**)(void))(v42
                              + 8
                              * ((39
                                * (((2 * v43) & 0x37AFEBFE ^ 0x2620CB5C) + (v43 ^ 0xC8C79051) + 2008907161 != 328561560)) ^ v41)))();
}

uint64_t sub_1B776A414(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((38 * (a1 + v2 + 5 * (v1 ^ 0x1BBu) + 1680345600 - 544 > 7)) ^ v1))
                            - ((3 * (v1 ^ 0x39Cu)) ^ 0x6D6)))();
}

uint64_t sub_1B776A49C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((((586 * (a3 ^ 0x222)) ^ 0x1E0) * (a6 >> 4 == 163413856)) ^ a3))
                            - ((a3 - 1523569236) & 0x5ACFD5FF)
                            + 1473))();
}

uint64_t sub_1B776A4F4(int a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v21;
  int v23;
  int v25;

  v9 = (a1 + v6 + a2);
  v10 = *(_QWORD *)(v8 - 120);
  v11 = v9 + v10 + 1;
  v12 = (a1 + v6) & 0xF;
  v13 = v12 - v9;
  v14 = v4 + v13;
  v15 = v4 + ((v2 - 563890126) & 0x219C43D9 ^ 0x1D8) + v12;
  v16 = v13 + v5 + 2;
  v17 = v12 + v5 + 3;
  v18 = v13 + v3 + 4;
  v19 = v12 + v3 + 5;
  v21 = v17 > v10 && v16 < v11;
  v23 = v14 < v11 && v15 > v10 || v21;
  if (v19 <= v10 || v18 >= v11)
    v25 = v23;
  else
    v25 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((1021 * v25) ^ v2)) - 4))();
}

uint64_t sub_1B776A5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * ((608 * (v6 >= (((a6 - 329) | 0x148) ^ 0x1C8))) ^ a6))
                                                           - 12))(a1, a2, 0);
}

uint64_t sub_1B776A5DC(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  int8x16_t v48;
  uint64_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16x4_t v53;
  int8x16x4_t v54;

  *(_DWORD *)(v47 - 136) = v44 + 9;
  v53.val[1].i64[0] = ((_BYTE)v44 - 1) & 0xF;
  v53.val[1].i64[1] = ((_BYTE)v44 + 14) & 0xF;
  v53.val[2].i64[0] = ((_BYTE)v44 + 13) & 0xF;
  v53.val[2].i64[1] = ((_BYTE)v44 + 12) & 0xF;
  v53.val[3].i64[0] = ((_BYTE)v44 + 11) & 0xF;
  v53.val[3].i64[1] = ((_BYTE)v44 + 10) & 0xF;
  v48.i64[0] = 0x7777777777777777;
  v48.i64[1] = 0x7777777777777777;
  v49 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)v46 + (_BYTE)a4 + 40) & 0xF;
  v53.val[0].i64[0] = v49;
  v53.val[0].i64[1] = v44 & 0xF;
  v50.i64[0] = vqtbl4q_s8(v53, (int8x16_t)xmmword_1B77959A0).u64[0];
  v54.val[0].i64[1] = ((_BYTE)v44 + 8) & 0xF;
  v54.val[1].i64[1] = (v44 + 6) & 0xF;
  v54.val[2].i64[1] = (v44 + 4) & 0xF;
  v54.val[3].i64[1] = ((_BYTE)v44 + 2) & 0xF;
  v54.val[0].i64[0] = *(_DWORD *)(v47 - 136) & 0xF;
  v54.val[1].i64[0] = ((_BYTE)v44 + 7) & 0xF;
  v54.val[2].i64[0] = (v44 + 5) & 0xF;
  v54.val[3].i64[0] = (v44 + 3) & 0xF;
  v50.i64[1] = vqtbl4q_s8(v54, (int8x16_t)xmmword_1B77959A0).u64[0];
  v51 = vrev64q_s8(vmulq_s8(v50, v48));
  *(int8x16_t *)(*(_QWORD *)(v47 - 120) - 15 + (a2 + a1 + v46 + a4 - 472)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v42 + v49 - 15), *(int8x16_t *)(*(_QWORD *)(v47 - 120) - 15 + (a2 + a1 + v46 + a4 - 472))), veorq_s8(*(int8x16_t *)(v49 + v43 - 13), *(int8x16_t *)(v49 + v41 - 11))), vextq_s8(v51, v51, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a41 + 8 * ((2041 * ((v45 & 0xFFFFFFF0) == 16)) ^ a4)) - 4))();
}

void sub_1B776A740()
{
  JUMPOUT(0x1B776A6CCLL);
}

uint64_t sub_1B776A74C(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v3 ^ (464 * (v4 != a3)))) - ((v3 + 323) ^ 0x1D1)))();
}

uint64_t sub_1B776A784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v7
                                                                                        + 8
                                                                                        * ((1016
                                                                                          * ((((a5 ^ 0x529) - 1256) & v6) == 0)) ^ a5))
                                                                            - ((a5 - 1919027963) & 0x72620FFF)
                                                                            + 1746))(a1, a2, a3, (v5 - a3), (a5 - 1919027963) & 0x72620FFF);
}

uint64_t sub_1B776A7D4(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  int v46;
  char v47;
  int v48;
  int v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  uint64_t v53;
  int v54;
  char v55;
  uint64_t v56;
  int8x16x4_t v58;

  *(_DWORD *)(v50 - 128) = v49;
  v51 = 43 * (v41 ^ 0x4EA);
  *(_DWORD *)(v50 - 136) = v46;
  v52 = (v51 ^ 0xFFFFFBA6) & v46;
  v53 = *(_QWORD *)(v50 - 120) - 7;
  v54 = -a3;
  *(_DWORD *)(v50 - 144) = v52;
  v55 = a1 + v48 + v47;
  v56 = (v54 + a1 + v48 + a2);
  v58.val[0].i64[0] = ((_BYTE)v54 + (_BYTE)a1 + (_BYTE)v48 + (_BYTE)a2) & 0xF;
  v58.val[0].i64[1] = ((_BYTE)v54 + v45) & 0xF;
  v58.val[1].i64[0] = ((_BYTE)v54 + v55 + 37) & 0xF;
  v58.val[1].i64[1] = ((_BYTE)v54 + v55 + 36) & 0xF;
  v58.val[2].i64[0] = ((_BYTE)v54 + v55 + 35) & 0xF;
  v58.val[2].i64[1] = ((_BYTE)v54 + v55 + 34) & 0xF;
  v58.val[3].i64[0] = ((_BYTE)v54 + v55 + (v51 ^ 0x7F)) & 0xF;
  v58.val[3].i64[1] = ((_BYTE)v54 + v55 + 32) & 0xF;
  *(int8x8_t *)(v53 + v56) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v43 + (v56 & 0xF) - 7), *(int8x8_t *)(v53 + v56)), veor_s8(*(int8x8_t *)((v56 & 0xF) + v44 - 5), *(int8x8_t *)((v56 & 0xF) + v42 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v58, (int8x16_t)xmmword_1B77959B0), (int8x8_t)0x7777777777777777)));
  return (*(uint64_t (**)(__n128))(a41 + 8 * ((174 * (v54 != 8 - v52)) ^ v51)))((__n128)xmmword_1B77959B0);
}

void sub_1B776A914()
{
  JUMPOUT(0x1B776A84CLL);
}

uint64_t sub_1B776A93C(int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((((a1 + 773274813) & 0xD1E8C7FF ^ 0x689)
                                               * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 144))) ^ a1))
                            - 12))();
}

uint64_t sub_1B776A984(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a4 - 328562095);
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + v11) ^= *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)((v11 & 0xF) + v7 + 2) ^ *(_BYTE *)((v11 & 0xF) + v5 + 4) ^ (119 * (v11 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((250 * (a4 - 1 == v8)) ^ (a5 - 1650))) - 8))();
}

void sub_1B776A9F4()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 1477429401)
    v1 = 1973469985;
  else
    v1 = -1973446407;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_1B776AA58(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1759421093 * ((-870162447 - (a1 | 0xCC225FF1) + (a1 | 0x33DDA00E)) ^ 0x80A0105A);
  __asm { BR              X10 }
}

uint64_t sub_1B776AB1C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((*(_DWORD *)(*(_QWORD *)(a1 + 8) + v3) != v1) * ((v4 - 1088) ^ 0x1A1)) ^ v4))
                            - ((v4 - 447) | 0x14u)
                            + 1068))();
}

uint64_t sub_1B776AB60()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((83 * (v2 ^ 0x431)) ^ 0x19D) * ((v3 - 561217817) * (v0 - 561217817) >= 0)) | v2))
                            - 8))();
}

uint64_t sub_1B776ABA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a1;
  v8 = v2;
  v5 = v2;
  v6 = (v3 ^ 0x5AB)
     - 535753261 * ((((2 * &v5) | 0x54F3A148) - &v5 + 1434857308) ^ 0xA08DDE8B)
     - 78;
  return ((uint64_t (*)(uint64_t *))(*(_QWORD *)(v1 + 8 * ((v3 ^ 0x5AB) - 262)) - 8))(&v5);
}

void sub_1B776AD00(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;

  v1 = 1178560073 * ((2 * (a1 & 0x78F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8);
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x1E6EF7153090DB6) - 691424707;
  v4 = *(_DWORD *)(a1 + 4) - v1 - 124684650;
  v5 = (v4 < 0xF8EB1C8A) ^ (v3 < 0xF8EB1C8A);
  v6 = v3 < v4;
  if (v5)
    v6 = v4 < 0xF8EB1C8A;
  v2 = *(_DWORD *)(a1 + 16) ^ v1;
  __asm { BR              X11 }
}

uint64_t sub_1B776AE08()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((*(_BYTE *)(v1 - 0x1E6EF7153090DAELL) & 1) * (((v0 - 593) | 0x201) ^ 0x2A0)) ^ v0))
                            - (((v0 + 151) | 0x10u) ^ 0x372)))();
}

void sub_1B776AE58()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 0x1E6EF7153090DAALL) = -1973446411;
}

uint64_t sub_1B776B488(_DWORD *a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*((_QWORD *)&unk_1E6CB7A50
                              + (((*a1 + *(_DWORD *)(a2 + 4) + 1092385194) > 0xC8) | 0x24Eu))
                            - 8))();
}

uint64_t sub_1B776B4CC()
{
  return 4294925278;
}

uint64_t sub_1B776B4D4@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return (*(uint64_t (**)(void))(a1 + 8 * ((1535 * (v1 != 1123162719)) ^ 0x1BEu)))();
}

uint64_t sub_1B776B508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;

  *(_BYTE *)(a1 + (v4 + v3 + 591) + 4) = (**(_BYTE **)(a2 + 8) ^ 0xD)
                                                     + ((2 * **(_BYTE **)(a2 + 8)) & 0x1A)
                                                     - 4;
  v5 = *(_DWORD *)(a2 + 4) - 726674564;
  v6 = v5 > 0x17A1EDDC;
  if (v5 < 0x17A1EDDB)
    v6 = 1;
  return (*(uint64_t (**)(void))(a3 + 8 * ((45 * !v6) ^ 0x193u)))();
}

void sub_1B776B5C0()
{
  JUMPOUT(0x1B776B544);
}

uint64_t sub_1B776B5C8(_DWORD *a1)
{
  int v1;
  int v2;
  int v3;

  *((_BYTE *)a1 + (v3 + v2 + v1) + 4) = 9;
  *a1 = v1;
  return 0;
}

void sub_1B776B5E8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)a1 + 108757529 * (((a1 ^ 0x1E96025E | 0x16634A81) - ((a1 ^ 0x1E96025E) & 0x16634A81)) ^ 0xE8692AF4);
  v2 = *(_QWORD *)(a1 + 8);
  ((void (*)(_QWORD, void (*)()))*(&off_1E6CBBAA0 + (v1 ^ 0x36E)))(*(&off_1E6CBBAA0 + v1 - 726), sub_1B778DFE0);
  __asm { BR              X12 }
}

uint64_t sub_1B776B6A8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((**(_QWORD **)(v3 + 8 * (a1 ^ 0x3A6)) == 0) ^ a1) & 1)
                                          * v1) ^ a1))
                            - 4))();
}

uint64_t sub_1B776B6E0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0x3E4)))(v1);
}

uint64_t sub_1B776B710(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  v1 = 3804331 * (((a1 ^ 0x9A32C815 | 0x394EC663) - ((a1 ^ 0x9A32C815) & 0x394EC663)) ^ 0x59E2FD20);
  v2 = *(_DWORD *)a1 - v1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = (*(_DWORD *)(a1 + 4) ^ v1) - 1385697266;
  v5 = v4
     + (*(_DWORD *)(v3 - 0xD547898781B117CLL) ^ 0xC9A83593)
     - ((2 * (v4 + (*(_DWORD *)(v3 - 0xD547898781B117CLL) ^ 0xC9A83593))) & 0x93506B26)
     - 911723117;
  *(_DWORD *)(v3 - 0xD547898781B117CLL) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + (v2 ^ 0x2E2))
                                        + 8 * ((1600 * ((v5 ^ 0xC9A83593) < v4)) ^ v2)
                                        - 4)
                            - 12))();
}

void sub_1B776B7E4(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0xD547898781B1180) = (*(_DWORD *)(a1 - 0xD547898781B1180) ^ 0xD185D72)
                                        + 219700594
                                        - ((2 * (*(_DWORD *)(a1 - 0xD547898781B1180) ^ 0xD185D72) + 2) & 0x1A30BAE4)
                                        + 1;
}

void mm0Euuzhc()
{
  _DWORD v0[8];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  v0[0] = 108757529 * ((2 * (v0 & 0x3E399E8) - v0 - 65247726) ^ 0x1C800439) + 1695027452;
  sub_1B778DF28(v0);
  __asm { BR              X8 }
}

uint64_t sub_1B776B8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a14 = 479 - 460628867 * (((&a12 | 0xD3E63AA1) + (~&a12 | 0x2C19C55E)) ^ 0x9F70B8DD);
  a12 = &STACK[0x6A4735A87A2643F5];
  sub_1B7787F10((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15
                                                                                          + 8
                                                                                          * ((127 * (a13 != v14)) ^ 0x5BFu))
                                                                              - 4))(v16, v17, v18, v19, v20);
}

uint64_t sub_1B776B97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a12 = 1178560073
      * (((&a12 | 0xC1D5A481) - &a12 + (&a12 & 0x3E2A5B78)) ^ 0x7B41DCE3)
      + 551;
  a14 = v15;
  a15 = a11;
  v19 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(v17 + 1376) - 12))(&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((208 * (((a13 == ((v16 + 960) ^ 0x5C0)) ^ 0x7F) & 1)) ^ 0x57Fu))
                                          - 12))(v19);
}

uint64_t sub_1B776BA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, int a15, unsigned int a16, unint64_t *a17)
{
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v21 = v19 ^ v20;
  v22 = 1759421093 * (&a12 ^ 0xB37DB054);
  a17 = &STACK[0x722739E86E9FC718];
  a12 = 1830462524 - v22;
  a15 = v22 ^ 0x655A87F7;
  a16 = v22 + v21 + 2138961905;
  a14 = a11;
  v23 = sub_1B778D6D8((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (((a13 == v17) * ((v21 + 17) ^ 0x60B)) ^ v21))
                                          - 12))(v23);
}

uint64_t sub_1B776BAD4()
{
  void (*v0)(unsigned int *);
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  unint64_t *v8;
  unsigned int v9;
  unint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t *v13;
  unint64_t *v14;

  v5 = (v4 - 111) | 0x80;
  v11 = (v4 - 317) ^ (1374699841 * (&v11 ^ 0x6DF41809));
  v13 = &STACK[0x31FD77B69BC3E0F1];
  v14 = v8;
  (*(void (**)(unsigned int *))(v3 + 8 * (v4 - 1332)))(&v11);
  v11 = v4 + 1225351577 * ((&v11 & 0x201E3399 | ~(&v11 | 0x201E3399)) ^ 0xA11E5654) - 400;
  v13 = v8;
  sub_1B774F090((uint64_t)&v11);
  if (v12 == (v5 ^ (v1 + 960)))
    v6 = v9;
  else
    v6 = v12;
  v12 = v4 + (((&v11 | 0x648109B1) - (&v11 & 0x648109B1)) ^ 0x6E75079E) * v2 - 854;
  v13 = v8;
  v0(&v11);
  v13 = v10;
  v12 = v5 + ((2 * (&v11 & 0x7163F060) - &v11 + 245108637) ^ 0x46801B2) * v2 - 871;
  v0(&v11);
  return v6 ^ v1;
}

void sub_1B776BC68(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20) - 235795823 * (((a1 | 0xEB3D4C35) - (a1 | 0x14C2B3CA) + 348304330) ^ 0x7F90056C);
  __asm { BR              X10 }
}

uint64_t sub_1B776BD88()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = *(_DWORD *)(v2 + 16) + v0 != 1804549613 && (*(_QWORD *)(v2 + 56) | *(_QWORD *)(v2 + 32)) != 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((344 * v5) ^ v1)))();
}

uint64_t sub_1B776BDCC()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[1] != 0x384B062F07609540 && (*v1 | v1[5]) != 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v4 * (((v0 - 383681137) & 0x16DE86FF) + 43)) ^ v0)))();
}

uint64_t sub_1B776BE28(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3
                                                               + 8
                                                               * (((((v2 + 297926473) & 0x2E3DFFE7) - 1494) * (v1 == 0)) | v2))
                                                   - (v2 - 207)
                                                   + 1529))(a1, 108757529);
}

uint64_t sub_1B776BF48@<X0>(int a1@<W1>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v43)(uint64_t);
  uint64_t v44;
  void (*v45)(uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;

  v31 = v23 ^ 0x7BE;
  v32 = (((((v30 - 144) | 0xFFA7A518) ^ 0xFFFFFFFE) - (~(v30 - 144) | 0x585AE7)) ^ 0xE0C438CC) * a1;
  *(_QWORD *)(v30 - 144) = v29;
  *(_QWORD *)(v30 - 128) = v21;
  *(_DWORD *)(v30 - 136) = v23 - v32 - 338;
  *(_DWORD *)(v30 - 116) = v24 - v32 + (v23 ^ 0xF0DE6851);
  v47 = a2 + v22;
  ((void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v23 ^ 0x624)) - 4))(v30 - 144);
  HIDWORD(a9) = v31 + 733;
  *(_DWORD *)(v30 - 128) = (v31 + 733) ^ ((((v30 - 144) & 0x9C773357 | ~((v30 - 144) | 0x9C773357)) ^ 0xF72585F1) * v28);
  *(_QWORD *)(v30 - 144) = a18;
  *(_QWORD *)(v30 - 136) = a19;
  v46 = *(void (**)(uint64_t))(v26 + 8 * (v31 - 258));
  v46(v30 - 144);
  HIDWORD(a7) = v31 + 185;
  *(_QWORD *)(v30 - 112) = a18;
  *(_DWORD *)(v30 - 120) = v31
                         + 185
                         + 1224239923 * ((((v30 - 144) | 0x9417ED12) - ((v30 - 144) & 0x9417ED12)) ^ 0x66A410C5);
  *(_QWORD *)(v30 - 136) = a20;
  *(_QWORD *)(v30 - 128) = v29;
  *(_QWORD *)(v30 - 144) = a19;
  v45 = (void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (int)(v31 & 0x8014F602)) - 4);
  v45(v30 - 144);
  HIDWORD(v44) = v31 + 1146;
  *(_DWORD *)(v30 - 104) = (v31 + 1146) ^ (1759421093
                                         * ((1760010739 - ((v30 - 144) | 0x68E7A1F3) + ((v30 - 144) | 0x97185E0C)) ^ 0x2465EE58));
  *(_QWORD *)(v30 - 128) = a18;
  *(_QWORD *)(v30 - 120) = v25;
  *(_QWORD *)(v30 - 112) = a20;
  *(_QWORD *)(v30 - 144) = a19;
  *(_QWORD *)(v30 - 136) = a20;
  v33 = (void (*)(uint64_t))(*(_QWORD *)(v26 + 8 * (v31 & 0x32870238)) - 8);
  v33(v30 - 144);
  LODWORD(v44) = v31 - 204;
  *(_DWORD *)(v30 - 128) = (v31 - 204) ^ (3804331 * ((v30 - 1072966065 - 2 * ((v30 - 144) & 0xC00BD6DF)) ^ 0x3A952589));
  *(_QWORD *)(v30 - 112) = a20;
  *(_QWORD *)(v30 - 104) = a11;
  *(_QWORD *)(v30 - 144) = a18;
  *(_QWORD *)(v30 - 136) = a20;
  *(_QWORD *)(v30 - 120) = a19;
  v43 = (void (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (int)(v31 & 0xC4BE3A5F)) - 12);
  v43(v30 - 144);
  *(_DWORD *)(v30 - 128) = (v31 + 733) ^ (235795823 * ((v30 - 144) ^ 0x94AD4959));
  *(_QWORD *)(v30 - 144) = a14;
  *(_QWORD *)(v30 - 136) = a19;
  v46(v30 - 144);
  *(_DWORD *)(v30 - 120) = v31
                         + 185
                         + 1224239923
                         * ((341731514 - ((v30 - 144) | 0x145E68BA) + ((v30 - 144) | 0xEBA19745)) ^ 0x19126A92);
  *(_QWORD *)(v30 - 136) = a21;
  *(_QWORD *)(v30 - 128) = v29;
  *(_QWORD *)(v30 - 144) = a19;
  *(_QWORD *)(v30 - 112) = a14;
  v45(v30 - 144);
  *(_QWORD *)(v30 - 120) = v25;
  *(_QWORD *)(v30 - 112) = a21;
  *(_DWORD *)(v30 - 104) = (v31 + 1146) ^ (1759421093
                                         * (((v30 - 144) & 0x2EBFC556 | ~((v30 - 144) | 0x2EBFC556)) ^ 0x623D8AFD));
  *(_QWORD *)(v30 - 136) = a21;
  *(_QWORD *)(v30 - 128) = a14;
  *(_QWORD *)(v30 - 144) = a19;
  v33(v30 - 144);
  *(_DWORD *)(v30 - 128) = (v31 - 204) ^ (3804331
                                        * ((((v30 - 144) | 0xA7E21245) - (v30 - 144) + ((v30 - 144) & 0x581DEDB8)) ^ 0x5D7CE113));
  *(_QWORD *)(v30 - 112) = a21;
  *(_QWORD *)(v30 - 104) = a12;
  *(_QWORD *)(v30 - 144) = a14;
  *(_QWORD *)(v30 - 136) = a21;
  *(_QWORD *)(v30 - 120) = a19;
  v43(v30 - 144);
  *(_QWORD *)(v30 - 144) = a20;
  *(_QWORD *)(v30 - 136) = a21;
  *(_DWORD *)(v30 - 128) = v31
                         + 1759421093 * (((v30 - 144) & 0xE1564B03 | ~((v30 - 144) | 0xE1564B03)) ^ 0xADD404A8)
                         - 32;
  ((void (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (v31 ^ 0x192)) - 8))(v30 - 144);
  *(_QWORD *)(v30 - 136) = a21;
  *(_DWORD *)(v30 - 144) = v31
                         + 535753261 * (((~(v30 - 144) & 0x3699B15C) - (~(v30 - 144) | 0x3699B15D)) ^ 0x3C6DBF72)
                         + 753;
  sub_1B7777100(v30 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t, _QWORD, void (*)(uint64_t), char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 + 8 * ((958 * (*(_DWORD *)(v30 - 128) >= (v31 ^ 0x81AF6D0u))) ^ v31)) - (v31 + 130) + 573))(v34, v35, v36, v37, v38, v39, v40, v41, a3, v43, v44, v45, a7, v46, a9, (v31 + 130), v33, (char *)*(&off_1E6CBBAA0 + v31 - 293) - 12, v47,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19);
}

uint64_t sub_1B776C464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t), void (*a18)(uint64_t), uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  void (*v33)(uint64_t);
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  *(_QWORD *)(v37 - 128) = v36;
  *(_QWORD *)(v37 - 144) = a27;
  *(_DWORD *)(v37 - 136) = (v34 ^ 0x3FE)
                         - 3804331 * ((((v37 - 144) | 0x544C886D) + (~(v37 - 144) | 0xABB37792)) ^ 0xAED27B3A)
                         + 957;
  v33(v37 - 144);
  *(_DWORD *)(v37 - 104) = ((v34 ^ 0x3FE) + 1016) ^ (1759421093
                                                   * ((((v37 - 144) | 0x21EF9EB5)
                                                     - (v37
                                                      - 144)
                                                     + ((v37 - 144) & 0xDE106148)) ^ 0x92922EE1));
  *(_QWORD *)(v37 - 128) = v36;
  *(_QWORD *)(v37 - 120) = a33;
  *(_QWORD *)(v37 - 112) = a27;
  *(_QWORD *)(v37 - 144) = a25;
  *(_QWORD *)(v37 - 136) = a27;
  a17(v37 - 144);
  *(_DWORD *)(v37 - 104) = ((v34 ^ 0x3FE) + 1016) ^ (1759421093 * ((v37 - 144) ^ 0xB37DB054));
  *(_QWORD *)(v37 - 120) = a27;
  *(_QWORD *)(v37 - 112) = a27;
  *(_QWORD *)(v37 - 144) = a25;
  *(_QWORD *)(v37 - 136) = a19;
  *(_QWORD *)(v37 - 128) = v36;
  a17(v37 - 144);
  *(_QWORD *)(v37 - 144) = a24;
  *(_DWORD *)(v37 - 136) = (v34 ^ 0x3FE)
                         + 1755732067 * (((~(v37 - 144) & 0xFCEE7674) - (~(v37 - 144) | 0xFCEE7675)) ^ 0x2228CBAE)
                         - 1882358041;
  *(_QWORD *)(v37 - 128) = a27;
  sub_1B778E578(v37 - 144);
  *(_DWORD *)(v37 - 136) = (v34 ^ 0x3FE)
                         - 3804331
                         * ((((v37 - 144) ^ 0x51617891) - 134039118 - 2 * (((v37 - 144) ^ 0x51617891) & 0xF802B9B2)) ^ 0x53FD3275)
                         + 957;
  *(_QWORD *)(v37 - 144) = a27;
  *(_QWORD *)(v37 - 128) = a26;
  a18(v37 - 144);
  *(_DWORD *)(v37 - 128) = ((v34 ^ 0x3FE) + 18) ^ (108757529
                                                 * ((((v37 - 144) | 0x9729A46D) + (~(v37 - 144) | 0x68D65B92)) ^ 0x77B5C647));
  *(_QWORD *)(v37 - 144) = a27;
  *(_QWORD *)(v37 - 136) = a26;
  v38 = sub_1B774F400(v37 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v35
                                                      + 8
                                                      * ((((13 * (v34 ^ 0x18B)) ^ 0x248) * (a21 == 0)) ^ ((v34 ^ 0x3FE) + 572)))
                                          - 8))(v38);
}

uint64_t sub_1B776C6BC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = 535753261 * ((((v3 - 144) | 0x96240AC8) - (v3 - 144) + ((v3 - 144) & 0x69DBF530)) ^ 0x9CD004E7);
  *(_QWORD *)(v3 - 120) = v6;
  *(_DWORD *)(v3 - 128) = v8 - v4 + (v0 ^ 0x6826CA3);
  *(_QWORD *)(v3 - 136) = v2;
  *(_DWORD *)(v3 - 144) = v4 + v0 - 447;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + v0 - 555) - 12))(v3 - 144);
  *(_DWORD *)(v7 - 0x384B062F07609540) = v8;
  *(_DWORD *)(v1 + 48) = 1973469985;
  return result;
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1B776C858@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 1808))();
  return 0;
}

uint64_t sub_1B776C86C()
{
  return 4294925273;
}

void sub_1B776C878(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)a1 - 235795823 * ((-969832657 - (a1 | 0xC631872F) + (a1 | 0x39CE78D0)) ^ 0xAD633189);
  v2 = *(_QWORD *)(a1 + 8);
  ((void (*)(_QWORD, void (*)()))*(&off_1E6CBBAA0 + v1 - 304))(*(&off_1E6CBBAA0 + (v1 ^ 0x2A8)), sub_1B778DFE0);
  __asm { BR              X10 }
}

uint64_t sub_1B776C924()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (((**(_QWORD **)(v1 + 8 * (((v2 - 528) | 0x215) ^ 0x2C4)) != 0)
                                * ((((v2 - 528) | 0x215) - 492559006) & 0x1D5BDA98 ^ 0x21A)) | (v2 - 528) | 0x215)))();
}

uint64_t sub_1B776C978@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 392)))(v1);
}

void sub_1B776C9A4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (qword_1EF181918 ^ qword_1EF181980) - (_QWORD)&v2;
  qword_1EF181980 = 792496711 * v0 - 0x3620D3564722E72;
  qword_1EF181918 = 792496711 * (v0 ^ 0x3620D3564722E72);
  *(_DWORD *)*(&off_1E6CBBAA0
             + ((71 * ((qword_1EF181918 - qword_1EF181980) ^ 0x72)) ^ byte_1B77A4E20[byte_1B77A1430[(71 * ((qword_1EF181918 - qword_1EF181980) ^ 0x72))] ^ 0x11])
             + 87) = 1973469985;
  v1 = ((uint64_t (*)(uint64_t, uint64_t))*(&off_1E6CBBAA0
                                                  + ((71 * ((qword_1EF181918 - qword_1EF181980) ^ 0x72)) ^ byte_1B779D340[byte_1B7799B00[(71 * ((qword_1EF181918 - qword_1EF181980) ^ 0x72))] ^ 0xEC])
                                                  - 3))(512, 1509315540);
  *(_QWORD *)*(&off_1E6CBBAA0
             + ((71 * ((qword_1EF181918 + qword_1EF181980) ^ 0x72)) ^ byte_1B779D640[byte_1B7799E00[(71 * ((qword_1EF181918 + qword_1EF181980) ^ 0x72))] ^ 0xF4])
             + 26) = v1;
  __asm { BR              X8 }
}

void sub_1B776CB58()
{
  int v0;
  _DWORD *v1;

  *v1 = v0 + 87;
}

void sub_1B7774130(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 535753261 * (((a1 | 0x882D0BB0) - a1 + (a1 & 0x77D2F44F)) ^ 0x82D9059F);
  __asm { BR              X9 }
}

uint64_t sub_1B77741DC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  BOOL v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v1 - 1621)))(200, 2354554103) == 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 ^ (23 * (v1 ^ 0x40))) & 1) * ((23 * (v1 ^ 0x640)) ^ 0x427)) ^ v1)))();
}

uint64_t sub_1B7774234(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t result;
  int v9;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 8 * (v6 - 956)))(a1, 0);
  if ((_DWORD)result == 16)
  {
    --v2;
    goto LABEL_7;
  }
  if ((_DWORD)result == 12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t))(v4 + 8 * (v3 ^ 0x4DB)))(a1);
    v9 = v2;
    goto LABEL_8;
  }
  if ((_DWORD)result)
  {
    v2 -= 2;
    goto LABEL_7;
  }
  *v5 = a1;
  v9 = 1699558434;
LABEL_8:
  *(_DWORD *)(v1 + 12) = v9 - 1699558434;
  return result;
}

void sub_1B77742BC(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_1B77743EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v9;
  int v10;
  int v11;
  _BOOL4 v13;

  v11 = **(unsigned __int8 **)(a7 + 80)
      - (**(unsigned __int8 **)(v7 + 8 * (v9 ^ (v9 + 141))) ^ (((((76 * ((v9 - 4) ^ 0x2E)) ^ 0xEA)
                                                                                  - 47) & 0x7E ^ 0xE ^ (v9 - 36))
                                                                                + 53));
  v13 = (v11 ^ 0xFED6CEEF) + ((2 * v11) & 0xFDAD9DDE) + 2013134814 == v10
     && a4
      - 0x4008B778033CBD8ELL
      + ((((332 * ((v9 - 4) ^ 0xA5A69A2E)) ^ 0x6EA) + 963828689) & 0xC68D267E ^ 0x4008B7774EB02058) != 0;
  __asm { BR              X15 }
}

void sub_1B7775618(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  __asm { BR              X9 }
}

uint64_t sub_1B77756A0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((*(_DWORD *)(v2 - 0x1E6EF7153090DAALL) == 1973469985) * (((v1 + 3) | 0x158) ^ 0x7F5)) ^ v1)))();
}

uint64_t sub_1B77756EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x1E6EF7153090DB2) + 1513950665;
  v4 = *(_DWORD *)(v1 - 0x1E6EF7153090DB6) - 1545447054;
  v5 = v3 < 0xC603C3BF;
  v6 = v3 > v4;
  if (v5 != v4 < 0xC603C3BF)
    v6 = v5;
  return (*(uint64_t (**)(void))(a1 + 8 * (int)((v6 * ((v2 + 1623425659) & 0x9F3C7FCF ^ 0x51C)) ^ v2)))();
}

uint64_t sub_1B777578C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  v5 = *(_QWORD *)(v3 - 0x1E6EF7153090DC2);
  v6 = *(unsigned __int8 *)(v5 + (v2 - 1808184827)) ^ 0x63;
  v7 = ((*(unsigned __int8 *)(v5 + (v2 - 1808184830)) ^ 0x63) << ((v4 - 100) & 0xBD ^ 5)) | ((*(unsigned __int8 *)(v5 + (v2 - 1808184829)) ^ 0x63) << 16) | (~((v4 + 58) & 0x9E ^ *(_BYTE *)(v5 + (v2 - 1808184828))) << 8) | v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((13
                                          * (((v1 + v7 - 2 * (v7 & (v1 + 26) ^ v6 & 0x1A) + 0x1000000) & 0xFFFFFF) == 6019705)) ^ v4))
                            - 12))();
}

uint64_t sub_1B777587C@<X0>(unsigned int a1@<W1>, int a2@<W6>, uint64_t a3@<X8>)
{
  int v3;

  v3 = ((((a1 - 422) ^ 0x3E0) - (a2 + 23)) & (a1 + 1073740388)) != 0;
  return (*(uint64_t (**)(void))(a3 + 8 * (((8 * v3) | (v3 << 6)) ^ a1)))();
}

uint64_t sub_1B7775930@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((((a1 ^ 0x1EB) + 1163) * (v3 != v2)) ^ a1)) - 8))();
}

void sub_1B7775958()
{
  _DWORD *v0;

  *v0 = -1973446636;
}

void sub_1B7775AC8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B7775B28()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((207 * (v1 == 1123162719)) ^ 0x69u)) - 4))();
}

uint64_t sub_1B7775B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;

  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 800) = 689693747;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 804) = 561217817;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 808) = *(_QWORD *)(a1 + 96) + 816;
  v4 = *(_QWORD *)(a1 + 96) + 0x709331AC20D1CF29;
  v5 = *(_QWORD *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - 1123162719);
  v6 = 108757529 * (((&v8 | 0x23923E10) - (&v8 & 0x23923E10)) ^ 0xC30E5C3B);
  v12 = (v3 ^ 0xC5) - v6 + 1565213335;
  v8 = v4;
  v10 = v5;
  v9 = 1199 - v6;
  ((void (*)(uint64_t *))(*(_QWORD *)(a3 + 296) - 4))(&v8);
  return (-1242343481 * v11 + 1436662369);
}

uint64_t sub_1B7775CA8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))((char *)&unk_1E6CB7A54 + 8 * ((26 * (*(_DWORD *)(a2 + 4) == 1123162720)) ^ 0x30Eu) - 4))();
}

uint64_t sub_1B7775CE4(uint64_t a1, uint64_t a2)
{
  char v2;

  if (**(_BYTE **)(a2 + 8))
    v2 = 57;
  else
    v2 = 56;
  *(_BYTE *)(a1 + 88) = v2;
  return 0;
}

uint64_t sub_1B7775D08()
{
  return 4294925278;
}

void sub_1B7775D10(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) ^ (1225351577 * ((-2 - ((~(_DWORD)a1 | 0x83317A5F) + (a1 | 0x7CCE85A0))) ^ 0xFDCEE06D));
  __asm { BR              X10 }
}

uint64_t sub_1B7775DEC@<X0>(uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v10 = 108757529
      * (((&a3 | 0x5B589B14) - &a3 + (&a3 & 0xA4A764E8)) ^ 0xBBC4F93F);
  a5 = v8;
  a3 = &STACK[0x3E5369CC567B1177];
  a6 = 1780120393 - v10;
  a7 = v7 - v10 - 325;
  a4 = v10 ^ 0xC73E8E3C;
  v11 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v7 - 600)) - 4))(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((1199 * (*(_DWORD *)(v8 - 0x1E6EF7153090DAALL) == 1973469985)) ^ v7))
                                          - 8))(v11);
}

void sub_1B7775EC4(_DWORD *a1@<X8>)
{
  _DWORD *v1;
  int v2;
  int v3;
  _BYTE *v4;

  v3 = -829511551 * (*v1 + v2) - ((18698498 * (*v1 + v2) + 30653380) & 0x22B5F86) + 805277093;
  *v4 = (HIBYTE(v3) ^ 0x81) - 2 * ((HIBYTE(v3) ^ 0x81) & 0x6B ^ HIBYTE(v3) & 8) + 99;
  v4[1] = (BYTE2(v3) ^ 0x15) + (~(2 * (BYTE2(v3) ^ 0x15)) | 0x39) + 100;
  v4[2] = (BYTE1(v3) ^ 0xAF) - ((2 * (BYTE1(v3) ^ 0xAF)) & 0xC7) + 99;
  v4[3] = v3 ^ 0xA0;
  v1[4] = *a1;
}

uint64_t sub_1B7775FB0(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)&unk_1E6CB7A54
                                        + 8 * ((451 * (*(_DWORD *)(a2 + 4) != 1123162720)) ^ 0x4FBu)
                                        - 4)
                            - 4))();
}

uint64_t sub_1B7775FF0()
{
  return 4294925278;
}

uint64_t sub_1B7775FF8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xDEBF37FF) + 2 * **(unsigned __int8 **)(a2 + 8) + 2004738022;
  return 0;
}

void sub_1B7776028(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = 1224239923 * (((a1 | 0x53DFEB40) - (a1 & 0x53DFEB40)) ^ 0xA16C1697);
  v2 = *(_DWORD *)a1 ^ v1;
  v3 = (*(_BYTE *)(a1 + 32) ^ v1);
  ((void (*)(char *, void (*)()))*(&off_1E6CBBAA0 + v2 - 290))((char *)*(&off_1E6CBBAA0 + (v2 ^ 0x212)) - 4, sub_1B778E67C);
  v5 = *(_QWORD *)((char *)*(&off_1E6CBBAA0 + v2 - 401) - 4);
  v4 = v2
     + 235795823 * ((1116804802 - (&v4 | 0x429116C2) + (&v4 | 0xBD6EE93D)) ^ 0x29C3A064)
     + 14;
  sub_1B776C878((uint64_t)&v4);
  __asm { BR              X8 }
}

uint64_t sub_1B777616C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, char a17)
{
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  a17 = 71 - -85 * ((~&a16 & 0x5E | &a16 & 0xA1) ^ 8);
  a16 = (v17 + 619) ^ (3804331 * ((~&a16 & 0x2232EA5E | &a16 & 0xDDCD15A1) ^ 0xD8AC1908));
  sub_1B77552A4((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8 * ((15 * (**(_DWORD **)(v19 + 8 * (v17 - 346)) == ((v17 - 514) & 0xFFFFFBB9))) ^ (v17 + 671)))
                                                                                                - ((v17 - 514) ^ 0x202u)
                                                                                                + 510))(v20, v21, v22, v23, v24, v25, v26);
}

uint64_t sub_1B7776230@<X0>(int a1@<W8>)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t (*v13)(uint64_t, _BYTE *, _DWORD *);
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t result;
  uint64_t v21;
  _BYTE v22[30];
  _BYTE v23[140];

  v8 = *(unsigned int **)(v6 + 8 * (a1 - 417));
  v9 = *v8;
  v10 = *(_QWORD **)(v6 + 8 * (a1 ^ 0x2D2));
  v11 = (_BYTE *)*v10;
  v22[0] = *(_BYTE *)*v10 - 98;
  v22[1] = v11[1] - 98;
  v22[2] = v11[2] - 98;
  v22[3] = v11[3] - 98;
  v22[4] = v11[4] - 98;
  v22[5] = v11[5] - 98;
  v22[6] = v11[6] - 98;
  v22[7] = v11[7] - 98;
  v22[8] = v11[8] - 98;
  v22[9] = v11[9] - 98;
  v22[10] = v11[10] - 98;
  v22[11] = v11[11] - 98;
  v22[12] = v11[12] - 98;
  v22[13] = v11[13] - 98;
  v22[14] = v11[14] - 98;
  v22[15] = v11[15] - 98;
  v22[16] = v11[16] - 98;
  v22[17] = v11[17] - 98;
  v22[18] = v11[18] - 98;
  v22[19] = v11[19] - 98;
  v22[20] = v11[20] - 98;
  v22[21] = v11[21] - 98;
  v12 = (_BYTE *)*v10;
  v22[22] = v12[22] - 98;
  v22[23] = v12[23] - 98;
  v22[24] = v12[24] - 98;
  v22[25] = v12[25] - 98;
  v22[26] = v12[26] - 98;
  v22[27] = v12[27] - 98;
  v22[28] = v12[28] - 98;
  v22[29] = v12[29] - 98;
  v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8 * (a1 ^ 0x2CE));
  v14 = v13(v9, v22, v2);
  v15 = ((2 * v14) & 0xFEE7FFF6) + (v14 ^ 0x7F73FFFB);
  if (v15 != 2138308603)
  {
    if (v15 == 2138309705)
    {
      v16 = *v8;
      v17 = *(_BYTE **)(*(_QWORD *)(v6 + 8 * (v4 - 323)) - 4);
      v23[0] = *v17 - 76;
      v23[1] = v17[1] - 76;
      v23[2] = v17[2] - 76;
      v23[3] = v17[3] - 76;
      v23[4] = v17[4] - 76;
      v23[5] = v17[5] - 76;
      v23[6] = v17[6] - 76;
      v23[7] = v17[7] - 76;
      v23[8] = v17[8] - 76;
      v23[9] = v17[9] - 76;
      v23[10] = v17[10] - 76;
      v23[11] = v17[11] - 76;
      v23[12] = v17[12] - 76;
      v23[13] = v17[13] - 76;
      v23[14] = v17[14] - 76;
      v23[15] = v17[15] - 76;
      v23[16] = v17[16] - 76;
      v23[17] = v17[17] - 76;
      v23[18] = v17[18] - 76;
      v23[19] = v17[19] - 76;
      v18 = v13(v16, v23, v2);
      v19 = (2 * v18) & 0x18E7FFBC;
      v15 = (v18 ^ 0x8C73FFDE) + 2143221500;
    }
    else
    {
      v19 = -1933642017;
    }
    __asm { BR              X8 }
  }
  *(_DWORD *)(v7 + 348) |= (547 * (v4 ^ 0x200)) ^ 0x44C;
  *(_DWORD *)(v7 + 48) = 2040561642;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8 * (v4 - 407)))(*v2, v7 + 336, v7 + 340, v7 + 344, v3);
  v21 = *(_QWORD *)(v1 + 24);
  *(_DWORD *)(*(_QWORD *)(v1 + 8) - 0x5412677448247A30) = *v2;
  *(_DWORD *)(v21 - 0xB0A4D7BDB51E979) = *v3;
  *(_DWORD *)(v1 + 16) = 1973469985;
  return result;
}

void sub_1B7776660(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 3804331 * ((a1 & 0x618DD5DA | ~(a1 | 0x618DD5DA)) ^ 0x64ECD973);
  __asm { BR              X9 }
}

uint64_t sub_1B777671C(_QWORD *a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8
                                             * ((*(_DWORD *)(*a1 + v4) == ((5 * (v3 ^ 0x32D)) ^ (v1 + 1253))) ^ v3))
                            - 8))();
}

uint64_t sub_1B7776750@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v6 = ((v2 ^ 0x628) - 939) ^ (108757529
                             * ((-201153669 - (&v4 | 0xF402A37B) + (&v4 | 0xBFD5C84)) ^ 0xEB613EAF));
  v4 = a1;
  v5 = v1;
  return sub_1B774F400((uint64_t)&v4);
}

uint64_t sub_1B77768CC(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 535753261 * ((((2 * a1) | 0x48BC2786) - a1 - 610145219) ^ 0x2EAA1DEC);
  v2 = *(_DWORD *)a1 - v1;
  v3 = *(_DWORD *)(a1 + 16) + v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05);
  v6 = v4 - 561217817;
  v5 = v4 - 561217817 < 0;
  v7 = 561217817 - v4;
  if (!v5)
    v7 = v6;
  return (*(uint64_t (**)(void))((char *)*(&off_1E6CBBAA0 + (v2 ^ 0x31))
                              + 8 * ((19 * ((v3 - 1913760756) >= 4 * (unint64_t)v7)) ^ v2)
                              - 4))();
}

uint64_t sub_1B7776990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                + 8
                                                                                * ((1258 * (v4 != (v6 ^ 0x7211AB11))) ^ v6)))(a1, a2, a3, a4, 3678669467);
}

uint64_t sub_1B77769C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2
                                                                                                 + 8
                                                                                                 * (((v3 - 1239) | 0x40) ^ 0x32))
                                                                                     - (((v3 - 1239) | 0x40) ^ 0x4B7u)
                                                                                     + 1499))(a1, 874302806, (v3 - 1239) | 0x40u, 1971644092, ((v3 - 1239) | 0x40) ^ 0x4B7u, v1);
}

uint64_t sub_1B7776A40@<X0>(uint64_t a1@<X0>, int a2@<W3>, int a3@<W4>, int a4@<W5>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 24) + (a4 + a5)) = (a2 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1016 * (a4 - 1 == (a3 ^ (v6 + 304) ^ (a3 - 1175)))) ^ a3)) - 8))();
}

uint64_t sub_1B7776A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5
                                                                                                  + 8 * (int)((50 * (v6 == 24)) ^ a3))
                                                                                      - (a3 ^ 0x4B7)
                                                                                      + 1499))(a1, a2, a3, a4, a3 ^ 0x4B7, v4);
}

uint64_t sub_1B7776AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v8 = v3 > 0x6B2056E1;
  if (v8 == (int)a2 - 524100664 < -1797281506)
    v8 = (int)a2 - 524100664 < v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5
                                                                                                  + 8 * (int)(a3 ^ (1892 * v8)))
                                                                                      - (a3 ^ v7)
                                                                                      + 1499))(a1, a2, a3, 1971644092, a3 ^ v7, v4);
}

uint64_t sub_1B7776B34@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  int v4;
  _QWORD *v5;

  return sub_1B7776A40(a1, *(_DWORD *)(*v5 + 4 * (int)(((a3 + 1175) ^ 0xCBE3374D) + a2)), a3 + 1175, v4, a4);
}

uint64_t sub_1B7776B60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(result + 32) = a5;
  return result;
}

uint64_t sub_1B7776B68(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  v2 = *(_DWORD *)(result + 8) - 628203409 * (((result | 0xC21FEC2B) - (result & 0xC21FEC2B)) ^ 0x4097E018);
  v3 = ((v2 & 0x57 ^ 0x2BDDA444) + (v2 & 0x1A8 ^ 9) - 1) ^ 0x53DDE577;
  *(_DWORD *)(v1 - 0xD547898781B1160) = (((2 * v3) | 0x35B0131A) - v3 + 1697117811) ^ 0xFB9DDA05;
  *(_QWORD *)(v1 - 0xD547898781B1180) = 0xC9A835930D185D72;
  *(_DWORD *)(v1 - 0xD547898781B1164) = 1024156329;
  v4 = v2 ^ 0xEF;
  if (v4 == 1)
  {
    v5 = 1024156345;
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    *(_DWORD *)(v1 - 0xD547898781B1168) = 734771262;
    v5 = 1024156349;
LABEL_5:
    *(_QWORD *)(v1 - 0xD547898781B1178) = 0x7D4F2478F5C7ACFLL;
    *(_QWORD *)(v1 - 0xD547898781B1170) = 0xF82B0DB870A38530;
    *(_DWORD *)(v1 - 0xD547898781B1164) = v5;
  }
  *(_DWORD *)(result + 4) = 1908186914;
  return result;
}

void sub_1B7776CF8(uint64_t a1)
{
  int v1;

  v1 = 108757529 * (a1 ^ 0xE09C622B);
  __asm { BR              X9 }
}

uint64_t sub_1B7776D78(uint64_t result)
{
  *(_DWORD *)(result + 24) = -1110137701;
  return result;
}

void sub_1B7777100(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 - 535753261 * ((a1 + 317168069 - 2 * (a1 & 0x12E799C5)) ^ 0x181397EA);
  v2 = *(_QWORD *)(a1 + 8);
  v3[0] = v1 + 235795823 * (((v3 | 0xCFB44D7) - (v3 & 0xCFB44D7)) ^ 0x98560D8E) - 305;
  v4 = v2;
  sub_1B7789BDC((uint64_t)v3);
  __asm { BR              X8 }
}

void sub_1B77771F8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;

  if ((*(_DWORD *)(v2 - 0x709331AC20D1CC05) - 561217818) >= 0x7FFFFFFF)
    v3 = v1;
  else
    v3 = v1 + 2;
  *(_DWORD *)(v0 + 16) = v3;
}

void sub_1B7777264(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x35AD11BEDFA3F43ALL) + 1588711211;
  v3 = *(_DWORD *)(a1 + 20) + v1 + 1950351397;
  v4 = v2 < 0xD159586B;
  v5 = v2 > v3;
  if (v3 < 0xD159586B != v4)
    v5 = v4;
  __asm { BR              X9 }
}

uint64_t sub_1B777734C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + ((v3 + 1439695119) & 0xAA2FFBDE ^ 0x8D5874BF) + v2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (v3 | (8 * (((v4 + (v3 ^ 0x52155EEF) - ((2 * v4) & 0xFFFFFFFB)) & 0x1F) == 2))))
                            - 8))();
}

uint64_t sub_1B77773B8()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  _BOOL4 v5;

  v4 = (v3 ^ 0xC1B684BE) + v0;
  v5 = v2 - 1406642747 > v4;
  if ((v2 - 1406642747) < 0x1ECFDF04 != v4 < 0x1ECFDF04)
    v5 = (v2 - 1406642747) < 0x1ECFDF04;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((!v5 * (v3 ^ 0x365)) | v3)) - 12))();
}

uint64_t sub_1B7777420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;

  v6 = *(unsigned __int8 *)(v1 + (v3 + v4 + 941));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v2
                                                              + 8
                                                              * (int)(((v6 >> 7) * ((v5 ^ 0x356) - 284)) ^ v5 ^ 0x356))
                                                  - 12))(a1, (v6 ^ 0xCEF31FFF) + 2 * v6 + 1946090080);
}

uint64_t sub_1B7777498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1021
                                          * (((a5 + ((a5 + 1579693506) & 0xA1D7CBEE ^ 0xFEEFF971) + 433) ^ (v6 + 1) & 0x7F)
                                           + ((2 * (v6 + 1)) & 0x1A)
                                           + 17826162 > 3)) ^ a5))
                            - 12))();
}

uint64_t sub_1B7777510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v11 = v9 + a7 - 2126521699;
  v12 = v11 < ((v10 - 938) | 0x152u) - 220765933;
  v13 = v11 > v7 - 1782707677;
  if ((v7 - 1782707677) < 0xF2D76269 != v12)
    v13 = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((2022 * !v13) ^ v10)) - 4))();
}

uint64_t sub_1B7777590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v7 + (v9 + v10 + v11 + 600));
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v8 + 8 * (v11 ^ (666 * (a7 != -17826162)))) - 12))(a1, ((((v11 + 704902561) & 0xD5FC0F3A) + 2062686637) ^ v12) - 939525504 + ((2 * v12) & 0xFFFFFFBF));
}

uint64_t sub_1B7777624(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v12 = *(unsigned __int8 *)(v8 + (v11 + a5)) | (a2 << 8);
  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v9 + 8 * ((157 * (v10 - 1 == a6)) ^ a8)) - 8))(a1, ((v12 + 233152768) ^ 0x63FB9EDF) - 554271872 + ((a8 - 940099700) & (2 * (v12 + 233152768))));
}

uint64_t sub_1B7777690(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = a2 + v10 + v12 + v11 - 88231614 + 60903016;
  v14 = v8 + 1439648143;
  v15 = (v14 < 0xB2E8A1D5) ^ (v13 < 0xB2E8A1D5);
  v16 = v13 > v14;
  if (v15)
    v16 = v13 < 0xB2E8A1D5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((!v16 * ((a8 - 1074) ^ 0x32D)) | (a8 - 1074))) - 12))();
}

uint64_t *sub_1B777771C@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = result[6];
  v10 = *result;
  v9 = result[1];
  *a3 = ((v6 - 776189457) & 0x2E43B7BE ^ 0xC360367A) + v5;
  *(_DWORD *)(v10 - 0x2C42BDE96F161207) = v4;
  *(_DWORD *)(v8 - 0x5248BA885C210B04) = a2;
  *(_QWORD *)(v9 - 0x41D57A3C79D937EFLL) = v3 + (v7 - 1817524494);
  *((_DWORD *)result + 8) = 1973469985;
  return result;
}

void sub_1B77777B0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B7777818@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  unsigned int v4;

  *(_DWORD *)(*(_QWORD *)(a2 + 96) + 24) = v3;
  v4 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 2048641858) & 0xF188C97A) - 1244509602;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2
                                                     + 8
                                                     * ((4
                                                       * (((2 * v4) & 0x9DD77E36 ^ 0x91804832)
                                                        + (v4 ^ 0x362FDBA6)
                                                        + 1969223677 == 1145812760)) | 0x36Au))
                                         - 4))(0);
}

uint64_t sub_1B77778A8()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((205 * ((v2 + v1 + 823410917) > 7)) ^ 0x15Au)) - 8))();
}

uint64_t sub_1B777790C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8 * (a1 ^ (873 * ((unint64_t)(v5 - a4 - 4) > 0x1F))))
                            - (((_WORD)a1 - 13691) & 0x6EE ^ 0x2C6)))();
}

uint64_t sub_1B7777954(int a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((((a1 + 1432) ^ 0x6F1) + v2 + 1051975869) ^ (157 * ((a1 + 1432) ^ 0x6F1)))
                                * (v3 < 0x20)) ^ (a1 + 1432))))();
}

uint64_t sub_1B777799C@<X0>(int a1@<W2>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v7 = (a1 + v5);
  v8 = *(_OWORD *)(v4 + v7 - 15);
  v9 = *(_OWORD *)(v4 + v7 - 31);
  v10 = a3 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((1139 * (((a2 | 0x5FC) ^ 0x5DC) == (v6 & 0xFFFFFFE0))) ^ (a2 + 523)))
                            - 4))();
}

uint64_t sub_1B7777A00(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  int v9;

  return (*(uint64_t (**)(_QWORD))(v7
                                           + 8
                                           * ((((3 * (a7 ^ 0x485)) ^ (a5 + (a7 ^ (v8 + 967)) + 1946)) * (v9 == a4)) ^ a7)))(0);
}

uint64_t sub_1B7777A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  char v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a8 - 1127) * ((v9 & 0x18) != 0)) | a8))
                            - (a8 - 660)
                            + 467))();
}

uint64_t sub_1B7777A6C@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  *(_QWORD *)(a4 - 7 + (v8 + v7 + a2 - a3)) = *(_QWORD *)(v5 - 7 + (v8 + v7 + a2 - a3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((787 * (a3 - (v6 & 0xFFFFFFF8) == -8)) ^ a1))
                            - (((a1 - 143) | 0x12u) ^ 0x156)))();
}

void sub_1B7777AD0()
{
  JUMPOUT(0x1B7777AA8);
}

uint64_t sub_1B7777ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  int v8;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v6 + 8 * (v8 ^ (599 * (v7 == a6))))
                                         - (v8 + 372)
                                         - ((v8 - 103976347) & 0xC77EAD5E ^ 0xFFFFFFFF3EB3DC24)))(0);
}

uint64_t sub_1B7777B2C@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_BYTE *)(a3 + (a1 + v8)) = *(_BYTE *)(v7 + (a1 + v8));
  return ((uint64_t (*)(_QWORD))(v3
                                         - (a2 ^ (v6 + 693))
                                         + *(_QWORD *)(v4 + 8 * ((416 * (a1 - 1 == v5)) ^ a2))
                                         + 4))(0);
}

uint64_t sub_1B7777B7C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))(*((_QWORD *)&unk_1E6CB7A50
                                            + ((116 * (*(_DWORD *)(a2 + 4) == 1123162732)) ^ 0x1B8u))
                                          - 4))(4294925278);
}

uint64_t sub_1B7777BC4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 468) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2 + 11600) - 4))(0);
}

uint64_t sub_1B7777C20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v4)) = *(_BYTE *)(v3 + (v7 + v4));
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v1 + 8 * (((v7 - 1 != v5) * v6) ^ v2)) - 4))(0);
}

void sub_1B7777C54(uint64_t a1)
{
  int v1;

  v1 = 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X14 }
}

uint64_t sub_1B7777D58()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (v0 ^ (635 * (v1 != 0x76A01E9)))))();
}

uint64_t sub_1B7777DA8()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;

  v10 = (v6 - 951018786);
  v11 = v10 & ((v1 + 139) - 504);
  *(_BYTE *)(v8 + v10) = *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v1 - 207)) + v11) ^ *(_BYTE *)(v0 + v10) ^ (23 * v11) ^ *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v1 - 181)) + v11) ^ *(_BYTE *)(*(_QWORD *)(v7 + 8 * (v1 ^ 0x1EC)) + v11 - 7);
  v12 = v6 - 1933724892 < v4;
  if (v3 > 0x3A92E7BA != v6 - 1933724892 < (v2 + 519))
    v12 = v3 > 0x3A92E7BA;
  return (*(uint64_t (**)(void))(v9 + 8 * ((v12 * v5) ^ v1)))();
}

uint64_t sub_1B7777E5C()
{
  int v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = ((2 * v1) & 0xFFD3B75A ^ 0xED00352) + (v1 ^ 0x7883DA44) - 721493801 + 1320 == ((v0 - 1084) ^ 0x730) + 1424538741;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((8 * v3) | (32 * v3) | v0)) - 8))();
}

uint64_t sub_1B7777ECC(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (a4 ^ (788 * ((a2 + a1 - 2146032557) > 7))))
                            - 93 * (a4 ^ 0x53Cu)
                            + 1019))();
}

uint64_t sub_1B7777F40(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((2024
                                          * (a3 + a5 + 4 * (((a4 ^ 0x65A) - 386877294) & 0x170F47FF ^ 0x331u) - 840 > 0xFFFFFFEF)) ^ a4 ^ 0x65A))
                            - 12))();
}

uint64_t sub_1B7777F9C(int a1, int a2, int a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v16;
  unint64_t v17;
  int v19;

  v10 = (a2 + a1 + a3) + v8;
  v11 = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3) & 0xF;
  v12 = v11 - v10;
  v13 = (v5 | v11) - v10;
  v14 = (v7 | v11) - v10;
  v16 = (unint64_t)(v4 - v8) >= 0x10
     && v12 + v6 >= (unint64_t)((a4 + 691425479) & 0xD6C9AFFF) - 1007
     && v13 >= 0x10;
  v17 = v14 + 2;
  v19 = !v16 || v17 < (((a4 + 552) | 7) ^ 0x577uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((85 * v19) ^ a4)) - 12))();
}

uint64_t sub_1B7778034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  v12 = (uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((1008 * (v8 >= ((a8 - 985) ^ 0x19Eu))) ^ a8))
                          - ((a8 - 922298729) & 0x36F92797)
                          + 914);
  *(_DWORD *)(v11 - 140) = v9;
  return v12();
}

uint64_t sub_1B7778084(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16x4_t v70;
  int8x16x4_t v71;

  *(_DWORD *)(v65 - 128) = v63 + 5;
  v70.val[1].i64[0] = ((_BYTE)v63 + 1) & 0xF;
  v70.val[1].i64[1] = v63 & 0xF;
  v70.val[2].i64[0] = ((_BYTE)v63 - 1) & 0xF;
  v70.val[2].i64[1] = ((_BYTE)v63 + 14) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)v63 + 13) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)v63 - 99 * (a6 ^ 0x94) - 46) & 0xF;
  v66.i64[0] = 0xC5C5C5C5C5C5C5C5;
  v66.i64[1] = 0xC5C5C5C5C5C5C5C5;
  v70.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)v63 + 2) & 0xF;
  v67.i64[0] = vqtbl4q_s8(v70, (int8x16_t)xmmword_1B77959A0).u64[0];
  v71.val[0].i64[1] = ((_BYTE)v63 + 10) & 0xF;
  v71.val[1].i64[1] = ((_BYTE)v63 + 8) & 0xF;
  v71.val[2].i64[1] = ((_BYTE)v63 + 6) & 0xF;
  v71.val[3].i64[1] = ((_BYTE)v63 + 4) & 0xF;
  v71.val[0].i64[0] = ((_BYTE)v63 + 11) & 0xF;
  v71.val[1].i64[0] = ((_BYTE)v63 + 9) & 0xF;
  v71.val[2].i64[0] = ((_BYTE)v63 + 7) & 0xF;
  v71.val[3].i64[0] = *(_DWORD *)(v65 - 128) & 0xF;
  v67.i64[1] = vqtbl4q_s8(v71, (int8x16_t)xmmword_1B77959A0).u64[0];
  v68 = vrev64q_s8(vmulq_s8(v67, v66));
  *(int8x16_t *)(v64 - 15 + (a2 + a1 + a3)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v61 + v70.val[0].i64[0] - 15), *(int8x16_t *)(v59 - 15 + (a2 + a1 + a3))), veorq_s8(*(int8x16_t *)(v60 + v70.val[0].i64[0] - 15), *(int8x16_t *)(v70.val[0].i64[0] + v62 - 13))), vextq_s8(v68, v68, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a58 + 8 * ((172 * ((v58 & 0xFFFFFFF0) != 16)) ^ (413 * (a6 ^ 0x394))))
                            - ((413 * (a6 ^ 0x394) - 530) | 0x54u)
                            + 372))();
}

void sub_1B7778208()
{
  JUMPOUT(0x1B7778188);
}

uint64_t sub_1B7778214()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 + 955 + ((v1 - 380) | 0x207) - 1666) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_1B7778258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  char v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (((16
                                           * (((((v8 & 8) == 0) ^ (a8 - 56)) ^ (-57 * (a8 ^ 0x35))) & 1)) & 0xBF | ((((((v8 & 8) == 0) ^ (a8 - 56)) ^ (-57 * (a8 ^ 0x35))) & 1) << 6)) ^ a8))
                            - 4))();
}

uint64_t sub_1B77782A0@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  char v66;
  uint64_t v67;
  int8x16x4_t v69;

  *(_DWORD *)(v63 - 144) = v54;
  v64 = v54 & 0xFFFFFFF8;
  *(_QWORD *)(v63 - 128) = v55 - 7;
  *(_QWORD *)(v63 - 136) = v61 - 7;
  *(_DWORD *)(v63 - 148) = v64;
  v65 = a2 + a1;
  v66 = v65 + v60;
  *(_DWORD *)(v63 - 160) = (a4 + 2064335849) & 0x84F4BFBF;
  v67 = (v65 + a3 - v62);
  v69.val[0].i64[0] = ((_BYTE)v65 + (_BYTE)a3 - (_BYTE)v62) & 0xF;
  v69.val[0].i64[1] = (v66 + 42 - (_BYTE)v62) & 0xF;
  v69.val[1].i64[0] = (v66 + 41 - (_BYTE)v62) & 0xF;
  v69.val[1].i64[1] = (v59 - (_BYTE)v62) & 0xF;
  v69.val[2].i64[0] = (v66 - (_BYTE)v62 + (_BYTE)a4 - 23) & 0xF;
  v69.val[2].i64[1] = (v66 + 54 - (_BYTE)v62) & 0xF;
  v69.val[3].i64[0] = (v66 + 53 - (_BYTE)v62) & 0xF;
  v69.val[3].i64[1] = (v66 + 52 - (_BYTE)v62) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v63 - 136) + v67) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v57 + (v67 & 0xF) - 7), *(int8x8_t *)(*(_QWORD *)(v63 - 128) + v67)), veor_s8(*(int8x8_t *)(v56 + (v67 & 0xF) - 7), *(int8x8_t *)((v67 & 0xF) + v58 - 5))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v69, (int8x16_t)xmmword_1B77959B0), (int8x8_t)0xC5C5C5C5C5C5C5C5)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a54 + 8 * ((1445 * (8 - v64 == -v62)) ^ a4)) - 12))((__n128)xmmword_1B77959B0);
}

void sub_1B77783F8()
{
  JUMPOUT(0x1B777831CLL);
}

uint64_t sub_1B7778404()
{
  uint64_t v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((((*(_DWORD *)(v1 - 160) - 1018) | 0x2C2) ^ 0xC8)
                                          * (*(_DWORD *)(v1 - 144) == *(_DWORD *)(v1 - 148))) ^ *(_DWORD *)(v1 - 160)))
                            - (*(_DWORD *)(v1 - 160) - 816)
                            + 515))();
}

uint64_t sub_1B7778458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = (a6 - 1424540077);
  v15 = (((a7 - 1021) | 0x205) ^ 0x208) & v14;
  *(_BYTE *)(v12 + v14) = *(_BYTE *)(v10 + v15) ^ *(_BYTE *)(v7 + v14) ^ *(_BYTE *)(v9 + v15) ^ *(_BYTE *)(v15 + v11 + 2) ^ (-59 * v15);
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((a7 + 513) | (4 * (a6 - 1 != v8 + 1335)))) - 4))();
}

uint64_t sub_1B77784D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  int v56;

  v54 = *(_QWORD *)(v49 + 24);
  *(int8x16_t *)(v53 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v49 + 16) - 0x399DE98F08C0F0A4), (int8x16_t)xmmword_1B77959D0);
  if (v51)
    v55 = v54 == 0x3AC75C5FABFFD319;
  else
    v55 = 1;
  v56 = !v55;
  HIDWORD(a24) = v50 << ((((a5 - 69) | 5) - 75) ^ 0x7D);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 + 8 * (int)((1841 * v56) ^ a5)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_1B777855C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  int v57;
  int v58;
  uint64_t v59;
  _BOOL4 v61;

  v61 = (((BYTE4(a24) & 0x58) + (v58 ^ 0xAC) + 4) & 0xF) != 0
     || (HIDWORD(a24) & 0xDF37FB58) + (v58 ^ 0xEF9BFDAC) == -274989652;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 + 8 * ((((v57 - 261) ^ 0x302) * v61) ^ v57)) - a57 + 1392))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_1B77785BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,uint64_t a24,int a25,int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59)
{
  uint64_t v59;
  unsigned int v60;

  v60 = a23 - (a26 & 0xEB8E1FEE) + 1784133289 + ((a59 - 1115) | 0x2DE) + 616;
  return ((uint64_t (*)(void))(*(_QWORD *)(v59
                                        + 8
                                        * ((249
                                          * (((2 * v60) & 0x54D3CAE8 ^ 0x40820AE8) + (v60 ^ 0x5FAEEA83) == 711583092)) ^ a59))
                            - 12))();
}

uint64_t sub_1B7778678(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v5
                                                                                        + 8
                                                                                        * ((234
                                                                                          * (v2 - 711583092 < ((v3 + 706069464) & 0xD5EA37FB) - 563)) ^ v3))
                                                                            - 12))(a1, a2, v4, (v3 + 706069464) & 0xD5EA37FB, ((v3 + 706069464) & 0xD5EA37FB) + 452);
}

uint64_t sub_1B77786FC(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8 * ((126 * (v4 + (a4 ^ 0x1C4u) - 758 + a2 + a1 - 281 > 0xFFFFFFEF)) ^ a4))
                            - 8))();
}

uint64_t sub_1B777873C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _BOOL4 v25;
  int v28;

  v14 = (a6 + v10);
  v15 = v14 + (v11 ^ 0x2F6u) + (unint64_t)(v11 ^ 0x599u) + v12 - 2190;
  v16 = ((_BYTE)a6 + (_BYTE)v10) & 0xF;
  v17 = v16 - v14;
  v18 = v6 + v17;
  ++v16;
  v19 = v6 + v16;
  v20 = v8 + v17;
  v21 = v8 + v16;
  v22 = v7 + v17;
  v23 = v7 + v16;
  v25 = v19 > v12 && v18 < v15;
  if (v21 > v12 && v20 < v15)
    v25 = 1;
  v28 = v23 > v12 && v22 < v15 || v25;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 + 8 * ((109 * (v28 ^ 1)) ^ v11)) - 4))(a1, a2, v9);
}

uint64_t sub_1B77787C8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (a4 ^ (409 * (v4 < 0x10)))) - ((a4 - 234) ^ 0x1B0u) + 522))();
}

uint64_t sub_1B77787FC(int a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16x4_t v18;
  int8x16x4_t v19;

  v18.val[1].i64[0] = ((_BYTE)v7 + 9) & 0xF;
  v18.val[1].i64[1] = ((_BYTE)v7 + 8) & 0xF;
  v18.val[2].i64[0] = ((_BYTE)v7 + 7) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)v7 + 6) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v7 + 5) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v7 + 4) & 0xF;
  v19.val[0].i64[0] = ((_BYTE)v7 + 3) & 0xF;
  v19.val[0].i64[1] = ((_BYTE)v7 + 2) & 0xF;
  v19.val[1].i64[0] = ((_BYTE)v7 + 1) & 0xF;
  v19.val[1].i64[1] = v7 & 0xF;
  v11 = a2 + a1 + v8;
  v19.val[2].i64[0] = ((_BYTE)v7 - 1) & 0xF;
  v19.val[2].i64[1] = (v7 + 14) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v7 + 13) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v7 + 12) & 0xF;
  v12.i64[0] = 0x505050505050505;
  v12.i64[1] = 0x505050505050505;
  v13.i64[0] = 0x6363636363636363;
  v13.i64[1] = 0x6363636363636363;
  v18.val[0].i64[0] = v11 & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v7 + 10) & 0xF;
  v14.i64[0] = vqtbl4q_s8(v18, (int8x16_t)xmmword_1B77959A0).u64[0];
  v14.i64[1] = vqtbl4q_s8(v19, (int8x16_t)xmmword_1B77959A0).u64[0];
  v15 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v9 - 15 + v11), *(int8x16_t *)(v4 + v18.val[0].i64[0] - 15)), veorq_s8(*(int8x16_t *)(v6 + v18.val[0].i64[0] - 15), *(int8x16_t *)(v5 + v18.val[0].i64[0] - 15))));
  v16 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v15, v15, 8uLL), v13), vmulq_s8(v14, v12)));
  *(int8x16_t *)(v9 - 15 + v11) = vextq_s8(v16, v16, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((((v3 & 0xFFFFFFF0) == 16) * ((a3 ^ 0x6A5) + 424)) ^ a3)) - 12))();
}

void sub_1B7778958()
{
  JUMPOUT(0x1B77788D4);
}

uint64_t sub_1B7778964@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  uint64_t v51;
  unsigned __int8 *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  unint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  unsigned int v70;
  int v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  unsigned int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  unsigned int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  unsigned int v118;
  int v119;
  int v120;
  int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  int v125;
  int v126;
  uint64_t v127;
  unsigned int v128;
  char *v129;
  char *v130;
  char *v131;
  int v132;
  unsigned int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  int v141;
  int v142;
  int v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  int v149;
  int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  int v154;
  unsigned int v155;
  int v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  int v160;
  int v161;
  int v162;
  unsigned int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  unsigned int v178;
  unsigned int v179;
  int v180;
  int v181;
  char *v182;
  char *v183;
  char *v184;
  char *v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  int v189;
  int v190;
  unsigned __int8 *v191;
  int v192;
  int v193;
  unsigned __int8 v194;
  uint64_t v195;
  int v196;
  uint64_t v197;
  int v198;
  int v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  int v203;
  int v204;
  int v205;
  unsigned int v206;
  int v207;
  int v208;
  int v209;
  uint64_t v210;
  unsigned int v211;
  char *v212;
  char *v213;
  unsigned int v214;
  unsigned int v215;
  char *v216;
  int v217;
  int v218;
  unint64_t v219;
  char *v220;
  int v221;
  int v222;
  int v223;
  int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  unsigned int v238;
  unsigned int v239;
  unsigned int v240;
  unsigned int v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  int v245;
  int v246;
  unsigned int v247;
  unsigned int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  unsigned int v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  unsigned int v264;
  int v265;
  unsigned int v266;
  unsigned int v267;
  int v268;
  int v269;
  unsigned int v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  int v275;
  unsigned int v276;
  unsigned int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  int v282;
  int v283;
  unsigned int v284;
  unsigned int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  unsigned int v289;
  unsigned int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  unsigned int v295;
  int v296;
  unsigned int v297;
  unsigned int v298;
  int v299;
  int v300;
  unsigned int v301;
  unsigned int v302;
  unsigned int v303;
  int v304;
  int v305;
  unsigned int v306;
  unsigned int v307;
  int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  char *v320;
  char *v321;
  unsigned int v322;
  char *v323;
  unsigned int v324;
  int v325;
  int v326;
  int v327;
  char *v328;
  unsigned int v329;
  int v330;
  int v331;
  uint64_t v332;
  int v333;
  char *v334;
  char *v335;
  char *v336;
  uint64_t v337;
  uint64_t v338;
  char *v339;
  uint64_t v340;
  uint64_t v342;
  uint64_t v343;
  unsigned int v344;
  uint64_t v345;
  int v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  unsigned int v350;
  unsigned int v351;
  uint64_t v352;
  unsigned int v353;
  unsigned int v354;
  uint64_t v355;
  unsigned int v356;
  unsigned int v357;
  uint64_t v358;
  int v359;
  uint64_t v360;
  int v361;
  int v362;
  uint64_t v363;
  __int16 v364;
  unsigned int v365;
  unsigned int v366;
  int v367;
  int v368;
  uint64_t v369;
  unsigned int v370;
  int v371;
  unsigned int v372;
  int v373;
  uint64_t v374;
  int v375;
  unsigned int v376;
  int v377;
  uint64_t v378;
  unsigned __int8 v379;
  int v380;
  int v381;
  int v382;
  uint64_t v383;
  int v384;
  unsigned int v385;
  unsigned int v386;
  int v387;
  uint64_t v388;
  int v389;
  unsigned int v390;
  unsigned int v391;
  __int16 v392;
  unsigned int v393;
  int v394;
  uint64_t v395;
  int v396;
  int v397;
  unsigned __int8 v398;
  unsigned int v399;
  unsigned int v400;
  uint64_t v401;
  int v402;
  int v403;
  int v404;
  int v405;
  int v406;
  uint64_t v407;
  unsigned int v408;
  unsigned int v409;
  unsigned int v410;
  unsigned int v411;
  int v412;
  uint64_t v413;
  unsigned int v414;
  int v415;
  int v416;
  int v417;
  uint64_t v418;
  int v419;
  int v420;
  int v421;
  int v422;
  uint64_t v423;
  int v424;
  int v425;
  int v426;
  int v427;
  int v428;
  uint64_t v429;
  int v430;
  int v431;
  int v432;
  unsigned int v433;
  unsigned int v434;
  uint64_t v435;
  int v436;
  int v437;
  unsigned int v438;
  int v439;
  uint64_t v440;
  unsigned int v441;
  int v442;
  int v443;
  int v444;
  unsigned int v445;
  int v446;
  uint64_t v447;
  int v448;
  int v449;
  int v450;
  int v451;
  uint64_t v452;
  int v453;
  int v454;
  unsigned int v455;
  int v456;
  uint64_t v457;
  int v458;
  unsigned int v459;
  int v460;
  int v461;
  uint64_t v462;
  unsigned int v463;
  int v464;
  int v465;
  int v466;
  uint64_t v467;
  int v468;
  int v469;
  unsigned int v470;
  uint64_t v471;
  int v472;
  unsigned int v473;
  unsigned int v474;
  int v475;
  uint64_t v476;
  int v477;
  unsigned __int8 v478;
  int v479;
  unsigned int v480;
  uint64_t v481;
  int v482;
  unsigned int v483;
  unsigned int v484;
  char *v485;
  int v486;
  unsigned int v487;
  char *v488;
  int v489;
  char *v490;
  int v491;
  unsigned int v492;
  char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  unsigned int v498;
  int v499;
  int v500;
  int v501;
  int v502;
  int v503;
  unsigned int v504;
  int v505;
  unsigned int v506;
  int v507;
  int v508;
  int v509;
  int v510;
  unsigned int v511;
  int v512;
  unsigned int v513;
  int v514;
  unsigned int v515;
  int v516;
  int v517;
  int v518;

  v56 = v53 - 982575299;
  v57 = v53;
  v58 = *(_QWORD *)(v54 + 8 * (v53 ^ 0xD));
  v59 = *(unsigned __int8 *)(v58 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD317) ^ 0xD7));
  *(_DWORD *)(v55 - 128) = v56 & 0x3A90EBFF;
  v60 = *v52 ^ 0xB1;
  v61 = *(_QWORD *)(v54 + 8 * (v57 - 143)) - 8;
  v62 = (v59 ^ 0x65) << 8;
  LODWORD(v60) = *(unsigned __int8 *)(v61 + v60) ^ 0x4B;
  v63 = *(_QWORD *)(v54 + 8 * (v57 + 34)) - 8;
  v64 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30CLL) ^ 0x49));
  *(_DWORD *)(v55 - 216) = a1;
  v65 = v62 | ((_DWORD)v60 << 24);
  HIDWORD(v66) = v64;
  LODWORD(v66) = (v64 ^ (v57 - 982575418)) << 24;
  LOBYTE(v62) = v66 >> 26;
  v67 = *(_QWORD *)(v54 + 8 * (v57 ^ 0x84)) - 8;
  v68 = *(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30DLL) ^ 0xB8));
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD310) ^ 0x6BLL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0x88888888) << 24;
  v69 = ((v66 >> 26) ^ 0x53) << 16;
  LOBYTE(v60) = *(_BYTE *)(v58 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30BLL) ^ 0x2ELL));
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD318) ^ 0x47));
  LODWORD(v66) = (HIDWORD(v66) ^ 0x88888888) << 24;
  v70 = v65 & 0xFF00FF00 | (*(_BYTE *)(v67 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD316) ^ 0xECLL))
                                           + 74) ^ 9 | (((v66 >> 26) ^ 0x1E) << 16);
  v71 = v69 | ((*(unsigned __int8 *)(v58 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30FLL) ^ 0x77)) ^ 0xAA) << 8);
  v72 = (*(_BYTE *)(v67 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD312) ^ 0xA9)) + 74) | ((*(unsigned __int8 *)(v58 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD313) ^ 0x30)) ^ 0x50) << 8);
  v73 = ((v62 ^ 0xFB) << 16) | ((v68 ^ 0xFFFFFFF3) << 24) | ((v60 ^ 0xA0) << 8);
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD314) ^ 0xCBLL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0x88888888) << 24;
  LOBYTE(v63) = *(_BYTE *)(v67 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30ALL) ^ 0x36));
  LOBYTE(v58) = *(_BYTE *)(v67 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD30ELL) ^ 0xB5));
  v74 = v72 & 0xFF00FFFF | (((v66 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v61
                                                                                                + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD315) ^ 0x35)) ^ 0x84) << 24);
  v75 = v71 | ((*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v51 - 0x3AC75C5FABFFD311) ^ 0xBFLL)) ^ 0x9D) << 24);
  v76 = *(_QWORD *)(v54 + 8 * (v57 ^ 0xCF)) - 8;
  v77 = *(_QWORD *)(v54 + 8 * (v57 + 33)) - 8;
  v78 = *(_DWORD *)(v76 + 4 * ((v63 + 74) ^ 0xFDu)) ^ 0x3104536C ^ *(_DWORD *)(v77
                                                                                                + 4
                                                                                                * (v62 ^ 0x61u));
  *(_DWORD *)(v55 - 148) = v57;
  v79 = *(_QWORD *)(v54 + 8 * (v57 ^ 0xE9)) - 4;
  v80 = (v78 - ((2 * v78) & 0x3014AEB6) + 403330907) ^ *(_DWORD *)(v79 + 4 * (v68 ^ 0x66u));
  v81 = *(_QWORD *)(v54 + 8 * (v57 ^ 0xAD));
  LODWORD(v497) = v70;
  v82 = *(_DWORD *)(v81 + 4 * (v60 ^ 0x98u)) ^ v70 ^ (v80 - ((2 * v80) & 0x39BDC8FE) + 484369535);
  HIDWORD(v496) = v73 & 0xFFFFFF00 | (v63 + 74) ^ 0x2A;
  LOBYTE(v58) = (v58 + 74) ^ 0xA8;
  v83 = v75 & 0xFFFFFF00 | v58;
  LODWORD(v496) = v74;
  v84 = v82 ^ v74;
  v85 = v82;
  v384 = v82;
  v86 = v82 ^ v74 ^ 0x4D;
  *(_DWORD *)(v55 - 192) = v84;
  *(_DWORD *)(v55 - 136) = v86 ^ v83;
  LODWORD(v60) = v86 ^ v83 ^ (HIDWORD(v496)
                            - 2 * (HIDWORD(v496) & 0x6AA69FA ^ ((v63 + 74) ^ 0x2A) & 0x18)
                            + 111831522);
  v419 = BYTE1(v60);
  v402 = BYTE2(v60);
  LODWORD(v63) = *(_DWORD *)(v81 + 4 * (BYTE1(v60) ^ 0x93u)) ^ *(_DWORD *)(v77 + 4 * (BYTE2(v60) ^ 0x14u)) ^ 0x775262B4;
  v87 = v60 ^ 0xBC5D444B;
  v416 = v60;
  LODWORD(v60) = (v63 - ((2 * v63) & 0xB511AB4E) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v60 ^ 0xCBu));
  v414 = HIBYTE(v87);
  v88 = v85 ^ *(_DWORD *)(v79 + 4 * (HIBYTE(v87) ^ 0x65)) ^ (v60 - ((2 * v60) & 0x3014AEB6) + 403330907);
  v379 = v86;
  LODWORD(v60) = (v84 ^ 0xBAF72DE4) - 2 * (v86 & 4 ^ (v84 ^ 0xBAF72DE4) & 0x1966918F);
  HIDWORD(v495) = v83;
  *(_DWORD *)(v55 - 184) = v88;
  v89 = v88 ^ 0x1966918B ^ (v83 - 2 * (v83 & 0x1966918F ^ v58 & 4) + 426152331);
  v90 = v89 ^ v87;
  *(_DWORD *)(v55 - 160) = v89;
  v426 = BYTE2(v90);
  v430 = BYTE1(v90);
  v91 = *(_DWORD *)(v77 + 4 * (BYTE2(v90) ^ 0x2Eu)) ^ *(_DWORD *)(v81 + 4 * (BYTE1(v90) ^ 0x9Bu)) ^ 0x775262B4;
  v509 = v90;
  v92 = (v91 - ((2 * v91) & 0xB511AB4E) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v90 ^ 0xD2u));
  v93 = v90 ^ 0xAF1D7097;
  *(_DWORD *)(v55 - 224) = HIBYTE(v90);
  v94 = (v92 - ((2 * v92) & 0x3014AEB6) + 403330907) ^ *(_DWORD *)(v79 + 4 * (HIBYTE(v90) ^ 0x69));
  v95 = v94 ^ v86 ^ 0xEF1EA259;
  *(_DWORD *)(v55 - 176) = v94 ^ v86;
  v465 = v95 ^ v89;
  v96 = ((v465 ^ 0x7598AFB3) - ((2 * (v465 ^ 0x7598AFB3)) & 0xB775A3BC) - 608513570) ^ v93;
  v97 = v96 ^ 0x9547167F;
  v472 = ((v96 ^ 0x9547167F) >> 16);
  v486 = ((unsigned __int16)(v96 ^ 0x167F) >> 8);
  v98 = *(_DWORD *)(v77 + 4 * (v472 ^ 0x89u)) ^ *(_DWORD *)(v81 + 4 * (v486 ^ 0x3Au)) ^ 0x775262B4;
  v482 = (((v95 ^ v89 ^ 0xB3) - ((2 * (v95 ^ v89 ^ 0xB3)) & 0xBC) - 34) ^ v93);
  v99 = (v98 - ((2 * v98) & 0xB511AB4E) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v482 ^ 0xE4u));
  HIDWORD(v497) = HIBYTE(v97);
  v100 = (v99 - ((2 * v99) & 0x3014AEB6) + 403330907) ^ *(_DWORD *)(v79 + 4 * (HIBYTE(v97) ^ 0x1D));
  v441 = v94 ^ v88;
  v504 = (v100 - ((2 * v100) & 0xBD3617C4) + 1587219426) ^ v94 ^ v88;
  *(_DWORD *)(v55 - 256) = v504 ^ 0x5E9B0BE2;
  v511 = v504 ^ 0x5E9B0BE2 ^ v94 ^ v86;
  v101 = ((v511 ^ 0xFE25CD6D) - ((2 * (v511 ^ 0xFE25CD6D)) & 0xB775A3BC) - 608513570) ^ v93;
  *(_DWORD *)(v55 - 232) = BYTE1(v101);
  v102 = *(_DWORD *)(v81 + 4 * (BYTE1(v101) ^ 0x6Fu));
  *(_DWORD *)(v55 - 240) = BYTE2(v101);
  v103 = *(_DWORD *)(v77 + 4 * (BYTE2(v101) ^ 0xA8u));
  *(_DWORD *)(v55 - 140) = v88 ^ 0x1966918B ^ (v60 + 426152331);
  v515 = HIBYTE(v101);
  LODWORD(v58) = ((v102 ^ v103 ^ 0x775262B4) - ((2 * (v102 ^ v103 ^ 0x775262B4)) & 0x3014AEB6) + 403330907) ^ *(_DWORD *)(v79 + 4 * (HIBYTE(v101) ^ 0x85));
  v499 = (((v511 ^ 0x6D) - ((2 * (v511 ^ 0x6D)) & 0xBC) - 34) ^ v93);
  LODWORD(v58) = (v58 - ((2 * v58) & 0xB511AB4E) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v499 ^ 0x25u));
  v502 = v511 ^ v95 ^ v89;
  v366 = (v58 - ((2 * v58) & 0xABD31FE0) + 1441370096) ^ v95 ^ v502;
  v104 = (v58 - ((2 * v58) & 0xABD31FE0) + 1441370096) ^ v95;
  v372 = v104;
  v105 = v101 ^ v366 ^ 0x8F074D64;
  v364 = (v58 - ((2 * v58) & 0x1FE0) - 28688) ^ v95 ^ v502 ^ 0x4D64;
  v513 = v101;
  v399 = (v105 ^ 0xEDEB55D4) >> 24;
  v389 = ((v105 ^ 0xEDEB55D4) >> 16);
  v106 = *(_DWORD *)(v79 + 4 * (v399 ^ 0x1D)) ^ *(_DWORD *)(v77 + 4 * (v389 ^ 0x89u)) ^ 0x7386D190;
  v517 = ((unsigned __int16)(v105 ^ 0x55D4) >> 8);
  LODWORD(v60) = (v106 - ((2 * v106) & 0x39BDC8FE) + 484369535) ^ *(_DWORD *)(v81 + 4 * (v517 ^ 0x3Au));
  v491 = (v101 ^ v366 ^ 0x64);
  v107 = *(_DWORD *)(v76 + 4 * (v491 ^ 0x4Fu));
  *(_DWORD *)(v55 - 200) = v504 ^ 0x5E9B0BE2 ^ v58;
  v108 = v504 ^ 0x5E9B0BE2 ^ v58 ^ v107 ^ (v60 - ((2 * v60) & 0xB511AB4E) + 1518917031);
  v398 = BYTE2(v104) ^ 0x16;
  LODWORD(v60) = v108 ^ v104 ^ 0x7C166C11;
  v109 = v108;
  v468 = v108;
  LODWORD(v58) = v60 ^ v101;
  v110 = v60;
  v111 = (v60 ^ v101) >> 24;
  *(_DWORD *)(v55 - 248) = v111;
  v479 = (v60 ^ v101);
  v112 = *(_DWORD *)(v79 + 4 * (v111 ^ 0x9B)) ^ *(_DWORD *)(v76 + 4 * (v479 ^ 0x31u)) ^ 0x428282FC;
  v455 = ((v60 ^ v101) >> 8) ^ 0x86839A;
  v458 = ((unsigned __int16)(v60 ^ v101) >> 8) ^ 0x9A;
  v113 = (v112 - ((2 * v112) & 0x39BDC8FE) + 484369535) ^ *(_DWORD *)(v81
                                                                    + 4
                                                                    * (((unsigned __int16)(v60 ^ v101) >> 8) ^ 0xA0u));
  LODWORD(v60) = v113 - ((2 * v113) & 0xD7190D96);
  v114 = v58 ^ 0xF65B2F79;
  v444 = BYTE2(v58);
  LODWORD(v58) = (v60 + 1804371659) ^ *(_DWORD *)(v77 + 4 * (BYTE2(v58) ^ 0xAu));
  v411 = (v58 - ((2 * v58) & 0x49A4302) - 2108874367) ^ v109;
  v404 = v411 ^ 0x7FCEBB2B ^ v110;
  v392 = (v58 - ((2 * v58) & 0x4302) + 8577) ^ v109 ^ 0xBB2B;
  v463 = v110 ^ v366 ^ 0x8F074D64;
  v432 = v110;
  LODWORD(v60) = ((v404 ^ 0x5A137D54) - ((2 * (v404 ^ 0x5A137D54)) & 0x96EA8CB2) - 881506727) ^ v463 ^ 0x7F972E9A;
  *(_DWORD *)(v55 - 144) = v60;
  v115 = v60 ^ 0x9D583E0D;
  LODWORD(v63) = ((v60 ^ 0x1AC7E60D) - 2 * ((v60 ^ 0x9D583E0D) & 0xC ^ (v60 ^ 0x1AC7E60D) & 0x70D8B5DF) + 1893250515) ^ v114 ^ 0x479AB031;
  v489 = (((v60 ^ 0xD) - 2 * ((v60 ^ 0xD) & 0xC ^ (v60 ^ 0xD) & 0xDF) - 45) ^ v114);
  v507 = ((unsigned __int16)(((v60 ^ 0xE60D)
                                             - 2 * ((v60 ^ 0x3E0D) & 0xC ^ (v60 ^ 0xE60D) & 0xB5DF)
                                             - 18989) ^ v114 ^ 0xB031) >> 8);
  LODWORD(v58) = *(_DWORD *)(v81 + 4 * (v507 ^ 0x3Au)) ^ *(_DWORD *)(v76 + 4 * (v489 ^ 0xAAu)) ^ 0x465631D8;
  v116 = BYTE2(v63);
  v117 = (v58 - ((2 * v58) & 0xD7190D96) + 1804371659) ^ *(_DWORD *)(v77 + 4 * (BYTE2(v63) ^ 0x89u));
  v408 = BYTE3(v63);
  LODWORD(v63) = (v117 + 403330907 + (~(2 * v117) | 0xCFEB5149) + 1) ^ *(_DWORD *)(v79 + 4 * (BYTE3(v63) ^ 0x1D));
  v118 = v63 ^ v110;
  LODWORD(v67) = ((v63 ^ v110 ^ 0xA6C48CD5) - ((2 * (v63 ^ v110 ^ 0xA6C48CD5)) & 0xE1B16BA6) + 1893250515) ^ v114;
  LODWORD(v60) = BYTE3(v67);
  v119 = ((unsigned __int16)(((v63 ^ v110 ^ 0x8CD5) - ((2 * (v63 ^ v110 ^ 0x8CD5)) & 0x6BA6) - 18989) ^ v114) >> 8);
  v120 = *(_DWORD *)(v81 + 4 * (BYTE1(v67) ^ 0x6Fu)) ^ *(_DWORD *)(v79 + 4 * (BYTE3(v67) ^ 5));
  v460 = v67;
  v121 = ((v120 ^ 0x4D4B324) - 2 * ((v120 ^ 0x4D4B324) & 0x5A88D5BF ^ v120 & 0x18) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v67 ^ 0x25u));
  v122 = v121 - ((2 * v121) & 0xD7190D96);
  v123 = v411 ^ 0x7FCEBB2B ^ v63;
  v124 = WORD1(v67) ^ 0x1821;
  v125 = BYTE2(v67) ^ 0x21;
  LODWORD(v63) = v123 ^ *(_DWORD *)(v77 + 4 * (BYTE2(v67) ^ 0xA8u)) ^ (v122 + 1804371659);
  LODWORD(v67) = v115 ^ v63 ^ v67;
  *(_DWORD *)(v55 - 168) = v115 ^ v63;
  LODWORD(v79) = *(_DWORD *)(v81 + 4 * (BYTE1(v67) ^ 0x44u)) ^ *(_DWORD *)(v79 + 4 * (BYTE3(v67) ^ 0x47)) ^ 0x4D4B324;
  LODWORD(v76) = (v79 - ((2 * v79) & 0xB511AB4E) + 1518917031) ^ *(_DWORD *)(v76 + 4 * (v67 ^ 0xD5u));
  v126 = (v76 - ((2 * v76) & 0xD7190D96) + 1804371659) ^ *(_DWORD *)(v77 + 4 * (BYTE2(v67) ^ 0xCBu));
  v354 = v63;
  LODWORD(v495) = v63 ^ 0xD2C7168F ^ (v126 - ((2 * v126) & 0xA460764C) + 1378892582);
  v362 = v63 ^ v118;
  HIDWORD(v494) = v63 ^ v118 ^ 0x7E07F83C ^ (v495 - ((2 * v495) & 0xB54A6E50) + 1520777000);
  LODWORD(v494) = v115 ^ v63 ^ 0x4018996 ^ HIDWORD(v494);
  HIDWORD(a44) = (v494 - ((2 * v494) & 0xB8939F68) + 1548341172) ^ v67;
  *(_DWORD *)(v55 - 208) = 160202755;
  LODWORD(v63) = *(_DWORD *)(v55 - 148);
  v127 = (uint64_t)*(&off_1E6CBBAA0 + (int)v63 - 179);
  v128 = (((v123 ^ 0x1B9155BDu) >> 16)
        + 966602595
        + ((2
          * ((((v123 ^ 0x1B9155BDu) >> 16) + 44) & 0x137 ^ (((v123 ^ 0x1B9155BDu) >> 16) | 0x7FFFFFFE))) ^ 0x98C8003)) ^ *(_DWORD *)(v127 + 4 * (((v123 ^ 0x1B9155BDu) >> 16) ^ 0x2Du));
  LODWORD(v79) = ((v125 ^ 0xA8) + 966602595 + ((2 * (((v125 ^ 0xA8) + 44) & 0x137 ^ (v124 | 0x7FFFFFFE))) ^ 0x98C8003)) ^ *(_DWORD *)(v127 + 4 * (v125 ^ 0x85u));
  v129 = (char *)*(&off_1E6CBBAA0 + (int)(v63 ^ 0xBA)) - 12;
  LODWORD(v77) = (v128 - ((2 * v128) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (BYTE1(v123) ^ 0x47)];
  v130 = (char *)*(&off_1E6CBBAA0 + (int)(v63 ^ 0x11)) - 12;
  LODWORD(v76) = (v79 - ((2 * v79) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * (v60 ^ 0xCC)];
  v478 = BYTE1(v115) ^ BYTE1(v118);
  v131 = (char *)*(&off_1E6CBBAA0 + (int)v63 - 58) - 12;
  LODWORD(v79) = *(_DWORD *)&v131[4 * ((v115 ^ v118) ^ 0x53)];
  LODWORD(v58) = *(_DWORD *)(v127 + 4 * (((v115 ^ v118) >> 16) ^ 0xAAu)) ^ *(_DWORD *)&v130[4 * (((v115 ^ v118) >> 24) ^ 0x3E)] ^ ((((v115 ^ v118) >> 16) ^ 0x87) + 966602594 - ((2 * (((v115 ^ v118) >> 16) ^ 0x87) + 160207960) & 0x98C826C)) ^ (181304767 * v79 - ((362609534 * v79 - 161680388) & 0xE8F835E6) - 274033423);
  v132 = *(_DWORD *)&v131[4 * (v118 ^ 0x74)];
  v133 = (181304767 * v132 - ((362609534 * v132 - 161680388) & 0xEE36A25E) + 1917438765) ^ *(_DWORD *)&v129[4 * (BYTE1(v118) ^ 0x5A)];
  v484 = v133 - ((2 * v133) & 0xE8F835E6);
  v474 = HIBYTE(v118) ^ 0xB2;
  v436 = BYTE2(v118);
  v470 = (BYTE2(v118) ^ 0x4C) + 966602595 + ((2 * (BYTE2(v118) ^ 0x4C) + 88) & 0x26C ^ 0xF6737FFF);
  v438 = v119 ^ 0xB0;
  v453 = v76 - ((2 * v76) & 0xEE36A25E);
  v448 = v58 - ((2 * v58) & 0xEE36A25E);
  v498 = (v77 - ((2 * v77) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * ((v123 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)&v131[4 * (v123 ^ 0x7D)] + 2066643454);
  LODWORD(v76) = *(_DWORD *)(v55 - 140) ^ 0xE9B45E6C;
  v134 = *(_DWORD *)(v127 + 4 * (BYTE2(v76) ^ 0xF5u)) ^ ((BYTE2(v76) ^ 0xD8)
                                                         + 966602595
                                                         + ((2 * (BYTE2(v76) ^ 0xD8) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v58) = *(_DWORD *)(v55 - 160) ^ 0x31676F78;
  LODWORD(v60) = *(_DWORD *)(v127 + 4 * (BYTE2(v58) ^ 0x7Bu)) ^ ((BYTE2(v58) ^ 0x56)
                                                                 + 966602594
                                                                 - ((2 * (BYTE2(v58) ^ 0x56) + 160207960) & 0x98C826C));
  LODWORD(v58) = (v60 - ((2 * v60) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * BYTE3(v58)];
  LODWORD(v60) = *(_DWORD *)(v127 + 4 * (v426 ^ 0x34u)) ^ ((v426 ^ 0x19)
                                                           + 966602595
                                                           + ((2 * (v426 ^ 0x19) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v60) = (v60 - ((2 * v60) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (v430 ^ 5)];
  v427 = v58 - ((2 * v58) & 0xEE36A25E);
  v431 = v60 - ((2 * v60) & 0xE8F835E6);
  LODWORD(v58) = *(_DWORD *)&v131[4 * (*(_DWORD *)(v55 - 184) ^ 0xDF)];
  LODWORD(v60) = *(_DWORD *)(v55 - 184) ^ 0x5A18571F;
  LODWORD(v58) = *(_DWORD *)&v130[4 * BYTE3(v60)] ^ ((BYTE2(v60) ^ 0xC1)
                                                   + 966602595
                                                   + ((2 * (BYTE2(v60) ^ 0xC1) + 88) & 0x26C ^ 0xF6737FFF)) ^ *(_DWORD *)(v127 + 4 * (BYTE2(v60) ^ 0xECu)) ^ (181304767 * v58 - ((362609534 * v58 - 161680388) & 0xE8F835E6) - 274033423);
  v424 = v58 - ((2 * v58) & 0xEE36A25E);
  LODWORD(v58) = *(_DWORD *)&v130[4 * BYTE3(v76)] ^ (v134 - ((2 * v134) & 0xE8F835E6) + 1954290419);
  v421 = v58 - ((2 * v58) & 0xEE36A25E);
  LOWORD(v125) = v404 ^ 0x8EA4;
  LODWORD(v60) = v404 ^ 0x35C48CD5;
  LODWORD(v58) = *(_DWORD *)(v127 + 4 * (v116 ^ 0xDEu)) ^ ((v116 ^ 0xF3)
                                                           + 966602594
                                                           - ((2 * (v116 ^ 0xF3) + 160207960) & 0x98C826C));
  v135 = *(_DWORD *)(v127 + 4 * (((v404 ^ 0x35C48CD5u) >> 16) ^ 0xFEu)) ^ ((((v404 ^ 0x35C48CD5u) >> 16) ^ 0xD3)
                                                                                            + 966602594
                                                                                            - ((2
                                                                                              * (((v404 ^ 0x35C48CD5u) >> 16) ^ 0xD3)
                                                                                              + 160207960) & 0x98C826C));
  v136 = *(_DWORD *)&v131[4 * (v115 ^ 0xC5)];
  LODWORD(v77) = (v58 - ((2 * v58) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * (v408 ^ 0x36)];
  LODWORD(v58) = *(_DWORD *)(v127 + 4 * (BYTE2(v411) ^ 0xE2u)) ^ ((BYTE2(v411) ^ 0xCF)
                                                                  + 966602595
                                                                  + ((2 * (BYTE2(v411) ^ 0xCF) + 88) & 0x26C ^ 0xF6737FFF));
  v137 = (v58 - ((2 * v58) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (HIBYTE(v392) ^ 0x8B)];
  v405 = v77 - ((2 * v77) & 0xEE36A25E);
  v409 = HIBYTE(v411) ^ 0x93;
  v412 = v137 - ((2 * v137) & 0xE8F835E6);
  LODWORD(v77) = *(_DWORD *)(v55 - 144) ^ 0xFFC7E60D;
  v138 = *(_DWORD *)&v129[4 * (BYTE1(v77) ^ 0x20)] ^ ((BYTE2(v77) ^ 0xD7)
                                                    + 966602595
                                                    + ((2 * (BYTE2(v77) ^ 0xD7) + 88) & 0x26C ^ 0xF6737FFF)) ^ *(_DWORD *)(v127 + 4 * (BYTE2(v77) ^ 0xFAu)) ^ (181304767 * v136 - ((362609534 * v136 - 161680388) & 0xEE36A25E) + 1917438765);
  v139 = (v135 - ((2 * v135) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * BYTE3(v60)] ^ (181304767
                                                                                             * *(_DWORD *)&v131[4 * (v125 ^ 0x99)]
                                                                                             + 2066643454);
  v357 = v392 ^ 0xA3;
  v386 = v139 - ((2 * v139) & 0xEE36A25E);
  v393 = v138 - ((2 * v138) & 0xE8F835E6);
  v140 = *(_DWORD *)(v55 - 136);
  v370 = BYTE1(v140) ^ 0xF5;
  v376 = v384 ^ 0x2BEAE26B;
  v141 = *(_DWORD *)(v127 + 4 * (((v384 ^ 0x2BEAE26Bu) >> 16) ^ 0xECu)) ^ ((((v384 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                            + 966602594
                                                                                            - ((2
                                                                                              * (((v384 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                              + 160207960) & 0x98C826C)) ^ (181304767 * *(_DWORD *)&v131[4 * (v384 ^ 0x1E)] + 2066643454);
  v142 = (v141 - 149204688 + (~(2 * v141) | 0x11C95DA1)) ^ *(_DWORD *)&v129[4 * (BYTE1(v384) ^ 8)];
  LODWORD(v60) = *(_DWORD *)(v127 + 4 * (v402 ^ 0x8Au)) ^ ((v402 ^ 0xA7)
                                                           + 966602595
                                                           + ((2 * (v402 ^ 0xA7) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v77) = *(_DWORD *)&v131[4 * (v379 ^ 0x55)];
  v385 = v142 - ((2 * v142) & 0xE8F835E6);
  v359 = BYTE2(v140) ^ 0xF7;
  LODWORD(v76) = *(_DWORD *)(v55 - 208);
  v403 = (BYTE2(v140) ^ 0xA7)
       + 966602595
       + (v76 ^ (2 * (((BYTE2(v140) ^ 0xA7) + 44) & 0x137 ^ (HIWORD(v140) ^ 0xBAF7 | 0x7FFFFFFE))));
  v143 = (v60 - ((2 * v60) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (v419 ^ 0xF9)] ^ (181304767
                                                                                             * *(_DWORD *)&v131[4 * (v416 ^ 0xB8)]
                                                                                             + 2066643454);
  v144 = *(_DWORD *)(v55 - 192);
  v420 = v143 - ((2 * v143) & 0xE8F835E6);
  v145 = (181304767 * v77 - ((362609534 * v77 - 161680388) & 0xE8F835E6) - 274033423) ^ ((BYTE2(v144) ^ 0xBA)
                                                                                       + 966602594
                                                                                       - ((2 * (BYTE2(v144) ^ 0xBA)
                                                                                         + 160207960) & 0x98C826C)) ^ *(_DWORD *)&v130[4 * (HIBYTE(v144) ^ 0x2F)] ^ *(_DWORD *)(v127 + 4 * (BYTE2(v144) ^ 0x97u));
  v380 = v145 - ((2 * v145) & 0xEE36A25E);
  v146 = *(_DWORD *)(v127 + 4 * (BYTE2(v366) ^ 0x1Bu)) ^ ((BYTE2(v366) ^ 0x36)
                                                          + 966602595
                                                          + (v76 ^ (2
                                                                  * (((BYTE2(v366) ^ 0x36) + 44) & 0x137 ^ (HIWORD(v366) | 0x7FFFFFFE)))));
  LODWORD(v60) = *(_DWORD *)(v127 + 4 * (BYTE2(*(_DWORD *)(v55 - 200)) ^ 0x56u)) ^ ((BYTE2(*(_DWORD *)(v55 - 200)) ^ 0x7B)
                                                                                    + 966602595
                                                                                    + ((2
                                                                                      * (BYTE2(*(_DWORD *)(v55 - 200)) ^ 0x7B)
                                                                                      + 88) & 0x26C ^ 0xF6737FFF));
  v147 = v60 - ((2 * v60) & 0xE8F835E6);
  v148 = (v146 - ((2 * v146) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (HIBYTE(v364) ^ 0x15)] ^ (181304767 * *(_DWORD *)&v131[4 * (v364 ^ 0xA7)] + 2066643454);
  LODWORD(v60) = *(_DWORD *)&v131[4 * (v372 ^ 0xFB)];
  LODWORD(v60) = (181304767 * v60 - ((362609534 * v60 - 161680388) & 0xEE36A25E) + 1917438765) ^ *(_DWORD *)&v129[4 * (BYTE1(v372) ^ 0xEF)];
  HIDWORD(v363) = v148 - ((2 * v148) & 0xE8F835E6);
  HIDWORD(v358) = v60 - ((2 * v60) & 0xE8F835E6);
  v149 = (v147 + 1954290419) ^ *(_DWORD *)&v130[4 * (HIBYTE(*(_DWORD *)(v55 - 200)) ^ 0xD9)] ^ (181304767
                                                                                              * *(_DWORD *)&v131[4 * (*(_DWORD *)(v55 - 200) ^ 0x79)]
                                                                                              + 2066643454);
  v150 = *(_DWORD *)(v127 + 4 * (v389 ^ 0x86u)) ^ ((v389 ^ 0xAB)
                                                   + 966602595
                                                   + (v76 ^ (2
                                                           * (((v389 ^ 0xAB) + 44) & 0x137 ^ (v389 ^ 0xAB | 0x7FFFFFFE)))));
  v151 = (v150 - ((2 * v150) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * v399];
  v390 = v151 - ((2 * v151) & 0xEE36A25E);
  v356 = v149 - ((2 * v149) & 0xEE36A25E);
  v396 = v398;
  v417 = (v396 ^ 0x65) + 966602595 + (v76 ^ (2 * (((v396 ^ 0x65) + 44) & 0x137 ^ (v396 ^ 0x65 | 0x7FFFFFFE))));
  LODWORD(v58) = *(_DWORD *)(v127 + 4 * (BYTE2(v67) ^ 0x8Bu)) ^ ((BYTE2(v67) ^ 0xA6)
                                                                 + 966602594
                                                                 - ((2 * (BYTE2(v67) ^ 0xA6) + 160207960) & 0x98C826C));
  v361 = BYTE2(*(_DWORD *)(v55 - 168));
  v400 = (v361 ^ 0x8F) + 966602595 + ((2 * (v361 ^ 0x8F) + 88) & 0x26C ^ 0xF6737FFF);
  LODWORD(v81) = *(_DWORD *)(v127 + 4 * (BYTE2(v354) ^ 0xE8u)) ^ ((BYTE2(v354) ^ 0xC5)
                                                                  + 966602595
                                                                  + ((2 * (BYTE2(v354) ^ 0xC5) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v81) = (181304767 * *(_DWORD *)&v131[4 * (v354 ^ 0xCA)] + 2066643454) ^ *(_DWORD *)&v130[4 * (HIBYTE(v354) ^ 0x8E)] ^ (v81 - ((2 * v81) & 0xE8F835E6) + 1954290419);
  v365 = v362 ^ 0x44039AAA;
  v152 = (181304767 * *(_DWORD *)&v131[4 * (v362 ^ 0xDB)] + 2066643454) ^ (((v362 ^ 0x44039AAAu) >> 16)
                                                                                          + 966602594
                                                                                          - ((2
                                                                                            * ((v362 ^ 0x44039AAAu) >> 16)
                                                                                            + 160207960) & 0x98C826C)) ^ *(_DWORD *)(v127 + 4 * (((v362 ^ 0x44039AAAu) >> 16) ^ 0x2Du));
  v353 = BYTE1(v354) ^ 0x16;
  LODWORD(v355) = v81 - ((2 * v81) & 0xEE36A25E);
  LODWORD(v63) = (v152 - ((2 * v152) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (BYTE1(v362) ^ 0xC0)];
  LODWORD(v58) = *(_DWORD *)&v130[4 * (BYTE3(v67) ^ 0x22)] ^ (181304767
                                                            * *(_DWORD *)&v131[4 * (v67 ^ 0xFE)]
                                                            + 2066643454) ^ (v58 - ((2 * v58) & 0xE8F835E6) + 1954290419);
  v375 = v63 - ((2 * v63) & 0xE8F835E6);
  LODWORD(v363) = v58 - ((2 * v58) & 0xEE36A25E);
  LODWORD(v58) = *(_DWORD *)&v131[4 * (v441 ^ 0xEC)];
  v153 = *(_DWORD *)(v127 + 4 * (v472 ^ 0x32u)) ^ ((v472 ^ 0x1F)
                                                   + 966602595
                                                   + ((2 * (v472 ^ 0x1F) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v63) = *(_DWORD *)&v131[4 * (*(_DWORD *)(v55 - 176) ^ 0xE6)];
  LODWORD(v58) = *(_DWORD *)&v130[4 * (HIBYTE(v441) ^ 0xCA)] ^ ((BYTE2(v441) ^ 0x2F)
                                                              + 966602595
                                                              + ((2 * (BYTE2(v441) ^ 0x2F) + 88) & 0x26C ^ 0xF6737FFF)) ^ *(_DWORD *)(v127 + 4 * (BYTE2(v441) ^ 2u)) ^ (181304767 * v58 - ((362609534 * v58 - 161680388) & 0xE8F835E6) - 274033423);
  v154 = (v153 - 149204688 + (~(2 * v153) | 0x11C95DA1)) ^ *(_DWORD *)&v129[4 * (v486 ^ 0x8C)] ^ (181304767
                                                                                                * *(_DWORD *)&v131[4 * (v482 ^ 0xD9)]
                                                                                                + 2066643454);
  LODWORD(v76) = *(_DWORD *)(v55 - 176) ^ 0x49A657C7;
  LODWORD(v76) = *(_DWORD *)&v130[4 * BYTE3(v76)] ^ ((BYTE2(v76) ^ 0x35)
                                                   + 966602594
                                                   - ((2 * (BYTE2(v76) ^ 0x35) + 160207960) & 0x98C826C)) ^ *(_DWORD *)(v127 + 4 * (BYTE2(v76) ^ 0x18u)) ^ (181304767 * v63 - ((362609534 * v63 - 161680388) & 0xE8F835E6) - 274033423);
  v487 = HIBYTE(v366) ^ 0x2D;
  v155 = *(_DWORD *)(v127 + 4 * (((v465 ^ 0x4B65B9CCu) >> 16) ^ 0x2Du)) ^ (((v465 ^ 0x4B65B9CCu) >> 16)
                                                                                            + 966602595
                                                                                            + ((2
                                                                                              * ((v465 ^ 0x4B65B9CCu) >> 16)
                                                                                              + 88) & 0x26C ^ 0xF6737FFF));
  v483 = HIDWORD(v497) ^ 0xAA;
  HIDWORD(v497) = (v58 - ((2 * v58) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (BYTE1(v441) ^ 0x2E)];
  v473 = v154 - ((2 * v154) & 0xE8F835E6);
  LODWORD(v58) = (v155 - ((2 * v155) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * ((v465 ^ 0x4B65B9CCu) >> 24)] ^ (181304767 * *(_DWORD *)&v131[4 * (v465 ^ 0x5C)] + 2066643454);
  v442 = v76 - ((2 * v76) & 0xEE36A25E);
  v367 = v58 - ((2 * v58) & 0xEE36A25E);
  v156 = *(_DWORD *)(v127 + 4 * (v444 ^ 0xC1u)) ^ ((v444 ^ 0xEC)
                                                   + 966602594
                                                   - ((2 * (v444 ^ 0xEC) + 160207960) & 0x98C826C));
  v157 = (v156 - ((2 * v156) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4
                                                                         * ((v458 - ((2 * v455) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v131[4 * (v479 ^ 0xE2)] + 2066643454);
  v351 = BYTE1(v468) ^ 0x77;
  LODWORD(v58) = *(_DWORD *)&v131[4 * (v463 ^ 0x9A)];
  LODWORD(v76) = (181304767 * v58 - ((362609534 * v58 - 161680388) & 0xE8F835E6) - 274033423) ^ *(_DWORD *)&v130[4 * (HIBYTE(v463) ^ 0xBE)];
  v350 = ((unsigned __int16)(v463 ^ 0x2E9A) >> 8) ^ 0xAC;
  v480 = v157 - ((2 * v157) & 0xE8F835E6);
  v450 = v76 - ((2 * v76) & 0xEE36A25E);
  v445 = v432 ^ 0xEEA2BFA8;
  LODWORD(v76) = *(_DWORD *)(v127 + 4 * (((v432 ^ 0xEEA2BFA8) >> 16) ^ 0x86u)) ^ ((((v432 ^ 0xEEA2BFA8) >> 16) ^ 0xAB) + 966602594 - ((2 * (((v432 ^ 0xEEA2BFA8) >> 16) ^ 0xAB) + 160207960) & 0x98C826C));
  v158 = (181304767 * *(_DWORD *)&v131[4 * (v432 ^ 0x68)] + 2066643454) ^ *(_DWORD *)&v129[4 * (BYTE1(v432) ^ 0x55)] ^ (v76 - ((2 * v76) & 0xEE36A25E) - 149204689);
  v433 = v468 ^ 0x231B9DB5;
  v346 = ((v468 ^ 0x231B9DB5u) >> 16);
  v459 = (v346 ^ 0xC1) + 966602595 + ((2 * (v346 ^ 0xC1) + 88) & 0x26C ^ 0xF6737FFF);
  LODWORD(v349) = v158 - ((2 * v158) & 0xE8F835E6);
  v344 = BYTE2(v463) ^ 0x82;
  v456 = (BYTE2(v463) ^ 0xAF) + 966602594 - ((2 * (BYTE2(v463) ^ 0xAF) + 160207960) & 0x98C826C);
  v159 = v504 ^ 0xCF39C4F6;
  LODWORD(v63) = *(_DWORD *)&v131[4 * (v499 ^ 0x74)];
  v160 = *(_DWORD *)(v55 - 160);
  v161 = *(_DWORD *)&v131[4 * v357];
  v162 = *(_DWORD *)&v131[4 * (v491 ^ 0xE9)];
  v492 = BYTE1(v465) ^ 0x39;
  v163 = *(_DWORD *)(v55 - 168);
  LODWORD(v58) = *(_DWORD *)&v131[4 * (v468 ^ 0x75)];
  v164 = *(_DWORD *)&v131[4 * (v504 ^ 0xCF)];
  v469 = 181304767 * *(_DWORD *)&v131[4 * (v460 ^ 0x60)] + 2066643454;
  v505 = 181304767 * *(_DWORD *)&v131[4 * (v509 ^ 0xFB)] + 2066643454;
  LODWORD(v358) = 181304767 * *(_DWORD *)&v131[4 * (v160 ^ 0xB8)] + 2066643454;
  v500 = 181304767 * *(_DWORD *)&v131[4 * (*(_DWORD *)(v55 - 140) ^ 0xAC)] + 2066643454;
  v464 = 181304767 * v161 + 2066643454;
  v466 = 181304767 * *(_DWORD *)&v131[4 * (v489 ^ 0xF0)] + 2066643454;
  v510 = 181304767 * *(_DWORD *)&v131[4 * (*(_DWORD *)(v55 - 136) ^ 0x57)] + 2066643454;
  HIDWORD(v348) = 181304767 * v162 + 2066643454;
  v461 = 181304767 * *(_DWORD *)&v131[4 * (v163 ^ 0x78)] + 2066643454;
  HIDWORD(v347) = 181304767 * v58 + 2066643454;
  LODWORD(v348) = 181304767 * v164 + 2066643454;
  v165 = (181304767 * v63 - ((362609534 * v63 - 161680388) & 0xE8F835E6) - 274033423) ^ *(_DWORD *)&v130[4 * (v515 ^ 0x7B)];
  LODWORD(v81) = v502;
  LODWORD(v58) = *(_DWORD *)(v127 + 4 * (BYTE2(v502) ^ 0x45u)) ^ ((BYTE2(v502) ^ 0x68)
                                                                  + 966602595
                                                                  + ((2 * (BYTE2(v502) ^ 0x68) + 88) & 0x26C ^ 0xF6737FFF)) ^ (181304767 * *(_DWORD *)&v131[4 * (v502 ^ 0xF1)] + 2066643454);
  v166 = (v58 - ((2 * v58) & 0xEE36A25E) - 149204689) ^ *(_DWORD *)&v129[4 * (BYTE1(v502) ^ 0xB)];
  LODWORD(v63) = *(_DWORD *)(v127 + 4 * (BYTE2(v159) ^ 0x3Cu)) ^ ((BYTE2(v159) ^ 0x11)
                                                                  + 966602595
                                                                  + ((2 * (BYTE2(v159) ^ 0x11) + 88) & 0x26C ^ 0xF6737FFF));
  LODWORD(v76) = (181304767 * *(_DWORD *)&v131[4 * (v511 ^ 0x2A)] + 2066643454) ^ ((BYTE2(v511) ^ 0x37)
                                                                                                  + 966602595
                                                                                                  + ((2 * (BYTE2(v511) ^ 0x37) + 88) & 0x26C ^ 0xF6737FFF)) ^ *(_DWORD *)(v127 + 4 * (BYTE2(v511) ^ 0x1Au));
  LODWORD(v79) = v165 - ((2 * v165) & 0xEE36A25E);
  v167 = (v76 - ((2 * v76) & 0xE8F835E6) + 1954290419) ^ *(_DWORD *)&v130[4 * (HIBYTE(v511) ^ 0xF9)];
  LODWORD(v347) = *(_DWORD *)(v127 + 4 * (v436 ^ 0x61u));
  v516 = *(_DWORD *)(v127 + 4 * (v359 ^ 0x7Du));
  v437 = *(_DWORD *)(v127 + 4 * (v396 ^ 0x48u));
  LODWORD(v76) = v507 ^ 0x1A;
  HIDWORD(v360) = *(_DWORD *)(v127 + 4 * (v361 ^ 0xA2u));
  v397 = *(_DWORD *)(v127 + 4 * (v346 ^ 0xECu));
  v508 = *(_DWORD *)(v127 + 4 * v344);
  v168 = *(_DWORD *)(v55 - 240);
  *(_DWORD *)(v55 - 240) = *(_DWORD *)(v127 + 4 * (v168 ^ 0x1Au));
  v169 = ((v513 >> 15) & 0x58 ^ 0x48) + (v168 ^ 0x4C64A1B);
  *(_DWORD *)(v55 - 208) = v169
                         + 886498615
                         + (*(_DWORD *)(v55 - 208) ^ (2 * (v169 & 0x137 ^ (v168 ^ 0x4C64A1B | 0x7FFFFFFE))));
  v439 = *(_DWORD *)&v129[4 * v438];
  LODWORD(v360) = *(_DWORD *)&v129[4 * (v478 ^ 0x8E)];
  *(_DWORD *)(v55 - 160) = *(_DWORD *)&v129[4 * (BYTE1(v160) ^ 0x85)];
  *(_DWORD *)(v55 - 184) = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 184)) ^ 0xBD)];
  v514 = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 140)) ^ 0xB4)];
  v503 = *(_DWORD *)&v129[4 * v76];
  v382 = *(_DWORD *)&v129[4 * (BYTE1(v125) ^ 0x14)];
  LODWORD(v76) = BYTE1(v511) ^ 0x2E;
  v512 = *(_DWORD *)&v129[4 * v370];
  *(_DWORD *)(v55 - 192) = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 192)) ^ 0xD6)];
  v518 = *(_DWORD *)&v129[4 * (v517 ^ 0xEE)];
  *(_DWORD *)(v55 - 200) = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 200)) ^ 0xD7)];
  v477 = *(_DWORD *)&v129[4 * (BYTE1(v163) ^ 0x76)];
  v170 = *(_DWORD *)&v129[4 * v353];
  HIDWORD(v343) = *(_DWORD *)&v129[4 * (BYTE1(v67) ^ 0xBE)];
  *(_DWORD *)(v55 - 168) = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 176)) ^ 0xB9)];
  *(_DWORD *)(v55 - 176) = *(_DWORD *)&v129[4 * v492];
  LODWORD(v345) = *(_DWORD *)&v129[4 * v351];
  HIDWORD(v345) = *(_DWORD *)&v129[4 * v350];
  *(_DWORD *)(v55 - 232) = *(_DWORD *)&v129[4 * (*(_DWORD *)(v55 - 232) ^ 0x84)];
  v501 = *(_DWORD *)&v129[4 * v76];
  LODWORD(v76) = *(_DWORD *)&v129[4 * (BYTE1(*(_DWORD *)(v55 - 256)) ^ 0xC8)];
  LODWORD(v343) = *(_DWORD *)&v130[4 * v474];
  v475 = v453 - 149204689;
  v454 = v448 - 149204689;
  *(_DWORD *)(v55 - 256) = *(_DWORD *)&v130[4 * (*(_DWORD *)(v55 - 224) ^ 7)];
  v371 = v427 - 149204689;
  LODWORD(v352) = v424 - 149204689;
  HIDWORD(v352) = v421 - 149204689;
  v449 = *(_DWORD *)&v130[4 * v409];
  LODWORD(v342) = v405 - 149204689;
  HIDWORD(a3) = v386 - 149204689;
  HIDWORD(v342) = *(_DWORD *)&v130[4 * (HIBYTE(*(_DWORD *)(v55 - 144)) ^ 0x88)];
  HIDWORD(v349) = *(_DWORD *)&v130[4 * (HIBYTE(*(_DWORD *)(v55 - 136)) ^ 0xB8)];
  v387 = *(_DWORD *)&v130[4 * HIBYTE(v376)];
  v377 = *(_DWORD *)&v130[4 * (v414 ^ 0x4B)];
  v406 = v380 - 149204689;
  v428 = *(_DWORD *)&v130[4 * v487];
  v381 = *(_DWORD *)&v130[4 * (HIBYTE(v372) ^ 0xE8)];
  v410 = v390 - 149204689;
  v391 = v356 - 149204689;
  v171 = *(_DWORD *)&v130[4 * (HIBYTE(v163) ^ 0xA6)];
  v172 = *(_DWORD *)&v130[4 * HIBYTE(v365)];
  v173 = v363 - 149204689;
  v425 = *(_DWORD *)&v130[4 * v483];
  v422 = v442 - 149204689;
  v415 = v367 - 149204689;
  HIDWORD(v355) = *(_DWORD *)&v130[4 * HIBYTE(v433)];
  v443 = *(_DWORD *)&v130[4 * (*(_DWORD *)(v55 - 248) ^ 0x38)];
  v451 = v450 - 149204689;
  v446 = *(_DWORD *)&v130[4 * HIBYTE(v445)];
  v368 = v79 - 149204689;
  v434 = v167 - ((2 * v167) & 0xEE36A25E) - 149204689;
  LODWORD(a15) = *(_DWORD *)&v130[4 * (BYTE3(v81) ^ 0xDF)];
  LODWORD(v363) = *(_DWORD *)&v130[4 * HIBYTE(v159)];
  v174 = v76 ^ (v63 - ((2 * v63) & 0xEE36A25E) - 149204689);
  v175 = v484 + 1954290419;
  v373 = v431 + 1954290419;
  v176 = v393 + 1954290419;
  *(_DWORD *)(v55 - 248) = v385 + 1954290419;
  v394 = v420 + 1954290419;
  v177 = v375 + 1954290419;
  *(_DWORD *)(v55 - 224) = v473 + 1954290419;
  v178 = v480 + 1954290419;
  v179 = v174 - ((2 * v174) & 0xE8F835E6) + 1954290419;
  v180 = v498 ^ HIDWORD(v497) ^ 0x6285F181;
  v181 = (v355 - 149204689) ^ v170 ^ v180;
  LODWORD(v129) = *(_DWORD *)(v55 - 148);
  v182 = (char *)*(&off_1E6CBBAA0 + (v129 & 0x720DAC77)) - 4;
  v183 = (char *)*(&off_1E6CBBAA0 + (int)(v129 ^ 0xD3)) - 8;
  v184 = (char *)*(&off_1E6CBBAA0 + (int)(v129 ^ 0x1F)) - 8;
  v185 = (char *)*(&off_1E6CBBAA0 + (int)(v129 | 9)) - 12;
  v186 = (v185[*(unsigned __int8 *)(v55 - 109) ^ 0x41] ^ 0xFF) & 0xFF00FFFF | (((v184[*(unsigned __int8 *)(v55 - 111) ^ 0x40] + 54) ^ 0x5A) << 16) | ((v183[*(unsigned __int8 *)(v55 - 110) ^ 0xBBLL] ^ 0x66) << 8) | ((v182[*(unsigned __int8 *)(v55 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v55 - 112) + (~(2 * *(unsigned __int8 *)(v55 - 112)) | 0x5F) - 47) ^ 0x84) << 24);
  v490 = v183;
  v493 = v182;
  v485 = v185;
  v488 = v184;
  v187 = (v185[*(unsigned __int8 *)(v55 - 105) ^ 0xE4] ^ 0xC9) & 0xFF00FFFF | ((v182[*(unsigned __int8 *)(v55 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v55 - 108) - ((2 * *(unsigned __int8 *)(v55 - 108)) & 0xA0) - 48) ^ 0xFFFFFFE1) << 24) | (((v184[*(unsigned __int8 *)(v55 - 107) ^ 0x27] + 54) ^ 0x96) << 16) | ((v183[*(unsigned __int8 *)(v55 - 106) ^ 9] ^ 0x63) << 8);
  v188 = (v185[*(unsigned __int8 *)(v55 - 101) ^ 0xF2] ^ 0x70) & 0xFF00FFFF | ((v182[*(unsigned __int8 *)(v55 - 104) ^ 0xD3] ^ (*(unsigned __int8 *)(v55 - 104) - ((2 * *(unsigned __int8 *)(v55 - 104)) & 0xA0) - 48) ^ 0xE0) << 24) | ((v183[*(unsigned __int8 *)(v55 - 102) ^ 0xBELL] ^ 0xC4) << 8) & 0xFF00FFFF | (((v184[*(unsigned __int8 *)(v55 - 103) ^ 0xE9] + 54) ^ 0x8A) << 16);
  v189 = v181 ^ 0x2497E332;
  if ((v181 & 0x80) != 0)
    v190 = -128;
  else
    v190 = 128;
  *(_DWORD *)(v55 - 136) = (v185[*(unsigned __int8 *)(v55 - 97) ^ 0x74] ^ 0x58 | (((v184[*(unsigned __int8 *)(v55 - 99) ^ 0xF3] + 54) ^ 2) << 16) | ((v183[*(unsigned __int8 *)(v55 - 98) ^ 0x20] ^ 0x8C) << 8) | ((v182[*(unsigned __int8 *)(v55 - 100) ^ 0xF3] ^ (*(unsigned __int8 *)(v55 - 100) - ((2 * *(unsigned __int8 *)(v55 - 100)) & 0xA0) - 48) ^ 0x85) << 24)) ^ 0x88392522;
  *(_DWORD *)(v55 - 140) = v186 ^ 0x1D76E130;
  *(_DWORD *)(v55 - 144) = v187 ^ 0x219ACA7C;
  v191 = *(unsigned __int8 **)(v55 - 120);
  *(_DWORD *)(v55 - 148) = v188 ^ 0x5BF016B1;
  HIDWORD(v481) = v173 ^ HIDWORD(v343);
  LODWORD(v481) = v171 ^ v400 ^ v477 ^ HIDWORD(v360) ^ v461;
  HIDWORD(v476) = v177 ^ v172;
  LODWORD(v476) = v469 ^ v439 ^ v475;
  HIDWORD(v471) = v454 ^ v360;
  LODWORD(v471) = v343 ^ v470 ^ v347 ^ v175;
  HIDWORD(v467) = HIDWORD(a3) ^ v382;
  LODWORD(v467) = v342 ^ v503 ^ v466;
  HIDWORD(v462) = (v412 + 1954290419) ^ v449 ^ v464;
  LODWORD(v462) = v176 ^ HIDWORD(v342);
  HIDWORD(v457) = v345 ^ HIDWORD(v355) ^ v459 ^ v397 ^ HIDWORD(v347);
  LODWORD(v457) = HIDWORD(v345) ^ v456 ^ v508 ^ v451;
  HIDWORD(v452) = (v349 + 1954290419) ^ v446;
  LODWORD(v452) = v178 ^ v443;
  HIDWORD(v447) = v391 ^ *(_DWORD *)(v55 - 200);
  LODWORD(v447) = v381 ^ v417 ^ v437 ^ (HIDWORD(v358) + 1954290419);
  HIDWORD(v440) = (HIDWORD(v363) + 1954290419) ^ v428;
  LODWORD(v440) = HIDWORD(v348) ^ v518 ^ v410;
  HIDWORD(v435) = v348 ^ v363 ^ v179;
  LODWORD(v435) = v434 ^ v501;
  HIDWORD(v429) = (v166 - ((2 * v166) & 0xE8F835E6) + 1954290419) ^ a15;
  LODWORD(v429) = *(_DWORD *)(v55 - 232) ^ *(_DWORD *)(v55 - 208) ^ *(_DWORD *)(v55 - 240) ^ v368;
  HIDWORD(v423) = *(_DWORD *)(v55 - 224) ^ v425;
  LODWORD(v423) = *(_DWORD *)(v55 - 168) ^ v422;
  HIDWORD(v418) = v415 ^ *(_DWORD *)(v55 - 176);
  LODWORD(v418) = v352 ^ *(_DWORD *)(v55 - 184);
  HIDWORD(v413) = v371 ^ *(_DWORD *)(v55 - 160) ^ v358;
  LODWORD(v413) = v500 ^ v514 ^ HIDWORD(v352);
  HIDWORD(v407) = v505 ^ *(_DWORD *)(v55 - 256) ^ v373;
  LODWORD(v407) = v406 ^ *(_DWORD *)(v55 - 192);
  HIDWORD(v401) = v512 ^ HIDWORD(v349) ^ v516 ^ v403 ^ v510;
  LODWORD(v401) = v394 ^ v377;
  HIDWORD(v395) = *(_DWORD *)(v55 - 248) ^ v387;
  LODWORD(v395) = *(_DWORD *)(v55 - 216) + 274989652;
  HIDWORD(v388) = (v190 + v189) ^ v180;
  v192 = *(_DWORD *)(v55 - 128);
  LODWORD(v388) = v192 & 0x14DE6C20;
  HIDWORD(v383) = v192 ^ 0x373;
  LODWORD(v383) = v192 ^ 0x360;
  HIDWORD(v378) = v192 & 0x1D9BBCE1;
  LODWORD(v378) = v192 & 0x2C569C45;
  HIDWORD(v374) = v192 ^ 0x36B;
  LODWORD(v374) = v192 & 0x4B12892;
  HIDWORD(v369) = v192 ^ 0x3AF;
  LODWORD(v369) = v192 & 0x34D66C4C;
  *(_QWORD *)(v55 - 176) = 13;
  v193 = *(_DWORD *)(v55 - 128);
  v194 = v184[v191[13] ^ 0xF3] + 54;
  v195 = (v193 + 381) ^ 0x57Du;
  *(_QWORD *)(v55 - 160) = v195;
  v196 = (v194 ^ 2) << 16;
  v197 = v191[v195] ^ 0x57;
  *(_QWORD *)(v55 - 168) = 10;
  v198 = ((v184[v197] + 54) ^ 0xF6) << 16;
  v199 = v490[v191[10] ^ 0xB6];
  *(_QWORD *)(v55 - 192) = 4;
  LODWORD(v197) = (v199 ^ 0xE9) << 8;
  v200 = v191[4];
  v201 = v182[v200 ^ 0x9A];
  *(_QWORD *)(v55 - 232) = 7;
  LODWORD(v200) = v201 ^ (v200 + (~(2 * v200) | 0x5F) - 47);
  v202 = v191[7] ^ 0xD6;
  *(_QWORD *)(v55 - 224) = 2;
  LODWORD(v200) = v485[v202] ^ 0x9A | ((v200 ^ 0xFFFFFFCF) << 24);
  LODWORD(v202) = v490[v191[2]] ^ 0xFB;
  *(_QWORD *)(v55 - 200) = 3;
  v203 = v198 | ((_DWORD)v202 << 8);
  LODWORD(v202) = v485[v191[3] ^ 0x74];
  *(_QWORD *)(v55 - 184) = 12;
  v204 = v203 | v202 ^ 0x58;
  LODWORD(v202) = v182[v191[12] ^ 0x6ELL] ^ (v191[12] - ((2 * v191[12]) & 0xA0) - 48) ^ 0x51;
  *(_QWORD *)(v55 - 216) = 0;
  v205 = v204 | ((v182[*v191 ^ 0x15] ^ (*v191 - ((2 * *v191) & 0xA0) - 48) ^ 0xAE) << 24);
  v206 = v182[v191[8] ^ 0x46] ^ (v191[8] - ((2 * v191[8]) & 0xA0) - 48) ^ 0xFFFFFFE7;
  *(_QWORD *)(v55 - 208) = 14;
  LODWORD(v197) = v197 | (v206 << 24);
  v207 = v490[v191[14] ^ 0xD5] ^ 0x73;
  *(_QWORD *)(v55 - 240) = 5;
  v208 = v196 | ((_DWORD)v202 << 24) | (v207 << 8);
  *(_QWORD *)(v55 - 256) = 11;
  LOBYTE(v196) = (v184[v191[5] ^ 0x9DLL] + 54) ^ 0xF7;
  v209 = v485[v191[11] ^ 0xC2] ^ 0x7D | v197;
  LOBYTE(v197) = v184[v191[9] ^ 0x3ELL];
  v210 = v191[6] ^ 0xA4;
  *(_QWORD *)(v55 - 248) = 15;
  v211 = v209 & 0xFF00FFFF | (((v197 + 54) ^ 0xDF) << 16);
  LODWORD(v202) = v485[v191[15] ^ 0x47] ^ 0x58 | v208;
  v506 = v200 & 0xFF00FFFF | (v196 << 16) | ((v490[v210] ^ 0x23) << 8);
  v212 = (char *)*(&off_1E6CBBAA0 + HIDWORD(v383)) - 4;
  LODWORD(v197) = ((((unsigned __int16)(v506 ^ WORD2(v494)) >> 8) ^ 0x4C)
                 - 1373394449
                 - 2
                 * (((unsigned __int16)(v506 ^ WORD2(v494)) >> 8) ^ 0x4C ^ ((v506 ^ HIDWORD(v494)) >> 8) & 0x10)) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v506 ^ WORD2(v494)) >> 8) ^ 0x21)];
  v213 = (char *)*(&off_1E6CBBAA0 + v388) - 4;
  BYTE2(v200) = BYTE2(v205) ^ BYTE2(v495);
  v214 = v205 ^ v495 ^ 0x730032AA;
  LODWORD(v197) = (v197 - 56215886 - ((2 * v197) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4
                                                                                 * ((v205 ^ v495) ^ 0xAA)];
  v215 = HIDWORD(a44) ^ v202;
  LODWORD(v210) = ((((unsigned __int16)(WORD2(a44) ^ v202) >> 8) ^ 0xAE)
                 - 1373394449
                 - 2
                 * (((unsigned __int16)(WORD2(a44) ^ v202) >> 8) ^ 0xAE ^ ((HIDWORD(a44) ^ v202) >> 8) & 0x10)) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(WORD2(a44) ^ v202) >> 8) ^ 0xC3)];
  LODWORD(v202) = v210 + 1233387280 - ((2 * v210) & 0x9307FE20);
  v216 = (char *)*(&off_1E6CBBAA0 + v193 - 805) - 8;
  v217 = *(_DWORD *)&v216[4 * (((v211 ^ v494) >> 16) ^ 0x68)];
  HIDWORD(v219) = v217 ^ 0xE64;
  LODWORD(v219) = v217 ^ 0x1AD23000;
  v218 = v219 >> 12;
  LODWORD(v200) = *(_DWORD *)&v216[4 * BYTE2(v200)];
  HIDWORD(v219) = v200 ^ 0xE64;
  LODWORD(v219) = v200 ^ 0x1AD23000;
  v220 = (char *)*(&off_1E6CBBAA0 + v193 - 807) - 12;
  LODWORD(v202) = v202 ^ *(_DWORD *)&v220[4 * (((v506 ^ HIDWORD(v494)) >> 24) ^ 0xB7)] ^ (v219 >> 12);
  v221 = *(_DWORD *)&v216[4 * (BYTE2(v215) ^ 0xB9)];
  HIDWORD(v219) = v221 ^ 0xE64;
  LODWORD(v219) = v221 ^ 0x1AD23000;
  v222 = *(_DWORD *)&v213[4 * ((v506 ^ BYTE4(v494)) ^ 0xFB)] ^ (BYTE1(v211) ^ BYTE1(v494)) ^ *(_DWORD *)&v212[4 * ((BYTE1(v211) ^ BYTE1(v494)) ^ 0x23)] ^ 0x52859F13 ^ (v219 >> 12);
  v223 = *(_DWORD *)&v216[4 * (((v506 ^ HIDWORD(v494)) >> 16) ^ 0x1C)];
  HIDWORD(v219) = v223 ^ 0xE64;
  LODWORD(v219) = v223 ^ 0x1AD23000;
  v224 = *(_DWORD *)&v220[4 * (((v211 ^ v494) >> 24) ^ 0xF6)] ^ (BYTE1(v214)
                                                                             - 1373394449
                                                                             - ((v214 >> 7) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (BYTE1(v214) ^ 0x6D)] ^ ((v219 >> 12) + 1233387280 - ((2 * (v219 >> 12)) & 0x9307FE20));
  LODWORD(v197) = HIDWORD(v481) ^ *(_DWORD *)&v220[4 * (HIBYTE(v215) ^ 0xA)] ^ v218 ^ (v197
                                                                                     + 1233387280
                                                                                     - ((2 * v197) & 0x9307FE20));
  v225 = v481 ^ *(_DWORD *)&v213[4 * (v215 ^ 0xFB)] ^ (v224 - 56215886 - ((2 * v224) & 0xF94C6D64));
  v226 = v177 ^ v172 ^ *(_DWORD *)&v213[4 * ((v211 ^ v494) ^ 0x5F)] ^ (v202
                                                                                      - 56215885
                                                                                      + ~((2 * v202) & 0xF94C6D64));
  v227 = HIDWORD(v388) ^ *(_DWORD *)&v220[4 * HIBYTE(v214)] ^ (v222 + 1233387280 - ((2 * v222) & 0x9307FE20));
  v228 = v197 ^ 0xF9388C2F;
  LODWORD(v202) = *(_DWORD *)&v216[4 * ((v197 ^ 0xF9388C2F) >> 16)];
  HIDWORD(v219) = v202 ^ 0xE64;
  LODWORD(v219) = v202 ^ 0x1AD23000;
  LODWORD(v202) = v219 >> 12;
  v229 = *(_DWORD *)&v216[4 * (BYTE2(v225) ^ 0x1F)];
  HIDWORD(v219) = v229 ^ 0xE64;
  LODWORD(v219) = v229 ^ 0x1AD23000;
  v230 = v219 >> 12;
  v231 = *(_DWORD *)&v216[4 * (BYTE2(v226) ^ 0x66)];
  HIDWORD(v219) = v231 ^ 0xE64;
  LODWORD(v219) = v231 ^ 0x1AD23000;
  v232 = (v219 >> 12) ^ *(_DWORD *)&v212[4 * (BYTE1(v227) ^ 5)] ^ ((BYTE1(v227) ^ 0x68)
                                                                 - 1373394449
                                                                 - 2 * (BYTE1(v227) ^ 0x68 ^ (v227 >> 8) & 0x10));
  v233 = (v202 - 56215885 + ~((2 * v202) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v226 ^ 0xB6)];
  LODWORD(v197) = (v232 - 56215886 - ((2 * v232) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v197 ^ 0x61)];
  v234 = (BYTE1(v228) - 1373394449 - ((v228 >> 7) & 0x1DE)) ^ 0xD678EAEF ^ *(_DWORD *)&v212[4 * (BYTE1(v228) ^ 0x6D)];
  LODWORD(v191) = *(_DWORD *)&v220[4 * (HIBYTE(v226) ^ 0x43)] ^ 0xEB99A4AE;
  v235 = v234 + (_DWORD)v191;
  v236 = v234 & v191;
  LODWORD(v191) = *(_DWORD *)&v216[4 * (BYTE2(v227) ^ 0xBD)];
  v237 = v235 - 2 * v236;
  HIDWORD(v219) = v191 ^ 0xE64;
  LODWORD(v219) = v191 ^ 0x1AD23000;
  v238 = *(_DWORD *)&v220[4 * HIBYTE(v228)] ^ (v230 + 1233387280 - ((2 * v230) & 0x9307FE20));
  v239 = (v238 - 56215886 - ((2 * v238) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v227 ^ 0xAB)];
  v240 = *(_DWORD *)&v220[4 * (HIBYTE(v227) ^ 0x42)] ^ v498 ^ *(_DWORD *)&v212[4 * (BYTE1(v225) ^ 0xBD)] ^ ((BYTE1(v225) ^ 0xD0) - 1373394449 - ((2 * ((v225 >> 8) ^ 0x561FD0)) & 0x1DE)) ^ (v233 + 1233387280 - ((2 * v233) & 0x9307FE20));
  v241 = v476 ^ *(_DWORD *)&v212[4 * (BYTE1(v226) ^ 0x39)] ^ (v239 - 1373394449 - ((2 * v239) & 0x5C4753DE));
  v242 = HIDWORD(v471) ^ *(_DWORD *)&v220[4 * (HIBYTE(v225) ^ 0x56)] ^ (v197 + 1233387280 - ((2 * v197) & 0x9307FE20));
  LODWORD(v191) = v471 ^ *(_DWORD *)&v213[4 * (v225 ^ 0xB4)] ^ ((v237 ^ (v219 >> 12))
                                                                               - 56215886
                                                                               - ((2 * (v237 ^ (v219 >> 12))) & 0xF94C6D64));
  LODWORD(v197) = *(_DWORD *)&v216[4 * (BYTE2(v191) ^ 0x79)];
  HIDWORD(v219) = v197 ^ 0xE64;
  LODWORD(v219) = v197 ^ 0x1AD23000;
  BYTE1(v239) = BYTE1(v242) ^ 0x68;
  LODWORD(v197) = ((v219 >> 12) + 1233387280 - ((2 * (v219 >> 12)) & 0x9307FE20)) ^ *(_DWORD *)&v220[4 * ((v242 ^ 0x2261685Eu) >> 24)];
  v243 = ((BYTE1(v191) ^ 0xD0) - 1373394449 - ((2 * ((v191 >> 8) ^ 0x679D0)) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (BYTE1(v191) ^ 0xBD)];
  v244 = (v243 - 56215886 - ((2 * v243) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v240 ^ 0x76)];
  LODWORD(v202) = ((BYTE1(v241) ^ 0xEC) - 1373394449 - 2 * (BYTE1(v241) ^ 0xEC ^ (v241 >> 8) & 0x10)) ^ *(_DWORD *)&v212[4 * (BYTE1(v241) ^ 0x81)];
  v245 = *(_DWORD *)&v216[4 * (BYTE2(v241) ^ 0x5F)];
  HIDWORD(v219) = v245 ^ 0xE64;
  LODWORD(v219) = v245 ^ 0x1AD23000;
  v246 = v219 >> 12;
  HIDWORD(v219) = *(_DWORD *)&v213[4 * (v242 ^ 0x5E)] ^ 0x15B1113A;
  LODWORD(v219) = HIDWORD(v219);
  LODWORD(v202) = (v219 >> 28) ^ __ROR4__(*(_DWORD *)&v220[4 * ((v191 >> 24) ^ 6)] ^ 0x7462B151 ^ (v202 + 1233387280 - ((2 * v202) & 0x9307FE20)), 28);
  v247 = (v246 + 1233387280 - ((2 * v246) & 0x9307FE20)) ^ *(_DWORD *)&v220[4 * (HIBYTE(v240) ^ 0xD2)];
  v248 = (v247 - 56215886 - ((2 * v247) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v191 ^ 0x4C)];
  v249 = *(_DWORD *)&v216[4 * (BYTE2(v242) ^ 0x1B)];
  HIDWORD(v219) = v249 ^ 0xE64;
  LODWORD(v219) = v249 ^ 0x1AD23000;
  v250 = v219 >> 12;
  v251 = BYTE1(v240);
  v252 = (BYTE1(v240) ^ 0xC0) - 1373394449 - 2 * (BYTE1(v240) ^ 0xC0 ^ (v240 >> 8) & 0x10);
  v253 = *(_DWORD *)&v216[4 * (BYTE2(v240) ^ 0xCC)];
  HIDWORD(v219) = v253 ^ 0xE64;
  LODWORD(v219) = v253 ^ 0x1AD23000;
  v254 = HIDWORD(v467) ^ (v219 >> 12) ^ __ROR4__(v202 ^ 0x78071371, 4);
  LOBYTE(v202) = v241 ^ BYTE1(v226) ^ 0x54;
  LODWORD(v191) = v467 ^ *(_DWORD *)&v220[4 * (HIBYTE(v241) ^ 0xE)] ^ v250 ^ (v244
                                                                            + 1233387281
                                                                            + ~((2 * v244) & 0x9307FE20));
  v255 = BYTE1(v239);
  v256 = HIDWORD(v462) ^ *(_DWORD *)&v212[4 * (BYTE1(v239) ^ 0x6D)] ^ (v248 - 1373394449 - ((2 * v248) & 0x5C4753DE));
  v257 = v462 ^ v252 ^ *(_DWORD *)&v213[4 * (v202 ^ 0xCA)] ^ *(_DWORD *)&v212[4 * (v251 ^ 0xAD)] ^ (v197 - 56215886 - ((2 * v197) & 0xF94C6D64));
  LODWORD(v197) = v255 ^ 0x4552953C ^ v256;
  v258 = *(_DWORD *)&v216[4 * BYTE2(v197)];
  HIDWORD(v219) = v258 ^ 0xE64;
  LODWORD(v219) = v258 ^ 0x1AD23000;
  v259 = v219 >> 12;
  BYTE1(v241) = BYTE1(v254) ^ 0xE7;
  v260 = *(_DWORD *)&v216[4 * ((v254 ^ 0x99FEE750) >> 16)];
  HIDWORD(v219) = v260 ^ 0xE64;
  LODWORD(v219) = v260 ^ 0x1AD23000;
  LODWORD(v195) = (BYTE1(v197) - 1373394449 - ((v197 >> 7) & 0x1DE)) ^ *(_DWORD *)&v213[4 * (v191 ^ 0x72)] ^ *(_DWORD *)&v212[4 * (BYTE1(v197) ^ 0x6D)] ^ ((v219 >> 12) - 56215886 - ((2 * (v219 >> 12)) & 0xF94C6D64));
  v261 = *(_DWORD *)&v216[4 * (BYTE2(v257) ^ 2)];
  HIDWORD(v219) = v261 ^ 0xE64;
  LODWORD(v219) = v261 ^ 0x1AD23000;
  LODWORD(v197) = *(_DWORD *)&v213[4 * v197] ^ *(_DWORD *)&v220[4 * ((v191 >> 24) ^ 0xA7)] ^ (v219 >> 12) ^ 0xB525C9A2;
  v262 = *(_DWORD *)&v216[4 * (BYTE2(v191) ^ 0x3B)];
  HIDWORD(v219) = v262 ^ 0xE64;
  LODWORD(v219) = v262 ^ 0x1AD23000;
  v263 = HIDWORD(v457) ^ ((BYTE1(v257) ^ 0xD9) - 1373394449 - ((2 * ((v257 >> 8) ^ 0x9802D9)) & 0x1DE)) ^ *(_DWORD *)&v213[4 * (v254 ^ 0x1E)] ^ *(_DWORD *)&v212[4 * (BYTE1(v257) ^ 0xB4)] ^ (v219 >> 12) ^ *(_DWORD *)&v220[4 * (HIBYTE(v256) ^ 0x61)];
  v264 = v457 ^ *(_DWORD *)&v220[4 * (HIBYTE(v257) ^ 0x98)] ^ (v195 + 1233387280 - ((2 * v195) & 0x9307FE20));
  LODWORD(v202) = *(_DWORD *)&v216[4 * (BYTE2(v263) ^ 0xA4)];
  HIDWORD(v219) = v202 ^ 0xE64;
  LODWORD(v219) = v202 ^ 0x1AD23000;
  v265 = v219 >> 12;
  v266 = HIDWORD(v452) ^ ((BYTE1(v191) ^ 0x29) - 1373394449 - ((2 * ((v191 >> 8) ^ 0xA73B29)) & 0x1DE)) ^ *(_DWORD *)&v213[4 * (v257 ^ 0x3D)] ^ *(_DWORD *)&v220[4 * ((v254 ^ 0x99FEE750) >> 24)] ^ *(_DWORD *)&v212[4 * (BYTE1(v191) ^ 0x44)] ^ v259;
  LODWORD(v202) = *(_DWORD *)&v216[4 * (BYTE2(v266) ^ 0xCD)];
  v267 = v452 ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v254 ^ 0xE750) >> 8) ^ 0x6D)] ^ (v197 - 1373394449 - ((2 * v197) & 0x5C4753DE));
  HIDWORD(v219) = v202 ^ 0xE64;
  LODWORD(v219) = v202 ^ 0x1AD23000;
  LODWORD(v191) = BYTE1(v266) ^ 0x36;
  LODWORD(v197) = (_DWORD)v191 - 1373394449 - ((2 * ((v266 >> 8) ^ 0x60CD36)) & 0x1DE);
  LOBYTE(v202) = v263 ^ 0xDE;
  LODWORD(v195) = *(_DWORD *)&v213[4 * ((v267 ^ BYTE1(v241)) ^ 0x41)] ^ (((unsigned __int16)(v263 ^ 0x1ADE) >> 8)
                                                                                        - 1373394449
                                                                                        - (((v263 ^ 0xA0DE1ADE) >> 7) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v263 ^ 0x1ADE) >> 8) ^ 0x6D)] ^ ((v219 >> 12) - 56215886 - ((2 * (v219 >> 12)) & 0xF94C6D64));
  v268 = *(_DWORD *)&v216[4 * (BYTE2(v267) ^ 0x81)];
  HIDWORD(v219) = v268 ^ 0xE64;
  LODWORD(v219) = v268 ^ 0x1AD23000;
  v269 = ((v219 >> 12) + 1233387280 - ((2 * (v219 >> 12)) & 0x9307FE20)) ^ *(_DWORD *)&v220[4
                                                                                          * ((v263 ^ 0xA0DE1ADE) >> 24)];
  v270 = (v269 - 56215886 - ((2 * v269) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v266 ^ 0xA7)];
  v271 = ((BYTE1(v267) ^ 0xA0) - 1373394449 - ((2 * ((v267 >> 8) ^ 0x6881A0)) & 0x1DE)) ^ (v265
                                                                                         - 56215886
                                                                                         - ((2 * v265) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v264 ^ 0xFC)] ^ *(_DWORD *)&v212[4 * (BYTE1(v267) ^ 0xCD)];
  v272 = *(_DWORD *)&v216[4 * (BYTE2(v264) ^ 0xC6)];
  LODWORD(v219) = __ROR4__((v272 >> 12) ^ 0x26C7001, 17) ^ 0xEE910136;
  HIDWORD(v219) = v219;
  v273 = HIDWORD(v447) ^ *(_DWORD *)&v212[4 * (BYTE1(v264) ^ 0x75)] ^ (v270 - 1373394449 - ((2 * v270) & 0x5C4753DE));
  v274 = v447 ^ *(_DWORD *)&v220[4 * (HIBYTE(v266) ^ 0x60)] ^ (v271 + 1233387280 - ((2 * v271) & 0x9307FE20));
  v275 = HIDWORD(v440) ^ *(_DWORD *)&v220[4 * (HIBYTE(v264) ^ 0x5A)] ^ (v195 + 1233387280 - ((2 * v195) & 0x9307FE20));
  v276 = v440 ^ v197 ^ *(_DWORD *)&v213[4 * v202] ^ *(_DWORD *)&v220[4 * (HIBYTE(v267) ^ 0x68)] ^ *(_DWORD *)&v212[4 * (v191 ^ 0x6D)] ^ ((v219 >> 15) + (v272 << 20));
  LODWORD(v195) = ((BYTE1(v273) ^ 0x9D) - 1373394449 - ((2 * ((v273 >> 8) ^ 0xC2489D)) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (BYTE1(v273) ^ 0xF0)];
  v277 = *(_DWORD *)&v216[4 * (BYTE2(v274) ^ 0x8F)];
  LODWORD(v197) = *(_DWORD *)&v213[4 * (v276 ^ 0x28)] ^ (v277 << 20) ^ (v277 >> 12);
  v278 = *(_DWORD *)&v216[4 * ((v275 ^ 0xCFB8D782) >> 16)];
  HIDWORD(v219) = v278 ^ 0xE64;
  LODWORD(v219) = v278 ^ 0x1AD23000;
  LODWORD(v195) = v197 ^ (v195 - 56215886 - ((2 * v195) & 0xF94C6D64));
  v279 = ((v219 >> 12) - 56215886 - ((2 * (v219 >> 12)) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4
                                                                                        * ((v273 ^ BYTE1(v264)) ^ 0x3F)];
  LODWORD(v197) = (v195 ^ 0xE641AD23) + 1233387280 - 2 * ((v195 ^ 0xE641AD23) & 0x4983FF14 ^ v195 & 4);
  LODWORD(v195) = v279 + 1233387280 - ((2 * v279) & 0x9307FE20);
  LODWORD(v202) = BYTE1(v274) ^ 0xD9;
  v280 = v202 - 1373394449 - ((2 * ((v274 >> 8) ^ 0xC78FD9)) & 0x1DE);
  v281 = *(_DWORD *)&v216[4 * (BYTE2(v273) ^ 0x48)];
  HIDWORD(v219) = v281 ^ 0xE64;
  LODWORD(v219) = v281 ^ 0x1AD23000;
  v282 = ((BYTE1(v276) ^ 0xA9) - 1373394449 - ((2 * ((v276 >> 8) ^ 0x75EEA9)) & 0x1DE)) ^ *(_DWORD *)&v213[4 * (v275 ^ 0xCC)] ^ *(_DWORD *)&v212[4 * (BYTE1(v276) ^ 0xC4)] ^ ((v219 >> 12) - 56215886 - ((2 * (v219 >> 12)) & 0xF94C6D64));
  v283 = *(_DWORD *)&v216[4 * (BYTE2(v276) ^ 0xEE)];
  HIDWORD(v219) = v283 ^ 0xE64;
  LODWORD(v219) = v283 ^ 0x1AD23000;
  v284 = HIDWORD(v435) ^ (((unsigned __int16)(v275 ^ 0xD782) >> 8)
                        - 1373394449
                        - (((v275 ^ 0xCFB8D782) >> 7) & 0x1DE)) ^ *(_DWORD *)&v213[4 * (v274 ^ 0x50)] ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v275 ^ 0xD782) >> 8) ^ 0x6D)] ^ (v219 >> 12) ^ *(_DWORD *)&v220[4 * (HIBYTE(v273) ^ 0xC2)];
  v285 = v435 ^ *(_DWORD *)&v220[4 * (HIBYTE(v274) ^ 0xC7)] ^ (v282 + 1233387281 + ~((2 * v282) & 0x9307FE20));
  v286 = HIDWORD(v429) ^ *(_DWORD *)&v220[4 * ((v275 ^ 0xCFB8D782) >> 24)] ^ v197;
  v287 = v429 ^ v280 ^ *(_DWORD *)&v212[4 * (v202 ^ 0x6D)] ^ *(_DWORD *)&v220[4 * (HIBYTE(v276) ^ 0x75)] ^ v195;
  LODWORD(v197) = *(_DWORD *)&v216[4 * (BYTE2(v285) ^ 0xE6)];
  HIDWORD(v219) = v197 ^ 0xE64;
  LODWORD(v219) = v197 ^ 0x1AD23000;
  LODWORD(v202) = v219 >> 12;
  v288 = *(_DWORD *)&v216[4 * (BYTE2(v286) ^ 0x1C)];
  HIDWORD(v219) = v288 ^ 0xE64;
  LODWORD(v219) = v288 ^ 0x1AD23000;
  v289 = (((unsigned __int16)(v287 ^ 0xCCA2) >> 8) - 1373394449 - (((v287 ^ 0x33C8CCA2) >> 7) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v287 ^ 0xCCA2) >> 8) ^ 0x6D)];
  LODWORD(v195) = (v219 >> 12) ^ *(_DWORD *)&v212[4 * (BYTE1(v285) ^ 0xD9)] ^ ((BYTE1(v285) ^ 0xB4)
                                                                             - 1373394449
                                                                             - ((2 * ((v285 >> 8) ^ 0x4FE6B4)) & 0x1DE));
  LODWORD(v195) = (v195 - 56215886 - ((2 * v195) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v284 ^ 0x48)];
  v290 = (v289 - 56215886 - ((2 * v289) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v286 ^ 0x3A)];
  v291 = *(_DWORD *)&v213[4 * (v285 ^ 0x96)];
  HIDWORD(v219) = v291 ^ 0x1CA636B2;
  LODWORD(v219) = ~v291;
  HIDWORD(v219) = (v219 >> 29) ^ 0x6615DA09;
  LODWORD(v219) = HIDWORD(v219);
  LODWORD(v202) = *(_DWORD *)&v213[4 * (v287 ^ 0xA2)] ^ (((unsigned __int16)(v284 ^ 0xDD48) >> 8)
                                                                        - 1373394449
                                                                        - (((v284 ^ 0xAC16DD48) >> 7) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v284 ^ 0xDD48) >> 8) ^ 0x6D)] ^ (v202 - 56215886 - ((2 * v202) & 0xF94C6D64));
  v292 = (v219 >> 3) - 1373394449 - ((2 * (v219 >> 3)) & 0x5C4753DE);
  v293 = *(_DWORD *)&v216[4 * ((v284 ^ 0xAC16DD48) >> 16)];
  HIDWORD(v219) = v293 ^ 0xE64;
  LODWORD(v219) = v293 ^ 0x1AD23000;
  v294 = v219 >> 12;
  LODWORD(v197) = *(_DWORD *)&v216[4 * ((v287 ^ 0x33C8CCA2) >> 16)];
  HIDWORD(v219) = v197 ^ 0xE64;
  LODWORD(v219) = v197 ^ 0x1AD23000;
  v295 = HIDWORD(v423) ^ *(_DWORD *)&v220[4 * (HIBYTE(v287) ^ 0x17)] ^ (v195 + 1233387280 - ((2 * v195) & 0x9307FE20));
  v296 = BYTE1(v286);
  LODWORD(v195) = v292 ^ *(_DWORD *)&v212[4 * (BYTE1(v286) ^ 0xD1)] ^ (v219 >> 12);
  v297 = v423 ^ *(_DWORD *)&v220[4 * (HIBYTE(v285) ^ 0x4F)] ^ v294 ^ (v290 + 1233387280 - ((2 * v290) & 0x9307FE20));
  v298 = HIDWORD(v418) ^ *(_DWORD *)&v220[4 * (HIBYTE(v286) ^ 0x1B)] ^ (v202 + 1233387280 - ((2 * v202) & 0x9307FE20));
  LODWORD(v197) = *(_DWORD *)&v216[4 * (BYTE2(v298) ^ 0x7E)];
  HIDWORD(v219) = v197 ^ 0xE64;
  LODWORD(v219) = v197 ^ 0x1AD23000;
  v299 = v219 >> 12;
  LODWORD(v197) = *(_DWORD *)&v216[4 * (BYTE2(v297) ^ 1)];
  HIDWORD(v219) = v197 ^ 0xE64;
  LODWORD(v219) = v197 ^ 0x1AD23000;
  LODWORD(v197) = *(_DWORD *)&v220[4 * (HIBYTE(v284) ^ 0x88)] ^ HIDWORD(v497) ^ (v195
                                                                               + 1233387280
                                                                               - ((2 * v195) & 0x9307FE20));
  LODWORD(v195) = ((v219 >> 12) - 56215886 - ((2 * (v219 >> 12)) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4
                                                                                                 * (v295 ^ 0xC6)];
  v300 = ((BYTE1(v295) ^ 0x71) - 1373394449 - ((2 * ((v295 >> 8) ^ 0xF25B71)) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (BYTE1(v295) ^ 0x1C)];
  v301 = (v300 + 1233387280 - ((2 * v300) & 0x9307FE20)) ^ *(_DWORD *)&v220[4 * (HIBYTE(v297) ^ 0x1F)];
  LODWORD(v202) = *(_DWORD *)&v216[4 * (BYTE2(v295) ^ 0x5B)];
  HIDWORD(v219) = v202 ^ 0xE64;
  LODWORD(v219) = v202 ^ 0x1AD23000;
  LODWORD(v202) = v219 >> 12;
  v302 = v301 - 56215886 - ((2 * v301) & 0xF94C6D64);
  v303 = v296 ^ 0x73F4E0AF ^ v197;
  v304 = *(_DWORD *)&v216[4 * BYTE2(v303)];
  HIDWORD(v219) = v304 ^ 0xE64;
  LODWORD(v219) = v304 ^ 0x1AD23000;
  v305 = v219 >> 12;
  HIDWORD(v219) = v299 ^ ((BYTE1(v297) ^ 0x81) - 1373394449 - 2 * (BYTE1(v297) ^ 0x81 ^ (v297 >> 8) & 0x10)) ^ 0xD678EAEF ^ *(_DWORD *)&v212[4 * (BYTE1(v297) ^ 0xEC)];
  LODWORD(v219) = HIDWORD(v219);
  LODWORD(v219) = (v219 >> 11) ^ __ROR4__(*(_DWORD *)&v220[4 * (HIBYTE(v295) ^ 0xF2)] ^ 0xEB99A4AE, 11) ^ 0xD490839A;
  HIDWORD(v219) = v219;
  v306 = v418 ^ *(_DWORD *)&v213[4 * (v297 ^ 0xB8)] ^ ((BYTE1(v298) ^ 0xAA)
                                                                      - 1373394449
                                                                      - ((2 * ((v298 >> 8) ^ 0x967EAA)) & 0x1DE)) ^ *(_DWORD *)&v220[4 * (BYTE3(v197) ^ 0x57)] ^ *(_DWORD *)&v212[4 * (BYTE1(v298) ^ 0xC7)] ^ v202;
  LODWORD(v197) = HIDWORD(v413) ^ *(_DWORD *)&v220[4 * (HIBYTE(v298) ^ 0x96)] ^ (BYTE1(v303)
                                                                               - 1373394449
                                                                               - ((v303 >> 7) & 0x1DE)) ^ *(_DWORD *)&v212[4 * (BYTE1(v303) ^ 0x6D)] ^ (v195 + 1233387280 - ((2 * v195) & 0x9307FE20));
  LODWORD(v195) = v413 ^ *(_DWORD *)&v213[4 * (v298 ^ 0x88)] ^ v305 ^ v302;
  v307 = HIDWORD(v407) ^ *(_DWORD *)&v213[4 * v303] ^ ((v219 >> 21)
                                                                      - 56215886
                                                                      - ((2 * (v219 >> 21)) & 0xF94C6D64));
  BYTE2(v298) = BYTE2(v195) ^ 0x4A;
  v308 = *(_DWORD *)&v216[4 * (BYTE2(v306) ^ 0xCE)];
  HIDWORD(v219) = v308 ^ 0xE64;
  LODWORD(v219) = v308 ^ 0x1AD23000;
  v309 = v219 >> 12;
  v310 = *(_DWORD *)&v212[4 * (BYTE1(v197) ^ 0x96)] ^ ((BYTE1(v197) ^ 0xFB)
                                                     - 1373394449
                                                     - ((2 * ((v197 >> 8) ^ 0x3EA2FB)) & 0x1DE));
  v311 = (v310 - 56215886 - ((2 * v310) & 0xF94C6D64)) ^ *(_DWORD *)&v213[4 * (v195 ^ 0x75)];
  v312 = *(_DWORD *)&v216[4 * (BYTE2(v197) ^ 0xA2)];
  HIDWORD(v219) = v312 ^ 0xE64;
  LODWORD(v219) = v312 ^ 0x1AD23000;
  LODWORD(v202) = (((unsigned __int16)(v195 ^ 0xF075) >> 8)
                 - 1373394449
                 - (((v195 ^ 0xB54AF075) >> 7) & 0x1DE)) ^ (v219 >> 12) ^ *(_DWORD *)&v212[4 * (((unsigned __int16)(v195 ^ 0xF075) >> 8) ^ 0x6D)];
  LODWORD(v202) = (v202 + 1233387280 - ((2 * v202) & 0x9307FE20)) ^ *(_DWORD *)&v220[4 * (HIBYTE(v307) ^ 0xED)];
  LODWORD(v195) = *(_DWORD *)&v220[4 * (BYTE3(v195) ^ 0x91)];
  v313 = *(_DWORD *)&v220[4 * (BYTE3(v197) ^ 0x3E)];
  v314 = *(_DWORD *)&v220[4 * (HIBYTE(v306) ^ 0x72)];
  v307 ^= 0xC9AF1D8F;
  v315 = *(_DWORD *)&v213[4 * v307];
  LODWORD(v220) = BYTE1(v307);
  v316 = BYTE1(v307) - 1373394449 - ((v307 >> 7) & 0x1DE);
  v317 = *(_DWORD *)&v216[4 * BYTE2(v307)];
  LODWORD(v216) = *(_DWORD *)&v216[4 * BYTE2(v298)];
  HIDWORD(v219) = v216 ^ 0xE64;
  LODWORD(v219) = v216 ^ 0x1AD23000;
  LODWORD(v220) = v407 ^ *(_DWORD *)&v213[4 * (v197 ^ 0x9A)] ^ v309 ^ v316 ^ v195 ^ *(_DWORD *)&v212[4 * (v220 ^ 0x6D)];
  v318 = HIDWORD(v401) ^ ((BYTE1(v306) ^ 9) - 1373394449 - 2 * (BYTE1(v306) ^ 9 ^ (v306 >> 8) & 0x10)) ^ v313 ^ *(_DWORD *)&v212[4 * (BYTE1(v306) ^ 0x64)] ^ v315 ^ (v219 >> 12);
  LODWORD(v212) = v401 ^ *(_DWORD *)&v213[4 * (v306 ^ 0xCD)] ^ (v202
                                                                               - 56215886
                                                                               - ((2 * v202) & 0xF94C6D64));
  v319 = HIDWORD(v395) ^ v314 ^ (v317 >> 12) ^ (v317 << 20) ^ (v311 + 1233387280 - ((2 * v311) & 0x9307FE20));
  v320 = (char *)*(&off_1E6CBBAA0 + v383) - 12;
  v321 = (char *)*(&off_1E6CBBAA0 + HIDWORD(v378)) - 12;
  v322 = *(_DWORD *)&v320[4 * (v212 ^ 7)] ^ *(_DWORD *)&v321[4
                                                                            * (((unsigned __int16)(WORD2(v395) ^ v314 ^ (v317 >> 12) ^ (v311 - 240 - ((2 * v311) & 0xFE20))) >> 8) ^ 0x8E)] ^ 0xC5AABFBD;
  LODWORD(v216) = *(_DWORD *)&v321[4 * (BYTE1(v220) ^ 0xB8)];
  v323 = (char *)*(&off_1E6CBBAA0 + HIDWORD(v374)) - 4;
  v324 = *(_DWORD *)&v323[4 * (HIBYTE(v318) ^ 0xC8)] ^ (v322 - 924174803 - ((2 * v322) & 0x91D46C5A));
  LODWORD(v197) = *(_DWORD *)&v321[4 * ((unsigned __int16)((unsigned __int16)v212 ^ 0x6F07) >> 8)];
  v325 = *(_DWORD *)&v321[4 * (BYTE1(v318) ^ 0xC7)];
  v326 = *(_DWORD *)&v323[4 * ((v212 >> 24) ^ 0xEF)];
  LODWORD(v213) = *(_DWORD *)&v323[4 * (HIBYTE(v319) ^ 0x7B)];
  v327 = *(_DWORD *)&v323[4 * ((v220 >> 24) ^ 0x84)];
  v328 = (char *)*(&off_1E6CBBAA0 + v378) - 4;
  LODWORD(v321) = *(_DWORD *)&v328[4 * (BYTE2(v319) ^ 0xFD)];
  LODWORD(v191) = *(_DWORD *)&v328[4 * (BYTE2(v212) ^ 0x2A)];
  LODWORD(v212) = *(_DWORD *)&v328[4 * (BYTE2(v318) ^ 0xC8)];
  v329 = *(_DWORD *)&v328[4 * (BYTE2(v220) ^ 0xAE)] ^ (v324 - 1019558051 - ((2 * v324) & 0x86758EBA));
  LODWORD(v328) = *(_DWORD *)&v320[4 * (v220 ^ 0x7E)];
  v330 = *(_DWORD *)&v320[4 * (v318 ^ 0x59)];
  v331 = *(_DWORD *)&v320[4 * (v319 ^ 0xF8)];
  v332 = *(_DWORD *)(v55 - 148) ^ HIDWORD(v495) ^ (v329 - ((2 * v329) & 0xB2E52866) - 646802381);
  v333 = *(_DWORD *)(v55 - 128);
  v334 = (char *)*(&off_1E6CBBAA0 + v333 - 998) - 4;
  *(_BYTE *)(*(_QWORD *)(v55 - 120) + 8) = v334[BYTE3(v332) ^ 0xD7] ^ 0x85;
  LODWORD(v321) = ((v321 ^ 0xA3CB93CB ^ v197)
                 - 924174803
                 - ((2 * (v321 ^ 0xA3CB93CB ^ v197)) & 0x91D46C5A)) ^ v327;
  LODWORD(v321) = ((_DWORD)v321 - 1520702677 - ((2 * (_DWORD)v321) & 0x4AB7D656)) ^ v330;
  LODWORD(v321) = *(_DWORD *)(v55 - 144) ^ v496 ^ ((_DWORD)v321 - ((2 * (_DWORD)v321) & 0x463091FC) - 1558689538);
  v335 = (char *)*(&off_1E6CBBAA0 + v374) - 4;
  *(_BYTE *)(*(_QWORD *)(v55 - 120) + *(_QWORD *)(v55 - 232)) = (v335[v321 ^ 0xC7] - 82) ^ 0x5F;
  v336 = (char *)*(&off_1E6CBBAA0 + HIDWORD(v369)) - 12;
  LODWORD(v197) = v336[BYTE1(v321) ^ 0x13];
  HIDWORD(v219) = v197 ^ 0x24;
  LODWORD(v219) = (v197 ^ 0x40) << 24;
  *(_BYTE *)(*(_QWORD *)(v55 - 120) + 6) = (v219 >> 30) ^ 0x40;
  LODWORD(v197) = v328 ^ 0x66612C76 ^ v191;
  v337 = *(_QWORD *)(v55 - 120);
  LODWORD(v197) = (v197 - 924174803 - ((2 * v197) & 0x91D46C5A)) ^ v213;
  LODWORD(v197) = (v197 - ((2 * v197) & 0xC1E2A92C) + 1626428566) ^ v325;
  LODWORD(v328) = *(_DWORD *)(v55 - 140);
  v338 = v328 ^ v497 ^ ((_DWORD)v197 - ((2 * (_DWORD)v197) & 0x3FE8C764) - 1611373646);
  LODWORD(v197) = v336[(unsigned __int16)((unsigned __int16)v328 ^ v497 ^ (v197
                                                                                          - ((2 * v197) & 0xC764)
                                                                                          + 25522)) >> 8];
  HIDWORD(v219) = v197 ^ 0x24;
  LODWORD(v219) = (v197 ^ 0x40) << 24;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 224)) = (v219 >> 30) ^ 0x7E;
  v339 = (char *)*(&off_1E6CBBAA0 + v369) - 8;
  *(_BYTE *)(v337 + 9) = v339[BYTE2(v332) ^ 0xFBLL] ^ 0x9D;
  LODWORD(v197) = ((v216 ^ 0xA81B62BB ^ v326)
                 - 1019558051
                 - ((2 * (v216 ^ 0xA81B62BB ^ v326)) & 0x86758EBA)) ^ v212;
  LODWORD(v197) = v331 ^ (v197 - 1520702677 - ((2 * v197) & 0x4AB7D656));
  LODWORD(v197) = *(_DWORD *)(v55 - 136) ^ HIDWORD(v496) ^ (v197 - ((2 * v197) & 0x15774E06) + 180070147);
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 176)) = v339[BYTE2(v197) ^ 0xB8] ^ 0x4E;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 256)) = (v335[v332 ^ 0x1BLL] - 82) ^ 0x7D;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 240)) = v339[BYTE2(v321) ^ 3] ^ 0x30;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 192)) = v334[(v321 >> 24) ^ 0x6DLL] ^ 0x7D;
  LODWORD(v321) = v336[BYTE1(v332) ^ 0x92];
  HIDWORD(v219) = v321 ^ 0x24;
  LODWORD(v219) = (v321 ^ 0x40) << 24;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 168)) = (v219 >> 30) ^ 0xD2;
  v340 = *(_QWORD *)(v55 - 216);
  *(_BYTE *)(v337 + v340) = v334[BYTE3(v338) ^ 0x53] ^ 0x91;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 200)) = (v335[v338 ^ 0x95] - 82) ^ 0xAF;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 248)) = (v335[v197 ^ 0x64] - 82) ^ 0x27;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 184)) = v334[BYTE3(v197) ^ 0x6ELL] ^ 7;
  LODWORD(v321) = v336[BYTE1(v197) ^ 0x1FLL];
  HIDWORD(v219) = v321 ^ 0x24;
  LODWORD(v219) = (v321 ^ 0x40) << 24;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 208)) = (v219 >> 30) ^ 0x58;
  *(_BYTE *)(v337 + *(_QWORD *)(v55 - 160)) = v339[BYTE2(v338) ^ 0xC8] ^ 0x1F;
  return ((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a51 + 8 * ((1752 * ((((_DWORD)v340 - 1598061019 - 2 * (((_DWORD)v340 + 16) & 0x20BF8617)) ^ 0xA0BF8615) < v395)) ^ (v333 - 504))) - 12))(v338, 36, v336, v332, v339, 184, 200, 3275409245, a2, a3, v342, v343, v345, v347, v348, v349, v352, v355, v358,
           v360,
           v363,
           a15,
           a16,
           a17,
           v369,
           v374,
           v378,
           v383,
           v388,
           v395,
           v401,
           v407,
           v413,
           v418,
           v423,
           v429,
           v435,
           v440,
           v447,
           v452,
           v457,
           v462,
           v467,
           v471,
           v476,
           v481,
           v485,
           v488,
           v490,
           v493,
           a44,
           v494,
           v495,
           v496,
           v497,
           v498);
}

void sub_1B777D098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,int a60,int a61,int a62,int a63)
{
  uint64_t v63;

  *(_DWORD *)(v63 - 136) = a60 ^ 0xD189FC2F;
  *(_DWORD *)(v63 - 148) = a62 ^ 0x622BF59C;
  *(_DWORD *)(v63 - 140) = a63 ^ 0xEBE2AA4A;
  *(_DWORD *)(v63 - 144) = a61 ^ 0x5A44D7E2;
  JUMPOUT(0x1B777B3F8);
}

uint64_t sub_1B777D0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * (((((31 * (a5 ^ 0x522) - 1014) | 0x232) - 555) * (v5 != v6)) | a5)))();
}

uint64_t sub_1B777D124(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * (int)((((a4 - 37) ^ 0x3A2) * ((v4 >> 3) & 1)) ^ a4))
                                                           - ((a4 - 241) | 0x2B5u)
                                                           + 1015))(a1, a2, (v5 - v6));
}

uint64_t sub_1B777D15C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  int8x16x4_t v72;

  *(_DWORD *)(v67 - 128) = v66;
  *(_DWORD *)(v67 - 136) = v58;
  v68 = (a6 - 542) & v58;
  v69 = -v64;
  *(_DWORD *)(v67 - 140) = v68;
  v70 = (v69 + a2 + a1 + v63);
  v72.val[0].i64[0] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + (_BYTE)v63) & 0xF;
  v72.val[0].i64[1] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 10) & 0xF;
  v72.val[1].i64[0] = ((_BYTE)v69 + v62 + (_BYTE)a6 - 13) & 0xF;
  v72.val[1].i64[1] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 8) & 0xF;
  v72.val[2].i64[0] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 7) & 0xF;
  v72.val[2].i64[1] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 6) & 0xF;
  v72.val[3].i64[0] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 5) & 0xF;
  v72.val[3].i64[1] = ((_BYTE)v69 + (_BYTE)a2 + (_BYTE)a1 + 4) & 0xF;
  *(int8x8_t *)(v65 - 7 + v70) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v65 - 7 + v70), *(int8x8_t *)(v59 + (v70 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v61 + (v70 & 0xF) - 7), *(int8x8_t *)(v60 + (v70 & 0xF) - 7)))), (int8x8_t)0x6363636363636363), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v72, (int8x16_t)xmmword_1B77959B0), (int8x8_t)0x505050505050505)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a58 + 8 * ((856 * (v69 != 8 - v68)) ^ (a6 - 200))) - 12))((__n128)xmmword_1B77959B0);
}

void sub_1B777D2A0()
{
  JUMPOUT(0x1B777D1CCLL);
}

uint64_t sub_1B777D2C8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((((v0 + 593) | 0xA5) - 822) ^ v0 ^ 0x2F6)
                                          * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 140))) ^ v0))
                            - 4))();
}

uint64_t sub_1B777D30C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a3 - 707298677);
  *(_BYTE *)(v9 + v11) ^= *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)(v7 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0x63;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((a5 - 450) | (2 * (a3 - 1 == v5)))) - 4))();
}

void sub_1B777D36C()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 189523770)
    v1 = 1973469985;
  else
    v1 = -1973446407;
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_1B777D3D0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  int v7;
  char v8;
  int v9;
  int v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  int v15;
  char *v16;
  char v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = 3804331 * ((a1 & 0x499EDE0F | ~(a1 | 0x499EDE0F)) ^ 0x4CFFD2A6);
  v2 = *(_DWORD *)(a1 + 32) + v1;
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 68) - v1;
  v9 = 689693747;
  v10 = 561217817;
  v11 = &v18;
  v14 = 689693684;
  v15 = 561217817;
  v16 = &v8;
  v12 = 0x21738119291BE475;
  v13 = &v17;
  if (v4 | v3)
    v6 = v5 == 575680361;
  else
    v6 = 1;
  v7 = !v6;
  __asm { BR              X9 }
}

uint64_t sub_1B777D51C@<X0>(int a1@<W8>)
{
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[7] != 0x2AFF1EFB499E23D0 && (v1[3] | v1[6]) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((19 * v4) ^ a1)) - ((a1 + 1238) ^ 0x674)))();
}

uint64_t sub_1B777D570(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *v3;
  *(_DWORD *)(v2 - 0x2AFF1EFB499E23D0) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4
                                                     + 8
                                                     * (((4 * (v5 == 0x709331AC20D1CC09)) | ((v5 == 0x709331AC20D1CC09) << 7)) ^ v1)))(a1, 460628867);
}

uint64_t sub_1B777D630@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int v34;

  v33 = &a29 + a3;
  v34 = ((2 * (((v32 - 144) ^ 0x16D8BC94) & 0x7EE300A8) - ((v32 - 144) ^ 0x16D8BC94) + 18677589) ^ 0x5B52C1BC) * a2;
  *(_DWORD *)(v32 - 144) = 1662105310 - v34;
  *(_QWORD *)(v32 - 136) = v33;
  *(_DWORD *)(v32 - 128) = v34 + v29 + 1252;
  sub_1B7780BBC((_DWORD *)(v32 - 144));
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v30
                                                               + 8
                                                               * (((((v31 == 0) ^ (3 * (v29 ^ 0x79))) & 1)
                                                                 * ((v29 + 1015) ^ 0x598)) ^ (v29 + 1396)))
                                                   - 8))(a1, 460628867);
}

uint64_t sub_1B777D71C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  BOOL v32;

  v28 = v20 ^ 0x165;
  v29 = (((~(v27 - 144) & 0x34F71EA) - (~(v27 - 144) | 0x34F71EB)) ^ 0x4FD9F396) * a2;
  *(_DWORD *)(v27 - 128) = v21 + v29 + 704136363 + (v20 ^ 0x165);
  *(_DWORD *)(v27 - 136) = v29 + v20 - 1129;
  *(_QWORD *)(v27 - 120) = v26;
  *(_QWORD *)(v27 - 144) = v25;
  v32 = a1 == 0;
  ((void (*)(uint64_t))(*(_QWORD *)(v23 + 8 * (v20 & 0x6EA68A1C)) - 8))(v27 - 144);
  *(_QWORD *)(v27 - 144) = v22;
  *(_QWORD *)(v27 - 136) = a19;
  *(_DWORD *)(v27 - 128) = (v28 - 92) ^ (235795823
                                       * ((((v27 - 144) | 0xB1470161) - (v27 - 144) + ((v27 - 144) & 0x4EB8FE98)) ^ 0x25EA4838));
  (*(void (**)(uint64_t))(v23 + 8 * (v28 ^ 0x445)))(v27 - 144);
  *(_DWORD *)(v27 - 120) = v28
                         + 1374699841 * (((v27 - 144) & 0x8FF7030B | ~((v27 - 144) | 0x8FF7030B)) ^ 0x1DFCE4FD)
                         - 51;
  *(_QWORD *)(v27 - 112) = a19;
  *(_QWORD *)(v27 - 104) = a18;
  *(_QWORD *)(v27 - 144) = v22;
  *(_QWORD *)(v27 - 136) = a20;
  *(_QWORD *)(v27 - 128) = a14;
  v30 = (*(uint64_t (**)(uint64_t))(v23 + 8 * (v28 ^ 0x421)))(v27 - 144);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * ((((v32 ^ (v28 + 7)) & 1) * (13 * (v28 ^ 0x4EB) + 255)) ^ v28)))(v30);
}

uint64_t sub_1B777D994()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  int v10;
  _DWORD *v11;

  v6 = ((((v5 - 144) | 0x2D06D1B1) - ((v5 - 144) & 0x2D06D1B1)) ^ 0xCD9AB39A) * v9;
  *(_QWORD *)(v5 - 136) = v8;
  *(_QWORD *)(v5 - 128) = v3;
  *(_DWORD *)(v5 - 144) = ((v4 & 0xF8EB9F7) + 530) ^ v6;
  *(_DWORD *)(v5 - 140) = v1 - v6 + 470137479 + (v4 & 0xF8EB9F7 ^ 0x151);
  result = (*(uint64_t (**)(uint64_t))(v2 + 8 * ((v4 & 0xF8EB9F7) - 152)))(v5 - 144);
  *v11 = v10;
  *(_DWORD *)(v0 + 64) = 1973469985;
  return result;
}

void sub_1B777DAD0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 40) ^ (1759421093 * ((-746607788 - (a1 | 0xD37FAB54) + (a1 | 0x2C8054AB)) ^ 0x9FFDE4FF));
  __asm { BR              X14 }
}

void sub_1B777DC04(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a1 + a2) = 561217817;
}

void sub_1B777EAD0(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((2 * (a1 & 0x5E99CC2A) - a1 - 1587137579) ^ 0xAB923DFA);
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05) - 561217817 >= 0)
    v2 = *(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05) - 561217817;
  else
    v2 = 561217817 - *(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05) - 561217817 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05) - 561217817;
  else
    v3 = 561217817 - *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05);
  v6 = *(_QWORD *)a1;
  v5 = v1 + 535753261 * (((&v5 | 0x96489038) - (&v5 & 0x96489038)) ^ 0x9CBC9E17) + 863;
  sub_1B7777100((uint64_t)&v5);
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  __asm { BR              X15 }
}

uint64_t sub_1B777EC58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;

  v10 = 4 * (v6 + v4);
  v11 = (*(_DWORD *)(*(_QWORD *)(v9 - 0x709331AC20D1CC01) + v10) ^ v5)
      - (*(_DWORD *)(*(_QWORD *)(v8 - 0x709331AC20D1CC01) + v10) ^ v5);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x709331AC20D1CC01) + v10) = v11 + ((9 * (v3 ^ 0x160)) ^ (v5 - 577)) - (v7 & (2 * v11));
  v12 = v6 + 176237105 < (int)(v2 + 459050490);
  if (v2 > 0x64A37205 != v6 + 176237105 < -1688433158)
    v12 = v2 > 0x64A37205;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((126 * !v12) ^ v3)) - 12))();
}

uint64_t sub_1B777ED80()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v5 = v2 + 2146982265 > 282312002 || v2 + 2146982265 < v3 - 1865171645;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1867 * v5) ^ v1)) - 101 * (v1 ^ 0x2CCu) + 1099))();
}

uint64_t sub_1B777EDD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL4 v16;

  v12 = 4 * (v9 + v7);
  v13 = v2 - 1016108647 + (*(_DWORD *)(*(_QWORD *)(v11 - 0x709331AC20D1CC01) + v12) ^ v8);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x709331AC20D1CC01) + v12) = v13 + v8 - (v10 & (2 * v13));
  v14 = v9 + 1 + v3;
  v16 = v14 > v5 || v14 < v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((49 * v16) ^ ((v4 ^ 0x31) - 47))) - 12))();
}

uint64_t sub_1B777EEAC(int a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 + 492280958 < (int)(v3 + 775094344);
  if (v3 > 0x51CCFFB7 != v2 + 492280958 < (int)((a1 + 310) ^ 0xAE3301CB ^ (3 * (a1 ^ 0x50D))))
    v4 = v3 > 0x51CCFFB7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((539 * v4) ^ a1)) - 8))();
}

uint64_t sub_1B777EF30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  _BOOL4 v18;

  v14 = v12 > v7;
  v15 = 4 * (v10 + v8);
  v16 = ((v5 + 383) ^ 0xC36F6C17) + v2 + (*(_DWORD *)(*(_QWORD *)(v13 - 0x709331AC20D1CC01) + v15) ^ 0x8A7B1943);
  *(_DWORD *)(*(_QWORD *)(a1 - 0x709331AC20D1CC01) + v15) = v16 + v9 - (v11 & (2 * v16));
  LODWORD(v15) = v10 + 1 + v4;
  v17 = v14 ^ ((int)v15 < v3);
  v18 = (int)v15 < v6;
  if (!v17)
    v14 = v18;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((89 * !v14) ^ v5)) - 8))();
}

uint64_t sub_1B777F020()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((23 * (v1 == 0x7E73F30E3C909666)) ^ v2))
                            - (((v2 - 1356) | 0x110u)
                             + 368)
                            + 697))();
}

uint64_t sub_1B777F068()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((39 * (((3 * (v1 ^ 0x396)) ^ (v2 - 1030)) + v3 > 0x7FFFFFFE)) ^ v1))
                            - 8))();
}

uint64_t sub_1B777F0A4(int a1)
{
  uint64_t v1;
  unsigned int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((715 * (v2 < 0x7FFFFFFF)) ^ (((a1 + 1096390128) & 0xBEA6675B) + 755)))
                            - ((a1 + 1096390128) & 0xBEA6675B ^ 0x22C)
                            + 885))();
}

uint64_t sub_1B777F114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((126
                                          * (*(_DWORD *)(*(_QWORD *)(a1 - 0x709331AC20D1CC01)
                                                       + 4
                                                       * (((((((v2 - 885) | 0x432) - 1002) | 0x101) + 556) ^ (v3 + 786))
                                                        + v5)) != v4)) ^ ((v2 - 885) | 0x432)))
                            - 8))();
}

uint64_t sub_1B777F178()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v1 ^ (1849 * ((v3 + v2 - 2) > 0x7FFFFFFE)))) - 8))();
}

uint64_t sub_1B777F1E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((126
                                          * (*(_DWORD *)(v1
                                                       + 4
                                                       * (((((v2 - 1002) | 0x101) + 556) ^ (v3 + 786)) + v5)) != v4)) ^ v2))
                            - 8))();
}

void sub_1B777F228(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0x709331AC20D1CC05) = (((v3 + v2) * (v1 - 135985007)) ^ 0x2BF7C91F)
                                         - 176441350
                                         + ((2 * (v3 + v2) * (v1 - 135985007)) & 0x57EF923E);
}

void sub_1B777F388(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B777F3F0()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((253 * (v0 != 1123162719)) ^ 0x618u)) - 8))();
}

uint64_t sub_1B777F424@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int v14;

  v4 = v1 - (**(_BYTE **)(v3 + 8) == 0);
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 528) = 689693747;
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 532) = 561217817;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 536) = *(_QWORD *)(v2 + 96) + 544;
  v5 = *(_QWORD *)(v2 + 96) + 0x709331AC20D1CE19;
  v6 = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  v7 = 108757529 * ((&v10 & 0xE05670F8 | ~(&v10 | 0xE05670F8)) ^ 0xFF35ED2C);
  v11 = 1199 - v7;
  v14 = v4 - v7 + 427528670;
  v12 = v6;
  v10 = v5;
  ((void (*)(uint64_t *))(*(_QWORD *)(a1 + 296) - 4))(&v10);
  v8 = v13;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 512) = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  return (-1242343481 * v8 + 1436662369);
}

void sub_1B777F578()
{
  uint64_t v0;
  int v1;

  v0 = MEMORY[0x1E0C80A78]();
  v1 = *(_DWORD *)(v0 + 16) ^ (3804331 * (v0 ^ 0xFA9EF356));
  __asm { BR              X13 }
}

uint64_t sub_1B777F6C4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(_DWORD *)(v4 + v1) = v0;
  *(_QWORD *)(v5 - 144) = v7;
  *(_QWORD *)(v5 - 136) = v4;
  *(_DWORD *)(v5 - 128) = (((v2 - 1260) | 0xD0) + 352) ^ (((2 * ((v5 - 144) & 0x10B13918) - (v5 - 144) + 1867433699) ^ 0x8FD2A4C8)
                                                        * v3);
  return sub_1B774F400(v5 - 144);
}

uint64_t sub_1B7780BBC(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  v1 = 460628867 * ((2 * (a1 & 0x1FF5D3B4) - (_DWORD)a1 - 536204213) ^ 0xAC9CAE36);
  v2 = a1[4] - v1;
  v3 = v1 + *a1;
  v5 = v3 - 1662039773;
  v4 = (int)(v3 - 1662039773) < 0;
  LODWORD(v6) = 1662039773 - v3;
  if (v4)
    v6 = v6;
  else
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + (int)(v2 ^ 0x65E))
                                        + 8 * (int)((23 * (v6 == ((2 * (_DWORD)v6) & 0x7FB42ECE))) ^ v2)
                                        - 4)
                            - (v2
                             + 19)
                            + 1685))();
}

void sub_1B7780C7C(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 - 0x709331AC20D1CC05) = a1;
}

void sub_1B7780CDC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD, void (*)());
  char v6;
  char v7;

  v2 = (unint64_t)&v7 ^ qword_1EF181920 ^ qword_1EF181918;
  v3 = 792496711 * v2 + 0x3620D3564722E72;
  v4 = 792496711 * (v2 ^ 0x3620D3564722E72);
  qword_1EF181920 = v3;
  v5 = (void (*)(_QWORD, void (*)()))*(&off_1E6CBBAA0
                                                + ((71 * (v3 ^ 0x72 ^ v4)) ^ byte_1B779D440[byte_1B7799C00[(71 * (v3 ^ 0x72 ^ v4))] ^ 0x93])
                                                + 186);
  v6 = byte_1B779D340[byte_1B7799B00[(71 * ((v4 + v3) ^ 0x72))] ^ 0xE1];
  qword_1EF181918 = v4;
  v5(*(&off_1E6CBBAA0 + ((71 * ((v4 + v3) ^ 0x72)) ^ v6) + 74), sub_1B778DFE0);
  __asm { BR              X10 }
}

uint64_t sub_1B7780DF0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(void))(v0 + 8 * ((235 * (**(_QWORD **)(v1 + 1672) == 0)) ^ 0x61Eu)))();
}

uint64_t sub_1B7780E28@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 1580)))(v1);
}

void sub_1B7780E44(uint64_t a1)
{
  int v1;

  v1 = 1224239923 * (((a1 | 0xC16B5AED) - (a1 & 0xC16B5AED)) ^ 0x33D8A73A);
  __asm { BR              X14 }
}

uint64_t sub_1B7780F10@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v5 = ((v3 + 443) ^ 0xD9752209) & (v4 + 1432991188);
  v6 = 535753261 * ((2 * (v8 & 0x19DC95B8) - v8 + 1713596992) ^ 0x6CD7646F);
  v9 = a1;
  v8[0] = v3 - v6 + 881;
  v8[1] = v1 + v6 - v5 + 393177915;
  return ((uint64_t (*)(_DWORD *))(*(_QWORD *)(v2 + 8 * (v3 - 108)) - 12))(v8);
}

void sub_1B7781038(_DWORD *a1)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  _DWORD *v8;
  char *v9;
  int v10;
  _BOOL4 v11;
  _QWORD v12[3];
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  _DWORD *v21;
  int v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  char v31;
  char v32;
  char v33;
  char v34;
  int v35;
  _DWORD v36[4];
  unint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = a1[7] + 3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742);
  v30 = a1[8] ^ (3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742));
  v3 = (v2 + 117) | 0xA;
  v4 = 628203409 * ((v36 - 571354846 - 2 * (v36 & 0xDDF1D122)) ^ 0x5F79DD11);
  v5 = a1[2];
  v20 = 3804331
      * ((((2 * (_QWORD)a1) | 0xC140CD485B2BA828) - (_QWORD)a1 + 0x1F5F995BD26A2BECLL) ^ 0x892B1DF1D70B2742);
  v6 = v5 + 3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742);
  v36[0] = v2 + v4 + 1172345356;
  v36[2] = v4 + 2122148333;
  v27 = &STACK[0xD547898781B12CC];
  v37 = &STACK[0xD547898781B12CC];
  sub_1B7776B68((uint64_t)v36);
  v7 = v30;
  v8 = a1;
  v9 = (char *)*(&off_1E6CBBAA0 + (int)(v2 ^ 0x9B)) - 4;
  v28 = *(_QWORD *)&v9[8 * v2] - 12;
  v19 = v6 + 885875559;
  v18 = v6 + 1162405452;
  v16 = (v3 ^ 0xD821768F) + v6;
  v15 = v6 + 1169223053;
  v12[2] = &v12[-61214183];
  v12[1] = (char *)&v12[-61214225] + 3;
  v14 = v2 + 547876214;
  v13 = v2 - 817998016;
  v22 = v2 ^ 0x666;
  v17 = v2 ^ 0x666;
  v29 = v2;
  v24 = vdupq_n_s32(0x75A0C321u);
  v25 = vdupq_n_s32(0x75A0C33Bu);
  v23 = vdupq_n_s32(0x75A0C337u);
  v21 = v8;
  v26 = *((_QWORD *)v8 + 2);
  v10 = v7 - (((v7 << ((v3 ^ 0xAB) - 100)) + 27056706) & (((v3 - 292401423) & 0x116DB6F9) + 36395213)) + 1441012964;
  v31 = (HIBYTE(v10) ^ 0x81) - 2 * ((HIBYTE(v10) ^ 0x81) & 0x6B ^ HIBYTE(v10) & 8) + 99;
  v32 = (BYTE2(v10) ^ 0x15) + (~(2 * (BYTE2(v10) ^ 0x15)) | 0x39) + 100;
  v33 = (BYTE1(v10) ^ 0xAF) - ((2 * (BYTE1(v10) ^ 0xAF)) & 0xC7) + 99;
  v34 = (v7 - ((((_BYTE)v7 << ((v3 ^ 0xAB) - 100)) + 66) & (((v3 - 15) & 0xF9) - 51)) - 28) ^ 0xA0;
  v11 = ((2 * v35) & 0x7C ^ 0x24) + (v35 & 0x3F ^ 0x78E5BD6Du) - 2028322234 > 0xFFFFFFBF;
  __asm { BR              X15 }
}

uint64_t sub_1B7781454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  v12 = v10 + (v7 ^ 0x871A443A);
  if (v12 <= 0x40)
    v12 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 + 8 * (((2028322173 - v8 - v9 + v12 < 0xF) * ((v7 - 1358925498) & 0x50FF89FF ^ 0x1A5)) ^ v7)) - 8))(a1, a2, a3, a4, a5, a6, a7, 1832265140);
}

uint64_t sub_1B77814E8()
{
  unsigned int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  _BOOL4 v7;

  v5 = v2 + v1;
  v6 = v5 + ((v0 + 353) ^ 0x871A437C);
  if (v6 <= 0x40)
    v6 = 64;
  v7 = !__CFADD__(v5 - 2028322174, v3 + v6);
  return (*(uint64_t (**)(void))(v4 + 8 * ((267 * v7) ^ v0)))();
}

uint64_t sub_1B7781548@<X0>(int a1@<W0>, uint64_t a2@<X3>, _OWORD *a3@<X5>, int a4@<W8>)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)(a2 + (a4 + a1)) = *a3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((266 * ((v4 ^ 0x276) - 142 == ((v5 + 1) & 0x1FFFFFFF0))) ^ v4))
                            - 12))();
}

uint64_t sub_1B77815A0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8 * (int)(((((73 * (v2 ^ 0x99) + 431161326) & 0xE64CFE5F) - 38) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1B77815E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,int a52,unsigned int a53,unsigned int a54,int a55,int a56,int a57,unsigned __int8 a58)
{
  int v58;
  int v59;
  int32x4_t *v60;
  uint64_t v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int8x16_t v69;
  int8x16_t v70;
  int32x4_t v71;
  int8x16_t v72;
  uint64_t (*v73)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint8x16_t v77;
  uint16x8_t v78;
  int8x16_t v79;
  int8x16_t v80;
  uint16x8_t v81;
  int8x16_t v82;
  int8x16_t v83;
  uint8x16_t v84;
  uint16x8_t v85;
  uint16x8_t v86;
  uint8x16_t v87;
  int8x16_t v90;
  int8x16_t v95;
  int32x4_t v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint8x16_t v103;
  uint16x8_t v104;
  uint16x8_t v105;
  uint8x16_t v106;
  uint8x16_t v111;
  uint16x8_t v112;
  uint16x8_t v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  int32x4_t v117;
  __int32 *v118;
  int v119;
  unsigned int v120;
  unint64_t v121;
  uint64_t v122;
  int8x16x4_t v123;
  int8x16x4_t v124;

  v73 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 8 * v58);
  v74 = a53;
  v75 = a58 ^ 0x5C;
  if (v75 == 2)
  {
    v124 = vld4q_s8((const char *)&a42 + 4);
    v103 = (uint8x16_t)veorq_s8(v124.val[0], v69);
    v104 = vmovl_u8(*(uint8x8_t *)v103.i8);
    v105 = vmovl_high_u8(v103);
    v106 = (uint8x16_t)veorq_s8(v124.val[1], v69);
    _Q17 = vmovl_u8(*(uint8x8_t *)v106.i8);
    _Q16 = vmovl_high_u8(v106);
    __asm
    {
      SHLL2           V18.4S, V16.8H, #0x10
      SHLL2           V19.4S, V17.8H, #0x10
    }
    v111 = (uint8x16_t)veorq_s8(v124.val[2], v69);
    v112 = vmovl_high_u8(v111);
    v113 = vmovl_u8(*(uint8x8_t *)v111.i8);
    v124.val[0] = veorq_s8(v124.val[3], v69);
    v124.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v124.val[0]);
    v124.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v124.val[1]);
    v124.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v124.val[1].i8);
    v124.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v124.val[0].i8);
    v124.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v124.val[0]);
    v124.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v124.val[0].i8);
    v114 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q17.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v113.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v104.i8), 0x18uLL)), v124.val[0]);
    v115 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q19, (int8x16_t)vshll_high_n_u16(v113, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v104), 0x18uLL)), v124.val[3]);
    v116 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q16.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v112.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v105.i8), 0x18uLL)), v124.val[1]);
    v117 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q18, (int8x16_t)vshll_high_n_u16(v112, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v105), 0x18uLL)), v124.val[2]);
    v124.val[0] = veorq_s8(vandq_s8((int8x16_t)v114, v70), (int8x16_t)(*(_OWORD *)v124.val & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v124.val[3] = veorq_s8(vandq_s8((int8x16_t)v115, v70), (int8x16_t)(*(_OWORD *)&v124.val[3] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v124.val[1] = veorq_s8(vandq_s8((int8x16_t)v116, v70), (int8x16_t)(*(_OWORD *)&v124.val[1] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v124.val[2] = veorq_s8(vandq_s8((int8x16_t)v117, v70), (int8x16_t)(*(_OWORD *)&v124.val[2] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v60[2] = vaddq_s32(vsubq_s32(v116, vaddq_s32((int32x4_t)v124.val[1], (int32x4_t)v124.val[1])), v71);
    v60[3] = vaddq_s32(vsubq_s32(v117, vaddq_s32((int32x4_t)v124.val[2], (int32x4_t)v124.val[2])), v71);
    *v60 = vaddq_s32(vsubq_s32(v114, vaddq_s32((int32x4_t)v124.val[0], (int32x4_t)v124.val[0])), v71);
    v60[1] = vaddq_s32(vsubq_s32(v115, vaddq_s32((int32x4_t)v124.val[3], (int32x4_t)v124.val[3])), v71);
    v118 = &v60[164799233].i32[v66];
    v119 = *(v118 - 8) ^ *(v118 - 3);
    v120 = *(v118 - 16) ^ *(v118 - 14) ^ (v119 + v63 - ((2 * v119) & 0xEB418642));
    HIDWORD(v121) = v120 ^ v63;
    LODWORD(v121) = v120;
    *v118 = (v121 >> 31) + v63 - ((2 * (v121 >> 31)) & 0xEB418642);
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v61 + 8 * ((405 * (v65 != 659196869)) ^ v59)) - 12))(1661390);
  }
  else if (v75 == 1)
  {
    v123 = vld4q_s8((const char *)&a42 + 4);
    v76 = (v62 - 79) | 0x206u;
    v77 = (uint8x16_t)veorq_s8(v123.val[0], v69);
    v78 = vmovl_u8(*(uint8x8_t *)v77.i8);
    v79 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v78.i8);
    v80 = (int8x16_t)vmovl_high_u16(v78);
    v81 = vmovl_high_u8(v77);
    v82 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v81.i8);
    v83 = (int8x16_t)vmovl_high_u16(v81);
    v84 = (uint8x16_t)veorq_s8(v123.val[1], v69);
    v85 = vmovl_high_u8(v84);
    v86 = vmovl_u8(*(uint8x8_t *)v84.i8);
    v87 = (uint8x16_t)veorq_s8(v123.val[2], v69);
    _Q21 = (int8x16_t)vmovl_high_u8(v87);
    _Q20 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v87.i8);
    v90 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL);
    __asm { SHLL2           V20.4S, V20.8H, #0x10 }
    v95 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
    __asm { SHLL2           V21.4S, V21.8H, #0x10 }
    v123.val[0] = veorq_s8(v123.val[3], v69);
    v123.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v123.val[0]);
    v123.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v123.val[1]);
    v123.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v123.val[0].i8);
    v123.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v123.val[0]);
    v123.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v123.val[0].i8), 0x18uLL), v90), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v86.i8, 8uLL), v79));
    v123.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v123.val[3], 0x18uLL), _Q20), vorrq_s8((int8x16_t)vshll_high_n_u16(v86, 8uLL), v80));
    v123.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v123.val[1].i8), 0x18uLL), v95), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v85.i8, 8uLL), v82));
    v123.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v123.val[2], 0x18uLL), _Q21), vorrq_s8((int8x16_t)vshll_high_n_u16(v85, 8uLL), v83));
    v96 = (int32x4_t)veorq_s8(vandq_s8(v123.val[0], v72), (int8x16_t)(*(_OWORD *)&v79 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v97 = (int32x4_t)veorq_s8(vandq_s8(v123.val[3], v72), (int8x16_t)(*(_OWORD *)&v80 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v98 = (int32x4_t)veorq_s8(vandq_s8(v123.val[1], v72), (int8x16_t)(*(_OWORD *)&v82 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v99 = (int32x4_t)veorq_s8(vandq_s8(v123.val[2], v72), (int8x16_t)(*(_OWORD *)&v83 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v60[2] = vaddq_s32(vsubq_s32((int32x4_t)v123.val[1], vaddq_s32(v98, v98)), v71);
    v60[3] = vaddq_s32(vsubq_s32((int32x4_t)v123.val[2], vaddq_s32(v99, v99)), v71);
    *v60 = vaddq_s32(vsubq_s32((int32x4_t)v123.val[0], vaddq_s32(v96, v96)), v71);
    v60[1] = vaddq_s32(vsubq_s32((int32x4_t)v123.val[3], vaddq_s32(v97, v97)), v71);
    v100 = *(_QWORD *)(v68 + 8 * (int)(v76 ^ 0x210));
    v101 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 + 8 * (int)v76) - 8);
    return v101(v74, *(_QWORD *)(v68 + 8 * (int)(v76 ^ 0x2CC)) - 8, *(_QWORD *)(v68 + 8 * (int)(v76 ^ 0x2B7)), v100, v76, v65 - 15, v101, -(*(_BYTE *)(v100+ (((_DWORD)v76 + 1952553977) & 0x8B9E6635 ^ (unint64_t)(v66 - 979))+ v65- 16)- 23), a9, a10, a11, a12, a13, a14, a15,
             a16,
             a17,
             a18,
             a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25);
  }
  else
  {
    v122 = a54;
    a52 = 2 * (a52 ^ v67) + v67 - (v64 & (4 * (a52 ^ v67)));
    a53 = 2 * (a53 ^ v67) + v67 - (v64 & (4 * (a53 ^ v67)));
    a54 = 2 * (a54 ^ v67) + v67 - (v64 & (4 * (a54 ^ v67)));
    a55 = 2 * (a55 ^ v67) + v67 - (v64 & (4 * (a55 ^ v67)));
    HIDWORD(a32) = a58 ^ 0x5C;
    return v73(v122, v73, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a8,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44);
  }
}

uint64_t sub_1B77824E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((((a3 + a8 + 132) > 0xFFFFFFFA) * ((v9 - 26) ^ 0x3F)) ^ (v9 + 536)))
                            - 4))();
}

uint64_t sub_1B7782528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, unsigned int a19, uint64_t a20,uint64_t a21,int a22,int a23)
{
  uint64_t v23;
  int v24;
  _BOOL4 v25;

  if (a19 < 0x41B485CC != (a16 + 1043862115) < 0x41B485CC)
    v25 = (a16 + 1043862115) < 0x41B485CC;
  else
    v25 = a16 + 1043862115 > a19;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v23
                                                               + 8 * ((v25 * ((a23 - 316) ^ 0x310)) ^ (v24 + 929)))
                                                   - 12))(3784058018, 3593480856);
}

uint64_t sub_1B77825C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v28;
  int v29;
  uint64_t v30;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v30
                                                               + 8
                                                               * ((21
                                                                 * (v29 + v28 + 63 < (a21 ^ 0x666)
                                                                                   + v28
                                                                                   + (((a21 - 553) | 0x8B) ^ (v29 - 980)))) ^ a21))
                                                   - 12))(1734, a28);
}

uint64_t sub_1B778262C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  char v7;
  char v8;
  int v9;
  int v10;
  uint64_t v11;

  *(_BYTE *)(a4 + v5) = (((v6 + 117) | v7) ^ v8)
                      + *(_BYTE *)(a2 + (v4 + v9))
                      - ((2 * *(_BYTE *)(a2 + (v4 + v9))) & 0xC7);
  return (*(uint64_t (**)(void))(v11 + 8 * (((v5 == 63) * v10) ^ v6)))();
}

void sub_1B7782678()
{
  JUMPOUT(0x1B7781960);
}

uint64_t sub_1B77826A4@<X0>(int a1@<W0>, uint64_t a2@<X1>, int8x16_t *a3@<X3>, int a4@<W8>)
{
  int v4;
  int v5;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v8;

  *a3 = vaddq_s8(vsubq_s8(*(int8x16_t *)(a2 + (v4 + v5)), vandq_s8(vaddq_s8(*(int8x16_t *)(a2 + (v4 + v5)), *(int8x16_t *)(a2 + (v4 + v5))), v7)), v8);
  return (*(uint64_t (**)(void))(v6 + 8 * (((a4 == 127) * a1) ^ (a4 + 459))))();
}

uint64_t sub_1B77826F8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((972
                                              * ((a1 ^ 0xBF ^ ((v1 & 0xFFFFFFFC) == ((a1 - 139) ^ 0x6D3625FB))) & 1)) ^ a1)))(2547668614);
}

uint64_t sub_1B7782754@<X0>(int a1@<W0>, uint64_t a2@<X3>, int a3@<W4>, uint64_t a4@<X5>, int a5@<W6>, int a6@<W8>)
{
  int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  *(_BYTE *)(a2 + (a6 + a1)) = *(_BYTE *)(a4 + v7 + a3);
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (((((v7 + 1) & 0xFFFFFFFCLL) == (v6 ^ 0x773 ^ v9 ^ (unint64_t)(v8 + 71))) * a5) ^ v6 ^ 0x773)))();
}

uint64_t sub_1B77827A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t (*a29)(uint64_t))
{
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;

  v32 = 3804331 * ((2 * ((v31 - 168) & 0x80D3920) - (v31 - 168) + 2012399321) ^ 0x8D6C358F);
  *(_DWORD *)(v31 - 168) = v32 + v29 + 487;
  *(_DWORD *)(v31 - 164) = v32 ^ 0x52980FF6;
  *(_QWORD *)(v30 + 384) = a28;
  v33 = sub_1B776B710(v31 - 168);
  return a29(v33);
}

uint64_t sub_1B7782818(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  _BOOL4 v18;
  unsigned int v19;
  int v20;
  _BOOL4 v21;

  v18 = a14 < v16;
  v19 = v15 - 1170 + a1 + v14;
  v20 = v18 ^ (v19 < v16);
  v21 = v19 < a14;
  if (!v20)
    v18 = v21;
  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * ((27 * !v18) ^ v15)) - 4))();
}

uint64_t sub_1B7782870@<X0>(int a1@<W0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, unsigned int a6@<W5>, uint64_t a7@<X6>, int a8@<W8>)
{
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v13 = a3 < v11;
  *(_BYTE *)(a4 + (v9 ^ a6) + a2 + a8) = *(_BYTE *)(a7 + (v8 + v10))
                                       - ((2 * *(_BYTE *)(a7 + (v8 + v10))) & 0xC7)
                                       + 99;
  v14 = a1 + v8 + 92;
  v15 = v13 ^ (v14 < v11);
  v16 = v14 < a3;
  if (!v15)
    v13 = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((!v13 * a5) ^ v9)) - 4))();
}

uint64_t sub_1B77828E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,unsigned int a52)
{
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;

  v56 = 3804331 * ((2 * ((v55 - 168) & 0x1FC2CEE8) - (v55 - 168) - 532860654) ^ 0x1AA3C244);
  *(_QWORD *)(v52 + 384) = a28;
  *(_DWORD *)(v55 - 168) = v56 + v54 + 475;
  *(_DWORD *)(v55 - 164) = v56 ^ a13;
  v57 = sub_1B776B710(v55 - 168);
  v58 = a52 & ((v54 + 266970732) & 0xF0165DBF ^ 0x4B8);
  *(&a43 + (v58 ^ 0x13)) = -29;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v53 + 8 * ((831 * ((v58 ^ 0x13) > 0x37)) ^ v54))
                                          - (((v54 - 82) | 0x46u) ^ 0x4BLL)))(v57);
}

uint64_t sub_1B7782A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8 * ((14 * (((v8 - 44) ^ (v7 == ((9 * (v8 ^ 0x4A2)) ^ 0x172))) & 1)) ^ v8)))(99, 68, a3, a4, a5, a6, a7, 1789);
}

uint64_t sub_1B7782A60@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v1 ^ 0x13C) - 111) * ((a1 ^ 0x2Cu) > 7)) | v1))
                            - (v1 - 254)
                            + 67))();
}

uint64_t sub_1B7782A9C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(a10 + v11 + ((v12 + 152) | a2)) = v14;
  return (*(uint64_t (**)(void))(v13 + 8 * ((((v10 & 0x38) == 8) * a8) ^ v12)))();
}

uint64_t sub_1B7782ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v11 + (v8 | a2)) = v13;
  return (*(uint64_t (**)(void))(v12 + 8 * (((v10 == 0) * a8) ^ v9)))();
}

uint64_t sub_1B7782B04()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (665 * (v1 == v0)))) - (((v2 - 257) | 3u) ^ 0x43)))();
}

uint64_t sub_1B7782B44@<X0>(char a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a2 + a3 + v4) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (((a3 + v4 + (unint64_t)(v3 + 12) - 90 > 0x3F) * v5) ^ (v3 + 620)))
                            - 12))();
}

void sub_1B7782B7C()
{
  JUMPOUT(0x1B7781958);
}

uint64_t sub_1B7782BAC()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(uint64_t))(v1 + 8 * ((847 * (v0 + ((v2 + 162) ^ 0xE2CF8F4D) < 0x38)) ^ (v2 + 1051))))(493);
}

uint64_t sub_1B7782BF4@<X0>(int a1@<W8>)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = v1;
  v5 = (((a1 ^ 0x1D0u) - 210) ^ (unint64_t)(v2 + 54)) + v1;
  if (v5 <= 0x38)
    v5 = 56;
  return (*(uint64_t (**)(void))(v3 + 8 * (((v5 - v4 + 489713732 > 7) | (2 * (v5 - v4 + 489713732 > 7))) ^ a1)))();
}

uint64_t sub_1B7782C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(a11 + v13) = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((((v12 & 0xFFFFFFFFFFFFFFF8) == 8) * v14) ^ v11))
                            - ((v11 - 208) | 0xA0u)
                            + 237))();
}

uint64_t sub_1B7782C8C()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v2 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v3 == 0) * v4) ^ v0)) - v1 + 237))();
}

uint64_t sub_1B7782CB4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((((v2 - 165) | 3) + 1157) ^ ((v2 - 169) | 7)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1B7782CEC@<X0>(int a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_BYTE *)(a2 + a3 + v4) = v5;
  return (*(uint64_t (**)(void))(v6 + 8 * ((((unint64_t)(a3 + 1 + v4) < 0x38) * a1) ^ (v3 + 1051))))();
}

void sub_1B7782D18()
{
  JUMPOUT(0x1B778195CLL);
}

uint64_t sub_1B7782F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,int a58)
{
  uint64_t v58;
  int v59;
  int v61;
  unint64_t v62;

  if (a33 == 2)
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v58
                                                                 + 8
                                                                 * ((1798
                                                                   * ((((347 * (v59 ^ 0x4D)) ^ (a58 == 1024156329)) & 1) == 0)) ^ (v59 + 615)))
                                                     - 4))(a1, a14);
  if (a33 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58
                                                                          + 8
                                                                          * ((125
                                                                            * (a58 != ((v59 + 487) | 0x80) + 1024155635)) ^ (v59 + 615)))
                                                              - 4))(a1, a2, a14);
  v61 = 145 * (v59 ^ 0x4A);
  v62 = ((unint64_t)&a36 ^ 0x5DFD53F7BBBEDA94)
      - 0x10001002320E4794
      + (((_QWORD)&a36 << ((-111 * (v59 ^ 0x4A)) ^ 0xD4u)) & 0xBBFAA7EF777DB520);
  a57 = (v62 ^ (v61 - 27)) * (v62 + 17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 + 8 * v61) - 4))(a1, a2, a14);
}

void sub_1B77832D8()
{
  JUMPOUT(0x1B77832A8);
}

uint64_t sub_1B77832E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,int a40,char a41)
{
  int v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;

  v47 = v41 + 938;
  v48 = *a19;
  v49 = 235795823 * ((379724816 - ((v45 - 168) | 0x16A22410) + ((v45 - 168) | 0xE95DDBEF)) ^ 0x7DF092B6);
  v42[47] = &a41;
  v42[52] = &STACK[0x74538802C908E1B3];
  v42[49] = &a38;
  v42[50] = v48;
  *(_DWORD *)(v45 - 160) = v49 + 1157248585;
  *(_DWORD *)(v45 - 132) = (v41 + 1033) ^ v49;
  v50 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v46 + 8 * (v41 - 543)) - 12))(v45 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v43
                                                      + 8
                                                      * ((235
                                                        * ((v47 ^ (*(_DWORD *)(v45 - 136) == v44)) & 1)) ^ v47))
                                          - 12))(v50);
}

uint64_t sub_1B77833EC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 40) + v0 - 0x36A6CE4CB63F0F99)
     - *(unsigned __int8 *)(v5 + v0 - 0x36A6CE4CB63F0F99);
  v7 = ((v2 - 1584) ^ 0x4ELL) + v0;
  v9 = (v6 ^ 0xD82FD73D) + 1744632043 + ((2 * v6) & 0xB05FAE7A) != 1076678696 || v7 == v4 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((199 * v9) ^ v2)) - 12))();
}

uint64_t sub_1B7783478@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 1759421093 * ((v4 - 168 - 2 * ((v4 - 168) & 0x3CEE76D65605C96) + 0x3CEE76D65605C96) ^ 0x2D70263DD61DECC2);
  *(_QWORD *)(v2 + 400) = v1 - v5;
  *(_DWORD *)(v4 - 160) = a1 - v5 + 2021363698;
  *(_DWORD *)(v4 - 156) = ((a1 + 1051201844) ^ 0x37) - v5;
  *(_DWORD *)(v4 - 168) = ((a1 + 1051201844) | 0x7C) + v5;
  *(_DWORD *)(v4 - 164) = a1 + 1051201844 - v5;
  *(_QWORD *)(v2 + 416) = 1076678696 - v5;
  *(_DWORD *)(v4 - 152) = v5;
  v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + a1 + 109) - 8))(v4 - 168);
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * *(int *)(v4 - 136)))(v6);
}

void sub_1B7783544()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 12) = 1973469985;
}

void sub_1B7783590(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

uint64_t sub_1B77835D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1202 * (**(_BYTE **)(a2 + 8) == 0)) ^ v3)))();
}

uint64_t sub_1B7783600()
{
  uint64_t v0;
  int v1;
  int v2;

  v2 = v1 - ((2 * v1 + 2048641856) & 0x6171EFBE) + 1841749375;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1303
                                          * (((2 * v2) & 0xFDDA56D6 ^ 0x61504696) + (v2 ^ 0x4E55DCB4) + 2147473408 != 2129462123)) ^ 0x3CAu))
                            - 4))();
}

uint64_t sub_1B77836A4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * (a3 ^ (241 * ((v5 + v4 + 18011285) < 8))))
                            - (((a3 - 1864543634) & 0x2FA5u)
                             - 995)
                            + 666))();
}

uint64_t sub_1B7783704(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                        + 8
                                                                        * ((52
                                                                          * (v9 - a7 - 1167 >= ((a4 - 1498) ^ 0x8BuLL))) ^ a4))
                                                            - 12))(a1, a2, v8);
}

uint64_t sub_1B7783744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  unsigned int v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6
                                                                                + 8
                                                                                * ((1693
                                                                                  * (v7 >= ((a6 - 302008111) & 0xF79DDFFF)
                                                                                         + 442656420)) ^ a6))
                                                                    - 4))(a1, a2, 442656420, (a6 + 708));
}

uint64_t sub_1B7783790(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = v9 + ((a5 - 1815031165) & 0x869196D2 ^ 0x8112FE46);
  v11 = *(_OWORD *)(v6 + v10 - 15);
  v12 = *(_OWORD *)(v6 + v10 - 31);
  v13 = v7 + v10;
  *(_OWORD *)(v13 - 15) = v11;
  *(_OWORD *)(v13 - 31) = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((265 * ((v8 & 0xFFFFFFE0) == 32)) ^ (a3 + a5 + 685))) - 12))();
}

void sub_1B7783808()
{
  JUMPOUT(0x1B77837C8);
}

uint64_t sub_1B7783814(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 1424) = v2 + 1267475693 + ((v3 - 1056860430) | 0x249C0164);
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 520) = *(_QWORD *)(a2 + 8) + 1;
  return 0;
}

void sub_1B7783A0C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 24) - 460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86);
  v3 = *(_QWORD *)a1;
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05) - 561217817 >= 0)
    v4 = *(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05) - 561217817;
  else
    v4 = 561217817 - *(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05);
  v2 = *(_QWORD *)(a1 + 8);
  if (*(_DWORD *)(v2 - 0x709331AC20D1CC05) - 561217817 >= 0)
    v5 = *(_DWORD *)(v2 - 0x709331AC20D1CC05) - 561217817;
  else
    v5 = 561217817 - *(_DWORD *)(v2 - 0x709331AC20D1CC05);
  v7 = v1 + 535753261 * (((&v7 | 0xD1164399) - (&v7 & 0xD1164399)) ^ 0xDBE24DB6) + 1047;
  v8 = v3;
  sub_1B7777100((uint64_t)&v7);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  __asm { BR              X14 }
}

uint64_t sub_1B7783B98()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v4 = ((v1 - 241096409) & 0xE5ED3DF ^ 0xC274013) + v2;
  v5 = (v3 > 0x1A6AB5C1) ^ (v4 < (int)(v1 ^ 0xE59549AC));
  v6 = v4 < (int)(v3 + 1704282686);
  if (v5)
    v6 = v3 > 0x1A6AB5C1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v1 ^ (8 * !v6))) - 4))();
}

uint64_t sub_1B7783C24()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  int v3;
  _BOOL4 v4;

  v4 = v3 + 233002222 < (int)(v2 + 1733385890);
  if (v2 > ((v1 + 347) ^ 0x18AEA7E1u) != v3 + 233002222 < (int)(v1 ^ 0xE7515BC3))
    v4 = v2 > ((v1 + 347) ^ 0x18AEA7E1u);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v4 | (4 * v4)) ^ v1)) - 4))();
}

uint64_t sub_1B7783C98@<X0>(int a1@<W6>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v15 = v13 > v7;
  v16 = 4 * (v14 + v9);
  v17 = v4 + v11 + (*(_DWORD *)(*(_QWORD *)(a3 - 0x709331AC20D1CC01) + v16) ^ v12);
  *(_DWORD *)(*(_QWORD *)(a2 - 0x709331AC20D1CC01) + v16) = v17 + v12 - (v10 & (2 * v17));
  v18 = v14 + 1 + v5;
  LODWORD(v16) = v15 ^ (v18 < a1 + 663);
  v19 = v18 < v6;
  if (!(_DWORD)v16)
    v15 = v19;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((989 * v15) ^ (v8 - 878149455) & 0x34577DF3u)) - 4))();
}

uint64_t sub_1B7783DA0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((v2 ^ (v1 == 0x3E7F7211D3C1C63ELL)) & 1 | (2 * ((v2 ^ (v1 == 0x3E7F7211D3C1C63ELL)) & 1))) ^ v2))
                            - 12))();
}

void sub_1B7783DD4(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  *(_DWORD *)(*(_QWORD *)(a1 - 0x709331AC20D1CC01) + 4 * (v5 + v3)) = v1
                                                                        - ((17 * (v2 ^ 0x2A0) + 2 * v1 + 1484550891) & v4)
                                                                        - 1581047682;
  *(_DWORD *)(a1 - 0x709331AC20D1CC05) = (((v5 + 1 + v3) * (v6 - 135985007)) ^ 0xE97FD99D)
                                         + 938715004
                                         + ((2 * (v5 + 1 + v3) * (v6 - 135985007)) & 0xD2FFB33A);
}

void sub_1B77840D4(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B7784118(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (*(uint64_t (**)(void))(v1 + 1352))();
  if (v3 == 16)
    v4 = -42029;
  else
    v4 = -42030;
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  (*(void (**)(uint64_t))(v1 + 1808))(a1);
  return v5;
}

void sub_1B7784160(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  _BOOL4 v5;

  v1 = 235795823 * (((a1 | 0xDF39865F) - a1 + (a1 & 0x20C679A0)) ^ 0x4B94CF06);
  v2 = *(_DWORD *)(a1 + 24) - v1;
  v3 = *(_DWORD *)(a1 + 8) + v1;
  v5 = (v3 & 0x30000000) == 0x20000000 || (v3 & 0x3F000000) == 184549376;
  __asm { BR              X11 }
}

uint64_t sub_1B7784238@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, unint64_t *a7, char a8, unsigned int a9, unint64_t *a10, unint64_t *a11, int a12, uint64_t a13)
{
  int v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;

  v17 = 1374699841 * ((((2 * &a6) | 0xEF076246) - &a6 + 142364381) ^ 0x9A77A92A);
  a13 = *v14;
  a8 = 65 * ((((2 * &a6) | 0x46) - &a6 - 35) ^ 0x2A) + 122;
  a10 = &STACK[0x19D396D9A609BEB0];
  a11 = &STACK[0x15C2A15CF2725D91];
  a12 = v16 - v17 + 1495;
  a9 = ((2 * v13) & 0xFFD9C6FE ^ 0x94C180F0) - v17 + (v13 ^ 0xB59F206E ^ (v16 + 731)) + 1341898731;
  a7 = &STACK[0x68121A1912A1E19F];
  v18 = ((uint64_t (*)(int *))(*(_QWORD *)(a1 + 8 * (v16 + 39)) - 8))(&a6);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((1082 * (a6 == 1973469985)) ^ v16)) - 8))(v18);
}

uint64_t sub_1B7784360()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((((v2 ^ 0x692) + 227) * (v1 == 184549376)) ^ v2))
                            - ((v2 - 367) ^ 0x1F6)))();
}

uint64_t sub_1B7784398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  int v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8 * ((1017 * (a11 + 4 < a11)) ^ v11)))(a1, a2);
}

uint64_t sub_1B7784414()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((2 * v1) & 0xFDFAFF2A ^ 0x710ABE20)
                                           + (v1 ^ 0xC67AA0A5)
                                           + ((v0 + 211) ^ 0x55BEF3D6) == 1421637509)
                                          * (v0 - 793)) ^ v0))
                            - 12))();
}

uint64_t sub_1B778447C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((123 * (((v1 + v0 + ((v2 - 920) ^ 0x10280E5u) < 0xC) ^ (v2 - 1)) & 1)) ^ v2)))();
}

uint64_t sub_1B77844CC()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2021
                                          * (((v3 + v0 - ((((((v2 - 362) | 0x140) - 376) | 0x78) - 761) & v1)) & 0xFFFFFFFC) > v3 + v0 + 3)) ^ ((v2 - 362) | 0x140)))
                            - 4))();
}

uint64_t sub_1B7784524@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(a2 - 3 + (v5 + v3)) = *(_DWORD *)(v2 - 3 + (v5 + v3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((43 * (((a1 - 110) ^ 0x3D ^ (v4 == 4)) & 1)) ^ (a1 - 882)))
                            - 4))();
}

uint64_t sub_1B7784580()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 | (v1 == 0x3887DF30) | ((v1 == 0x3887DF30) << 8))) - 8))();
}

uint64_t sub_1B77845CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = v4 > v6;
  *(_BYTE *)(a1 + (v7 - 347621446)) = *(_BYTE *)(v1 + (v7 - 347621446));
  if (v9 == v7 + 1211017123 < v3)
    LOBYTE(v9) = v7 + 1211017123 < v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((((v2 - 1) ^ v9) & 1 | ((((v2 - 1) ^ v9) & 1) << 8)) ^ v2))
                            - 8))();
}

uint64_t sub_1B7784634@<X0>(int a1@<W1>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (a1 + 348172958) & 0xEB3F4AEF;
  a3.i32[0] = *(_DWORD *)(a2 + (v8 ^ 0x8B) + v6);
  *(_DWORD *)(a2 - 3 + (v5 + v3)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)(((v4 != 4) * (v8 + 492)) ^ v8)) - 4))();
}

uint64_t sub_1B77846A0(uint64_t a1, int a2, int a3, int16x8_t a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_DWORD *)(a1 + (v6 - a2)) = vmovn_s16(a4).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((a2 + 4 != v5) * a3) ^ v4)) - 4))();
}

uint64_t sub_1B77846CC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v2 ^ (91 * (v0 != v1)))) - (((v2 - 587) | 0x92u) - 364) + 138))();
}

uint64_t sub_1B7784700@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a2 + (v5 + v4)) = *(_BYTE *)(v2 + (v5 + v4));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((955 * (((a1 + 364) ^ 0xFFFFFE05) + v5 != v3)) ^ (a1 + 173))) - 8))();
}

uint64_t sub_1B7784740()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((624 * (*(_QWORD *)(v1 + 16) != 0x72E2FEF5BF4EA162)) ^ v0))
                            - ((v0 - 378) | 0xEu)
                            + 130))();
}

uint64_t sub_1B7784780@<X0>(uint64_t a1@<X8>, uint64_t a2, int a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)(a1 - 0x72E2FEF5BF4EA162) = a4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((1787 * (*(_QWORD *)(v5 + 32) != 0x6C0C7F2AED40EE91)) ^ (v4 - 1895443564) & 0x70FA2AFF))
                            - 8))();
}

void sub_1B77847EC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 0x6C0C7F2AED40EE91) = v2;
  *(_DWORD *)(v1 + 40) = 1973469985;
}

uint64_t sub_1B7784880(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  int v3;
  unsigned __int8 v4;
  char *v5;
  int v6;
  char v8;

  v2 = (unint64_t)&v8 ^ qword_1EF181928 ^ qword_1EF181918;
  qword_1EF181928 = 792496711 * v2 - 0x3620D3564722E72;
  qword_1EF181918 = 792496711 * (v2 ^ 0x3620D3564722E72);
  v3 = *(_DWORD *)(a2 + 4);
  v4 = 71 * ((qword_1EF181918 - (71 * v2 - 114)) ^ 0x72);
  v5 = (char *)*(&off_1E6CBBAA0 + (v4 ^ byte_1B77A4E20[byte_1B77A1430[v4] ^ 0x7C]) + 120)
     - 4;
  if (v3 == 1123162722)
    __asm { BR              X17 }
  if (v3 == 1123162729)
  {
    v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X2 }
  }
  return 4294925278;
}

uint64_t sub_1B7784F28(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 1225351577 * ((-1431559688 - (a1 ^ 0x3E1E26E0 | 0xAAAC21F8) + (a1 ^ 0x3E1E26E0 | 0x5553DE07)) ^ 0x15B262D5);
  v2 = *(_DWORD *)(a1 + 4) ^ v1;
  v3 = *(_DWORD *)(a1 + 16) ^ v1;
  if (v3 < 0)
    v3 = -v3;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05);
  v6 = v4 - 561217817;
  v5 = v4 - 561217817 < 0;
  v7 = 561217817 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)((char *)*(&off_1E6CBBAA0 + v2 - 868)
                                        + 8 * ((755 * (v3 >> 5 < v7)) ^ v2)
                                        - 4)
                            - 8))();
}

unsigned int *sub_1B7785000@<X0>(unsigned int *result@<X0>, int a2@<W8>)
{
  uint64_t v2;
  char v3;
  unsigned int v4;

  *result = ((*(_DWORD *)(*(_QWORD *)(v2 - 0x709331AC20D1CC01) + 4 * v4) ^ 0x7584E6BCu) >> v3) & 1 ^ a2;
  return result;
}

_DWORD *sub_1B7785038@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *result = a2;
  return result;
}

void sub_1B7785040(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1B77850E4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((475 * (*(_QWORD *)(v1 + 8) == 0)) ^ v0))
                            - ((v0 + 562966806) & 0xDE71CDFE)
                            + 506))();
}

uint64_t sub_1B778516C@<X0>(int a1@<W8>)
{
  uint64_t (*v1)(uint64_t *);
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;

  v6 = ((((&v8 | 0x5F7CCEDC) ^ 0xFFFFFFFE) - (~&v8 | 0xA0833123)) ^ 0x401F5308) * v2;
  v10 = v5;
  v9 = v6 ^ a1;
  v8 = 0x3E5369CC567B1177;
  v11 = 1780120389 - v6;
  v12 = v3 - v6 - 194;
  result = v1(&v8);
  *(_DWORD *)(v4 + 4) = *(_DWORD *)(v5 - 0x1E6EF7153090DAALL);
  return result;
}

void sub_1B7785430(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void (*v6)(_QWORD, void (*)());
  char v7;
  _BYTE v8[8];

  v2 = (unint64_t)&v8[qword_1EF181918 - qword_1EF181788];
  v3 = (792496711 * v2) ^ 0x3620D3564722E72;
  v4 = 792496711 * (v2 ^ 0x3620D3564722E72);
  v5 = byte_1B7799B00[(71 * (v3 ^ 0x72 ^ v4))];
  v6 = (void (*)(_QWORD, void (*)()))*(&off_1E6CBBAA0
                                                + ((71 * ((v4 - v3) ^ 0x72)) ^ byte_1B7799D00[byte_1B77A4D20[(71 * ((v4 - v3) ^ 0x72))] ^ 0x22])
                                                + 177);
  qword_1EF181788 = v3;
  v7 = byte_1B779D340[v5 ^ 6];
  qword_1EF181918 = v4;
  v6(*(&off_1E6CBBAA0 + ((71 * (v3 ^ 0x72 ^ v4)) ^ v7) + 83), sub_1B778DFE0);
  __asm { BR              X11 }
}

uint64_t sub_1B7785550()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((14 * (**(_QWORD **)(v2 + 1672) == 0)) ^ v0)) - 8))();
}

uint64_t sub_1B7785588@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 1064)))(v1);
}

void tbttItCTp3MZ(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B77855F0@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  _BOOL4 v5;

  v4 = v2 - 1689052157;
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(a2 + 208))(a1, 1252601147) != 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (int)(v5 * (v4 ^ 0x9B531ED2) + 655)) - 12))(4294925268);
}

uint64_t sub_1B7785640@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = 0;
  *v1 = a1;
  return result;
}

void sub_1B7785658(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) - 1224239923 * (((a1 | 0xDD953B90) - (a1 & 0xDD953B90)) ^ 0x2F26C647);
  __asm { BR              X15 }
}

uint64_t sub_1B7785784@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v18;

  v16 = v14 - 950253148;
  *(_DWORD *)(a11 + 4 * (v11 + a1)) = *(_DWORD *)(*(_QWORD *)(v13 - 0x709331AC20D1CC01) + 4 * (v11 + a1));
  v18 = v11 + 2002204064 <= ((v12 - 503) | 0x208) + 1197229850 && v11 + 2002204064 >= v16;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((46 * v18) ^ (v12 - 34))) - 4))(1197229850);
}

uint64_t sub_1B7785810()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  _BOOL4 v6;

  v4 = (v1 ^ 0xDFA64856) + v0;
  v5 = (v3 > 0x5054A11B) ^ (v4 < -1347723548);
  v6 = v4 < (int)(v3 + 799760100);
  if (v5)
    v6 = v3 > 0x5054A11B;
  return (*(uint64_t (**)(void))(v2 + 8 * ((28 * v6) ^ v1)))();
}

uint64_t sub_1B778589C@<X0>(int a1@<W3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  _BOOL4 v21;

  v21 = v20 > v18;
  *(_DWORD *)(a12 + 4 * ((v14 ^ (a2 + 771)) + v12)) = a1;
  if (v21 == v12 + v15 < v16)
    v21 = v12 + v15 < v17;
  return (*(uint64_t (**)(void))(v19 + 8 * ((28 * v21) ^ v13)))();
}

uint64_t sub_1B77858F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                          + 8
                                                                                          * (((v5 != v6 - 1285)
                                                                                            * ((v6 - 188) ^ 0x44B)) | v6))
                                                                              - 12))(a1, a2, a3, a4, a5);
}

uint64_t sub_1B778592C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _QWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  _BOOL4 v27;

  v23 = (v19 + 163) ^ 0xAD;
  v24 = (*(_DWORD *)(*a10 - 0x5CF1D1600198EA00) - 1398666056) * (((v23 - 1277) | 0x441) ^ (v18 - 967) ^ *a18);
  v25 = 1225351577 * ((((v22 - 128) | 0x3C75FBC3) - ((v22 - 128) & 0x3C75FBC3)) ^ 0x428A61F1);
  *(_DWORD *)(v22 - 104) = v25 + 561217817;
  *(_QWORD *)(v22 - 120) = a13;
  *(_QWORD *)(v22 - 112) = a14;
  *(_DWORD *)(v22 - 128) = (v24 ^ 0xFF7FE57D) - v25 + ((2 * v24) & 0xFEFFCAFA) + 1610596240;
  *(_DWORD *)(v22 - 124) = v25 + v23 - 369;
  v26 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + ((v19 + 163) ^ 0x576)) - 8))(v22 - 128);
  v27 = (int)(v21 + 807199479) > 807199480;
  if (v21 > 0x4FE31D08)
    v27 = 1;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((173 * v27) ^ v23)) - 12))(v26);
}

void sub_1B7785AC0()
{
  JUMPOUT(0x1B7785984);
}

uint64_t sub_1B7785AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = 1224239923 * ((((v16 - 128) | 0x20D4BCCD) - ((v16 - 128) & 0x20D4BCCD)) ^ 0xD267411A);
  *(_QWORD *)(v16 - 120) = a13;
  *(_DWORD *)(v16 - 112) = (((v15 << 6) & 0xFA965F40) + ((32 * v15) ^ 0xFD4B2FB7) + 1476392287) ^ v17;
  *(_DWORD *)(v16 - 128) = v14 - v17 - 414;
  sub_1B7780E44(v16 - 128);
  return (*(uint64_t (**)(void))(v13
                              + 8 * ((((*a9 - 561217818) < 0x7FFFFFFF) * ((v14 - 395) ^ 0x32F)) ^ v14)))();
}

uint64_t sub_1B7785B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;

  *(_DWORD *)(v17 - 112) = (v16 - 502) ^ (108757529
                                        * ((((v17 - 128) | 0x3E78ACD8) - (v17 - 128) + ((v17 - 128) & 0xC1875320)) ^ 0xDEE4CEF3));
  *(_QWORD *)(v17 - 128) = a14;
  *(_QWORD *)(v17 - 120) = &STACK[0x709331AC20D1CC39];
  sub_1B774F400(v17 - 128);
  *(_QWORD *)(v17 - 120) = v15;
  *(_QWORD *)(v17 - 112) = a14;
  *(_DWORD *)(v17 - 128) = (v16 + 254) ^ (1374699841
                                        * ((((v17 - 128) | 0xC863ADDB) + (~(v17 - 128) | 0x379C5224)) ^ 0xA597B5D3));
  v18 = ((uint64_t (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + v16 - 1086) - 4))(v17 - 128);
  v19 = *(_DWORD *)(v17 - 124) > (((v16 ^ 0x6F7) - 246) ^ 0x5A1170FAu);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((v19 | (32 * v19)) ^ v16)))(v18);
}

uint64_t sub_1B7785C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  int v19;
  int v20;

  if (a18 - 561217817 >= 0)
    v20 = a18 - 561217817;
  else
    v20 = ~(a18 - 561217818);
  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((114
                                          * ((int)((v20 ^ 0x77F79DBD)
                                                 - 1451498660
                                                 + ((v20 << (((v19 + 70) | 0x31) ^ 0x34)) & 0xEFEF3B7A)
                                                 - 561217818) >= 0)) ^ ((v19 - 698) | 0x131)))
                            - ((((v19 - 698) | 0x131u) + 323) ^ 0x27CLL)))();
}

uint64_t sub_1B7785D30()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((907 * (*(_DWORD *)(v1 + 4 * v2) == v3)) ^ v0)) - 4))();
}

uint64_t sub_1B7785D5C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((114 * ((int)((v2 ^ 0xFFFFFD87) + v1 + v3) >= 0)) ^ v0))
                            - ((v0 + 323) ^ 0x27CLL)))();
}

uint64_t sub_1B7785D98()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(v5 + 8);
  *(_DWORD *)(v2 - 112) = (v0 - 37) ^ (108757529 * ((2 * ((v2 - 128) & 0x3146E90) - (v2 - 128) - 51670674) ^ 0x1C77F345));
  *(_QWORD *)(v2 - 128) = v1;
  *(_QWORD *)(v2 - 120) = v3;
  return sub_1B774F400(v2 - 128);
}

void sub_1B7786170(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 + 1178560073 * ((1579988138 - (a1 | 0x5E2CB4AA) + (a1 | 0xA1D34B55)) ^ 0x1B473337);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = v1 + 535753261 * (((~&v3 & 0xB6F64278) - (~&v3 | 0xB6F64279)) ^ 0xBC024C56) + 878;
  sub_1B7777100((uint64_t)&v3);
  __asm { BR              X9 }
}

uint64_t sub_1B77862A4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1 + 8 * (((v1 - 767) * (((v3 - v2) & 0x1F) == 0x1E)) ^ v1)))();
}

uint64_t sub_1B77862F8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((((((v1 - 1147) | 0x140) + 646) ^ 0x32E) - 148)
                                * ((v3 ^ 0x5CC6FB7E)
                                 - 8388682
                                 + ((((v1 - 1147) | 0x140) ^ 0xB98DF7A7) & v2)
                                 - 1548155701 > 0x7FFFFFFE)) ^ ((v1 - 1147) | 0x140))))();
}

uint64_t sub_1B778636C@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;

  v7 = v4 - 641;
  *(_DWORD *)(*(_QWORD *)(v6 - 0x709331AC20D1CC01) + 4 * (int)((v7 ^ 0xBA19440C) + v2 + v5)) = *(_DWORD *)(*(_QWORD *)(v6 - 0x709331AC20D1CC01) + 4 * a1);
  return (*(uint64_t (**)(void))(a2 + 8 * ((((v5 - 1 + v3) < 0x7FFFFFFF) * ((v7 - 145) ^ 0x24E)) ^ v7)))();
}

uint64_t sub_1B77863D4@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  _QWORD *v4;
  int v5;
  unsigned int v6;
  int v7;

  *(_DWORD *)(*v4 + 4 * (v5 + v7)) = *(_DWORD *)(*v4 + 4 * (v7 + v2));
  return (*(uint64_t (**)(void))(a2 + 8 * (((v7 - 1 + v2 < v6) * a1) ^ v3)))();
}

uint64_t sub_1B7786408@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8 * ((492 * (v1 + 375406752 >= (((v2 - 207) | 0x142) ^ 0x7FFFFEBDu))) ^ v2))
                            - 12))();
}

void sub_1B7786468()
{
  int v0;
  int v1;
  int v2;
  int v3;
  _DWORD *v4;
  int v5;

  v5 = 1396629432 - v0;
  if (*v4 + 1586265831 < 0)
    v5 = v1;
  *v4 += v2 + ((v3 - 136091908) & 0x81C97EB) + v5;
}

void sub_1B778676C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 1225351577 * (((a1 | 0x1B35D24) - (a1 | 0xFE4CA2DB) - 28532005) ^ 0x7F4CC716);
  __asm { BR              X13 }
}

uint64_t sub_1B7786878(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  int v9;

  v7 = (v6 | 0x200) - 328;
  v9 = v4 - 1233506945 > 1475194519 || v4 - 1233506945 < (int)(a4 - 672289466 + v7);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v5 + 8 * (int)(((16 * v9) | (v9 << 7)) ^ v7)) - (v7 ^ 0x156)))(0x4567150FBEB25DF1);
}

uint64_t sub_1B77869AC@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, int a4@<W4>, _QWORD *a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL4 v21;

  v19 = a1 + v14 + (*(_DWORD *)(v7 + 4 * v9) ^ v10) + v12 * (unint64_t)(*(_DWORD *)(*a5 + 4 * a3) ^ v10);
  *(_DWORD *)(v7 + 4 * v9) = ((v13 + 324 + v16) & v17) + (v13 ^ (v10 - 1260)) + v19 - ((2 * v19) & 0xEB09CD78);
  v20 = (v18 ^ HIDWORD(v19)) + (a6 & (v19 >> 31)) + v11;
  v21 = a3 + 1754054506 < a4;
  if (a2 > v15 != a3 + 1754054506 < v8)
    v21 = a2 > v15;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v6 + 8 * ((v13 + 324) ^ ((4 * v21) | (8 * v21)))) - 8))(v20);
}

uint64_t sub_1B7786A6C(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((a1 == ((3 * (v2 ^ 0x78Du)) ^ 0x4567150FBEB258D4)) * ((v2 - 620) ^ 0x3AF)) ^ v2)))();
}

uint64_t sub_1B7786ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  _DWORD *v9;
  signed int v10;
  int v11;
  _BOOL4 v12;

  v10 = ((a7 - 113674225) & 0x6C687B6 ^ 0x939F4C3B) + *v9;
  v11 = (v7 - 1818275921 < 890425544) ^ (v10 < 890425544);
  v12 = v7 - 1818275921 > v10;
  if (v11)
    v12 = v7 - 1818275921 < 890425544;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v12 ^ a7 ^ 1)) - 8))();
}

void sub_1B7786B40()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

uint64_t sub_1B7786B64@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (a1 + 302922402) & 0xEDF1C5FE;
  v5 = ((v4 - 562) ^ 0x1C795F55) + v1;
  v6 = (v3 > 0x42132225) ^ (v5 < -1108550182);
  v7 = v5 < (int)((v4 ^ 0x3DECD81C) + v3);
  if (v6)
    v8 = v3 > 0x42132225;
  else
    v8 = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)((722 * v8) ^ v4)) - 4))();
}

uint64_t sub_1B7786C54@<X0>(uint64_t a1@<X0>, int a2@<W7>, char a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;

  v15 = a1 - 0x4567150FBEB25DF1 + (*(_DWORD *)(v5 + 4 * v6) ^ v8);
  *(_DWORD *)(v5 + 4 * v6) = v15 + v8 - ((2 * v15) & 0xEB09CD78);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((((v15 >> (((v3 - 76) | a3) ^ v10)) ^ (((v3 + a2) & v9) + v7))
                                           + v12
                                           + (v11 & (2 * (v15 >> (((v3 - 76) | a3) ^ v10)))) != v14)
                                          * v13) ^ v3))
                            - 12))();
}

void sub_1B7786CE8(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v3 = *(_DWORD *)(*(_QWORD *)a1 - 0x709331AC20D1CC05) != 561217817
    && *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x709331AC20D1CC05) != 561217817;
  v1 = *(_DWORD *)(a1 + 8) + 1178560073 * ((2 * (a1 & 0x4FE31186) - a1 + 807202425) ^ 0x8A88961B);
  __asm { BR              X14 }
}

uint64_t sub_1B7786DE4@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((200
                                          * (((4 * ((v2 + 580) | 0x2F)) ^ 0x9A4 ^ (4 * (((v2 + 580) | 0x2F) ^ 0x300)) ^ 0xFFFFFADF)
                                           + v3
                                           + a1 >= 0x7FFFFF7D)) ^ ((v2 + 580) | 0x2F)))
                            - 4))();
}

uint64_t sub_1B7786E40()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0 + 8 * ((997 * (v1 > ((v2 - 96) ^ 0x4B8))) ^ v2)) - 4))(888742414);
}

uint64_t sub_1B7786EA8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 v19;
  int v20;
  uint64_t v21;
  int v22;
  _BOOL8 v23;

  v19 = v16 > -1703852262;
  *(_DWORD *)(a14 + 4 * (a1 - 888742414)) = v15;
  v20 = (((v17 - 1510) | 0x48C) ^ 0xB0959216) + a1;
  v21 = (a1 + 1);
  v22 = v19 ^ (v20 < 1703852261);
  v23 = v20 < v18;
  if (!v22)
    v19 = v23;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v14 + 8 * (v17 ^ (4 * !v19))))(v21, v23);
}

uint64_t sub_1B7786F20()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((((2 * v2) ^ 0x84A) * (v1 != 0)) ^ v2))
                            - ((v2 - 1334866191) & 0x4F906DFC ^ 0x1B8)))();
}

uint64_t sub_1B7786F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int v11;
  int v12;

  return ((uint64_t (*)(_QWORD, unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10
                                                                                         + 8
                                                                                         * (((**(_DWORD **)(a10 - 0x709331AC20D1CC01) != v11)
                                                                                           * (((((v12 + 140) | 8) - 1348) | 0x304)
                                                                                            - 757)) ^ ((v12 + 140) | 8)))
                                                                             - 12))(0, 0xF3747C53000EA8F6, 4170341064, 3461877511);
}

uint64_t sub_1B7787058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;
  int v14;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((1485 * ((((v14 - 540937486) ^ (a13 == 0)) & 1) == 0)) ^ v14))
                            - (v14 + 272)
                            + 1040))();
}

uint64_t sub_1B77870A4@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W4>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  _QWORD *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _BOOL4 v24;

  v22 = 4 * a1;
  v23 = (v11 ^ 0xF3747C53)
      + (v20 ^ v12) * (*(_DWORD *)(*v18 + 4 * (65 * (v19 ^ v15) - 780)) ^ v12)
      + (*(_DWORD *)(a10 + v22) ^ v12);
  *(_DWORD *)(a10 + v22) = (v23 + a2 - (v16 & (2 * v23))) ^ v21;
  v24 = v13 > v14;
  if (v24 == a3 + 1 < a4)
    v24 = a3 + 1 < v17;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((16 * !v24) | (!v24 << 6)) ^ v19)) - 12))();
}

uint64_t sub_1B7787168(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v12;

  v12 = v9 - 1107959795 < 1164150084 && v9 - 1107959795 >= a7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((((((4 * (v10 ^ 0x462) + a4) ^ (a4 + 2028)) - 898) ^ (4 * (v10 ^ 0x462) + a4) & v8)
                                          * v12) ^ (4 * (v10 ^ 0x462))))
                            - 4))();
}

void sub_1B7787278()
{
  JUMPOUT(0x1B7787020);
}

void sub_1B7787288()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_1B77874C0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }
}

uint64_t sub_1B7787598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;

  v14 = *(_DWORD *)(v8 - 0x1E6EF7153090DB2) + *(_DWORD *)(a1 + 24) + v12 + ((v13 + 1999349348) ^ 0xE2CE237E);
  v15 = 1178560073 * ((&a5 + 1663869989 - 2 * ((unint64_t)&a5 & 0x632CA425)) ^ 0xD9B8DC47);
  a8 = (v13 + 1319) ^ v15;
  a5 = v15 + 1143727196;
  a6 = v15 - 1802309642 + v14;
  a7 = v8;
  v16 = ((uint64_t (*)(int *))(*(_QWORD *)(a2 + 8 * (v13 - 270)) - 4))(&a5);
  return (*(uint64_t (**)(uint64_t))(v11
                                            + 8
                                            * ((1157 * (*v9 == ((v13 + 1999349348) & 0x88D4597E ^ (v10 - 260)))) ^ v13)))(v16);
}

uint64_t sub_1B778769C()
{
  _QWORD *v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((*v0 == 0x3E5369CC567B1177) * ((v1 - 1475) ^ 0x6F)) ^ v1)) - 8))();
}

uint64_t sub_1B77876E0()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((50 * (v1 == ((115 * (v0 ^ 0x91)) ^ (2 * v0) ^ 0x6A1A7B38))) ^ v0))
                            - 8))();
}

void sub_1B7787728(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  _DWORD *v11;

  v4 = (v1 - 606) | 0x149;
  v5 = (a1 & 0xBFFFFFFF ^ 0xC7C59764)
     - 943351964
     + ((2 * ((v4 ^ 0x7C59634) & (a1 & 0xBFFFFFFF ^ 0xC7C59764) ^ (a1 | 0x7FFFFFF6))) ^ 0x80000013)
     + 1;
  v6 = *(_QWORD *)(v2 - 0x1E6EF7153090DC2);
  v7 = *v11 - 1808185175;
  *(_BYTE *)(v6 + (*v11 - 1808184830)) = (HIBYTE(v5) ^ 0xC7)
                                                     + ((v4 - 29) ^ 0x5F)
                                                     - 2 * ((HIBYTE(v5) ^ 0xC7) & 0x6B ^ HIBYTE(v5) & 8);
  *(_BYTE *)(v6 + (v7 + 346)) = (BYTE2(v5) ^ 0xC5) + (~(2 * (BYTE2(v5) ^ 0xC5)) | 0x39) + 100;
  *(_BYTE *)(v6 + (v7 + 347)) = (BYTE1(v5) ^ 0x97) - ((2 * (BYTE1(v5) ^ 0x97)) & 0xC7) + 99;
  *(_BYTE *)(v6 + (v7 + 348)) = v5 ^ 7;
  v8 = *(_QWORD *)(v2 - 0x1E6EF7153090DC2);
  LODWORD(v6) = v3 - ((2 * v3 + 63637878) & 0x22B5F86) + 385561726;
  v9 = ((2 * (*v11 - 1808184826)) & 0xFAD1FBBE) + ((*v11 - 1808184826) ^ 0x7D68FDDF) - 2104032735;
  *(_BYTE *)(v8 + v9) = (BYTE3(v6) ^ 0x81) - 2 * ((BYTE3(v6) ^ 0x81) & 0x6B ^ BYTE3(v6) & 8) + 99;
  *(_BYTE *)(v8 + v9 + 1) = (BYTE2(v6) ^ 0x15) + (~(2 * (BYTE2(v6) ^ 0x15)) | 0x39) + 100;
  *(_BYTE *)(v8 + v9 + 2) = (BYTE1(v6) ^ 0xAF) - ((2 * (BYTE1(v6) ^ 0xAF)) & 0xC7) + 99;
  *(_BYTE *)(v8 + v9 + 3) = (v3 - ((2 * v3 + 118) & 0x86) + 126) ^ 0xA0;
  *v11 = v10;
}

void sub_1B77879B4(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 24) - 1374699841 * ((-2 - ((a1 | 0x5548FCDC) + (~(_DWORD)a1 | 0xAAB70323))) ^ 0xC7431B2A);
  v2 = *(unint64_t **)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unint64_t **)(a1 + 40);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(v3 - 0x5CF1D1600198EA08);
  v12 = (1759421093 * ((&v7 - 2090829170 - 2 * (&v7 & 0x83607A8E)) ^ 0x301DCADA)) ^ (v1 + 372);
  v7 = v3;
  v8 = v2;
  v9 = v5;
  v10 = v6;
  v11 = &STACK[0x709331AC20D1CC39];
  ((void (*)(uint64_t *))((char *)*(&off_1E6CBBAA0 + (v1 ^ 0x4FD)) - 8))(&v7);
  v7 = *(_QWORD *)(v3 - 0x5CF1D1600198EA10);
  v8 = &STACK[0x709331AC20D1CC29];
  LODWORD(v9) = (108757529
               * ((2090754283 - (&v7 | 0x7C9E60EB) + (&v7 | 0x83619F14)) ^ 0x63FDFD3F)) ^ (v1 - 626);
  sub_1B774F400((uint64_t)&v7);
  v8 = v4;
  HIDWORD(v7) = v1
              + 460628867
              * ((-602685872 - (&v7 | 0xDC13BE50) + (&v7 | 0x23EC41AF)) ^ 0x6F7AC3D2)
              - 558;
  sub_1B774F590((uint64_t)&v7);
  __asm { BR              X8 }
}

uint64_t sub_1B7787C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v18 - 128) = v15;
  *(_QWORD *)(v18 - 120) = v13;
  *(_QWORD *)(v18 - 144) = v14;
  *(_QWORD *)(v18 - 136) = a12;
  *(_QWORD *)(v18 - 112) = v13;
  *(_DWORD *)(v18 - 104) = (v17 + 1409) ^ (1759421093
                                         * ((~((v18 - 144) | 0x757597B1) + ((v18 - 144) & 0x757597B1)) ^ 0x39F7D81A));
  v19 = a11(v18 - 144);
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8
                                            * ((((v17 ^ 0xC95FAC5B) + v16 < 0x7FFFFFFF) | (2
                                                                                         * ((v17 ^ 0xC95FAC5B) + v16 < 0x7FFFFFFF))) ^ v17 ^ 0x47D)))(v19);
}

uint64_t sub_1B7787CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  *(_DWORD *)(v8 - 120) = v6 + 535753261 * ((((v8 - 144) | 0x256726A7) + (~(v8 - 144) | 0xDA98D958)) ^ 0x2F932889) + 49;
  *(_QWORD *)(v8 - 112) = v1;
  *(_QWORD *)(v8 - 144) = v3;
  *(_QWORD *)(v8 - 136) = v1;
  *(_QWORD *)(v8 - 128) = v2;
  ((void (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (v6 ^ 0xD0)) - 12))(v8 - 144);
  v9 = 1225351577 * ((v8 - 144) ^ 0x7EFF9A32);
  *(_QWORD *)(v8 - 136) = v4;
  *(_DWORD *)(v8 - 140) = (v6 + 896) ^ v9;
  *(_DWORD *)(v8 - 128) = (v5 + v7) ^ v9;
  v10 = sub_1B7784F28(v8 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0
                                                      + 8 * ((1981 * (*(_DWORD *)(v8 - 144) != v6 + 490948087)) ^ v6))
                                          - 8))(v10);
}

uint64_t sub_1B7787D84()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v4;

  v4 = ((v2 + 1037) ^ 0x47D ^ (v3 - 137)) + v1 < 0x7FFFFFFF;
  return (*(uint64_t (**)(void))(v0 + 8 * ((v4 | (2 * v4)) ^ (v2 + 1037))))();
}

uint64_t sub_1B7787DBC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = *(_QWORD *)(v8 + 8);
  v6 = 460628867 * ((((v4 - 144) | 0x329A340E) - ((v4 - 144) & 0x329A340E)) ^ 0x7E0CB673);
  *(_DWORD *)(v4 - 128) = v6 + v0 + 453;
  *(_QWORD *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 144) = 1662039774 - v6;
  sub_1B7780BBC((_DWORD *)(v4 - 144));
  *(_QWORD *)(v4 - 144) = v2;
  *(_QWORD *)(v4 - 136) = v10;
  *(_QWORD *)(v4 - 120) = v1;
  *(_QWORD *)(v4 - 112) = v1;
  *(_QWORD *)(v4 - 128) = v3;
  *(_DWORD *)(v4 - 104) = (v0 + 372) ^ (1759421093
                                      * ((2 * ((v4 - 144) & 0x7AB93DF8) - (v4 - 144) + 88523270) ^ 0xB63B7252));
  v9(v4 - 144);
  *(_DWORD *)(v4 - 128) = (v0 - 626) ^ (108757529
                                      * ((((v4 - 144) | 0x1013C975) - (v4 - 144) + ((v4 - 144) & 0xEFEC3688)) ^ 0xF08FAB5E));
  *(_QWORD *)(v4 - 144) = v1;
  *(_QWORD *)(v4 - 136) = v5;
  return sub_1B774F400(v4 - 144);
}

void sub_1B7787F10(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  v2 = *(_QWORD *)((char *)*(&off_1E6CBBAA0 + (v1 ^ 0x10B))
                 + 8
                 * ((750
                   * (((uint64_t (*)(uint64_t, uint64_t))*(&off_1E6CBBAA0 + v1 - 453))(32, 0x101004023FF3BD5) != 0)) ^ v1)- 4)- 4;
  __asm { BR              X8 }
}

uint64_t sub_1B7787FB4(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0x22216A4D22216A4DLL;
  *(_QWORD *)(result + 16) = 0x42847B246BC6B5FELL;
  *(_DWORD *)(result + 24) = 1973469985;
  *(_QWORD *)(v2 - 0x6A4735A87A2643E5) = result + 0x1E6EF7153090DC2;
  *((_DWORD *)v1 + 2) = 1973469985;
  return result;
}

void hZZRqgZwI(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  int v5;

  if (a1)
    v4 = a4 == 0;
  else
    v4 = 1;
  v5 = !v4;
  __asm { BR              X8 }
}

uint64_t sub_1B77880AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, int a17)
{
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;

  a16 = 108757529 * (&a16 ^ 0xE09C622B) + 1695027452;
  v20 = sub_1B778DF28(&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18 + 8 * ((987 * (a17 == v17)) ^ v19)) - 8))(v20);
}

uint64_t sub_1B7788110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  a18 = 479 - 460628867 * ((&a16 & 0xED49C18B | ~(&a16 | 0xED49C18B)) ^ 0x5E20BC09);
  a16 = &STACK[0x6A4735A87A2643FD];
  sub_1B7787F10((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * ((120 * (a17 != ((v18 + 1125) ^ 0x4A7))) ^ 0xB0u)) - 8))(v20, v21, v22, v23, v24, v25, v26, v27, a9);
}

uint64_t sub_1B77881B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unsigned int a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;

  v26 = 628203409
      * (((&a16 ^ 0x8A2ABAE8) & 0xC01153FA | ~(&a16 ^ 0x8A2ABAE8 | 0xC01153FA)) ^ 0x374C1ADE);
  a16 = v24 - v26 + 441;
  a18 = v21;
  a20 = a12;
  a19 = (v22 ^ 0xF5AD6EF6) + ((2 * v22) & 0xEB5ADDEC) + 1599340542 + v26;
  ((void (*)(int *))(*(_QWORD *)(v25 + 8 * (int)(v24 - 995)) - 4))(&a16);
  v27 = 1225351577 * ((&a16 - 1814971634 - 2 * (&a16 & 0x93D1BB0E)) ^ 0xED2E213C);
  a18 = a12;
  a16 = 1077516161 * v20 - v27 + 49603358;
  a17 = (v24 - 406) ^ v27;
  v28 = (*(uint64_t (**)(int *))(v25 + 8 * (v24 ^ 0x48B)))(&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v23 + 8 * ((318 * (a19 == (v24 ^ 0x75A0C736))) ^ v24)) - 4))(v28);
}

uint64_t sub_1B7788310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, int a19, int a20,unint64_t *a21)
{
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v25 = 1759421093 * ((&a16 + 291676884 - 2 * ((unint64_t)&a16 & 0x1162A2D4)) ^ 0xA21F1280);
  a18 = a12;
  a16 = 1830462524 - v25;
  a21 = &STACK[0x722739E86E9FC738];
  a19 = v25 ^ 0x41C5D2CF;
  a20 = v25 + v23 + 2138962313;
  v26 = sub_1B778D6D8((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22
                                                      + 8
                                                      * ((187 * (a17 == v21 + ((v23 - 1292163760) & 0x7BD) - 293)) ^ v23))
                                          - v24
                                          + 3739174526))(v26);
}

uint64_t sub_1B77883F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, uint64_t a15, unsigned int a16, int a17, unint64_t *a18, unint64_t *a19)
{
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(unsigned int *);
  uint64_t v24;

  a16 = (v19 + 845) ^ (1374699841
                     * ((2 * (&a16 & 0x7EABDED0) - &a16 + 22290732) ^ 0x6CA03925));
  a18 = &STACK[0x31FD77B69BC3E1B9];
  a19 = a13;
  v23 = *(void (**)(unsigned int *))(v22 + 8 * (v19 ^ 0x15E));
  v23(&a16);
  a16 = (v19 + 845) ^ (1374699841 * ((&a16 + 10095937 - 2 * (&a16 & 0x9A0D41)) ^ 0x6D6E1548));
  a18 = &STACK[0x31FD77B69BC3E1B1];
  a19 = a13;
  v23(&a16);
  a16 = (v19 + 845) ^ (1374699841 * ((&a16 & 0xC1F6A691 | ~(&a16 | 0xC1F6A691)) ^ 0x53FD4167));
  a18 = &STACK[0x31FD77B69BC3E1B5];
  a19 = a13;
  v23(&a16);
  a18 = a13;
  a16 = v19
      + 1225351577
      * ((1283525641 - (&a16 ^ 0xE62902AC | 0x4C810C09) + (&a16 ^ 0xE62902AC | 0xB37EF3F6)) ^ 0x2BA86B68)
      + 762;
  v24 = sub_1B774F090((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((652 * (a17 == v20)) ^ v19))
                                          - ((v19 - 555793059) ^ 0xDEDF468ALL)))(v24);
}

uint64_t sub_1B77885C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * (int)(((a15 == v17) * (v15 + ((v16 - 16824975) & 0xDEDF4FEB) + 603)) ^ v16))
                            - 8))();
}

uint64_t sub_1B7788604()
{
  int v0;
  int v1;
  unint64_t *v2;
  void (*v3)(_BYTE *);
  unsigned int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  _BYTE v11[4];
  int v12;
  uint64_t v13;

  *v2 = v9 ^ v4 | ((unint64_t)((v0 - 1765704545) ^ v10) << 32);
  v5 = v0;
  v13 = v8;
  v12 = v1
      + 535753261 * ((v11 - 369372444 - 2 * ((unint64_t)v11 & 0xE9FBD2E4)) ^ 0xE30FDCCB)
      + v0
      + 308;
  v3(v11);
  v13 = v7;
  v12 = 535753261 * ((v11 + 957040592 - 2 * ((unint64_t)v11 & 0x390B47D0)) ^ 0x33FF49FF)
      + 555793059
      + v5
      + 308;
  v3(v11);
  return v4 ^ 0x75A0C321;
}

void sub_1B7788724(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(_QWORD *)(a1 + 24))
    v2 = *(_DWORD *)(a1 + 20) - v1 == 572615245;
  else
    v2 = 1;
  v3 = v2;
  __asm { BR              X8 }
}

uint64_t sub_1B77887D4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v2 - 106)))(32, 0x101004023FF3BD5) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1292 * v3) ^ v2)) - ((4 * v2) ^ 0x7B4u) + 1436))();
}

uint64_t sub_1B7788834()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((75 * (v1 == (((v3 - 1404) | 0x40) ^ (v0 - 192)) + 13 * (v3 ^ 0x5AC))) ^ v3))
                            - 4))();
}

uint64_t sub_1B7788890@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v11 = v2 - 572615246;
  v12 = v2 - 1;
  v13 = *(unsigned __int8 *)(v6 + v11);
  if (v13 == 99)
    __asm { BR              X11 }
  if (v13 == 227)
  {
    v14 = 1973469985;
    v15 = *(_QWORD *)(v4 + 8);
    v16 = *(unsigned __int8 *)(v4 + 16) ^ v5;
    *(_QWORD *)result = v6;
    *(_DWORD *)(result + 8) = v7;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 73)
      v17 = 1115978535;
    else
      v17 = 1115978534;
    *(_DWORD *)(result + 16) = 1808184830;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 1973469985;
    *(_QWORD *)(v15 - 0x7B9E9BA5BB9673EELL) = a2;
  }
  else
  {
    result = (*(uint64_t (**)(void))(v8 + 8 * (v9 ^ 0x8A)))();
    v14 = -1973446408;
  }
  *(_DWORD *)v4 = v14;
  return result;
}

void sub_1B7788974(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) - 535753261 * (((a1 | 0xB23F3C90) - (a1 & 0xB23F3C90)) ^ 0xB8CB32BF);
  __asm { BR              X15 }
}

uint64_t sub_1B7788A88()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  unsigned int v5;

  v4 = v2 + v0 + v1 - 313;
  if (v4 >= 0)
    v5 = v2 + v0 + v1 - 313;
  else
    v5 = -v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((215 * (v5 < 0x83)) ^ v1))
                            - ((v1 + 980460233) & 0xC58F5BFD)
                            + 229))();
}

uint64_t sub_1B7788AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, _QWORD, uint64_t, unint64_t *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(a27 + 4 * (int)(((v28 + 309404437) & 0xED8EDFBF) - 958)) = 1971644092;
  v31 = 50 * (v27 - 1701080624 >= -1701080623);
  v32 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, unint64_t *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * (int)(v31 ^ (v28 + 36))) - 4);
  return v32(a1, 50, v32, v31, &STACK[0x709331AC20D1CC91], (v27 ^ 0xFFEEEBDE) + 1618738928 + ((2 * v27) & 0xFFDDD7BC), a7, a8, a9, a10, a11, v29);
}

void sub_1B7788BA0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v2 + v1) = v0;
}

void sub_1B77898AC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24) - 3804331 * (((a1 | 0x841A70C4) - (a1 & 0x841A70C4)) ^ 0x7E848392);
  __asm { BR              X10 }
}

uint64_t sub_1B7789970@<X0>(uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5, int a6, int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v10 = 108757529 * ((&a3 + 1471139878 - 2 * ((unint64_t)&a3 & 0x57AFD026)) ^ 0xB733B20D);
  a3 = &STACK[0x3E5369CC567B1177];
  a5 = v8;
  a4 = v10 ^ 0xC73E8E3C;
  a6 = 1780120397 - v10;
  a7 = v7 - v10 - 823;
  v11 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v7 ^ 0x45A)) - 4))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8 * ((557 * (*(_DWORD *)(v8 - 0x1E6EF7153090DAALL) == 1973469985)) ^ v7)))(v11);
}

void sub_1B7789A44(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;

  v3 = 0xADB8027E9F435DF5 * (*(_QWORD *)(v1 + 8) - v2)
     - ((0x5B7004FD3E86BBEALL * (*(_QWORD *)(v1 + 8) - v2) + 0x472157E63806626CLL) & 0x8769BFA58DDB4A0ALL)
     + 0x67458BC5E2F0D63BLL;
  *v4 = (HIBYTE(v3) ^ 0x43) - 2 * ((HIBYTE(v3) ^ 0x43) & 0xE7 ^ HIBYTE(v3) & 4) + 99;
  v4[1] = (BYTE6(v3) ^ 0xB4) - ((2 * (BYTE6(v3) ^ 0xB4)) & 0xC7) + 99;
  v4[2] = (BYTE5(v3) ^ 0xDF) - ((2 * (BYTE5(v3) ^ 0xDF)) & 0xC7) + 99;
  v4[3] = (BYTE4(v3) ^ 0xD2) - 2 * ((BYTE4(v3) ^ 0xD2) & 0xE7 ^ BYTE4(v3) & 4) + 99;
  v4[4] = (BYTE3(v3) ^ 0xC6) + (~(2 * (BYTE3(v3) ^ 0xC6)) | 0x39) + 100;
  v4[5] = (BYTE2(v3) ^ 0xED) - ((2 * (BYTE2(v3) ^ 0xED)) & 0xC7) + 99;
  v4[6] = (BYTE1(v3) ^ 0xA5) - ((2 * (BYTE1(v3) ^ 0xA5)) & 0xC7) + 99;
  v4[7] = v3 ^ 0x66;
  *(_DWORD *)v1 = *a1;
}

void sub_1B7789BDC(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x709331AC20D1CC05);
  v4 = v2 - 561217817;
  v3 = v2 - 561217817 < 0;
  v5 = 561217817 - v2;
  if (!v3)
    v5 = v4;
  v1 = (*(_DWORD *)a1 - 235795823 * ((a1 - 590343418 - 2 * (a1 & 0xDCD01306)) ^ 0x487D5A5F)) ^ 0x66F;
  __asm { BR              X20 }
}

uint64_t sub_1B7789D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, unsigned int a8)
{
  int v8;
  _QWORD *v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((*(_DWORD *)(*v9 + 4 * a8) != a6) * v8) ^ a7)) - 4))();
}

void sub_1B7789D44()
{
  JUMPOUT(0x1B7789CD0);
}

uint64_t sub_1B7789D58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 4) = v1;
  return result;
}

void sub_1B7789D64(uint64_t a1, uint64_t a2)
{
  __asm { BR              X8 }
}

uint64_t sub_1B7789DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1027 * (**(_BYTE **)(a2 + 8) == 0)) ^ 0xA5u)) - 12))();
}

uint64_t sub_1B7789E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  *(_QWORD *)(*(_QWORD *)(a16 + 96) + 504) = v17 + 1;
  *(_DWORD *)(*(_QWORD *)(a16 + 96) + 496) = a17 - 1;
  v20 = 628203409 * ((((v19 - 152) | 0xE511188F) + (~(v19 - 152) | 0x1AEEE770)) ^ 0x679914BD);
  *(_DWORD *)(v19 - 144) = v20 + 2122148333;
  *(_DWORD *)(v19 - 152) = v20 + 1172345435;
  *(_QWORD *)(v19 - 136) = v19 + 0xD547898781B10C4;
  v21 = sub_1B7776B68(v19 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((176
                                                        * (a17
                                                         - 1861226815
                                                         + ((2 * *(_DWORD *)(v19 - 184)) & 0x3E ^ 0x26)
                                                         + (*(_DWORD *)(v19 - 184) & 0x3F ^ 0x2BFDF68Cu) > 0xFFFFFFBF)) ^ 0x16Eu))
                                          - 8))(v21);
}

uint64_t sub_1B778A024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;
  _BOOL4 v20;

  v20 = v17 + 1664616778 < (a17 - 1653537839);
  if (a17 - 1653537839 < (v19 ^ 0xE0631EB0) != (v17 + 1664616778) < 0xE0631E31)
    v20 = a17 - 1653537839 < (v19 ^ 0xE0631EB0);
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * (((4 * !v20) | (8 * !v20)) ^ v19)) - 8))();
}

uint64_t sub_1B778A0A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v22;

  v22 = a6 + (a4 ^ (a5 - 53)) + 1160;
  v19 = 3804331 * ((((v18 - 152) | 0x332C2F75) - ((v18 - 152) & 0x332C2F75)) ^ 0xC9B2DC23);
  *(_DWORD *)(v18 - 152) = v19 + a4 + 505;
  *(_DWORD *)(v18 - 148) = (a17 + 262534546) ^ v19;
  *(_QWORD *)(v18 - 144) = a15;
  sub_1B776B710(v18 - 152);
  v20 = *(_DWORD *)(v18 - 184) & 0x3F;
  *(_BYTE *)(v18 - 252 + (v20 ^ 0x13)) = -29;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * ((1595 * ((v20 ^ 0x13) > 0x37)) ^ a4))
                                          - (v22 ^ 0x521)))(2194991897);
}

uint64_t sub_1B778A1B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (int)((((v7 - a6 - 1160) ^ (a5 - 273) ^ (v7 + 1764016210) & 0x96DB3BFE) * (v6 == 63)) ^ v7)))();
}

uint64_t sub_1B778A1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((v6 - 338) ^ v5) < 8) | v6))
                            - ((a5 + v6 - 382) ^ 0x39D7FDB5)))();
}

uint64_t sub_1B778A22C()
{
  char v0;
  unsigned int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 252 + v1 + 1) = 0x6363636363636363;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1333 * ((v0 & 0x38) == 8)) ^ (v2 + 637)))
                            - ((v2 - 20) ^ 0x166)))();
}

uint64_t sub_1B778A27C(double a1)
{
  uint64_t v1;
  int v2;
  double *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v3 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 0) * v4) ^ v2)) - (v1 ^ 0x166)))();
}

uint64_t sub_1B778A2A8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 ^ (21 * (v2 != v0))))
                            - ((((v1 + 415387415) | 0x2115AD38u) - 4) ^ (v1 + 2077752469) & 0xBDFFFFB9)))();
}

uint64_t sub_1B778A300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(_QWORD, _QWORD, _QWORD, __n128, __n128, __n128, __n128, __n128),uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int32x4_t a31,int32x4_t a32,int32x4_t a33,int32x4_t a34)
{
  int v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t (*v42)(_QWORD, _QWORD, _QWORD, __n128, __n128, __n128, __n128, __n128);
  const char *v43;
  __n128 v44;
  __n128 v45;
  uint64_t v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  int v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint8x16_t v57;
  uint16x8_t v58;
  int8x16_t v59;
  int8x16_t v60;
  uint16x8_t v61;
  int8x16_t v62;
  int8x16_t v63;
  uint8x16_t v64;
  uint16x8_t v65;
  uint16x8_t v66;
  uint8x16_t v67;
  int8x16_t v70;
  int8x16_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int v80;
  int v82;
  uint8x16_t v83;
  uint16x8_t v84;
  uint16x8_t v85;
  uint8x16_t v86;
  uint8x16_t v91;
  uint16x8_t v92;
  uint16x8_t v93;
  int32x4_t v94;
  int32x4_t v95;
  int32x4_t v96;
  int32x4_t v97;
  uint64_t v98;
  _DWORD *v99;
  int v100;
  uint64_t v101;
  int v102;
  int v103;
  unint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  unint64_t v108;
  int8x16x4_t v109;
  int8x16x4_t v110;

  v42 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v38 + 8 * ((int)a6 + v34 - 104))
                                                                                               - 12);
  HIDWORD(v107) = 868556149;
  v43 = (const char *)(v41 - 252);
  v44.n128_u64[0] = 0x6363636363636363;
  v44.n128_u64[1] = 0x6363636363636363;
  v45 = (__n128)vdupq_n_s32(0x75A0C33Bu);
  v46 = v39 - 16;
  v47 = (__n128)vdupq_n_s32(0x75A0C321u);
  v48.n128_u64[0] = 0xC6C6C6C6C6C6C6C6;
  v48.n128_u64[1] = 0xC6C6C6C6C6C6C6C6;
  v49 = (__n128)vdupq_n_s32(0x75A0C337u);
  HIDWORD(a17) = a17 - 254606571;
  v51 = *(_DWORD *)(v41 - 180);
  v50 = *(_DWORD *)(v41 - 176);
  LODWORD(a24) = v51;
  LODWORD(a25) = v50;
  v53 = *(_DWORD *)(v41 - 172);
  v52 = *(_DWORD *)(v41 - 168);
  v54 = v52;
  v55 = *(_BYTE *)(v41 - 156) ^ 0x5C;
  LODWORD(v107) = *(unsigned __int8 *)(v41 - 156) ^ 0x5C;
  if (v55 == 2)
  {
    v108 = __PAIR64__(v52, v53);
    a23 = v42;
    v110 = vld4q_s8(v43);
    v82 = a6 + a5 + 1317;
    HIDWORD(a19) = *(_DWORD *)(v41 - 164);
    v83 = (uint8x16_t)veorq_s8(v110.val[0], (int8x16_t)v44);
    v84 = vmovl_u8(*(uint8x8_t *)v83.i8);
    v85 = vmovl_high_u8(v83);
    v86 = (uint8x16_t)veorq_s8(v110.val[1], (int8x16_t)v44);
    _Q22 = vmovl_u8(*(uint8x8_t *)v86.i8);
    _Q21 = vmovl_high_u8(v86);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v91 = (uint8x16_t)veorq_s8(v110.val[2], (int8x16_t)v44);
    v92 = vmovl_high_u8(v91);
    v93 = vmovl_u8(*(uint8x8_t *)v91.i8);
    v110.val[0] = veorq_s8(v110.val[3], (int8x16_t)v44);
    v110.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v110.val[0]);
    v110.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v110.val[1]);
    v110.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v110.val[1].i8);
    v110.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v110.val[0].i8);
    v110.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v110.val[0]);
    v110.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v110.val[0].i8);
    v94 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v84.i8), 0x18uLL)), v110.val[0]);
    v95 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v93, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v84), 0x18uLL)), v110.val[3]);
    v96 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v92.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)), v110.val[1]);
    v97 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v92, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)), v110.val[2]);
    v110.val[0] = veorq_s8(vandq_s8((int8x16_t)v94, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)v110.val & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v110.val[3] = veorq_s8(vandq_s8((int8x16_t)v95, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v110.val[3] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v110.val[1] = veorq_s8(vandq_s8((int8x16_t)v96, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v110.val[1] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    v110.val[2] = veorq_s8(vandq_s8((int8x16_t)v97, (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v110.val[2] & __PAIR128__(0xFFFFFF1AFFFFFF1ALL, 0xFFFFFF1AFFFFFF1ALL)));
    a33 = vaddq_s32(vsubq_s32(v96, vaddq_s32((int32x4_t)v110.val[1], (int32x4_t)v110.val[1])), (int32x4_t)v47);
    a34 = vaddq_s32(vsubq_s32(v97, vaddq_s32((int32x4_t)v110.val[2], (int32x4_t)v110.val[2])), (int32x4_t)v47);
    a31 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v110.val[0], (int32x4_t)v110.val[0])), (int32x4_t)v47);
    a32 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v110.val[3], (int32x4_t)v110.val[3])), (int32x4_t)v47);
    v98 = v82 ^ 0x456u;
    v99 = (_DWORD *)&a31 + v37 + 4665218;
    v100 = *(v99 - 8) ^ *(v99 - 3);
    v101 = *(v99 - 16);
    v102 = v101 ^ *(v99 - 14) ^ (v100 + v36 - ((2 * v100) & 0xEB418642));
    HIDWORD(v104) = v102 ^ (v36 + v98 - 412);
    LODWORD(v104) = v102;
    v103 = v104 >> 31;
    v105 = (2 * v103) & 0xEB418642;
    *v99 = v103 + v36 - v105;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(_QWORD, _QWORD, _QWORD, __n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 8 * (((8 * (v39 != 4665155)) | (32 * (v39 != 4665155))) ^ v82)))(v98, v46, v105, v54, v101, a6, 3892314112, 3946939970, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             v107,
             v108,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30);
  }
  else if (v55 == 1)
  {
    a23 = v42;
    v109 = vld4q_s8(v43);
    v56 = a5 ^ (a5 + 523);
    v57 = (uint8x16_t)veorq_s8(v109.val[0], (int8x16_t)v44);
    v58 = vmovl_u8(*(uint8x8_t *)v57.i8);
    v59 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v58.i8);
    v60 = (int8x16_t)vmovl_high_u16(v58);
    v61 = vmovl_high_u8(v57);
    v62 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v61.i8);
    v63 = (int8x16_t)vmovl_high_u16(v61);
    v64 = (uint8x16_t)veorq_s8(v109.val[1], (int8x16_t)v44);
    v65 = vmovl_high_u8(v64);
    v66 = vmovl_u8(*(uint8x8_t *)v64.i8);
    v67 = (uint8x16_t)veorq_s8(v109.val[2], (int8x16_t)v44);
    _Q26 = (int8x16_t)vmovl_high_u8(v67);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v67.i8);
    v70 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v75 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v109.val[0] = veorq_s8(v109.val[3], (int8x16_t)v44);
    v109.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v109.val[0]);
    v109.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v109.val[1]);
    v109.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v109.val[0].i8);
    v109.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v109.val[0]);
    v109.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v109.val[0].i8), 0x18uLL), v70), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v66.i8, 8uLL), v59));
    v109.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v109.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v66, 8uLL), v60));
    v109.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v109.val[1].i8), 0x18uLL), v75), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v65.i8, 8uLL), v62));
    v109.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v109.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v65, 8uLL), v63));
    v76 = (int32x4_t)veorq_s8(vandq_s8(v109.val[0], (int8x16_t)v49), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v77 = (int32x4_t)veorq_s8(vandq_s8(v109.val[3], (int8x16_t)v49), (int8x16_t)(*(_OWORD *)&v60 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v78 = (int32x4_t)veorq_s8(vandq_s8(v109.val[1], (int8x16_t)v49), (int8x16_t)(*(_OWORD *)&v62 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    v79 = (int32x4_t)veorq_s8(vandq_s8(v109.val[2], (int8x16_t)v49), (int8x16_t)(*(_OWORD *)&v63 & __PAIR128__(0xFFFFFF16FFFFFF16, 0xFFFFFF16FFFFFF16)));
    a33 = vaddq_s32(vsubq_s32((int32x4_t)v109.val[1], vaddq_s32(v78, v78)), (int32x4_t)v47);
    a34 = vaddq_s32(vsubq_s32((int32x4_t)v109.val[2], vaddq_s32(v79, v79)), (int32x4_t)v47);
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v109.val[0], vaddq_s32(v76, v76)), (int32x4_t)v47);
    a32 = vaddq_s32(vsubq_s32((int32x4_t)v109.val[3], vaddq_s32(v77, v77)), (int32x4_t)v47);
    v80 = ((v35 + 22 * (v56 ^ 0x271) - 264) ^ v51)
        + a7
        + ((v52 ^ v35) & (v50 ^ 0x17E6A631) | (v50 ^ v35) & (v53 ^ v35))
        + *((_DWORD *)*(&off_1E6CBBAA0 + (int)v56 - 460) + v46 + v37)
        + (a31.i32[(*((_BYTE *)*(&off_1E6CBBAA0 + (v56 ^ 0x2B7)) + v46 + v37 - 8) - 96)] ^ v36);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(_QWORD, _QWORD, _QWORD, __n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 + 8 * v56) - 8))(v56, v39 - 16, 4665218, v52, ((v80 + v35 - (v40 & (2 * v80))) ^ v35) << (*((_BYTE *)*(&off_1E6CBBAA0 + (v56 ^ 0x26B))+ v46+ v37)- 23), &off_1E6CBBAA0, a7, v53, a9, a10, a11, a12, a13, a14, a15, a16,
             a17,
             a18,
             a19,
             a20,
             v107,
             __PAIR64__(v52, v53),
             v42,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30);
  }
  else
  {
    v106 = v35 + (v50 ^ v35) + (a25 ^ v35) - (v40 & (2 * ((v50 ^ v35) + (a25 ^ v35))));
    *(_DWORD *)(v41 - 180) = (v51 ^ v35) + (a24 ^ v35) + v35 - (v40 & (2 * ((v51 ^ v35) + (a24 ^ v35))));
    *(_DWORD *)(v41 - 176) = v106;
    *(_DWORD *)(v41 - 172) = 2 * (v53 ^ v35) + v35 - (v40 & (4 * (v53 ^ v35)));
    *(_DWORD *)(v41 - 168) = 2 * (v52 ^ v35) + v35 - (v40 & (4 * (v52 ^ v35)));
    a26 = 0;
    return v42(a1, v46, 2026, v44, v45, v47, v48, v49);
  }
}

uint64_t sub_1B778B1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,int a22,unsigned int a23)
{
  unsigned int v23;
  uint64_t v24;
  BOOL v25;

  if (v23 < a23 != a20 - 1231419186 < (a5 ^ (a5 - 129)) + 868556020)
    v25 = a20 - 1231419186 < (a5 ^ (a5 - 129)) + 868556020;
  else
    v25 = a20 - 1231419186 > v23;
  return ((uint64_t (*)(void))(*(_QWORD *)(v24
                                        + 8
                                        * ((677 * (((a5 ^ (a5 + 55)) ^ v25) & 1)) ^ (a6 + a5 + 313)))
                            - 8))();
}

uint64_t sub_1B778B284(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7
                              + 8 * ((597 * (a1 + v5 + 63 >= (v5 + 1224535392 + a5 + v6 - 329))) ^ v6)))();
}

uint64_t sub_1B778B2C8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  return (*(uint64_t (**)(void))(v21
                              + 8
                              * ((50
                                * (((~a18 + v20 - (unint64_t)(v18 + a1) < 0x10) ^ (v19 - 78)) & 1)) | v19)))();
}

uint64_t sub_1B778B31C@<X0>(int a1@<W0>, int a2@<W2>, unint64_t a3@<X3>, int a4@<W5>, int a5@<W8>, int8x16_t a6@<Q0>, int8x16_t a7@<Q3>)
{
  int v7;
  int8x16_t *v8;
  uint64_t v9;
  uint64_t v10;

  *v8 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v9 + (v7 + a1)), vandq_s8(vaddq_s8(*(int8x16_t *)(v9 + (v7 + a1)), *(int8x16_t *)(v9 + (v7 + a1))), a7)), a6);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (a2 ^ (a4 + a5 + 735))) - ((a4 + a5 - 77) ^ a3)))();
}

uint64_t sub_1B778B378@<X0>(int a1@<W0>, int a2@<W5>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v5 + v4) = *(_BYTE *)(v6 + (v3 + a1))
                      - ((2 * *(_BYTE *)(v6 + (v3 + a1))) & 0xC7)
                      + 99;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((a2 + a3 + 735) ^ (8 * (v4 != 63)))) - 8))();
}

uint64_t sub_1B778B3D0@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W8>)
{
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1554 * ((v4 ^ (a1 - 1340)) + a3 - 378106723 < 0x38)) ^ (a2 + v4 + 357))))();
}

uint64_t sub_1B778B40C@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a1 - 378105247;
  if ((unint64_t)(v4 + 1) > 0x38)
    v5 = v4 + 1;
  else
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((25
                                          * ((((v1 - 1220) ^ (v5
                                                            - v3
                                                            + (unint64_t)((v1 + 4375244) | 0x39953529u)
                                                            - 592351258 < 8)) & 1) == 0)) | v1))
                            - 12))();
}

uint64_t sub_1B778B488()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 252 + v2 - 378105247) = 0x6363636363636363;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1451 * ((v0 & 0xFFFFFFFFFFFFFFF8) - ((v1 | 0x2F8u) - 494) == -514)) ^ (v1 | 0x2F8))))();
}

uint64_t sub_1B778B4E4(double a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(double *)(v2 + v5) = a1;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 == v5) * v4) ^ v1)))();
}

uint64_t sub_1B778B504()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (((v1 + v1 - 357 - 295) * (v0 != v2)) ^ v1)))(2194991897);
}

void sub_1B778B538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  unint64_t v9;
  char v10;
  char v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;

  v7 = *(unsigned __int8 *)(v6 - 156) ^ 0x5C;
  if (v7 == 1)
  {
    v10 = -105 * (a5 ^ (a5 - 7));
    v14 = *(_DWORD *)(v6 - 188);
    v13 = *(_DWORD *)(v6 - 184);
    *(_BYTE *)(v6 - 196) = ((8 * v13) ^ 0x98) + (~(16 * v13) | 0x3F) + 100;
    *(_BYTE *)(v6 - 195) = (v10 ^ (v13 >> 5) ^ 0xD1) - ((2 * (v10 ^ (v13 >> 5) ^ 0xD1)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 194) = ((v13 >> 13) ^ 0x41) - 2 * (((v13 >> 13) ^ 0x41) & 0xE7 ^ (v13 >> 13) & 4) + 99;
    *(_BYTE *)(v6 - 193) = ((v13 >> 21) ^ 0x4D) - ((2 * ((v13 >> 21) ^ 0x4D)) & 0xC7) + 99;
    HIDWORD(v15) = v14 ^ 0x12;
    LODWORD(v15) = v13 ^ 0xC0000000;
    *(_BYTE *)(v6 - 192) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 191) = ((v14 >> 5) ^ 0xEB) + ~(2 * (((v14 >> 5) ^ 0xEB) & 0xE7 ^ (v14 >> 5) & 4)) + 100;
    *(_BYTE *)(v6 - 190) = ((v14 >> 13) ^ 0xC2) - 2 * (((v14 >> 13) ^ 0xC2) & 0x6B ^ (v14 >> 13) & 8) + 99;
    v12 = (v14 >> 21) ^ 0x68;
    v11 = (2 * v12) & 0xC7;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_6;
    v12 = *(_DWORD *)(v6 - 188);
    v8 = *(_DWORD *)(v6 - 184);
    *(_BYTE *)(v6 - 196) = ((v12 >> 21) ^ 0x68) - 2 * (((v12 >> 21) ^ 0x68) & 0xE7 ^ (a6 + a5 + 95) & (v12 >> 21)) + 99;
    *(_BYTE *)(v6 - 195) = ((v12 >> 13) ^ 0xC2) - ((2 * ((v12 >> 13) ^ 0xC2)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 194) = ((v12 >> 5) ^ 0xEB) - 2 * (((v12 >> 5) ^ 0xEB) & 0xE7 ^ (v12 >> 5) & 4) + 99;
    HIDWORD(v9) = v12 ^ 0x12;
    LODWORD(v9) = v8 ^ 0xC0000000;
    *(_BYTE *)(v6 - 193) = (v9 >> 29) - ((2 * (v9 >> 29)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 192) = ((v8 >> 21) ^ 0x4D) - ((2 * ((v8 >> 21) ^ 0x4D)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 191) = ((v8 >> 13) ^ 0x41) - ((2 * ((v8 >> 13) ^ 0x41)) & 0xC7) + 99;
    *(_BYTE *)(v6 - 190) = ((v8 >> 5) ^ 0xAC) + (~(2 * ((v8 >> 5) ^ 0xAC)) | 0x39) + 100;
    v10 = a6 + a5 - 40;
    v11 = (16 * v8) & 0xC0;
    LOBYTE(v12) = (8 * v8) ^ 0x98;
  }
  *(_BYTE *)(v6 - 189) = v12 + (v10 ^ (a5 + 11)) - v11 - 86;
LABEL_6:
  JUMPOUT(0x1B778A64CLL);
}

uint64_t sub_1B778B9B4@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v8 = *(_DWORD *)(v7 - 252 + ((v5 + a2) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a1 + (v5 + a2 + 1)) = (BYTE2(v8) ^ 0x19) + (~(2 * (BYTE2(v8) ^ 0x19)) | 0x39) + 100;
  *(_BYTE *)(a1 + (v5 + a2)) = (HIBYTE(v8) ^ 0xE8)
                                           - ((((v3 + 67) | 0x39) + 13) & (2 * (HIBYTE(v8) ^ 0xE8)))
                                           + 99;
  *(_BYTE *)(a1 + (v5 + a2 + 2)) = (BYTE1(v8) ^ 0x59)
                                               - 2 * ((BYTE1(v8) ^ 0x59) & 0xE7 ^ BYTE1(v8) & 4)
                                               + 99;
  *(_BYTE *)(a1 + (v5 + a2 + 3)) = v8 ^ 0xAD;
  v9 = *(_DWORD *)(v7 - 160) + 1284548072;
  v10 = v9 < v2;
  v11 = v5 - 2021264817 < v9;
  if (v5 - 2021264817 < v2 != v10)
    v11 = v10;
  return (*(uint64_t (**)(void))(v6 + 8 * ((v11 * v4) ^ v3)))();
}

void sub_1B778BB58()
{
  JUMPOUT(0x1B778BB24);
}

uint64_t sub_1B778BB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  int v31;
  uint64_t v32;
  int v33;
  _BOOL4 v35;

  v33 = 55 * (v31 ^ 0x47A);
  *(_DWORD *)(&a31 + a26) = 1450030213;
  v35 = ((v33 - 1143472296) & 0x7DFFFDBB) != 0x39D7FDBA || *(_DWORD *)(&a31 + a26) != 1450030213;
  return ((uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 + 8 * ((v35 * (((v33 + 875) | 0x49) - 835)) ^ v33)) - 12))(50202059, &a31 + a26, 3151495000, a4, 2113928635, a6, 73, 3374712850, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_1B778BC28(int a1)
{
  int v1;
  int v2;
  uint64_t v3;
  char v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((46 * (((v2 == a1) ^ (19 * (v1 ^ v4) - 30)) & 1)) ^ v1))
                            - 4))();
}

uint64_t sub_1B778BC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31)
{
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  _BOOL4 v38;

  v34 = (v31 & 0xF9F7FDFB) + a6;
  v35 = (v34 ^ 0xAE3D3B2C) + a31;
  v36 = (((v31 & 0xF9F7FDFB) + 478247470) & 0xA9A689FE) + v32 - 571299707;
  v37 = (v35 < 0x20E4C4CA) ^ (v36 < 0x20E4C4CA);
  v38 = v35 < v36;
  if (v37)
    v38 = v36 < 0x20E4C4CA;
  return ((uint64_t (*)(void))(*(_QWORD *)(v33 + 8 * ((100 * v38) ^ (v34 + 1050))) - 12))();
}

uint64_t sub_1B778BEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;

  v19 = 628203409 * ((((2 * (v18 - 152)) | 0x18198006) - (v18 - 152) - 202162179) ^ 0x8E84CC30);
  *(_QWORD *)(v18 - 128) = a13;
  *(_QWORD *)(v18 - 112) = v13;
  *(_QWORD *)(v18 - 104) = a11;
  *(_DWORD *)(v18 - 136) = v17 - v19 + 777;
  *(_DWORD *)(v18 - 132) = v15 - v19 + (v17 ^ 0x1A273D42);
  *(_QWORD *)(v18 - 152) = a12;
  *(_QWORD *)(v18 - 144) = a10;
  ((void (*)(uint64_t))((char *)*(&off_1E6CBBAA0 + (v17 ^ 0x27)) - 8))(v18 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16
                                                      + 8 * (((*(_DWORD *)(v18 - 120) == v14) * (v17 + 272)) ^ v17))
                                          - 12))(50202059);
}

uint64_t sub_1B778BFE0(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4
                                                               + 8
                                                               * (((*(_DWORD *)(v2 + 48 * (v3 + v1)) != (((v5 ^ 0x661) + 822138445) | 0x8D720A8) - 390587777)
                                                                 * (((v5 ^ 0x661) - 285) ^ 0x5B2)) ^ v5 ^ 0x661))
                                                   - 4))(a1, v6);
}

uint64_t sub_1B778C054@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((837
                                * (((v3 + v1 - 1447 + ((v1 - 1174931432) & 0x7FDFFFF9) - 563781493) ^ a1) == v2 - 596645944)) ^ v1)))();
}

uint64_t sub_1B778C0BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((428 * ((((v6 - v7 + 165) ^ 0xFFFFFFFFFFFFF5ALL) & a4) - 1 > 1)) ^ (a6 + v6 + 578)))
                            - 8))();
}

uint64_t sub_1B778C100@<X0>(uint64_t a1@<X1>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26)
{
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;

  *(_DWORD *)(a1 + 392) = a3;
  *(_DWORD *)(a1 + 396) = a25;
  *(_QWORD *)(a1 + 400) = a23;
  *(_DWORD *)(a1 + 408) = ((v31 - 67633386) & 0x3DDFFDFD ^ 0x7AA59D7A) - v32 + a26;
  *(_QWORD *)(a1 + 416) = v27 + (v32 - 1923582273);
  v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 48 * a2 + 8))(a11, a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v30 + 8
                                                            * ((94 * (v33 + v28 - (v29 & (2 * v33)) == v28)) ^ v31))
                                          - 12))(50202059);
}

uint64_t sub_1B778C1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v8
                                                               + 8
                                                               * ((323
                                                                 * (((v9 - a6) ^ 0x44D6078Du)
                                                                  + *(_DWORD *)(v6 + 48 * v7 + 36) < 0x80000003)) ^ v9))
                                                   - 12))(a1, v10);
}

uint64_t sub_1B778C23C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1775 * (*(_DWORD *)(v2 + 48 * (v3 + v1) + 36) != v3)) ^ v0))
                            - ((v0 - 321) ^ (v0 + 217562057) & 0xF30842F5 ^ 0xCLL)))();
}

uint64_t sub_1B778C298@<X0>(uint64_t a1@<X3>, int a2@<W5>, int a3@<W8>)
{
  int v4;

  if ((a3 - 1377131489) <= 0x10 && ((1 << (a3 + 31)) & 0x12105) != 0)
    __asm { BR              X9 }
  return v4 ^ 0x8A5F98FF;
}

void sub_1B778C4A8(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X10 }
}

uint64_t sub_1B778C574@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067 * ((&a4 & 0xA96767C1 | ~(&a4 | 0xA96767C1)) ^ 0x885E25E5);
  a8 = v12 ^ 0x298F065F;
  a6 = (v10 - 597) ^ v12;
  a7 = &STACK[0x3AA4CED55BA13F91];
  a4 = &STACK[0x39E8CCF6252BBC00];
  a5 = v11;
  v13 = ((uint64_t (*)(unint64_t **))(*(_QWORD *)(a1 + 8 * (v10 - 1039)) - 8))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((244
                                              * (*(_DWORD *)(v11 - 0x1E6EF7153090DAALL) == v8
                                                                                         + 443 * (v10 ^ 0x470)
                                                                                         - 886)) ^ v10)))(v13);
}

uint64_t sub_1B778C660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((218 * (a10 == v10 + ((v12 - 884) | v13) - 1134)) ^ v12)) - 8))();
}

void sub_1B778C694(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned __int8 *v5;

  v3 = v5[3] ^ 0x63;
  v4 = ((*v5 ^ 0x63) << 24) | ((v5[1] ^ 0x63) << 16) | ((v5[2] ^ 0x63) << 8) | v3;
  *(_DWORD *)(*(_QWORD *)(v1 + 8) - 0x31FD77B69BC3E185) = v4 + v2 - 2 * (v4 & (v2 + 26) ^ v3 & 0x1A);
  *(_DWORD *)(v1 + 4) = *a1;
}

void sub_1B778C750(uint64_t a1)
{
  int v1;

  v1 = 460628867 * ((((2 * a1) | 0x69ED4642) - a1 - 888578849) ^ 0x7860215C);
  __asm { BR              X9 }
}

uint64_t sub_1B778C7F0@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v1 - 176) * (v2 == 1279817996)) ^ v1))
                            - ((v1 + 192824581) & 0xF481BBFB)
                            + 454))();
}

uint64_t sub_1B778C850@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v6 = *(unsigned __int8 *)(*a1 + (v3 + v5 + 256)) ^ 0x63 | v2 ^ 0x7584E6BC;
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(a2
                                                                                                  + 8 * ((v4 + 1313) ^ 0x1A)))(a1, 760, 1256, 4294965775, v6 + v2 - ((2 * v6) & 0xEB09CD78), 99, 3943288184);
}

uint64_t sub_1B778C950@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (((((v5 ^ a1) + 1234) ^ v3) * (v4 == v2)) | v5 ^ a1)) - 4))();
}

uint64_t sub_1B778C97C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((((v2 + 250) ^ 0x5B) * (v1 != 0)) ^ v2)) - 4))();
}

uint64_t sub_1B778C9A4@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v6 = (2 * v5) ^ 0x6A;
  *(_DWORD *)(*(_QWORD *)(v4 - 0x709331AC20D1CC01) + 4 * (v2 + v3 + 1)) = a1;
  v7 = v3 + v6 - 457;
  v8 = v6 + 1243;
  *(_DWORD *)(v4 - 0x709331AC20D1CC05) = v7;
  if (v2 + v7 + 1 >= 0)
    v9 = v2 + v7 + 1;
  else
    v9 = ~(v2 + v7);
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((((int)((v9 ^ 0x2BFBBB3F) + ((2 * v9) & 0x57F7767E) + (v8 ^ 0xF577C37F) + v2) >= 0)
                                          * ((v8 ^ 0x791) - 230)) ^ v8))
                            - 12))();
}

uint64_t sub_1B778CA74@<X0>(uint64_t a1@<X8>)
{
  int v1;
  _QWORD *v2;
  int v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1903
                                          * (((v3 - 37) ^ (*(_DWORD *)(*v2 + 4 * v4) == v1)) & 1)) ^ v3))
                            - 12))();
}

uint64_t sub_1B778CAA8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((((int)(((v3 - 150) ^ 0xFFFFFECB) + v2 + v1) >= 0) * ((v4 ^ 0x791) - 230)) ^ v4))
                            - 12))();
}

uint64_t sub_1B778CAE8(uint64_t result)
{
  int v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;

  if ((v2 + v1) >= 0x7FFFFFFF)
    v5 = 1122435634 - v4;
  else
    v5 = v4;
  *v3 = v5;
  *(_DWORD *)(result + 12) = 1747324538;
  return result;
}

uint64_t sub_1B778CB34(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*((_QWORD *)&unk_1E6CB7A50 + ((248 * (*(_DWORD *)(a2 + 4) != 1123162732)) ^ 0x175u)) - 8))();
}

uint64_t sub_1B778CB78@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_1B778CB80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 96) + 448) = *(_BYTE *)(*(_QWORD *)(a2 + 8) + 12);
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 6312) - 8))();
}

void sub_1B778CBEC()
{
  JUMPOUT(0x1B778CBBCLL);
}

void sub_1B778CBF4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)a1 ^ (1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D));
  v2 = *(_DWORD *)(a1 + 24) - 1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = -907030895 * (*(_DWORD *)(a1 + 48) ^ (1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D)))
     + 41214461;
  v6 = 1224239923 * ((&v7 & 0x6D369F0D | ~(&v7 | 0x6D369F0D)) ^ 0x607A9D25);
  v14 = *(_QWORD *)(a1 + 8);
  v13 = v2 - ((2 * v2 + 1345629210) & 0xE3A044E4) - v6 - 1712686977;
  v7 = v4;
  v11 = v4;
  v12 = v3;
  v9 = v6 ^ (v1 + 368399669);
  v10 = (v5 ^ 0x27FFDEB7) - v6 + ((2 * v5) & 0x4FFFBD6E) - 608225408;
  sub_1B778E290((uint64_t)&v7);
  __asm { BR              X8 }
}

uint64_t sub_1B778CDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unint64_t *a12, char a13, int a14, uint64_t a15, int a16)
{
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;

  v25 = *(_BYTE *)(v17 + 28) - v24;
  v26 = ((((2 * &a11) | 0xDC826EDC) - &a11 + 297715858) ^ 0x5D3C873A) * v22;
  a12 = &STACK[0x7B9E9BA5BB9673F6];
  a15 = v23;
  a14 = v26 + (v18 ^ (v21 + 914) ^ 0x27AF6AD3) + (v19 & 0x4F5EDEBA) - 93193488;
  a16 = v21 - v26 - 404;
  a13 = ((v25 ^ 2) + (~(2 * v25) & 0xD2) - 32) ^ (((((2 * &a11) | 0xDC) - &a11 - 110) ^ 0x3A)
                                                * v22);
  v27 = ((uint64_t (*)(int *))(*(_QWORD *)(v16 + 8 * (v21 - 443)) - 8))(&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((1986 * (a11 == 1973469985)) ^ v21)) - 12))(v27);
}

uint64_t sub_1B778CE9C()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((70
                                          * (v0 - 1474669045 < ((858 * (v2 ^ 0x58C) - 306237623) & 0x1240CBFE ^ 0xFFFFFE02))) ^ v2))
                            - 4))();
}

uint64_t sub_1B778CF00@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  a4 = (v8 - 578) ^ (1374699841 * (((&a4 | 0x31DA41DC) - (&a4 & 0x31DA41DC)) ^ 0x5C2E59D5));
  a6 = a1;
  a7 = a3;
  v10 = (*(uint64_t (**)(unsigned int *))(v7 + 8 * (v8 - 1593)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((14 * (((2 * v8 + 1) ^ (a5 == 1973469985)) & 1)) ^ v8))
                                          - 12))(v10);
}

uint64_t sub_1B778CFA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  _DWORD v6[2];
  uint64_t v7;

  v6[1] = (v2 ^ 0x748)
        + 535753261 * (((v6 | 0xB540C2BC) - (v6 & 0xB540C2BC)) ^ 0xBFB4CC93)
        + 93;
  v7 = a1;
  result = (*(uint64_t (**)(_DWORD *))(v3 + 8 * (v2 ^ 0x637)))(v6);
  *(_DWORD *)(v1 + 4) = v4;
  return result;
}

void sub_1B778D080(uint64_t a1)
{
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 1374699841 * (((a1 | 0xEA022A98) - (a1 & 0xEA022A98)) ^ 0x87F63291);
  v3 = *(_DWORD *)(a1 + 40) + v2;
  v4 = v3 + 460628867 * (((&v4 | 0x45D3A2CF) + (~&v4 | 0xBA2C5D30)) ^ 0x94520B3) - 231790427;
  nullsub_1(&v4);
  __asm { BR              X1 }
}

uint64_t sub_1B778D200(uint64_t a1)
{
  unsigned int v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((a1 + ((v6 + v7 + 959) ^ v6) - 1636) & ((v6 + v7 + 959) & v1 ^ v2)) == v5) * v3) ^ v7)))();
}

void sub_1B778D238()
{
  JUMPOUT(0x1B778D1A8);
}

uint64_t sub_1B778D244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  _BOOL4 v5;

  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 8 * (v4 - 652)))((((v4 - 550) | 0x14) ^ 0xBD0DE535) + *(_DWORD *)(v3 + 24 * v2 + 16), 3511634213) != 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v5 * ((v4 ^ 0x4C3) - 1568)) ^ v4)))();
}

uint64_t sub_1B778D2A8()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v3 = v1 - (((v1 << (((v2 + 59) & 0x3C) - 11)) + 2048641858) & 0x8DE76A2E) - 2080269640;
  v4 = ((2 * v3) & 0xD7F3ADF6 ^ 0x85E32826) + (v3 ^ 0xAD0A63EC) - 572555282 == 1238980329;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (((4 * v4) | (8 * v4)) ^ v2)) - 8))();
}

uint64_t sub_1B778D350()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1449
                                          * ((((v0 - 75) ^ (*(_QWORD *)(v1 + 8) == 0x68121A1912A1E180)) & 1) == 0)) ^ v0))
                            - 12))();
}

uint64_t sub_1B778D394@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(a2 - 0x68121A1912A1E180) = v2;
  v5 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(*(_QWORD *)(v3 + 24) - 0x19D396D9A609BEA0) = result;
  *(_DWORD *)(v5 - 0x15C2A15CF2725D85) = v4;
  *(_DWORD *)v3 = 1973469985;
  return result;
}

uint64_t sub_1B778D6D8(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = 1759421093 * (((a1 | 0x72C27792) - (a1 & 0x72C27792)) ^ 0xC1BFC7C6);
  v3 = *(_DWORD *)(a1 + 20) - v2;
  v4 = *(_DWORD *)(a1 + 16) ^ v2;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = 1374699841 * ((&v10 + 1172917496 - 2 * ((unint64_t)&v10 & 0x45E94CF8)) ^ 0x281D54F1);
  v8 = ((-1953232039 * (*(_DWORD *)a1 + v2) + 1711166245) ^ 0x7FF187EF)
     + v7
     + ((2 * (-1953232039 * (*(_DWORD *)a1 + v2) + 1711166245)) & 0xFFE30FDE)
     - 78645189;
  v3 -= 2138963244;
  v13 = v3 - v7 + 1176;
  v14 = v8;
  v15 = 1737788877 * v4 - ((-819389542 * v4 + 42262296) & 0xF01BFA7C) - v7 - 112169782;
  v12 = v6;
  v10 = v5;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_1E6CBBAA0 + v3) - 8))(&v10);
  *(_DWORD *)(a1 + 4) = v11;
  return result;
}

uint64_t sub_1B778D874(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 56;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B778D894(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;

  v1 = 1759421093 * ((result - 2 * (result & 0xCE10C030FCF42454) - 0x31EF3FCF030BDBACLL) ^ 0xE0AE01604F899400);
  v2 = *(_DWORD *)result - v1;
  v3 = *(_DWORD *)(result + 16) ^ v1;
  v4 = *(_QWORD *)(result + 24);
  v5 = v4 + v1;
  v6 = *(_DWORD *)(result + 12) + v1;
  v7 = *(_DWORD *)(result + 4) + v1;
  v8 = *(_QWORD *)(result + 40);
  v9 = v4 != v8;
  v10 = v5 >= v8 + v1;
  if ((v3 & 1) == 0)
    v10 = v9;
  if (v10)
    v11 = v7;
  else
    v11 = v2;
  *(_DWORD *)(result + 32) = v11 ^ v6;
  return result;
}

uint64_t sub_1B778D928(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;

  v1 = 235795823 * ((((2 * result) | 0xAE1C50A9AAB8544) - result - 0x570E2854D55C2A2) ^ 0xDC0587BD9F88BFBLL);
  v2 = *(_DWORD *)(result + 40) - v1;
  v3 = *(_DWORD *)(result + 20) - v1;
  v4 = *(_QWORD *)(result + 8) ^ v1;
  v5 = *(_DWORD *)(result + 36) ^ v1;
  v6 = *(_QWORD *)(result + 24) - v1;
  v7 = *(_DWORD *)(result + 32) ^ v1;
  v8 = v4 == v6;
  v9 = v4 > v6;
  v10 = v8;
  if ((v5 & 1) == 0)
    v9 = v10;
  if (v9)
    v7 = v3;
  *(_DWORD *)result = v7 ^ v2;
  return result;
}

void sub_1B778D9C8(_DWORD *a1)
{
  signed int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1 - 1225351577 * (((a1 | 0x8B357C10) - (a1 & 0x8B357C10)) ^ 0xF5CAE622) - 426522904;
  v2 = *(_QWORD *)((char *)*(&off_1E6CBBAA0 + v1) - 4);
  v3 = v1
     - 108757529 * ((((&v3 | 0x5D60ED82) ^ 0xFFFFFFFE) - (~&v3 | 0xA29F127D)) ^ 0x42037056)
     + 797;
  v4 = v2;
  sub_1B776B5E8((uint64_t)&v3);
}

uint64_t sub_1B778DAB0(char a1, unsigned int a2)
{
  return byte_1B779D340[(byte_1B7799B00[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DADC(unsigned int a1)
{
  return byte_1B779D340[byte_1B7799B00[a1] ^ 0xEC] ^ a1;
}

uint64_t sub_1B778DB08(char a1, unsigned int a2)
{
  return byte_1B779D440[(byte_1B7799C00[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DB34(unsigned int a1)
{
  return byte_1B779D440[byte_1B7799C00[a1] ^ 0x93] ^ a1;
}

uint64_t sub_1B778DB60(char a1, unsigned int a2)
{
  return byte_1B7799D00[(byte_1B77A4D20[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DB8C(unsigned int a1)
{
  return byte_1B7799D00[byte_1B77A4D20[a1] ^ 0x22] ^ a1;
}

uint64_t sub_1B778DBB8(char a1, unsigned int a2)
{
  return byte_1B77A4E20[(byte_1B77A1430[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DBE4(unsigned int a1)
{
  return byte_1B77A4E20[byte_1B77A1430[a1] ^ 0xB] ^ a1;
}

uint64_t sub_1B778DC10(char a1, unsigned int a2)
{
  return byte_1B77A1530[(byte_1B779D540[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DC3C(unsigned int a1)
{
  return byte_1B77A1530[byte_1B779D540[a1] ^ 0xDC] ^ a1;
}

uint64_t sub_1B778DC68(char a1, unsigned int a2)
{
  return byte_1B779D640[(byte_1B7799E00[a2] ^ a1)] ^ a2;
}

uint64_t sub_1B778DC94(unsigned int a1)
{
  return byte_1B779D340[byte_1B7799B00[a1] ^ 0xF2] ^ a1;
}

uint64_t sub_1B778DCC0(unsigned int a1)
{
  return byte_1B779D340[byte_1B7799B00[a1] ^ 6] ^ a1;
}

uint64_t sub_1B778DCE8(unsigned int a1)
{
  return byte_1B77A4E20[byte_1B77A1430[a1] ^ 0x11] ^ a1;
}

uint64_t sub_1B778DD14(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3 = 1081 - 535753261 * ((((2 * &v2) | 0xCA73AF1A) - &v2 + 449194099) ^ 0xEFCDD9A2);
  sub_1B7774130((uint64_t)&v2);
  return v4;
}

void sub_1B778DDA8(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 235795823
     * (((&v1 | 0x2539766F) - &v1 + (&v1 & 0xDAC68990)) ^ 0xB1943F36)
     + 528;
  v2 = a1;
  sub_1B776C878((uint64_t)&v1);
}

uint64_t sub_1B778DE3C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B778DE54(uint64_t result)
{
  unint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;
  int v11;

  v1 = 1224239923
     * ((-2 - ((~result | 0xA9794F52C0023E71) + (result | 0x5686B0AD3FFDC18ELL))) ^ 0x8123FA3B32B1C3A6);
  v2 = *(_DWORD *)(result + 40) - v1;
  v3 = *(_DWORD *)(result + 8) ^ v1;
  v4 = *(_QWORD *)(result + 24) + v1;
  v5 = *(_DWORD *)(result + 4) - v1;
  v6 = *(_DWORD *)(result + 12) ^ v1;
  v7 = *(_QWORD *)(result + 32) - v1;
  v8 = (uint64_t)v7 < (uint64_t)v4;
  v9 = v7 < v4;
  v10 = v8;
  if ((v2 & 1) != 0)
    v9 = v10;
  if (v9)
    v11 = v5;
  else
    v11 = v3;
  *(_DWORD *)result = v6 ^ v11;
  return result;
}

uint64_t sub_1B778DEF8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B778DF10(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 24);
  return 0;
}

uint64_t sub_1B778DF28(_DWORD *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  v2 = *a1 - 108757529 * ((a1 & 0x3E324894 | ~(a1 | 0x3E324894)) ^ 0x2151D540);
  result = ((uint64_t (*)(char *, char *))*(&off_1E6CBBAA0 + (int)(v2 - 1695027228)))((char *)*(&off_1E6CBBAA0 + (int)(v2 - 1695027286)) - 8, (char *)*(&off_1E6CBBAA0 + (int)(v2 - 1695027422)) - 8);
  v4 = *(_DWORD *)*(&off_1E6CBBAA0 + (int)(v2 ^ 0x65081032));
  if ((_DWORD)result)
    v4 = -1973446241;
  a1[1] = v4;
  return result;
}

void sub_1B778DFE0()
{
  unint64_t v0;
  _BYTE v1[8];
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 792496711 * ((unint64_t)&v1[qword_1EF181918 - qword_1EF181988] ^ 0x3620D3564722E72);
  qword_1EF181988 = 792496711 * (_QWORD)&v1[qword_1EF181918 - qword_1EF181988 - 0x3620D3564722E72];
  qword_1EF181918 = v0;
  v2 = (uint64_t)*(&off_1E6CBBAA0
                + ((71 * ((v0 + qword_1EF181988) ^ 0x72)) ^ byte_1B77A1530[byte_1B779D540[(71 * ((v0 + qword_1EF181988) ^ 0x72))] ^ 0xDC])
                + 144);
  v3 = 1081
     - 535753261
     * (((&v2 | 0x19ACA3E5) - &v2 + (&v2 & 0xE6535C18)) ^ 0x1358ADCA);
  sub_1B7774130((uint64_t)&v2);
}

void sub_1B778E108(uint64_t a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 910 - 108757529 * ((2 * (&v1 & 0x79B1DF38) - &v1 - 2041700159) ^ 0x66D242EA);
  v2 = a1;
  sub_1B776B5E8((uint64_t)&v1);
}

_BYTE *sub_1B778E19C(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_1B778E22C + 4 * byte_1B779D747[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t sub_1B778E290(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = 1224239923 * (((a1 | 0x54F5E249) - a1 + (a1 & 0xAB0A1DB6)) ^ 0xA6461F9E);
  v3 = *(_DWORD *)(a1 + 12) ^ v2;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)a1;
  v8 = (&v10 & 0x3D29F54D | ~(&v10 | 0x3D29F54D)) ^ 0x3065F765;
  v11 = v2 + *(_DWORD *)(a1 + 16) - 1224239923 * v8 + 128990384;
  v12 = v4;
  v13 = v5;
  v10 = v7;
  v16 = v3 + 1224239923 * v8 - 368399154;
  v14 = v6;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_1E6CBBAA0 + (v3 ^ 0x15F557BA)) - 4))(&v10);
  *(_DWORD *)(a1 + 8) = v15;
  return result;
}

uint64_t sub_1B778E3C0(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t result;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = 1755732067 * (a1 ^ 0xDEC6BDDB);
  v3 = *(_DWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD *)(a1 + 20) - v2 + 2024873265;
  v9 = 235795823 * ((&v11 & 0x3A4B01DF | ~(&v11 | 0x3A4B01DF)) ^ 0x5119B779);
  v16 = v9 ^ (*(_DWORD *)(a1 + 20) - v2 + 2024874841);
  v11 = v7;
  v17 = v5;
  v13 = v6;
  v14 = v4;
  v12 = v3 - v2 + 889666985 + v9;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_1E6CBBAA0 + v8) - 12))(&v11);
  *(_DWORD *)(a1 + 40) = v15;
  return result;
}

uint64_t sub_1B778E4D0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_1B778E4E8(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;

  v1 = 1178560073 * (((result | 0x1F8F921A8C67E875) - (result & 0x1F8F921A8C67E875)) ^ 0x473C2F236F39017);
  v2 = *(_QWORD *)(result + 16) + v1;
  v3 = *(_QWORD *)result ^ v1;
  v4 = v2 == v3;
  v5 = v2 > v3;
  v6 = v4;
  if (((*(_DWORD *)(result + 12) + (_DWORD)v1) & 1) == 0)
    v5 = v6;
  v4 = !v5;
  v7 = 36;
  if (!v4)
    v7 = 32;
  *(_DWORD *)(result + 28) = *(_DWORD *)(result + v7) ^ v1 ^ (*(_DWORD *)(result + 8) - v1);
  return result;
}

uint64_t sub_1B778E578(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((-2 - ((a1 | 0x71A11D05) + (~(_DWORD)a1 | 0x8E5EE2FA))) ^ 0x50985F21);
  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  v6 = v1
     - 1178560073 * ((((&v5 | 0x67694020) ^ 0xFFFFFFFE) - (~&v5 | 0x9896BFDF)) ^ 0x2202C7BD)
     + 1882357652;
  v7 = v3;
  v5 = v2;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_1E6CBBAA0 + (int)(v1 ^ 0x8FCD8121)) - 4))(&v5);
}

void sub_1B778E67C()
{
  unint64_t v0;
  unsigned int v1;
  _BYTE v2[8];
  char *v3;
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = (unint64_t)&v2[qword_1EF181918 ^ qword_1EF180D68];
  qword_1EF180D68 = 792496711 * v0 - 0x4EBB0CC1C693AA62;
  qword_1EF181918 = 792496711 * (v0 ^ 0x3620D3564722E72);
  v4 = 1081 - 535753261 * ((&v3 + 504105154 - 2 * (&v3 & 0x1E0C08C2)) ^ 0x14F806ED);
  v3 = (char *)*(&off_1E6CBBAA0
               + ((71 * (qword_1EF180D68 ^ 0x72 ^ qword_1EF181918)) ^ byte_1B779D340[byte_1B7799B00[(71 * (qword_1EF180D68 ^ 0x72 ^ qword_1EF181918))] ^ 0xF2])
               + 30)
     - 4;
  sub_1B7774130((uint64_t)&v3);
  v4 = 1081
     - 535753261
     * (((&v3 | 0x942CFDEE) - &v3 + (&v3 & 0x6BD30210)) ^ 0x9ED8F3C1);
  v3 = (char *)*(&off_1E6CBBAA0
               + ((71 * ((qword_1EF181918 + qword_1EF180D68) ^ 0x72)) ^ byte_1B77A4E20[byte_1B77A1430[(71 * ((qword_1EF181918 + qword_1EF180D68) ^ 0x72))] ^ 0xB])
               + 4)
     - 4;
  sub_1B7774130((uint64_t)&v3);
  v1 = 3804331 * ((&v3 - 2 * (&v3 & 0x9C3CB51) + 163826513) ^ 0xF35D3807);
  BYTE4(v3) = 70 - v1;
  LODWORD(v3) = v1 ^ 0x46D;
  sub_1B77552A4((uint64_t)&v3);
}

uint64_t sub_1B778E8A4(unsigned int a1)
{
  return byte_1B779D640[byte_1B7799E00[a1] ^ 0xF4] ^ a1;
}

uint64_t sub_1B778E8D0(unsigned int a1)
{
  return byte_1B77A4E20[byte_1B77A1430[a1] ^ 0x7C] ^ a1;
}

uint64_t sub_1B778E8F8(unsigned int a1)
{
  return byte_1B779D340[byte_1B7799B00[a1] ^ 0xE1] ^ a1;
}

uint64_t rosetta_is_current_process_translated()
{
  return 0;
}

uint64_t parse_macho_iterate_slices(const char *a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v8;
  char *v9;

  v4 = open(a1, 256);
  if (v4 < 0)
  {
    v8 = __error();
    v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0;
  }
  else
  {
    v5 = v4;
    v6 = parse_macho_iterate_slices_fd(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }
}

uint64_t parse_macho_iterate_slices_fd(int a1, uint64_t a2, uint64_t a3)
{
  int *v5;
  int v6;
  int *v7;
  uint64_t v8;
  char *v10;
  char *v11;
  uint32_t magic;
  int *v13;
  fat_arch *v14;
  size_t v15;
  uint64_t v16;
  fat_arch *v17;
  off_t offset;
  char *macho_header_and_load_commands;
  char *v20;
  char v21;
  int *v22;
  fat_header fat_header;
  stat v24;
  int __buf;

  __buf = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0;
  }
  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0;
  }
  *__error() = 0;
  if (pread(a1, &__buf, 4uLL, 0) != 4)
  {
    v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0;
  }
  if (__buf <= -805638659)
  {
    if (__buf != -1095041334 && __buf != -889275714)
    {
      v6 = -822415874;
      goto LABEL_15;
    }
    fat_header = 0;
    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0) == 8)
    {
      magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        magic = fat_header.magic;
      }
      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        v15 = 20 * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          v14 = (fat_arch *)malloc_type_malloc(20 * fat_header.nfat_arch, 0x50FF23B5uLL);
          if (v15 == pread(a1, v14, v15, 8))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              v8 = 1;
              if (!v14)
                return v8;
              goto LABEL_28;
            }
            v16 = 0;
            v17 = v14;
            while (1)
            {
              syslog(7, "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }
              macho_header_and_load_commands = _read_macho_header_and_load_commands(a1, offset, v24.st_size);
              if (!macho_header_and_load_commands)
                break;
              v20 = macho_header_and_load_commands;
              v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))(a3, v17, macho_header_and_load_commands);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if ((v21 & 1) != 0)
                  continue;
              }
              goto LABEL_37;
            }
            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }
          else
          {
            v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }
LABEL_27:
          v8 = 0;
          if (!v14)
            return v8;
LABEL_28:
          free(v14);
          return v8;
        }
        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }
      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }
    else
    {
      v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }
    v14 = 0;
    goto LABEL_27;
  }
  if ((__buf + 17958194) >= 2)
  {
    v6 = -805638658;
LABEL_15:
    if (__buf != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0;
    }
  }
  v10 = _read_macho_header_and_load_commands(a1, 0, v24.st_size);
  if (v10)
  {
    v11 = v10;
    (*(void (**)(uint64_t, _QWORD, char *))(a3 + 16))(a3, 0, v10);
    free(v11);
    return 1;
  }
  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0;
}

char *_read_macho_header_and_load_commands(int a1, off_t a2, uint64_t a3)
{
  ssize_t v6;
  unsigned int v7;
  unsigned int v8;
  int *v9;
  size_t v10;
  size_t v11;
  char *v12;
  char *v13;
  ssize_t v14;
  int *v16;
  int *v17;
  __int128 __buf;
  __int128 v19;

  __buf = 0u;
  v19 = 0u;
  v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }
  v8 = v19;
  v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if ((_DWORD)__buf != -17958194)
    {
      if ((_DWORD)__buf == -17958193)
        goto LABEL_12;
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }
LABEL_15:
    v10 = 28;
    goto LABEL_16;
  }
  if ((_DWORD)__buf == -822415874)
  {
    v7 = bswap32(DWORD1(v19));
    v8 = bswap32(v19);
    goto LABEL_15;
  }
  if ((_DWORD)__buf != -805638658)
    goto LABEL_23;
  v7 = bswap32(DWORD1(v19));
  v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }
  v10 = 32;
LABEL_16:
  v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }
  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }
  v12 = (char *)malloc_type_malloc(v10 + v7, 0xD7630F4AuLL);
  v13 = v12;
  if (!v12)
  {
    v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }
  memcpy(v12, &__buf, v10);
  v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }
  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0;
  }
  return v13;
}

uint64_t get_highest_sdk_version_for_any_slice(const char *a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __get_highest_sdk_version_for_any_slice_block_invoke;
  v4[3] = &unk_1E6CBC1F8;
  v4[4] = &v5;
  v4[5] = a1;
  if ((parse_macho_iterate_slices(a1, (uint64_t)v4) & 1) != 0)
  {
    v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke(uint64_t a1)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  dyld_get_image_versions();
  v2 = *((_DWORD *)v7 + 6);
  if (!v2)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    v2 = *((_DWORD *)v7 + 6);
  }
  syslog(7, "Slice had version 0x%08x", v2);
  v3 = *((_DWORD *)v7 + 6);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3 > *(_DWORD *)(v4 + 24))
    *(_DWORD *)(v4 + 24) = v3;
  _Block_object_dispose(&v6, 8);
  return 1;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

BOOL parse_macho_is_cpu_type_runnable_for_apps(int a1, int a2, char *a3, int *a4)
{
  int v8;
  _BOOL8 v9;
  int *v10;
  char *v11;
  int v12;
  char v13;
  size_t v15;
  int v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    v9 = 0;
    if (!a4)
      return v9;
    goto LABEL_12;
  }
  v17[0] = a1;
  v17[1] = a2;
  v16 = 0;
  v15 = 4;
  v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  v9 = v8 == 0;
  if (v8)
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    v13 = 0;
  }
  else if (v16 < 1 || a1 != 16777228 || (a2 & 0xFFFFFE) != 0)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    v12 = 0;
    v13 = 1;
  }
  *a3 = v13;
  if (a4)
LABEL_12:
    *a4 = v12;
  return v9;
}

BOOL parse_macho_is_file_runnable_for_apps(const char *a1, _BYTE *a2, _DWORD *a3)
{
  int v6;
  int v7;
  unint64_t st_size;
  const char *v9;
  int v10;
  char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  size_t v17;
  int v18;
  fat_arch *v19;
  uint64_t v20;
  int *p_cpusubtype;
  int v22;
  const char *v23;
  int v24;
  int v25;
  char *cputype;
  uint64_t cpusubtype;
  mach_header_64 fat_header;
  int v30;
  stat v31;
  char v32;
  int v33;

  v33 = 0;
  v32 = 0;
  memset(&v31, 0, sizeof(v31));
  v30 = 0;
  if (!a1)
  {
    v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }
  if (!a2)
  {
    v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }
  v6 = open(a1, 256);
  if (v6 != -1)
  {
    v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      v12 = *__error();
      v33 = 3;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v12);
      v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }
    st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      v13 = *__error();
      v33 = 5;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v13);
      v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }
    if (lseek(v7, 0, 0) == -1)
    {
      v14 = *__error();
      v33 = 4;
      cputype = (char *)a1;
      cpusubtype = (uint64_t)strerror(v14);
      v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }
    if (st_size >= 8 && v30 == -1095041334)
    {
      *(_QWORD *)&fat_header.magic = 0;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        v16 = *__error();
        v33 = 5;
        cputype = (char *)a1;
        cpusubtype = (uint64_t)strerror(v16);
        v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }
      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        v33 = 7;
        cputype = (char *)fat_header.cputype;
        cpusubtype = 1024;
        v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        v15 = 3;
        goto LABEL_55;
      }
      v17 = 20 * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        v33 = 8;
        cputype = (char *)a1;
        v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }
      v19 = (fat_arch *)malloc_type_malloc(v17, 0x360B8367uLL);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            v20 = 0;
            p_cpusubtype = &v19->cpusubtype;
            while (parse_macho_is_cpu_type_runnable_for_apps(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32)
                goto LABEL_64;
              p_cpusubtype += 5;
              if (++v20 >= (unint64_t)fat_header.cputype)
                goto LABEL_65;
            }
            v23 = "Failed to check if cpu type is runnable";
          }
          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }
LABEL_65:
            cputype = (char *)a1;
            v23 = "Failed to find matching arch for FAT input file %s";
          }
        }
        else
        {
          v24 = *__error();
          v33 = 6;
          cputype = (char *)a1;
          cpusubtype = (uint64_t)strerror(v24);
          v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }
      else
      {
        v22 = *__error();
        v33 = 9;
        cputype = strerror(v22);
        v23 = "Failed to allocate memory for fat arch(s): %s";
      }
      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0)
        close(v7);
LABEL_58:
      if (!a2)
        goto LABEL_60;
      goto LABEL_59;
    }
    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874)
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            cpusubtype = fat_header.cpusubtype;
            v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            v19 = 0;
            goto LABEL_56;
          }
          goto LABEL_50;
        }
        goto LABEL_41;
      }
      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658)
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            cpusubtype = fat_header.cpusubtype;
            v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }
LABEL_50:
          v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }
LABEL_41:
        v18 = *__error();
        v33 = 5;
        cputype = (char *)a1;
        cpusubtype = (uint64_t)strerror(v18);
        v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }
    v33 = 10;
    cputype = (char *)a1;
    v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }
  v10 = *__error();
  v33 = 2;
  v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  v25 = v33;
  if (a3)
    *a3 = v33;
  return v25 == 0;
}

void __getUMUserManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UserManagementLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ICLSoftLinking.h"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUMUserManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getUMUserManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ICLSoftLinking.h"), 39, CFSTR("Unable to find class %s"), "UMUserManager");

  __break(1u);
}

void MIFetchInfoForUsername_cold_1(_QWORD *a1, _OWORD *a2)
{
  int v4;

  v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  strerror(v4);
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIFetchInfoForUsername_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIAssumeIdentity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B76F3000, MEMORY[0x1E0C81028], a3, "%s: Attempting to assume an identity of 0/0, which should be the default for the helper service", a5, a6, a7, a8, 2u);
}

void MIRestoreIdentity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B76F3000, MEMORY[0x1E0C81028], a3, "%s: Attempting to restore an identity without having first assumed an identity", a5, a6, a7, a8, 2u);
}

void MIReserveMemoryForValidation_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B76F3000, MEMORY[0x1E0C81028], a3, "Got validation memory usage of %zu bytes which is greater than our available memory of %zu bytes (while validating %@); hoping for the best",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void MIReturnMemoryUsedForValidation_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B76F3000, MEMORY[0x1E0C81028], v0, "Got memory size to return, %zu, which would result in %zu available, which is more than the maximum of %zu bytes; ca"
    "pping at max available",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void MIReturnMemoryUsedForValidation_cold_2()
{
  uint64_t v0;
  uint8_t v1[14];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v2 = v0;
  _os_log_fault_impl(&dword_1B76F3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Got memory size to return %zu which is greater than our available memory of %zu bytes; capping at max available",
    v1,
    0x16u);
}

void MIReduceAvailableMemoryForValidationForTesting_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __getEXExtensionPointCatalogClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ExtensionFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ICLSoftLinking.h"), 47, CFSTR("%s"), *a1);

  __break(1u);
}

void __getEXExtensionPointCatalogClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEXExtensionPointCatalogClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ICLSoftLinking.h"), 48, CFSTR("Unable to find class %s"), "EXExtensionPointCatalog");

  __break(1u);
}

void MIMachOSimPlatformForPlatform_cold_1(uint64_t a1)
{
  int v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v1 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  MIMachOStringForPlatform(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 136315650;
  v4 = "MIMachOSimPlatformForPlatform";
  v5 = 2112;
  v6 = v2;
  v7 = 1024;
  v8 = v1;
  _os_log_fault_impl(&dword_1B76F3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: Platform %@ (%u) does not have a simulator equivalent; returning PLATFORM_UNKNOWN",
    (uint8_t *)&v3,
    0x1Cu);

}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1E0DE7180]();
}

uint64_t MISEntitlementDictionaryAllowsEntitlementValue()
{
  return MEMORY[0x1E0DE7190]();
}

uint64_t MISEnumerateMatchingProfilesUnauthoritative()
{
  return MEMORY[0x1E0DE71A8]();
}

uint64_t MISInstallProvisioningProfile()
{
  return MEMORY[0x1E0DE71B8]();
}

uint64_t MISProfileCreateWithData()
{
  return MEMORY[0x1E0DE71C8]();
}

uint64_t MISProfileCreateWithFile()
{
  return MEMORY[0x1E0DE71D0]();
}

uint64_t MISRemoveProvisioningProfile()
{
  return MEMORY[0x1E0DE7230]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x1E0DE7248]();
}

uint64_t MISValidationCopySignatureVersion()
{
  return MEMORY[0x1E0DE7258]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x1E0D4F928]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x1E0CB2BD0](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
  MEMORY[0x1E0CB2BE8](table, pointer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t SecCertificateCopyOrganization()
{
  return MEMORY[0x1E0CD5FB0]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecItemDeleteAllWithAccessGroups()
{
  return MEMORY[0x1E0CD62A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x1E0C99FE0]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1E0C9A0D8]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1E0C81408](buf_p, acl, size);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81460](path_p, *(_QWORD *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1E0C814A8](*(_QWORD *)&fd, acl);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x1E0C814F0](acl);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x1E0C814F8](acl, len_p);
}

uint64_t amfi_interface_query_bootarg_state()
{
  return MEMORY[0x1E0CFDF18]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t container_copy_code_signing_info_for_identifier()
{
  return MEMORY[0x1E0C827D0]();
}

uint64_t container_copy_object()
{
  return MEMORY[0x1E0C827D8]();
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1E0C827E8]();
}

uint64_t container_copy_unlocalized_description()
{
  return MEMORY[0x1E0C827F0]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1E0C82848]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x1E0C82858]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_error_free()
{
  return MEMORY[0x1E0C82878]();
}

uint64_t container_error_get_path()
{
  return MEMORY[0x1E0C82888]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1E0C82890]();
}

uint64_t container_error_get_type()
{
  return MEMORY[0x1E0C82898]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1E0C828A0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1E0C828B0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1E0C828C8]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1E0C828D0]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1E0C828D8]();
}

uint64_t container_get_info_value_for_key()
{
  return MEMORY[0x1E0C828E0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1E0C828F0]();
}

uint64_t container_invalidate_code_signing_cache()
{
  return MEMORY[0x1E0C82918]();
}

uint64_t container_is_equal()
{
  return MEMORY[0x1E0C82920]();
}

uint64_t container_is_new()
{
  return MEMORY[0x1E0C82928]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1E0C82930]();
}

uint64_t container_operation_delete_array()
{
  return MEMORY[0x1E0C82990]();
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  return MEMORY[0x1E0C82998]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_create_from_container()
{
  return MEMORY[0x1E0C829C0]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1E0C829D8]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1E0C829E0]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1E0C82A00]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1E0C82A08]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1E0C82A10]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

uint64_t container_query_set_transient()
{
  return MEMORY[0x1E0C82A20]();
}

uint64_t container_recreate_structure()
{
  return MEMORY[0x1E0C82A38]();
}

uint64_t container_regenerate_uuid()
{
  return MEMORY[0x1E0C82A40]();
}

uint64_t container_replace()
{
  return MEMORY[0x1E0C82A48]();
}

uint64_t container_serialize_copy_deserialized_reference()
{
  return MEMORY[0x1E0C82A60]();
}

uint64_t container_serialize_copy_serialized_reference()
{
  return MEMORY[0x1E0C82A68]();
}

uint64_t container_set_code_signing_info_for_identifier()
{
  return MEMORY[0x1E0C82A70]();
}

uint64_t container_set_data_protection_for_current_user()
{
  return MEMORY[0x1E0C82A78]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1E0C82A80]();
}

uint64_t container_subdirectories_for_class()
{
  return MEMORY[0x1E0C82A88]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1E0C82B20]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1E0C82B28](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1E0C82B38](s, *(_QWORD *)&flag, src);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1E0C82BA0](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1E0C830B0]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C833F8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83540](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1E0C835D8](*(_QWORD *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C83620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C837E0](mhp, segname, sectname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int initgroups(const char *a1, int a2)
{
  return MEMORY[0x1E0C83978](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C83B70](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x1E0C84BE0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1E0C84C70]();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x1E0C84F20](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1E0C850C8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1E0C850D0](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1E0C850D8](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1E0C850E0](state, *(_QWORD *)&key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1E0C85110](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C85318](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856D8](fat_archs, *(_QWORD *)&nfat_arch, *(_QWORD *)&target_byte_order);
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856E0](fat_header, *(_QWORD *)&target_byte_order);
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F0](mh, *(_QWORD *)&target_byte_order);
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F8](mh, *(_QWORD *)&target_byte_order);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

