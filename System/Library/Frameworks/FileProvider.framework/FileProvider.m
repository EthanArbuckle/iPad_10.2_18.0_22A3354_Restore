id getMDItemFileProviderDomainIdentifier()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemFileProviderDomainIdentifierSymbolLoc_ptr;
  v6 = getMDItemFileProviderDomainIdentifierSymbolLoc_ptr;
  if (!getMDItemFileProviderDomainIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v0 = (id *)dlsym(v1, "MDItemFileProviderDomainIdentifier");
    v4[3] = (uint64_t)v0;
    getMDItemFileProviderDomainIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemFileProviderDomainIdentifier_cold_1();
  return *v0;
}

void sub_1A0A365B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemFileProviderID()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemFileProviderIDSymbolLoc_ptr;
  v6 = getMDItemFileProviderIDSymbolLoc_ptr;
  if (!getMDItemFileProviderIDSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v0 = (id *)dlsym(v1, "MDItemFileProviderID");
    v4[3] = (uint64_t)v0;
    getMDItemFileProviderIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemFileProviderID_cold_1();
  return *v0;
}

void sub_1A0A3664C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemFileSize()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemFileSizeSymbolLoc_ptr;
  v6 = getMDItemFileSizeSymbolLoc_ptr;
  if (!getMDItemFileSizeSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v0 = (id *)dlsym(v1, "MDItemFileSize");
    v4[3] = (uint64_t)v0;
    getMDItemFileSizeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemFileSize_cold_1();
  return *v0;
}

void sub_1A0A366E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemLastUsedDate()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemLastUsedDateSymbolLoc_ptr;
  v6 = getMDItemLastUsedDateSymbolLoc_ptr;
  if (!getMDItemLastUsedDateSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v0 = (id *)dlsym(v1, "MDItemLastUsedDate");
    v4[3] = (uint64_t)v0;
    getMDItemLastUsedDateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemLastUsedDate_cold_1();
  return *v0;
}

void sub_1A0A3677C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCSSearchableIndexClass()
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
  v0 = (void *)getCSSearchableIndexClass_softClass;
  v7 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCSSearchableIndexClass_block_invoke;
    v3[3] = &unk_1E444B188;
    v3[4] = &v4;
    __getCSSearchableIndexClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0A36834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_1A0A36ADC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

xattr_flags_t fpfs_xattr_is_syncable(char *a1)
{
  return (fpfs_xattr_flags_from_name(a1) >> 3) & 1;
}

xattr_flags_t fpfs_xattr_flags_from_name(char *a1)
{
  xattr_flags_t v2;
  char *v3;
  const char *v4;
  char **v5;
  size_t v6;
  char *v7;

  if (fpfs_xattr_flags_from_name_onceToken != -1)
    dispatch_once(&fpfs_xattr_flags_from_name_onceToken, &__block_literal_global_42);
  v2 = xattr_flags_from_name(a1);
  v3 = xattr_name_without_flags(a1);
  v4 = (const char *)fpfs_xattr_flags_from_name_xattr_mods;
  if (fpfs_xattr_flags_from_name_xattr_mods)
  {
    v5 = &off_1ECF09680;
    do
    {
      if (*((_BYTE *)v5 - 8))
      {
        v6 = strlen(v4);
        if (!strncmp(v3, v4, v6))
          goto LABEL_11;
      }
      else if (!strcmp(v3, v4))
      {
LABEL_11:
        v2 = ((unint64_t)*(v5 - 3) | v2) & ~(unint64_t)*(v5 - 2);
        break;
      }
      v7 = *v5;
      v5 += 4;
      v4 = v7;
    }
    while (v7);
  }
  free(v3);
  return v2;
}

void sub_1A0A3871C(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug((uint64_t)&STACK[0x2A8]);
  _Unwind_Resume(a1);
}

void **__fp_pop_log(void **result)
{
  if (result)
    return (void **)fpfs_adopt_log(*result);
  return result;
}

void __fp_leave_section_Debug(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __fp_leave_section_Debug_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

id fpfs_adopt_log(void *a1)
{
  id v1;
  void *v2;
  pthread_key_t v3;
  id v4;

  v1 = a1;
  if (init_log_tls_if_needed_once != -1)
    dispatch_once(&init_log_tls_if_needed_once, &__block_literal_global_33_0);
  fpfs_current_log();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = log_pthread_key;
  v4 = v1;
  pthread_setspecific(v3, v4);

  return v2;
}

id fp_current_or_default_log()
{
  void *v0;

  fpfs_current_log();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    fp_default_log();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

void *fpfs_current_log()
{
  if (init_log_tls_if_needed_once != -1)
    dispatch_once(&init_log_tls_if_needed_once, &__block_literal_global_33_0);
  return pthread_getspecific(log_pthread_key);
}

id fp_default_log()
{
  if (fp_default_log_once != -1)
    dispatch_once(&fp_default_log_once, &__block_literal_global_16_0);
  return (id)fp_default_log_logger;
}

void sub_1A0A39A0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A39C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0A39DFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A3A054(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A3A1C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_supports_vfs_ignore_permissions_iopolicy()
{
  return 1;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1B00850](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t fpfs_lp_sandbox_extension_issue_file(uint64_t a1, const char *a2, int a3)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD v11[7];
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v17 = sandbox_extension_issue_file();
  if (!v15[3] && *__error() == 63)
  {
    if (fpfs_supports_long_paths())
    {
      v13 = 0;
      v6 = fpfs_openat_longparent(-2, a2, &v13);
      if ((v6 & 0x80000000) == 0)
      {
        v7 = v6;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 0x40000000;
        v11[2] = __fpfs_lp_sandbox_extension_issue_file_block_invoke;
        v11[3] = &unk_1E444F070;
        v11[4] = &v14;
        v11[5] = a1;
        v11[6] = v13;
        v12 = a3;
        fpfs_fchdir(v6, (uint64_t)v11);
        v8 = *__error();
        close(v7);
        *__error() = v8;
      }
    }
  }
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t fpfs_is_busy_date(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getDSFileOperationClass_softClass;
  v9 = getDSFileOperationClass_softClass;
  if (!getDSFileOperationClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getDSFileOperationClass_block_invoke;
    v5[3] = &unk_1E444B188;
    v5[4] = &v6;
    __getDSFileOperationClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "dateIsBusyFolderDate:", (double)a1 - *MEMORY[0x1E0C9ADF8]);
}

void sub_1A0A3DE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CalculateFolderType(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Downloads"))
    && (objc_msgSend(v12, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) != 0)
  {
    goto LABEL_3;
  }
  if (!objc_msgSend(v13, "fp_isiCloudDriveOrCloudDocsIdentifier"))
    goto LABEL_15;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) == 0)
  {
    objc_msgSend(v14, "URLByDeletingLastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com~apple~CloudDocs"));

    if (!v19)
      goto LABEL_15;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Desktop")) & 1) != 0)
  {
LABEL_8:
    v16 = 2;
    goto LABEL_16;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Documents")) & 1) != 0)
  {
LABEL_10:
    v16 = 3;
    goto LABEL_16;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Downloads")) & 1) == 0)
  {
    if (a5)
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.Desktop")) & 1) != 0)
        goto LABEL_8;
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.Documents")) & 1) != 0)
        goto LABEL_10;
    }
LABEL_15:
    v16 = 1;
    goto LABEL_16;
  }
LABEL_3:
  v16 = 4;
LABEL_16:

  return v16;
}

Class __getDSFileOperationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E444E940;
    v5 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary_0)
    __getDSFileOperationClass_block_invoke_cold_1(&v3);
  result = objc_getClass("DSFileOperation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDSFileOperationClass_block_invoke_cold_2();
  getDSFileOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ____fp_create_section_block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = __fp_create_section_lastSectionID + 1;
  __fp_create_section_lastSectionID = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void sub_1A0A3EE30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A3F1D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FPSearchableItemValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_36;
        case 2u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v35 = 8;
          goto LABEL_48;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 2u;
          break;
        case 4u:
          *(_BYTE *)(a1 + 56) |= 4u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          v35 = 24;
LABEL_48:
          *(_QWORD *)(a1 + v35) = v23;
          continue;
        case 5u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_36:
          v33 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 6u:
          PBReaderReadString();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_msgSend((id)a1, "addArrayOfStringsValue:", v34);

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0)
          goto LABEL_41;
        v24 += 7;
        v15 = v25++ >= 9;
        if (v15)
        {
          v26 = 0;
          goto LABEL_43;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_43:
      *(_QWORD *)(a1 + 16) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t fpfs_icd_package_extension_list_contains(_BYTE *a1)
{
  void *v1;
  uint64_t v2;

  _getExtensionString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    if (fpfs_icd_package_extension_list_init_once != -1)
      dispatch_once(&fpfs_icd_package_extension_list_init_once, &__block_literal_global_54);
    os_unfair_lock_lock((os_unfair_lock_t)&iCDPackageExtensionsLock);
    v2 = objc_msgSend((id)iCDPackageExtensions, "containsObject:", v1);
    os_unfair_lock_unlock((os_unfair_lock_t)&iCDPackageExtensionsLock);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id _getExtensionString(_BYTE *a1)
{
  void *v1;
  _BYTE *v2;
  void *v3;

  v1 = 0;
  if (a1)
  {
    if (*a1 == 46)
      v2 = a1 + 1;
    else
      v2 = a1;
    if (*v2 && *v2 != 46)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseString");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

uint64_t replacePrefix(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v6 && objc_msgSend(v5, "hasPrefix:", v6))
  {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, objc_msgSend(v6, "length"), v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id obfuscatePath(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a1;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v3, "hasSuffix:", CFSTR("/")))
    v6 = objc_msgSend(v3, "length") != 1;
  else
    v6 = 0;
  for (; a2 < objc_msgSend(v5, "count"); ++a2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_alwaysObfuscatedFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, a2);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;

  return v12;
}

id FPContentTypeQueryStringForFileTypes(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "containsObject:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v3, "_fp_map:", &__block_literal_global_76);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_fp_componentsJoinedByOr");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v9);
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "_fp_map:", &__block_literal_global_79);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_fp_componentsJoinedByOr");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v11);
  }
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(v5, "addObject:", CFSTR("true"));
  objc_msgSend(v5, "_fp_map:", &__block_literal_global_82);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_fp_componentsJoinedByAnd");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t FPEncodeUserInfo(void *a1, _QWORD *a2, _QWORD *a3)
{
  BOOL v3;
  uint64_t v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  if (a2)
    v3 = a3 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (!v3)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    v8 = a1;
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __FPEncodeUserInfo_block_invoke;
    v16[3] = &unk_1E444DC58;
    v17 = v9;
    v18 = v10;
    v11 = v10;
    v12 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);

    v13 = objc_retainAutorelease(v11);
    *a3 = v13;
    v14 = objc_retainAutorelease(v12);
    *a2 = v14;

  }
  return v4;
}

id FPDecodeUserInfoItem(uint64_t a1)
{
  return +[FPSearchableItemValue objectFromString:](FPSearchableItemValue, "objectFromString:", a1);
}

id FPRecentDocumentsQueryStringForTypes(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("(kMDItemIsTrashed %@ \"1\")"), CFSTR("!="));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FPFileProviderOriginatedItemsQueryStringFragment(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("(%@) && (%@)"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  FPContentTypeQueryStringForFileTypes(v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@)"), v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  FPRecencyQualifyingAttributes();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_fp_map:", &__block_literal_global_85);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_fp_componentsJoinedByOr");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@)"), v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_1A0A427E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A42988(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_supports_sokoban()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_sokoban_once_token != -1)
    dispatch_once(&fpfs_supports_sokoban_once_token, &__block_literal_global_4);
  *__error() = v0;
  return fpfs_supports_sokoban_feature_enabled;
}

uint64_t FPURLMightBeInFileProvider(void *a1)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid());
}

void FPRegisterFileProvidersForUserAtURLs(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "fp_matchesFileProviderHeuristics:", a1) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_12;
    +[FPDaemonConnection connectionForUser:](FPDaemonConnection, "connectionForUser:", a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __FPRegisterFileProvidersForUserAtURLs_block_invoke;
    v15[3] = &unk_1E444BE70;
    v16 = v6;
    objc_msgSend(v14, "wakeUpForURL:completionHandler:", v13, v15);

  }
  else
  {
LABEL_9:

LABEL_12:
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, &__block_literal_global_14);
  }

}

char *copyHomeDirectoryCompat(uid_t a1)
{
  uint64_t v2;
  size_t v3;
  char *v4;
  NSObject *v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  passwd *v10;
  passwd v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = sysconf(71);
  if (v2 == -1)
  {
    __error();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      copyHomeDirectoryCompat_cold_1();

    return 0;
  }
  else
  {
    v3 = v2;
    v4 = (char *)&v9 - ((MEMORY[0x1E0C80A78]() + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v4, v3);
    memset(&v11, 0, sizeof(v11));
    v10 = 0;
    if (getpwuid_r(a1, &v11, v4, v3, &v10))
    {
      __error();
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        copyHomeDirectoryCompat_cold_3();

      return 0;
    }
    if (!v10)
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        copyHomeDirectoryCompat_cold_2();

      return 0;
    }
    return strdup(v11.pw_dir);
  }
}

void sub_1A0A43C90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A46A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,int a58,char a59)
{
  __fp_leave_section_Debug((uint64_t)&a57);
  __fp_leave_section_Debug((uint64_t)&a59);
  _Unwind_Resume(a1);
}

void sub_1A0A477D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A478B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_pkg_is_package_item(char *a1, char *a2, char a3, _BYTE *a4, __darwin_ino64_t *a5, int a6)
{
  return fpfs_pkg_path_lookup(a1, a2, a3, 0, a4, a5, a6);
}

void sub_1A0A492D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  _Block_object_dispose((const void *)(v11 - 216), 8);
  _Unwind_Resume(a1);
}

id FPDefaultFetchedAttributes()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v0 = (id *)getMDItemExpirationDateSymbolLoc_ptr;
  v14 = getMDItemExpirationDateSymbolLoc_ptr;
  if (!getMDItemExpirationDateSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_2();
    v0 = (id *)dlsym(v1, "MDItemExpirationDate");
    v12[3] = (uint64_t)v0;
    getMDItemExpirationDateSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v11, 8);
  if (!v0)
    FPDefaultFetchedAttributes_cold_1();
  v2 = *v0;
  v15 = v2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v3 = (id *)getMDQueryResultRelevanceSymbolLoc_ptr;
  v14 = getMDQueryResultRelevanceSymbolLoc_ptr;
  if (!getMDQueryResultRelevanceSymbolLoc_ptr)
  {
    v4 = (void *)CoreSpotlightLibrary_2();
    v3 = (id *)dlsym(v4, "MDQueryResultRelevance");
    v12[3] = (uint64_t)v3;
    getMDQueryResultRelevanceSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
    FPDefaultFetchedAttributes_cold_2();
  v16 = *v3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = v16;
  objc_msgSend(v5, "arrayWithObjects:count:", &v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[FPItem fp_queryFetchAttributes](FPItem, "fp_queryFetchAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1A0A49514(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A4A134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreSpotlightLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444AD18;
    v3 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
    CoreSpotlightLibrary_cold_1(&v1);
  return CoreSpotlightLibraryCore_frameworkLibrary;
}

uint64_t CoreSpotlightLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_1E444B878;
    v3 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_1)
    CoreSpotlightLibrary_cold_1_0(&v1);
  return CoreSpotlightLibraryCore_frameworkLibrary_1;
}

uint64_t CoreSpotlightLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_2)
  {
    v2 = xmmword_1E444DD50;
    v3 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_2)
    CoreSpotlightLibrary_cold_1_1(&v1);
  return CoreSpotlightLibraryCore_frameworkLibrary_2;
}

uint64_t CoreSpotlightLibrary_2()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_5)
  {
    v2 = xmmword_1E444EBC0;
    v3 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_5)
    CoreSpotlightLibrary_cold_1_2(&v1);
  return CoreSpotlightLibraryCore_frameworkLibrary_5;
}

void CoreSpotlightLibrary_3()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_6)
  {
    v1 = xmmword_1E444FF00;
    v2 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_6 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_6)
    CoreSpotlightLibrary_cold_1_3(&v0);
}

id getMDItemFileItemID()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemFileItemIDSymbolLoc_ptr;
  v6 = getMDItemFileItemIDSymbolLoc_ptr;
  if (!getMDItemFileItemIDSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v0 = (id *)dlsym(v1, "MDItemFileItemID");
    v4[3] = (uint64_t)v0;
    getMDItemFileItemIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemFileItemID_cold_1();
  return *v0;
}

void sub_1A0A4A56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchQueryContextClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_0();
  result = objc_getClass("CSSearchQueryContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryContextClass_block_invoke_cold_1();
  getCSSearchQueryContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryContextClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_2();
  result = objc_getClass("CSSearchQueryContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryContextClass_block_invoke_cold_1_0();
  getCSSearchQueryContextClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryContextClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_3();
  result = objc_getClass("CSSearchQueryContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryContextClass_block_invoke_cold_1_1();
  getCSSearchQueryContextClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_0();
  result = objc_getClass("CSSearchQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryClass_block_invoke_cold_1();
  getCSSearchQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_2();
  result = objc_getClass("CSSearchQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryClass_block_invoke_cold_1_0();
  getCSSearchQueryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_3();
  result = objc_getClass("CSSearchQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryClass_block_invoke_cold_1_1();
  getCSSearchQueryClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFString *FPExcludedCollaborationInvitationsQueryStringFragment()
{
  return CFSTR("(com_apple_mobilesms_isHighlightedContent != * || InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)) && com_apple_mobilesms_fromMe != 1");
}

void sub_1A0A4CA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPRecencyQualifyingAttributes()
{
  id *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = CFSTR("lastUsedDate");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = (id *)getMDItemLastUsedDateSymbolLoc_ptr_0;
  v9 = getMDItemLastUsedDateSymbolLoc_ptr_0;
  if (!getMDItemLastUsedDateSymbolLoc_ptr_0)
  {
    v1 = (void *)CoreSpotlightLibrary_2();
    v0 = (id *)dlsym(v1, "MDItemLastUsedDate");
    v7[3] = (uint64_t)v0;
    getMDItemLastUsedDateSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
    FPRecencyQualifyingAttributes_cold_1();
  v11[0] = *v0;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = v11[0];
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A0A4CCD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *FPFileProviderOriginatedItemsQueryStringFragment(void *a1)
{
  id v1;
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    if (objc_msgSend(v1, "count") == 1
      && (objc_msgSend(v1, "firstObject"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")),
          v2,
          (v3 & 1) != 0))
    {
      v4 = CFSTR("(true)");
    }
    else
    {
      if (objc_msgSend(v1, "count") == 1)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v1, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("kMDItemFileProviderID == \"%@\""), v6);
      }
      else
      {
        objc_msgSend(v1, "_fp_componentsWrappedInQuotes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FieldMatch(kMDItemFileProviderID, %@)"), v6);
      }
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = CFSTR("kMDItemFileProviderID == \"*\"");
  }

  return v4;
}

uint64_t FPIsTrashedQueryStringFragment(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("!=");
  if (a1)
    v1 = CFSTR("==");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemIsTrashed %@ \"1\")"), v1);
}

const char *_extensionInFilename(char *a1, uint64_t a2)
{
  char *v4;
  const char *v5;
  char v7;
  const char *i;
  int v9;
  char *v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v4 = strrchr(a1, 46);
  v5 = 0;
  if (v4 && v4 != a1)
  {
    v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32)
      return 0;
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      v10 = strdup(a1);
      v5[~(unint64_t)a1 + (_QWORD)v10] = 0;
      v11 = _extensionInFilename();
      if (v11)
        v5 = &a1[v11 - (_QWORD)v10];
      free(v10);
    }
    else
    {
      v7 = 0;
      for (i = v5; ; ++i)
      {
        v9 = *(unsigned __int8 *)i;
        if (!*i)
          break;
        if (v9 == 32 || v9 == 47)
          return 0;
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0)
        return 0;
    }
  }
  return v5;
}

id obfuscateString(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") <= 2
    || (v2 = objc_msgSend(v1, "rangeOfComposedCharacterSequenceAtIndex:", 0),
        v4 = v3,
        v5 = objc_msgSend(v1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v1, "length") - 1),
        v4 == v5))
  {
    v7 = v1;
  }
  else
  {
    v8 = v5;
    v9 = v6;
    objc_msgSend(v1, "substringWithRange:", v2, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringWithRange:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@{%d}%@"), v10, objc_msgSend(v1, "length") - v4 - v9, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id FPDecodeUserInfo(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __FPDecodeUserInfo_block_invoke;
    v12[3] = &unk_1E444DC80;
    v13 = v3;
    v7 = v6;
    v14 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
    v8 = v14;
    v9 = v7;

  }
  else
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] User info keys and values must have same number of items", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

void sub_1A0A4DE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A4E8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id fpfs_current_or_default_log()
{
  id v0;

  fpfs_current_log();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    if (fpfs_default_log_once != -1)
      dispatch_once(&fpfs_default_log_once, &__block_literal_global_34);
    v0 = (id)fpfs_default_log_log;
  }
  return v0;
}

uint64_t fpfs_fileattrs_fullpath(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 272))
    return 0;
  if (*(_QWORD *)(a1 + 264))
    return *(_QWORD *)(a1 + 264);
  return a1 + 280;
}

void __fp_log_adopt(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;

  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __fp_log_adopt_cold_1(a1, a2, v4);

}

BOOL fpfs_filename_contains_ext(char *a1)
{
  return fpfs_extension_in_filename(a1, 0) != 0;
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  if (FPIsCloudDocsWithFPFSEnabled_onceToken != -1)
    dispatch_once(&FPIsCloudDocsWithFPFSEnabled_onceToken, &__block_literal_global_54);
  return FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled;
}

const char *fpfs_path_return_assigned_provider_domain_xattr(const char *a1, ssize_t *a2, void *a3, size_t a4)
{
  ssize_t v8;
  const char *v9;

  v8 = getxattr(a1, "com.apple.file-provider-domain-id", a3, a4, 0, 1);
  if (v8 >= 1)
  {
    v9 = "com.apple.file-provider-domain-id";
    if (!a2)
      return v9;
LABEL_6:
    *a2 = v8;
    return v9;
  }
  v8 = getxattr(a1, "com.apple.file-provider-domain-id#PN", a3, a4, 0, 1);
  if (v8 < 1)
    return 0;
  v9 = "com.apple.file-provider-domain-id#PN";
  if (a2)
    goto LABEL_6;
  return v9;
}

void sub_1A0A50058(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A50594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __fp_leave_section_Debug((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1A0A506E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0A508C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void fp_dispatch_async_with_logs(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t section;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;

  v3 = a1;
  v4 = a2;
  fpfs_current_log();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    fp_dispatch_async_with_logs_cold_1(v3);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __fp_dispatch_async_with_logs_block_invoke;
  v11[3] = &unk_1E444C7C8;
  v12 = v5;
  v13 = v3;
  v14 = v4;
  v15 = section;
  v8 = v4;
  v9 = v3;
  v10 = v5;
  dispatch_async(v9, v11);

}

void sub_1A0A50EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A5165C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 80));
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

id FPDDaemonXPCInterface()
{
  if (FPDDaemonXPCInterface_once != -1)
    dispatch_once(&FPDDaemonXPCInterface_once, &__block_literal_global_102_0);
  return (id)FPDDaemonXPCInterface_interface;
}

uint64_t __fp_log_fork(__int16 a1)
{
  uint64_t section;
  NSObject *v3;

  section = __fp_create_section();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __fp_log_fork_cold_1(a1, section, v3);

  return section;
}

void sub_1A0A519DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void *FPPopLogSectionForBlock(void *result)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)MEMORY[0x1A1B00850]();
    objc_getAssociatedObject(v2, &kFileProviderLogSectionKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedLongValue");

    v5 = (void *)MEMORY[0x1A1B00850](v1);
    objc_setAssociatedObject(v5, &kFileProviderLogSectionKey, 0, (void *)0x301);

    return (void *)v4;
  }
  return result;
}

void sub_1A0A51B90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0A51C30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void fpfs_setup_log_for_invocation(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t section;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  qos_class_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if ((a3 & 1) == 0)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "processIdentifier");
      objc_msgSend(v6, "target");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(v6, "selector"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134219266;
      v16 = section;
      v17 = 2112;
      v18 = v9;
      v19 = 1024;
      v20 = v10;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      v25 = 1024;
      v26 = qos_class_self();
      _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@[%d]: -[%{public}@ %{public}@] @ QoS %u", (uint8_t *)&v15, 0x36u);

    }
    objc_msgSend(v5, "fp_annotateInvocation:withLogSection:", v6, section);
  }

}

uint64_t __fp_create_section()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (__fp_create_section_once != -1)
    dispatch_once(&__fp_create_section_once, &__block_literal_global_19);
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____fp_create_section_block_invoke_2;
  block[3] = &unk_1E444B188;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)__fp_create_section_queue, block);
  v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A0A524B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 192));
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A0A52738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  id *v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v10);
  _Unwind_Resume(a1);
}

uint64_t FPFeatureFlagEbihilIsEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t fpfs_fgetfileattrs()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t additional_attrs;
  id v12;
  size_t v13;
  uint64_t v14;
  char *v15[5];
  stat v16;
  uint64_t v17[4];
  int32_t v18;
  uint64_t v19;
  void *v20;
  size_t v21;
  _BYTE v22[2048];
  uint64_t v23;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = v6;
  bzero(v22, 0x800uLL);
  bzero(v17, 0x800uLL);
  v14 = 0;
  if ((fpfs_fget_parent_syncroot(v5, &v14) & 0x80000000) != 0)
    goto LABEL_22;
  if (v4)
  {
    v8 = v14;
    if (v14)
    {
      if (v14 != v4)
      {
        LOBYTE(v13) = 0;
        memset(&v16, 0, sizeof(v16));
        if ((fstat(v5, &v16) & 0x80000000) == 0 && (v16.st_flags & 0x40000000) == 0)
        {
          v15[0] = (char *)MEMORY[0x1E0C809B0];
          v15[1] = (char *)3221225472;
          v15[2] = (char *)__fpfs_fget_ignore_item_block_invoke;
          v15[3] = (char *)&__block_descriptor_40_e8_i12__0i8l;
          v15[4] = (char *)&v13;
          if (!fpfs_openbyid(v16.st_dev, v8, 0x8000, (uint64_t)v15))
          {
            if ((_BYTE)v13)
            {
              *__error() = 6;
LABEL_22:
              additional_attrs = 0xFFFFFFFFLL;
              goto LABEL_23;
            }
          }
        }
      }
    }
  }
  v20 = 0;
  *(_OWORD *)&v16.st_dev = xmmword_1A0B53DE0;
  *(_QWORD *)&v16.st_uid = 0x20000000205;
  v9 = fgetattrlist(v5, &v16, v22, 0x800uLL, 0x28u);
  if (v9)
  {
    if (*__error() != 28)
      goto LABEL_22;
    if (!fpfs_supports_long_paths())
      goto LABEL_22;
    *(_DWORD *)&v16.st_mode &= ~0x8000000u;
    if (fgetattrlist(v5, &v16, v22, 0x800uLL, 0x28u))
      goto LABEL_22;
    if ((_parse_fileattrs((uint64_t)v22, 2048, (uint64_t)v17) & 0x80000000) != 0)
      goto LABEL_22;
    v15[0] = 0;
    v13 = 0;
    if (fpfs_fsgetpath(v18, v17[0], v15, &v13))
      goto LABEL_22;
    v20 = v15[0];
    v21 = v13;
  }
  else
  {
    if ((_parse_fileattrs((uint64_t)v22, 2048, (uint64_t)v17) & 0x80000000) != 0)
      goto LABEL_22;
    v20 = 0;
  }
  v19 = v14;
  v12 = v7;
  additional_attrs = fpfs_load_additional_attrs(v5, (uint64_t)v17, v2);
  if (v9)
    free(v20);

LABEL_23:
  return additional_attrs;
}

uint64_t fpfs_load_additional_attrs(int a1, uint64_t a2, uint64_t a3)
{
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  int v15;
  int is_safe_save_temp_filename;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v21;
  unsigned int v22;
  int v23;
  char *v24;
  int v25;
  __int16 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  uint64_t v29;
  _QWORD v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v6 = *(_DWORD *)(a2 + 44);
  v7 = *(_OWORD *)(a2 + 216);
  v39 = *(_OWORD *)(a2 + 200);
  v40 = v7;
  v8 = *(_OWORD *)(a2 + 248);
  v41 = *(_OWORD *)(a2 + 232);
  v42 = v8;
  v9 = *(_OWORD *)(a2 + 152);
  v36[1] = *(_OWORD *)(a2 + 136);
  v36[2] = v9;
  v10 = *(_OWORD *)(a2 + 184);
  v37 = *(_OWORD *)(a2 + 168);
  v38 = v10;
  v11 = *(_OWORD *)(a2 + 88);
  v33 = *(_OWORD *)(a2 + 72);
  v34 = v11;
  v12 = *(_OWORD *)(a2 + 120);
  v35 = *(_OWORD *)(a2 + 104);
  v36[0] = v12;
  v13 = *(_OWORD *)(a2 + 56);
  v31 = *(_OWORD *)(a2 + 40);
  v32 = v13;
  v14 = v31;
  if ((v31 & 0xFFFFFFFE) == 2)
  {
    LODWORD(v30[0]) = 0;
    if ((fpfs_pkg_is_package_root2(a1, *(char **)(a2 + 24), (int *)v30, *(_DWORD *)(a3 + 8)) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
    if ((v30[0] & 0xA) != 0)
      v15 = 3;
    else
      v15 = 2;
    if ((v30[0] & 4) != 0)
      v14 = 2;
    else
      v14 = v15;
    LODWORD(v31) = v14;
  }
  if ((v14 | 2) == 3)
    is_safe_save_temp_filename = fpfs_path_is_safe_save_temp_filename(*(char **)(a2 + 24), v14 == 1);
  else
    is_safe_save_temp_filename = 0;
  DWORD2(v42) = is_safe_save_temp_filename;
  v30[0] = 0;
  v30[1] = 0;
  BYTE1(v30[0]) = BYTE4(v42);
  if ((v6 & 0x2000) != 0)
  {
    v17 = DWORD1(v31) & 0xFFFFEFFF;
    DWORD1(v31) = v17;
    if ((v17 & 0x20) == 0)
      goto LABEL_15;
LABEL_21:
    v29 = 0;
    if ((fpfs_eviction_urgency(a1, &v29) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFFDF | (32 * (v29 != 0));
    *((_QWORD *)&v41 + 1) = v29;
    if ((BYTE4(v31) & 1) == 0)
      goto LABEL_25;
    goto LABEL_23;
  }
  if ((fpfs_get_tag_data(a1, (uint64_t)v30, (uint64_t)v36) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  DWORD1(v31) &= ~0x1000u;
  if (fpfs_get_last_use_date(a1, (uint64_t *)&v34 + 1, 0) == 1)
    DWORD1(v31) |= 0x1000u;
  fpfs_get_favorite_rank(a1, (unint64_t *)&v35 + 1);
  LOBYTE(v17) = BYTE4(v31);
  if ((BYTE4(v31) & 0x20) != 0)
    goto LABEL_21;
LABEL_15:
  if ((v17 & 1) != 0)
  {
LABEL_23:
    LODWORD(v29) = 0;
    if ((fpfs_eviction_reason(a1, &v29) & 0x80000000) == 0)
    {
      LODWORD(v42) = v29;
      goto LABEL_25;
    }
    return 0xFFFFFFFFLL;
  }
LABEL_25:
  v18 = 0;
  LOBYTE(v29) = 0;
  if ((v6 & 0x2000) == 0)
  {
    fpfs_get_is_ignore_root(a1, (BOOL *)&v29);
    v18 = v29 << 9;
  }
  v19 = DWORD1(v31) & 0xFFFFFDFF | v18;
  DWORD1(v31) = v19;
  v28 = 0;
  if (*(_BYTE *)(a3 + 12) && (v6 & 0x2000) == 0)
  {
    fpfs_get_is_pinned(a1, (char *)&v28);
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFF7F | (v28 << 7);
    v27 = 0;
LABEL_33:
    *((_QWORD *)&v37 + 1) = fpfs_copy_before_bounce_filename(a1);
    if (fpfs_is_resurrected(a1))
      v23 = 1024;
    else
      v23 = 0;
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFBFF | v23;
    v24 = fpfs_copy_collaboration_identifier(a1);
    v25 = 0;
    *(_QWORD *)&v40 = v24;
    if ((_DWORD)v31 == 2)
    {
      fpfs_is_detached_root(a1, (char *)&v27);
      v25 = v27 << 14;
    }
    DWORD1(v31) = DWORD1(v31) & 0xFFFFBFFF | v25;
    HIBYTE(v26) = 0;
    fpfs_get_is_sync_paused(a1, (char *)&v26 + 1);
    DWORD1(v31) = DWORD1(v31) & 0xFFFF7FFF | (HIBYTE(v26) << 15);
    LOBYTE(v26) = 0;
    fpfs_get_is_sync_resuming_with_drop_local_changes(a1, (char *)&v26);
    v22 = DWORD1(v31);
    v21 = v26 << 16;
    goto LABEL_39;
  }
  DWORD1(v31) = v19 & 0xFFFFFF7F;
  v27 = 0;
  if ((v6 & 0x2000) == 0)
    goto LABEL_33;
  v21 = 0;
  v26 = 0;
  v22 = v19 & 0xFFFF3F7F;
LABEL_39:
  DWORD1(v31) = v22 & 0xFFFEFFFF | v21;
  return fpfs_get_syncable_xattrs();
}

uint64_t fpfs_get_syncable_xattrs()
{
  int v0;
  void *v1;
  void *v2;
  char v3;
  char v4;
  int v5;
  id v6;
  unsigned int (**v7)(id, const char *);
  uint64_t (**v8)(id, _QWORD);
  _QWORD *v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  size_t v16;
  ssize_t v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  int v22;
  int v23;
  char v25[32768];
  uint64_t v26;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = (unsigned int (**)(id, const char *))v6;
  v8 = v2;
  bzero(v25, 0x8000uLL);
  if ((v4 & 1) != 0)
    goto LABEL_2;
  v12 = flistxattr(v5, v25, 0x8000uLL, 0);
  if ((v12 & 0x8000000000000000) == 0)
  {
    if (v12 > 0x8000)
    {
      v10 = 0xFFFFFFFFLL;
      v11 = 12;
LABEL_24:
      *__error() = v11;
      goto LABEL_25;
    }
    if (v12)
    {
      v9 = 0;
      v13 = 0;
      v14 = &v25[v12];
      v15 = v25;
      do
      {
        v16 = strlen(v15);
        if (v7[2](v7, v15))
        {
          v17 = fgetxattr(v5, v15, 0, 0, 0, 0);
          if ((v17 & 0x8000000000000000) == 0)
          {
            v18 = v17;
            v19 = v17 + v16;
            if (v17 + v16 <= 0x8000)
            {
              v20 = v19 + v13;
              if (v19 + v13 <= 0x8000)
              {
                v21 = malloc_type_malloc(v17 + 24, 0x7D01F663uLL);
                *v21 = v9;
                v21[1] = v15;
                v21[2] = v18;
                *__error() = 0;
                if (fgetxattr(v5, v15, v21 + 3, v18, 0, 0) != v18)
                {
                  v22 = *__error();
                  if (v22)
                    v23 = v22;
                  else
                    v23 = 22;
                  *__error() = v23;
                  v11 = *__error();
                  v10 = 0xFFFFFFFFLL;
                  goto LABEL_22;
                }
                v9 = v21;
                v13 = v20;
              }
            }
          }
        }
        v15 += v16 + 1;
      }
      while (v15 < v14);
      goto LABEL_3;
    }
LABEL_2:
    v9 = 0;
LABEL_3:
    v10 = ((uint64_t (**)(id, _QWORD *))v8)[2](v8, v9);
    v11 = *__error();
    while (1)
    {
      v21 = v9;
      if (!v9)
        break;
LABEL_22:
      v9 = (_QWORD *)*v21;
      free(v21);
    }
    goto LABEL_24;
  }
  v10 = 0xFFFFFFFFLL;
LABEL_25:

  return v10;
}

uint64_t fpfs_fget_parent_syncroot(int a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  if (ffsctl(a1, 0x40084A4AuLL, &v4, 0) < 0)
    return 0xFFFFFFFFLL;
  result = 0;
  if (a2)
    *a2 = v4;
  return result;
}

uint64_t _parse_fileattrs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  const void *v7;
  uint64_t v8;
  int v9;
  const void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  size_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  __int16 v22;
  __int16 v23;
  uint8_t *v24;
  uint64_t v25;
  int v26;
  _QWORD v27[2];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[80];
  __int128 v43;
  __int128 v44;
  _BYTE v45[68];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = *(_DWORD *)(a1 + 4);
  if ((v6 & 0x8000000) == 0)
    goto LABEL_8;
  v7 = (const void *)(a1 + 140 + *(int *)(a1 + 140));
  v8 = *(unsigned int *)(a1 + 144);
  if ((unint64_t)v7 + v8 > a1 + a2)
  {
    v9 = 55;
LABEL_6:
    *__error() = v9;
    if ((*(_BYTE *)(a1 + 4) & 1) == 0)
      return 0xFFFFFFFFLL;
    *__error() = 0;
    v6 = *(_DWORD *)(a1 + 4);
LABEL_8:
    if ((v6 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v10 = (const void *)(a1 + 24 + *(int *)(a1 + 24));
    v13 = *(unsigned int *)(a1 + 28);
    if ((unint64_t)v10 + v13 <= a1 + a2)
    {
      if (v13 < 0x6E9)
      {
        v7 = 0;
        goto LABEL_11;
      }
      v14 = 40;
    }
    else
    {
      v14 = 55;
    }
    *__error() = v14;
    return 0xFFFFFFFFLL;
  }
  if (v8 >= 0x6E9)
  {
    v9 = 40;
    goto LABEL_6;
  }
LABEL_10:
  v10 = 0;
LABEL_11:
  if ((v6 & 0x2000000) == 0 || !*(_QWORD *)(a1 + 124))
  {
    *__error() = 70;
    fpfs_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 124);
      v26 = *(_DWORD *)(a1 + 4) & 0x2000000;
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v26;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v7;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v10;
      _os_log_error_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_ERROR, "ESTALE: getdirentries should skip entries [%llu, %u, %s, %s]", buf, 0x26u);
    }

    return 0xFFFFFFFFLL;
  }
  memset(v45, 0, sizeof(v45));
  v43 = 0u;
  v44 = 0u;
  memset(buf, 0, sizeof(buf));
  __memcpy_chk();
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(_QWORD *)(a3 + 272) = 0;
  v11 = *(_DWORD *)&buf[4];
  if ((buf[4] & 2) != 0)
  {
    *(_DWORD *)(a3 + 32) = *(_DWORD *)&buf[32];
    if ((v11 & 0x100000) == 0)
    {
LABEL_15:
      if ((v11 & 0x2000000) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&buf[4] & 0x100000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(a3 + 16) = *(_DWORD *)&v45[8];
  if ((v11 & 0x2000000) == 0)
  {
LABEL_16:
    if ((v11 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)a3 = *(_QWORD *)&v45[12];
  if ((v11 & 0x80000) == 0)
  {
LABEL_17:
    if ((v11 & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(a3 + 20) = *(_DWORD *)&v45[4];
  if ((v11 & 0x4000000) == 0)
  {
LABEL_18:
    if ((v11 & 0x8000000) != 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  *(_QWORD *)(a3 + 8) = *(_QWORD *)&v45[20];
  if ((v11 & 0x8000000) != 0)
  {
LABEL_19:
    if (!v7)
      goto LABEL_38;
    goto LABEL_36;
  }
LABEL_35:
  *(_OWORD *)&v45[52] = *(_OWORD *)&v45[44];
  *(_OWORD *)&v45[36] = *(_OWORD *)&v45[28];
  if (!v7)
    goto LABEL_38;
LABEL_36:
  if ((v11 & 0x8000001) == 0x8000001)
  {
    v16 = *(unsigned int *)&v45[32];
    *(_QWORD *)(a3 + 272) = *(unsigned int *)&v45[32];
    memmove((void *)(a3 + 280), v7, v16);
    v17 = a3 + 280 + v16 - *(unsigned int *)&buf[28];
    goto LABEL_42;
  }
LABEL_38:
  if ((v11 & 1) != 0)
  {
    *(_QWORD *)(a3 + 272) = 0;
    v17 = a3 + 280;
    memmove((void *)(a3 + 280), v10, *(unsigned int *)&buf[28]);
  }
  else
  {
    v17 = 0;
  }
LABEL_42:
  *(_QWORD *)(a3 + 24) = v17;
  v27[0] = 0;
  v28 = 0u;
  WORD2(v27[0]) = WORD6(v44);
  v27[1] = 0;
  v37 = 0;
  v38 = *(_DWORD *)v45;
  LODWORD(v28) = DWORD2(v44);
  DWORD2(v28) = 0;
  v29 = 0;
  v30 = 0;
  v31 = *(_OWORD *)&buf[56];
  v32 = 0;
  v33 = 0;
  v34 = *(_OWORD *)&buf[40];
  v35 = 0;
  v36 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  if (*(_DWORD *)&buf[36] == 1)
  {
    v22 = *(_WORD *)&buf[16];
    v18 = (*(_DWORD *)&buf[4] >> 14) & 1;
    v23 = *(_WORD *)&v45[40];
    if ((buf[16] & 1) == 0)
      v23 = 1;
    HIWORD(v27[0]) = v23;
    if ((buf[21] & 2) != 0)
      v21 = *(_DWORD *)&v45[60];
    else
      v21 = 0;
    goto LABEL_56;
  }
  if (*(_DWORD *)&buf[36] != 2)
  {
    v21 = 0;
    v18 = 0;
    v22 = *(_WORD *)&buf[16];
LABEL_56:
    if ((v22 & 4) != 0)
      v20 = *(_QWORD *)&v45[44];
    else
      v20 = 0;
    if ((v22 & 0x200) != 0)
    {
      v19 = 0;
      v35 = *(_QWORD *)&v45[52];
    }
    else
    {
      if (*(_DWORD *)&buf[36] == 1)
        _parse_fileattrs_cold_1();
      v19 = 0;
    }
    goto LABEL_63;
  }
  v18 = (buf[5] >> 6) & 1;
  if ((buf[12] & 2) != 0)
    v19 = *(_DWORD *)&v45[40];
  else
    v19 = 2;
  v20 = 0;
  if ((buf[21] & 2) != 0)
    v21 = *(_DWORD *)&v45[44];
  else
    v21 = 0;
LABEL_63:
  if (v18)
    v24 = &buf[72];
  else
    v24 = 0;
  return fpfs_synthesize_metadata(a3 + 40, *(int *)&buf[36], (uint64_t)v27, v21, v20, *(int *)&v45[36], (uint64_t)v24, v19);
}

uint64_t fpfs_synthesize_metadata(uint64_t a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  uint64_t result;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  if (a7)
  {
    fpfs_finder_info_deserialize(a7, (uint64_t)&v24);
    *(_QWORD *)(a1 + 112) = v25;
    v15 = v24;
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 4) & 0xFFFFFFF5 | v24 & 8 | (2 * (v24 & 1));
    v16 = BYTE1(v24);
  }
  else
  {
    v15 = 0;
    v16 = 1;
  }
  *(_DWORD *)(a1 + 212) = v16;
  switch(a2)
  {
    case 5:
      *(_DWORD *)a1 = 4;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a3 + 96);
      v17 = *(_DWORD *)(a1 + 4) & 0xFFFFFFDF;
      goto LABEL_13;
    case 2:
      if ((v15 & 2) != 0)
        v18 = 3;
      else
        v18 = 2;
      *(_DWORD *)a1 = v18;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a3 + 96);
      *(_DWORD *)(a1 + 104) = a8;
      v17 = (a4 << 6) & 0x100 | (32 * ((a4 >> 3) & 1)) | *(_DWORD *)(a1 + 4) & 0xFFFFFEDF;
      goto LABEL_13;
    case 1:
      *(_DWORD *)a1 = 1;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a3 + 96);
      *(_DWORD *)(a1 + 104) = *(unsigned __int16 *)(a3 + 6);
      v17 = *(_DWORD *)(a1 + 4) & 0xFFFFFFDF | (32 * ((a4 >> 3) & 1));
LABEL_13:
      *(_DWORD *)(a1 + 4) = v17;
      result = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a3 + 48);
      *(_WORD *)(a1 + 8) = *(_WORD *)(a3 + 4) & 0xFFF;
      v20 = v17 & 0xFFFFFFFB | (4 * ((*(_DWORD *)(a3 + 116) & 0x8000 | v15 & 4) != 0));
      *(_DWORD *)(a1 + 4) = v20;
      v21 = v20 & 0xFFFFFFEF | (16 * ((*(_DWORD *)(a3 + 116) >> 1) & 1));
      *(_DWORD *)(a1 + 4) = v21;
      v22 = v21 & 0xFFFFFFFE | (*(_DWORD *)(a3 + 116) >> 30) & 1;
      *(_DWORD *)(a1 + 4) = v22;
      v23 = v22 & 0xFFFFFFBF | (((*(_DWORD *)(a3 + 116) & 0x40000020) == 32) << 6);
      *(_DWORD *)(a1 + 4) = v23;
      *(_QWORD *)(a1 + 128) = a5;
      *(_DWORD *)(a1 + 168) = a6;
      *(_DWORD *)(a1 + 172) = *(_DWORD *)(a3 + 16);
      *(_DWORD *)(a1 + 4) = v23 & 0xFFFFDFFF | (((a4 >> 1) & 1) << 13);
      return result;
  }
  *__error() = 79;
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_load_additional_attrs_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v17[8];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, sizeof(v17));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 56) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 40) = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v7 = *(_OWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v4 + 120) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v4 + 104) = v8;
  *(_OWORD *)(v4 + 88) = v7;
  *(_OWORD *)(v4 + 72) = v6;
  v9 = *(_OWORD *)(a1 + 144);
  v10 = *(_OWORD *)(a1 + 160);
  v11 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v4 + 184) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(v4 + 168) = v11;
  *(_OWORD *)(v4 + 152) = v10;
  *(_OWORD *)(v4 + 136) = v9;
  v12 = *(_OWORD *)(a1 + 208);
  v13 = *(_OWORD *)(a1 + 224);
  v14 = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(v4 + 248) = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(v4 + 232) = v14;
  *(_OWORD *)(v4 + 216) = v13;
  *(_OWORD *)(v4 + 200) = v12;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = a2;
  if ((*(unsigned int (**)(void))(**(_QWORD **)(a1 + 272) + 16))())
  {
    *((_QWORD *)&v17[0] + 1) = "com.apple.fpfs.fileid";
    *(_QWORD *)&v17[1] = snprintf((char *)&v17[1] + 8, 0x68uLL, "%llu:%d:%d", **(_QWORD **)(a1 + 40), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20))+ 1;
    *(_QWORD *)&v17[0] = a2;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = v17;
  }
  v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  fpfs_free_tag_data((void **)(*(_QWORD *)(a1 + 40) + 120));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = 0;
  free(*(void **)(a1 + 184));
  free(*(void **)(a1 + 224));
  return v15;
}

void fpfs_free_tag_data(void **a1)
{
  free(*a1);
  *a1 = 0;
}

uint64_t __fpfs_fgetfileattrs_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((fpfs_pkg_fileattrs_update(*(unsigned int *)(a1 + 48), a2, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8)) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t fpfs_pkg_fileattrs_update(uint64_t a1, uint64_t a2, int a3)
{
  return _pkg_fileattrs_update(a1, 0, a2, a3);
}

uint64_t _pkg_fileattrs_update(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  int v13;

  if ((*(_DWORD *)(a3 + 40) - 4) < 0xFFFFFFFE)
    return 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___pkg_fileattrs_update_block_invoke;
  v12[3] = &__block_descriptor_44_e8_i12__0i8l;
  v12[4] = a3;
  v13 = a4;
  v8 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1B00850](v12);
  v9 = v8;
  if ((a1 & 0x80000000) != 0)
    v10 = fpfs_openbyid_ext(a3, a2, 0x100000, 0, v8);
  else
    v10 = v8[2](v8, a1);
  v4 = v10;

  return v4;
}

uint64_t ___pkg_fileattrs_update_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = a2;
  v7 = 0;
  v6 = 0;
  if ((fpfs_pkg_fd_lookup(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, &v7, 0, &v6, *(_DWORD *)(a1 + 40)) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    *(_DWORD *)(v4 + 40) = 3;
    v8 = 0;
    if ((ffsctl(v2, 0x80084A02uLL, &v8, 0) & 0x80000000) == 0)
    {
      if ((fpfs_pkg_promote(v2) & 0x80000000) == 0)
      {
        fpfs_pkg_dirstat(v2, (_QWORD *)(*(_QWORD *)(a1 + 32) + 56), (_DWORD *)(*(_QWORD *)(a1 + 32) + 20));
        result = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        return result;
      }
      return 0xFFFFFFFFLL;
    }
    if (*__error() == 22)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    result = 0;
    *(_DWORD *)(v4 + 40) = 2;
  }
  return result;
}

uint64_t fpfs_pkg_fd_lookup(uint64_t a1, uint64_t a2, char a3, _BYTE *a4, _BYTE *a5, _QWORD *a6, int a7)
{
  uint64_t v7;
  _QWORD v9[8];
  int v10;
  int v11;
  char v12;

  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __fpfs_pkg_fd_lookup_block_invoke;
  v9[3] = &__block_descriptor_73_e8_i12__0i8l;
  v12 = a3;
  v9[4] = a2;
  v9[5] = a4;
  v9[6] = a5;
  v9[7] = a6;
  v10 = a1;
  v11 = a7;
  v7 = fpfs_openat(a1, "..", 0, 0, 0, (uint64_t)v9);
  if ((v7 & 0x80000000) != 0 && (*__error() == 20 || *__error() == 1 || *__error() == 13))
    return 0;
  return v7;
}

uint64_t fpfs_openbyid_ext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t (**v9)(id, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  pid_t v16;
  int v17;
  int *v18;
  int v19;
  char v20;
  int v21;
  char v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int *v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int *v38;
  int v39;
  void *v40;
  __int128 v41;
  void *v43[2];
  __int128 v44;
  uint64_t v45;

  v9 = a5;
  if (!*(_QWORD *)a1)
  {
    if ((!*(_QWORD *)(a1 + 8) || !*(_QWORD *)(a1 + 24)) && !*(_DWORD *)(a1 + 16))
    {
      v18 = __error();
      v19 = 22;
LABEL_82:
      *v18 = v19;
      goto LABEL_85;
    }
    v13 = 0;
    goto LABEL_48;
  }
  v10 = _try_openbyid(a2, *(_QWORD *)a1, a3, a4, a1);
  if ((v10 & 0x80000000) == 0)
  {
    v11 = v9[2](v9, v10);
    if ((v11 & 0x80000000) != 0)
    {
      v14 = *__error();
      close(v10);
      *__error() = v14;
    }
    else
    {
      v12 = v11;
      if ((close(v10) & 0x80000000) == 0 || *__error() != 9 && *__error() != 5)
        goto LABEL_86;
    }
  }
  if (*__error() != 1)
    goto LABEL_22;
  v15 = *(_QWORD *)a1;
  v43[0] = 0;
  if ((fpfs_fsgetpath(a2, v15, (char **)v43, 0) & 0x80000000) != 0)
  {
    if (*__error() == 2 || *__error() == 1)
      goto LABEL_20;
LABEL_22:
    v13 = 0;
    if ((a4 & 4) != 0)
      goto LABEL_47;
    goto LABEL_23;
  }
  v16 = getpid();
  v17 = fpfs_lp_sandbox_check(v16, (uint64_t)"file-read-data", *MEMORY[0x1E0C806B0] | 1u, (const char *)v43[0]);
  free(v43[0]);
  if (!v17)
    goto LABEL_22;
LABEL_20:
  v13 = 1;
  if ((a4 & 4) != 0)
    goto LABEL_47;
LABEL_23:
  if (*__error() == 13)
  {
    if ((a3 & 3) != 0)
      v20 = v13;
    else
      v20 = 1;
    if ((v20 & 1) != 0)
      goto LABEL_47;
  }
  else
  {
    v21 = *__error();
    if ((a3 & 3) != 0 && v21 == 1)
      v23 = v13;
    else
      v23 = 1;
    if ((v23 & 1) != 0)
      goto LABEL_47;
  }
  v24 = _try_openbyid(a2, *(_QWORD *)a1, a3 & 0xFFFFFFFC, a4, a1);
  if (v24 < 0)
    goto LABEL_47;
  v25 = v24;
  v26 = fpfs_openbyid_ext(a1, a2, a3 & 0xFFFFFFFC, a4 | 4, v9);
  if ((v26 & 0x80000000) != 0)
  {
    v28 = *__error();
    close(v25);
    *__error() = v28;
    goto LABEL_47;
  }
  v12 = v26;
  if ((close(v25) & 0x80000000) == 0)
    goto LABEL_86;
  if (*__error() == 9)
  {
LABEL_47:
    if ((v10 & 0x80000000) == 0)
      goto LABEL_85;
LABEL_48:
    if (!*(_QWORD *)(a1 + 8) || !*(_QWORD *)(a1 + 24))
      goto LABEL_75;
    v29 = _openbyparentidandname_retry(a2, a3, a4, a1);
    if ((v29 & 0x80000000) == 0)
    {
      v30 = v9[2](v9, v29);
      if ((v30 & 0x80000000) != 0)
      {
        v31 = *__error();
        close(v29);
        *__error() = v31;
      }
      else
      {
        v12 = v30;
        if ((close(v29) & 0x80000000) == 0 || *__error() != 9 && *__error() != 5)
          goto LABEL_86;
      }
    }
    if ((a4 & 4) == 0)
    {
      if (*__error() == 13)
      {
        if ((a3 & 3) == 0)
          goto LABEL_74;
      }
      else
      {
        v32 = __error();
        if ((a3 & 3) == 0 || *v32 != 1)
          goto LABEL_74;
      }
      v33 = _openbyparentidandname_retry(a2, a3 & 0xFFFFFFFC, a4, a1);
      if (v33 < 0)
        goto LABEL_74;
      v34 = v33;
      v35 = fpfs_openbyid_ext(a1, a2, a3 & 0xFFFFFFFC, a4 | 4, v9);
      if ((v35 & 0x80000000) != 0)
      {
        v37 = *__error();
        close(v34);
        *__error() = v37;
        goto LABEL_74;
      }
      v12 = v35;
      if ((close(v34) & 0x80000000) == 0)
        goto LABEL_86;
      if (*__error() != 9)
      {
        v36 = *__error();
        if (v36 == 5)
          v12 = 0xFFFFFFFFLL;
        else
          v12 = v12;
        if ((v29 & 0x80000000) == 0 || v36 != 5)
          goto LABEL_86;
LABEL_75:
        v38 = __error();
        if (!*(_DWORD *)(a1 + 16))
        {
          v18 = __error();
          if (!v13)
          {
            if (!*v18)
              fpfs_openbyid_ext_cold_1();
            goto LABEL_85;
          }
LABEL_81:
          v19 = 2;
          goto LABEL_82;
        }
        v39 = *v38;
        v40 = (void *)GSLibraryResolveDocumentId2();
        if (v40)
        {
          if (v40 != *(void **)a1)
          {
            v41 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)v43 = *(_OWORD *)a1;
            v44 = v41;
            v45 = *(_QWORD *)(a1 + 32);
            v43[0] = v40;
            v12 = fpfs_openbyid_ext(v43, a2, a3, a4, v9);
            goto LABEL_86;
          }
          v18 = __error();
          if (!v13)
          {
            *v18 = v39;
            goto LABEL_85;
          }
          goto LABEL_81;
        }
LABEL_85:
        v12 = 0xFFFFFFFFLL;
        goto LABEL_86;
      }
    }
LABEL_74:
    if ((v29 & 0x80000000) == 0)
      goto LABEL_85;
    goto LABEL_75;
  }
  v27 = *__error();
  if (v27 == 5)
    v12 = 0xFFFFFFFFLL;
  else
    v12 = v12;
  if ((v10 & 0x80000000) != 0 && v27 == 5)
    goto LABEL_48;
LABEL_86:

  return v12;
}

uint64_t _try_openbyid(uint64_t a1, uint64_t a2, unsigned int a3, char a4, uint64_t a5)
{
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  int *v14;
  _QWORD v16[5];
  int v17;

  if (a3)
    v10 = a3;
  else
    v10 = 0x8000;
  v11 = v10 | ~(v10 >> 13) & 0x100 | 4;
  v16[0] = a1;
  v12 = openbyid_np();
  if ((v12 & 0x80000000) != 0)
  {
    v14 = __error();
    if ((a3 & 3) != 0 && (a4 & 2) != 0 && *v14 == 21)
      return _try_openbyid(a1, a2, a3 & 0xFFFFFFFC, 0, a5);
    if (*__error() != 63 || !fpfs_supports_long_paths())
    {
      if (*__error() == 22 && fpfs_supports_long_paths())
      {
        *__error() = 63;
      }
      else if (!*__error())
      {
        _try_openbyid_cold_1();
      }
      return 0xFFFFFFFFLL;
    }
    v12 = _openbyid_longpaths(a1, a2, v11);
    if ((v12 & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___validate_file_openbyid_block_invoke;
  v16[3] = &__block_descriptor_44_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
  v16[4] = a5;
  v17 = v12;
  if (fpfs_fgethandle(v12, v16))
  {
    v13 = *__error();
    close(v12);
    *__error() = v13;
    return 0xFFFFFFFFLL;
  }
  return v12;
}

uint64_t fpfs_fgethandle(int a1, void *a2)
{
  uint64_t (**v3)(id, _OWORD *);
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _BYTE v9[24];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[97];

  v13[96] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  bzero(&v10, 0x328uLL);
  v6 = xmmword_1A0B53DC8;
  v7 = 0;
  if (fgetattrlist(a1, &v6, &v10, 0x328uLL, 0x20u))
    goto LABEL_2;
  v8 = v10;
  *(_OWORD *)v9 = v11;
  *(_QWORD *)&v9[16] = v12;
  if (HIDWORD(v10) != 1)
  {
    if (HIDWORD(v10) == 2)
    {
      if ((fpfs_pkg_dirstat(a1, 0, v9) & 0x80000000) != 0 && *__error() != 45)
      {
LABEL_2:
        v4 = 0xFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    else
    {
      *(_DWORD *)&v9[4] = 0;
    }
  }
  v12 = 0;
  v11 = (unint64_t)vrev64_s32(*(int32x2_t *)v9);
  v10 = *(_OWORD *)&v9[8];
  if (DWORD2(v8) <= 0x300)
  {
    *((_QWORD *)&v11 + 1) = v13;
    __memmove_chk();
  }
  v4 = v3[2](v3, &v10);
LABEL_12:

  return v4;
}

uint64_t fpfs_pkg_dirstat(int a1, _QWORD *a2, _DWORD *a3)
{
  char v7;

  v7 = 0;
  if ((fpfs_pkg_is_demoted(a1, &v7) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v7)
  {
    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  return fpfs_get_dirstat(a1, a2, a3, 0);
}

uint64_t ___validate_file_openbyid_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  gid_t v9;
  dev_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  stat v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = *(uint64_t **)(a1 + 32);
  v5 = *((_DWORD *)v4 + 4);
  if (!v5)
  {
    v14 = *v4;
    if (!v14 || v14 == *a2)
      return 0;
    *__error() = 70;
    fpfs_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_DWORD *)(a1 + 40);
      v18 = **(_QWORD **)(a1 + 32);
      v19 = *a2;
      v20.st_dev = 136315906;
      *(_QWORD *)&v20.st_mode = "_validate_file_openbyid_block_invoke";
      WORD2(v20.st_ino) = 1024;
      *(_DWORD *)((char *)&v20.st_ino + 6) = v17;
      HIWORD(v20.st_uid) = 2048;
      *(_QWORD *)&v20.st_gid = v18;
      *((_WORD *)&v20.st_rdev + 2) = 2048;
      *(_QWORD *)((char *)&v20.st_rdev + 6) = v19;
      v11 = "ESTALE: opened wrong directory in %s [%d, %llu, %llu]";
      v12 = v7;
      v13 = 38;
      goto LABEL_15;
    }
LABEL_9:

    return 0xFFFFFFFFLL;
  }
  v6 = *((_DWORD *)a2 + 4);
  if (v5 != v6)
  {
    if (v6
      || (v16 = *(_DWORD *)(a1 + 40), memset(&v20, 0, sizeof(v20)), fstat(v16, &v20) < 0)
      || (v20.st_mode & 0xF000) != 0xA000)
    {
      *__error() = 70;
      fpfs_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_DWORD *)(a1 + 40);
        v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v10 = *((_DWORD *)a2 + 4);
        v20.st_dev = 136315906;
        *(_QWORD *)&v20.st_mode = "_validate_file_openbyid_block_invoke";
        WORD2(v20.st_ino) = 1024;
        *(_DWORD *)((char *)&v20.st_ino + 6) = v8;
        HIWORD(v20.st_uid) = 1024;
        v20.st_gid = v9;
        LOWORD(v20.st_rdev) = 1024;
        *(dev_t *)((char *)&v20.st_rdev + 2) = v10;
        v11 = "ESTALE: opened wrong document in %s [%d, %u, %u]";
        v12 = v7;
        v13 = 30;
LABEL_15:
        _os_log_error_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v20, v13);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  return 0;
}

uint64_t fpfs_pkg_is_package_root2(int a1, char *__s1, int *a3, int a4)
{
  int v8;
  int v9;
  int v10;
  char *v12;
  const char *v13;
  char *v14;
  char v15;
  BOOL v16;

  *a3 = 0;
  if (fpfs_path_is_safe_save_temp_filename(__s1, 0))
  {
    v8 = *a3;
    v9 = 16777218;
LABEL_3:
    *a3 = v8 | v9;
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    v13 = fpfs_extension_in_filename(__s1, 0);
    if (v13)
    {
      v14 = (char *)v13;
      if (pkg_extension_is_forced_folder(v13))
        goto LABEL_4;
      if (*v14 && fpfs_icd_package_extension_list_contains(v14))
      {
        v8 = *a3;
        v9 = 2097154;
        goto LABEL_3;
      }
      if ((fpfs_pathpkg_check(__s1) & 0x80000000) == 0)
      {
        v8 = *a3;
        v9 = 4194306;
        goto LABEL_3;
      }
    }
    v16 = 0;
    if (!fpfs_pkg_get_bundle_bit(a1, &v16) && v16)
    {
      v8 = *a3;
      v9 = 8388610;
      goto LABEL_3;
    }
  }
  else
  {
    if (a4)
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    v12 = (char *)fpfs_extension_in_filename(__s1, 0);
    if (v12 && *v12 && fpfs_user_package_extension_list_contains(v12))
    {
      v8 = *a3;
      v9 = 1048578;
      goto LABEL_3;
    }
  }
LABEL_4:
  v15 = 0;
  if (fpfs_pkg_is_demoted(a1, &v15) || !v15)
  {
    if (fpfs_pkg_is_promoted(a1, &v15) || !v15)
      return 0;
    v10 = 8;
  }
  else
  {
    v10 = 4;
  }
  *a3 |= v10;
  return 0;
}

uint64_t fpfs_pkg_is_demoted(int a1, _BYTE *a2)
{
  ssize_t v3;
  uint64_t result;

  *a2 = 1;
  v3 = fgetxattr(a1, "com.apple.fileprovider.dir#N", 0, 0, 0, 0);
  result = 0;
  if (v3 < 0)
  {
    if (*__error() == 93)
    {
      result = 0;
      *a2 = 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t fpfs_pkg_get_bundle_bit(int a1, BOOL *a2)
{
  int v3;
  uint64_t result;
  _QWORD v5[2];
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v5[0] = 0;
  v5[1] = 0;
  fpfs_get_finder_info_buffer(a1, v6);
  if (v3 < 0)
    return 0xFFFFFFFFLL;
  fpfs_finder_info_deserialize((uint64_t)v6, (uint64_t)v5);
  result = 0;
  *a2 = (v5[0] & 2) != 0;
  return result;
}

uint64_t fpfs_finder_info_deserialize(uint64_t result, uint64_t a2)
{
  unsigned int v2;

  v2 = bswap32(*(unsigned __int16 *)(result + 8));
  *(_BYTE *)a2 = (v2 >> 22) & 0x10 | (v2 >> 17) & 8 | ((v2 & 0x80000000) != 0) | (v2 >> 28) & 6 | *(_BYTE *)a2 & 0xE0;
  *(_BYTE *)(a2 + 1) = (v2 >> 17) & 7;
  *(_QWORD *)(a2 + 8) = bswap64(*(_QWORD *)result);
  return result;
}

double fpfs_get_finder_info_buffer(int a1, _OWORD *a2)
{
  double result;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _BYTE v7[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = xmmword_1A0B53EE0;
  v6 = 0;
  memset(v7, 0, sizeof(v7));
  if ((fgetattrlist(a1, &v5, v7, 0x28uLL, 0) & 0x80000000) == 0)
  {
    if ((*(_DWORD *)&v7[4] - 3) > 0xFFFFFFFD)
    {
      result = *(double *)&v7[8];
      v4 = *(_OWORD *)&v7[24];
      *a2 = *(_OWORD *)&v7[8];
      a2[1] = v4;
    }
    else
    {
      *__error() = 79;
    }
  }
  return result;
}

uint64_t fpfs_pkg_relative_path_lookup(const char *a1, char *a2, char a3, _BYTE *a4, _BYTE *a5, __darwin_ino64_t *a6, int a7)
{
  char *v13;
  unint64_t v14;
  size_t v15;
  char v16;
  uint64_t v17;
  int v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *j;
  char *v23;
  char *v24;
  char *v25;
  char *i;
  char *v27;
  const char *v28;
  char *v29;
  size_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  int v40;
  uint64_t v41;
  int v42;
  __darwin_ino64_t *v44;
  _BYTE *v45;
  unsigned int v46;
  int v47;
  char *v49;
  char v50;
  char *v51;
  char *__lasts;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, int);
  void *v55;
  char *v56;
  _BYTE v57[1024];
  stat v58[7];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = v57;
  bzero(v57, 0x400uLL);
  v14 = __strlcpy_chk();
  if (v14 >= 0x400)
  {
    if (!fpfs_supports_long_paths())
      return 0xFFFFFFFFLL;
    v13 = strdup(a1);
    if (!v13)
      return 0xFFFFFFFFLL;
  }
  if (v13[v14 - 1] == 47)
    v13[v14 - 1] = 0;
  if (a2)
  {
    v46 = fpfs_lp_openat(-2, a2, 1048836, 0);
    if ((v46 & 0x80000000) != 0)
    {
      LOBYTE(v15) = 0;
      v16 = 0;
      v17 = 0xFFFFFFFFLL;
      goto LABEL_93;
    }
  }
  else
  {
    v46 = -2;
  }
  v44 = a6;
  v45 = a5;
  *__error() = 0;
  v18 = *v13;
  v49 = 0;
  if (!v18)
LABEL_78:
    fpfs_pkg_relative_path_lookup_cold_1();
  v19 = (char *)MEMORY[0x1E0C809B0];
  v20 = v46;
  v47 = a7;
  while (1)
  {
    v21 = (char *)v58;
    bzero(v58, 0x400uLL);
    if ((unint64_t)__strlcpy_chk() >= 0x400)
    {
      v21 = strdup(v13);
      if (!v21)
      {
LABEL_79:
        v16 = 0;
        LOBYTE(v15) = 0;
        if (*__error())
          v17 = 0xFFFFFFFFLL;
        else
          v17 = 0;
LABEL_91:
        a5 = v45;
        if ((v20 & 0x80000000) != 0)
          goto LABEL_93;
        goto LABEL_92;
      }
    }
    if (a7 == 1)
    {
      v51 = 0;
      for (i = v21; ; i = 0)
      {
        v27 = strtok_r(i, "/", &v51);
        v24 = v27;
        if (!v27)
          break;
        if (v27 > v21 && !*(v27 - 1))
          *(v27 - 1) = 47;
        v28 = fpfs_extension_in_filename(v27, 0);
        if (v28)
        {
          v29 = (char *)v28;
          if (!pkg_extension_is_forced_folder(v28))
          {
            if (*v29 && (fpfs_icd_package_extension_list_contains(v29) & 1) != 0)
              break;
            if ((fpfs_pathpkg_check(v24) & 0x80000000) == 0)
              break;
            v50 = 0;
            __lasts = v19;
            v53 = 3221225472;
            v54 = __fpfs_pkg_get_bundle_bit_at_block_invoke;
            v55 = &__block_descriptor_40_e8_i12__0i8l;
            v56 = &v50;
            if (!fpfs_openat(v20, v21, 0x100000u, 0, 0, (uint64_t)&__lasts))
            {
              if (v50)
                break;
            }
          }
        }
      }
LABEL_39:
      if (v24)
        goto LABEL_40;
      goto LABEL_44;
    }
    if (!a7)
    {
      __lasts = 0;
      for (j = v21; ; j = 0)
      {
        v23 = strtok_r(j, "/", &__lasts);
        v24 = v23;
        if (!v23)
          break;
        if (v23 > v21 && !*(v23 - 1))
          *(v23 - 1) = 47;
        v25 = (char *)fpfs_extension_in_filename(v23, 0);
        if (v25)
        {
          if (*v25 && (fpfs_user_package_extension_list_contains(v25) & 1) != 0)
            break;
        }
      }
      goto LABEL_39;
    }
LABEL_44:
    v51 = 0;
    v32 = strtok_r(v21, "/", &v51);
    if (v32)
    {
      v24 = v32;
      while (1)
      {
        if (v24 > v21 && !*(v24 - 1))
          *(v24 - 1) = 47;
        v50 = 0;
        __lasts = v19;
        v53 = 3221225472;
        v54 = __fpfs_pkg_is_promoted_at_block_invoke;
        v55 = &__block_descriptor_40_e8_i12__0i8l;
        v56 = &v50;
        if (!fpfs_openat(v20, v21, 0x100000u, 0, 0, (uint64_t)&__lasts))
        {
          if (v50)
            break;
        }
        v24 = strtok_r(0, "/", &v51);
        if (!v24)
          goto LABEL_52;
      }
    }
    else
    {
LABEL_52:
      __lasts = 0;
      v33 = strtok_r(v21, "/", &__lasts);
      if (!v33)
      {
LABEL_59:
        *__error() = 0;
        v49 = 0;
LABEL_60:
        v31 = -1;
        goto LABEL_61;
      }
      v24 = v33;
      while (1)
      {
        if (v24 > v21 && !*(v24 - 1))
          *(v24 - 1) = 47;
        if (fpfs_path_is_safe_save_temp_filename(v24, 0))
          break;
        v24 = strtok_r(0, "/", &__lasts);
        if (!v24)
          goto LABEL_59;
      }
    }
LABEL_40:
    v30 = strlen(v24);
    v31 = &v24[v30] - v21;
    if (asprintf(&v49, "%.*s", (_DWORD)v24 + v30 - (_DWORD)v21, v13) < 0)
      goto LABEL_60;
    if (v13[v31] == 47)
      ++v31;
LABEL_61:
    if (v21 != (char *)v58)
      free(v21);
    if (v31 < 0)
      goto LABEL_79;
    *__error() = 0;
    v34 = v49;
    if (!v49)
      goto LABEL_79;
    v15 = strlen(v13);
    v35 = strlen(v49);
    if (v13[v15 - 1] == 47)
      --v15;
    v36 = v49[v35 - 1] == 47 ? v35 - 1 : v35;
    LOBYTE(__lasts) = 0;
    if ((a3 & 1) != 0)
      break;
    *(_QWORD *)&v58[0].st_dev = v19;
    v58[0].st_ino = 3221225472;
    *(_QWORD *)&v58[0].st_uid = __fpfs_pkg_is_demoted_at_block_invoke;
    *(_QWORD *)&v58[0].st_rdev = &__block_descriptor_40_e8_i12__0i8l;
    v58[0].st_atimespec.tv_sec = (__darwin_time_t)&__lasts;
    if ((fpfs_openat(v20, v49, 0x100000u, 0, 0, (uint64_t)v58) & 0x80000000) != 0 || !(_BYTE)__lasts)
      goto LABEL_83;
    v15 -= v36;
    if (!v15)
    {
      free(v34);
      v16 = 0;
      v17 = 0;
      goto LABEL_91;
    }
    memmove(v13, &v13[v36 + 1], v15);
    v13[v15] = 0;
    v37 = openat(v20, v34, 1048836);
    if ((v37 & 0x80000000) != 0)
    {
      free(v34);
      v16 = 0;
      LODWORD(v15) = 0;
      v17 = 0xFFFFFFFFLL;
      a5 = v45;
      goto LABEL_107;
    }
    v38 = v37;
    if ((_DWORD)v20 != -2)
      close(v20);
    free(v34);
    *__error() = 0;
    v49 = 0;
    v20 = v38;
    a7 = v47;
    if (!*v13)
      goto LABEL_78;
  }
  LODWORD(v20) = v46;
LABEL_83:
  v39 = v15 == v36;
  LODWORD(v15) = v15 != v36;
  v40 = v39;
  a5 = v45;
  if (!v44)
    goto LABEL_105;
  memset(v58, 0, 144);
  v41 = fpfs_lp_fstatat(v20, v34, v58, 32);
  if ((v41 & 0x80000000) != 0)
  {
    if (*__error() == 20)
    {
      v40 = 0;
      LODWORD(v15) = 0;
      v17 = 0;
    }
    else
    {
      v17 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    if ((v58[0].st_mode & 0xF000) == 0x4000)
    {
      v17 = v41;
      *v44 = v58[0].st_ino;
      goto LABEL_106;
    }
    v40 = 0;
    LODWORD(v15) = 0;
LABEL_105:
    v17 = 0;
  }
LABEL_106:
  free(v34);
  v16 = v40 != 0;
LABEL_107:
  LOBYTE(v15) = (_DWORD)v15 != 0;
  if ((v20 & 0x80000000) == 0)
  {
LABEL_92:
    v42 = *__error();
    close(v20);
    *__error() = v42;
  }
LABEL_93:
  if (v13 != v57)
    free(v13);
  if (a4)
    *a4 = v16;
  if (a5)
    *a5 = v15 & ~v16;
  return v17;
}

uint64_t fpfs_openat(uint64_t a1, char *a2, unsigned int a3, uint64_t a4, char a5, uint64_t a6)
{
  unsigned int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int *v26;
  int v27;
  char *v28;
  int v29;
  uint64_t v30;
  int *v31;
  int v32;
  int v33;
  int v35;
  char *v36;

  if (a3)
    v11 = a3;
  else
    v11 = 0x8000;
  v12 = ~(v11 >> 13) & 0x100 | v11;
  v13 = v12 | 4;
  if ((a5 & 1) != 0)
  {
    if (mkdirat(a1, a2, a4) < 0
      && (*__error() != 63
       || !fpfs_supports_long_paths()
       || (v36 = 0, v18 = fpfs_openat_longparent(a1, a2, &v36), v18 < 0)
       || (v19 = v18, v20 = mkdirat(v18, v36, a4), v21 = *__error(), close(v19), *__error() = v21, v20 < 0)))
    {
      v22 = __error();
      v23 = 0xFFFFFFFFLL;
      if ((v11 & 0x800) != 0 || *v22 != 17)
        return v23;
      v16 = 0;
    }
    else
    {
      v16 = 1;
    }
    v15 = fpfs_lp_openat(a1, a2, v13 & 0xFFFFF7FC, 0);
    if ((v15 & 0x80000000) == 0)
      goto LABEL_20;
    return 0xFFFFFFFFLL;
  }
  if ((v11 & 0x200) != 0)
  {
    v17 = fpfs_lp_openat(a1, a2, v12 | 0x804u, a4);
    if ((v17 & 0x80000000) == 0)
    {
      v15 = v17;
      v16 = 1;
      goto LABEL_20;
    }
    v31 = __error();
    v23 = 0xFFFFFFFFLL;
    if ((v11 & 0x800) != 0 || *v31 != 17)
      return v23;
    v27 = a1;
    v28 = a2;
    v29 = v13;
    v30 = a4;
LABEL_36:
    v15 = fpfs_lp_openat(v27, v28, v29, v30);
    v16 = 0;
    if ((v15 & 0x80000000) == 0)
      goto LABEL_20;
    return 0xFFFFFFFFLL;
  }
  v14 = fpfs_lp_openat(a1, a2, v12 | 4u, 0);
  if ((v14 & 0x80000000) != 0)
  {
    v25 = v13 & 0xFFFFFFFC;
    v26 = __error();
    if ((v11 & 3) == 0 || (a5 & 2) == 0 || *v26 != 21)
    {
      if ((a5 & 4) == 0 && (*__error() == 13 || *__error() == 1))
      {
        v32 = fpfs_lp_openat(a1, a2, v25, 0);
        if ((v32 & 0x80000000) == 0)
        {
          v33 = v32;
          v23 = fpfs_openat(a1, a2, v25, a4, 4, a6);
          if ((v23 & 0x80000000) != 0)
          {
            v35 = *__error();
            close(v33);
            *__error() = v35;
            return v23;
          }
          if ((close(v33) & 0x80000000) == 0 || *__error() != 9 && *__error() != 5)
            return v23;
        }
      }
      return 0xFFFFFFFFLL;
    }
    v27 = a1;
    v28 = a2;
    v29 = v25;
    v30 = 0;
    goto LABEL_36;
  }
  v15 = v14;
  v16 = 0;
LABEL_20:
  if (a6)
  {
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a6, v15);
    if ((v23 & 0x80000000) == 0)
    {
      if (close(v15) < 0)
        return 0xFFFFFFFFLL;
      else
        return v23;
    }
  }
  else
  {
    v23 = 0;
  }
  v24 = *__error();
  close(v15);
  if (v16)
    unlinkat(a1, a2, (a5 & 1) << 7);
  *__error() = v24;
  return v23;
}

uint64_t fpfs_lp_openat(int a1, char *a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = openat(a1, a2, a3, a4);
  if ((v8 & 0x80000000) != 0 && *__error() == 63 && fpfs_supports_long_paths())
    return fpfs_openat_longpath(a1, a2, a3, a4);
  else
    return v8;
}

uint64_t fpfs_path_is_safe_save_temp_filename(char *__s1, int a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  int v12;

  if (!a2)
  {
    if (strncmp(__s1, "(A Document Being Saved", 0x17uLL))
      goto LABEL_5;
    return 2;
  }
  if (_CFURLCStringIsPromiseName())
    return 0;
  if (!strcmp(__s1, ".DS_Store"))
    return 1;
  if (!strncmp(__s1, "(A Document Being Saved", 0x17uLL))
    return 2;
  if (!strncmp(__s1, ".dat.nosync", 0xBuLL))
    return 3;
LABEL_5:
  if (!strncmp(__s1, "~$", 2uLL) || !strncmp(__s1, ".~", 2uLL))
    return 4;
  result = (uint64_t)fpfs_extension_in_filename(__s1, 0);
  if (result)
  {
    v5 = result;
    result = strlen((const char *)result);
    if (result)
    {
      v6 = result;
      result = strcmp((const char *)v5, "svn-base");
      if ((_DWORD)result)
      {
        if (!a2)
          goto LABEL_35;
        if (*__s1 == 46)
        {
          v7 = strrchr((char *)v5, 45);
          v8 = (uint64_t)&v7[-v5];
          if (v7 && v8 < 0)
            fpfs_path_is_safe_save_temp_filename_cold_1();
          if (v7)
          {
            v9 = v7[1];
            if (v7[1])
            {
              v10 = 0;
              while (v10 <= 3
                   && ((char)v9 & 0x80000000) == 0
                   && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v9 + 60) & 0x500) != 0)
              {
                v11 = v10 + 1;
                v9 = v7[v10++ + 2];
                if (!v9)
                {
                  if (v11 >= 3 && (is_ext_image_type(v5, v8) & 1) != 0)
                    return 5;
                  break;
                }
              }
            }
          }
        }
        if (v5 - (uint64_t)__s1 >= 6 && !strncmp((const char *)(v5 - 5), ".kra.", 5uLL))
        {
          return 6;
        }
        else
        {
LABEL_35:
          if (v6 >= 2 && !strcmp((const char *)(v5 + v6 - 1), "~"))
          {
            return 7;
          }
          else
          {
            if (!a2)
              goto LABEL_41;
            if (is_adobe_after_effect_safe_save((unint64_t)__s1, (char *)v5))
              return 8;
            if ((is_adobe_illustrator_safe_save(__s1) & 1) != 0)
            {
              return 9;
            }
            else
            {
LABEL_41:
              v12 = strncmp((const char *)v5, "sb-", 3uLL);
              if (v6 != 18 || v12)
              {
                if (v6 != 3 || *__s1 != 46 || *(_WORD *)v5 != 30579 || *(char *)(v5 + 2) >= 113)
                  return 0;
                return 11;
              }
              else
              {
                if (*(_BYTE *)(v5 + 11) != 45)
                  return 0;
                return 10;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

const char *fpfs_extension_in_filename(char *a1, uint64_t a2)
{
  char *v4;
  const char *v5;
  char v7;
  const char *i;
  int v9;
  char *v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v4 = strrchr(a1, 46);
  v5 = 0;
  if (v4 && v4 != a1)
  {
    v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32)
      return 0;
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      v10 = strdup(a1);
      v5[~(unint64_t)a1 + (_QWORD)v10] = 0;
      v11 = fpfs_extension_in_filename();
      if (v11)
        v5 = &a1[v11 - (_QWORD)v10];
      free(v10);
    }
    else
    {
      v7 = 0;
      for (i = v5; ; ++i)
      {
        v9 = *(unsigned __int8 *)i;
        if (!*i)
          break;
        if (v9 == 32 || v9 == 47)
          return 0;
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0)
        return 0;
    }
  }
  return v5;
}

uint64_t fpfs_pkg_is_promoted(int a1, _BYTE *a2)
{
  uint64_t result;
  int v4;

  v4 = 0;
  if ((fpfs_pkg_getflags(a1, &v4) & 0x80000000) != 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = v4 & 1;
  return result;
}

uint64_t fpfs_pkg_getflags(int a1, _DWORD *a2)
{
  unint64_t v4;
  uint64_t result;
  int value;

  value = 0;
  v4 = fgetxattr(a1, "com.apple.fileprovider.fpfs#P", &value, 4uLL, 0, 0);
  if ((v4 & 0x8000000000000000) != 0)
    return 0xFFFFFFFFLL;
  if (v4 <= 3)
  {
    fremovexattr(a1, "com.apple.fileprovider.fpfs#P", 0);
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  result = 0;
  *a2 = value;
  return result;
}

uint64_t __fpfs_pkg_is_promoted_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_is_promoted(a2, *(_BYTE **)(a1 + 32));
}

uint64_t __fpfs_pkg_fd_lookup_block_invoke(uint64_t a1, int a2)
{
  __int128 v2;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __fpfs_pkg_fd_lookup_block_invoke_2;
  v4[3] = &__block_descriptor_73_e5_i8__0l;
  v8 = *(_BYTE *)(a1 + 72);
  v2 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 64);
  return fpfs_fchdir(a2, (uint64_t)v4);
}

uint64_t fpfs_fchdir(int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  _QWORD v8[5];
  int v9;

  if (a1 == -2)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 0x40000000;
  v8[2] = __fpfs_fchdir_block_invoke;
  v8[3] = &unk_1E444B3A0;
  v9 = a1;
  v8[4] = a2;
  v3 = fpfs_lp_openat(-2, ".", 0x100000, 0);
  if ((v3 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v4 = v3;
  if ((MEMORY[0x1A1B00AB4](0xFFFFFFFFLL) & 0x80000000) != 0)
  {
    v7 = *__error();
    close(v4);
    *__error() = v7;
    return __fpfs_fchdir_block_invoke((uint64_t)v8, 0xFFFFFFFFLL);
  }
  else
  {
    v5 = __fpfs_fchdir_block_invoke((uint64_t)v8, v4);
    v6 = *__error();
    close(v4);
    *__error() = v6;
  }
  return v5;
}

uint64_t __fpfs_fchdir_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;

  if ((MEMORY[0x1A1B00AB4](*(unsigned int *)(a1 + 40)) & 0x80000000) != 0)
  {
    v5 = *__error();
    MEMORY[0x1A1B00AB4](a2);
    *__error() = v5;
    return 0xFFFFFFFFLL;
  }
  else
  {
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if ((v4 & 0x80000000) != 0)
    {
      v6 = *__error();
      MEMORY[0x1A1B00AB4](a2);
      *__error() = v6;
    }
    else if ((int)MEMORY[0x1A1B00AB4](a2) < 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return v4;
    }
  }
  return v4;
}

uint64_t __fpfs_pkg_fd_lookup_block_invoke_2(uint64_t a1)
{
  int v3;
  __int128 v4;
  uint64_t v5;
  char v6[766];
  _BYTE v7[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bzero(v6, 0x2FEuLL);
  if (*(_QWORD *)(a1 + 32))
  {
    __strlcpy_chk();
    return fpfs_pkg_path_lookup(v6, 0, *(_BYTE *)(a1 + 72), *(_BYTE **)(a1 + 40), *(_BYTE **)(a1 + 48), *(__darwin_ino64_t **)(a1 + 56), *(_DWORD *)(a1 + 68));
  }
  v3 = *(_DWORD *)(a1 + 64);
  v4 = xmmword_1A0B53E20;
  v5 = 0;
  bzero(v7, 0x30CuLL);
  if ((fgetattrlist(v3, &v4, v7, 0x30CuLL, 0) & 0x80000000) == 0)
  {
    if (v8 < 0x2FF)
    {
      if ((unint64_t)__strlcpy_chk() < 0x2FE)
        return fpfs_pkg_path_lookup(v6, 0, *(_BYTE *)(a1 + 72), *(_BYTE **)(a1 + 40), *(_BYTE **)(a1 + 48), *(__darwin_ino64_t **)(a1 + 56), *(_DWORD *)(a1 + 68));
    }
    else
    {
      *__error() = 63;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_pkg_path_lookup(char *a1, char *a2, char a3, _BYTE *a4, _BYTE *a5, __darwin_ino64_t *a6, int a7)
{
  const char *v13;

  v13 = fpfs_path_relative_to(a1, a2);
  if (v13 && *v13)
    return fpfs_pkg_relative_path_lookup(v13, a2, a3, a4, a5, a6, a7);
  else
    return 0;
}

const char *fpfs_path_relative_to(char *__s, const char *a2)
{
  const char *v2;
  size_t v4;
  size_t v5;
  size_t v6;

  v2 = __s;
  if (__s && a2)
  {
    v4 = strlen(__s);
    v5 = strlen(a2);
    if (v5 <= v4 && (v6 = v5, !strncmp(a2, v2, v5)))
    {
      if (v2[v6] == 47)
        v2 += v6 + 1;
      else
        v2 += v6;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t fpfs_get_is_ignore_root(int a1, BOOL *a2)
{
  ssize_t v3;
  uint64_t result;

  v3 = fgetxattr(a1, "com.apple.fileprovider.ignore#P", 0, 0, 0, 0);
  if (v3 < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = v3 >= 0;
  return result;
}

uint64_t fpfs_get_dirstat(int a1, _QWORD *a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 1;
  if (ffsctl(a1, 0xC0284A20uLL, &v8, 0) < 0)
    return 0xFFFFFFFFLL;
  if (a2)
    *a2 = v10;
  if (a3)
    *a3 = DWORD2(v10);
  result = 0;
  if (a4)
    *a4 = *((_QWORD *)&v9 + 1);
  return result;
}

BOOL fpfs_is_resurrected(int a1)
{
  return fgetxattr(a1, "com.apple.fileprovider.is_resurrected#PN", 0, 0, 0, 0) >= 0;
}

uint64_t fpfs_is_detached_root(int a1, char *a2)
{
  char v4;
  uint64_t result;

  if ((fgetxattr(a1, "com.apple.fileprovider.detached#B", 0, 0, 0, 0) & 0x8000000000000000) == 0
    || *__error() == 93
    && (fgetxattr(a1, "com.apple.fileprovider.detached", 0, 0, 0, 0) & 0x8000000000000000) == 0
    || *__error() == 93
    && (fgetxattr(a1, "com.apple.fileprovider.detached#PN", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    v4 = 1;
LABEL_3:
    result = 0;
    *a2 = v4;
    return result;
  }
  if (*__error() == 93)
  {
    v4 = 0;
    goto LABEL_3;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_tag_data(int a1, uint64_t a2, uint64_t a3)
{
  ssize_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t result;
  char v12;

  v6 = fgetxattr(a1, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0);
  if (v6 < 0)
  {
    if (*__error() != 93)
      return 0xFFFFFFFFLL;
LABEL_8:
    result = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = 0;
    return result;
  }
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  v8 = malloc_type_malloc(v6, 0x175080ABuLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = fpfs_fgetxattr_checked(a1, "com.apple.metadata:_kMDItemUserTags", v8, v7);
  if (v10 < 0)
  {
    free(v9);
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = v10;
  result = 0;
  if (a2)
    v12 = *(_BYTE *)(a2 + 1);
  else
    v12 = 1;
  *(_BYTE *)(a3 + 16) = v12;
  return result;
}

uint64_t fpfs_get_last_use_date(int a1, uint64_t *a2, int a3)
{
  ssize_t v5;
  int use_date;
  uint64_t result;
  _QWORD value[3];

  value[2] = *MEMORY[0x1E0C80C00];
  value[0] = 0;
  value[1] = 0;
  v5 = fgetxattr(a1, "com.apple.lastuseddate#PS", value, 0x10uLL, 0, 0);
  if (v5 < 0)
  {
    if (*__error() != 93 && *__error() != 34)
      return 0xFFFFFFFFLL;
    result = 0;
  }
  else
  {
    use_date = fpfs_deserialize_last_use_date(a2, (const UInt8 *)value, v5, a3);
    result = 1;
    if ((use_date & 0x80000000) == 0)
      return result;
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

uint64_t fpfs_get_is_sync_resuming_with_drop_local_changes(int a1, char *a2)
{
  char v3;
  uint64_t result;

  if ((fgetxattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    v3 = 1;
LABEL_5:
    result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_is_sync_paused(int a1, char *a2)
{
  char v3;
  uint64_t result;

  if ((fgetxattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    v3 = 1;
LABEL_5:
    result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_is_pinned(int a1, char *a2)
{
  char v3;
  uint64_t result;

  if ((fgetxattr(a1, "com.apple.fileprovider.pinned#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    v3 = 1;
LABEL_5:
    result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_favorite_rank(int a1, unint64_t *a2)
{
  CFIndex v4;
  uint64_t result;
  char *__endptr;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v4 = fpfs_fgetxattr_checked(a1, "com.apple.metadata:kMDItemFavoriteRank", __str, 127);
  if (v4 < 0)
    return 0xFFFFFFFFLL;
  if (v4)
  {
    __str[v4] = 0;
    return fpfs_deserialize_favorite_rank(a2, (const UInt8 *)__str, v4);
  }
  result = fpfs_fgetxattr_checked(a1, "com.apple.favorite-rank.number#PS", __str, 127);
  if (result < 0)
    return 0xFFFFFFFFLL;
  __str[result] = 0;
  if (!result)
  {
    *a2 = 0;
    return result;
  }
  __endptr = 0;
  *a2 = strtoull(__str, &__endptr, 10);
  if (!__endptr)
    return 0xFFFFFFFFLL;
  if (*__endptr)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t fpfs_fgetxattr_checked(int a1, const char *a2, void *a3, int64_t a4)
{
  ssize_t v5;
  ssize_t v6;

  v5 = fgetxattr(a1, a2, a3, a4, 0, 0);
  if (v5 <= a4)
  {
    v6 = v5;
    if (v5 < 0 && *__error() == 93)
      return 0;
  }
  else
  {
    *__error() = 34;
    return -1;
  }
  return v6;
}

char *fpfs_copy_collaboration_identifier(int a1)
{
  ssize_t v2;
  size_t v3;
  UInt8 *v4;
  const UInt8 *v5;
  CFDataRef v6;
  CFDataRef v7;
  id MDItemCollaborationIdentifier;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  CFTypeID v13;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v16;
  char *v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v2 = fgetxattr(a1, "com.apple.metadata:kMDItemCollaborationIdentifier", 0, 0, 0, 0);
  if (v2 < 1)
    return 0;
  v3 = v2;
  v4 = (UInt8 *)malloc_type_malloc(v2, 0xFE52665DuLL);
  if (!v4)
    return 0;
  v5 = v4;
  if (fgetxattr(a1, "com.apple.metadata:kMDItemCollaborationIdentifier", v4, v3, 0, 0) != v3
    || (v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, v3, (CFAllocatorRef)*MEMORY[0x1E0C9AE10])) == 0)
  {
    v18 = (void *)v5;
    goto LABEL_14;
  }
  v7 = v6;
  MDItemCollaborationIdentifier = getMDItemCollaborationIdentifier();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v9 = getMDPropertyCopyDecodedValueSymbolLoc_ptr;
  v23 = getMDPropertyCopyDecodedValueSymbolLoc_ptr;
  if (!getMDPropertyCopyDecodedValueSymbolLoc_ptr)
  {
    v10 = (void *)MetadataUtilitiesLibrary();
    v9 = dlsym(v10, "MDPropertyCopyDecodedValue");
    v21[3] = (uint64_t)v9;
    getMDPropertyCopyDecodedValueSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v20, 8);
  if (!v9)
    fpfs_copy_collaboration_identifier_cold_1();
  v11 = (const __CFString *)((uint64_t (*)(id, CFDataRef))v9)(MDItemCollaborationIdentifier, v7);
  if (!v11 || (v12 = v11, v13 = CFGetTypeID(v11), v13 != CFStringGetTypeID()))
  {
LABEL_16:
    CFRelease(v7);
    return 0;
  }
  Length = CFStringGetLength(v12);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= 0)
  {
    CFRelease(v12);
    goto LABEL_16;
  }
  v16 = MaximumSizeForEncoding;
  v17 = (char *)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0x7C64E976uLL);
  LODWORD(v16) = CFStringGetCString(v12, v17, v16, 0x8000100u);
  CFRelease(v7);
  CFRelease(v12);
  if (!(_DWORD)v16)
  {
    v18 = v17;
LABEL_14:
    free(v18);
    return 0;
  }
  return v17;
}

void sub_1A0A56968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

_BYTE *fpfs_copy_before_bounce_filename(int a1)
{
  ssize_t v2;
  size_t v3;
  _BYTE *v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = fgetxattr(a1, "com.apple.fileprovider.before-bounce#P", 0, 0, 0, 0);
  if (v2 < 1)
    return 0;
  v3 = v2;
  v4 = malloc_type_malloc(v2 + 1, 0x3745183BuLL);
  if (!v4)
    return v4;
  if (fgetxattr(a1, "com.apple.fileprovider.before-bounce#P", v4, v3, 0, 0) != v3)
  {
    free(v4);
    return 0;
  }
  v4[v3] = 0;
  if (!*v4)
  {
    fpfs_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "Found an empty filename in before_bounce_filename xattr", v7, 2u);
    }

    free(v4);
    v4 = 0;
    *__error() = 22;
  }
  return v4;
}

uint64_t fpfs_deserialize_last_use_date(uint64_t *a1, const UInt8 *a2, CFIndex a3, int a4)
{
  CFDataRef v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v6 = CFDataCreate(0, a2, a3);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v7 = getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr;
  v14 = getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr;
  if (!getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr)
  {
    v8 = (void *)MetadataUtilitiesLibrary();
    v7 = dlsym(v8, "MDPropertyDecodedLastUsedDateTimeSpec");
    v12[3] = (uint64_t)v7;
    getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v11, 8);
  if (!v7)
    fpfs_deserialize_last_use_date_cold_1();
  v9 = ((uint64_t (*)(CFDataRef, uint64_t *))v7)(v6, a1);
  CFRelease(v6);
  if (v9)
  {
    if (a4)
      return _validate_last_used_time(a1);
    else
      return 0;
  }
  else
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
}

void sub_1A0A56B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

BOOL FPSearchableItemVersionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

os_log_t fpfs_create_log_for_provider(char *category)
{
  return os_log_create("com.apple.FileProvider", category);
}

void sub_1A0A57D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void fp_reachability_callback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char __str[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1B00664]();
  v6 = a2 & 4;
  if ((a2 & 2) != 0)
  {
    if ((a2 & 4) == 0)
      goto LABEL_9;
    v9 = (a2 & 0x28) != 0;
    if ((a2 & 0x10) != 0)
      v9 = 0;
    if ((a2 & 0x40000) != 0 || v9)
    {
LABEL_9:
      v7 = "";
      v8 = 82;
    }
    else
    {
      v7 = "un";
      v8 = 82;
      v6 = 1;
    }
  }
  else
  {
    v7 = "un";
    v8 = 45;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)__str = 0u;
  v33 = 0u;
  v10 = a3;
  v11 = 100;
  if ((a2 & 0x20000) == 0)
    v11 = 45;
  v12 = 108;
  if ((a2 & 0x10000) == 0)
    v12 = 45;
  v30 = v12;
  v31 = v11;
  v13 = 68;
  if ((a2 & 0x20) == 0)
    v13 = 45;
  v14 = 105;
  if ((a2 & 0x10) == 0)
    v14 = 45;
  v28 = v14;
  v29 = v13;
  v15 = 67;
  if ((a2 & 8) == 0)
    v15 = 45;
  v16 = 99;
  if (!v6)
    v16 = 45;
  v27 = v15;
  v17 = 116;
  if ((a2 & 1) == 0)
    v17 = 45;
  v26 = v17;
  v18 = 87;
  if ((a2 & 0x40000) == 0)
    v18 = 45;
  snprintf(__str, 0x80uLL, "%sreachable [%c%c %c%c%c%c%c%c%c]", v7, v18, v8, v26, v16, v27, v28, v29, v30, v31);
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    fp_reachability_callback_cold_1((uint64_t)__str, v19, v20, v21, v22, v23, v24, v25);

  objc_msgSend(v10, "setReachabilityFlags:", a2);
  objc_autoreleasePoolPop(v5);
}

void sub_1A0A58DB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id FPItemPredicate(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3880];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __FPItemPredicate_block_invoke;
  v6[3] = &unk_1E444FBE0;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v2, "predicateWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A0A59334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A595B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A597B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A599F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A59BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _brc_notify_get_state(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v6 = getbrc_notify_get_stateSymbolLoc_ptr;
  v12 = getbrc_notify_get_stateSymbolLoc_ptr;
  if (!getbrc_notify_get_stateSymbolLoc_ptr)
  {
    v7 = (void *)CloudDocsLibrary();
    v6 = dlsym(v7, "brc_notify_get_state");
    v10[3] = (uint64_t)v6;
    getbrc_notify_get_stateSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
    _brc_notify_get_state_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void sub_1A0A59C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id FPNotifyNameForForegroundChangeWithProviderID(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByAppendingString:", CFSTR(".foreground"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_libnotifyPerUserNotificationName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1A0A59FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5A138(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5A248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5A348(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5A7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  __fp_leave_section_Debug(v8 - 40);
  _Unwind_Resume(a1);
}

void sub_1A0A5ABA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5ACA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5AD3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPDataSourceBaseQueue()
{
  if (FPDataSourceBaseQueue_once != -1)
    dispatch_once(&FPDataSourceBaseQueue_once, &__block_literal_global_40);
  return (id)FPDataSourceBaseQueue_updateQueue;
}

void sub_1A0A5B6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A5B97C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5BBE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5BCCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5BE5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fget_parent_id(int a1, _QWORD *a2)
{
  uint64_t result;
  _QWORD v4[2];
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v5 = xmmword_1A0B53BB8;
  memset(v4, 0, 12);
  if (fgetattrlist(a1, &v5, v4, 0xCuLL, 0) < 0)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = *(_QWORD *)((char *)v4 + 4);
  return result;
}

id FPAppIdentifierFromTeamAppTuple(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  uint64_t i;
  int v5;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  _QWORD v12[2];
  int v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.")))
  {
    v2 = v1;
  }
  else if ((unint64_t)objc_msgSend(v1, "length") > 0xA)
  {
    MEMORY[0x1E0C80A78]();
    v12[0] = 0;
    v12[1] = 0;
    v13 = 0;
    objc_msgSend(v1, "getCharacters:range:", v12, 0, 10);
    for (i = 0; i != 20; i += 2)
    {
      v5 = *(unsigned __int16 *)((char *)v12 + i);
      if ((v5 - 65) >= 0x1A && (v5 - 48) >= 0xA)
      {
        fp_current_or_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_DWORD *)buf = 138412290;
        v15 = v1;
        v8 = "[WARNING] team prefix must only contain characters in [0-9,A-Z] (%@)";
        v9 = v7;
        v10 = 12;
        goto LABEL_19;
      }
    }
    if (objc_msgSend(v1, "characterAtIndex:", 10) == 46)
    {
      objc_msgSend(v1, "substringFromIndex:", 11);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "[WARNING] team prefix must be followed by a dot.";
      v9 = v7;
      v10 = 2;
LABEL_19:
      _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
LABEL_20:

    v2 = 0;
  }
  else
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v1;
      _os_log_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract application ID from '%@'", buf, 0xCu);
    }

    v2 = 0;
  }
LABEL_21:

  return v2;
}

void sub_1A0A5D848(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A5DC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MetadataUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444AD00;
    v3 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary)
    MetadataUtilitiesLibrary_cold_1(&v1);
  return MetadataUtilitiesLibraryCore_frameworkLibrary;
}

uint64_t MetadataUtilitiesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_1E444DD68;
    v3 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_0)
    MetadataUtilitiesLibrary_cold_1_0(&v1);
  return MetadataUtilitiesLibraryCore_frameworkLibrary_0;
}

uint64_t MetadataUtilitiesLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_1E444FDA0;
    v3 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_1)
    MetadataUtilitiesLibrary_cold_1_1(&v1);
  return MetadataUtilitiesLibraryCore_frameworkLibrary_1;
}

uint64_t fp_shouldObfuscateFilenames()
{
  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  return fp_shouldObfuscateFilenames_shouldObfuscate;
}

uint64_t FPFSProviderIsForcedForFPFS(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = FPFSProviderIsForcedForFPFS_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&FPFSProviderIsForcedForFPFS_onceToken, &__block_literal_global_21_0);
  v3 = objc_msgSend((id)FPFSProviderIsForcedForFPFS_enabledProviders, "containsObject:", v2);

  return v3;
}

id FPDaemonActionOperationClientXPCInterface()
{
  if (FPDaemonActionOperationClientXPCInterface_once != -1)
    dispatch_once(&FPDaemonActionOperationClientXPCInterface_once, &__block_literal_global_367);
  return (id)FPDaemonActionOperationClientXPCInterface_interface;
}

void FPXSetOperationServiceOnXPCInterface(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  objc_method_description *v64;
  objc_method_description *v65;
  unint64_t v66;
  SEL *p_name;
  const char *Name;
  unsigned int outCount;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D91B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FPSetOperationClientOnXPCInterface(v2);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler_, 1, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler_, 1, 0);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_deleteItemsWithIDs_baseVersions_options_reply_, 0, 0);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_deleteItemsWithIDs_baseVersions_options_reply_, 1, 0);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_preflightReparentItemIDs_underParentID_reply_, 0, 0);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_preflightReparentItemIDs_underParentID_reply_, 0, 1);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_bulkItemChanges_changedFields_completionHandler_, 0, 0);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_bulkItemChanges_changedFields_completionHandler_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_bulkItemChanges_changedFields_completionHandler_, 1, 1);

  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_preflightTrashItemIDs_completionHandler_, 0, 0);

  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_preflightTrashItemIDs_completionHandler_, 0, 1);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply_, 0, 1);

  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_userInteractionErrorsForPerformingAction_sourceItems_destinationItem_fpProviderDomainId_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler_, 1, 0);

  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_userInteractionErrorsForPerformingAction_sourceItems_destinationItem_fpProviderDomainId_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler_, 0, 1);

  v50 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_fetchTrashIdentifiersWithCompletionHandler_, 0, 1);

  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_, 0, 0);

  v56 = (void *)MEMORY[0x1E0C99E60];
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  objc_msgSend(v56, "setWithObjects:", v57, v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_, 0, 1);

  v60 = (void *)MEMORY[0x1E0C99E60];
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  objc_msgSend(v60, "setWithObjects:", v61, v62, objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_, 1, 1);

  outCount = 0;
  v64 = protocol_copyMethodDescriptionList((Protocol *)&unk_1EE5CF740, 1, 1, &outCount);
  v65 = v64;
  if (outCount)
  {
    v66 = 0;
    p_name = &v64->name;
    do
    {
      Name = sel_getName(*p_name);
      if (!strncmp(Name, "startOperation:", 0xFuLL))
        objc_msgSend(v1, "setInterface:forSelector:argumentIndex:ofReply:", v2, *p_name, 0, 0);
      ++v66;
      p_name += 2;
    }
    while (v66 < outCount);
  }
  free(v65);

}

void FPSetOperationClientOnXPCInterface(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = (void *)MEMORY[0x1E0CB3B50];
  v2 = a1;
  objc_msgSend(v1, "interfaceWithProtocol:", &unk_1EE5D90F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_setCancellationHandler_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_operationDidProgressWithInfo_error_completionHandler_, 0, 0);

}

id FPDaemonActionOperationXPCInterface()
{
  if (FPDaemonActionOperationXPCInterface_once != -1)
    dispatch_once(&FPDaemonActionOperationXPCInterface_once, &__block_literal_global_375);
  return (id)FPDaemonActionOperationXPCInterface_interface;
}

id FPXOperationServiceXPCInterface()
{
  if (FPXOperationServiceXPCInterface_once != -1)
    dispatch_once(&FPXOperationServiceXPCInterface_once, &__block_literal_global_518);
  return (id)FPXOperationServiceXPCInterface_interface;
}

id FPXEnumeratorXPCInterface()
{
  if (FPXEnumeratorXPCInterface_once != -1)
    dispatch_once(&FPXEnumeratorXPCInterface_once, &__block_literal_global_53);
  return (id)FPXEnumeratorXPCInterface_interface;
}

id FPDDomainServicingXPCInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F7E00);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler_, 1, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler_, 1, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_getDiagnosticAttributesForItems_completionHandler_, 0, 0);

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_getDiagnosticAttributesForItems_completionHandler_, 1, 0);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getDiagnosticAttributesForItems_completionHandler_, 0, 1);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_getDiagnosticAttributesForItems_completionHandler_, 1, 1);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, v47, v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setByAddingObject:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_listAvailableTestingOperationsWithCompletionHandler_, 0, 1);

  objc_msgSend(v49, "setByAddingObject:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_runTestingOperations_completionHandler_, 0, 0);

  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setByAddingObjectsFromArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_runTestingOperations_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5E91D8);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v54, sel_subscribeToUploadProgressUpdates_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5E91D8);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v55, sel_subscribeToDownloadProgressUpdates_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DB010);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v56, sel_startAccessingServiceWithName_itemID_completionHandler_, 1, 1);

  return v0;
}

void _FPRestorePersona(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  if (*a1)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentPersona");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (id)objc_msgSend(v4, "restorePersonaWithSavedPersonaContext:", *a1);
  }
}

uint64_t __fpfs_supports_sokoban_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"Sokoban");
  fpfs_supports_sokoban_feature_enabled = result;
  return result;
}

uint64_t _fpfs_is_feature_flag_enabled(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.fileproviderd.%sDevelopment"), a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", v3);

    return v5;
  }
  return result;
}

void __fp_leave_section_Notice(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *a1;
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┗%llx ", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __init_log_tls_if_needed_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&log_pthread_key, (void (__cdecl *)(void *))log_pthread_key_dtor);
  if ((_DWORD)result)
    abort();
  return result;
}

void __fp_dispatch_async_with_logs_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  fpfs_adopt_log(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __fp_dispatch_async_with_logs_block_invoke_cold_1((uint64_t)&v4, a1);

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  __fp_leave_section_Debug((uint64_t)&v4);
  __fp_pop_log(&v5);

}

void sub_1A0A61F08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void __fp_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProvider", "default");
  v1 = (void *)fp_default_log_logger;
  fp_default_log_logger = (uint64_t)v0;

}

uint64_t FPIsSpaceAttributionEnabledAndUsedByStorageUI()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return FPFeatureFlagSpaceAttributionIsEnabled();
  return result;
}

void sub_1A0A62228(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ____fp_create_section_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("create-log-section", v2);
  v1 = (void *)__fp_create_section_queue;
  __fp_create_section_queue = (uint64_t)v0;

}

void sub_1A0A62304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A62390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL FPFeatureFlagSpaceAttributionIsEnabled()
{
  return _os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0;
}

void sub_1A0A62630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_lp_sandbox_check_by_audit_token(_OWORD *a1, uint64_t a2, int a3, const char *a4)
{
  __int128 v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  int v12;
  unint64_t v13;
  int v14;
  __int128 v15;
  int v16;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  int v21;
  char *__s[2];
  __int128 v23;

  v8 = a1[1];
  *(_OWORD *)__s = *a1;
  v23 = v8;
  v9 = sandbox_check_by_audit_token();
  if ((v9 & 0x80000000) != 0
    && (a3 & ~(*MEMORY[0x1E0C80698] | *MEMORY[0x1E0C806B0] | *MEMORY[0x1E0C806A0] | *MEMORY[0x1E0C806A8] | *MEMORY[0x1E0C80690] | *MEMORY[0x1E0C806B8])) == 1
    && *__error() == 63
    && fpfs_supports_long_paths())
  {
    __s[0] = 0;
    v10 = strlen(a4);
    v11 = strdup(a4);
    v12 = fpfs_openat_longparent(-2, v11, __s);
    if (v12 < 0)
    {
      while (*__s[0])
      {
        v13 = v10 - strlen(__s[0]);
        v10 = v13 - (v13 > 1);
        v11[v10] = 0;
        v14 = fpfs_openat_longparent(-2, v11, __s);
        if ((v14 & 0x80000000) == 0)
        {
          v12 = v14;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 0x40000000;
      v18[2] = __fpfs_lp_sandbox_check_by_audit_token_block_invoke;
      v18[3] = &__block_descriptor_tmp_2_0;
      v15 = a1[1];
      v19 = *a1;
      v20 = v15;
      v21 = a3;
      v18[4] = a2;
      v18[5] = __s[0];
      v9 = fpfs_fchdir(v12, (uint64_t)v18);
      v16 = *__error();
      close(v12);
      *__error() = v16;
    }
    free(v11);
  }
  return v9;
}

void __itemCollectionUpdateQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.update-queue", v2);
  v1 = (void *)itemCollectionUpdateQueue_updateQueue;
  itemCollectionUpdateQueue_updateQueue = (uint64_t)v0;

}

void sub_1A0A63D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0A640E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A64194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

__CFString *FPExecutableNameForProcessIdentifier()
{
  int v0;
  void *v1;
  __CFString *v2;
  _BYTE buffer[4096];
  uint64_t v5;

  v0 = MEMORY[0x1E0C80A78]();
  v5 = *MEMORY[0x1E0C80C00];
  if (FPExecutableNameForProcessIdentifier_onceToken != -1)
    dispatch_once(&FPExecutableNameForProcessIdentifier_onceToken, &__block_literal_global_19);
  if (FPExecutableNameForProcessIdentifier_pidResolutionAllowed
    && (bzero(buffer, 0x1000uLL), proc_pidpath(v0, buffer, 0x1000u) >= 1))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", buffer, 0, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "lastPathComponent");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = CFSTR("<unresolved>");
  }
  return v2;
}

BOOL pkg_extension_is_forced_folder(const char *a1)
{
  if (!*a1)
    return 0;
  if (!strcmp(a1, "folder"))
    return 1;
  return strcmp(a1, "git") == 0;
}

id frameworkOverridingModulesDirectoryURL()
{
  if (frameworkOverridingModulesDirectoryURL_onceToken != -1)
    dispatch_once(&frameworkOverridingModulesDirectoryURL_onceToken, &__block_literal_global_155);
  return (id)frameworkOverridingModulesDirectoryURL_URL;
}

uint64_t fpfs_supports_long_paths()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_long_paths_once_token != -1)
    dispatch_once(&fpfs_supports_long_paths_once_token, &__block_literal_global_8);
  *__error() = v0;
  return fpfs_supports_long_paths_feature_enabled;
}

uint64_t fpfs_pkg_demote(int a1)
{
  uint64_t v2;
  char v4;

  v4 = 0;
  if ((fpfs_pkg_is_demoted(a1, &v4) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v4)
    return 0;
  v2 = 1;
  if (fsetxattr(a1, "com.apple.fileprovider.dir#N", "1", 1uLL, 0, 0) < 0)
  {
    if (*__error() == 13)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t fpfs_pathpkg_check(char *a1)
{
  int v1;
  uint64_t v2;
  char *v4;

  v4 = 0;
  v1 = *a1;
  if (v1 == 47)
  {
    v4 = a1;
  }
  else if (asprintf(&v4, "/%s", a1) < 0)
  {
    return 0xFFFFFFFFLL;
  }
  if (_cwd_fd_onceToken != -1)
    dispatch_once(&_cwd_fd_onceToken, &__block_literal_global_18);
  if (_cwd_fd_fd < 0)
    fpfs_pathpkg_check_cold_1();
  v2 = fcntl(_cwd_fd_fd, 52, v4);
  if (v1 != 47)
    free(v4);
  return v2;
}

uint64_t fpfs_fsgetpath(int32_t a1, uint64_t a2, char **a3, size_t *a4)
{
  size_t v7;
  char *v8;
  char *v9;
  ssize_t v10;
  ssize_t v11;
  uint64_t result;
  fsid_t v13;

  v13.val[0] = a1;
  v13.val[1] = 0;
  if (a4)
  {
    if (*a4)
      v7 = *a4;
    else
      v7 = 0x2000;
  }
  else
  {
    v7 = 0x2000;
  }
  v8 = (char *)malloc_type_malloc(v7, 0x5BF12871uLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = fsgetpath(v8, v7, &v13, a2);
  if (v10 < 0)
  {
    free(v9);
    return 0xFFFFFFFFLL;
  }
  v11 = v10;
  if (a3)
    *a3 = v9;
  result = 0;
  if (a4)
    *a4 = v11;
  return result;
}

id cachedFrameworkOverridingObjects()
{
  if (cachedFrameworkOverridingObjects_onceToken != -1)
    dispatch_once(&cachedFrameworkOverridingObjects_onceToken, &__block_literal_global_4);
  return (id)frameworkOverridingObjects;
}

uint64_t __readFrameworkOverridingModulesFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v4, "overridePriority");
  else
    v6 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v5, "overridePriority");
  else
    v7 = 0;
  if (v6 <= v7)
    v8 = 0;
  else
    v8 = -1;
  if (v6 < v7)
    v9 = 1;
  else
    v9 = v8;

  return v9;
}

void __frameworkOverridingModulesDirectoryURL_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles"), 1);
  v1 = (void *)frameworkOverridingModulesDirectoryURL_URL;
  frameworkOverridingModulesDirectoryURL_URL = v0;

}

uint64_t __fpfs_pkg_get_bundle_bit_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_get_bundle_bit(a2, *(BOOL **)(a1 + 32));
}

void __fp_shouldObfuscateFilenames_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  fp_shouldObfuscateFilenames_shouldObfuscate = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.fileprovider.log-sensitive-data")) ^ 1;

}

void __cachedFrameworkOverridingObjects_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFBundle *v16;
  __CFBundle *v17;
  NSObject *v18;
  NSString *v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *context;
  void *v38;
  void *v39;
  NSString *v40;
  const __CFAllocator *allocator;
  void *v42;
  void *v43;
  uint64_t v44;
  id obj;
  CFErrorRef error;
  uint8_t v47;
  char v48[15];
  uint8_t v49;
  char v50[15];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  NSObject *v56;
  __int16 v57;
  CFErrorRef v58;
  _BYTE v59[128];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A1B00664]();
  v0 = fp_default_log();
  frameworkOverridingModulesDirectoryURL();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0C999D0];
  v60[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v3;
  v36 = v2;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v2, v4, 7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v42 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(obj);
        v10 = *(NSObject **)(*((_QWORD *)&v51 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1B00664]();
        -[NSObject resourceValuesForKeys:error:](v10, "resourceValuesForKeys:error:", v4, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject pathExtension](v10, "pathExtension");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("bundle")))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v44);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "BOOLValue");

          if (v15)
          {
            v16 = CFBundleCreate(allocator, (CFURLRef)v10);
            if (!v16)
            {
              fp_current_or_default_log();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v10;
                _os_log_error_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Could not load module bundle at %@", buf, 0xCu);
              }
              goto LABEL_41;
            }
            v17 = v16;
            CFBundleGetIdentifier(v16);
            v18 = objc_claimAutoreleasedReturnValue();
            CFBundleGetInfoDictionary(v17);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKey:", CFSTR("FileProviderModuleClass"));
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (-[NSObject isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider.override"))&& (FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
            {
              fp_current_or_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                __cachedFrameworkOverridingObjects_block_invoke_cold_2(&v49, v50, v20);
LABEL_26:

              CFRelease(v17);
              goto LABEL_40;
            }
            if (-[NSObject isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.CloudDocsFileProvider"))&& FPIsCloudDocsWithFPFSEnabled())
            {
              fp_current_or_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                __cachedFrameworkOverridingObjects_block_invoke_cold_1(&v47, v48, v20);
              goto LABEL_26;
            }
            v40 = v19;
            if (v19)
            {
              error = 0;
              if (!CFBundleLoadExecutableAndReturnError(v17, &error))
              {
                fp_current_or_default_log();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v56 = v18;
                  v57 = 2112;
                  v58 = error;
                  _os_log_error_impl(&dword_1A0A34000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Could not load bundle %@. Error: %@", buf, 0x16u);
                }

                CFRelease(error);
                goto LABEL_34;
              }
              v21 = NSClassFromString(v19);
              if (v21)
              {
                v22 = objc_alloc_init(v21);
                if (v22)
                {
                  objc_msgSend(v38, "addObject:", v22);
                  fp_current_or_default_log();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v56 = v40;
                    v57 = 2112;
                    v58 = (CFErrorRef)v18;
                    _os_log_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_INFO, "[INFO] Loaded module %@ from bundle %@", buf, 0x16u);
                  }

                  objc_msgSend(v39, "addObject:", v17);
                }
                else
                {
                  fp_current_or_default_log();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v56 = v40;
                    v57 = 2112;
                    v58 = (CFErrorRef)v18;
                    _os_log_error_impl(&dword_1A0A34000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Could not instantiate module class %@ from extension module bundle %@", buf, 0x16u);
                  }

                }
                CFRelease(v17);

LABEL_39:
                v19 = v40;
LABEL_40:

LABEL_41:
                v4 = v42;
                goto LABEL_42;
              }
              fp_current_or_default_log();
              v24 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
LABEL_33:

LABEL_34:
                CFRelease(v17);
                goto LABEL_39;
              }
              *(_DWORD *)buf = 138412546;
              v56 = v19;
              v57 = 2112;
              v58 = (CFErrorRef)v18;
              v25 = v24;
              v26 = "[ERROR] Could not load class %@ from extension module bundle %@";
              v27 = 22;
            }
            else
            {
              fp_current_or_default_log();
              v24 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                goto LABEL_33;
              *(_DWORD *)buf = 138412290;
              v56 = v18;
              v25 = v24;
              v26 = "[ERROR] Bundle %@ does not have a FileProviderModuleClass entry.";
              v27 = 12;
            }
            _os_log_error_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
            goto LABEL_33;
          }
        }
LABEL_42:

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      v7 = v30;
    }
    while (v30);
  }

  objc_msgSend(v38, "sortUsingComparator:", &__block_literal_global_152);
  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v56) = v32;
    _os_log_impl(&dword_1A0A34000, v31, OS_LOG_TYPE_INFO, "[INFO] Loaded %d framework overrides modules.", buf, 8u);
  }

  v33 = (void *)frameworkOverridingObjects;
  frameworkOverridingObjects = (uint64_t)v38;

  v34 = (void *)cachedFrameworkOverridingObjects_frameworkOverridingBundles;
  cachedFrameworkOverridingObjects_frameworkOverridingBundles = (uint64_t)v39;

  objc_autoreleasePoolPop(context);
}

uint64_t __FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__(void *a1, const char *a2)
{
  return objc_msgSend(a1, "invokeWithTarget:", a2);
}

id __FPMakeAsyncCompletionBlock(id *a1, void *a2)
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;

  v4 = a1[2];
  v5 = a1;
  v6 = (void *)objc_msgSend(a2, "copy");
  _Block_signature(v6);
  v11 = v4;
  v12 = v6;
  v7 = v4;
  v8 = v6;
  v9 = (void *)__NSMakeSpecialForwardingCaptureBlock();

  return v9;
}

void sub_1A0A65880(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A660E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  __fp_pop_log(&a28);
  _Unwind_Resume(a1);
}

void sub_1A0A66AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  __fp_leave_section_Debug((uint64_t)&a38);
  _Unwind_Resume(a1);
}

void sub_1A0A66F70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0A672FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _FPProviderNotFoundErrorHelper(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a1;
  v6 = a2;
  if (a3 > 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), a3 - 2014, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setValue:forKey:", v5, *MEMORY[0x1E0CB2D50]);
  if (v7)
    objc_msgSend(v8, "setValue:forKey:", v7, *MEMORY[0x1E0CB3388]);
  if (v6)
    objc_msgSend(v8, "setValue:forKey:", v6, *MEMORY[0x1E0CB2938]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2001, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id FPProviderNotRegistered(unint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = a2;
  FPLoc(CFSTR("ProviderNotRegistered"), v4, v5, v6, v7, v8, v9, v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _FPProviderNotFoundErrorHelper(v11, v3, a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void FPMarkAsFileProviderBookmark()
{
  JUMPOUT(0x1A1AFFDB8);
}

id FPLocvImpl(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;

  v7 = a1;
  v8 = a2;
  FPLocalizationBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v7, CFSTR("X"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("X")))
  {
    if (a3
      && ((objc_msgSend(v7, "hasSuffix:", CFSTR("-C")) & 1) != 0
       || (objc_msgSend(v7, "hasSuffix:", CFSTR("-R")) & 1) != 0
       || (objc_msgSend(v7, "hasSuffix:", CFSTR(".f")) & 1) != 0
       || (objc_msgSend(v7, "hasSuffix:", CFSTR("(*)")) & 1) != 0
       || (objc_msgSend(v7, "containsString:", CFSTR("(")) & 1) != 0))
    {
      v11 = 0;
    }
    else
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        FPLocvImpl_cold_1((uint64_t)v7, (uint64_t)v8, v14);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KEY_MISSING(%@)"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithFormat:locale:arguments:", v10, v13, a4);

  }
  return v11;
}

id FPLocalizationBundle()
{
  if (FPLocalizationBundle_onceToken != -1)
    dispatch_once(&FPLocalizationBundle_onceToken, &__block_literal_global_31);
  return (id)FPLocalizationBundle_bundle;
}

id FPLoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  FPLocvImpl(a1, CFSTR("FileProvider"), 0, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id FPItemPropertyNamesByURLResourceKey()
{
  if (FPItemPropertyNamesByURLResourceKey_once != -1)
    dispatch_once(&FPItemPropertyNamesByURLResourceKey_once, &__block_literal_global_62);
  return (id)FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey;
}

uint64_t FPFeatureFlagHelenaIsEnabled()
{
  return _os_feature_enabled_impl();
}

id FPDictFromVendorItem(uint64_t a1, uint64_t a2)
{
  return +[FPItemToURLResourcesConverter dictionaryFromItem:requestedKeys:](FPItemToURLResourcesConverter, "dictionaryFromItem:requestedKeys:", a1, a2);
}

uint64_t FPCFCopyAttributeValuesForItem(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __FPCFCopyAttributeValuesForItem_block_invoke;
  v18[3] = &unk_1E444BF18;
  v18[4] = &v19;
  v18[5] = &v23;
  v7 = +[FPFrameworkOverridesIterator newIteratorForURL:withNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorForURL:withNotFoundHandler:", a1, v18);
  v8 = a1;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __FPCFCopyAttributeValuesForItem_block_invoke_2;
  v13[3] = &unk_1E444BF40;
  v16 = &v23;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v17 = &v19;
  objc_msgSend(v9, "FPValuesForAttributes:forItemAtURL:completionHandler:", a2, v10, v13);
  if (a3)
    *a3 = v24[3];
  v11 = v20[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

void sub_1A0A68368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A0A6894C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A68F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A6906C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A692E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1A0A69720(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A0A69DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0A6A384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0A6C438(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A6D2A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A6D664(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1A0A6D798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  void *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    objc_msgSend(v12, "errorFromException:whileSendingToSelector:", v13, objc_msgSend(v11, "selector"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (forwardInvocation__onceToken != -1)
      dispatch_once(&forwardInvocation__onceToken, &__block_literal_global_16_1);
    fpfs_adopt_log((void *)forwardInvocation__exceptionLog);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v14, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPExceptionToErrorProxy forwardInvocation:].cold.1(v17, &buf, v16);
    }

    v18 = fpfs_adopt_log(v15);
    objc_msgSend(v11, "methodSignature");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fp_indexOfLastArgumentWithType:", "@?");
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v12[2];
      if (!v21)
        objc_exception_throw(objc_retainAutorelease(v13));
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v14);
    }
    else
    {
      a10 = 0;
      objc_msgSend(v11, "getArgument:atIndex:", &a10, v20);
      v22 = (void *)MEMORY[0x1A1B00850](a10);
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", _Block_signature(v22));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fp_zeroOutReplyBlockArgumentsWithError:", v14);
      v25 = (void *)MEMORY[0x1A1B00850](v22);
      objc_msgSend(v24, "invokeWithTarget:", v25);

    }
    objc_end_catch();
    JUMPOUT(0x1A0A6D758);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A0A6DC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A0A6E070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id FPPathRelativeToVolumeRoot(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  __int128 v10;
  _BYTE v11[4];
  uint64_t v12;
  _DWORD v13[258];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  bzero(v11, 0x414uLL);
  objc_msgSend(v5, "path", 0x200000000000005, 0, 0x400000000);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = getattrlist((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v10, v11, 0x414uLL, 0x21u);

  if (v7 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v5, CFSTR("FPImportCookieEntry failed to get attributes"));
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    if (a2)
      *a2 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v13 + v13[0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void sub_1A0A6EE6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    FPNotSupportedError();
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    objc_end_catch();
    JUMPOUT(0x1A0A6EE1CLL);
  }
  _Unwind_Resume(exception_object);
}

id rewriteBeforeFirstSync(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v1 = a1;
  +[NSFileProviderItemVersion beforeFirstSyncComponent](NSFileProviderItemVersion, "beforeFirstSyncComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "length");
  if (v3 >= objc_msgSend(v2, "length"))
  {
    objc_msgSend(v1, "subdataWithRange:", 0, objc_msgSend(v2, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v2))
      v6 = v2;
    else
      v6 = v1;
    v4 = v6;

  }
  else
  {
    v4 = v1;
  }

  return v4;
}

void sub_1A0A70E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void __FILEPROVIDER_BAD_EXTENSION__(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Domain %@ is replicated but the extension class %@ for the provider %@ doesn't implement NSFileProviderReplicatedExtension.  Break on %s to debug this."), v5, a3, v6, "__FILEPROVIDER_BAD_EXTENSION__");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_fault_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("__FILEPROVIDER_BAD_EXTENSION__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 145, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
}

void __FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to build an NSFileProviderExtension based extension for domain %@, but extension principal class %@ for the provider %@ does not implement NSFileProviderExtension. If you meant to use NSFileProviderReplicatedExtension, use the initializer  -[NSFileProviderDomain initWithIdentifier:displayName:] rather than -[NSFileProviderDomain initWithIdentifier:displayName:pathRelativeToDocumentStorage:]. Break on %s to debug this."), v5, a3, v6, "__FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_fault_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("__FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 150, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
}

void sub_1A0A7148C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A71A34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A71B70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A71BD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A71E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A721A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A722CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A0A725EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A727C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A72A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A72CF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A72E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A730E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  __fp_pop_log(&a9);
  _Unwind_Resume(a1);
}

void sub_1A0A73308(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A73494(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A739CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  __fp_pop_log(&a28);
  _Unwind_Resume(a1);
}

void sub_1A0A73B2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A73C84(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0A73FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A740B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A744AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A745F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7475C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A74964(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A74B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A74D84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A74EE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A751F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  __fp_pop_log(&a30);
  _Unwind_Resume(a1);
}

void sub_1A0A757E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A0A75C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void __FILEPROVIDER_BAD_EXTENT__(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = 138413058;
    v8 = v5;
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = a3;
    v13 = 2080;
    v14 = "__FILEPROVIDER_BAD_EXTENT__";
    _os_log_fault_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_FAULT, "[CRIT] Illegal partial contents returned for %@ (%lu, %lu). Must return a properly aligned extent covering at least the requested range.  Break on %s to debug this.", (uint8_t *)&v7, 0x2Au);
  }

}

void sub_1A0A76734(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 208));
  _Unwind_Resume(a1);
}

void sub_1A0A76A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A770C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A773DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A778A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A77AB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A77DCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A77F10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A78718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A78C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A78D6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A79004(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A79548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A79704(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A79B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A79CEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7A610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7AB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  __fp_pop_log(&a40);
  _Unwind_Resume(a1);
}

void sub_1A0A7AC24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A7ADA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  __fp_pop_log(&a9);
  _Unwind_Resume(a1);
}

void sub_1A0A7B094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7B22C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7B5C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7B8D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7BDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7C138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7C878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7CA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7D09C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7D3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7D78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7D924(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7DD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7E368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7E738(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7EB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v17;
  va_list va;
  va_list va1;

  va_start(va1, a16);
  va_start(va, a16);
  v17 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A7ED48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7EF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7F39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7F734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7F904(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A7FFF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 184));
  _Unwind_Resume(a1);
}

void sub_1A0A80488(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8118C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
  __fp_pop_log(&a58);
  _Unwind_Resume(a1);
}

void sub_1A0A8190C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A820D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void CheckAndWarn(void *a1, const char *a2)
{
  id v3;
  NSObject *v4;

  v3 = a1;
  if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      CheckAndWarn_cold_1((uint64_t)v3, a2, v4);

  }
}

void sub_1A0A82244(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A822AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A8264C(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0A82F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A831A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A83390(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A836E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v10;
  va_list va;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  __fp_pop_log((void **)va1);
  _Unwind_Resume(a1);
}

id logStringForObjects(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (v2 > 0xA)
  {
    objc_msgSend(v1, "subarrayWithRange:", 0, 10);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@..."), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void sub_1A0A83CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  __fp_pop_log(&a40);
  _Unwind_Resume(a1);
}

void sub_1A0A83EF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A844E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A84BD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 224));
  _Unwind_Resume(a1);
}

void sub_1A0A84F4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0A851E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A85420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A858BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A86050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  __fp_pop_log(&a30);
  _Unwind_Resume(a1);
}

void sub_1A0A8624C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A87A04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A87B38(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A0A87CA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A88334(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A88A0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0A88DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A88F78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A890F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A0A894B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8967C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A897C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A899FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A89E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A89F84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8A0B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A0A8A2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8A3B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8A514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8A79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8AA50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8AC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8ADFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8AF48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v10;
  va_list va;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  __fp_pop_log((void **)va1);
  _Unwind_Resume(a1);
}

void sub_1A0A8B5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8B764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  __fp_pop_log(&a9);
  _Unwind_Resume(a1);
}

void sub_1A0A8B90C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8BC10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8BD20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8BF34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C038(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C24C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C350(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C564(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C668(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8C878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8D09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8D2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8D514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8D7AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8DB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8DC58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8DE50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8E2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0A8E478(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a3 = a1;
  *(_QWORD *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 2080;
}

void OUTLINED_FUNCTION_2(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2080;
  return result;
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int16 v3;

  *(_QWORD *)(a2 + 24) = v2;
  *(_WORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2080;
  return result;
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
}

void OUTLINED_FUNCTION_24(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  uint64_t v3;

  *(_QWORD *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_32(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  uint64_t v3;

  *(_QWORD *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 32) = 1024;
  *(_DWORD *)(a2 + 34) = 0;
  *(_WORD *)(a2 + 38) = v2;
  *(_QWORD *)(a2 + 40) = 0;
}

void OUTLINED_FUNCTION_33(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_34(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_35(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x34u);
}

void OUTLINED_FUNCTION_36(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x30u);
}

void OUTLINED_FUNCTION_37(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_41(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void __FILEPROVIDER_BAD_ITEM__(void *a1, void *a2, void *a3, void *a4, uint64_t a5, int a6, int a7)
{
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  if (!objc_msgSend(v13, "length"))
    __FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__(v16, v13, v14, a7);
  if (!objc_msgSend(v14, "length"))
    __FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__(v16, v13, v14, a7);
  if (objc_msgSend(v15, "length"))
  {
    if (a5)
      goto LABEL_7;
LABEL_11:
    __FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__(v16, v13, v14, a7);
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  __FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__(v16, v13, v14, a7);
  if (!a5)
    goto LABEL_11;
LABEL_7:
  if (a6)
LABEL_8:
    __FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__(v16, v13, v14, a7);
LABEL_9:

}

void __FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider %@ returned invalid item %@ of class %@ with identifier %@, missing provider. Break on %s to debug this."), v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_fault_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 363, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    v15 = v8;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v9;
    v22 = 2082;
    v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__";
    v11 = v19;
    _os_log_fault_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing provider. Break on %{public}s to debug this.", buf, 0x34u);

  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider %@ returned invalid item %@ of class %@ with identifier %@, missing identifier. Break on %s to debug this."), v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_fault_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 375, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    v15 = v8;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v9;
    v22 = 2082;
    v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__";
    v11 = v19;
    _os_log_fault_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing identifier. Break on %{public}s to debug this.", buf, 0x34u);

  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider %@ returned invalid item %@ of class %@ with identifier %@, missing filename. Break on %s to debug this."), v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_fault_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 387, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    v15 = v8;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v9;
    v22 = 2082;
    v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__";
    v11 = v19;
    _os_log_fault_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing filename. Break on %{public}s to debug this.", buf, 0x34u);

  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider %@ returned invalid item %@ of class %@ with identifier %@, missing contentType. Break on %s to debug this."), v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_fault_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 399, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    v15 = v8;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v9;
    v22 = 2082;
    v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__";
    v11 = v19;
    _os_log_fault_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing contentType. Break on %{public}s to debug this.", buf, 0x34u);

  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider %@ returned invalid item %@ of class %@ with identifier %@, missing itemVersion. Break on %s to debug this."), v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_fault_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 411, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    v15 = v8;
    v16 = 2112;
    v17 = v7;
    v18 = 2114;
    v19 = (id)objc_opt_class();
    v20 = 2114;
    v21 = v9;
    v22 = 2082;
    v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__";
    v11 = v19;
    _os_log_fault_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing itemVersion. Break on %{public}s to debug this.", buf, 0x34u);

  }
}

void __FILEPROVIDER_BAD_CONTENT_POLICY__(unint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1 >= 4 && a1 - 500 >= 3)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provider returned invalid content policy %ld"), a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v7 = (unint64_t)v4;
        _os_log_fault_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
      }

      __assert_rtn("__FILEPROVIDER_BAD_CONTENT_POLICY__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 456, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    }
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = a1;
      _os_log_fault_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_FAULT, "[CRIT] Provider returned invalid content policy %ld", buf, 0xCu);
    }

  }
}

#error "1A0A946EC: call analysis failed (funcsize=3037)"

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t fpfs_acl_is_set(_acl *a1, acl_perm_t a2)
{
  int entry;
  uint64_t result;
  BOOL v6;
  void *qualifier;
  void *v8;
  char *v9;
  char *v10;
  const char *v11;
  int v12;
  acl_permset_t permset_p;
  acl_tag_t tag_type_p;
  acl_entry_t entry_p;
  void *v16;
  int v17;

  entry_p = 0;
  entry = acl_get_entry(a1, 0, &entry_p);
  result = 0;
  if (!entry)
  {
    while (1)
    {
      tag_type_p = ACL_UNDEFINED_TAG;
      if (acl_get_tag_type(entry_p, &tag_type_p))
        v6 = 0;
      else
        v6 = tag_type_p == ACL_EXTENDED_DENY;
      if (!v6)
        goto LABEL_19;
      permset_p = 0;
      if (acl_get_permset(entry_p, &permset_p))
        goto LABEL_19;
      qualifier = acl_get_qualifier(entry_p);
      if (!qualifier)
        goto LABEL_19;
      v8 = qualifier;
      v16 = 0;
      v9 = (char *)malloc_type_malloc(0x105uLL, 0x3D1D51D0uLL);
      if (!v9)
        goto LABEL_12;
      v10 = v9;
      v17 = 0;
      if (mbr_identifier_translate())
        break;
      if (v17 == 1)
        v11 = "user";
      else
        v11 = "group";
      snprintf(v10, 0x105uLL, "%s:%s", v11, (const char *)v16);
      free(v16);
      acl_free(v8);
      if (!strcmp(v10, "group:everyone") && acl_get_perm_np(permset_p, a2))
      {
        free(v10);
        return 1;
      }
      free(v10);
LABEL_19:
      if (entry_p)
        v12 = -1;
      else
        v12 = 0;
      if (acl_get_entry(a1, v12, &entry_p))
        return 0;
    }
    free(v10);
LABEL_12:
    acl_free(v8);
    goto LABEL_19;
  }
  return result;
}

uint64_t fpfs_fset_acl(uint64_t a1, acl_perm_t a2)
{
  _acl *fd;
  _acl *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t permset;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  char *v16;
  char *v17;
  gid_t v18;
  int v19;
  acl_permset_t permset_d;
  acl_entry_t entry_p;
  acl_t acl_p;
  group *v24;
  __int128 tag_qualifier_p;
  group v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  permset_d = 0;
  entry_p = 0;
  fd = acl_get_fd(a1);
  if (!fd)
  {
    if (*__error() != 2)
      return 0xFFFFFFFFLL;
    acl_p = acl_init(1);
    if (!acl_p)
      return 0xFFFFFFFFLL;
LABEL_8:
    tag_qualifier_p = 0uLL;
    os_unfair_lock_lock(&resolve_everyone_grpuuid_lock);
    if (resolve_everyone_grpuuid__cached != 1)
    {
      os_unfair_lock_unlock(&resolve_everyone_grpuuid_lock);
      v24 = 0;
      v14 = sysconf(71);
      if ((v14 & 0x8000000000000000) != 0)
        goto LABEL_26;
      v15 = v14;
      v16 = (char *)malloc_type_malloc(v14, 0x940A73FBuLL);
      if (!v16)
        goto LABEL_26;
      memset(&v26, 0, sizeof(v26));
      while (1)
      {
        v17 = v16;
        if (!getgrnam_r("everyone", &v26, v16, v15, &v24))
          break;
        if (*__error() == 34)
        {
          v15 *= 16;
          v16 = (char *)malloc_type_realloc(v17, v15, 0x4E423210uLL);
          if (v16)
            continue;
        }
        free(v17);
        goto LABEL_26;
      }
      v18 = v24 ? v24->gr_gid : 0;
      free(v17);
      v26.gr_name = 0;
      v26.gr_passwd = 0;
      if (mbr_gid_to_uuid(v18, (unsigned __int8 *)&v26) < 0)
      {
LABEL_26:
        v6 = 0;
LABEL_47:
        v19 = *__error();
        acl_free(acl_p);
        *__error() = v19;
        return v6;
      }
      os_unfair_lock_lock(&resolve_everyone_grpuuid_lock);
      if ((resolve_everyone_grpuuid__cached & 1) == 0)
      {
        resolve_everyone_grpuuid_everyoneUUID = *(_OWORD *)&v26.gr_name;
        resolve_everyone_grpuuid__cached = 1;
      }
    }
    tag_qualifier_p = resolve_everyone_grpuuid_everyoneUUID;
    os_unfair_lock_unlock(&resolve_everyone_grpuuid_lock);
    v7 = acl_create_entry(&acl_p, &entry_p);
    if ((v7 & 0x80000000) != 0)
    {
      v6 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        fpfs_fset_acl_cold_1();
    }
    else
    {
      v8 = acl_set_tag_type(entry_p, ACL_EXTENDED_DENY);
      if ((v8 & 0x80000000) != 0)
      {
        v6 = v8;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          fpfs_fset_acl_cold_2();
      }
      else
      {
        permset = acl_get_permset(entry_p, &permset_d);
        if ((permset & 0x80000000) != 0)
        {
          v6 = permset;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            fpfs_fset_acl_cold_3();
        }
        else
        {
          v10 = acl_clear_perms(permset_d);
          if ((v10 & 0x80000000) != 0)
          {
            v6 = v10;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              fpfs_fset_acl_cold_4();
          }
          else
          {
            v11 = acl_add_perm(permset_d, a2);
            if ((v11 & 0x80000000) != 0)
            {
              v6 = v11;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                fpfs_fset_acl_cold_5();
            }
            else
            {
              v12 = acl_set_qualifier(entry_p, &tag_qualifier_p);
              if ((v12 & 0x80000000) != 0)
              {
                v6 = v12;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  fpfs_fset_acl_cold_6();
              }
              else
              {
                v13 = acl_set_permset(entry_p, permset_d);
                if ((v13 & 0x80000000) != 0)
                {
                  v6 = v13;
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    fpfs_fset_acl_cold_7();
                }
                else
                {
                  v6 = MEMORY[0x1A1AFFF38](a1, acl_p);
                  if ((v6 & 0x80000000) != 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    fpfs_fset_acl_cold_8();
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_47;
  }
  v5 = fd;
  if (!fpfs_acl_is_set(fd, a2))
  {
    acl_p = v5;
    goto LABEL_8;
  }
  acl_free(v5);
  return 0;
}

uint64_t fpfs_clear_file_acl(const char *a1)
{
  _acl *v2;
  _acl *v3;
  uint64_t v4;
  int v5;

  v2 = acl_init(0);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = acl_set_link_np(a1, ACL_TYPE_ACCESS, v2);
  if ((v4 & 0x80000000) != 0 && *__error() == 45)
  {
    v4 = 0;
    *__error() = 0;
  }
  v5 = *__error();
  acl_free(v3);
  *__error() = v5;
  return v4;
}

uint64_t fpfs_clear_acl(uint64_t a1)
{
  acl_t v2;
  acl_t v3;
  uint64_t v4;
  int v5;

  v2 = acl_init(0);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = MEMORY[0x1A1AFFF38](a1, v2);
  v5 = *__error();
  acl_free(v3);
  *__error() = v5;
  return v4;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

int *OUTLINED_FUNCTION_1_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
  return __error();
}

char *OUTLINED_FUNCTION_3_1(int *a1)
{
  return strerror(*a1);
}

void sub_1A0A96A40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A0A973EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A97F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;

  objc_destroyWeak(v27);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(&location);
  __fp_leave_section_Debug((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void sub_1A0A98204(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

xattr_flags_t fpfs_xattr_is_content_dependent(char *a1)
{
  return (fpfs_xattr_flags_from_name(a1) >> 1) & 1;
}

uint64_t fpfs_fsetxattr(int a1, char *__s1, const void *a3, size_t a4, u_int32_t a5, int a6)
{
  uint64_t result;

  result = strcmp(__s1, "com.apple.fpfs.fileid");
  if ((_DWORD)result)
    return fsetxattr(a1, __s1, a3, a4, a5, a6);
  return result;
}

uint64_t fpfs_set_tag_data(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v7;
  char v8;
  uint64_t result;

  if (a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    if ((fpfs_fsetxattr(a1, "com.apple.metadata:_kMDItemUserTags", *(const void **)a2, v7, 0, 0) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
  }
  else
  {
    if (fremovexattr(a1, "com.apple.metadata:_kMDItemUserTags", 0) < 0 && *__error() != 93)
      return 0xFFFFFFFFLL;
    if (!a2)
    {
      v8 = 0;
      goto LABEL_11;
    }
  }
  v8 = *(_BYTE *)(a2 + 16);
LABEL_11:
  result = 0;
  *(_BYTE *)(a3 + 1) = 1;
  *(_BYTE *)(a4 + 1) = v8;
  return result;
}

uint64_t fpfs_serialize_last_use_date(uint64_t *a1, UInt8 *a2, unint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  if (a4 && (_validate_last_used_time(a1) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v7 = *a1;
  v8 = a1[1];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v9 = getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr;
  v16 = getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr)
  {
    v10 = (void *)MetadataUtilitiesLibrary();
    v9 = dlsym(v10, "MDPropertyCopyEncodedDataForLastUsedDateWithTimeSpec");
    v14[3] = (uint64_t)v9;
    getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v13, 8);
  if (!v9)
    fpfs_serialize_last_use_date_cold_1();
  v11 = (const __CFData *)((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v8);
  if (consume_data_into_buffer(v11, a2, a3) == 16)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

void sub_1A0A98594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _validate_last_used_time(uint64_t *a1)
{
  timeval v3;

  if (*a1 < 1000000000)
  {
LABEL_5:
    *__error() = 33;
    return 0xFFFFFFFFLL;
  }
  v3.tv_sec = 0;
  *(_QWORD *)&v3.tv_usec = 0;
  if ((gettimeofday(&v3, 0) & 0x80000000) == 0)
  {
    if (*a1 <= v3.tv_sec + 86400 && a1[1] <= 999999999)
      return 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t consume_data_into_buffer(const __CFData *a1, UInt8 *a2, unint64_t a3)
{
  unint64_t Length;
  uint64_t v7;
  CFRange v9;

  if (!a1)
    return 0xFFFFFFFFLL;
  Length = CFDataGetLength(a1);
  if (Length <= a3)
  {
    v7 = Length;
    v9.location = 0;
    v9.length = Length;
    CFDataGetBytes(a1, v9, a2);
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }
  CFRelease(a1);
  return v7;
}

uint64_t fpfs_set_last_use_date(int a1, uint64_t *a2, int a3)
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  if ((fpfs_serialize_last_use_date(a2, (UInt8 *)v5, 0x10uLL, a3) & 0x80000000) == 0)
    return fpfs_fsetxattr(a1, "com.apple.lastuseddate#PS", v5, 0x10uLL, 0, 0);
  if (fremovexattr(a1, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t fpfs_serialize_favorite_rank(uint64_t a1, UInt8 *a2, unint64_t a3)
{
  void *v6;
  void *v7;
  const __CFData *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr;
  v13 = getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr)
  {
    v7 = (void *)MetadataUtilitiesLibrary();
    v6 = dlsym(v7, "MDPropertyCopyEncodedDataForFavoriteRank");
    v11[3] = (uint64_t)v6;
    getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
    fpfs_serialize_favorite_rank_cold_1();
  v8 = (const __CFData *)((uint64_t (*)(uint64_t, _QWORD))v6)(a1, 0);
  if (v8)
    return consume_data_into_buffer(v8, a2, a3);
  else
    return 0xFFFFFFFFLL;
}

void sub_1A0A98824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_deserialize_favorite_rank(_QWORD *a1, const UInt8 *a2, CFIndex a3)
{
  CFDataRef v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  if (a3)
  {
    v4 = CFDataCreate(0, a2, a3);
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v5 = getMDPropertyDecodedFavoritRankSymbolLoc_ptr;
    v12 = getMDPropertyDecodedFavoritRankSymbolLoc_ptr;
    if (!getMDPropertyDecodedFavoritRankSymbolLoc_ptr)
    {
      v6 = (void *)MetadataUtilitiesLibrary();
      v5 = dlsym(v6, "MDPropertyDecodedFavoritRank");
      v10[3] = (uint64_t)v5;
      getMDPropertyDecodedFavoritRankSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v9, 8);
    if (!v5)
      fpfs_deserialize_favorite_rank_cold_1();
    v7 = ((uint64_t (*)(CFDataRef, _QWORD *))v5)(v4, a1);
    CFRelease(v4);
    if (v7)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    *a1 = 0;
  }
  return result;
}

void sub_1A0A98900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_set_favorite_rank(int a1, uint64_t a2)
{
  int v3;
  _OWORD v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  v3 = fpfs_serialize_favorite_rank(a2, (UInt8 *)v5, 0x80uLL);
  fremovexattr(a1, "com.apple.favorite-rank.number#PS", 0);
  if (v3 > 0)
    return fpfs_fsetxattr(a1, "com.apple.metadata:kMDItemFavoriteRank", v5, v3, 0, 0);
  if (fremovexattr(a1, "com.apple.metadata:kMDItemFavoriteRank", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t fpfs_set_is_ignore_root(int fd, char *__s)
{
  size_t v4;

  if (__s)
  {
    v4 = strlen(__s);
    return fpfs_fsetxattr(fd, "com.apple.fileprovider.ignore#P", __s, v4, 0, 0);
  }
  else if (fremovexattr(fd, "com.apple.fileprovider.ignore#P", 0) < 0 && *__error() != 93)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t fpfs_set_is_pinned(int a1, int a2)
{
  if (a2)
    return fpfs_fsetxattr(a1, "com.apple.fileprovider.pinned#PX", "1", 1uLL, 0, 0);
  if (fremovexattr(a1, "com.apple.fileprovider.pinned#PX", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t fpfs_remove_before_bounce_filename(int a1)
{
  if (fremovexattr(a1, "com.apple.fileprovider.before-bounce#P", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_set_before_bounce_filename_on_path(char *a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __fpfs_set_before_bounce_filename_on_path_block_invoke;
  v3[3] = &__block_descriptor_40_e8_i12__0i8l;
  v3[4] = a2;
  return fpfs_open(a1, 0x200000u, 0, 2, (uint64_t)v3);
}

uint64_t __fpfs_set_before_bounce_filename_on_path_block_invoke(uint64_t a1, int a2)
{
  return fpfs_set_before_bounce_filename(a2, *(char **)(a1 + 32));
}

uint64_t fpfs_set_before_bounce_filename(int a1, char *__s)
{
  size_t v4;
  NSObject *v6;

  if (!__s)
    return fpfs_remove_before_bounce_filename(a1);
  if (*__s)
  {
    v4 = strlen(__s) + 1;
    return fpfs_fsetxattr(a1, "com.apple.fileprovider.before-bounce#P", __s, v4, 0, 0);
  }
  else
  {
    fpfs_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      fpfs_set_before_bounce_filename_cold_1(v6);

    return fpfs_remove_before_bounce_filename(a1);
  }
}

uint64_t fpfs_set_resurrected(int a1)
{
  return fpfs_fsetxattr(a1, "com.apple.fileprovider.is_resurrected#PN", "", 0, 0, 0);
}

uint64_t fpfs_remove_resurrected(int a1)
{
  return (fremovexattr(a1, "com.apple.fileprovider.is_resurrected#PN", 0) >> 31);
}

uint64_t fpfs_set_syncable_xattrs()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  id v4;
  unsigned int (**v5)(id, char *);
  unint64_t v6;
  char *v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  char namebuff[32768];
  uint64_t v13;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = v0;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (unsigned int (**)(id, char *))v4;
  bzero(namebuff, 0x8000uLL);
  v6 = flistxattr(v3, namebuff, 0x8000uLL, 0);
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_4;
  if (v6 > 0x8000)
  {
    *__error() = 12;
LABEL_4:
    v2 = 0xFFFFFFFFLL;
    goto LABEL_5;
  }
  if (v6)
  {
    v8 = &namebuff[v6];
    v9 = namebuff;
    do
    {
      v10 = strlen(v9);
      if (v5[2](v5, v9))
      {
        if (v2)
        {
          v11 = v2;
          while (strcmp(v9, *(const char **)(v11 + 8)))
          {
            v11 = *(_QWORD *)v11;
            if (!v11)
              goto LABEL_13;
          }
        }
        else
        {
LABEL_13:
          if (fremovexattr(v3, v9, 0) < 0)
            goto LABEL_4;
        }
      }
      v9 += v10 + 1;
    }
    while (v9 < v8);
  }
  if (v2)
  {
    while ((fpfs_fsetxattr(v3, *(char **)(v2 + 8), (const void *)(v2 + 24), *(_QWORD *)(v2 + 16), 0, 0) & 0x80000000) == 0)
    {
      v2 = *(_QWORD *)v2;
      if (!v2)
        goto LABEL_5;
    }
    goto LABEL_4;
  }
LABEL_5:

  return v2;
}

uint64_t fpfs_transfer_xattrs()
{
  int v0;
  int v1;
  int v2;
  int v3;
  id v4;
  uint64_t (**v5)(id, char *);
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  size_t v10;
  ssize_t v11;
  _BYTE value[32768];
  char v14[32768];
  uint64_t v15;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = v0;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(id, char *))v4;
  bzero(v14, 0x8000uLL);
  v6 = flistxattr(v3, v14, 0x8000uLL, 0);
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_4;
  if (v6 > 0x8000)
  {
    *__error() = 12;
LABEL_4:
    v7 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  if (v6)
  {
    v8 = &v14[v6];
    v9 = v14;
    do
    {
      v10 = strlen(v9);
      bzero(value, 0x8000uLL);
      if ((fpfs_xattr_flags_from_name(v9) & 2) == 0 && (v5[2](v5, v9) & 1) == 0)
      {
        v11 = fgetxattr(v3, v9, value, 0x8000uLL, 0, 0);
        if (v11 < 0)
        {
          if (*__error() != 34)
            goto LABEL_4;
        }
        else if ((fpfs_fsetxattr(v2, v9, value, v11, 0, 2) & 0x80000000) != 0 && *__error() != 17)
        {
          goto LABEL_4;
        }
      }
      v9 += v10 + 1;
    }
    while (v9 < v8);
  }
  v7 = 0;
LABEL_16:

  return v7;
}

unint64_t fpfs_copy_xattrs()
{
  uint64_t v0;
  const char *v1;
  const char *v2;
  const char *v3;
  unint64_t result;
  char *v5;
  const char *v6;
  size_t v7;
  unint64_t v8;
  _BYTE value[32768];
  char v10[32768];
  uint64_t v11;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (const char *)v0;
  v11 = *MEMORY[0x1E0C80C00];
  bzero(v10, 0x8000uLL);
  result = listxattr(v3, v10, 0x8000uLL, 0);
  if ((result & 0x8000000000000000) != 0)
    return 0xFFFFFFFFLL;
  if (result > 0x8000)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  if (result)
  {
    v5 = &v10[result];
    v6 = v10;
    while (1)
    {
      v7 = strlen(v6);
      bzero(value, 0x8000uLL);
      if (xattr_preserve_for_intent(v6, 1u) == 1)
      {
        v8 = getxattr(v3, v6, value, 0x8000uLL, 0, 0);
        if (v8 <= 0x8000 && setxattr(v2, v6, value, v8, 0, 2) < 0)
          break;
      }
      v6 += v7 + 1;
      if (v6 >= v5)
        return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t fpfs_delete_xattrs()
{
  int v0;
  unint64_t result;
  char *v2;
  char *v3;
  size_t v4;
  char namebuff[32768];
  uint64_t v6;

  v0 = MEMORY[0x1E0C80A78]();
  v6 = *MEMORY[0x1E0C80C00];
  bzero(namebuff, 0x8000uLL);
  result = flistxattr(v0, namebuff, 0x8000uLL, 0);
  if ((result & 0x8000000000000000) != 0)
    return 0xFFFFFFFFLL;
  if (result > 0x8000)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  if (result)
  {
    v2 = &namebuff[result];
    v3 = namebuff;
    while (1)
    {
      v4 = strlen(v3);
      if (strcmp(v3, "com.apple.ResourceFork"))
      {
        if (fremovexattr(v0, v3, 0) < 0)
          break;
      }
      v3 += v4 + 1;
      if (v3 >= v2)
        return 0;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_set_bplist_xattr(const char *a1, const char *a2, char *cStr, int a4)
{
  const __CFAllocator *v7;
  CFStringRef v8;
  CFStringRef v9;
  const __CFData *v10;
  const __CFData *v11;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v14;
  NSObject *v15;
  CFErrorRef error;

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x600u);
  if (!v8)
  {
    fpfs_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      fpfs_set_bplist_xattr_cold_1(v15);
    goto LABEL_8;
  }
  v9 = v8;
  error = 0;
  v10 = CFPropertyListCreateData(v7, v8, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  if (!v10)
  {
    CFRelease(v9);
    fpfs_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      fpfs_set_bplist_xattr_cold_2((uint64_t *)&error, v15);
LABEL_8:

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  v11 = v10;
  BytePtr = CFDataGetBytePtr(v10);
  Length = CFDataGetLength(v11);
  v14 = setxattr(a1, a2, BytePtr, Length, 0, a4);
  CFRelease(v11);
  CFRelease(v9);
  return v14;
}

BOOL fpfs_path_has_provider_domain_xattr(const char *a1)
{
  return fpfs_path_return_assigned_provider_domain_xattr(a1, 0, 0, 0) != 0;
}

uint64_t fpfs_fset_collaboration_identifier(int fd, const char *a2)
{
  CFStringRef v3;
  CFStringRef v4;
  id MDItemCollaborationIdentifier;
  const __CFData *v6;
  const __CFData *v7;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v10;

  if (a2)
  {
    v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u);
    if (v3)
    {
      v4 = v3;
      MDItemCollaborationIdentifier = getMDItemCollaborationIdentifier();
      v6 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemCollaborationIdentifier, (uint64_t)v4);
      if (v6)
      {
        v7 = v6;
        BytePtr = CFDataGetBytePtr(v6);
        Length = CFDataGetLength(v7);
        v10 = fpfs_fsetxattr(fd, "com.apple.metadata:kMDItemCollaborationIdentifier", BytePtr, Length, 0, 0);
        CFRelease(v7);
        CFRelease(v4);
        return v10;
      }
      CFRelease(v4);
    }
  }
  else if ((fremovexattr(fd, "com.apple.metadata:kMDItemCollaborationIdentifier", 0) & 0x80000000) == 0
         || *__error() == 93)
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _MDPropertyCopyEncodedData(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getMDPropertyCopyEncodedDataSymbolLoc_ptr;
  v10 = getMDPropertyCopyEncodedDataSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataSymbolLoc_ptr)
  {
    v5 = (void *)MetadataUtilitiesLibrary();
    v4 = dlsym(v5, "MDPropertyCopyEncodedData");
    v8[3] = (uint64_t)v4;
    getMDPropertyCopyEncodedDataSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    _MDPropertyCopyEncodedData_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void sub_1A0A994E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemCollaborationIdentifier()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemCollaborationIdentifierSymbolLoc_ptr;
  v6 = getMDItemCollaborationIdentifierSymbolLoc_ptr;
  if (!getMDItemCollaborationIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = (id *)dlsym(v1, "MDItemCollaborationIdentifier");
    v4[3] = (uint64_t)v0;
    getMDItemCollaborationIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemCollaborationIdentifier_cold_1();
  return *v0;
}

void sub_1A0A99580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_is_shared(int fd, char a2)
{
  id MDItemIsShared;
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v9;

  if (fpfs_fset_is_shared_onceToken == -1)
  {
    if ((a2 & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&fpfs_fset_is_shared_onceToken, &__block_literal_global_5);
    if ((a2 & 1) != 0)
    {
LABEL_3:
      MDItemIsShared = getMDItemIsShared();
      v5 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemIsShared, *MEMORY[0x1E0C9AE50]);
      if (v5)
      {
        v6 = v5;
        BytePtr = CFDataGetBytePtr(v5);
        Length = CFDataGetLength(v6);
        v9 = fpfs_fsetxattr(fd, (char *)fpfs_fset_is_shared_xattrNameBuffer, BytePtr, Length, 0, 0);
        CFRelease(v6);
        return v9;
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_is_shared_xattrNameBuffer, 0) & 0x80000000) == 0 || *__error() == 93)
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_is_shared_block_invoke()
{
  id MDItemIsShared;
  uint64_t result;
  const __CFString *v2;
  CFIndex v3;

  MDItemIsShared = getMDItemIsShared();
  result = _MDPropertyCopyXAttrName((uint64_t)MDItemIsShared);
  if (result)
  {
    v2 = (const __CFString *)result;
    result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      v3 = result;
      fpfs_fset_is_shared_xattrNameBuffer = (uint64_t)malloc_type_calloc(1uLL, result + 1, 0xBF6CC646uLL);
      return CFStringGetFileSystemRepresentation(v2, (char *)fpfs_fset_is_shared_xattrNameBuffer, v3);
    }
  }
  return result;
}

uint64_t _MDPropertyCopyXAttrName(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getMDPropertyCopyXAttrNameSymbolLoc_ptr;
  v8 = getMDPropertyCopyXAttrNameSymbolLoc_ptr;
  if (!getMDPropertyCopyXAttrNameSymbolLoc_ptr)
  {
    v3 = (void *)MetadataUtilitiesLibrary();
    v2 = dlsym(v3, "MDPropertyCopyXAttrName");
    v6[3] = (uint64_t)v2;
    getMDPropertyCopyXAttrNameSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    _MDPropertyCopyXAttrName_cold_1();
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void sub_1A0A9977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getMDItemIsShared()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemIsSharedSymbolLoc_ptr;
  v6 = getMDItemIsSharedSymbolLoc_ptr;
  if (!getMDItemIsSharedSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = (id *)dlsym(v1, "MDItemIsShared");
    v4[3] = (uint64_t)v0;
    getMDItemIsSharedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemIsShared_cold_1();
  return *v0;
}

void sub_1A0A99814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_is_shared_by_current_user(int fd, _BYTE *a2)
{
  const __CFString *v4;
  id MDItemSharedItemCurrentUserRole;
  const __CFData *v6;
  const __CFData *v7;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v10;

  if (fpfs_fset_is_shared_by_current_user_onceToken == -1)
  {
    if (a2)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&fpfs_fset_is_shared_by_current_user_onceToken, &__block_literal_global_17);
    if (a2)
    {
LABEL_3:
      if (*a2)
        v4 = CFSTR("NSURLUbiquitousSharedItemRoleOwner");
      else
        v4 = CFSTR("NSURLUbiquitousSharedItemRoleParticipant");
      MDItemSharedItemCurrentUserRole = getMDItemSharedItemCurrentUserRole();
      v6 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemSharedItemCurrentUserRole, (uint64_t)v4);
      if (v6)
      {
        v7 = v6;
        BytePtr = CFDataGetBytePtr(v6);
        Length = CFDataGetLength(v7);
        v10 = fpfs_fsetxattr(fd, (char *)fpfs_fset_is_shared_by_current_user_xattrNameBuffer, BytePtr, Length, 0, 0);
        CFRelease(v7);
        return v10;
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_is_shared_by_current_user_xattrNameBuffer, 0) & 0x80000000) == 0
    || *__error() == 93)
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_is_shared_by_current_user_block_invoke()
{
  id MDItemSharedItemCurrentUserRole;
  uint64_t result;
  const __CFString *v2;
  CFIndex v3;

  MDItemSharedItemCurrentUserRole = getMDItemSharedItemCurrentUserRole();
  result = _MDPropertyCopyXAttrName((uint64_t)MDItemSharedItemCurrentUserRole);
  if (result)
  {
    v2 = (const __CFString *)result;
    result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      v3 = result;
      fpfs_fset_is_shared_by_current_user_xattrNameBuffer = (uint64_t)malloc_type_calloc(1uLL, result + 1, 0xB131C7F2uLL);
      return CFStringGetFileSystemRepresentation(v2, (char *)fpfs_fset_is_shared_by_current_user_xattrNameBuffer, v3);
    }
  }
  return result;
}

id getMDItemSharedItemCurrentUserRole()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr;
  v6 = getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr;
  if (!getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = (id *)dlsym(v1, "MDItemSharedItemCurrentUserRole");
    v4[3] = (uint64_t)v0;
    getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemSharedItemCurrentUserRole_cold_1();
  return *v0;
}

void sub_1A0A99A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_owner_name(int fd, char *cStr)
{
  CFStringRef v4;
  CFStringRef v5;
  id MDItemOwnerName;
  const __CFData *v7;
  const __CFData *v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v11;

  if (fpfs_fset_owner_name_onceToken == -1)
  {
    if (cStr)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&fpfs_fset_owner_name_onceToken, &__block_literal_global_21);
    if (cStr)
    {
LABEL_3:
      v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
      if (v4)
      {
        v5 = v4;
        MDItemOwnerName = getMDItemOwnerName();
        v7 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemOwnerName, (uint64_t)v5);
        if (v7)
        {
          v8 = v7;
          BytePtr = CFDataGetBytePtr(v7);
          Length = CFDataGetLength(v8);
          v11 = fpfs_fsetxattr(fd, (char *)fpfs_fset_owner_name_xattrNameBuffer, BytePtr, Length, 0, 0);
          CFRelease(v8);
          CFRelease(v5);
          return v11;
        }
        CFRelease(v5);
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_owner_name_xattrNameBuffer, 0) & 0x80000000) == 0 || *__error() == 93)
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_owner_name_block_invoke()
{
  id MDItemOwnerName;
  uint64_t result;
  const __CFString *v2;
  CFIndex v3;

  MDItemOwnerName = getMDItemOwnerName();
  result = _MDPropertyCopyXAttrName((uint64_t)MDItemOwnerName);
  if (result)
  {
    v2 = (const __CFString *)result;
    result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      v3 = result;
      fpfs_fset_owner_name_xattrNameBuffer = (uint64_t)malloc_type_calloc(1uLL, result + 1, 0x8C051985uLL);
      return CFStringGetFileSystemRepresentation(v2, (char *)fpfs_fset_owner_name_xattrNameBuffer, v3);
    }
  }
  return result;
}

id getMDItemOwnerName()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getMDItemOwnerNameSymbolLoc_ptr;
  v6 = getMDItemOwnerNameSymbolLoc_ptr;
  if (!getMDItemOwnerNameSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary();
    v0 = (id *)dlsym(v1, "MDItemOwnerName");
    v4[3] = (uint64_t)v0;
    getMDItemOwnerNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getMDItemOwnerName_cold_1();
  return *v0;
}

void sub_1A0A99C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_pause_sync_bundleID(int a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return (fsetxattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", __s, v4, 0, 0) >> 31);
}

uint64_t fpfs_funset_pause_sync_bundleID(int a1)
{
  if (fremovexattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_fset_resuming_sync_with_drop_local_changes(int a1)
{
  return (fsetxattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", "", 0, 0, 0) >> 31);
}

uint64_t fpfs_funset_resuming_sync_with_drop_local_changes(int a1)
{
  if (fremovexattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_set_root_exposure_symlink_xattr(const char *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s) + 1;
  return setxattr(a1, "com.apple.fileprovider.domainLink#N", __s, v4, 0, 1);
}

const char *fpfs_root_exposure_symlink_xattr_exists(const char *result)
{
  if (result)
    return (const char *)(getxattr(result, "com.apple.fileprovider.domainLink#N", 0, 0, 0, 1) >= 0);
  return result;
}

BOOL fpfs_root_exposure_symlink_xattr_is_equal(const char *a1, char *__s)
{
  size_t v4;
  char *v5;
  char *v6;
  _BOOL8 v7;

  v4 = strlen(__s) + 1;
  v5 = (char *)malloc_type_malloc(v4, 0xADD8949DuLL);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (getxattr(a1, "com.apple.fileprovider.domainLink#N", v5, v4, 0, 1) & 0x8000000000000000) == 0
    && strncmp(__s, v6, v4) == 0;
  free(v6);
  return v7;
}

const char *__fpfs_xattr_flags_from_name_block_invoke()
{
  const char *result;
  char **v1;
  char *v2;

  result = (const char *)fpfs_xattr_flags_from_name_xattr_mods;
  if (fpfs_xattr_flags_from_name_xattr_mods)
  {
    v1 = &off_1ECF09680;
    do
    {
      *(v1 - 4) = xattr_name_without_flags(result);
      v2 = *v1;
      v1 += 4;
      result = v2;
    }
    while (v2);
  }
  return result;
}

char *OUTLINED_FUNCTION_0_4()
{
  return dlerror();
}

void sub_1A0A9A328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A9BAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,int a49,char a50)
{
  uint64_t v50;

  _Block_object_dispose((const void *)(v50 - 176), 8);
  __fp_leave_section_Debug((uint64_t)&a48);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A9C6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A9CABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0A9CD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

int *OUTLINED_FUNCTION_15_1()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

int *OUTLINED_FUNCTION_19_1()
{
  return __error();
}

int *OUTLINED_FUNCTION_20_0()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;

  return v0;
}

const __CFString *FPHumanReadableDropReason(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("NA");
  else
    return off_1E444B1C0[a1];
}

uint64_t FPCSIndexReasonForFPIndexDropReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 9)
    return 0;
  else
    return qword_1A0B53AE8[a1 - 4];
}

void sub_1A0A9EBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0A9F3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,char a30)
{
  uint64_t v30;

  _FPRestorePersona((_QWORD *)(v30 - 184));
  _Unwind_Resume(a1);
}

void sub_1A0A9FD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _FPRestorePersona(&a28);
  _Unwind_Resume(a1);
}

uint64_t tokensAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  id v13;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "isEqualToData:", v4);
  v6 = 1;
  if (v3 != v4 && (v5 & 1) == 0)
  {
    v6 = 0;
    if (v3)
    {
      if (v4)
      {
        v13 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13;
        if (v7)
        {
          v12 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v12;

          if (v9)
            v6 = objc_msgSend(v7, "isEqual:", v9);
          else
            v6 = 0;

          v8 = v10;
        }
        else
        {
          v6 = 0;
        }

      }
    }
  }

  return v6;
}

void sub_1A0AA0734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AA0CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _FPRestorePersona(&a18);
  _Unwind_Resume(a1);
}

void sub_1A0AA11C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AA1E84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA1F8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCSSearchableIndexClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E444B1A8;
    v5 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_0)
    __getCSSearchableIndexClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CSSearchableIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchableIndexClass_block_invoke_cold_2();
  getCSSearchableIndexClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1A0AA26C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA33A4(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1A0AA3384);
}

void sub_1A0AA3674(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1A0AA3628);
  }
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_6(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_7_1(void *a1)
{
  return a1;
}

uint64_t fpfs_lp_faccessat(int a1, const char *a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char *v13;

  v8 = faccessat(a1, a2, a3, a4);
  if ((_DWORD)v8)
  {
    if (*__error() == 63)
    {
      v13 = 0;
      v9 = fpfs_openat_longparent(a1, a2, &v13);
      v8 = v9;
      if ((v9 & 0x80000000) == 0)
      {
        v10 = faccessat(v9, v13, a3, a4);
        v11 = *__error();
        close(v8);
        *__error() = v11;
        return v10;
      }
    }
  }
  return v8;
}

uint64_t fpfs_open(char *a1, unsigned int a2, uint64_t a3, char a4, uint64_t a5)
{
  return fpfs_openat(4294967294, a1, a2, a3, a4, a5);
}

uint64_t fpfs_openbyid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  v5 = openbyid_np();
  if ((v5 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v5);
  if ((v7 & 0x80000000) != 0)
  {
    v8 = *__error();
    close(v6);
    *__error() = v8;
  }
  else if (close(v6) < 0)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v7;
  }
  return v7;
}

uint64_t fpfs_fopendir(int a1, uint64_t a2)
{
  int v3;
  int v4;
  DIR *v5;
  DIR *v6;
  dirent *v7;
  dirent *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  int v13;

  v3 = dup(a1);
  if (v3 < 0)
    return 0xFFFFFFFFLL;
  v4 = v3;
  v5 = fdopendir(v3);
  if (!v5)
  {
    v11 = *__error();
    close(v4);
    *__error() = v11;
    return 0xFFFFFFFFLL;
  }
  v6 = v5;
  rewinddir(v5);
  v7 = readdir(v6);
  if (!v7)
    return closedir(v6);
  v8 = v7;
  while (1)
  {
    if (v8->d_name[0] != 46 || v8->d_name[1] && (v8->d_name[1] != 46 || v8->d_name[2]))
    {
      v9 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      if ((_DWORD)v9)
        break;
    }
    v8 = readdir(v6);
    if (!v8)
      return closedir(v6);
  }
  v12 = v9;
  v13 = *__error();
  closedir(v6);
  *__error() = v13;
  return v12;
}

uint64_t fpfs_opendir(char *a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_opendir_block_invoke;
  v3[3] = &unk_1E444B378;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0x100000u, 0, 0, (uint64_t)v3);
}

uint64_t __fpfs_opendir_block_invoke(uint64_t a1, int a2)
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_opendir_block_invoke_2;
  v3[3] = &unk_1E444B350;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = a2;
  return fpfs_fopendir(a2, (uint64_t)v3);
}

uint64_t __fpfs_opendir_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
}

uint64_t fpfs_chdir(char *a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_chdir_block_invoke;
  v3[3] = &unk_1E444B3C8;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0, 0, 0, (uint64_t)v3);
}

uint64_t __fpfs_chdir_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fchdir(a2, *(_QWORD *)(a1 + 32));
}

uint64_t fpfs_opendirat(int a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_opendirat_block_invoke;
  v4[3] = &unk_1E444B3F0;
  v4[4] = a3;
  v4[5] = a2;
  return fpfs_fchdir(a1, (uint64_t)v4);
}

uint64_t __fpfs_opendirat_block_invoke(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  _QWORD v4[5];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(char **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_opendir_block_invoke;
  v4[3] = &unk_1E444B378;
  v4[4] = v2;
  return fpfs_openat(4294967294, v1, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t fpfs_removeat(int a1, const char *a2)
{
  stat v5;

  memset(&v5, 0, sizeof(v5));
  if (fstatat(a1, a2, &v5, 32) < 0)
    return 0xFFFFFFFFLL;
  else
    return unlinkat(a1, a2, ((v5.st_mode & 0xF000) == 0x4000) << 7);
}

uint64_t fpfs_fchflags(int a1, unsigned int a2, int a3)
{
  int *v3;
  int v4;
  int v9;
  __uint32_t st_flags;
  int v11;
  __uint32_t v13;
  __uint32_t v14;
  __uint32_t v15;
  stat v16;

  if ((a3 & a2) != 0)
  {
    v3 = __error();
    v4 = 22;
  }
  else if (a1 < 0)
  {
    v3 = __error();
    v4 = 9;
  }
  else if ((a3 | a2) >= 0x10000)
  {
    v3 = __error();
    v4 = 1;
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
    if (fstat(a1, &v16) < 0)
      return 0xFFFFFFFFLL;
    v9 = (a2 << 25) & 0x40000000 | a2;
    st_flags = v16.st_flags;
    if ((v16.st_flags & ~v9 | a3) == v16.st_flags)
      return 0;
    v13 = v16.st_flags;
    v14 = v16.st_flags & ~v9 | a3;
    v11 = 4;
    v15 = v16.st_flags;
    while (--v11)
    {
      v13 = st_flags;
      v14 = st_flags & ~v9 | a3;
      if (ffsctl(a1, 0xC00C4114uLL, &v13, 0) < 0)
        return 0xFFFFFFFFLL;
      st_flags = v15;
      if ((a3 & ~v15) == 0 && (v15 & v9) == 0)
        return 0;
    }
    v3 = __error();
    v4 = 35;
  }
  *v3 = v4;
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_chflags(char *a1, int a2, int a3)
{
  _QWORD v4[4];
  int v5;
  int v6;

  if (!a1)
    return 22;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_chflags_block_invoke;
  v4[3] = &__block_descriptor_tmp_7;
  v5 = a2;
  v6 = a3;
  return fpfs_openat(4294967294, a1, 0x200000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_chflags_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fchflags(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

uint64_t fpfs_with_parent_path(const char *a1, uint64_t a2)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v3 = strdup(a1);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = v3;
  v5 = dirname(v3);
  free(v4);
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = strdup(v5);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  v8 = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, v6);
  free(v7);
  return v8;
}

uint64_t fpfs_dirsize()
{
  if ((int)dirstat_np() < 0)
    return -1;
  else
    return 0;
}

uint64_t _t_fpfs_readbyte(char *a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = ___t_fpfs_readbyte_block_invoke;
  v3[3] = &__block_descriptor_tmp_8;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0, 0, 0, (uint64_t)v3);
}

uint64_t ___t_fpfs_readbyte_block_invoke(uint64_t a1, int __fd)
{
  ssize_t v2;
  unsigned __int8 __buf;

  __buf = 0;
  v2 = pread(__fd, &__buf, 1uLL, *(_QWORD *)(a1 + 32));
  if (v2 == 1)
    return __buf;
  if (!v2)
    *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_enable_fts_thread_fchdir()
{
  return putenv("FTS_USE_THREAD_FCHDIR=YES");
}

void sub_1A0AA3FD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA411C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA4224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA4284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA42E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA4364(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA43C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA4444(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA44A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA452C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA45BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AA462C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FPPerformWithPersona(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v3 == 0) == (v7 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("One persona is unexpectedly nil: existing %@, requested %@"), v3, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      +[FPXExtensionContext principalClass].cold.1();

    __assert_rtn("FPPerformWithPersona", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSURL+FPAdditions.m", 87, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  }
  if (v7 != v3 && !objc_msgSend(v7, "isEqualToString:", v3))
  {
    if ((voucher_process_can_use_arbitrary_personas() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v17);

      goto LABEL_5;
    }
    v21 = 0;
    v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v21);
    v10 = v21;
    v11 = v10;
    if (!v9)
    {
      v20 = v10;
      v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v20);
      v12 = v20;

      if (!v9)
      {
        v4[2](v4, v12);
LABEL_20:

        goto LABEL_5;
      }
      v11 = v12;
    }
    objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.2);
      objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v13;
    }
    v4[2](v4, v13);
    objc_msgSend(v6, "restorePersonaWithSavedPersonaContext:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.2);
      objc_msgSend(v6, "restorePersonaWithSavedPersonaContext:", v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed restoring persona %@"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          +[FPXExtensionContext principalClass].cold.1();

        __assert_rtn("FPPerformWithPersona", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSURL+FPAdditions.m", 125, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      }
    }
    else
    {
      v12 = v11;
    }
    goto LABEL_20;
  }
  v4[2](v4, 0);
LABEL_5:

}

void sub_1A0AA5888(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0AA5F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0AA64B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getQLThumbnailAdditionClass()
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
  v0 = (void *)getQLThumbnailAdditionClass_softClass;
  v7 = getQLThumbnailAdditionClass_softClass;
  if (!getQLThumbnailAdditionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getQLThumbnailAdditionClass_block_invoke;
    v3[3] = &unk_1E444B188;
    v3[4] = &v4;
    __getQLThumbnailAdditionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AA6568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGSStorageManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!GenerationalStorageLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E444B4D8;
    v5 = 0;
    GenerationalStorageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!GenerationalStorageLibraryCore_frameworkLibrary)
    __getGSStorageManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("GSStorageManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getGSStorageManagerClass_block_invoke_cold_2();
  getGSStorageManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getQLThumbnailAdditionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!QuickLookThumbnailingLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E444B4F0;
    v5 = 0;
    QuickLookThumbnailingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuickLookThumbnailingLibraryCore_frameworkLibrary)
    __getQLThumbnailAdditionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("QLThumbnailAddition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getQLThumbnailAdditionClass_block_invoke_cold_2();
  getQLThumbnailAdditionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *OUTLINED_FUNCTION_21_1()
{
  return __error();
}

void OUTLINED_FUNCTION_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 8u);
}

uint64_t fpfs_supports_parent_mtime_iopolicy()
{
  return 1;
}

uint64_t fpfs_supports_pkg_dataless_escape_prevention()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_pkg_dataless_escape_prevention_once_token != -1)
    dispatch_once(&fpfs_supports_pkg_dataless_escape_prevention_once_token, &__block_literal_global_10);
  *__error() = v0;
  return fpfs_supports_pkg_dataless_escape_prevention_feature_enabled;
}

uint64_t __fpfs_supports_pkg_dataless_escape_prevention_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"PackageDatalessPrevention");
  fpfs_supports_pkg_dataless_escape_prevention_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_partial_materialization()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_partial_materialization_once_token != -1)
    dispatch_once(&fpfs_supports_partial_materialization_once_token, &__block_literal_global_2);
  *__error() = v0;
  return fpfs_supports_partial_materialization_feature_enabled;
}

uint64_t __fpfs_supports_partial_materialization_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"PartialMaterialization");
  fpfs_supports_partial_materialization_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_brm_sparse_files()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_brm_sparse_files_once_token != -1)
    dispatch_once(&fpfs_supports_brm_sparse_files_once_token, &__block_literal_global_6);
  *__error() = v0;
  return fpfs_supports_brm_sparse_files_feature_enabled;
}

uint64_t __fpfs_supports_brm_sparse_files_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"BRMSparseFiles");
  fpfs_supports_brm_sparse_files_feature_enabled = result;
  return result;
}

uint64_t __fpfs_supports_long_paths_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"LongPaths");
  fpfs_supports_long_paths_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_nx_for_testing()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_nx_for_testing_once_token != -1)
    dispatch_once(&fpfs_supports_nx_for_testing_once_token, &__block_literal_global_10);
  *__error() = v0;
  return fpfs_supports_nx_for_testing_feature_enabled;
}

uint64_t __fpfs_supports_nx_for_testing_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"NonExistentFeatureFlagUsedForTesting");
  fpfs_supports_nx_for_testing_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_speculative_set()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_speculative_set_once_token != -1)
    dispatch_once(&fpfs_supports_speculative_set_once_token, &__block_literal_global_12);
  *__error() = v0;
  return fpfs_supports_speculative_set_feature_enabled;
}

uint64_t __fpfs_supports_speculative_set_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"SpeculativeSet");
  fpfs_supports_speculative_set_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_purge_reasons()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_purge_reasons_once_token != -1)
    dispatch_once(&fpfs_supports_purge_reasons_once_token, &__block_literal_global_14);
  *__error() = v0;
  return fpfs_supports_purge_reasons_feature_enabled;
}

uint64_t __fpfs_supports_purge_reasons_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"FPPurgeReasonsSupport");
  fpfs_supports_purge_reasons_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_lazy_recursive_deletion()
{
  int v0;

  v0 = *__error();
  if (fpfs_supports_lazy_recursive_deletion_once_token != -1)
    dispatch_once(&fpfs_supports_lazy_recursive_deletion_once_token, &__block_literal_global_16);
  *__error() = v0;
  return fpfs_supports_lazy_recursive_deletion_feature_enabled;
}

uint64_t __fpfs_supports_lazy_recursive_deletion_block_invoke()
{
  uint64_t result;

  result = _fpfs_is_feature_flag_enabled((uint64_t)"LazyRecursiveDeletion");
  fpfs_supports_lazy_recursive_deletion_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_partial_conflicts_resolution()
{
  return 0;
}

uint64_t fpfs_fset_syncroot(int a1, int a2)
{
  uint64_t result;
  _BOOL4 v5;

  result = fpfs_operation_is_allowed(4);
  if ((_DWORD)result)
  {
    v5 = a2 != 0;
    return (ffsctl(a1, 0x80044A48uLL, &v5, 0) >> 31);
  }
  return result;
}

uint64_t fpfs_set_syncroot_at(uint64_t a1, char *a2, int a3)
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __fpfs_set_syncroot_at_block_invoke;
  v4[3] = &__block_descriptor_36_e8_i12__0i8l;
  v5 = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_set_syncroot_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fset_syncroot(a2, *(_DWORD *)(a1 + 32));
}

uint64_t fpfs_fget_syncroot(int a1, BOOL *a2)
{
  uint64_t result;
  int v5;

  v5 = 0;
  if (fpfs_operation_is_allowed(2) && ffsctl(a1, 0x40044A48uLL, &v5, 0) < 0)
    return 0xFFFFFFFFLL;
  result = 0;
  if (a2)
    *a2 = v5 != 0;
  return result;
}

uint64_t FPStatFSFromPath(void *a1, statfs *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = objc_retainAutorelease(a1);
  v4 = statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation"), a2);
  if ((v4 & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      FPStatFSFromPath_cold_1((uint64_t)v3, v5);

  }
  return v4;
}

char *FPFileSystemTypeName(char *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 72);
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t FPFileSystemFreeBytes(unsigned int *a1)
{
  if (a1)
    return *((_QWORD *)a1 + 3) * *a1;
  else
    return -1;
}

__CFString *FPLocalizedFileSystemTypeName(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v2 = *MEMORY[0x1E0C99C20];
  v9 = 0;
  v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v10, v2, &v9);
  v4 = v10;
  v5 = v9;

  if (v3)
  {
    v6 = (__CFString *)v4;
  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      FPLocalizedFileSystemTypeName_cold_1((uint64_t)v5, v7);

    v6 = CFSTR("Unknown");
  }

  return v6;
}

void fpfs_free_metadata_tag_data(uint64_t a1)
{
  fpfs_free_tag_data((void **)(a1 + 80));
}

uint64_t fpfs_set_metadata(char *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[7];
  int v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __fpfs_set_metadata_block_invoke;
  v6[3] = &unk_1E444B5D8;
  v7 = a3;
  v6[5] = a2;
  v6[6] = a4;
  v6[4] = a5;
  return fpfs_open(a1, 0x200002u, 0, 2, (uint64_t)v6);
}

uint64_t __fpfs_set_metadata_block_invoke(uint64_t a1, int fd)
{
  return fpfs_fset_metadata(fd, *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t fpfs_fset_metadata(int fd, uint64_t a2, int a3, uint64_t a4)
{
  int v8;
  int v9;
  char v10;
  unsigned int v11;
  char v12;
  int v13;
  _BOOL4 v14;
  __int128 *v15;
  int v16;
  size_t v17;
  __int128 v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  _OWORD v53[4];
  int v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = *(_DWORD *)a2;
  v55 = 0u;
  v56 = 0u;
  if ((a4 & 0x400000) != 0 && v8 == 2 && (fpfs_set_favorite_rank(fd, *(_QWORD *)(a2 + 72)) & 0x80000000) != 0
    || (a4 & 0x800000) != 0 && (fpfs_set_is_pinned(fd, (*(_DWORD *)(a2 + 4) >> 7) & 1) & 0x80000000) != 0
    || (a4 & 0x1000000) != 0 && (fpfs_set_before_bounce_filename(fd, *(char **)(a2 + 136)) & 0x80000000) != 0
    || (a4 & 0x2000000) != 0 && (fpfs_set_syncable_xattrs() & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  if ((a4 & 0x200000) != 0)
  {
    if ((*(_BYTE *)(a2 + 5) & 0x10) != 0)
    {
      if ((fpfs_set_last_use_date(fd, (uint64_t *)(a2 + 56), 0) & 0x80000000) != 0)
        return 0xFFFFFFFFLL;
    }
    else if (fpfs_fremovexattr(fd, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93)
    {
      return 0xFFFFFFFFLL;
    }
  }
  if ((a4 & 0x20000000) != 0 && (fpfs_fset_collaboration_identifier(fd, *(const char **)(a2 + 176)) & 0x80000000) != 0
    || (a4 & 0x40000000) != 0
    && ((fpfs_fset_is_shared(fd, *(_BYTE *)(a2 + 184)) & 0x80000000) != 0
     || (a4 & 0x100000000) != 0 && (fpfs_fset_is_shared_by_current_user(fd, (_BYTE *)(a2 + 185)) & 0x80000000) != 0
     || !*(_BYTE *)(a2 + 184) && (fpfs_fset_is_shared_by_current_user(fd, 0) & 0x80000000) != 0)
    || (a4 & 0x80000000) != 0 && (fpfs_fset_owner_name(fd, *(char **)(a2 + 192)) & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  if ((v8 - 1) > 2)
    goto LABEL_41;
  *(_QWORD *)&v31 = 0;
  if ((a4 & 0x200) != 0)
    v9 = (*(_DWORD *)(a2 + 4) >> 10) & 2;
  else
    LOBYTE(v9) = 0;
  v10 = v9 | BYTE1(a4) & 1;
  v11 = *(_DWORD *)(a2 + 4);
  v12 = ~(_BYTE)v11 & 4;
  if ((a4 & 0x8000) == 0)
    v12 = 0;
  LOBYTE(v31) = (a4 >> 7) & 8 | v10 | v12;
  *((_QWORD *)&v31 + 1) = a4 & 0x800;
  *((_QWORD *)&v52 + 1) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)&v52 = v11 & 0xC | (v11 >> 10) & 2 | ((v11 & 2) != 0);
  if ((a4 & 0x100000) != 0 && (fpfs_set_tag_data(fd, a2 + 80, (uint64_t)&v31, (uint64_t)&v52) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((a4 & 0x108F00) != 0)
  {
    fpfs_get_finder_info_buffer(fd, &v55);
    if (v13 < 0)
      return 0xFFFFFFFFLL;
    v50 = 0uLL;
    fpfs_finder_info_deserialize((uint64_t)&v55, (uint64_t)&v50);
    v14 = fpfs_finder_info_update_with_mask((uint64_t)&v50, (char *)&v31, (uint64_t)&v52);
    if (v14)
      fpfs_finder_info_serialize((unsigned __int8 *)&v50, (uint64_t)&v55);
    if (*(_DWORD *)a2 == 3 && (fpfs_pkg_promote(fd) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_41:
    v14 = 0;
  }
  if ((a4 & 0x20000) != 0)
  {
    if ((*(_BYTE *)(a2 + 4) & 1) != 0)
    {
      if ((fpfs_set_dataless_cmpfs_attrs(fd, a2) & 0x80000000) != 0)
        return 0xFFFFFFFFLL;
    }
    else if ((fpfs_unset_dataless_cmpfs_attrs(fd, (__int128 *)(a2 + 40)) & 0x80000000) != 0)
    {
      return 0xFFFFFFFFLL;
    }
  }
  if ((a4 & 0x10000000) != 0
    && (*(_DWORD *)a2 & 0xFFFFFFFE) == 2
    && (fpfs_fset_syncroot(fd, (*(_DWORD *)(a2 + 4) >> 8) & 1) & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  v51 = 0;
  v50 = xmmword_1A0B53BA0;
  v54 = 0;
  memset(v53, 0, sizeof(v53));
  v52 = 0u;
  v15 = &v52;
  if ((a4 & 1) == 0)
  {
    v16 = 0;
    v17 = 0;
    if ((a4 & 2) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
  v16 = 512;
  DWORD1(v50) = 512;
  v52 = *(_OWORD *)(a2 + 24);
  v15 = v53;
  v17 = 16;
  if ((a4 & 2) != 0)
  {
LABEL_54:
    v16 |= 0x400u;
    DWORD1(v50) = v16;
    *v15++ = *(_OWORD *)(a2 + 40);
    v17 += 16;
  }
LABEL_55:
  if ((a4 & 0x200000) != 0 && (*(_BYTE *)(a2 + 5) & 0x10) != 0)
  {
    DWORD1(v50) = v16 | 0x1000;
    *v15++ = *(_OWORD *)(a2 + 56);
    v17 += 16;
  }
  if (v14)
  {
    DWORD1(v50) |= 0x4000u;
    v18 = v56;
    *v15 = v55;
    v15[1] = v18;
    v15 += 2;
    v17 += 32;
  }
  if ((a4 & 4) != 0)
  {
    DWORD1(v50) |= 0x20000u;
    v19 = *(_WORD *)(a2 + 8) & 0xFFF;
    if ((v8 & 0xFFFFFFFE) == 2)
    {
      if (fpfs_supports_vfs_ignore_permissions_iopolicy())
        v19 |= 0x40u;
      else
        v19 |= 0x1C0u;
    }
    *(_DWORD *)v15 = v19;
    v15 = (__int128 *)((char *)v15 + 4);
    v17 += 4;
  }
  else if (!v17)
  {
    goto LABEL_70;
  }
  if ((char *)v15 - (char *)&v52 != v17)
    fpfs_fset_metadata_cold_1();
  if (fsetattrlist(fd, &v50, &v52, v17, 0) < 0)
    return 0xFFFFFFFFLL;
LABEL_70:
  if ((a4 & 0x38000) != 0)
  {
    if ((a4 & 0x8000) != 0)
    {
      v21 = (*(_DWORD *)(a2 + 4) << 13) & 0x8000;
      v20 = v21 ^ 0x8000;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    if ((a4 & 0x10000) != 0)
    {
      if ((*(_BYTE *)(a2 + 4) & 0x10) != 0)
        v21 |= 2u;
      else
        v20 |= 2u;
    }
    if (v21 | v20 && (fpfs_fchflags(fd, v20, v21) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
  }
  if ((a4 & 0x8000000) == 0)
    return 0;
  if (*(_DWORD *)a2 == 3)
    goto LABEL_85;
  if (*(_DWORD *)a2 != 1)
    return 0;
  if (!fpfs_supports_partial_materialization())
  {
LABEL_85:
    v22 = *(_DWORD *)(a2 + 4);
    if ((v22 & 1) == 0)
      goto LABEL_86;
    return 0;
  }
  v22 = *(_DWORD *)(a2 + 4);
LABEL_86:
  v31 = 0u;
  v32 = 0u;
  v23 = *(_OWORD *)(a2 + 176);
  v44 = *(_OWORD *)(a2 + 160);
  v45 = v23;
  v24 = *(_OWORD *)(a2 + 208);
  v46 = *(_OWORD *)(a2 + 192);
  v47 = v24;
  v25 = *(_OWORD *)(a2 + 112);
  v40 = *(_OWORD *)(a2 + 96);
  v41 = v25;
  v26 = *(_OWORD *)(a2 + 144);
  v42 = *(_OWORD *)(a2 + 128);
  v43 = v26;
  v27 = *(_OWORD *)(a2 + 48);
  v36 = *(_OWORD *)(a2 + 32);
  v37 = v27;
  v28 = *(_OWORD *)(a2 + 80);
  v38 = *(_OWORD *)(a2 + 64);
  v39 = v28;
  v29 = *(_OWORD *)(a2 + 16);
  v34 = *(_OWORD *)a2;
  v33 = 0;
  DWORD1(v32) = a3;
  v35 = v29;
  v48 = 0;
  v49 = 0;
  if (a3 && (v22 & 0x20) != 0)
  {
    if ((fpfs_set_evictable(fd, (uint64_t)&v31) & 0x80000000) == 0)
      return 0;
  }
  else if ((fpfs_unset_evictable(fd, (uint64_t)&v31) & 0x80000000) == 0)
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_set_vfs_parent_mtime_iopolicy()
{
  uint64_t result;

  result = fpfs_supports_parent_mtime_iopolicy();
  if ((_DWORD)result)
    return setiopolicy_np(8, 0, 1);
  return result;
}

uint64_t fpfs_unset_vfs_parent_mtime_iopolicy()
{
  uint64_t result;

  result = fpfs_supports_parent_mtime_iopolicy();
  if ((_DWORD)result)
    return setiopolicy_np(8, 0, 0);
  return result;
}

uint64_t fpfs_make_fsevent(int a1)
{
  if (fsetxattr(a1, "com.apple.fileprovider.touch", "", 1uLL, 0, 0) < 0)
    return 0xFFFFFFFFLL;
  else
    return (fremovexattr(a1, "com.apple.fileprovider.touch", 0) >> 31);
}

uint64_t fpfs_num_entries(const char *a1, int a2, _DWORD *a3)
{
  return fpfs_num_entries_at(-2, a1, a2, a3);
}

uint64_t fpfs_num_entries_at(int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  v7 = xmmword_1A0B53BD0;
  v6 = 0;
  result = getattrlistat(a1, a2, &v7, &v6, 8uLL, a3 ^ 1u);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *a4 = HIDWORD(v6);
  return result;
}

void sub_1A0AAAA88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

Class __getCSUserQueryContextClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_0();
  result = objc_getClass("CSUserQueryContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSUserQueryContextClass_block_invoke_cold_1();
  getCSUserQueryContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSUserQueryClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_0();
  result = objc_getClass("CSUserQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSUserQueryClass_block_invoke_cold_1();
  getCSUserQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return v0;
}

void sub_1A0AAC6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

id getIFImageClass()
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
  v0 = (void *)getIFImageClass_softClass;
  v7 = getIFImageClass_softClass;
  if (!getIFImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIFImageClass_block_invoke;
    v3[3] = &unk_1E444B188;
    v3[4] = &v4;
    __getIFImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AACD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationCreateWithData(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  v10 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
  {
    v5 = (void *)ImageIOLibrary();
    v4 = dlsym(v5, "CGImageDestinationCreateWithData");
    v8[3] = (uint64_t)v4;
    getCGImageDestinationCreateWithDataSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    _CGImageDestinationCreateWithData_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))v4)(a1, a2, 1, 0);
}

void sub_1A0AACE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationAddImage(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getCGImageDestinationAddImageSymbolLoc_ptr;
  v10 = getCGImageDestinationAddImageSymbolLoc_ptr;
  if (!getCGImageDestinationAddImageSymbolLoc_ptr)
  {
    v5 = (void *)ImageIOLibrary();
    v4 = dlsym(v5, "CGImageDestinationAddImage");
    v8[3] = (uint64_t)v4;
    getCGImageDestinationAddImageSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    _CGImageDestinationAddImage_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))v4)(a1, a2, 0);
}

void sub_1A0AACED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationFinalize(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getCGImageDestinationFinalizeSymbolLoc_ptr;
  v8 = getCGImageDestinationFinalizeSymbolLoc_ptr;
  if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
  {
    v3 = (void *)ImageIOLibrary();
    v2 = dlsym(v3, "CGImageDestinationFinalize");
    v6[3] = (uint64_t)v2;
    getCGImageDestinationFinalizeSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    _CGImageDestinationFinalize_cold_1();
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void sub_1A0AACF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getIFImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IconFoundationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E444B948;
    v5 = 0;
    IconFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IconFoundationLibraryCore_frameworkLibrary)
    __getIFImageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("IFImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIFImageClass_block_invoke_cold_2();
  getIFImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ImageIOLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!ImageIOLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444B960;
    v3 = 0;
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ImageIOLibraryCore_frameworkLibrary)
    ImageIOLibrary_cold_1(&v1);
  return ImageIOLibraryCore_frameworkLibrary;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return objc_opt_class();
}

void sub_1A0AADDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AADE88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AAE708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AAF600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDSArchiveServiceClass()
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
  v0 = (void *)getDSArchiveServiceClass_softClass;
  v7 = getDSArchiveServiceClass_softClass;
  if (!getDSArchiveServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDSArchiveServiceClass_block_invoke;
    v3[3] = &unk_1E444B188;
    v3[4] = &v4;
    __getDSArchiveServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A0AAFCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AB08FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AB0F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AB1934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDSArchiveServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  DesktopServicesPrivLibrary();
  result = objc_getClass("DSArchiveService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDSArchiveServiceClass_block_invoke_cold_1();
  getDSArchiveServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DesktopServicesPrivLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444BD70;
    v3 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
    DesktopServicesPrivLibrary_cold_1(&v1);
  return DesktopServicesPrivLibraryCore_frameworkLibrary;
}

uint64_t OUTLINED_FUNCTION_7_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1A0AB2B14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AB2BD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AB2D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AB3330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBRFieldContentSignatureClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!iCloudDriveCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E444BD88;
    v5 = 0;
    iCloudDriveCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!iCloudDriveCoreLibraryCore_frameworkLibrary)
    __getBRFieldContentSignatureClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BRFieldContentSignature");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBRFieldContentSignatureClass_block_invoke_cold_2();
  getBRFieldContentSignatureClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A0AB4368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void FPBookmarkableStringFromDocumentURL(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if ((objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid()) & 1) != 0)
  {
    v4 = a1;
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __FPBookmarkableStringFromDocumentURL_block_invoke;
    v13[3] = &unk_1E444A840;
    v6 = v3;
    v14 = v6;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __FPBookmarkableStringFromDocumentURL_block_invoke_2;
    v9[3] = &unk_1E444BDF8;
    v10 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v13);
    v11 = v4;
    v12 = v6;
    v7 = v4;
    v8 = v10;
    objc_msgSend(v8, "FPBookmarkableStringFromDocumentURL:completionHandler:", v7, v9);

  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

id FPCreateBookmarkableStringFromDocumentURL(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    goto LABEL_16;
  v6 = *(_QWORD *)v15;
  while (2)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = 0;
        objc_msgSend(v8, "FPBookmarkableStringFromDocumentURL:error:", v3, &v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v13;
        v11 = v10;
        if (v10)
        {
          v5 = 0;
          if (a2)
            *a2 = v10;
        }
        else
        {
          if (!v9)
            continue;
          v5 = v9;
        }

        goto LABEL_16;
      }
    }
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
      continue;
    break;
  }
LABEL_16:

  return v5;
}

void FPDocumentURLFromBookmarkableString(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __FPDocumentURLFromBookmarkableString_block_invoke;
  v11[3] = &unk_1E444A840;
  v5 = v3;
  v12 = v5;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __FPDocumentURLFromBookmarkableString_block_invoke_2;
  v8[3] = &unk_1E444ABC0;
  v9 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v11);
  v10 = v5;
  v6 = v5;
  v7 = v9;
  objc_msgSend(v7, "FPDocumentURLFromBookmarkableString:completionHandler:", a1, v8);

}

id FPCreateDocumentURLFromBookmarkableString(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    goto LABEL_16;
  v6 = *(_QWORD *)v15;
  while (2)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = 0;
        objc_msgSend(v8, "FPDocumentURLFromBookmarkableString:error:", v3, &v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v13;
        v11 = v10;
        if (v10)
        {
          v5 = 0;
          if (a2)
            *a2 = v10;
        }
        else
        {
          if (!v9)
            continue;
          v5 = v9;
        }

        goto LABEL_16;
      }
    }
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
      continue;
    break;
  }
LABEL_16:

  return v5;
}

void FPExtendBookmarkForDocumentURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __FPExtendBookmarkForDocumentURL_block_invoke;
  v20[3] = &unk_1E444BE20;
  v9 = v5;
  v22 = v9;
  v10 = v7;
  v21 = v10;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __FPExtendBookmarkForDocumentURL_block_invoke_2;
  v15[3] = &unk_1E444BE48;
  v16 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v20);
  v17 = v10;
  v18 = v6;
  v19 = v9;
  v11 = v9;
  v12 = v6;
  v13 = v10;
  v14 = v16;
  objc_msgSend(v14, "FPExtendBookmarkForDocumentURL:forBundleID:completionHandler:", v13, v12, v15);

}

void FPRegisterFileProvidersForFileCoordination(void *a1)
{
  void (**v1)(_QWORD);
  NSObject *v2;

  v1 = a1;
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    FPRegisterFileProvidersForFileCoordination_cold_1();

  v1[2](v1);
}

void FPRegisterFileProvidersForUser(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    FPRegisterFileProvidersForUser_cold_1();

  +[FPDaemonConnection connectionForUser:](FPDaemonConnection, "connectionForUser:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FPRegisterFileProvidersForUser_block_invoke;
  v7[3] = &unk_1E444BE70;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "wakeUpForURL:completionHandler:", 0, v7);

}

BOOL FPFetchDatalessFileResolverUIDAtURL(void *a1, uid_t *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  int dataless_cmpfs_xattr_owner;
  id v10;
  int v11;
  int v12;
  _BOOL8 v13;
  id v14;
  stat v16;

  v5 = a1;
  if (objc_msgSend(v5, "isFileURL")
    && (objc_msgSend(v5, "path"),
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        v7 = objc_msgSend(v6, "fileSystemRepresentation"),
        v6,
        v7))
  {
    objc_msgSend(v5, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    dataless_cmpfs_xattr_owner = fpfs_get_dataless_cmpfs_xattr_owner((char *)objc_msgSend(v8, "fileSystemRepresentation"), a2);

    if (dataless_cmpfs_xattr_owner < 0)
    {
      objc_msgSend(v5, "path");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      dataless_cmpfs_xattr_owner = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 2097156);

      if ((dataless_cmpfs_xattr_owner & 0x80000000) == 0
        || *__error() == 63
        && fpfs_supports_long_paths()
        && (objc_msgSend(v5, "path"),
            v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
            dataless_cmpfs_xattr_owner = fpfs_open_longpath((char *)objc_msgSend(v14, "fileSystemRepresentation"), 2097156, 0), v14, (dataless_cmpfs_xattr_owner & 0x80000000) == 0))
      {
        v11 = dataless_cmpfs_xattr_owner;
        memset(&v16, 0, sizeof(v16));
        dataless_cmpfs_xattr_owner = fstat(dataless_cmpfs_xattr_owner, &v16);
        v12 = *__error();
        close(v11);
        *__error() = v12;
        if (a2)
        {
          if (!dataless_cmpfs_xattr_owner)
            *a2 = v16.st_uid;
        }
      }
      if (a3 && dataless_cmpfs_xattr_owner < 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        dataless_cmpfs_xattr_owner = 1;
      }
    }
    v13 = dataless_cmpfs_xattr_owner == 0;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1000, 0);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL FPStartDownloadingItemAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FPStartDownloadingItemAtURL_block_invoke;
  v7[3] = &unk_1E444BE98;
  v7[4] = &v8;
  objc_msgSend(v4, "startDownloadingItemAtURL:completionHandler:", v3, v7);

  v5 = (void *)v9[5];
  if (a2 && v5)
    *a2 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v8, 8);

  return v5 == 0;
}

void sub_1A0AB5340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPResolveSymlink(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  int v6;
  void *v7;
  int v8;

  v5 = a1;
  v6 = getiopolicy_np(3, 1);
  if (v6 == 1)
  {
    FPResolveSymlinkRecursive(v5, a2, 0, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
    setiopolicy_np(3, 1, 1);
    FPResolveSymlinkRecursive(v5, a2, 0, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    setiopolicy_np(3, 1, v8);
  }

  return v7;
}

id FPResolveSymlinkRecursive(void *a1, uint64_t a2, unint64_t a3, int a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  ssize_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  stat v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  id v37;
  char v38[8];
  char *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = v9;
  if (a3 >= 0x65)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 62);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_30;
  }
  if ((objc_msgSend(v9, "isFileURL") & 1) == 0)
  {
LABEL_17:
    v10 = v10;
    v11 = v10;
    goto LABEL_30;
  }
  memset(&v33, 0, sizeof(v33));
  v12 = objc_retainAutorelease(v10);
  if (lstat((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &v33) < 0)
    goto LABEL_11;
  if ((v33.st_mode & 0xF000) != 0xA000)
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v12, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:isDirectory:", v18, (v33.st_mode & 0xF000) == 0x4000);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)a2 && (v33.st_mode & 0xF000) == 0x4000 && (v33.st_flags & 0x40000000) != 0)
    {
      v30 = (void *)objc_opt_new();
      *(_QWORD *)v38 = 0;
      v39 = v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__6;
      v42 = __Block_byref_object_dispose__6;
      v43 = 0;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __FPResolveSymlinkRecursive_block_invoke;
      v32[3] = &unk_1E444C288;
      v32[4] = v38;
      objc_msgSend(v30, "coordinateReadingItemAtURL:options:error:byAccessor:", v10, 1, a5, v32);
      v11 = *((id *)v39 + 5);
      _Block_object_dispose(v38, 8);

      goto LABEL_30;
    }
    goto LABEL_17;
  }
  bzero(v38, 0x401uLL);
  v10 = objc_retainAutorelease(v12);
  v13 = readlink((const char *)objc_msgSend(v10, "fileSystemRepresentation"), v38, 0x401uLL);
  if (v13 < 0)
  {
LABEL_11:
    if (*__error() == 2)
    {
      if (a5)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB3308];
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (*__error() == 11 && !a4)
      {
        v19 = (void *)objc_opt_new();
        *(_QWORD *)v38 = 0;
        v39 = v38;
        v40 = 0x3032000000;
        v41 = __Block_byref_object_copy__6;
        v42 = __Block_byref_object_dispose__6;
        v43 = 0;
        objc_msgSend(v12, "URLByDeletingLastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __FPResolveSymlinkRecursive_block_invoke_2;
        v31[3] = &unk_1E444C288;
        v31[4] = v38;
        objc_msgSend(v19, "coordinateReadingItemAtURL:options:error:byAccessor:", v20, 1, a5, v31);

        if (*((_QWORD *)v39 + 5))
        {
          FPResolveSymlinkRecursive(v12, a2, a3, 1, a5);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        _Block_object_dispose(v38, 8);

        goto LABEL_29;
      }
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB3308];
        v35[0] = v12;
        v23 = *MEMORY[0x1E0CB3388];
        v34[0] = v22;
        v34[1] = v23;
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v25);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v11 = 0;
LABEL_29:
    v10 = v12;
    goto LABEL_30;
  }
  v38[v13] = 0;
  if (v38[0] == 47)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v38, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_pathWithFileSystemRepresentation:", v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:isDirectory:", v27, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "standardizedURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  FPResolveSymlinkRecursive(v28, a2, a3 + 1, 0, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
  return v11;
}

void sub_1A0AB5944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

BOOL FPIsBinCompatSymlinkToDetachedRoot(void *a1)
{
  id v1;
  int v2;
  id v3;
  int v4;
  int v5;
  _BOOL8 v6;
  stat v8;

  v1 = a1;
  v2 = getiopolicy_np(3, 1);
  if (v2 != 1)
    setiopolicy_np(3, 1, 1);
  v3 = objc_retainAutorelease(v1);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 2129924);
  if (v4 < 0)
  {
    v6 = 0;
  }
  else
  {
    v5 = v4;
    memset(&v8, 0, sizeof(v8));
    v6 = (fstat(v4, &v8) & 0x80000000) == 0
      && (v8.st_mode & 0xF000) == 0xA000
      && fgetxattr(v5, "com.apple.fileprovider.detached-link#P", 0, 0, 0, 0) >= 0;
    close(v5);
  }
  if (v2 != 1)
    setiopolicy_np(3, 1, v2);

  return v6;
}

uint64_t FPURLMightBeInFileProviderForEUID(void *a1, const char *a2)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", a2);
}

id FPCopyItemForURLWithEUID(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPCopyItemForURLWithEUID_block_invoke;
  v8[3] = &unk_1E444BEC0;
  v8[4] = &v9;
  v8[5] = &v15;
  objc_msgSend(v5, "itemForURL:completionHandler:", v4, v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v6;
}

void sub_1A0AB5BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t FPURLIsInFileProvider(void *a1)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid());
}

BOOL FPURLIsLocatedOnRemovableStorage(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_relativePathOf:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "length") != 0;
  else
    v5 = 0;

  return v5;
}

uint64_t FPIsFileProviderBookmark(const __CFURL *a1, CFErrorRef *error)
{
  BOOL v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t Value;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  const __CFURL *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  CFBooleanRef propertyValueTypeRefPtr;

  propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(a1, CFSTR("FPFileIsBookmarkURLProperty"), &propertyValueTypeRefPtr, error))
    v3 = propertyValueTypeRefPtr == 0;
  else
    v3 = 1;
  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __FPIsFileProviderBookmark_block_invoke;
    v9[3] = &unk_1E444BEF0;
    v11 = &v13;
    v12 = a1;
    v5 = v4;
    v10 = v5;
    FPBookmarkableStringFromDocumentURL(a1, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    Value = *((unsigned __int8 *)v14 + 24);
    v6 = (_QWORD *)MEMORY[0x1E0C9AE40];
    if (*((_BYTE *)v14 + 24))
      v6 = (_QWORD *)MEMORY[0x1E0C9AE50];
    MEMORY[0x1A1AFFDB8](a1, CFSTR("FPFileIsBookmarkURLProperty"), *v6);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    Value = CFBooleanGetValue(propertyValueTypeRefPtr);
    CFRelease(propertyValueTypeRefPtr);
  }
  return Value;
}

void sub_1A0AB5EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FPCFSetAttributeValueForItem(void *a1, void *a2, void *a3, uint64_t *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a2;
  v9 = a3;
  v10 = a1;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v23 = 0;
          v17 = objc_msgSend(v16, "FPSetValue:forAttribute:onItemAtURL:error:", v9, v8, v10, &v23);
          v18 = v23;
          v19 = v18;
          if ((v17 & 1) == 0 && v18)
          {
            if (a4)
              *a4 = (uint64_t)v18;

            v20 = 0;
            goto LABEL_18;
          }

          if ((v17 & 1) != 0)
          {
            v20 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (a4)
  {
    FPNotSupportedError();
    v20 = 0;
    *a4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

void FPCFGetAttributeValuesForItem(void *a1, uint64_t a2, void *a3)
{
  void (**v5)(id, const void *, _QWORD);
  const void *v6;
  NSObject *v7;
  _BYTE cf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    *(_QWORD *)cf = 0;
    v6 = (const void *)FPCFCopyAttributeValuesForItem(a1, a2, cf);
    v5[2](v5, v6, *(_QWORD *)cf);
    if (*(_QWORD *)cf)
      CFRelease(*(CFTypeRef *)cf);
    if (v6)
      CFRelease(v6);
  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)cf = 136315138;
      *(_QWORD *)&cf[4] = "FPCFGetAttributeValuesForItem";
      _os_log_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] No point in calling %s without a completion block", cf, 0xCu);
    }

  }
}

id FPCopyExtensionMatchingDictionaryForItem(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "fp_matchesFileProviderHeuristics:", geteuid());

  v6 = CFSTR("URLMightBeInFileProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void FPEvictItem(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a1;
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FPEvictItem_block_invoke;
  v7[3] = &unk_1E444A598;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:completionHandler:", v5, 0, a2, v7);

}

BOOL FPEvictItemAtURL(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FPEvictItemAtURL_block_invoke;
  v10[3] = &unk_1E444B188;
  v10[4] = &v11;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __FPEvictItemAtURL_block_invoke_2;
  v7[3] = &unk_1E444BF68;
  v4 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v10);
  v8 = v4;
  v9 = &v11;
  objc_msgSend(v4, "FPEvictItemAtURL:completionHandler:", v3, v7);
  if (a2)
    *a2 = objc_retainAutorelease((id)v12[5]);
  v5 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v5;
}

void sub_1A0AB6574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPUpdateLastUsedDate(void *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if ((objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid()) & 1) != 0)
  {
    +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __FPUpdateLastUsedDate_block_invoke;
    v5[3] = &unk_1E4449A88;
    v6 = v3;
    objc_msgSend(v4, "updateLastUsedDateForFileURL:completionHandler:", a1, v5);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void FPSetAlternateContentsURLOnDocumentURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a1;
  v7 = a2;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = 0;
    +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v7, 0, &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void FPSetAlternateContentsURLOnDocumentURL(CFURLRef, CFURLRef, void (^__strong)(CFErrorRef))");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fp_scopeDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("FPUtilities.m"), 706, CFSTR("nil wrapper returned for url %@: %@"), v13, v10);

    }
  }
  else
  {
    v9 = 0;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __FPSetAlternateContentsURLOnDocumentURL_block_invoke;
  v17[3] = &unk_1E444A930;
  v18 = v7;
  v19 = v6;
  v20 = v5;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v8, "setAlternateContentsURL:onDocumentURL:completionHandler:", v9, v15, v17);

}

void FPFetchAlternateContentsURLForDocumentURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = a1;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPFetchAlternateContentsURLForDocumentURL_block_invoke;
  v8[3] = &unk_1E444ABC0;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "fetchAlternateContentsURLForDocumentURL:completionHandler:", v7, v8);

}

void FPAppHasNonUploadedFiles(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPAppHasNonUploadedFiles_block_invoke;
  v8[3] = &unk_1E4449CB0;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "appHasNonUploadedFiles:completionHandler:", v7, v8);

}

uint64_t FPAuthorizeCallWithAuditToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 1, 0);
}

void FPDidUpdateAlternateContentsDocumentForDocumentAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = a1;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke;
  v8[3] = &unk_1E4449AF8;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:", v7, v8);

}

void legacy_FPUniversalBookmarkableStringFromDocumentURL(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = a1;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke;
  v15[3] = &unk_1E444BE20;
  v6 = v3;
  v17 = v6;
  v7 = v4;
  v16 = v7;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2;
  v11[3] = &unk_1E444BDF8;
  v12 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v15);
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v12;
  objc_msgSend(v10, "FPUniversalBookmarkableStringFromDocumentURL:completionHandler:", v9, v11);

}

void legacy_FPDocumentURLFromUniversalBookmarkableString(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke;
  v11[3] = &unk_1E444A840;
  v5 = v3;
  v12 = v5;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2;
  v8[3] = &unk_1E444ABC0;
  v9 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v11);
  v10 = v5;
  v6 = v5;
  v7 = v9;
  objc_msgSend(v7, "FPDocumentURLFromUniversalBookmarkableString:completionHandler:", a1, v8);

}

void FPPauseSyncForFileAtURL(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v4, v5);

}

void FPResumeSyncForFileAtURL(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v4, v5);

}

void FPResumeSyncForFileAtURLWithOptions(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a3)[2](v4, v5);

}

void FPPauseSyncForFileAtURLWithBehavior(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a1;
  v6 = a3;
  if ((objc_msgSend(v5, "fp_matchesFileProviderHeuristics:", geteuid()) & 1) != 0)
  {
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __FPPauseSyncForFileAtURLWithBehavior_block_invoke;
    v9[3] = &unk_1E4449A88;
    v10 = v6;
    objc_msgSend(v7, "pauseSyncForItemAtURL:behavior:bundleID:completionHandler:", v5, a2, 0, v9);

  }
  else
  {
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);

  }
}

void FPResumeSyncForFileAtURLWithBehavior(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a1;
  v6 = a3;
  if ((objc_msgSend(v5, "fp_matchesFileProviderHeuristics:", geteuid()) & 1) != 0)
  {
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __FPResumeSyncForFileAtURLWithBehavior_block_invoke;
    v9[3] = &unk_1E4449A88;
    v10 = v6;
    objc_msgSend(v7, "resumeSyncForItemAtURL:behavior:bundleID:completionHandler:", v5, a2, 0, v9);

  }
  else
  {
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);

  }
}

void FPGetPausedFilesList(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPGetPausedFilesList_block_invoke;
  v8[3] = &unk_1E444BF90;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "listPausedURLsWithBundleID:completionHandler:", 0, v8);

}

void FPFetchLatestVersionForFileAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v3, "fp_matchesFileProviderHeuristics:", geteuid()) & 1) != 0)
  {
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __FPFetchLatestVersionForFileAtURL_block_invoke;
    v7[3] = &unk_1E444BFB8;
    v9 = v4;
    v8 = v3;
    objc_msgSend(v5, "fetchLatestVersionForItemAtURL:bundleID:completionHandler:", v8, 0, v7);

  }
  else
  {
    FPNotSupportedError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

void _fetchProviderForProviderDomainID(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___fetchProviderForProviderDomainID_block_invoke;
  v5[3] = &unk_1E444AB08;
  v6 = v3;
  v4 = v3;
  +[FPProviderDomain fetchProviderDomainWithID:completionHandler:](FPProviderDomain, "fetchProviderDomainWithID:completionHandler:", a1, v5);

}

void ___fetchProviderForProviderDomainID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v8 || v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if ((objc_msgSend(v8, "isEnabled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("provider isn't enabled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_8;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();
LABEL_8:

}

void _fetchItemForItemID(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = a1;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___fetchItemForItemID_block_invoke;
  v7[3] = &unk_1E444BFE0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fetchItemForItemID:completionHandler:", v4, v7);

}

uint64_t ___fetchItemForItemID_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t FPCreateCrossDeviceItemIDForItemAtURL(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke;
  v8[3] = &unk_1E444BEF0;
  v10 = &v12;
  v11 = a2;
  v5 = v4;
  v9 = v5;
  FPCrossDeviceItemIDForItemAtURL(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A0AB7F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPCrossDeviceItemIDForItemAtURL(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    FPCrossDeviceItemIDForItemAtURL_cold_1();

  if (a1)
  {
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __FPCrossDeviceItemIDForItemAtURL_block_invoke;
    v6[3] = &unk_1E444BFE0;
    v7 = v3;
    objc_msgSend(v5, "fetchItemForURL:completionHandler:", a1, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("itemURL required to fetch cross-device itemID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v5);
  }

}

void FPCrossDeviceItemIDForItemID(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v3 = a1;
  v4 = a2;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    FPCrossDeviceItemIDForItemID_cold_1();

  if (v3)
  {
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __FPCrossDeviceItemIDForItemID_block_invoke;
    v36[3] = &unk_1E444C008;
    v8 = v4;
    v38 = v8;
    v9 = v3;
    v37 = v9;
    v10 = (void *)MEMORY[0x1A1B00850](v36);
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __FPCrossDeviceItemIDForItemID_block_invoke_59;
    v33[3] = &unk_1E444C058;
    v11 = v8;
    v34 = v11;
    v35 = v10;
    v12 = v10;
    v13 = (void *)MEMORY[0x1A1B00850](v33);
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __FPCrossDeviceItemIDForItemID_block_invoke_4;
    v29[3] = &unk_1E444C0A8;
    v14 = v11;
    v31 = v14;
    v32 = v13;
    v30 = v6;
    v15 = v6;
    v16 = v13;
    v17 = (void *)MEMORY[0x1A1B00850](v29);
    v22 = v7;
    v23 = 3221225472;
    v24 = __FPCrossDeviceItemIDForItemID_block_invoke_6;
    v25 = &unk_1E444C0F8;
    v27 = v14;
    v18 = v9;
    v26 = v18;
    v28 = v17;
    v19 = v17;
    v20 = (void *)MEMORY[0x1A1B00850](&v22);
    objc_msgSend(v18, "providerDomainID", v22, v23, v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _fetchProviderForProviderDomainID((uint64_t)v21, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("itemID required to fetch cross-device itemID"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v15);
  }

}

uint64_t FPCreateCrossDeviceItemIDForItemID(void *a1, uint64_t a2)
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPCreateCrossDeviceItemIDForItemID_block_invoke;
  v8[3] = &unk_1E444BEF0;
  v10 = &v12;
  v11 = a2;
  v5 = v4;
  v9 = v5;
  FPCrossDeviceItemIDForItemID(v3, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A0AB84AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FPGetItemURLForCrossDeviceItemID(void *a1, uint64_t a2)
{
  dispatch_semaphore_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPGetItemURLForCrossDeviceItemID_block_invoke;
  v8[3] = &unk_1E444C120;
  v10 = &v12;
  v11 = a2;
  v5 = v4;
  v9 = v5;
  FPItemURLForCrossDeviceItemID(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A0AB8C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPItemURLForCrossDeviceItemID(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  void *v37;

  v3 = a2;
  if (a1)
    CFRetain(a1);
  v4 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __FPItemURLForCrossDeviceItemID_block_invoke;
  v35[3] = &unk_1E444C148;
  v37 = a1;
  v5 = v3;
  v36 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1B00850](v35);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    FPItemURLForCrossDeviceItemID_cold_1();

  if (a1)
  {
    v32[0] = v4;
    v32[1] = 3221225472;
    v32[2] = __FPItemURLForCrossDeviceItemID_block_invoke_66;
    v32[3] = &unk_1E444C170;
    v8 = v6;
    v33 = v8;
    v34 = a1;
    v9 = (void *)MEMORY[0x1A1B00850](v32);
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __FPItemURLForCrossDeviceItemID_block_invoke_70;
    v28[3] = &unk_1E444C1C0;
    v10 = v8;
    v29 = v10;
    v31 = a1;
    v11 = v9;
    v30 = v11;
    v12 = (void *)MEMORY[0x1A1B00850](v28);
    v13 = a1;
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("deviceSpecific")))
    {
      objc_msgSend(v13, "substringFromIndex:", objc_msgSend(CFSTR("deviceSpecific"), "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "hasPrefix:", CFSTR(":")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("crossDeviceItemID has an invalid format"));
        v17 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v17);
        goto LABEL_17;
      }
      objc_msgSend(v14, "substringFromIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "rangeOfString:", CFSTR(":"));
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("crossDeviceItemID has an invalid format"));
        v17 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v17);
        v14 = v15;
LABEL_17:

        v18 = v33;
        goto LABEL_18;
      }
      v21 = v16;
      objc_msgSend(v15, "substringToIndex:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "substringFromIndex:", v21 + 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("fp:")))
    {
      v25[0] = v4;
      v25[1] = 3221225472;
      v25[2] = __FPItemURLForCrossDeviceItemID_block_invoke_2;
      v25[3] = &unk_1E444C1E8;
      v26 = v19;
      v27 = v12;
      v17 = v19;
      FPDocumentURLFromBookmarkableString((uint64_t)v13, v25);

      v20 = v27;
    }
    else
    {
      v22[0] = v4;
      v22[1] = 3221225472;
      v22[2] = __FPItemURLForCrossDeviceItemID_block_invoke_3;
      v22[3] = &unk_1E444C1E8;
      v23 = v19;
      v24 = v12;
      v17 = v19;
      legacy_FPDocumentURLFromUniversalBookmarkableString((uint64_t)v13, v22);

      v20 = v24;
    }

    v14 = v13;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("crossDeviceItemID required to resolve itemURL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v18);
LABEL_18:

}

id FPGetItemIDFromCrossDeviceItemID(void *a1, uint64_t a2)
{
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPGetItemIDFromCrossDeviceItemID_block_invoke;
  v8[3] = &unk_1E444C210;
  v10 = &v12;
  v11 = a2;
  v5 = v4;
  v9 = v5;
  FPItemIDFromCrossDeviceItemID(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A0AB952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPItemIDFromCrossDeviceItemID(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void *v14;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    FPItemIDFromCrossDeviceItemID_cold_1();

  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __FPItemIDFromCrossDeviceItemID_block_invoke;
  v12[3] = &unk_1E444C238;
  v6 = v3;
  v13 = v6;
  v14 = a1;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __FPItemIDFromCrossDeviceItemID_block_invoke_80;
  v9[3] = &unk_1E444C260;
  v10 = v6;
  v11 = (id)MEMORY[0x1A1B00850](v12);
  v7 = v11;
  v8 = v6;
  FPItemURLForCrossDeviceItemID(a1, v9);

}

void OUTLINED_FUNCTION_11_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_1A0ABA384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 104));
  objc_destroyWeak((id *)(v11 - 96));
  _Unwind_Resume(a1);
}

void sub_1A0ABAC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ABB65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPGetImportCookieForURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __FPGetImportCookieForURL_block_invoke;
  v8[3] = &unk_1E444C398;
  v8[4] = &v9;
  v8[5] = &v15;
  objc_msgSend(v4, "readImportCookieDataForVolumeAtURL:handler:", v3, v8);

  if (a2)
  {
    v5 = (void *)v10[5];
    if (v5)
      *a2 = objc_retainAutorelease(v5);
  }
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void sub_1A0ABB958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ExpirationInterval()
{
  void *v0;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "doubleForKey:", CFSTR("com.apple.fileproviderd.importCookieExpiration"));

  }
}

uint64_t FPWriteImportCookieForDomainURL(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  FPImportCookie *v8;
  FPImportCookieEntry *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a1;
  v6 = a2;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    FPWriteImportCookieForDomainURL_cold_1(v5);

  v8 = -[FPImportCookie initWithURL:error:]([FPImportCookie alloc], "initWithURL:error:", v5, a3);
  if (v8)
  {
    v9 = -[FPImportCookieEntry initWithDomainURL:displayName:error:]([FPImportCookieEntry alloc], "initWithDomainURL:displayName:error:", v5, v6, a3);
    if (v9)
    {
      -[FPImportCookie addEntry:](v8, "addEntry:", v9);
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D25D48], "manager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "storeImportCookieData:forVolumeURL:error:", v10, v5, a3);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t FPClearImportCookieForDomainURL(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;

  v3 = a1;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    FPClearImportCookieForDomainURL_cold_1(v3);

  FPPathRelativeToVolumeRoot(v3, 0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = 0;
    FPGetImportCookieForURL(v3, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v6, "removeEntryForPathRelativeToVolumeRoot:", v5);
      if (objc_msgSend(v6, "isEmpty"))
      {
        objc_msgSend(MEMORY[0x1E0D25D48], "manager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "storeImportCookieData:forVolumeURL:error:", 0, v3, a2);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D25D48], "manager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "storeImportCookieData:forVolumeURL:error:", v9, v3, a2);

      }
    }
    else if (v7)
    {
      v10 = 0;
      if (a2)
        *a2 = objc_retainAutorelease(v7);
    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t FPIsImportingInVolumeAtURL(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;

  FPGetImportCookieForURL(a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEmpty") & 1) == 0)
  {
    v7 = objc_msgSend(v4, "hasExpired");
    v5 = v7 ^ 1u;
    if (a2 && (v7 & 1) == 0)
    {
      objc_msgSend(v4, "providersWithOngoingImport");
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t FPIsImportingDomainsForUserURL(void *a1, void **a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  FPGetImportCookieForURL(v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "isEmpty") & 1) != 0 || (objc_msgSend(v4, "hasExpired") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v4;
    objc_msgSend(v4, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v9)
    {
      v10 = v9;
      v36 = 0;
      v37 = *(_QWORD *)v39;
      v11 = 0x1E0C99000uLL;
      v33 = v2;
      v34 = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v37)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v14 = *(void **)(v11 + 3736);
          objc_msgSend(v13, "domainPathRelativeToVolumeRoot");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileURLWithPath:isDirectory:", v15, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          FPPathRelativeToVolumeRoot(v2, 0, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = v11;
            objc_msgSend(*(id *)(v11 + 3736), "fileURLWithPath:isDirectory:", v17, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v19, "fp_relationshipToItemAtURL:", v16) <= 1)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timeIntervalSinceReferenceDate");
              v22 = v21;

              ExpirationInterval();
              v24 = v23;
              objc_msgSend(v13, "creationTime");
              v26 = v22 - v25;
              if (v26 >= v24 || a2 == 0)
              {
                v36 |= v26 < v24;
              }
              else
              {
                v28 = *a2;
                v29 = *a2;
                if (!*a2)
                {
                  v29 = (void *)objc_opt_new();
                  v32 = v29;
                }
                objc_msgSend(v13, "displayName");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setByAddingObject:", v30);
                *a2 = (id)objc_claimAutoreleasedReturnValue();

                if (!v28)
                v36 = 1;
                v2 = v33;
                v8 = v34;
              }
            }

            v11 = v18;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v10);
    }
    else
    {
      v36 = 0;
    }

    v4 = v31;
    v5 = v36;
  }

  return v5 & 1;
}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A0ABCC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ABCDA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ABD1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0ABD2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0ABD6D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ABDBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  objc_sync_exit(v22);
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1A0ABDFA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ABE134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ABE198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0ABE390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;

  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1A0ABE4B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPPathComponentsForFPItems(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FPPathComponentDisplayMetadata *v15;
  void *v16;
  FPPathComponentDisplayMetadata *v17;
  void *v18;
  id v20;
  id obj;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v24 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v3;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v4)
    {
      v5 = v4;
      v22 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(obj);
          v7 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v8 = v24;
          objc_msgSend(v7, "itemIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier"));

          if (v10)
          {
            objc_msgSend(v8, "domainFullDisplayName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "topLevelBundleURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 0;
            v14 = 0;
          }
          else
          {
            if (objc_msgSend(v7, "isContainer"))
            {
              objc_msgSend(v7, "containerDisplayName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "domainFullDisplayName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "fp_appContainerBundleIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v7, "displayName");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = 0;
              v14 = 0;
            }
            v12 = 0;
          }
          v15 = [FPPathComponentDisplayMetadata alloc];
          objc_msgSend(v7, "fileURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[FPPathComponentDisplayMetadata initWithURL:displayName:suffix:bundleID:bundleURL:](v15, "initWithURL:displayName:suffix:bundleID:bundleURL:", v16, v11, v13, v14, v12);

          objc_msgSend(v23, "addObject:", v17);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v5);
    }

    v18 = (void *)objc_msgSend(v23, "copy");
    v3 = v20;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

void sub_1A0ABFCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A0ABFEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AC00A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AC02A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AC12C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AC14A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPExecutableNameForAuditToken()
{
  audit_token_t *v0;
  void *v1;
  void *v2;
  _BYTE buffer[4096];
  uint64_t v5;

  v0 = (audit_token_t *)MEMORY[0x1E0C80A78]();
  v5 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath_audittoken(v0, buffer, 0x1000u) < 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", buffer, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FPEntitlementValueForAuditToken(void *a1, _OWORD *a2)
{
  __CFString *v3;
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  audit_token_t v9;

  v3 = a1;
  v4 = a2[1];
  *(_OWORD *)v9.val = *a2;
  *(_OWORD *)&v9.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &v9);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, v3, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id FPOSVersion()
{
  if (FPOSVersion_pred != -1)
    dispatch_once(&FPOSVersion_pred, &__block_literal_global_17_0);
  return (id)FPOSVersion_OSVersion;
}

const __CFString *FPVersion()
{
  return CFSTR("2732.0.85");
}

uint64_t FPFSProviderIsDeniedForFPFS(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = FPFSProviderIsDeniedForFPFS_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&FPFSProviderIsDeniedForFPFS_onceToken, &__block_literal_global_28_0);
  v3 = objc_msgSend((id)FPFSProviderIsDeniedForFPFS_blacklistedProviders, "containsObject:", v2);

  return v3;
}

BOOL FPPinningSupportedForItem(void *a1)
{
  id v1;
  void *v2;
  int IsEnabledForDomainID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v13;
  char v14;

  v1 = a1;
  objc_msgSend(v1, "providerDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEnabledForDomainID = FPPinningIsEnabledForDomainID(v2);

  if (!IsEnabledForDomainID)
    goto LABEL_9;
  if (FPPinningSupportedForItem_onceToken != -1)
    dispatch_once(&FPPinningSupportedForItem_onceToken, &__block_literal_global_33);
  v4 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  objc_msgSend(v1, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
  {

LABEL_8:
    goto LABEL_9;
  }
  v7 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  objc_msgSend(v1, "providerItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v1, "symlinkTargetPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      goto LABEL_8;
    objc_msgSend(v1, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC5D8]);

    if ((v14 & 1) == 0)
    {
      v11 = (objc_msgSend(v1, "capabilities") & 0x10000000) != 0;
      goto LABEL_10;
    }
  }
LABEL_9:
  v11 = 0;
LABEL_10:

  return v11;
}

uint64_t FPPinningIsEnabledForDomainID(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v1, "fp_toProviderID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "fp_isiCloudDriveOrCloudDocsIdentifier") & 1) != 0
      || objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.FruitBasket.Provider"))
      && (os_variant_has_internal_content() & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("TestSyncEngine"));
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t FPFeatureFlagFPFSSimIsEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t StorageManagementFeatureFlagStorageUIV2IsEnabled()
{
  return _os_feature_enabled_impl();
}

const __CFString *FPCloudDocsProviderID()
{
  if (FPIsCloudDocsWithFPFSEnabled_onceToken != -1)
    dispatch_once(&FPIsCloudDocsWithFPFSEnabled_onceToken, &__block_literal_global_54);
  if (FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled)
    return CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  else
    return CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
}

id _getBootUUID()
{
  int v0;
  void *v1;
  size_t v3;
  _BYTE v4[37];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v3 = 37;
  v0 = sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0);
  v1 = 0;
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

BOOL FPVolumeFPFSSupported(uint64_t a1, int a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t VEKState;
  _BOOL8 result;
  id v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2 && (_os_feature_enabled_impl() & 1) == 0)
  {
    if (a3)
      *a3 = 1;
    if (a4)
    {
      FPNotSupportedError();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  v8 = a1 + 1112;
  v9 = *(_DWORD *)(a1 + 48);
  v10 = *(_DWORD *)(a1 + 64);
  if ((v10 & 1) == 0)
  {
    v11 = 0;
    if ((v10 & 0x1000) != 0)
      goto LABEL_5;
LABEL_11:
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v21 = a1 + 1112;
      v22 = 1024;
      v23 = v9;
      _os_log_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: non-local", buf, 0x12u);
    }

    if (!a3)
      return 0;
    v11 |= 0x10uLL;
    if ((*(_DWORD *)(a1 + 64) & 0x400) == 0)
      goto LABEL_19;
LABEL_15:
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v21 = a1 + 1112;
      v22 = 1024;
      v23 = v9;
      _os_log_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: quarantined", buf, 0x12u);
    }

    if (!a3)
      return 0;
    v11 |= 0x20uLL;
    goto LABEL_19;
  }
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v21 = a1 + 1112;
    v22 = 1024;
    v23 = v9;
    _os_log_impl(&dword_1A0A34000, v12, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: R/O volume", buf, 0x12u);
  }

  if (!a3)
    return 0;
  v10 = *(_DWORD *)(a1 + 64);
  v11 = 8;
  if ((v10 & 0x1000) == 0)
    goto LABEL_11;
LABEL_5:
  if ((v10 & 0x400) != 0)
    goto LABEL_15;
LABEL_19:
  if (!strcasecmp("apfs", (const char *)(a1 + 72)))
    goto LABEL_24;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v21 = v8;
    v22 = 1024;
    v23 = v9;
    _os_log_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: non-apfs", buf, 0x12u);
  }

  if (a3)
  {
    v11 |= 6uLL;
LABEL_24:
    if (!a2 || (v11 & 2) != 0)
    {
LABEL_28:
      if (!a3)
        return v11 == 0;
LABEL_29:
      *a3 = v11;
      return v11 == 0;
    }
    VEKState = APFSVolumeGetVEKState();
    if ((_DWORD)VEKState == 22)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        v21 = v8;
        v22 = 1024;
        v23 = v9;
        _os_log_impl(&dword_1A0A34000, v19, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: unencrypted", buf, 0x12u);
      }

      if (a3)
      {
        v11 |= 4uLL;
        goto LABEL_29;
      }
    }
    else
    {
      if (!(_DWORD)VEKState)
        goto LABEL_28;
      if (a3)
        *a3 = 1;
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", VEKState);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return 0;
}

uint64_t FPIsFPCKXPCServiceEnabled()
{
  uint64_t result;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  result = os_variant_has_internal_content();
  if ((_DWORD)result)
  {
    if (FPIsFPCKXPCServiceEnabled_onceToken != -1)
      dispatch_once(&FPIsFPCKXPCServiceEnabled_onceToken, &__block_literal_global_57);
    return FPIsFPCKXPCServiceEnabled_featureEnabledByDefault != 0;
  }
  return result;
}

void sub_1A0AC2990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AC2A34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___onceToken != -1)
    dispatch_once(&__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___onceToken, &__block_literal_global_225);
  if (__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___isFatal)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enumerator for %@ attempted to return more than %lu items in one page/batch. Use the -suggestedBatchSize/suggestedPageSize methods to determine a reasonable number of items per page. Break on %s to debug this."), v1, 20000, "__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = v3;
      _os_log_fault_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 171, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412802;
    v6 = v1;
    v7 = 2048;
    v8 = 20000;
    v9 = 2080;
    v10 = "__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__";
    _os_log_fault_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_FAULT, "[CRIT] Enumerator for %@ attempted to return more than %lu items in one page/batch. Use the -suggestedBatchSize/suggestedPageSize methods to determine a reasonable number of items per page. Break on %s to debug this.", buf, 0x20u);
  }

}

void __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-finish* was called more than once on the observer for %@, only the first call is taken into account"), v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = v3;
      _os_log_fault_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 158, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = v1;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] -finish* was called more than once on the observer for %{public}@, only the first call is taken into account", buf, 0xCu);
  }

}

void sub_1A0AC543C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0AC55AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0AC5B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  __fp_pop_log(&a28);
  _Unwind_Resume(a1);
}

void sub_1A0AC6054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0AC64E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0AC6DE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0AC8358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ACAB54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(exception_object);
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a17, "predicate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.7(v20, (uint64_t)v18, v17 - 256, v19);
    }

    objc_end_catch();
    JUMPOUT(0x1A0ACA6ECLL);
  }
  _Unwind_Resume(exception_object);
}

id fp_backtrace()
{
  char v1[8192];
  uint64_t v2;

  MEMORY[0x1E0C80A78]();
  v2 = *MEMORY[0x1E0C80C00];
  bzero(v1, 0x2000uLL);
  fp_backtrace_snprint(v1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void fp_backtrace_exception_snprint(char *a1, size_t a2, void *a3)
{
  id v5;
  id v6;

  objc_msgSend(a3, "callStackSymbols");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  snprintf(a1, a2, "%s", (const char *)objc_msgSend(v5, "UTF8String"));

}

void FPCaptureLogsForOperation(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%ld"), v9, objc_msgSend(v7, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "underlyingErrors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v23 = v5;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v7, "underlyingErrors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        v17 = v10;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
          objc_msgSend(v18, "domain");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(";%@.%ld"), v19, objc_msgSend(v18, "code"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v10;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v14);
    }

    v5 = v23;
  }
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = v5;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v10;
    _os_log_debug_impl(&dword_1A0A34000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Sending ABC report with signature: type = %@, subtype = %@, subtype context = %@", buf, 0x20u);
  }

  get_sd_reporter();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("FileProvider"), v5, v6, v10, CFSTR("fileproviderd"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "snapshotWithSignature:duration:events:payload:actions:reply:", v22, 0, 0, 0, &__block_literal_global_22, 15.0);

}

id get_sd_reporter()
{
  if (get_sd_reporter_onceToken != -1)
    dispatch_once(&get_sd_reporter_onceToken, &__block_literal_global_25);
  return (id)get_sd_reporter__diagnosticReporter;
}

void abc_report_assert_with_signature()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  char v27[8192];
  uint64_t v28;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v28 = *MEMORY[0x1E0C80C00];
  v1 = v0;
  v2 = v1;
  if ((unint64_t)objc_msgSend(v1, "length") >= 0x65)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":0x%lx"), objc_msgSend(v1, "hash"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringToIndex:", 100 - objc_msgSend(v3, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  get_sd_reporter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("Application"), CFSTR("Functional"), CFSTR("AssertionFailed"), CFSTR("fileproviderd"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0DB00F0]);
  bzero(v27, 0x2000uLL);
  fp_backtrace_snprint(v27);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  get_sd_reporter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = CFSTR("backtrace");
  v26 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "snapshotWithSignature:duration:event:payload:reply:", v6, v9, 0, &__block_literal_global_14_0, 15.0);

  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      abc_report_assert_with_signature_cold_1((uint64_t)v1, v12, v13, v14, v15, v16, v17, v18);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    abc_report_assert_with_signature_cold_2((uint64_t)v1, v12, v19, v20, v21, v22, v23, v24);
  }

}

void __abc_report_assert_with_signature_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __abc_report_assert_with_signature_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void fp_simulate_crash(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);
  getpid();
  SimulateCrash();
  abc_report_assert_with_signature();

}

void __fp_leave_section_Error(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __fp_leave_section_Error_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

id fssync_default_log()
{
  if (fssync_default_log_once != -1)
    dispatch_once(&fssync_default_log_once, &__block_literal_global_21_1);
  return (id)fssync_default_log_log;
}

void __fssync_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProvider", "fssync");
  v1 = (void *)fssync_default_log_log;
  fssync_default_log_log = (uint64_t)v0;

}

uint64_t fp_backtrace_snprint(char *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  const char *dli_sname;
  char *v7;
  const char *dli_fname;
  BOOL v9;
  Dl_info v10;
  void *v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)v11 = 0u;
  v12 = 0u;
  result = backtrace(v11, 24);
  if ((_DWORD)result)
  {
    v3 = 0;
    v4 = result;
    v5 = 0x2000;
    do
    {
      memset(&v10, 0, sizeof(v10));
      if (v3)
      {
        if (dladdr(v11[v3], &v10))
        {
          dli_sname = v10.dli_sname;
          v7 = rindex(v10.dli_fname, 47);
          dli_fname = v10.dli_fname;
          if (v7)
            dli_fname = v7 + 1;
        }
        else
        {
          dli_sname = "";
          dli_fname = "";
        }
        result = snprintf(a1, v5, "frame %d: %lld %s in %s\n", v3, v11[v3], dli_sname, dli_fname);
        v9 = v5 <= (int)result;
        v5 -= (int)result;
        if (v9)
          return result;
        a1 += (int)result;
      }
      ++v3;
    }
    while (v4 != v3);
  }
  return result;
}

void __get_sd_reporter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  v1 = (void *)get_sd_reporter__diagnosticReporter;
  get_sd_reporter__diagnosticReporter = (uint64_t)v0;

}

void __fpfs_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProvider", "fpfs");
  v1 = (void *)fpfs_default_log_log;
  fpfs_default_log_log = (uint64_t)v0;

}

uint64_t fpfs_get_dataless_cmpfs_xattr_owner(char *a1, uid_t *a2)
{
  ssize_t v4;
  int v6;
  int v7;
  int v8;
  _BYTE value[3802];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  bzero(value, 0xEDAuLL);
  v4 = getxattr(a1, "com.apple.decmpfs", value, 0xEDAuLL, 0, 33);
  if (v4 < 0
    && (*__error() != 63
     || !fpfs_supports_long_paths()
     || (v6 = fpfs_open_longpath(a1, 2097156, 0), v6 < 0)
     || (v7 = v6,
         v4 = fgetxattr(v6, "com.apple.decmpfs", value, 0xEDAuLL, 0, 32),
         v8 = *__error(),
         close(v7),
         *__error() = v8,
         v4 < 0)))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return fpfs_parse_cmpfs_xattr((uint64_t)value, v4, a2, 0);
  }
}

uint64_t fpfs_parse_cmpfs_xattr(uint64_t a1, unint64_t a2, uid_t *a3, _DWORD *a4)
{
  int *v4;
  int v5;
  int v7;
  uint64_t result;
  passwd *v12;
  int v13;
  int id_type[2];
  unsigned __int8 uu[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 < 0x14)
    goto LABEL_2;
  if (*(_DWORD *)a1 != 1668116582 || (*(_DWORD *)(a1 + 4) + 0x7FFFFFFF) >= 2)
  {
    v4 = __error();
    v5 = 45;
    goto LABEL_9;
  }
  v7 = *(_DWORD *)(a1 + 16);
  if ((v7 & 2) == 0)
  {
LABEL_2:
    v4 = __error();
    v5 = 96;
LABEL_9:
    *v4 = v5;
    return 0xFFFFFFFFLL;
  }
  if (a2 - 20 <= 0xF)
  {
    v4 = __error();
    v5 = 100;
    goto LABEL_9;
  }
  *(_OWORD *)uu = *(_OWORD *)(a1 + 20);
  v12 = getpwuuid(uu);
  if (a3 && v12)
    *a3 = v12->pw_uid;
  *(_QWORD *)id_type = 0;
  v13 = mbr_uuid_to_id(uu, (id_t *)&id_type[1], id_type);
  if (v13 | id_type[0] || !a3)
  {
    if (v13 | id_type[0])
      return 0xFFFFFFFFLL;
  }
  else
  {
    *a3 = id_type[1];
  }
  result = 0;
  if (a4 && (v7 & 4) != 0)
  {
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x24)
    {
      result = 0;
      *a4 = *(char *)(a1 + 36);
      return result;
    }
    *__error() = 100;
    if (*__error() == 100)
    {
      result = 0;
      *a4 = 0;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _check_afsc_file(int a1)
{
  stat v2;

  memset(&v2, 0, sizeof(v2));
  if (fstat(a1, &v2) < 0)
    return 0xFFFFFFFFLL;
  if ((v2.st_flags & 0x40000020) == 0x20)
  {
    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t _fset_dataless_cmpfs_xattr(int a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  int v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD v16[2];
  _DWORD v17[2];
  unint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((_check_afsc_file(a1) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  bzero(v17, 0xEDAuLL);
  if (fpfs_supports_purge_reasons())
    v10 = 6;
  else
    v10 = 2;
  switch(a2)
  {
    case 1:
      v11 = -2147483647;
      break;
    case 3:
      a3 = a3 & 0xFFFFFFFFFFLL | ((unint64_t)a4 << 40);
      v11 = -2147483646;
      break;
    case 2:
      v11 = -2147483647;
      a3 = a4;
      break;
    default:
      *__error() = 22;
      v13 = -1;
      goto LABEL_14;
  }
  v17[0] = 1668116582;
  v17[1] = v11;
  v18 = a3;
  v19 = v10;
  v13 = 20;
LABEL_14:
  xfield_identity_encode((_DWORD *)((char *)v17 + v13));
  v14 = v13 + 16;
  v15 = fpfs_supports_purge_reasons();
  if (a5)
  {
    if (v15)
    {
      *(_DWORD *)((char *)v17 + v14) = a5;
      v14 = v13 + 20;
    }
  }
  v16[0] = v17;
  v16[1] = v14;
  return ffsctl(a1, 0x80104A39uLL, v16, 0);
}

double xfield_identity_encode(_OWORD *a1)
{
  double result;

  if (_get_current_user_uuid_once_token != -1)
    dispatch_once(&_get_current_user_uuid_once_token, &__block_literal_global_11_0);
  result = *(double *)&_get_current_user_uuid_uuid_cached;
  *a1 = _get_current_user_uuid_uuid_cached;
  return result;
}

uint64_t _fset_dataless_cmpfs_xattr_only(int a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  int v10;
  int v11;
  uint64_t v13;
  size_t v14;
  int v15;
  _DWORD v16[2];
  unint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((_check_afsc_file(a1) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  bzero(v16, 0xEDAuLL);
  if (fpfs_supports_purge_reasons())
    v10 = 6;
  else
    v10 = 2;
  switch(a2)
  {
    case 1:
      v11 = -2147483647;
      break;
    case 3:
      a3 = a3 & 0xFFFFFFFFFFLL | ((unint64_t)a4 << 40);
      v11 = -2147483646;
      break;
    case 2:
      v11 = -2147483647;
      a3 = a4;
      break;
    default:
      *__error() = 22;
      v13 = -1;
      goto LABEL_14;
  }
  v16[0] = 1668116582;
  v16[1] = v11;
  v17 = a3;
  v18 = v10;
  v13 = 20;
LABEL_14:
  xfield_identity_encode((_DWORD *)((char *)v16 + v13));
  v14 = v13 + 16;
  v15 = fpfs_supports_purge_reasons();
  if (a5)
  {
    if (v15)
    {
      *(_DWORD *)((char *)v16 + v14) = a5;
      v14 = v13 + 20;
    }
  }
  return fpfs_fsetxattr(a1, "com.apple.decmpfs", v16, v14, 0, 0);
}

uint64_t sim_fset_dataless_cmpfs_xattr(int a1, int a2, unint64_t a3, unint64_t a4)
{
  return _fset_dataless_cmpfs_xattr(a1, a2, a3, a4, 0);
}

uint64_t fpfs_set_dataless_cmpfs_xattr(int a1, uint64_t a2)
{
  return _fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208));
}

uint64_t fpfs_set_dataless_cmpfs_attrs(int a1, uint64_t a2)
{
  return _fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208));
}

BOOL fpfs_is_type_purgeable(int a1)
{
  return ((a1 - 1) & 0xFFFFFFFD) == 0;
}

uint64_t fpfs_update_purgency(int a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[3];

  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (ffsctl(a1, 0x40304A6DuLL, &v10, 0) < 0)
  {
    fpfs_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      fpfs_update_purgency_cold_1();

    return 0xFFFFFFFFLL;
  }
  if ((BYTE1(v10) & 1) == 0)
  {
    fpfs_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      fpfs_update_purgency_cold_2(v4, v5, v6);

    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  v9 = a2 | 0x10104;
  if (DWORD2(v11))
    v9 = a2 | 0x10104 | (*((_QWORD *)&v11 + 1) << 32) | 0x20000;
  v13[0] = v9;
  v13[1] = v12;
  v13[2] = 0;
  return ffsctl(a1, 0xC0184A4FuLL, v13, 0);
}

uint64_t fpfs_set_evictable(int a1, uint64_t a2)
{
  int v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[3];

  v3 = *(_DWORD *)(a2 + 40);
  if (((v3 - 1) & 0xFFFFFFFD) != 0)
    return 0;
  if ((_fset_dataless_cmpfs_xattr_only(a1, v3, *(_QWORD *)(a2 + 56), *(unsigned int *)(a2 + 144), 0) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((*(_BYTE *)(a2 + 44) & 0x20) == 0 || (v6 = *(_QWORD *)(a2 + 240)) == 0)
  {
    fpfs_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      fpfs_set_evictable_cold_1();

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  v7 = *(unsigned int *)(a2 + 20);
  v8 = v6 | 0x10104;
  v9 = v8 | (v7 << 32) | 0x20000;
  v10 = (_DWORD)v7 == 0;
  v11 = *(_QWORD *)(a2 + 160);
  if (!v10)
    v8 = v9;
  v13[0] = v8;
  v13[1] = v11;
  v13[2] = 0;
  return ffsctl(a1, 0xC0184A4FuLL, v13, 0);
}

uint64_t fpfs_unset_evictable(int a1, uint64_t a2)
{
  char v4;
  uint64_t v6;

  if (a2)
  {
    if ((*(_BYTE *)(a2 + 44) & 1) != 0 && *(_DWORD *)(a2 + 40) == 1)
      v4 = fpfs_supports_partial_materialization();
    else
      v4 = 0;
    if (((*(_DWORD *)(a2 + 40) - 1) & 0xFFFFFFFD) != 0)
      return 0;
    v6 = 0;
    if (ffsctl(a1, 0xC0084A44uLL, &v6, 0) < 0)
      return 0xFFFFFFFFLL;
    if ((v4 & 1) != 0)
      return 0;
  }
  else
  {
    v6 = 0;
    if (ffsctl(a1, 0xC0084A44uLL, &v6, 0) < 0)
      return 0xFFFFFFFFLL;
  }
  if ((_unset_dataless_cmpfs_xattr(a1) & 0x80000000) == 0)
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t _unset_dataless_cmpfs_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.decmpfs", 32) && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_get_purgeable_info(int a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  NSObject *v6;
  _OWORD v7[2];
  __int128 v8;

  v8 = 0u;
  memset(v7, 0, sizeof(v7));
  if (ffsctl(a1, 0x40304A6DuLL, v7, 0) < 0)
  {
    fpfs_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      fpfs_update_purgency_cold_1();

    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a2)
      *a2 = *(_QWORD *)&v7[0];
    result = 0;
    if (a3)
      *a3 = v8;
  }
  return result;
}

uint64_t fpfs_get_purgeable_stats(char *a1, _OWORD *a2)
{
  unint64_t v3;
  _QWORD **v4;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  NSObject *v9;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _QWORD v28[11];

  v3 = 0;
  v28[10] = *MEMORY[0x1E0C80C00];
  *a2 = 0u;
  v26 = 512;
  v27 = a2;
  a2[3] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  v28[0] = a2 + 2;
  v28[1] = 1024;
  v4 = (_QWORD **)v28;
  v28[2] = (char *)a2 + 8;
  v28[3] = (char *)a2 + 40;
  v28[4] = 2048;
  v28[5] = a2 + 1;
  v28[6] = a2 + 3;
  v28[7] = 0x8000;
  v5 = 1;
  v28[8] = (char *)a2 + 24;
  v28[9] = (char *)a2 + 56;
  while (1)
  {
    v6 = (uint64_t)*(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    v11[0] = 4;
    v11[1] = v6;
    if (fsctl(a1, 0xC0E84A70uLL, v11, 1u) < 0)
      break;
    *v7 += v19;
    *v8 += *((_QWORD *)&v12 + 1);
LABEL_5:
    v4 += 3;
    v5 = v3++ < 3;
    if (v3 == 4)
    {
      v5 = 0;
      return (v5 << 31 >> 31);
    }
  }
  if (*__error() == 1)
    goto LABEL_5;
  fpfs_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    fpfs_get_purgeable_stats_cold_1(v6, v9);

  return (v5 << 31 >> 31);
}

uint64_t fpfs_t_unset_evictable_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x200000u, 0, 0, (uint64_t)&__block_literal_global_23);
}

uint64_t __fpfs_t_unset_evictable_at_block_invoke(int a1, int a2)
{
  uint64_t v3;

  v3 = 0;
  return ffsctl(a2, 0xC0084A44uLL, &v3, 0);
}

uint64_t fpfs_set_purgeable_non_evictable(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = 66053;
  if (a2)
    v2 = a2;
  v4 = v2;
  return ffsctl(a1, 0xC0084A44uLL, &v4, 0);
}

uint64_t fpfs_t_set_purgeable_non_evictable_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x208000u, 0, 0, (uint64_t)&__block_literal_global_2_0);
}

uint64_t __fpfs_t_set_purgeable_non_evictable_at_block_invoke(int a1, int a2)
{
  uint64_t v3;

  v3 = 66059;
  return ffsctl(a2, 0xC0084A44uLL, &v3, 0);
}

uint64_t fpfs_t_is_evictable(int a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  if (a2)
  {
    if ((fpfs_eviction_urgency(a1, &v4) & 0x80000000) == 0)
    {
      result = 0;
      *a2 = v4 != 0;
      return result;
    }
  }
  else
  {
    *__error() = 22;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_eviction_urgency(int a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;

  if (!a2)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  if (fpfs_operation_is_allowed(1))
  {
    v5 = 0;
    if ((ffsctl(a1, 0x40084A47uLL, &v5, 0) & 0x80000000) == 0)
    {
      result = 0;
      *a2 = v5 & ((int)((_DWORD)v5 << 23) >> 31) & 0x8E00;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  result = 0;
  *a2 = 0;
  return result;
}

uint64_t fpfs_eviction_reason(int a1, _DWORD *a2)
{
  uint64_t result;
  stat v5;

  if ((fpfs_supports_purge_reasons() & 1) != 0)
  {
    if (!a2)
      goto LABEL_5;
    memset(&v5, 0, sizeof(v5));
    if (fstat(a1, &v5) < 0)
      return 0xFFFFFFFFLL;
    if ((v5.st_flags & 0x40000000) == 0)
    {
LABEL_5:
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    return fpfs_eviction_reason_from_xattr(a1, a2);
  }
  else
  {
    result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t fpfs_eviction_reason_from_xattr(int a1, _DWORD *a2)
{
  ssize_t v4;
  uint64_t result;
  _BYTE value[3802];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(value, 0xEDAuLL);
  v4 = fgetxattr(a1, "com.apple.decmpfs", value, 0xEDAuLL, 0, 32);
  if ((v4 & 0x8000000000000000) == 0)
    return fpfs_parse_cmpfs_xattr((uint64_t)value, v4, 0, a2);
  if (*__error() != 93)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = 0;
  return result;
}

uint64_t fpfs_unset_dataless_cmpfs_attrs(int a1, __int128 *a2)
{
  NSObject *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  LODWORD(v7) = 0;
  if (ffsctl(a1, 0x80044A7AuLL, &v7, 0) < 0)
  {
    if (*__error() == 1 || *__error() == 25)
    {
      if ((fpfs_fchflags(a1, 0x20u, 0) & 0x80000000) == 0)
        goto LABEL_5;
      fpfs_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        fpfs_unset_dataless_cmpfs_attrs_cold_1();
    }
    else
    {
      fpfs_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        fpfs_unset_dataless_cmpfs_attrs_cold_2();
    }

    return 0xFFFFFFFFLL;
  }
LABEL_5:
  if (!a2)
    return _unset_dataless_cmpfs_xattr(a1);
  v8 = 0;
  v6 = *a2;
  v7 = xmmword_1A0B53C7C;
  if ((fsetattrlist(a1, &v7, &v6, 0x10uLL, 0) & 0x80000000) == 0)
    return _unset_dataless_cmpfs_xattr(a1);
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_create_dataless_fault_at(uint64_t a1, char *a2, _DWORD *a3, int a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD v16[4];
  id v17;
  _DWORD *v18;
  int v19;

  v9 = a5;
  v10 = v9;
  switch(*a3)
  {
    case 0:
    case 4:
      *__error() = 22;
      v11 = 0xFFFFFFFFLL;
      goto LABEL_7;
    case 1:
      v12 = 0;
      v13 = 384;
      v14 = 2562;
      goto LABEL_6;
    case 2:
    case 3:
      v12 = 1;
      v13 = 448;
      v14 = 2048;
      goto LABEL_6;
    default:
      v14 = 0;
      v13 = 0;
      v12 = 0;
LABEL_6:
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __fpfs_create_dataless_fault_at_block_invoke;
      v16[3] = &unk_1E444CA98;
      v19 = a4;
      v18 = a3;
      v17 = v9;
      v11 = fpfs_openat(a1, a2, v14, v13, v12, (uint64_t)v16);

LABEL_7:
      return v11;
  }
}

uint64_t __fpfs_create_dataless_fault_at_block_invoke(uint64_t a1, int a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v10;

  v10 = 0;
  v4 = fpfs_supports_purge_reasons();
  if ((a2 & 0x80000000) == 0 && v4 && (fpfs_eviction_reason_from_xattr(a2, &v10) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v5 = *(_DWORD *)(a1 + 48);
  if ((v5 & 0x80000000) == 0 && fcopyfile(v5, a2, 0, 4u) < 0)
    return 0xFFFFFFFFLL;
  if ((_fset_dataless_cmpfs_xattr(a2, **(_DWORD **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 104), v10) & 0x80000000) != 0)return 0xFFFFFFFFLL;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_DWORD *)(v6 + 4);
  if ((v7 & 1) == 0)
    __fpfs_create_dataless_fault_at_block_invoke_cold_1();
  if ((v7 & 0x100) != 0)
    v8 = 0x1FBF38F07;
  else
    v8 = 0x1EBF38F07;
  return fpfs_fset_metadata(a2, v6, 0, v8);
}

uint64_t fpfs_update_dataless_fault(int a1, uint64_t a2, uint64_t a3)
{
  if ((fpfs_fset_metadata(a1, a2, 0, a3) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  else
    return ((int)_fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) >> 31);
}

uint64_t fpfs_update_dataless_fault_at(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __fpfs_update_dataless_fault_at_block_invoke;
  v13[3] = &unk_1E444CAC0;
  v15 = a3;
  v16 = a4;
  v14 = v9;
  v10 = v9;
  v11 = fpfs_openat(a1, a2, 0, 0, 0, (uint64_t)v13);

  return v11;
}

uint64_t __fpfs_update_dataless_fault_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_update_dataless_fault(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t fpfs_femptydir(int a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  int v14;
  int v15;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __fpfs_femptydir_block_invoke;
  v11[3] = &unk_1E444CAE8;
  v14 = a1;
  v15 = a3;
  v12 = v7;
  v13 = a2;
  v8 = v7;
  v9 = fpfs_fopendir(a1, (uint64_t)v11);

  return v9;
}

uint64_t __fpfs_femptydir_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  char *v5;
  NSObject *v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[8];
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[52];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*a2 == *(_QWORD *)(a1 + 40))
    return 0;
  v15 = 0;
  v14 = xmmword_1A0B53C94;
  memset(v21, 0, sizeof(v21));
  v5 = (char *)a2 + 21;
  if (getattrlistat(*(_DWORD *)(a1 + 48), (const char *)a2 + 21, &v14, v21, 0x34uLL, 0x21uLL))
    return 0xFFFFFFFFLL;
  if (*a2 != *(_QWORD *)&v21[44])
  {
    *__error() = 70;
    fpfs_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_DWORD *)(a1 + 48);
      v12 = *(_DWORD *)(a1 + 52);
      v13 = *a2;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = v11;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v12;
      HIWORD(v17) = 2048;
      v18 = v13;
      v19 = 2048;
      v20 = *(_QWORD *)&v21[44];
      _os_log_error_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_ERROR, "ESTALE: item changed between enumeration and lookup [%d, %u, %llu, %llu]", buf, 0x22u);
    }

    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 52) != 2)
  {
    *(_QWORD *)buf = 0;
    v17 = 0;
    fpfs_finder_info_deserialize((uint64_t)&v21[4], (uint64_t)buf);
    v7 = !fpfs_path_is_safe_save_temp_file(v5, *((unsigned __int8 *)a2 + 20) == 8);
    if ((v7 & 1) == 0 && *(_DWORD *)&v21[40])
    {
      v8 = *((unsigned __int8 *)a2 + 20);
      if (v8 == 8)
      {
        v7 = 1;
      }
      else
      {
        v9 = v8 == 4;
        v7 = (buf[0] >> 1) & 1;
        if (!v9)
          v7 = 0;
      }
    }
    v10 = *(_DWORD *)(a1 + 52);
    if (v10 || !v7)
    {
      if (!v10)
        LOBYTE(v7) = 0;
      if ((v7 & 1) == 0)
        goto LABEL_23;
    }
    else if ((v21[39] & 0x40) != 0 || *((_BYTE *)a2 + 20) == 10 || (buf[0] & 1) != 0)
    {
      goto LABEL_23;
    }
    goto LABEL_28;
  }
  if (strcmp(v5, ".localized") && strcmp(v5, ".DS_Store"))
  {
LABEL_28:
    *__error() = 66;
    return 0xFFFFFFFFLL;
  }
LABEL_23:
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t *, char *))(result + 16))(result, *(unsigned int *)(a1 + 48), a2, v5);
  return result;
}

void _fpfs_remove_sharing_xattrs(int a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;

  if ((fpfs_fset_collaboration_identifier(a1, 0) & 0x80000000) != 0)
  {
    fpfs_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      _fpfs_remove_sharing_xattrs_cold_4();

  }
  if ((fpfs_fset_is_shared(a1, 0) & 0x80000000) != 0)
  {
    fpfs_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _fpfs_remove_sharing_xattrs_cold_3();

  }
  if ((fpfs_fset_is_shared_by_current_user(a1, 0) & 0x80000000) != 0)
  {
    fpfs_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      _fpfs_remove_sharing_xattrs_cold_2();

  }
  if ((fpfs_fset_owner_name(a1, 0) & 0x80000000) != 0)
  {
    fpfs_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _fpfs_remove_sharing_xattrs_cold_1();

  }
}

uint64_t fpfs_recursive_prune_fault(char *a1, int a2)
{
  _removefile_state *v4;
  int v5;
  int v7;
  int v8;
  stat v9;
  _QWORD value[2];

  value[0] = 0;
  memset(&v9, 0, sizeof(v9));
  v8 = 0;
  if ((lstat(a1, &v9) & 0x80000000) == 0)
  {
    LODWORD(value[0]) = a2;
    value[1] = v9.st_ino;
    v4 = removefile_state_alloc();
    removefile_state_set(v4, 1u, _fpfs_prune_fault_confirm);
    removefile_state_set(v4, 2u, value);
    removefile_state_set(v4, 3u, _fpfs_prune_fault_error);
    removefile_state_set(v4, 6u, _fpfs_prune_fault_status);
    removefile_state_set(v4, 4u, &v8);
    v5 = removefile(a1, v4, 0x101u);
    removefile_state_free(v4);
    if ((v5 & 0x80000000) == 0)
    {
      fpfs_set_syncroot_at(4294967294, a1, 0);
      return 0;
    }
    v7 = v8;
    *__error() = v7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _fpfs_prune_fault_confirm(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___fpfs_prune_fault_confirm_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  v4[4] = a3;
  return fpfs_open(a2, 0x200000u, 0, 0, (uint64_t)v4) >> 31;
}

uint64_t _fpfs_prune_fault_error(_removefile_state *a1, uint64_t a2)
{
  NSObject *v3;
  int dst;

  dst = 0;
  removefile_state_get(a1, 5u, &dst);
  fpfs_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    _fpfs_prune_fault_error_cold_1(a2, &dst, v3);

  return 1;
}

uint64_t _fpfs_prune_fault_status(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  fpfs_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    _fpfs_prune_fault_status_cold_1(a2, v3);

  return 0;
}

uint64_t fpfs_lp_unlinkat(int a1, const char *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char *v11;

  v6 = unlinkat(a1, a2, a3);
  if ((v6 & 0x80000000) != 0 && *__error() == 63)
  {
    if (fpfs_supports_long_paths())
    {
      v11 = 0;
      v7 = fpfs_openat_longparent(a1, a2, &v11);
      v6 = v7;
      if ((v7 & 0x80000000) == 0)
      {
        v8 = unlinkat(v7, v11, a3);
        v9 = *__error();
        close(v6);
        *__error() = v9;
        return v8;
      }
    }
  }
  return v6;
}

uint64_t fpfs_recursive_unlinkat(int a1, const char *a2, int a3, int a4)
{
  int v6;
  int v7;
  uint64_t v8;
  _QWORD v10[5];
  int v11;

  if (a3)
    v6 = 128;
  else
    v6 = 0;
  if (a4)
    v7 = v6 | 0x1000;
  else
    v7 = v6;
  v8 = fpfs_unlinkat(a1, a2, v7);
  if ((_DWORD)v8 && (*__error() == 66 || *__error() == 1))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __fpfs_recursive_unlinkat_block_invoke;
    v10[3] = &__block_descriptor_44_e5_i8__0l;
    v10[4] = a2;
    v11 = v7;
    return fpfs_fchdir(a1, (uint64_t)v10);
  }
  return v8;
}

uint64_t fpfs_unlinkat(int a1, const char *a2, __int16 a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  if ((a3 & 0x1000) == 0)
    return fpfs_lp_unlinkat(a1, a2, a3);
  v6[5] = v3;
  v6[6] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __fpfs_delete_at_block_invoke;
  v6[3] = &__block_descriptor_40_e5_i8__0l;
  v6[4] = a2;
  return fpfs_fchdir(a1, (uint64_t)v6);
}

uint64_t __fpfs_recursive_unlinkat_block_invoke(uint64_t a1)
{
  FTS *v2;
  FTS *v3;
  FTSENT *v4;
  uint64_t v5;
  uint64_t v6;
  const char *fts_path;
  unsigned int v8;
  int fts_errno;
  int v10;
  char *v12[3];

  v12[2] = *(char **)MEMORY[0x1E0C80C00];
  v12[0] = *(char **)(a1 + 32);
  v12[1] = 0;
  v2 = fts_open(v12, 2132, 0);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  do
  {
    v4 = fts_read(v3);
    v5 = 0;
    if (!v4)
      break;
    switch(v4->fts_info)
    {
      case 2u:
        fts_errno = 62;
        goto LABEL_15;
      case 3u:
      case 0xCu:
      case 0xDu:
        v6 = fpfs_lp_unlinkat(-2, v4->fts_path, 0);
        goto LABEL_9;
      case 4u:
      case 7u:
      case 0xAu:
        fts_errno = v4->fts_errno;
LABEL_15:
        *__error() = fts_errno;
        v5 = 0xFFFFFFFFLL;
        goto LABEL_16;
      case 6u:
        fts_path = v4->fts_path;
        v8 = *(_DWORD *)(a1 + 40) & 0xFFFFEFFF;
        goto LABEL_8;
      case 8u:
        fts_path = v4->fts_path;
        v8 = *(_DWORD *)(a1 + 40) & 0xFFFFFF7F;
LABEL_8:
        v6 = fpfs_unlinkat(-2, fts_path, v8);
LABEL_9:
        v5 = v6;
        break;
      default:
        break;
    }
  }
  while (!(_DWORD)v5);
LABEL_16:
  v10 = *__error();
  fts_close(v3);
  *__error() = v10;
  return v5;
}

uint64_t _materialize_full(int a1, uint64_t a2, uint64_t a3)
{
  if (ftruncate(a2, 0) < 0)
    return 0xFFFFFFFFLL;
  if (a3)
    return fcntl(a1, 69, a2);
  return 0;
}

uint64_t fpfs_materialize(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, void *a9)
{
  BOOL v18;
  int *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  size_t v25;
  ssize_t v26;
  u_int32_t v27;
  unsigned int v28;
  size_t v29;
  uint64_t v30;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  timespec v37;
  timespec v38;
  __int128 v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  NSObject *v48;
  int v49;
  int *v50;
  char *v51;
  int v52;
  NSObject *v53;
  int *v54;
  size_t size;
  int v56;
  ssize_t v57;
  void *value;
  void *valuea;
  id v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[32];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  stat v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[6];
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  int v84;
  BOOL v85;
  uint8_t buf[4];
  int v87;
  __int16 v88;
  char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v60 = a9;
  v18 = a2[2] < 1 || a5 < 0;
  v85 = v18;
  memset(&v74, 0, sizeof(v74));
  if (fstat(a1, &v74) < 0 || (_validate_file_types(v74.st_mode, *(_DWORD *)a2) & 0x80000000) != 0)
    goto LABEL_46;
  if ((v74.st_flags & 0x40000000) == 0)
  {
    if ((*((_BYTE *)a2 + 4) & 0x20) == 0
      && (_unset_dataless_cmpfs_xattr(a1) & 0x80000000) != 0
      && *__error() != 93
      && (*(_DWORD *)a2 != 2 || *__error() != 21))
    {
      goto LABEL_46;
    }
    v19 = __error();
    v20 = 37;
    goto LABEL_45;
  }
  if ((a4 & 0x80000000) == 0)
  {
    v21 = *(_DWORD *)a2;
    memset(&v74, 0, sizeof(v74));
    if (fstat(a4, &v74) < 0 || (_validate_file_types(v74.st_mode, v21) & 0x80000000) != 0)
      goto LABEL_46;
  }
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 4:
      goto LABEL_44;
    case 1:
      value = (void *)fcntl(a4, 63);
      v24 = fcntl(a1, 63);
      if ((int)v24 < (int)value || !(_DWORD)value && (_DWORD)v24)
      {
        if ((fcntl(a4, 64, v24) & 0x80000000) == 0)
          goto LABEL_26;
        v52 = *__error();
        fpfs_current_or_default_log();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          fpfs_materialize_cold_1();
LABEL_81:

        v54 = __error();
        goto LABEL_86;
      }
      if (((int)value < (int)v24 || !(_DWORD)v24 && (_DWORD)value) && fcntl(a1, 64, value) < 0)
      {
        v52 = *__error();
        fpfs_current_or_default_log();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          fpfs_materialize_cold_2();
        goto LABEL_81;
      }
LABEL_26:
      v57 = fgetxattr(a4, "com.apple.ResourceFork", 0, 0, 0, 0);
      if (v57 < 0)
      {
        if (*__error() != 93)
          goto LABEL_46;
LABEL_83:
        if (v18)
          v23 = _materialize_full(a4, a1, a2[2]);
        else
          v23 = _materialize_partial(a4, a1, a5, a6, a7, &v85);
LABEL_20:
        if (v23 < 0)
          goto LABEL_46;
LABEL_48:
        v81 = 0;
        v82 = &v81;
        v83 = 0x2020000000;
        v84 = 0;
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __fpfs_materialize_block_invoke;
        v80[3] = &unk_1E444CB30;
        v80[4] = &v81;
        v80[5] = a8;
        fpfs_fgethandle(a1, v80);
        v32 = v85;
        if (v85)
          a3 |= 0x20000uLL;
        v33 = *((_OWORD *)a2 + 11);
        v76 = *((_OWORD *)a2 + 10);
        v77 = v33;
        v34 = *((_OWORD *)a2 + 13);
        v78 = *((_OWORD *)a2 + 12);
        v79 = v34;
        v35 = *((_OWORD *)a2 + 7);
        *(_OWORD *)&v74.st_size = *((_OWORD *)a2 + 6);
        *(_OWORD *)&v74.st_blksize = v35;
        v36 = *((_OWORD *)a2 + 9);
        *(_OWORD *)v74.st_qspare = *((_OWORD *)a2 + 8);
        v75 = v36;
        v37 = (timespec)*((_OWORD *)a2 + 3);
        v74.st_atimespec = (timespec)*((_OWORD *)a2 + 2);
        v74.st_mtimespec = v37;
        v38 = (timespec)*((_OWORD *)a2 + 5);
        v74.st_ctimespec = (timespec)*((_OWORD *)a2 + 4);
        v74.st_birthtimespec = v38;
        v39 = *((_OWORD *)a2 + 1);
        *(_OWORD *)&v74.st_dev = *(_OWORD *)a2;
        *(_OWORD *)&v74.st_uid = v39;
        if (!v85)
        {
          *(_DWORD *)&v74.st_mode |= 1u;
          LODWORD(v61) = 0;
          v40 = fpfs_supports_purge_reasons() ^ 1;
          if ((int)a1 < 0)
            LOBYTE(v40) = 1;
          if ((v40 & 1) == 0 && (fpfs_eviction_reason_from_xattr(a1, &v61) & 0x80000000) != 0)
            goto LABEL_71;
          LODWORD(v79) = v61;
        }
        if ((fpfs_fset_metadata(a1, (uint64_t)&v74, *((_DWORD *)v82 + 6), a3) & 0x80000000) == 0
          && (!v32
           || (*((_BYTE *)a2 + 4) & 0x20) != 0
           || (_unset_dataless_cmpfs_xattr(a1) & 0x80000000) == 0
           || *__error() == 93))
        {
          if ((fpfs_supports_parent_mtime_iopolicy() & 1) == 0 && *(_DWORD *)a2 == 3)
          {
            v41 = *((_OWORD *)a2 + 11);
            v70 = *((_OWORD *)a2 + 10);
            v71 = v41;
            v42 = *((_OWORD *)a2 + 13);
            v72 = *((_OWORD *)a2 + 12);
            v73 = v42;
            v43 = *((_OWORD *)a2 + 7);
            v66 = *((_OWORD *)a2 + 6);
            v67 = v43;
            v44 = *((_OWORD *)a2 + 9);
            v68 = *((_OWORD *)a2 + 8);
            v69 = v44;
            v45 = *((_OWORD *)a2 + 3);
            *(_OWORD *)v63 = *((_OWORD *)a2 + 2);
            *(_OWORD *)&v63[16] = v45;
            v46 = *((_OWORD *)a2 + 5);
            v64 = *((_OWORD *)a2 + 4);
            v65 = v46;
            v47 = *((_OWORD *)a2 + 1);
            v61 = *(_OWORD *)a2;
            v62 = v47;
            clock_gettime(_CLOCK_REALTIME, (timespec *)&v63[8]);
            if ((fpfs_fset_metadata(a1, (uint64_t)&v61, 0, 2) & 0x80000000) != 0)
            {
              fpfs_current_or_default_log();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                v49 = *(_DWORD *)(a8 + 16);
                v50 = __error();
                v51 = strerror(*v50);
                *(_DWORD *)buf = 67109378;
                v87 = v49;
                v88 = 2080;
                v89 = v51;
                _os_log_impl(&dword_1A0A34000, v48, OS_LOG_TYPE_INFO, "Unable to bump mtime at pkg root for docID(%u) after materialization (ignoring): %s", buf, 0x12u);
              }

            }
          }
          v30 = 0;
          goto LABEL_72;
        }
LABEL_71:
        v30 = 0xFFFFFFFFLL;
LABEL_72:
        _Block_object_dispose(&v81, 8);
        goto LABEL_47;
      }
      if (fremovexattr(a1, "com.apple.ResourceFork", 32) < 0 && *__error() != 93)
        goto LABEL_46;
      if (v57 >= 0x1000)
        v25 = 4096;
      else
        v25 = v57;
      size = v25;
      valuea = malloc_type_malloc(v25, 0xAF4D2394uLL);
      if (valuea)
      {
        if ((_DWORD)v57)
        {
          v26 = fgetxattr(a4, "com.apple.ResourceFork", valuea, size, 0, 0);
          if ((v26 & 0x8000000000000000) == 0)
          {
            v27 = 0;
            do
            {
              v56 = v26;
              if (fsetxattr(a1, "com.apple.ResourceFork", valuea, v26, v27, 0) < 0)
                goto LABEL_85;
              v27 += v56;
              v28 = v57 - v27;
              if (v57 <= v27)
                break;
              v29 = v28 >= size ? size : v28;
              v26 = fgetxattr(a4, "com.apple.ResourceFork", valuea, v29, v27, 0);
            }
            while ((v26 & 0x8000000000000000) == 0);
            free(valuea);
            goto LABEL_83;
          }
        }
LABEL_85:
        free(valuea);
        v52 = *__error();
        fremovexattr(a1, "com.apple.ResourceFork", 32);
        v54 = __error();
LABEL_86:
        *v54 = v52;
        goto LABEL_46;
      }
      v19 = __error();
      v20 = 12;
LABEL_45:
      *v19 = v20;
LABEL_46:
      v30 = 0xFFFFFFFFLL;
LABEL_47:

      return v30;
    case 2:
      if ((a4 & 0x80000000) != 0)
        goto LABEL_48;
LABEL_44:
      v19 = __error();
      v20 = 22;
      goto LABEL_45;
    case 3:
      v22 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v61 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v61 + 1) = 3221225472;
      *(_QWORD *)&v62 = ___femptypkg_block_invoke;
      *((_QWORD *)&v62 + 1) = &__block_descriptor_36_e29_i16__0__dirent_QQSSC_1024c__8l;
      *(_DWORD *)v63 = a1;
      if ((fpfs_fopendir(a1, (uint64_t)&v61) & 0x80000000) != 0)
        goto LABEL_46;
      *(_QWORD *)&v74.st_dev = v22;
      v74.st_ino = 3221225472;
      *(_QWORD *)&v74.st_uid = ___transfer_dir_contents_block_invoke;
      *(_QWORD *)&v74.st_rdev = &__block_descriptor_40_e29_i16__0__dirent_QQSSC_1024c__8l;
      v74.st_atimespec.tv_sec = __PAIR64__(a1, a4);
      v23 = fpfs_fopendir(a4, (uint64_t)&v74);
      goto LABEL_20;
    default:
      goto LABEL_48;
  }
}

void sub_1A0ACEA54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t _materialize_partial(unsigned int a1, int a2, uint64_t a3, uint64_t a4, int a5, _BYTE *a6)
{
  uint64_t v8;
  NSObject *v9;
  uint64_t result;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  off_t v19;
  NSObject *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  if (a3 < 0 || a4 <= 0)
  {
    fpfs_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
LABEL_8:
      _materialize_partial_cold_1();
LABEL_9:

LABEL_10:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  v8 = a3 + a4;
  if (__OFADD__(a3, a4))
  {
    fpfs_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_9;
  }
  v21 = xmmword_1A0B53CAC;
  v22 = 512;
  DWORD2(v24) = 0;
  *(_QWORD *)&v24 = 0;
  if (fgetattrlist(a1, &v21, &v24, 0xCuLL, 0) < 0)
    v15 = -1;
  else
    v15 = *(_QWORD *)((char *)&v24 + 4);
  if (v15 < 0)
    return 0xFFFFFFFFLL;
  if (v8 > v15)
  {
    fpfs_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      _materialize_partial_cold_3();
LABEL_31:

    goto LABEL_10;
  }
  if (v15 != v8)
  {
    fpfs_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      _materialize_partial_cold_5();
    goto LABEL_31;
  }
  *(_QWORD *)&v24 = 0;
  *((_QWORD *)&v24 + 1) = a3;
  v25 = a4;
  if (fcntl(a2, 99, &v24) < 0)
    return 0xFFFFFFFFLL;
  *((_QWORD *)&v21 + 1) = a3;
  *(_QWORD *)&v21 = a1;
  v22 = a3;
  v23 = a4;
  if (ffsctl(a2, 0x80204A4CuLL, &v21, 0) < 0)
  {
    fpfs_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      _materialize_partial_cold_4(v20);

    return 0xFFFFFFFFLL;
  }
  v17 = fgetsize(a2);
  if (v17 < 0)
    return 0xFFFFFFFFLL;
  v18 = v17;
  v19 = lseek(a2, 0, 3);
  if (v19 < 0)
    return 0xFFFFFFFFLL;
  if (v19 == v18 || !a3 && a5 && a4 == v18)
  {
    result = 0;
    *a6 = 1;
  }
  else
  {
    result = 0;
    *a6 = 0;
  }
  return result;
}

uint64_t __fpfs_materialize_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_DWORD *)(a2 + 20);
  if (v2)
  {
    *v2 = *(_QWORD *)a2;
    v2[2] = *(_QWORD *)(a2 + 16);
  }
  return 0;
}

uint64_t fpfs_revoke_children(int a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = 1;
  if (ffsctl(a1, 0xC0084A5EuLL, &v4, 0) < 0)
    return 0xFFFFFFFFLL;
  if (v4)
  {
    if (a2)
      *a2 = v4;
    *__error() = 16;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fpfs_evict(int a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, unsigned int a6, void *a7)
{
  id v13;
  void *v14;
  id v15;
  __uint32_t st_flags;
  int v17;
  NSObject *v18;
  int *v19;
  char *v20;
  uint64_t v21;
  char v22;
  int64_t v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  id v28;
  int *v29;
  int v30;
  int v31;
  int v32;
  int v34;
  id v35;
  uint64_t v36;
  uint8_t v37;
  _BYTE v38[15];
  uint8_t buf;
  _BYTE v40[31];
  stat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void *v45;
  uint64_t *v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = v13;
  v36 = -1;
  if (!a4)
    a4 = &v36;
  if (((*(_DWORD *)a2 - 1) & 0xFFFFFFFD) != 0)
  {
    if (*(_DWORD *)a2 == 2)
    {
      v15 = v13;
      memset(&v41, 0, sizeof(v41));
      if ((fstat(a1, &v41) & 0x80000000) == 0)
      {
        st_flags = v41.st_flags;
        if ((v41.st_flags & 0x40000000) != 0
          || (_fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) == 0)
        {
          if ((fpfs_revoke_children(a1, a4) & 0x80000000) == 0 || *a4 == a3)
          {
            v49 = 0;
            v50 = (uint64_t)&v49;
            v51 = 0x2020000000;
            LODWORD(v52) = 0;
            v42 = MEMORY[0x1E0C809B0];
            v43 = 3221225472;
            v44 = __evict_dir_block_invoke;
            v45 = &unk_1E444CBE0;
            v48 = a1;
            v46 = &v49;
            v47 = a3;
            fpfs_fopendir(a1, (uint64_t)&v42);
            if (*(int *)(v50 + 24) >= 1)
            {
              bzero(&v41, 0x400uLL);
              v17 = *__error();
              fpfs_fgetpath(a1, (uint64_t)&v41);
              *__error() = v17;
              fpfs_current_or_default_log();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v19 = __error();
                v20 = strerror(*v19);
                fpfs_evict_cold_5((uint64_t)v20, &buf, (uint64_t)&v41, v18);
              }

            }
            _Block_object_dispose(&v49, 8);
            v21 = 0;
            goto LABEL_62;
          }
          if ((st_flags & 0x40000000) == 0)
          {
            v32 = *__error();
            fpfs_unset_dataless_cmpfs_attrs(a1, (__int128 *)(a2 + 40));
            *__error() = v32;
          }
        }
      }
      v21 = 0xFFFFFFFFLL;
LABEL_62:

      goto LABEL_63;
    }
    v28 = v13;
    memset(&v41, 0, sizeof(v41));
    if (fstat(a1, &v41) < 0
      || (_fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
    {
      goto LABEL_47;
    }
    if ((v41.st_mode & 0xF000) == 0x8000 && v41.st_nlink != 1)
    {
      fpfs_unset_dataless_cmpfs_attrs(a1, (__int128 *)(a2 + 40));
      v29 = __error();
      v30 = 31;
LABEL_46:
      *v29 = v30;
LABEL_47:
      v21 = 0xFFFFFFFFLL;
LABEL_48:

      goto LABEL_63;
    }
    if (!a6
      || (v42 = MEMORY[0x1E0C809B0],
          v43 = 3221225472,
          v44 = ___fpfs_evict_legacy_block_invoke,
          v45 = &__block_descriptor_48_e34_i16__0__fpfs_item_handle_QQII_iI_8l,
          v47 = __PAIR64__(a1, a6),
          v46 = (uint64_t *)a5,
          (fpfs_fgethandle(a1, &v42) & 0x80000000) == 0))
    {
      v31 = *(_DWORD *)a2;
      if (*(_DWORD *)a2 != 3)
      {
        if (v31 == 2)
        {
          if ((fpfs_femptydir(a1, a3, 0, 0) & 0x80000000) != 0
            || (fpfs_femptydir(a1, a3, 0, &__block_literal_global_20) & 0x80000000) != 0)
          {
            fpfs_unset_dataless_cmpfs_attrs(a1, (__int128 *)(a2 + 40));
            v29 = __error();
            v30 = 66;
            goto LABEL_46;
          }
        }
        else
        {
          if (v31 != 1)
          {
            v29 = __error();
            v30 = 45;
            goto LABEL_46;
          }
          if (ftruncate(a1, 0) < 0)
            goto LABEL_47;
        }
LABEL_69:
        v21 = ((int)fpfs_fset_metadata(a1, a2, 0, 3) >> 31);
        goto LABEL_48;
      }
      v49 = MEMORY[0x1E0C809B0];
      v50 = 3221225472;
      v51 = (uint64_t)___femptypkg_block_invoke;
      v52 = &__block_descriptor_36_e29_i16__0__dirent_QQSSC_1024c__8l;
      v53 = a1;
      if ((fpfs_fopendir(a1, (uint64_t)&v49) & 0x80000000) == 0)
        goto LABEL_69;
    }
    v34 = *__error();
    fpfs_unset_dataless_cmpfs_attrs(a1, (__int128 *)(a2 + 40));
    *__error() = v34;
    goto LABEL_47;
  }
  v22 = 0;
  v35 = v13;
  while (1)
  {
    memset(&v41, 0, 32);
    if (fpfs_supports_purge_reasons()
      && (_fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
    {
      v26 = *__error();
      fpfs_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        fpfs_evict_cold_1(&buf, v40, v27);
      goto LABEL_34;
    }
    if (ffsctl(a1, 0xC0204A5FuLL, &v41, 0) < 0)
    {
      v26 = *__error();
      fpfs_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        fpfs_evict_cold_2();
      goto LABEL_34;
    }
    if (*(_QWORD *)&v41.st_rdev)
      goto LABEL_50;
    v23 = *(_QWORD *)(a2 + 16);
    if (v23 < 1)
      break;
    v24 = *__error();
    fpfs_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      fpfs_evict_cold_3(&v37, v38, v25);

    *__error() = v24;
    v26 = 16;
LABEL_35:
    *__error() = v26;
    if (v22 & 1 | (*__error() != 16))
      goto LABEL_49;
    if (*(_DWORD *)a2 == 1)
    {
      fpfs_funload_file(a1);
    }
    else
    {
      if (*(_DWORD *)a2 != 3)
      {
LABEL_49:
        v21 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      fpfs_funload_hierarchy(a1);
    }
    v22 = 1;
  }
  if (*(_DWORD *)a2 == 1
    && (_fset_dataless_cmpfs_xattr(a1, 1, v23, *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
  {
    v26 = *__error();
    fpfs_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      fpfs_evict_cold_4();
LABEL_34:

    goto LABEL_35;
  }
LABEL_50:
  v21 = ((int)fpfs_fset_metadata(a1, a2, 0, a5) >> 31);
LABEL_51:

LABEL_63:
  return v21;
}

void sub_1A0ACF3C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_evict_at(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void *a8)
{
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v15 = a8;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __fpfs_evict_at_block_invoke;
  v19[3] = &unk_1E444CB58;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v20 = v15;
  v21 = a3;
  v16 = v15;
  v17 = fpfs_openat(a1, a2, 2u, 0, 2, (uint64_t)v19);

  return v17;
}

uint64_t __fpfs_evict_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_evict(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(uint64_t **)(a1 + 56), *(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 72), *(void **)(a1 + 32));
}

uint64_t fpfs_is_dataless_fault(int a1, BOOL *a2)
{
  uint64_t result;
  stat v4;

  memset(&v4, 0, sizeof(v4));
  if (fstat(a1, &v4) < 0)
    return 0xFFFFFFFFLL;
  result = 0;
  if (a2)
    *a2 = (v4.st_flags & 0x40000000) != 0;
  return result;
}

uint64_t fpfs_lp_fstatat(int a1, char *a2, stat *a3, int a4)
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;

  v7 = fstatat(a1, a2, a3, a4);
  if ((v7 & 0x80000000) != 0 && *__error() == 63 && fpfs_supports_long_paths())
  {
    v8 = fpfs_openat_longpath(a1, a2, 2129920, 0);
    if ((v8 & 0x80000000) == 0)
    {
      v9 = v8;
      v10 = fstat(v8, a3);
      v11 = *__error();
      close(v9);
      *__error() = v11;
      return v10;
    }
    return 0xFFFFFFFFLL;
  }
  return v7;
}

uint64_t fpfs_is_dataless_fault_at(int a1, char *a2, BOOL *a3)
{
  uint64_t result;
  stat v5;

  memset(&v5, 0, sizeof(v5));
  if ((fpfs_lp_fstatat(a1, a2, &v5, 32) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  result = 0;
  if (a3)
    *a3 = (v5.st_flags & 0x40000000) != 0;
  return result;
}

uint64_t ___get_current_user_uuid_block_invoke()
{
  uid_t v0;
  uint64_t result;

  v0 = getuid();
  result = mbr_uid_to_uuid(v0, (unsigned __int8 *)&_get_current_user_uuid_uuid_cached);
  if ((result & 0x80000000) != 0)
    abort();
  return result;
}

uint64_t ___fpfs_prune_fault_confirm_block_invoke(uint64_t a1, int a2)
{
  int v4;
  __uint32_t st_flags;
  uint64_t v7;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  if (fstat(a2, &v8) < 0)
    return 0xFFFFFFFFLL;
  _fpfs_remove_sharing_xattrs(a2);
  v4 = v8.st_mode & 0xF000;
  if (v4 != 40960)
  {
    st_flags = v8.st_flags;
    if (v4 == 0x4000)
    {
      if (v8.st_ino != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
        fpfs_fset_syncroot(a2, 0);
      if ((st_flags & 0x40000000) != 0)
        fpfs_unset_dataless_cmpfs_attrs(a2, (__int128 *)&v8.st_mtimespec.tv_sec);
      return 0;
    }
    if ((v8.st_flags & 0x40000000) == 0)
    {
      if ((**(_BYTE **)(a1 + 32) & 1) == 0)
        return 0xFFFFFFFFLL;
      v7 = 0;
      if (fpfs_eviction_urgency(a2, &v7) || !v7)
        return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

uint64_t __fpfs_delete_at_block_invoke()
{
  return __delete();
}

uint64_t _validate_file_types(uint64_t result, int a2)
{
  int v2;

  v2 = 22;
  switch(a2)
  {
    case 0:
      goto LABEL_13;
    case 1:
      if ((result & 0xF000) == 0x4000)
        goto LABEL_12;
      if ((result & 0xF000) == 0x8000)
        return 0;
      goto LABEL_11;
    case 2:
    case 3:
      if ((result & 0xF000) == 0x4000)
        return 0;
      if ((result & 0xF000) == 0x8000)
        v2 = 20;
      else
        v2 = 79;
      goto LABEL_13;
    case 4:
      if ((result & 0xF000) == 0x4000)
      {
LABEL_12:
        v2 = 21;
      }
      else
      {
        if ((result & 0xF000) == 0xA000)
          return 0;
LABEL_11:
        v2 = 79;
      }
LABEL_13:
      *__error() = v2;
      return 0xFFFFFFFFLL;
    default:
      return result;
  }
}

uint64_t fgetsize(int a1)
{
  _QWORD v2[2];
  __int128 v3;
  uint64_t v4;

  v3 = xmmword_1A0B53CAC;
  v4 = 512;
  memset(v2, 0, 12);
  if (fgetattrlist(a1, &v3, v2, 0xCuLL, 0) < 0)
    return -1;
  else
    return *(_QWORD *)((char *)v2 + 4);
}

uint64_t ___transfer_dir_contents_block_invoke(uint64_t a1, uint64_t a2)
{
  return renameatx_np(*(_DWORD *)(a1 + 32), (const char *)(a2 + 21), *(_DWORD *)(a1 + 36), (const char *)(a2 + 21), 0);
}

uint64_t ___femptypkg_block_invoke(uint64_t a1, uint64_t a2)
{
  return fpfs_recursive_unlinkat(*(_DWORD *)(a1 + 32), (const char *)(a2 + 21), *(unsigned __int8 *)(a2 + 20) == 4, 0);
}

uint64_t __evict_dir_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a2 != *(_QWORD *)(a1 + 40)
    && (fpfs_recursive_unlinkat(*(_DWORD *)(a1 + 48), (const char *)(a2 + 21), *(unsigned __int8 *)(a2 + 20) == 4, 0) & 0x80000000) != 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return 0;
}

uint64_t ___fpfs_evict_legacy_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 20) == *(_DWORD *)(a1 + 40))
    return 0;
  *__error() = 70;
  fpfs_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(a2 + 20);
    v9 = *(_DWORD *)(a1 + 40);
    v8 = *(_DWORD *)(a1 + 44);
    v10[0] = 67109888;
    v10[1] = v8;
    v11 = 2048;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = v9;
    _os_log_error_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_ERROR, "ESTALE: item gen_count changed during _fpfs_evict_legacy [%d, %llu, %u, %u]", (uint8_t *)v10, 0x1Eu);
  }

  return 0xFFFFFFFFLL;
}

uint64_t ___fpfs_evict_legacy_block_invoke_18(uint64_t a1, int a2, uint64_t a3)
{
  return fpfs_recursive_unlinkat(a2, (const char *)(a3 + 21), *(unsigned __int8 *)(a3 + 20) == 4, 0);
}

void OUTLINED_FUNCTION_0_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

int *OUTLINED_FUNCTION_6_5()
{
  return __error();
}

void OUTLINED_FUNCTION_8_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_9_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

int *OUTLINED_FUNCTION_10_1()
{
  return __error();
}

void OUTLINED_FUNCTION_14_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_1A0AD03A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0AD15C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD1ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1A0AD2CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD3088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD6324(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AD64F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AD65B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AD81D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD84DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD8794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AD8D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t QOSClassFromNSQualityOfService(uint64_t result)
{
  if (result > 16)
  {
    if (result == 17 || result == 33 || result == 25)
      return result;
    return 0;
  }
  if (result == -1)
    return 21;
  if (result != 9)
    return 0;
  return result;
}

void sub_1A0AD9CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0ADA988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0ADAAA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ADAC64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ADD774(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A0ADD820(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ADD8A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0ADE0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ADE58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_1A0ADE940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FPCreateFormat(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a2);
}

id FPLocv(void *a1, uint64_t a2)
{
  return FPLocvImpl(a1, CFSTR("FileProvider"), 0, a2);
}

id FPLocalizedErrorStringForKeyLiteral(void *a1, uint64_t a2)
{
  return FPLocvImpl(a1, CFSTR("Errors"), 1, a2);
}

id FPLocalizedErrorStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v7;

  v1 = a1;
  FPLocalizationBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, CFSTR("X"), CFSTR("Errors"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("X")))
  {
    v5 = v3;
LABEL_9:
    v4 = v5;
    goto LABEL_10;
  }
  if ((objc_msgSend(v1, "hasSuffix:", CFSTR("-C")) & 1) == 0
    && (objc_msgSend(v1, "hasSuffix:", CFSTR("-R")) & 1) == 0
    && (objc_msgSend(v1, "hasSuffix:", CFSTR(".f")) & 1) == 0
    && (objc_msgSend(v1, "hasSuffix:", CFSTR("(*)")) & 1) == 0
    && (objc_msgSend(v1, "containsString:", CFSTR("(")) & 1) == 0)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      FPLocalizedErrorStringForKey_cold_1((uint64_t)v1, v7);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KEY_MISSING(%@)"), v1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

uint64_t copyfile_status_cb(int a1, int a2, _copyfile_state *a3, const char *a4, uint64_t a5, void *a6)
{
  id v10;
  void *v11;
  int *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  uint8_t v30[8];
  const char *dst;

  v10 = a6;
  v11 = v10;
  if (a2 == 3)
  {
    if ((objc_msgSend(v10, "shouldCopyAppleDouble") & 1) == 0)
    {
      v12 = __error();
      if (a1 == 1 && *v12 == 17)
      {
        v13 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLWithString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        -[NSObject lastPathComponent](v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("._"));

        if (v17)
        {
          fp_current_or_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            copyfile_status_cb_cold_2();

LABEL_15:
          goto LABEL_16;
        }

      }
    }
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      copyfile_status_cb_cold_1((uint64_t)a4, v22);

    objc_msgSend(v11, "setCopyError:", *__error());
LABEL_21:
    v21 = 2;
    goto LABEL_22;
  }
  objc_msgSend(v10, "progress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isCancelled");

  if ((v20 & 1) != 0)
    goto LABEL_21;
  if (a1 != 5)
  {
    if (a1 == 3)
    {
LABEL_16:
      v21 = 0;
      goto LABEL_22;
    }
    if (a1 == 2)
    {
      objc_msgSend(v11, "setRootWasCopied:", 1);
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        copyfile_status_cb_cold_5();
      goto LABEL_15;
    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a4, strlen(a4), 4, 0);
    if (a1 == 4)
    {
      objc_msgSend(v11, "updateCopyingFile:state:", v25, a3);
    }
    else
    {
      v21 = 0;
      if (a1 != 1)
      {
LABEL_43:

        goto LABEL_22;
      }
      if (a2 == 2)
      {
        objc_msgSend(v11, "finishCopyingFile:state:", v25, a3);
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          copyfile_status_cb_cold_4();

      }
      else if (a2 == 1)
      {
        if ((objc_msgSend(v11, "shouldCopyAppleDouble") & 1) == 0)
        {
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("._"));

          if (v27)
          {
            fp_current_or_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              copyfile_status_cb_cold_3();

            v21 = 1;
            goto LABEL_43;
          }
        }
        objc_msgSend(v11, "beginCopyingFile:state:", v25, a3);
      }
    }
    v21 = 0;
    goto LABEL_43;
  }
  dst = 0;
  if (copyfile_state_get(a3, 9u, &dst))
  {
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] copyfile: Failed to get xattr name", v30, 2u);
    }

    v21 = 1;
  }
  else
  {
    v21 = xattr_preserve_for_intent(dst, 1u) != 1;
  }
LABEL_22:

  return v21;
}

void sub_1A0AE04E0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Unwind_Resume(a1);
}

void sub_1A0AE27B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AE2E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0AE3280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AE48AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  __fp_leave_section_Debug((uint64_t)&a26);
  _Unwind_Resume(a1);
}

void sub_1A0AE4CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1A0AE5680(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_leave_section_Debug(v1 - 88);
  _Unwind_Resume(a1);
}

void sub_1A0AE584C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AE5A10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AE5B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudDocsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444DB28;
    v3 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudDocsLibraryCore_frameworkLibrary)
    CloudDocsLibrary_cold_1(&v1);
  return CloudDocsLibraryCore_frameworkLibrary;
}

void sub_1A0AE5E1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AE5F84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AE6164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id knownFolderLocationConcreteClasses()
{
  if (knownFolderLocationConcreteClasses_onceToken != -1)
    dispatch_once(&knownFolderLocationConcreteClasses_onceToken, &__block_literal_global_35);
  return (id)knownFolderLocationConcreteClasses_classes;
}

void __knownFolderLocationConcreteClasses_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)knownFolderLocationConcreteClasses_classes;
  knownFolderLocationConcreteClasses_classes = v2;

}

void sub_1A0AE7FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchableItemAttributeSetClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_1();
  result = objc_getClass("CSSearchableItemAttributeSet");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchableItemAttributeSetClass_block_invoke_cold_1();
  getCSSearchableItemAttributeSetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSLocalizedStringClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_1();
  result = objc_getClass("CSLocalizedString");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSLocalizedStringClass_block_invoke_cold_1();
  getCSLocalizedStringClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchableItemClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary_1();
  result = objc_getClass("CSSearchableItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchableItemClass_block_invoke_cold_1();
  getCSSearchableItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A0AE8F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AE9434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AE95A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id getCSIndexErrorDomain()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getCSIndexErrorDomainSymbolLoc_ptr;
  v6 = getCSIndexErrorDomainSymbolLoc_ptr;
  if (!getCSIndexErrorDomainSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCSIndexErrorDomainSymbolLoc_block_invoke;
    v2[3] = &unk_1E444B188;
    v2[4] = &v3;
    __getCSIndexErrorDomainSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getCSIndexErrorDomain_cold_1();
  return *v0;
}

void sub_1A0AE9DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AEA3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEA98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEADE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEB1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *__getCSIndexErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_3)
  {
    v4 = xmmword_1E444DE68;
    v5 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_3)
    __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CoreSpotlightLibraryCore_frameworkLibrary_3, "CSIndexErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCSIndexErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A0AEC4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSSystemServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E444DEF8;
    v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    __getFBSSystemServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FBSSystemService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFBSSystemServiceClass_block_invoke_cold_2();
  getFBSSystemServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A0AECF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AED724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEDC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEE258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEE5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEEB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEEF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0AEF864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32)
{
  __fp_leave_section_Debug((uint64_t)&a30);
  _FPRestorePersona(&a32);
  _Unwind_Resume(a1);
}

void sub_1A0AF0138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *__getCSIndexErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_4)
  {
    v4 = xmmword_1E444E048;
    v5 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_4)
    __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1_0(&v3);
  result = dlsym((void *)CoreSpotlightLibraryCore_frameworkLibrary_4, "CSIndexErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCSIndexErrorDomainSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A0AF0608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A0AF0BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0AF0F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_fault_impl(a1, a4, OS_LOG_TYPE_FAULT, a2, a3, 0x16u);
}

id comparablePathFromURL(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "standardizedURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("private"));

    if (v5)
      objc_msgSend(v3, "removeObjectAtIndex:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1A0AF273C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF27B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF2C9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL fpfs_path_is_ignored(const char *a1, int a2)
{
  char *v3;
  _BOOL8 v4;

  v3 = strdup(a1);
  v4 = fpfs_path_is_safe_save_temp_file_ext(v3, a2) != 0;
  free(v3);
  return v4;
}

BOOL fpfs_path_is_safe_save_temp_file(char *a1, int a2)
{
  return fpfs_path_is_safe_save_temp_file_ext(a1, a2) != 0;
}

uint64_t is_ext_image_type(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, a2, 4);
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v4;
}

BOOL is_adobe_after_effect_safe_save(unint64_t a1, char *__s1)
{
  char *v5;
  int v6;
  int v7;
  int v8;

  if (strcmp(__s1, "aep"))
    return 0;
  v5 = __s1 - 2;
  if ((unint64_t)(__s1 - 2) <= a1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *v5;
      if (v8 != 46 || v6 < 1)
      {
        if ((v8 - 48) > 9)
          return v7 > 1;
        ++v6;
      }
      else
      {
        v6 = 0;
        ++v7;
      }
      --v5;
    }
    while ((unint64_t)v5 > a1);
  }
  return v7 > 1;
}

char *is_adobe_illustrator_safe_save(char *a1)
{
  char *result;
  char *v3;
  int v4;
  char *v5;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (strncmp(a1, "~ai-", 4uLL))
    return 0;
  result = strrchr(a1, 95);
  if (result)
  {
    v3 = result;
    v4 = strcmp(result, "_.tmp");
    result = 0;
    if (!v4 && v3 - a1 == 40)
    {
      v5 = strndup(a1 + 4, 0x24uLL);
      memset(uu, 0, sizeof(uu));
      return (char *)(uuid_parse(v5, uu) == 0);
    }
  }
  return result;
}

char *fpfs_path_is_safe_save_temp_file_ext(char *result, int a2)
{
  char *v3;
  int v4;
  char *__stringp;

  __stringp = result;
  if (result)
  {
    while (1)
    {
      v3 = strsep(&__stringp, "/");
      v4 = __stringp ? 0 : a2;
      result = (char *)fpfs_path_is_safe_save_temp_filename(v3, v4);
      if ((_DWORD)result)
        break;
      if (!__stringp)
        return 0;
    }
  }
  return result;
}

uint64_t fpfs_fgetpath(int a1, uint64_t a2)
{
  return fcntl(a1, 50, a2);
}

unsigned __int8 *fpfs_trim_path(const char *a1, _QWORD *a2)
{
  const char *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  const char *v8;
  unsigned __int8 *result;
  int v10;

  v3 = a1;
  v4 = (unsigned __int8 *)&a1[strlen(a1)];
  v5 = v4 - 1;
  v6 = (unsigned __int8 *)(v3 + 1);
  do
  {
    v7 = v6;
    v8 = v3;
    result = v6 - 1;
    if (v6 - 1 >= v5)
      break;
    if (*result != 47)
      break;
    ++v6;
    ++v3;
  }
  while (*v7 == 47);
  if (v4 <= result)
  {
LABEL_9:
    if (!a2)
      return result;
    goto LABEL_10;
  }
  while (v5 > result)
  {
    v10 = *v5--;
    if (v10 != 47)
    {
      v4 = v5 + 2;
      goto LABEL_9;
    }
  }
  v4 = v7;
  if (a2)
LABEL_10:
    *a2 = v4 - (unsigned __int8 *)v8;
  return result;
}

void FPProviderForShareURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchProviderForShareURL:fallbackIdentifier:completionHandler:", v7, v6, v5);

}

void sub_1A0AF57BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF5848(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF596C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF5B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF5D68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF5DD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF6028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF624C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF6348(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF64B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF659C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF6828(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF6B18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF6CA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF6EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF7384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0AF75D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF77C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF78D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF79B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF7AB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0AF7CB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CloudDocsLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_1E444E380;
    v3 = 0;
    CloudDocsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CloudDocsLibraryCore_frameworkLibrary_0)
    CloudDocsLibrary_cold_1_0(&v1);
  return CloudDocsLibraryCore_frameworkLibrary_0;
}

void sub_1A0AF88D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AF8C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AF8D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AF91E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id FPCrossDeviceItemIDExtendedForReceivingApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v4 = a2;
  v5 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21;
  v18 = __Block_byref_object_dispose__21;
  v19 = 0;
  v6 = (void *)FPGetItemURLForCrossDeviceItemID(v3, 0);
  if (v6)
  {
    objc_msgSend(v4, "fp_bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __FPCrossDeviceItemIDExtendedForReceivingApplication_block_invoke;
    v11[3] = &unk_1E444E3A0;
    v13 = &v14;
    v8 = v5;
    v12 = v8;
    FPExtendBookmarkForDocumentURL(v6, v7, v11);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_1A0AF93D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v4, "fp_hasSandboxAccessToFile:", v3) & 1) != 0)
  {
    FPCreateCrossDeviceItemIDForItemAtURL((uint64_t)v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication_cold_1((uint64_t)v4, v3, v6);

    v5 = 0;
  }

  return v5;
}

void sub_1A0AF970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t hasConflictingVersion(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;

  v5 = a1;
  v6 = a2;
  if ((a3 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v5, "itemVersion"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "contentVersion"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(v5, "versionIdentifier"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v6, "contentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (a3 < 2)
    {
      if ((v12 & 1) != 0)
        goto LABEL_29;
      goto LABEL_23;
    }
    v7 = v12 ^ 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    if (a3 < 2)
      goto LABEL_31;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v5, "itemVersion"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "metadataVersion"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "metadataVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
  {

    if ((v7 & 1) == 0)
      goto LABEL_29;
  }
  else
  {
    objc_msgSend(v6, "metadataVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
      v18 = 1;
    else
      v18 = v7;

    if ((v18 & 1) == 0)
      goto LABEL_29;
  }
LABEL_23:
  if (!objc_msgSend(v6, "isEmpty"))
  {
    v8 = 1;
    goto LABEL_31;
  }
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    hasConflictingVersion_cold_2(v5, v19);

  fp_simulate_crash(CFSTR("Item has version conflict, but empty base version"), v20, v21, v22, v23, v24, v25, v26, v29);
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    hasConflictingVersion_cold_1();

LABEL_29:
  v8 = 0;
LABEL_31:

  return v8;
}

void sub_1A0AFAA78(void *a1)
{
  void **v1;
  void *v2;

  objc_begin_catch(a1);
  v2 = *v1;
  *v1 = 0;

  objc_exception_rethrow();
}

void sub_1A0AFAA90(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id contentTypeOfItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "contentType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v1, "typeIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "fp_cachedTypeWithIdentifier:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)v4;
  }

  return v2;
}

uint64_t isFolderContentType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC4B8]))
    v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC588]) ^ 1;
  else
    v2 = 0;

  return v2;
}

void sub_1A0AFC8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t areCompatibleContentTypes(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a2;
  LODWORD(a1) = objc_msgSend(a1, "conformsToType:", v5);
  v7 = objc_msgSend(v6, "conformsToType:", v5);

  return a1 ^ v7 ^ 1;
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5_6(void *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  uint64_t v0;

  return v0;
}

const void *_FPItemAttributeValueFunction(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  const void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef _FPItemAttributeValueFunction(MDSimpleQueryEvaluator *, void *, CFStringRef)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSFileProviderSearchQuery.m"), 44, CFSTR("Unexpected kind of object for evaluation"));

  }
  v5 = (const void *)objc_msgSend(v4, "_coreSpotlightAttributeForKey:", a3);
  CFRetain(v5);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef _FPItemAttributeValueFunction(MDSimpleQueryEvaluator *, void *, CFStringRef)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSFileProviderSearchQuery.m"), 47, CFSTR("Unable to obtain value for key '%@'"), a3);

  }
  return v5;
}

void sub_1A0AFEA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A0AFF498(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MobileSpotlightIndexLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!MobileSpotlightIndexLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E444E6F8;
    v3 = 0;
    MobileSpotlightIndexLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileSpotlightIndexLibraryCore_frameworkLibrary)
    MobileSpotlightIndexLibrary_cold_1(&v1);
  return MobileSpotlightIndexLibraryCore_frameworkLibrary;
}

void sub_1A0AFFA1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_gethandle_at(uint64_t a1, char *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __fpfs_gethandle_at_block_invoke;
  v9[3] = &unk_1E444E8E0;
  v10 = v5;
  v6 = v5;
  v7 = fpfs_openat(a1, a2, 0x200000u, 0, 0, (uint64_t)v9);

  return v7;
}

uint64_t __fpfs_gethandle_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fgethandle(a2, *(void **)(a1 + 32));
}

uint64_t fpfs_item_handle_gencmp(uint64_t *a1, uint64_t *a2, char a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  result = 0;
  if (a1 && a2)
  {
    v5 = *a1;
    if (*a1)
    {
      v6 = *a2;
      if (*a2)
      {
        if ((a3 & 1) != 0)
          return v5 != v6;
        v7 = *((_DWORD *)a1 + 5);
        if (v7)
        {
          v8 = *((_DWORD *)a2 + 5);
          if (v8)
            return v5 != v6 || v7 != v8;
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_fgetdirentries(int a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  int v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  id v15;
  int v16;
  BOOL v17;
  char *v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  _QWORD *v20;
  int v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  const char *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  BOOL v30;
  int v31;
  id v33;
  int v34;
  const char *v35;
  uint64_t (**v36)(_QWORD, _QWORD);
  void *v37;
  int v38;
  unsigned int v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  __int128 v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD v51[223];

  v51[221] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (*(_QWORD *)(a2 + 8))
  {
    if ((_pagetoken_validate(a1, a2) & 0x80000000) != 0)
    {
LABEL_49:
      v11 = 0xFFFFFFFFLL;
      goto LABEL_52;
    }
  }
  else if ((_pagetoken_init(a1, a2) & 0x80000000) != 0)
  {
    goto LABEL_49;
  }
  if (*(_BYTE *)(a2 + 28))
  {
    v8 = *(_DWORD *)(a2 + 20);
    *(_BYTE *)(a2 + 28) = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = (char *)malloc_type_malloc(0x8000uLL, 0x42084773uLL);
  if (!v9)
  {
    *__error() = 12;
    goto LABEL_49;
  }
  v10 = v9;
  LODWORD(v11) = 0;
  do
  {
    v12 = v11;
    v48 = xmmword_1A0B53DE0;
    v49 = 0x20000000205;
    DWORD1(v48) = -971061749;
    v13 = getattrlistbulk(a1, &v48, v10, 0x8000uLL, 8uLL);
    v11 = v13;
    if (!(_DWORD)v13)
      goto LABEL_51;
    if ((v13 & 0x80000000) != 0)
    {
      if (*__error() != 4 && *__error() != 35)
        goto LABEL_51;
      v11 = 0;
    }
    v8 -= v12;
    v14 = v11 - v8;
  }
  while ((int)v11 <= v8);
  v39 = *(_DWORD *)a2;
  v15 = v7;
  if (!(_DWORD)v11)
  {

    goto LABEL_43;
  }
  v38 = a3;
  v33 = v7;
  v16 = 0;
  v17 = 1;
  v18 = v10;
  v19 = (uint64_t (**)(_QWORD, _QWORD))v15;
  v36 = (uint64_t (**)(_QWORD, _QWORD))v15;
  while (1)
  {
    if (v8 >= 1)
    {
      --v8;
      goto LABEL_20;
    }
    bzero(&v48, 0x800uLL);
    if ((_parse_fileattrs((uint64_t)v18, v10 + 0x8000 - v18, (uint64_t)&v48) & 0x80000000) != 0)
      break;
    if ((fpfs_pkg_fileattrs_update_on(v39, (uint64_t)&v48, v38) & 0x80000000) != 0)
    {
      v34 = v49;
      if (v50)
        v20 = v50;
      else
        v20 = v51;
      v21 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fp_prettyPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      *__error() = v21;
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v34 == 0;
        v25 = "docID";
        if (!v34)
          v25 = "fileID";
        v35 = v25;
        if (v24)
          v26 = v48;
        else
          v26 = v49;
        v27 = *__error();
        *(_DWORD *)buf = 136315906;
        v41 = v35;
        v42 = 2048;
        v43 = v26;
        v44 = 2114;
        v45 = v37;
        v46 = 1024;
        v47 = v27;
        _os_log_error_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Failed to list item %s(%llu) %{public}@, errno %{errno}d", buf, 0x26u);
      }

      v19 = v36;
    }
    else if ((((uint64_t (**)(_QWORD, __int128 *))v19)[2](v19, &v48) & 0x80000000) != 0)
    {
      goto LABEL_40;
    }
LABEL_20:
    v18 += *(unsigned int *)v18;
    v17 = ++v16 < (int)v11;
    if ((_DWORD)v11 == v16)
      goto LABEL_40;
  }
  if (*__error() == 79)
    goto LABEL_20;
LABEL_40:

  v7 = v33;
  if (v17)
  {
LABEL_48:
    free(v10);
    goto LABEL_49;
  }
LABEL_43:
  v28 = *(_DWORD *)(a2 + 24);
  if ((_pagetoken_validate(a1, a2) & 0x80000000) != 0)
    goto LABEL_48;
  if (v28 == -1)
  {
    *(_DWORD *)(a2 + 20) += v14;
  }
  else
  {
    v29 = *(_DWORD *)(a2 + 24);
    v30 = __OFSUB__(v29, v14);
    v31 = v29 - v14;
    if (v31 < 0 != v30)
    {
      *__error() = 33;
      goto LABEL_48;
    }
    *(_DWORD *)(a2 + 20) += v14;
    *(_DWORD *)(a2 + 24) = v31;
  }
LABEL_51:
  free(v10);
LABEL_52:

  return v11;
}

char *fpfs_get_long_parent(char *__s, unint64_t a2, char **a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  size_t v13;
  char *v14;

  if (!__s || !a2)
  {
    if (a3)
    {
      v6 = 0;
      *a3 = 0;
      return v6;
    }
    return 0;
  }
  if (a2 >= 0xFF)
  {
    v7 = __s;
    if (*__s)
    {
      v7 = __s;
LABEL_10:
      v8 = strchr(v7, 47);
      if (v8)
      {
        if ((unint64_t)(v8 - __s) <= 0xFF)
        {
          v9 = v8 + 1;
          v10 = &v8[1 - (_QWORD)__s];
          while (1)
          {
            v7 = v9;
            if ((unint64_t)v10 >= a2)
              break;
            ++v9;
            ++v10;
            if (*v7 != 47)
            {
              if (*v7)
                goto LABEL_10;
              break;
            }
          }
        }
      }
    }
    if (a3)
      *a3 = v7;
    v11 = &v7[~(unint64_t)__s];
    while (v11 != (char *)-1)
    {
      v12 = (v11--)[(_QWORD)__s];
      if (v12 != 47)
      {
        v13 = (size_t)(v11 + 3);
        v14 = (char *)malloc_type_malloc((size_t)(v11 + 3), 0x4BF14B8FuLL);
        v6 = v14;
        if (v14)
          strlcpy(v14, __s, v13);
        return v6;
      }
    }
    return 0;
  }
  if (!a3)
    return 0;
  v6 = 0;
  *a3 = __s;
  return v6;
}

uint64_t fpfs_openat_longpath(int a1, char *__s, int a3, uint64_t a4)
{
  char *v7;
  int v8;
  size_t v9;
  char *long_parent;
  char *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  char *v17;

  v17 = __s;
  if (!__s)
    return openat(a1, 0, a3, a4);
  v7 = __s;
  v8 = a1;
  while (1)
  {
    v9 = strlen(v7);
    if (v9 < 0x400)
      break;
    long_parent = fpfs_get_long_parent(v7, v9, &v17);
    if (!long_parent)
      break;
    v11 = long_parent;
    if (!*long_parent)
      break;
    v12 = openat(v8, long_parent, 0x100000);
    free(v11);
    if (v8 != a1)
    {
      v13 = *__error();
      close(v8);
      *__error() = v13;
    }
    if (v12 < 0)
      return 0xFFFFFFFFLL;
    v7 = v17;
    v8 = v12;
    if (!v17)
      goto LABEL_12;
  }
  v12 = v8;
LABEL_12:
  v14 = openat(v12, v17, a3, a4);
  if (v12 != a1)
  {
    v15 = *__error();
    close(v12);
    *__error() = v15;
  }
  return v14;
}

uint64_t fpfs_open_longpath(char *__s, int a2, uint64_t a3)
{
  return fpfs_openat_longpath(-2, __s, a2, a3);
}

uint64_t fpfs_openat_longparent(int a1, const char *a2, _QWORD *a3)
{
  unsigned __int8 *v5;
  char *v6;
  char *v7;
  char *v8;
  int64_t v9;
  char *v10;
  uint64_t v11;
  size_t __n;

  __n = 0;
  v5 = fpfs_trim_path(a2, &__n);
  v6 = strndup((const char *)v5, __n);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  v8 = strrchr(v6, 47);
  if (!v8)
  {
    free(v7);
    return 0xFFFFFFFFLL;
  }
  v9 = v8 - v7;
  if (v8 == v7)
    v10 = v8 + 1;
  else
    v10 = v8;
  *v10 = 0;
  v11 = fpfs_openat_longpath(a1, v7, 0x100000, 0);
  free(v7);
  if (a3)
    *a3 = &v5[v9 + 1];
  return v11;
}

uint64_t _openbyparentidandname_retry(uint64_t a1, unsigned int a2, char a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  int v14;
  int *v15;
  _QWORD v17[5];
  int v18;

  v8 = *(_QWORD *)(a4 + 8);
  v9 = *(char **)(a4 + 24);
  v17[0] = a1;
  v10 = openbyid_np();
  if (v10 < 0)
  {
    if (*__error() != 63)
      goto LABEL_15;
    if (!fpfs_supports_long_paths())
      goto LABEL_15;
    v10 = _openbyid_longpaths(a1, v8, 1048836);
    if (v10 < 0)
      goto LABEL_15;
  }
  if (a2)
    v11 = a2;
  else
    v11 = 0x8000;
  v12 = v11 | ~(v11 >> 13) & 0x100 | 4;
  v13 = openat(v10, v9, v12);
  if ((v13 & 0x80000000) != 0 && *__error() == 63 && fpfs_supports_long_paths())
    v13 = fpfs_openat_longpath(v10, v9, v12, 0);
  v14 = *__error();
  close(v10);
  *__error() = v14;
  if ((v13 & 0x80000000) != 0)
  {
LABEL_15:
    v15 = __error();
    if ((a2 & 3) != 0 && (a3 & 2) != 0 && *v15 == 21)
      return _openbyparentidandname_retry(a1, a2 & 0xFFFFFFFC, 0, a4);
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___validate_file_openbyid_block_invoke;
    v17[3] = &__block_descriptor_44_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
    v17[4] = a4;
    v18 = v13;
    if (!fpfs_fgethandle(v13, v17))
      return v13;
    *__error() = 2;
    close(v13);
  }
  if (!*__error())
    _openbyparentidandname_retry_cold_1();
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_track_document(int a1, _DWORD *a2)
{
  uint64_t result;
  int DocumentId;
  int v6;
  _QWORD v7[5];

  if ((fpfs_fchflags(a1, 0, 64) & 0x80000000) != 0)
  {
    DocumentId = GSLibraryGetOrAllocateDocumentId();
    if (DocumentId)
    {
      v6 = DocumentId;
      if ((fpfs_pkg_enable_dirstat(a1) & 0x80000000) == 0 || *__error() == 22)
      {
        if (a2)
        {
          result = 0;
          *a2 = v6;
          return result;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  if ((fpfs_pkg_enable_dirstat(a1) & 0x80000000) != 0 && *__error() != 22)
    return 0xFFFFFFFFLL;
  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __fpfs_track_document_block_invoke;
    v7[3] = &__block_descriptor_40_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
    v7[4] = a2;
    return fpfs_fgethandle(a1, v7);
  }
  return 0;
}

uint64_t __fpfs_track_document_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a2 + 16);
  if (v2)
  {
    result = 0;
    **(_DWORD **)(a1 + 32) = v2;
  }
  else
  {
    *__error() = 35;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_untrack_document(int a1)
{
  return fpfs_fchflags(a1, 0x40u, 0);
}

uint64_t fpfs_should_be_tracked_internal(uint64_t a1, uint64_t a2, int a3, BOOL *a4)
{
  int v4;

  v4 = *(_WORD *)(a2 + 4) & 0xF000;
  if (v4 == 0x4000)
    return fpfs_pkg_is_package_root(a1, 0, a4, a3);
  *a4 = v4 == 0x8000;
  return 0;
}

uint64_t fpfs_should_be_tracked(uint64_t a1, int a2, BOOL *a3)
{
  int v6;
  uint64_t result;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  if (fstat(a1, &v8) < 0)
    return 0xFFFFFFFFLL;
  v6 = v8.st_mode & 0xF000;
  if (v6 == 0x4000)
    return fpfs_pkg_is_package_root(a1, 0, a3, a2);
  result = 0;
  *a3 = v6 == 0x8000;
  return result;
}

uint64_t __fpfs_fget_ignore_item_block_invoke(uint64_t a1, int a2)
{
  return fpfs_get_is_ignore_root(a2, *(BOOL **)(a1 + 32));
}

uint64_t _pagetoken_init(int a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v9 = xmmword_1A0B53DF8;
  v5 = 0;
  v6 = 0;
  v8 = 0;
  v7 = 0;
  result = fgetattrlist(a1, &v9, &v5, 0x1CuLL, 0x20u);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v4 = v8;
  if ((v6 & 0x40000000) != 0)
    v4 = -1;
  *(_DWORD *)a2 = HIDWORD(v5);
  *(_QWORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = HIDWORD(v6);
  *(_DWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 28) = 0;
  return result;
}

uint64_t _pagetoken_validate(int a1, uint64_t a2)
{
  uint64_t v4;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  if ((_pagetoken_init(a1, (uint64_t)&v10) & 0x80000000) == 0)
  {
    if (!(_DWORD)v10)
      _pagetoken_validate_cold_1();
    v4 = *((_QWORD *)&v10 + 1);
    if (*((_QWORD *)&v10 + 1) == *(_QWORD *)(a2 + 8) && (_DWORD)v11 == *(_DWORD *)(a2 + 16))
      return 0;
    *__error() = 70;
    v6 = *__error();
    fpfs_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a2 + 8);
      v9 = *(_DWORD *)(a2 + 16);
      *(_DWORD *)buf = 67110144;
      v13 = a1;
      v14 = 2048;
      v15 = v4;
      v16 = 2048;
      v17 = v8;
      v18 = 1024;
      v19 = v11;
      v20 = 1024;
      v21 = v9;
      _os_log_error_impl(&dword_1A0A34000, v7, OS_LOG_TYPE_ERROR, "ESTALE: directory changed during _pagetoken_validate [%d, %llu, %llu, %u, %u]", buf, 0x28u);
    }

    *__error() = v6;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _openbyid_longpaths(int32_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  char *__s;

  __s = 0;
  if ((fpfs_fsgetpath(a1, a2, &__s, 0) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v4 = fpfs_openat_longpath(-2, __s, a3, 0);
  free(__s);
  return v4;
}

void sub_1A0B00EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _t_fpfs_pkg_extension_register(_BYTE *a1)
{
  if (a1 && *a1)
    fpfs_user_package_extension_list_insert(a1);
  return 0;
}

uint64_t _t_fpfs_pkg_extension_unregister(_BYTE *a1)
{
  if (a1 && *a1)
    fpfs_user_package_extension_list_remove(a1);
  return 0;
}

uint64_t fpfs_pkg_enable_dirstat(int a1)
{
  uint64_t v2;

  v2 = 0;
  return ffsctl(a1, 0x80084A02uLL, &v2, 0);
}

uint64_t fpfs_pkg_promote(int a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 value;

  if ((fpfs_pkg_remove_demotion_xattr(a1) & 0x80000000) != 0)
    goto LABEL_6;
  v4 = xmmword_1A0B53E10;
  value = xmmword_1A0B53E10;
  if ((fpfs_set_finder_info(a1, (uint64_t)&value, (uint64_t)&v4) & 0x80000000) != 0)
    goto LABEL_6;
  LODWORD(value) = 0;
  if (!fpfs_pkg_getflags(a1, &value) && (value & 1) != 0)
    return 0;
  v2 = 1;
  LODWORD(value) = 1;
  if (fsetxattr(a1, "com.apple.fileprovider.fpfs#P", &value, 4uLL, 0, 0) < 0)
  {
LABEL_6:
    if (*__error() == 13)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t fpfs_pkg_remove_demotion_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.fileprovider.dir#N", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_pkg_set_bundle_bit(int a1, int a2)
{
  unsigned __int8 v2;
  _QWORD v4[2];
  __int128 v5;

  v5 = xmmword_1A0B53E10;
  if (a2)
    v2 = 2;
  else
    v2 = 0;
  v4[1] = 0;
  v4[0] = v2;
  return fpfs_set_finder_info(a1, (uint64_t)&v5, (uint64_t)v4);
}

uint64_t fpfs_pkg_demote_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)&__block_literal_global_44);
}

uint64_t __fpfs_pkg_demote_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_demote(a2);
}

uint64_t fpfs_pkg_promote_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)&__block_literal_global_4_0);
}

uint64_t __fpfs_pkg_promote_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_promote(a2);
}

uint64_t fpfs_pkg_is_demoted_at(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __fpfs_pkg_is_demoted_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_pkg_is_demoted_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_is_demoted(a2, *(_BYTE **)(a1 + 32));
}

uint64_t fpfs_pkg_is_promoted_at(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __fpfs_pkg_is_promoted_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t fpfs_pkg_remove_promotion_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.fileprovider.fpfs#P", 0) < 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t fpfs_pkg_is_package_root(uint64_t a1, char a2, _BYTE *a3, int a4)
{
  return fpfs_pkg_fd_lookup(a1, 0, a2, a3, 0, 0, a4);
}

char *fpfs_pkg_system_relative_lookup(char *a1, _BYTE *a2, _BYTE *a3)
{
  int v6;
  int v7;
  char *v8;
  int v9;
  int v10;
  char *v11;
  char *result;

  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (!a1)
    return 0;
  if (!*a1)
    return 0;
  v6 = fpfs_pathpkg_check(a1);
  if (v6 < 0)
    return 0;
  v7 = v6;
  v8 = a1 - 1;
  do
    v9 = *++v8;
  while (v9 == 47);
  if (v7 < 1)
  {
LABEL_14:
    if (a2)
      *a2 = 1;
    result = strchr(v8, 47);
    if (!result)
      return result;
    if (result[1])
    {
      if (a2)
        *a2 = 0;
      if (a3)
      {
        result = 0;
        *a3 = 1;
        return result;
      }
    }
    return 0;
  }
  v10 = v7 + 1;
  while (1)
  {
    v11 = strchr(v8, 47);
    if (!v11)
      break;
    v8 = v11 + 1;
    if (--v10 <= 1)
      goto LABEL_14;
  }
  *__error() = 22;
  return (char *)0xFFFFFFFFLL;
}

char *fpfs_pkg_system_lookup(char *a1, const char *a2, _BYTE *a3, _BYTE *a4)
{
  char *v6;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v6 = (char *)fpfs_path_relative_to(a1, a2);
  if (v6 && *v6)
    return fpfs_pkg_system_relative_lookup(v6, a3, a4);
  else
    return 0;
}

uint64_t fpfs_pkg_fileattrs_update_on(uint64_t a1, uint64_t a2, int a3)
{
  return _pkg_fileattrs_update(0xFFFFFFFFLL, a1, a2, a3);
}

uint64_t fpfs_pkg_get_bundle_bit_at(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __fpfs_pkg_get_bundle_bit_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t ___cwd_fd_block_invoke()
{
  uint64_t result;

  result = open(".", 1048836);
  _cwd_fd_fd = result;
  return result;
}

id FPProviderNotFoundError(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  FPLoc(CFSTR("NoValidProviderFound_identifier_%@"), a2, a3, a4, a5, a6, a7, a8, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _FPProviderNotFoundErrorHelper(v9, 0, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id FPProviderOlderVersionRunningError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v23[0] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v8;
    v23[1] = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("ProviderVersionOlderVersionRunning"), v9, v10, v11, v12, v13, v14, v15, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("ProviderVersionOlderVersionRunning"), a2, a3, a4, a5, a6, a7, a8, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2003, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id FPProviderNewerVersionFoundError(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v15[0] = *MEMORY[0x1E0CB2AA0];
  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E0CB2D50];
  FPLoc(CFSTR("ProviderVersionNewerVersionFound"), v3, v4, v5, v6, v7, v8, v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2004, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id FPProviderXPCInvalidError(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *MEMORY[0x1E0CB28A8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = a1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 4099, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id FPProviderNotFoundErrorForURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CB2D50];
  FPLoc(CFSTR("NoValidProviderFound_url_%@"), a2, a3, a4, a5, a6, a7, a8, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id FPItemNotFoundErrorAtURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v6 = *MEMORY[0x1E0CB3308];
    v7[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t FPItemNotFoundError(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForNonExistentItemWithIdentifier:", a1);
}

uint64_t FPEvictedByTheUserError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -5010, MEMORY[0x1E0C9AA70]);
}

uint64_t FPShouldTrashLocallyError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 24, MEMORY[0x1E0C9AA70]);
}

uint64_t FPTrashDatalessFileNotSupported()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 25, MEMORY[0x1E0C9AA70]);
}

uint64_t FPNotPermittedError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, MEMORY[0x1E0C9AA70]);
}

uint64_t FPUserCancelledError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, MEMORY[0x1E0C9AA70]);
}

uint64_t FPNotPermittedWriteError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 513, MEMORY[0x1E0C9AA70]);
}

id FPInvalidParameterError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  if (a2)
  {
    v18 = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("InvalidParameter_Parameter_Value_%@_%@"), a2, a3, a4, a5, a6, a7, a8, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (void **)v19;
    v12 = &v18;
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("InvalidParameter_Parameter_%@"), 0, a3, a4, a5, a6, a7, a8, a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v17;
    v12 = &v16;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id FPInvalidParameterErrorWithExpectation(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Invalid value for %@: expected %@, actual %@"), v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v15[0] = CFSTR("parameter");
  v15[1] = CFSTR("actual");
  v16[0] = v8;
  v16[1] = v7;
  v11 = *MEMORY[0x1E0CB2938];
  v15[2] = CFSTR("expected");
  v15[3] = v11;
  v16[2] = v6;
  v16[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id FPPluginOperationFailedError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB28A8];
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

LABEL_5:
    v15 = v1;
    goto LABEL_6;
  }
  objc_msgSend(v1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v5)
    goto LABEL_5;
  objc_msgSend(v1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSFileProviderErrorDomain"));

  if (v7)
    goto LABEL_5;
  v17 = (void *)MEMORY[0x1E0CB35C8];
  if (v1)
  {
    v27[0] = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("PluginOperationFailed"), v8, v9, v10, v11, v12, v13, v14, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = *MEMORY[0x1E0CB3388];
    v28[0] = v18;
    v28[1] = v1;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (void **)v28;
    v21 = v27;
    v22 = 2;
  }
  else
  {
    v25 = *MEMORY[0x1E0CB2D50];
    FPLoc(CFSTR("PluginOperationFailed"), v8, v9, v10, v11, v12, v13, v14, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v18;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v26;
    v21 = &v25;
    v22 = 1;
  }
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v3, 4101, v23);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v15;
}

id FPInvalidBookmarkableStringError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  FPLoc(CFSTR("InvalidBookmark"), a2, a3, a4, a5, a6, a7, a8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id FPInvalidURLError(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v17[0] = *MEMORY[0x1E0CB2D50];
  v2 = a1;
  FPLoc(CFSTR("InvalidURL"), v3, v4, v5, v6, v7, v8, v9, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v17[1] = *MEMORY[0x1E0CB2AA0];
  objc_msgSend(v2, "path");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("(null)");
  if (v11)
    v12 = v11;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id FPProxyNotFoundError(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  if (a2)
  {
    v31[0] = *MEMORY[0x1E0CB2D50];
    v5 = a2;
    FPLoc(CFSTR("ProxyNotFound_%@"), v6, v7, v8, v9, v10, v11, v12, a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = *MEMORY[0x1E0CB3388];
    v32[0] = v13;
    v32[1] = v5;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (void **)v32;
    v16 = v31;
    v17 = 2;
  }
  else
  {
    v29 = *MEMORY[0x1E0CB2D50];
    v18 = 0;
    FPLoc(CFSTR("ProxyNotFound_%@"), v19, v20, v21, v22, v23, v24, v25, a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v30;
    v16 = &v29;
    v17 = 1;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 7, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id FPNotImplementedError(uint64_t a1, SEL aSelector)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  if (a1)
  {
    v28 = *MEMORY[0x1E0CB2D50];
    NSStringFromSelector(aSelector);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FPLoc(CFSTR("NotImplementedWithClass_%@_%@"), v5, v6, v7, v8, v9, v10, v11, a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (void **)v29;
    v15 = &v28;
  }
  else
  {
    v26 = *MEMORY[0x1E0CB2D50];
    NSStringFromSelector(aSelector);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FPLoc(CFSTR("NotImplemented_%@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v27;
    v15 = &v26;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id FPInvalidProtocolError(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = &stru_1E4450B40;
  if (a1)
    v9 = a1;
  v14 = *MEMORY[0x1E0CB2D50];
  FPLoc(CFSTR("InvalidProtocol %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id FPClientLacksEntitlement(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FPLoc(CFSTR("ClientLacksEntitlement"), v3, v4, v5, v6, v7, v8, v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2D50]);

  if (v1)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 8, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id FPPartialErrorsByItemIdentifiers(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = CFSTR("NSFileProviderPartialErrorsByItemIdentifierKey");
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 10, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FPPartialErrorsByURL(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = CFSTR("NSFileProviderPartialErrorsByURLKey");
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 10, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t FPNotSupportedError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, MEMORY[0x1E0C9AA70]);
}

id FPDomainUnavailableErrorWithUnderlyingError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v6 = *MEMORY[0x1E0CB3388];
    v7[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 12, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FPDomainUnavailableError()
{
  return FPDomainUnavailableErrorWithUnderlyingError(0);
}

id FPFileSystemNotSupportedError()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v1 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB3388];
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", v1, 3328, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t FPSubtreeChangedError()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 14, 0);
}

id FPNonEvictableChildrenError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F70];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2006, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FPEvictionWithUnsyncedEditsError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FPLoc(CFSTR("DirtyNotEvictable_%@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D50];
  v16[0] = *MEMORY[0x1E0CB3308];
  v16[1] = v12;
  v17[0] = v1;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2007, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id FPEvictionOnBusyItemError(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  FPLoc(CFSTR("BusyNotEvictableTitle"), v2, v3, v4, v5, v6, v7, v8, v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FPLoc(CFSTR("BusyNotEvictableSubtitle_%@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2FE0];
  v21 = *MEMORY[0x1E0CB2D50];
  v26[0] = *MEMORY[0x1E0CB3308];
  v26[1] = v21;
  v27[0] = v1;
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E0CB2D60];
  v27[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 16, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id FPEvictionOnItemWithHardlinkError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FPLoc(CFSTR("MLinkNotEvictable_%@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2FE0];
  v13 = *MEMORY[0x1E0CB2D50];
  v17[0] = *MEMORY[0x1E0CB3308];
  v17[1] = v13;
  v18[0] = v1;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 31, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id FPMissingAllowsEvictingCapabilitiesError(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "hasDirectoryPath");
  objc_msgSend(v1, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v11 = CFSTR("GenericFolderNotEvictable_%@");
  else
    v11 = CFSTR("GenericNotEvictable_%@");
  FPLoc(v11, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  v18[0] = *MEMORY[0x1E0CB3308];
  v18[1] = v14;
  v19[0] = v1;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -2008, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id FPFileIsAlreadyPausedError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB3308];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 17, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FPFileNotPausedError(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB3308];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 16, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *FPConnectionStateToPrettyString(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a2;
  v4 = v3;
  switch(a1)
  {
    case 2:
      v5 = CFSTR("(⏹  error)");
      break;
    case 3:
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (⏹  temporarily disconnected: %@)"), v3);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = CFSTR(" (⏹  temporarily disconnected)");
      }
      break;
    case 4:
      v5 = CFSTR("(⏹  permanently disconnected)");
      break;
    case 5:
      v5 = CFSTR("(⏹  extension not found)");
      break;
    case 6:
      v5 = CFSTR("(⏹  low disk space)");
      break;
    case 7:
      v5 = CFSTR("(⏹  incompatible DB)");
      break;
    case 8:
      v5 = CFSTR("(⏹  forbidden by MDM)");
      break;
    case 9:
      v5 = CFSTR("(⏹  external domain rejected by provider)");
      break;
    default:
      v5 = &stru_1E4450B40;
      break;
  }

  return v5;
}

void OUTLINED_FUNCTION_0_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

id FPFileSizeAttributes()
{
  id *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = CFSTR("size");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = (id *)getMDItemFileSizeSymbolLoc_ptr_0;
  v9 = getMDItemFileSizeSymbolLoc_ptr_0;
  if (!getMDItemFileSizeSymbolLoc_ptr_0)
  {
    v1 = (void *)CoreSpotlightLibrary_2();
    v0 = (id *)dlsym(v1, "MDItemFileSize");
    v7[3] = (uint64_t)v0;
    getMDItemFileSizeSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
    FPFileSizeAttributes_cold_1();
  v11[0] = *v0;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = v11[0];
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A0B04F88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPScopedToIdentifierFragment(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a1;
  objc_msgSend(a2, "fp_toDomainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItemID csIdentifierFromFPIdentifier:domainIdentifier:](FPItemID, "csIdentifierFromFPIdentifier:domainIdentifier:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id FPExcludedOIDParentsQueryStringFragment(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "_fp_map:", &__block_literal_global_69);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_fp_componentsJoinedByAnd");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("true");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FPSpotlightQueryStringForFilename(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a2;
  objc_msgSend(v4, "stringWithString:", CFSTR("cdtw"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "fp_isCJKLanguageIdentifier");

  if ((_DWORD)v4)
    objc_msgSend(v6, "appendString:", CFSTR("s"));
  objc_msgSend(v3, "_fp_escapedStringForSearchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemDisplayName == \"%@*\"%@)"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *FPSpotlightQueryStringForSearchQuery(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a1;
  objc_msgSend(v3, "spotlightQueryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "trashedItemsMembership") == 2)
  {
    v8 = CFSTR("==");
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemIsTrashed %@ \"1\")"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "trashedItemsMembership") == 1)
  {
    v8 = CFSTR("!=");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v3, "filename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FPSpotlightQueryStringForFilename(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
  }
  objc_msgSend(v3, "allowedContentTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "allowedContentTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_fp_map:", &__block_literal_global_95);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_fp_componentsJoinedByOr");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v19);

  }
  if (a2)
  {
    objc_msgSend(v3, "providerDomainID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "providerDomainID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fp_toProviderID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemFileProviderID == \"%@\")"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v23);
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) == 0)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "providerDomainID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fp_toDomainIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("(FPDomainIdentifier == \"%@\")"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v27);
      }

    }
  }
  objc_msgSend(v3, "scopeFragment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "scopeFragment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("(%@)"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v31);
  }
  if (objc_msgSend(v3, "shouldPerformSemanticSearch") && !objc_msgSend(v7, "count"))
    objc_msgSend(v7, "addObject:", CFSTR("(true)"));
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" && "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E4450B40;
  }

LABEL_26:
  return v6;
}

BOOL FPIsAnyDocumentRecentlyUsed(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  _BOOL8 v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!objc_msgSend(v5, "count") && !objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL FPIsAnyDocumentRecentlyUsed(NSArray<NSString *> *__strong, NSArray<NSString *> *__strong, NSArray<NSString *> *__strong)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("FPSpotlightQueryHelpers.m"), 349, CFSTR("allowedFileTypes is empty, which is illegal."));

  }
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newRecentsCollection");

  objc_msgSend(v9, "setAllowedFileTypes:", v5);
  objc_msgSend(v9, "setExcludedFileTypes:", v6);
  objc_msgSend(v9, "setAllowedProviderIdentifiers:", v7);
  objc_msgSend(v9, "underlyingQueryStringForMountPoint:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v11 = (void *)getCSSearchQueryContextClass_softClass_0;
  v39 = getCSSearchQueryContextClass_softClass_0;
  v12 = MEMORY[0x1E0C809B0];
  if (!getCSSearchQueryContextClass_softClass_0)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = (uint64_t)__getCSSearchQueryContextClass_block_invoke_0;
    v34 = &unk_1E444B188;
    v35 = &v36;
    __getCSSearchQueryContextClass_block_invoke_0((uint64_t)&v31);
    v11 = (void *)v37[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v36, 8);
  v14 = objc_alloc_init(v13);
  v46[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProtectionClasses:", v15);

  objc_msgSend(v14, "setMaxCount:", 1);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v16 = (void *)getCSSearchQueryClass_softClass_0;
  v39 = getCSSearchQueryClass_softClass_0;
  if (!getCSSearchQueryClass_softClass_0)
  {
    v31 = v12;
    v32 = 3221225472;
    v33 = (uint64_t)__getCSSearchQueryClass_block_invoke_0;
    v34 = &unk_1E444B188;
    v35 = &v36;
    __getCSSearchQueryClass_block_invoke_0((uint64_t)&v31);
    v16 = (void *)v37[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v36, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithQueryString:context:", v10, v14);
  v31 = 0;
  v32 = (uint64_t)&v31;
  v33 = 0x2020000000;
  LOBYTE(v34) = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __FPIsAnyDocumentRecentlyUsed_block_invoke;
  v30[3] = &unk_1E444D738;
  v30[4] = &v36;
  objc_msgSend(v18, "setFoundItemsHandler:", v30);
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __FPIsAnyDocumentRecentlyUsed_block_invoke_2;
  v26[3] = &unk_1E444EBA0;
  v28 = &v31;
  v29 = &v36;
  v19 = dispatch_semaphore_create(0);
  v27 = v19;
  objc_msgSend(v18, "setCompletionHandler:", v26);
  objc_msgSend(v18, "start");
  v20 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v19, v20))
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v5;
      v42 = 2112;
      v43 = v6;
      v44 = 2112;
      v45 = v7;
      _os_log_fault_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_FAULT, "[CRIT] Time-out occurred while testing if there are any recent documents with allowed file types %@ and excluded file types %@ and allowed FileProvider identifiers %@.", buf, 0x20u);
    }

  }
  v22 = *(_BYTE *)(v32 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v31, 8);

  return v22;
}

void sub_1A0B05A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B06DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A0B07960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B08080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B08204(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0B08C00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0B08EE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_leave_section_Debug(v1 - 56);
  _Unwind_Resume(a1);
}

void sub_1A0B09294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id FPAbbreviatedArrayDescription(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (v2 > 2)
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@, %@, %lu others)"), v4, v6, objc_msgSend(v1, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "componentsJoinedByString:", CFSTR(", "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@)"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void sub_1A0B0B664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B0B72C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B0BDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B0BEA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B0C340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B0CE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B0D09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_14_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_1A0B0F74C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B0F900(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B0FB18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __fpfs_lp_sandbox_extension_issue_file_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sandbox_extension_issue_file();
  return 0;
}

uint64_t fpfs_lp_sandbox_check(int a1, uint64_t a2, int a3, const char *a4)
{
  uint64_t v8;
  size_t v9;
  char *v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  _QWORD v16[6];
  int v17;
  int v18;
  char *__s;

  v8 = sandbox_check();
  if ((v8 & 0x80000000) != 0
    && (a3 & ~(*MEMORY[0x1E0C80698] | *MEMORY[0x1E0C806B0] | *MEMORY[0x1E0C806A0] | *MEMORY[0x1E0C806A8] | *MEMORY[0x1E0C80690] | *MEMORY[0x1E0C806B8])) == 1
    && *__error() == 63
    && fpfs_supports_long_paths())
  {
    __s = 0;
    v9 = strlen(a4);
    v10 = strdup(a4);
    v11 = fpfs_openat_longparent(-2, v10, &__s);
    if (v11 < 0)
    {
      while (*__s)
      {
        v12 = v9 - strlen(__s);
        v9 = v12 - (v12 > 1);
        v10[v9] = 0;
        v13 = fpfs_openat_longparent(-2, v10, &__s);
        if ((v13 & 0x80000000) == 0)
        {
          v11 = v13;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 0x40000000;
      v16[2] = __fpfs_lp_sandbox_check_block_invoke;
      v16[3] = &__block_descriptor_tmp_1;
      v17 = a1;
      v18 = a3;
      v16[4] = a2;
      v16[5] = __s;
      v8 = fpfs_fchdir(v11, (uint64_t)v16);
      v14 = *__error();
      close(v11);
      *__error() = v14;
    }
    free(v10);
  }
  return v8;
}

uint64_t __fpfs_lp_sandbox_check_block_invoke()
{
  return sandbox_check();
}

uint64_t __fpfs_lp_sandbox_check_by_audit_token_block_invoke()
{
  return sandbox_check_by_audit_token();
}

uint64_t fpfs_enable_fault_handling(int a1)
{
  int v1;
  int v3;

  if (a1)
    v1 = 1;
  else
    v1 = 2;
  v3 = v1;
  return sysctlbyname("kern.vfsnspace", 0, 0, &v3, 4uLL);
}

uint64_t fpfs_enable_vnode_rapid_aging(int a1)
{
  int v1;
  int v3;
  int v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v4 = 0x4400000001;
  if (a1)
    v1 = 1;
  else
    v1 = 3;
  v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

void fpfs_allow_operation(int a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __fpfs_allow_operation_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = a1;
  if (fpfs_allow_operation_onceToken != -1)
    dispatch_once(&fpfs_allow_operation_onceToken, block);
}

uint64_t __fpfs_allow_operation_block_invoke(uint64_t result)
{
  allowedOperations = *(_DWORD *)(result + 32);
  return result;
}

BOOL fpfs_operation_is_allowed(int a1)
{
  return (a1 & ~allowedOperations) == 0;
}

uint64_t fpfs_test_force_ondisk_docid_resolution()
{
  GSSetDocIDResolutionPolicy();
  return 0;
}

uint64_t fpfs_test_trigger_purge(const char *a1)
{
  _OWORD v2[2];

  v2[0] = xmmword_1A0B53E60;
  v2[1] = *(_OWORD *)algn_1A0B53E70;
  return fsctl(a1, 0xC0204A45uLL, v2, 0);
}

uint64_t fpfs_unload_hierarchy(char *a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __fpfs_unload_hierarchy_block_invoke;
  v2[3] = &__block_descriptor_40_e5_i8__0l;
  v2[4] = a1;
  return fpfs_chdir(a1, (uint64_t)v2);
}

uint64_t __fpfs_unload_hierarchy_block_invoke(uint64_t a1)
{
  char *v2[3];

  v2[2] = *(char **)MEMORY[0x1E0C80C00];
  v2[0] = *(char **)(a1 + 32);
  v2[1] = 0;
  return _recycle_recursive(v2);
}

uint64_t _recycle_recursive(char *const *a1)
{
  FTS *v1;
  FTS *v2;
  char v3;
  FTSENT *v4;
  NSObject *v5;
  ino_t fts_ino;
  unsigned int fts_info;
  BOOL v8;
  int v9;
  BOOL v10;
  uint8_t buf[4];
  ino_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = fts_open(a1, 2132, 0);
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = 0;
  do
  {
    v4 = fts_read(v2);
    if (!v4)
      break;
    if ((v3 & 1) == 0)
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        fts_ino = v4->fts_ino;
        *(_DWORD *)buf = 134217984;
        v13 = fts_ino;
        _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] Recursively calling F_RECYCLE below ino #%llu", buf, 0xCu);
      }

    }
    fts_info = v4->fts_info;
    v8 = fts_info > 0xC;
    v9 = (1 << fts_info) & 0x1140;
    v10 = v8 || v9 == 0;
    v4 = v10 ? 0 : (FTSENT *)fpfs_openat(4294967294, v4->fts_path, 0, 0, 0, (uint64_t)&__block_literal_global_7);
    v3 = 1;
  }
  while (!(_DWORD)v4);
  fts_close(v2);
  return (uint64_t)v4;
}

uint64_t fpfs_funload_hierarchy(int a1)
{
  return fpfs_fchdir(a1, (uint64_t)&__block_literal_global_51);
}

uint64_t __fpfs_funload_hierarchy_block_invoke()
{
  __int128 v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1 = xmmword_1E444F110;
  return _recycle_recursive((char *const *)&v1);
}

uint64_t fpfs_funload_file(int a1)
{
  char *v3[2];
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bzero(v4, 0x400uLL);
  if ((fpfs_fgetpath(a1, (uint64_t)v4) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v3[0] = v4;
  v3[1] = 0;
  return _recycle_recursive(v3);
}

uint64_t fpfs_get_materialization_alignment()
{
  if (fpfs_get_materialization_alignment_once != -1)
    dispatch_once(&fpfs_get_materialization_alignment_once, &__block_literal_global_5);
  return fpfs_get_materialization_alignment_alignment;
}

void __fpfs_get_materialization_alignment_block_invoke()
{
  unint64_t v0;
  uint64_t f_bsize;
  NSObject *v2;
  statfs v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  bzero(&v3, 0x878uLL);
  if (statfs(".", &v3) < 0)
  {
    fpfs_get_materialization_alignment_alignment = 0x10000;
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __fpfs_get_materialization_alignment_block_invoke_cold_1();
    goto LABEL_10;
  }
  v0 = sysconf(29);
  if ((v0 & 0x8000000000000000) != 0)
  {
    fpfs_get_materialization_alignment_alignment = 0x10000;
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __fpfs_get_materialization_alignment_block_invoke_cold_2();
LABEL_10:

    return;
  }
  f_bsize = v3.f_bsize;
  if (v0 > v3.f_bsize)
    f_bsize = v0;
  fpfs_get_materialization_alignment_alignment = f_bsize;
}

uint64_t fpfs_is_vfs_ignore_permissions_iopolicy_set()
{
  uint64_t result;

  result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if ((_DWORD)result)
  {
    setiopolicy_np(7, 0, 0);
    return getiopolicy_np(7, 0) == 1;
  }
  return result;
}

uint64_t fpfs_set_vfs_ignore_permissions_iopolicy()
{
  uint64_t result;

  result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if ((_DWORD)result)
    return setiopolicy_np(7, 0, 1);
  return result;
}

uint64_t fpfs_unset_vfs_ignore_permissions_iopolicy()
{
  uint64_t result;

  result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if ((_DWORD)result)
    return setiopolicy_np(7, 0, 0);
  return result;
}

uint64_t fpfs_lp_fsctl(char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v8 = fsctl(a1, a2, a3, a4);
  if ((v8 & 0x80000000) == 0)
    return v8;
  if (*__error() != 63)
    return v8;
  if (!fpfs_supports_long_paths())
    return v8;
  v9 = fpfs_open_longpath(a1, 0x8000, 0);
  v8 = v9;
  if ((v9 & 0x80000000) != 0)
    return v8;
  v10 = ffsctl(v9, a2, a3, a4);
  v11 = *__error();
  close(v8);
  *__error() = v11;
  return v10;
}

uint64_t ___recycle_recursive_block_invoke(int a1, int a2)
{
  return fcntl(a2, 84, 0);
}

void OUTLINED_FUNCTION_0_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void sub_1A0B113D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;

  objc_sync_exit(v18);
  _Unwind_Resume(a1);
}

void sub_1A0B1158C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B11664(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B11C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  _FPRestorePersona(&a33);
  _Unwind_Resume(a1);
}

void sub_1A0B11FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B121B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B1247C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v17 - 72));
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1A0B12908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B12D84(_Unwind_Exception *a1)
{
  uint64_t v1;

  __fp_leave_section_Debug(v1 - 24);
  _Unwind_Resume(a1);
}

void sub_1A0B147E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B14A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  void *v23;

  objc_sync_exit(v23);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B15304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _FPRestorePersona(&a32);
  _Unwind_Resume(a1);
}

void sub_1A0B15620(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B15684(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B15A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B16014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A0B16574(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A0B16AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B16E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B18F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0B196D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0B19A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void __createCaches_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)domainServicerByDomain;
  domainServicerByDomain = v0;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)rootURLByDomain;
  rootURLByDomain = v2;

  v4 = objc_opt_new();
  v5 = (void *)temporaryURLByDomain;
  temporaryURLByDomain = v4;

  v6 = objc_opt_new();
  v7 = (void *)stateURLByDomain;
  stateURLByDomain = v6;

  v8 = objc_opt_new();
  v9 = (void *)cachedDirectoriesWithSecurityScope;
  cachedDirectoriesWithSecurityScope = v8;

}

uint64_t FPDLifetimeServicingXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DB010);
}

uint64_t FPIndexingAssertionXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8160);
}

uint64_t FPDAccessControlServicingXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F81C0);
}

id FPXVendorXPCInterface()
{
  if (FPXVendorXPCInterface_once != -1)
    dispatch_once(&FPXVendorXPCInterface_once, &__block_literal_global_440_0);
  return (id)FPXVendorXPCInterface_interface;
}

id FPSimulatorSupportInterface()
{
  if (FPSimulatorSupportInterface_once != -1)
    dispatch_once(&FPSimulatorSupportInterface_once, &__block_literal_global_519);
  return (id)FPSimulatorSupportInterface_interface;
}

uint64_t fpfs_file_is_flocked(int a1)
{
  if (flock(a1, 6) < 0 && *__error() == 35)
    return 1;
  flock(a1, 8);
  return 0;
}

uint64_t fpfs_get_flock_type(int a1)
{
  if (!fpfs_file_is_flocked(a1))
    return 0;
  if (flock(a1, 5) < 0 && *__error() == 35)
    return 2;
  flock(a1, 8);
  return 1;
}

uint64_t fpfs_serialize_tags(uint64_t a1, void *a2)
{
  uint64_t (**v3)(id, _QWORD *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A1B00664]();
  v19 = 0;
  v20 = 0;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  if (v3[2](v3, &v19))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v7) & 1) == 0)
      {
        objc_msgSend(v5, "addObject:", v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%i"), v7, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);
        *(_BYTE *)(a1 + 16) = v20;

      }
    }
    while ((v3[2](v3, &v19) & 1) != 0);
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (v11 = malloc_type_malloc(objc_msgSend(v9, "length"), 0xC70D6277uLL), (*(_QWORD *)a1 = v11) != 0))
    {
      v12 = objc_msgSend(v10, "length");
      v13 = MEMORY[0x1E0C809B0];
      *(_QWORD *)(a1 + 8) = v12;
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __fpfs_serialize_tags_block_invoke;
      v18[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
      v18[4] = a1;
      objc_msgSend(v10, "enumerateByteRangesUsingBlock:", v18);
      v14 = 0;
    }
    else
    {
      v14 = 1;
    }

    v15 = -1;
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }

  objc_autoreleasePoolPop(v4);
  if (v14)
    v16 = v15;
  else
    v16 = 0;

  return v16;
}

void *__fpfs_serialize_tags_block_invoke(uint64_t a1, const void *a2, uint64_t a3, size_t __n)
{
  return memcpy((void *)(**(_QWORD **)(a1 + 32) + a3), a2, __n);
}

uint64_t fpfs_deserialize_tags(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t (**v13)(_QWORD, uint64_t *);
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  char *v33;
  char *v34;
  int v35;
  char v36;
  id obj;
  uint64_t (**v39)(_QWORD, uint64_t *);
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1B00664]();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *a1, a1[1], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    *__error() = 22;
    v24 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = 0xFFFFFFFFLL;
      goto LABEL_49;
    }
    v47 = v4;
    v25 = v11;
    v26 = v3;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v28)
    {
      v29 = v28;
      v44 = v10;
      v30 = *(_QWORD *)v51;
      while (1)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = 0;
            v49 = 0;
            v33 = (char *)objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
            v48 = (uint64_t)v33;
            if (!v33)
            {
              *__error() = 22;
              v36 = 1;
              goto LABEL_44;
            }
            LOBYTE(v49) = 1;
            v34 = strrchr(v33, 10);
            if (v34)
            {
              *v34 = 0;
              v35 = v34[1];
              if ((v35 - 49) <= 6)
                LOBYTE(v49) = v35 - 48;
            }
            if (((*((uint64_t (**)(id, uint64_t *))v26 + 2))(v26, &v48) & 1) == 0)
            {
              v36 = 2;
LABEL_44:
              v4 = v47;
              v10 = v44;
LABEL_45:

              if ((v36 & 1) != 0)
                v24 = 0xFFFFFFFFLL;
              else
                v24 = 0;

              goto LABEL_49;
            }
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (!v29)
        {
          v36 = 0;
          goto LABEL_44;
        }
      }
    }
    v36 = 0;
    goto LABEL_45;
  }
  v46 = v4;
  v12 = v11;
  v13 = (uint64_t (**)(_QWORD, uint64_t *))v3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("v"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v14, "intValue") != 1)
  {
    *__error() = 22;
    v24 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("t"));
  v15 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v15;
  if (!v15 || (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *__error() = 22;
    v24 = 0xFFFFFFFFLL;
    goto LABEL_61;
  }
  v43 = v10;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v16;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (!v40)
  {
    v23 = 0;
    goto LABEL_57;
  }
  v41 = *(_QWORD *)v51;
  v45 = v3;
  v39 = v13;
  while (2)
  {
    for (j = 0; j != v40; ++j)
    {
      if (*(_QWORD *)v51 != v41)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *__error() = 22;
        v23 = 1;
        goto LABEL_57;
      }
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        *__error() = 22;
        v23 = 1;
LABEL_56:

        v3 = v45;
        goto LABEL_57;
      }
      v21 = objc_msgSend(v20, "intValue");
      v48 = 0;
      v49 = 0;
      v22 = objc_retainAutorelease(v19);
      v48 = objc_msgSend(v22, "UTF8String");
      LOBYTE(v49) = v21;
      v13 = v39;
      if ((v39[2](v39, &v48) & 1) == 0)
      {
        v23 = 2;
        goto LABEL_56;
      }

      v3 = v45;
    }
    v23 = 0;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v40)
      continue;
    break;
  }
LABEL_57:

  if ((v23 & 1) != 0)
    v24 = 0xFFFFFFFFLL;
  else
    v24 = 0;
  v10 = v43;
LABEL_61:

LABEL_39:
  v4 = v46;
LABEL_49:

LABEL_50:
  objc_autoreleasePoolPop(v4);

  return v24;
}

void fpfs_user_package_extension_list_init(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __fpfs_user_package_extension_list_init_block_invoke;
  block[3] = &unk_1E444A308;
  v5 = v1;
  v2 = fpfs_user_package_extension_list_init_once;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&fpfs_user_package_extension_list_init_once, block);

}

void __fpfs_user_package_extension_list_init_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (*(_QWORD *)(a1 + 32))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = fpfs_user_package_default_extension_list;
  v4 = objc_msgSend(v2, "initWithArray:", v3);
  v5 = (void *)allowListedPackageExtensions;
  allowListedPackageExtensions = v4;

  FPServerPackageExtensions();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)remotePackageExtensions;
  remotePackageExtensions = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = (void *)userPackageExtensions;
  userPackageExtensions = (uint64_t)v8;

}

void fpfs_icd_package_extension_list_reload()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v4, "stringArrayForKey:", CFSTR("iCDPackageExtensions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);

  os_unfair_lock_lock((os_unfair_lock_t)&iCDPackageExtensionsLock);
  v3 = (void *)iCDPackageExtensions;
  iCDPackageExtensions = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&iCDPackageExtensionsLock);
}

void fpfs_icd_package_extension_list_init()
{
  if (fpfs_icd_package_extension_list_init_once != -1)
    dispatch_once(&fpfs_icd_package_extension_list_init_once, &__block_literal_global_54);
}

uint64_t fpfs_user_package_extension_list_contains(_BYTE *a1)
{
  void *v1;
  id v2;
  uint64_t v3;

  _getExtensionString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    fpfs_user_package_extension_list_init(0);
    v2 = (id)userPackageExtensions;
    objc_sync_enter(v2);
    if ((objc_msgSend((id)allowListedPackageExtensions, "containsObject:", v1) & 1) != 0
      || (objc_msgSend((id)remotePackageExtensions, "containsObject:", v1) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      v3 = objc_msgSend((id)userPackageExtensions, "containsObject:", v1);
    }
    objc_sync_exit(v2);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1A0B1B7B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void fpfs_user_package_extension_list_insert(_BYTE *a1)
{
  void *v2;
  id v3;
  id v4;

  if ((fpfs_user_package_extension_list_contains(a1) & 1) == 0)
  {
    _getExtensionString(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v4 = v2;
      v3 = (id)userPackageExtensions;
      objc_sync_enter(v3);
      objc_msgSend((id)userPackageExtensions, "addObject:", v4);
      objc_sync_exit(v3);

      v2 = v4;
    }

  }
}

void sub_1A0B1B84C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void fpfs_user_package_extension_list_remove(_BYTE *a1)
{
  void *v1;
  id v2;
  id v3;

  _getExtensionString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v3 = v1;
    fpfs_user_package_extension_list_init(0);
    v2 = (id)userPackageExtensions;
    objc_sync_enter(v2);
    objc_msgSend((id)userPackageExtensions, "removeObject:", v3);
    objc_sync_exit(v2);

    v1 = v3;
  }

}

void sub_1A0B1B8C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _t_fpfs_user_package_clear()
{
  id obj;

  fpfs_user_package_extension_list_init(0);
  obj = (id)userPackageExtensions;
  objc_sync_enter(obj);
  objc_msgSend((id)userPackageExtensions, "removeAllObjects");
  objc_sync_exit(obj);

}

void sub_1A0B1B92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A0B1BC18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B1BC84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B1BD54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPFileMetadataCopyLastUsedDate(int a1, _QWORD *a2)
{
  void *v3;
  uint64_t v5[2];

  v5[0] = 0;
  v5[1] = 0;
  if ((fpfs_get_last_use_date(a1, v5, 1) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
LABEL_8:
    v3 = 0;
    return v3;
  }
  if (!v5[0])
  {
    if (a2)
    {
      *a2 = 0;
      return 0;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v5[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

id FPFileMetadataCopyLastUsedDateAtURL(void *a1, _QWORD *a2)
{
  int v3;
  int v4;
  void *v5;

  v3 = open((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 2097156);
  if (v3 < 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      v5 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v4 = v3;
    FPFileMetadataCopyLastUsedDate(v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    close(v4);
  }
  return v5;
}

BOOL FPFileMetadataSetLastUsedDate(int a1, void *a2, _QWORD *a3)
{
  double v5;
  int use_date;
  int v7;
  uint64_t v9[2];

  objc_msgSend(a2, "timeIntervalSince1970");
  v9[0] = (uint64_t)v5;
  v9[1] = 0;
  use_date = fpfs_set_last_use_date(a1, v9, 1);
  v7 = use_date;
  if (a3 && use_date < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 >= 0;
}

void FPSetLastUsedDateAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, int);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "fileSystemRepresentation");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __FPSetLastUsedDateAtURL_block_invoke;
  v16 = &unk_1E444F810;
  v17 = v4;
  v7 = v5;
  v18 = v7;
  v8 = v4;
  if ((fpfs_open(v6, 0x200002u, 0, 2, (uint64_t)&v13) & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path", v13, v14, v15, v16, v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2080;
      v22 = v12;
      _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't set last used date on %@: %s", buf, 0x16u);

    }
  }

}

id FPFileMetadataCopyFavoriteRank(int a1, _QWORD *a2)
{
  void *v3;
  unint64_t v5;

  v5 = 0;
  if ((fpfs_get_favorite_rank(a1, &v5) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
LABEL_8:
    v3 = 0;
    return v3;
  }
  if (!v5)
  {
    if (a2)
    {
      *a2 = 0;
      return 0;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

BOOL FPFileMetadataSetFavoriteRank(int a1, void *a2, _QWORD *a3)
{
  int v4;
  int v5;

  v4 = fpfs_set_favorite_rank(a1, objc_msgSend(a2, "unsignedLongLongValue"));
  v5 = v4;
  if (a3 && v4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 >= 0;
}

id FPFileMetadataCopyTagData(int a1, _QWORD *a2)
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v12 = 0;
  v13 = 0;
  v14 = 0;
  v11[0] = 0;
  v11[1] = 0;
  if ((int)fpfs_get_finder_info(a1, (uint64_t)v11) < 0)
    v4 = 0;
  else
    v4 = v11;
  if ((fpfs_get_tag_data(a1, (uint64_t)v4, (uint64_t)&v12) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
  }
  else
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __FPFileMetadataCopyTagData_block_invoke;
      v9[3] = &unk_1E444F838;
      v10 = v5;
      v6 = v5;
      fpfs_deserialize_tags(&v12, v9);
      fpfs_free_tag_data(&v12);
      FPGetTagsDataForTags(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    if (a2)
    {
      *a2 = 0;
      return 0;
    }
  }
  return 0;
}

BOOL FPFileMetadataSetTagData(int a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17[3];

  v5 = a2;
  memset(v17, 0, sizeof(v17));
  FPGetTagsFromTagsData(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = 0;
  v15[0] = 0;
  v15[1] = 0;
  if (!objc_msgSend(v6, "count"))
  {
    v8 = fpfs_set_tag_data(a1, 0, (uint64_t)v16, (uint64_t)v15);
    if (v8 < 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v7 = objc_msgSend(v6, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __FPFileMetadataSetTagData_block_invoke;
  v10[3] = &unk_1E444F860;
  v12 = v14;
  v13 = v7;
  v11 = v6;
  v8 = fpfs_serialize_tags((uint64_t)v17, v10);
  if ((v8 & 0x80000000) == 0)
    v8 = fpfs_set_tag_data(a1, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15);
  if (v17[0])
    free(v17[0]);

  _Block_object_dispose(v14, 8);
  if ((v8 & 0x80000000) == 0)
LABEL_7:
    v8 = fpfs_set_finder_info(a1, (uint64_t)v16, (uint64_t)v15);
LABEL_8:
  if (a3 && v8 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 >= 0;
}

void sub_1A0B1CA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPFileMetadataCopyCollaborationIdentifier(int a1)
{
  char *v1;
  char *v2;
  void *v3;

  v1 = fpfs_copy_collaboration_identifier(a1);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void FPFileProviderServiceEndpointCreatingForItemAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke;
  v15[3] = &unk_1E444BE20;
  v6 = v4;
  v17 = v6;
  v7 = v3;
  v16 = v7;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2;
  v11[3] = &unk_1E444F898;
  v12 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v15);
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v12;
  objc_msgSend(v10, "FPFileProviderServiceEndpointCreatingForItemAtURL:completionHandler:", v9, v11);

}

void FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke;
  v15[3] = &unk_1E444BE20;
  v6 = v4;
  v17 = v6;
  v7 = v3;
  v16 = v7;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2;
  v11[3] = &unk_1E444F898;
  v12 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v15);
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v12;
  objc_msgSend(v10, "FPFileProviderServiceEndpointCreatingForItemAtURL:synchronously:completionHandler:", v9, 1, v11);

}

void FPFetchServiceEndpointCreatorForItemAtURL(void *a1, int a2, void *a3)
{
  if (a2)
    FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(a1, a3);
  else
    FPFileProviderServiceEndpointCreatingForItemAtURL(a1, a3);
}

void FPFetchServiceEndpointCreatorByNameForItemAtURL(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  v32 = 0;
  v31 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v32, CFSTR("FPOriginalDocumentURL"), &v31);
  v10 = v32;
  v11 = v31;
  if (v11)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      FPFetchServiceEndpointCreatorByNameForItemAtURL_cold_1((uint64_t)v10);

  }
  if (v10)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_INFO, "[INFO] FPFetchServiceEndpointCreatorByNameForItemAtURL substituting %@ as original URL to %@", buf, 0x16u);
    }

    v14 = v10;
    v7 = v14;
  }
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke;
  v26[3] = &unk_1E444F8E8;
  v16 = v7;
  v27 = v16;
  v30 = a3;
  v17 = v9;
  v28 = v8;
  v29 = v17;
  v18 = v8;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_3;
  v22[3] = &unk_1E444F910;
  v23 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v26);
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v23;
  objc_msgSend(v21, "FPFileProviderServiceEndpointCreatingWithName:itemAtURL:synchronously:completionHandler:", v18, v20, a3, v22);

}

id objectForKeyOfClass(void *a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __FILEPROVIDER_BAD_DOMAIN_VERSION__(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  fp_simulate_crash(CFSTR("Domain %@ returned an inconsistent domain version %@, previously known version was %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    _os_log_fault_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_FAULT, "[SIMCRASH] Domain %@ returned an inconsistent domain version %@, previously known version was %@", buf, 0x20u);
  }

}

void sub_1A0B1EE30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id fp_extension_log()
{
  if (fp_extension_log_once != -1)
    dispatch_once(&fp_extension_log_once, &__block_literal_global_56);
  return (id)fp_extension_log_logger;
}

void __fp_extension_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProvider", "extension");
  v1 = (void *)fp_extension_log_logger;
  fp_extension_log_logger = (uint64_t)v0;

}

void sub_1A0B21CF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0B22790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A0B22D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void __FILEPROVIDER_UNSUPPORTED_ERROR__(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    +[FPXPCSanitizer permittedErrorDomains](FPXPCSanitizer, "permittedErrorDomains");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218754;
    v8 = a2;
    v9 = 2114;
    v10 = v3;
    v11 = 2114;
    v12 = v6;
    v13 = 2082;
    v14 = "__FILEPROVIDER_UNSUPPORTED_ERROR__";
    _os_log_fault_impl(&dword_1A0A34000, v4, OS_LOG_TYPE_FAULT, "[CRIT] Provider returned error %ld from domain %{public}@ which is unsupported. Supported error domains are %{public}@. Break on %{public}s to find this.", (uint8_t *)&v7, 0x2Au);

  }
}

id FPLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  FPLocalizedStringWithKeyAndVariantShared(a1, a2, a3, a4, a5, &__block_literal_global_234, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id FPLocalizedStringWithKeyAndVariantLiteral(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  __CFString *v18;

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __FPLocalizedStringWithKeyAndVariantLiteral_block_invoke;
  v17[3] = &unk_1E444FD68;
  v18 = CFSTR("DomainDisabled_%@");
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)MEMORY[0x1A1B00850](v17);
  FPLocalizedStringWithKeyAndVariantShared(0, CFSTR("DomainDisabled_%@"), v13, v12, v11, v14, (uint64_t)&a9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id FPLocalizedStringWithKeyAndVariantShared(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, _QWORD);
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a5;
  objc_msgSend(a1, "stringByAppendingString:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v20 = 0;
    if (!a5)
      goto LABEL_9;
LABEL_7:
    if (!v20)
    {
      objc_msgSend(v14, "stringByAppendingString:", CFSTR(".f"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _FPLocalizedStringWithKeyAndVariant(v13, v21, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  if (a5)
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(".f"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _FPLocalizedStringNoFallbackWithKeyAndVariant(v18, v19, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_12;
  }
  _FPLocalizedStringNoFallbackWithKeyAndVariant(v18, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    goto LABEL_7;
LABEL_9:
  if (!v20)
  {
    _FPLocalizedStringWithKeyAndVariant(v13, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v16[2](v16, v13, a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v22, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id _FPLocalizedStringNoFallbackWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@(%@)"), v5, v6, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        FPLocalizedErrorStringForKey(v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@(*)"), v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FPLocalizedErrorStringForKey(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id _FPLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  _FPLocalizedStringNoFallbackWithKeyAndVariant(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FPLocalizedErrorStringForKey(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6 && !v9)
  {
    if ((objc_msgSend(v6, "isEqualToString:", &stru_1E4450B40) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      FPLocalizedErrorStringForKey(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

id FPGetTagsDataForTags(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v1;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "label");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v9;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "color"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v22[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v11);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v5);
    }

    v20[0] = CFSTR("v");
    v20[1] = CFSTR("t");
    v21[0] = &unk_1E448E998;
    v21[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id FPGetTagsFromTagsData(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)objc_opt_new();
    v18[2] = 0;
    v3 = objc_retainAutorelease(v1);
    v18[0] = objc_msgSend(v3, "bytes");
    v18[1] = objc_msgSend(v3, "length");
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __FPGetTagsFromTagsData_block_invoke;
    v16 = &unk_1E444F838;
    v4 = v2;
    v17 = v4;
    if ((fpfs_deserialize_tags(v18, &v13) & 0x80000000) != 0)
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        FPGetTagsFromTagsData_cold_2(v6);

      v7 = v3;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr;
      v22 = getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr;
      if (!getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr)
      {
        v9 = (void *)MetadataUtilitiesLibrary_1();
        v8 = dlsym(v9, "MDPropertyCopyDecodedUserTags");
        v20[3] = (uint64_t)v8;
        getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr = v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        FPGetTagsFromTagsData_cold_1();
      v10 = (void *)((uint64_t (*)(id))v8)(v7);
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "fp_map:", &__block_literal_global_59, v13, v14, v15, v16);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = v4;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1A0B25A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPFilterActionsForDroppingItems(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v13, "FPFilterActions:forDroppingItems:underItem:", v7, v5, v6) & 1) != 0)
      {
        break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t FPAreUTIsImportable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v10, "FPAreUTIsImportable:toFolderItem:", v3, v4))
        {
          v11 = 0;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

id FPServerPackageExtensions()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *i;
  void *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(_QWORD *)v7 != v2)
          objc_enumerationMutation(v0);
        v4 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "FPServerPackageExtensions");
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v1 = (void *)objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v1)
        continue;
      break;
    }
  }
LABEL_11:

  return v1;
}

void fp_dispatch_group_async_with_logs(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t section;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = a1;
  fpfs_current_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  section = __fp_create_section();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    fp_dispatch_async_with_logs_cold_1(v5);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __fp_dispatch_group_async_with_logs_block_invoke;
  v14[3] = &unk_1E444C7C8;
  v15 = v8;
  v16 = v5;
  v17 = v6;
  v18 = section;
  v11 = v6;
  v12 = v5;
  v13 = v8;
  dispatch_group_async(v7, v12, v14);

}

void __fp_dispatch_group_async_with_logs_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  fpfs_adopt_log(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = v2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __fp_dispatch_async_with_logs_block_invoke_cold_1((uint64_t)&v4, a1);

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  __fp_leave_section_Debug((uint64_t)&v4);
  __fp_pop_log(&v5);

}

void sub_1A0B26040(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A0B26144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2)
{
  return dispatch_queue_get_label(*(dispatch_queue_t *)(a2 + 40));
}

void sub_1A0B262BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B2654C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A0B26888(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1A0B26900(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B27534(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0B2758C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_14(id a1)
{
  return a1;
}

void sub_1A0B28BC8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A0B290AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPURLResourceKeysByItemPropertyNames()
{
  if (FPURLResourceKeysByItemPropertyNames_once != -1)
    dispatch_once(&FPURLResourceKeysByItemPropertyNames_once, &__block_literal_global_248);
  return (id)FPURLResourceKeysByItemPropertyNames_urlResourceKeysByItemPropertyNames;
}

id FPMatchingDictionaryKeys()
{
  if (FPMatchingDictionaryKeys_once != -1)
    dispatch_once(&FPMatchingDictionaryKeys_once, &__block_literal_global_250);
  return (id)FPMatchingDictionaryKeys_fpMatchingDictionary;
}

void sub_1A0B29C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A0B29FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id getValueForKey(void *a1, void *a2)
{
  id v3;
  NSString *v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id FPExtensionMatchingDictionaryForItem(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *context;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  context = (void *)MEMORY[0x1A1B00664]();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    FPMatchingDictionaryKeys();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("itemIdentifier")))
          getValueForKey(v3, CFSTR("providerItemIdentifier"));
        else
          getValueForKey(v3, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "setObject:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  objc_autoreleasePoolPop(context);

  return v14;
}

__CFString *FPKnownFoldersDescription(void *a1, uint64_t a2)
{
  uint64_t v2;
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;

  if (a2)
  {
    v2 = a2;
    v3 = (__CFString *)objc_msgSend(a1, "mutableCopy");
    v4 = v3;
    if ((v2 & 1) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR("desktop"));
      v5 = v2 & 0xFFFFFFFFFFFFFFFELL;
      if ((v2 & 2) == 0)
      {
        v2 &= ~1uLL;
        if (!v5)
          return v4;
        goto LABEL_11;
      }
      -[__CFString appendString:](v4, "appendString:", CFSTR(","));
      v2 &= ~1uLL;
    }
    else if ((v2 & 2) == 0)
    {
      goto LABEL_12;
    }
    -[__CFString appendString:](v4, "appendString:", CFSTR("documents"));
    v2 &= ~2uLL;
    if (v2)
    {
LABEL_11:
      -[__CFString appendString:](v4, "appendString:", CFSTR(","));
LABEL_12:
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("unknown(%lx)"), v2);
    }
  }
  else
  {
    v4 = &stru_1E4450B40;
  }
  return v4;
}

unsigned __int8 *fpfs_finder_info_serialize(unsigned __int8 *result, uint64_t a2)
{
  *(_WORD *)(a2 + 8) = bswap32(__rev16(*(_WORD *)(a2 + 8) & 0xE11B) & 0xFFFF9BEF | (*result << 15) | ((((*result & 6) >> 1) & 3) << 13) | (16 * ((*result >> 3) & 1)) & 0xFFFFFBFF | ((((*result & 0x10) >> 4) & 1) << 10) | (2 * (result[1] & 7))) >> 16;
  *(_QWORD *)a2 = bswap64(*((_QWORD *)result + 1));
  return result;
}

uint64_t fpfs_set_finder_info_buffer(int a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v4 = 0;
  v3 = xmmword_1A0B53EF8;
  return fsetattrlist(a1, &v3, a2, 0x20uLL, 0);
}

uint64_t fpfs_get_finder_info(int a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_get_finder_info_block_invoke;
  v3[3] = &__block_descriptor_tmp_2;
  v3[4] = a2;
  return _fchfiflags(a1, (uint64_t)v3);
}

uint64_t _fchfiflags(int a1, uint64_t a2)
{
  double finder_info_buffer;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, sizeof(v15));
  finder_info_buffer = fpfs_get_finder_info_buffer(a1, v15);
  if (v5 < 0)
    return 0xFFFFFFFFLL;
  v6 = bswap32(WORD4(v15[0]));
  v12 = bswap64(*(unint64_t *)&v15[0]);
  v11 = (v6 >> 22) & 0x10 | ((v6 & 0x80000000) != 0) | (v6 >> 28) & 6 | (v6 >> 17) & 8;
  *(_DWORD *)((char *)&v11 + 1) = (v6 >> 17) & 7;
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, double))(a2 + 16))(a2, v11, finder_info_buffer);
  if (v7 == v11 && v8 == v12)
    return 0;
  WORD4(v15[0]) = bswap32(__rev16(WORD4(v15[0]) & 0xE11B) & 0xFFFF9BEF | ((_DWORD)v7 << 15) | ((((v7 & 6) >> 1) & 3) << 13) | (16 * ((v7 >> 3) & 1)) & 0xFFFFFBFF | ((((v7 & 0x10) >> 4) & 1) << 10) | (v7 >> 7) & 0xE) >> 16;
  *(_QWORD *)&v15[0] = bswap64(v8);
  v13 = xmmword_1A0B53EF8;
  v14 = 0;
  return fsetattrlist(a1, &v13, v15, 0x20uLL, 0);
}

uint64_t __fpfs_get_finder_info_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(a1 + 32);
  *v3 = a2;
  v3[1] = a3;
  return a2;
}

BOOL fpfs_finder_info_update_with_mask(uint64_t a1, char *a2, uint64_t a3)
{
  char v3;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  if ((*a2 & 1) != 0)
  {
    *(_BYTE *)a1 = *(_BYTE *)a1 & 0xFE | *(_BYTE *)a3 & 1;
    v3 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)a1 = *(_BYTE *)a1 & 0xFD | *(_BYTE *)a3 & 2;
  v3 = *a2;
  if ((*a2 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)a1 = *(_BYTE *)a1 & 0xFB | *(_BYTE *)a3 & 4;
  v3 = *a2;
  if ((*a2 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  *(_BYTE *)a1 = *(_BYTE *)a1 & 0xF7 | *(_BYTE *)a3 & 8;
  if ((*a2 & 0x10) != 0)
LABEL_6:
    *(_BYTE *)a1 = *(_BYTE *)a1 & 0xEF | *(_BYTE *)a3 & 0x10;
LABEL_7:
  if (a2[1])
    *(_BYTE *)(a1 + 1) = *(_BYTE *)(a3 + 1);
  if (*((_QWORD *)a2 + 1))
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a3 + 8);
  return *(_QWORD *)a1 != v6 || *(_QWORD *)(a1 + 8) != v7;
}

uint64_t fpfs_set_finder_info(int a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_set_finder_info_block_invoke;
  v4[3] = &__block_descriptor_tmp_1_0;
  v4[4] = a2;
  v4[5] = a3;
  return _fchfiflags(a1, (uint64_t)v4);
}

uint64_t __fpfs_set_finder_info_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  v4[0] = a2;
  v4[1] = a3;
  fpfs_finder_info_update_with_mask((uint64_t)v4, *(char **)(a1 + 32), *(_QWORD *)(a1 + 40));
  return v4[0];
}

uint64_t fpfs_is_finder_alias_at(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_is_finder_alias_at_block_invoke;
  v4[3] = &__block_descriptor_tmp_3_0;
  v4[4] = a3;
  return fpfs_openat(a1, a2, 0, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_is_finder_alias_at_block_invoke(uint64_t a1, int a2)
{
  _BYTE *v3;
  uint64_t result;
  _QWORD v5[2];
  _QWORD v6[5];

  v5[0] = 0;
  v5[1] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __fpfs_get_finder_info_block_invoke;
  v6[3] = &__block_descriptor_tmp_2;
  v6[4] = v5;
  if ((_fchfiflags(a2, (uint64_t)v6) & 0x80000000) != 0 && *__error() != 93)
    return 0xFFFFFFFFLL;
  v3 = *(_BYTE **)(a1 + 32);
  result = 0;
  if (v3)
    *v3 = v5[0] & 1;
  return result;
}

uint64_t FPSearchableItemErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 1)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_43;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_45:
        *(_DWORD *)(a1 + 24) = v26;
      }
      else if ((_DWORD)v17 == 3)
      {
        PBReaderReadString();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v30;

      }
      else if ((_DWORD)v17 == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        *(_QWORD *)(a1 + 8) = -(v20 & 1) ^ (v20 >> 1);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void CheckAndWarn_cold_1(uint64_t a1, SEL aSelector, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v6, "[ERROR] The enumerator %{public}@ does not implement the change-based update method %{public}@. System performance will be degraded, and sync may fail.", (uint8_t *)&v7);

  OUTLINED_FUNCTION_7();
}

void fpfs_fset_acl_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to create ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to set tag type for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to get permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to clear permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_5()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to add permission for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_6()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to set qualifier for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_7()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to set permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void fpfs_fset_acl_cold_8()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, MEMORY[0x1E0C81028], v1, "Unable to apply ACL on domain root: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __cachedFrameworkOverridingObjects_block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1A0A34000, (int)a2, a3, "[DEBUG] Ignoring old world icloud drive override when fpfs is enabled", a1);
}

void __cachedFrameworkOverridingObjects_block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1A0A34000, (int)a2, a3, "[DEBUG] Ignoring new world icloud drive override when fpfs is not enabled", a1);
}

void fpfs_serialize_last_use_date_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef _MDPropertyCopyEncodedDataForLastUsedDateWithTimeSpec(struct timespec)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void fpfs_deserialize_last_use_date_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean _MDPropertyDecodedLastUsedDateTimeSpec(CFDataRef, struct timespec *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void fpfs_serialize_favorite_rank_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef _MDPropertyCopyEncodedDataForFavoriteRank(uint64_t, _Bool)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void fpfs_deserialize_favorite_rank_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean _MDPropertyDecodedFavoritRank(CFDataRef, uint64_t *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void fpfs_set_before_bounce_filename_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "Trying to save empty filename in before_bounce_filename xattr", v1, 2u);
}

void fpfs_set_bplist_xattr_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "Cannot create CFStringCreateWithCString", v1, 2u);
}

void fpfs_set_bplist_xattr_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "Cannot format data with CFPropertyListCreateData %@", (uint8_t *)&v3, 0xCu);
}

void _MDPropertyCopyEncodedData_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef _MDPropertyCopyEncodedData(CFStringRef, CFTypeRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemCollaborationIdentifier_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemCollaborationIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void _MDPropertyCopyXAttrName_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _MDPropertyCopyXAttrName(CFStringRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemIsShared_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemIsShared(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemSharedItemCurrentUserRole_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemSharedItemCurrentUserRole(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemOwnerName_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemOwnerName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void fpfs_copy_collaboration_identifier_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef _MDPropertyCopyDecodedValue(CFStringRef, CFDataRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("fpfs_xattrs.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void MetadataUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MetadataUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("fpfs_xattrs.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void CoreSpotlightLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("fpfs_xattrs.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSpotlightIndexer.m"), 32, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchableIndexClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightIndexer.m"), 33, CFSTR("Unable to find class %s"), "CSSearchableIndex");

  __break(1u);
}

void copyHomeDirectoryCompat_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_4_2(&dword_1A0A34000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void copyHomeDirectoryCompat_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_4_2(&dword_1A0A34000, v0, v1, "[ERROR] can't get home dir path: no entry for uid %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void copyHomeDirectoryCompat_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_4_2(&dword_1A0A34000, v0, v1, "[ERROR] can't get home dir path %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __getGSStorageManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *GenerationalStorageLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSURL+FPAdditions.m"), 169, CFSTR("%s"), *a1);

  __break(1u);
}

void __getGSStorageManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getGSStorageManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSURL+FPAdditions.m"), 170, CFSTR("Unable to find class %s"), "GSStorageManager");

  __break(1u);
}

void __getQLThumbnailAdditionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuickLookThumbnailingLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSURL+FPAdditions.m"), 167, CFSTR("%s"), *a1);

  __break(1u);
}

void __getQLThumbnailAdditionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getQLThumbnailAdditionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NSURL+FPAdditions.m"), 168, CFSTR("Unable to find class %s"), "QLThumbnailAddition");

  __break(1u);
}

void FPStatFSFromPath_cold_1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] statfs(%@) failed %{errno}d", (uint8_t *)&v5, 0x12u);
}

void FPLocalizedFileSystemTypeName_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to get NSURLVolumeLocalizedFormatDescription: %@", (uint8_t *)&v2, 0xCu);
}

void fpfs_fset_metadata_cold_1()
{
  __assert_rtn("fpfs_fset_metadata", "fpfs_metadata.c", 527, "((ptrdiff_t)buf - (ptrdiff_t)original_buf) == (ptrdiff_t)buf_size");
}

void CoreSpotlightLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSpotlightCollector.m"), 32, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSUserQueryContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSUserQueryContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightCollector.m"), 38, CFSTR("Unable to find class %s"), "CSUserQueryContext");

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightCollector.m"), 36, CFSTR("Unable to find class %s"), "CSSearchQueryContext");

  __break(1u);
}

void __getCSUserQueryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSUserQueryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightCollector.m"), 37, CFSTR("Unable to find class %s"), "CSUserQuery");

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightCollector.m"), 35, CFSTR("Unable to find class %s"), "CSSearchQuery");

  __break(1u);
}

void _CGImageDestinationCreateWithData_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageDestinationRef _CGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPFetchThumbnailsOperation.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void _CGImageDestinationAddImage_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _CGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPFetchThumbnailsOperation.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void _CGImageDestinationFinalize_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool _CGImageDestinationFinalize(CGImageDestinationRef _Nonnull)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPFetchThumbnailsOperation.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void __getIFImageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IconFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPFetchThumbnailsOperation.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIFImageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIFImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPFetchThumbnailsOperation.m"), 32, CFSTR("Unable to find class %s"), "IFImage");

  __break(1u);
}

void ImageIOLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ImageIOLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPFetchThumbnailsOperation.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDSArchiveServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDSArchiveServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPArchiveOperation.m"), 25, CFSTR("Unable to find class %s"), "DSArchiveService");

  __break(1u);
}

void DesktopServicesPrivLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DesktopServicesPrivLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPArchiveOperation.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBRFieldContentSignatureClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *iCloudDriveCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPFileVersion.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBRFieldContentSignatureClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBRFieldContentSignatureClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPFileVersion.m"), 29, CFSTR("Unable to find class %s"), "BRFieldContentSignature");

  __break(1u);
}

void FPRegisterFileProvidersForFileCoordination_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] deprecated FPRegisterFileProvidersForFileCoordination called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void FPRegisterFileProvidersForUser_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Requesting fileproviderd to register extensions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void FPCrossDeviceItemIDForItemAtURL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] fetching cross-device item at URL %@", v2);
  OUTLINED_FUNCTION_3();
}

void FPCrossDeviceItemIDForItemID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] fetching cross-device itemID for %@", v2);
  OUTLINED_FUNCTION_3();
}

void FPItemURLForCrossDeviceItemID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] fetching itemURL from %@", v2);
  OUTLINED_FUNCTION_3();
}

void FPItemIDFromCrossDeviceItemID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] fetching itemID from %@", v2);
  OUTLINED_FUNCTION_3();
}

void FPWriteImportCookieForDomainURL_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9(&dword_1A0A34000, v2, v3, "[DEBUG] writing import cookie for domain url %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

void FPClearImportCookieForDomainURL_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9(&dword_1A0A34000, v2, v3, "[DEBUG] clearing import cookie for domain url %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

void abc_report_assert_with_signature_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] Sent snapshot for signature %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void abc_report_assert_with_signature_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] Failed to send snapshot for signature %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __abc_report_assert_with_signature_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] got response from diagnosticReporter - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __fp_log_fork_cold_1(__int16 a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 2080;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, a2, a3, "[DEBUG] ┣%llx dispatching to %s", (_QWORD)v3, *((const char **)&v3 + 1));
  OUTLINED_FUNCTION_3();
}

void __fp_log_adopt_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  WORD6(v3) = 2080;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, a2, a3, "[DEBUG] ┳%llx continuing on %s", (_QWORD)v3, *((const char **)&v3 + 1));
  OUTLINED_FUNCTION_3();
}

void __fp_leave_section_Debug_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] ┗%llx ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __fp_leave_section_Error_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] ┗%llx ", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void fpfs_update_purgency_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "Couldn't get purgeable info, errno %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void fpfs_update_purgency_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8_4(&dword_1A0A34000, a1, a3, "Couldn't update purgeable urgency, file is not purgable", v3);
}

void fpfs_set_evictable_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[8];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_5();
  v5 = 2048;
  v6 = v0;
  v7 = 2080;
  v8 = v1;
  v9 = 2048;
  v10 = v2;
  _os_log_error_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_ERROR, "Invalid evictability parameters: %d / 0x%llx on %s ino:%llu", v4, 0x26u);
  OUTLINED_FUNCTION_17();
}

void fpfs_get_purgeable_stats_cold_1(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v6 = 134218240;
  v7 = a1;
  v8 = 1024;
  v9 = v4;
  OUTLINED_FUNCTION_14_2(&dword_1A0A34000, a2, v5, "Couldn't get detailed purgeable stats for %llu, errno %{errno}d", (uint8_t *)&v6);
  OUTLINED_FUNCTION_17();
}

void fpfs_unset_dataless_cmpfs_attrs_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "removing dataless bit with fpfs_fchflags failed with %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void fpfs_unset_dataless_cmpfs_attrs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "removing dataless bit with ffsctl failed with %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __fpfs_create_dataless_fault_at_block_invoke_cold_1()
{
  __assert_rtn("fpfs_create_dataless_fault_at_block_invoke", "fpfs_dataless_fault.m", 854, "md->is_dataless");
}

void _fpfs_remove_sharing_xattrs_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "Error removing ownerName during prune fault: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void _fpfs_remove_sharing_xattrs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "Error removing sharedByCurrentUser during prune fault: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void _fpfs_remove_sharing_xattrs_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "Error removing isShared during prune fault: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void _fpfs_remove_sharing_xattrs_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_10(&dword_1A0A34000, v0, v1, "Error removing collabID during prune fault: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void _fpfs_prune_fault_error_cold_1(uint64_t a1, int *a2, NSObject *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315394;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  OUTLINED_FUNCTION_14_2(&dword_1A0A34000, a3, (uint64_t)a3, "prune dataless: can't remove %s , error: (%{errno}d)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void _fpfs_prune_fault_status_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "prune dataless: removed %s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void fpfs_materialize_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_9_2(&dword_1A0A34000, v0, v1, "Setting data class %d->%d on source failed: %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void fpfs_materialize_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_9_2(&dword_1A0A34000, v0, v1, "Setting data class %d->%d on destination failed: %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _materialize_partial_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v0, v1, "Invalid extent [%lu, %lu]", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _materialize_partial_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v0, v1, "captured content doesn't contain as much data as exepcted! (%llu != %llu)", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _materialize_partial_cold_4(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_1A0A34000, a1, OS_LOG_TYPE_ERROR, "_materialize_partial APFSIOC_SHARE_RANGE: %s", (uint8_t *)&v4, 0xCu);
  OUTLINED_FUNCTION_17();
}

void _materialize_partial_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v0, v1, "extent length is not as expected (%llu != %llu)", v2, v3);
  OUTLINED_FUNCTION_3();
}

void fpfs_evict_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_4(&dword_1A0A34000, a3, (uint64_t)a3, "Unable to update cmpfs_attrs", a1);
}

void fpfs_evict_cold_2()
{
  NSObject *v0;
  char **v1;
  uint8_t *v2;
  int *v3;
  char *v4;

  v3 = OUTLINED_FUNCTION_10_1();
  v4 = strerror(*v3);
  *(_DWORD *)v2 = 136315138;
  *v1 = v4;
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "APFSIOC_PURGE_SINGLE_FILE failed with %s", v2, 0xCu);
  OUTLINED_FUNCTION_13_2();
}

void fpfs_evict_cold_3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_4(&dword_1A0A34000, a3, (uint64_t)a3, "APFSIOC_PURGE_SINGLE_FILE did not evict anything, assuming EBUSY", a1);
}

void fpfs_evict_cold_4()
{
  NSObject *v0;
  int *v1;
  uint8_t *v2;
  int v3;

  v3 = *OUTLINED_FUNCTION_10_1();
  *(_DWORD *)v2 = 67109120;
  *v1 = v3;
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "Unable to make empty file dataless: %{errno}d", v2, 8u);
  OUTLINED_FUNCTION_13_2();
}

void fpfs_evict_cold_5(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "Unable to fully empty directory at '%s' during eviction: %s (leaving in state)", buf, 0x16u);
}

void FPLocvImpl_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  FPLocalizationBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v7;
  _os_log_fault_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_FAULT, "[CRIT] Localized key '%@' missing from table '%@' (bundlePath:%@)", (uint8_t *)&v8, 0x20u);

}

void FPLocalizedErrorStringForKey_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  FPLocalizationBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Localized key '%@' missing from table 'Errors' (bundlePath:%@)", (uint8_t *)&v6, 0x16u);

}

void copyfile_status_cb_cold_1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315394;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] copyfile: failed while copying (%s): %d", (uint8_t *)&v5, 0x12u);
}

void copyfile_status_cb_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] copyfile: failed while copying an appledouble file %s, skipping error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void copyfile_status_cb_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] copyfile: skipping appledouble file %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void copyfile_status_cb_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] copyfile: done copying %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void copyfile_status_cb_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] copyfile: recursing in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _brc_notify_get_state_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _brc_notify_get_state(int, uint64_t *, const char *)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPProviderMonitor.m"), 31, CFSTR("%s"), dlerror());

  __break(1u);
}

void CloudDocsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudDocsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPProviderMonitor.m"), 30, CFSTR("%s"), *a1);

  __break(1u);
}

void getMDItemFileProviderDomainIdentifier_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemFileProviderDomainIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 60, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemLastUsedDate_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemLastUsedDate(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemFileSize_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemFileSize(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 48, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemFileItemID_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemFileItemID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 55, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void getMDItemFileProviderID_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemFileProviderID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 56, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void __getCSSearchableItemAttributeSetClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchableItemAttributeSetClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPItem+CSSearchableItem.m"), 70, CFSTR("Unable to find class %s"), "CSSearchableItemAttributeSet");

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPItem+CSSearchableItem.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSLocalizedStringClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSLocalizedStringClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPItem+CSSearchableItem.m"), 71, CFSTR("Unable to find class %s"), "CSLocalizedString");

  __break(1u);
}

void MetadataUtilitiesLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MetadataUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPItem+CSSearchableItem.m"), 73, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchableItemClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchableItemClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPItem+CSSearchableItem.m"), 69, CFSTR("Unable to find class %s"), "CSSearchableItem");

  __break(1u);
}

void getCSIndexErrorDomain_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCSIndexErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightFetchClientStateOperation.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSpotlightFetchClientStateOperation.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFBSSystemServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPAccessControlManager.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFBSSystemServiceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBSSystemServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPAccessControlManager.m"), 19, CFSTR("Unable to find class %s"), "FBSSystemService");

  __break(1u);
}

void __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSpotlightIndexOneBatchOperation.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void fpfs_path_is_safe_save_temp_filename_cold_1()
{
  __assert_rtn("fpfs_path_is_safe_save_temp_filename", "fpfs_path.m", 234, "ERGO(dash, (dash - extension) >= 0)");
}

void CloudDocsLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudDocsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GSAddition+FPVersions.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Connection %@ doesn't have access to file %@", (uint8_t *)&v6, 0x16u);

}

void hasConflictingVersion_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_31();
  _os_log_fault_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_FAULT, "[SIMCRASH] Item has version conflict, but empty base version", v1, 2u);
  OUTLINED_FUNCTION_30();
}

void hasConflictingVersion_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Item %@ has version conflict, but empty base version", (uint8_t *)&v4, 0xCu);

}

void MobileSpotlightIndexLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileSpotlightIndexLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSFileProviderSearchQuery.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void _parse_fileattrs_cold_1()
{
  __assert_rtn("_parse_fileattrs", "fpfs_document_tracking.m", 285, "source.objtype != VREG");
}

void fpfs_openbyid_ext_cold_1()
{
  __assert_rtn("fpfs_openbyid_ext", "fpfs_document_tracking.m", 1271, "errno != 0");
}

void _try_openbyid_cold_1()
{
  __assert_rtn("_try_openbyid", "fpfs_document_tracking.m", 1041, "errno != 0");
}

void _openbyparentidandname_retry_cold_1()
{
  __assert_rtn("_openbyparentidandname_retry", "fpfs_document_tracking.m", 1075, "errno != 0");
}

void _pagetoken_validate_cold_1()
{
  __assert_rtn("_pagetoken_validate", "fpfs_document_tracking.m", 527, "new_pagetoken.dev_id != 0");
}

void __getDSFileOperationClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DesktopServicesPrivLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("fpfs_document_tracking.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDSFileOperationClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDSFileOperationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("fpfs_document_tracking.m"), 38, CFSTR("Unable to find class %s"), "DSFileOperation");

  __break(1u);
}

void fpfs_pkg_relative_path_lookup_cold_1()
{
  __assert_rtn("pkg_root_offset_in_path_at", "fpfs_package.m", 272, "*path");
}

void fpfs_pathpkg_check_cold_1()
{
  __assert_rtn("_cwd_fd", "fpfs_package.m", 91, "fd >= 0");
}

void FPDefaultFetchedAttributes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemExpirationDate(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPSpotlightQueryHelpers.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void FPDefaultFetchedAttributes_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDQueryResultRelevance(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPSpotlightQueryHelpers.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void FPRecencyQualifyingAttributes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemLastUsedDate(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPSpotlightQueryHelpers.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void FPFileSizeAttributes_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemFileSize(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPSpotlightQueryHelpers.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_2(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSpotlightQueryHelpers.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightQueryHelpers.m"), 32, CFSTR("Unable to find class %s"), "CSSearchQueryContext");

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSpotlightQueryHelpers.m"), 31, CFSTR("Unable to find class %s"), "CSSearchQuery");

  __break(1u);
}

void __fpfs_get_materialization_alignment_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_13(&dword_1A0A34000, v0, v1, "[CRIT] Unable to resolve FS block size (%{errno}d). Defaulting to %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void __fpfs_get_materialization_alignment_block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_13(&dword_1A0A34000, v0, v1, "[CRIT] Unable to resolve VM page size (%{errno}d). Defaulting to %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

void FPFetchServiceEndpointCreatorByNameForItemAtURL_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v1, v2, "[ERROR] Error fetching FPOriginalDocumentURL from url: %@ error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void fp_reachability_callback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] Network reachability changed to %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void FPGetTagsFromTagsData_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFArrayRef _MDPropertyCopyDecodedUserTags(CFDataRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPTools.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

void FPGetTagsFromTagsData_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] fpfs tag parsing failed, falling back to MD parser", v1, 2u);
}

void fp_dispatch_async_with_logs_cold_1(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  dispatch_queue_get_label(a1);
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v1, v2, "[DEBUG] ┣%llx dispatching to %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_1();
}

void __fp_dispatch_async_with_logs_block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_5(a1, a2);
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v2, v3, "[DEBUG] ┳%llx continuing on %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6_1();
}

void MetadataUtilitiesLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MetadataUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPTools.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSearchQueryEnumerator.m"), 25, CFSTR("Unable to find class %s"), "CSSearchQueryContext");

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_3(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSpotlightLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FPSearchQueryEnumerator.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCSSearchQueryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FPSearchQueryEnumerator.m"), 24, CFSTR("Unable to find class %s"), "CSSearchQuery");

  __break(1u);
}

uint64_t APFSVolumeGetVEKState()
{
  return MEMORY[0x1E0CF18B0]();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1E0C97F90](bv, range.location, range.length, *(_QWORD *)&value);
}

CFIndex CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1E0C97F98](bv, range.location, range.length, *(_QWORD *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1E0C981A8](bundle, error);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return MEMORY[0x1E0C986F8](fileSec, accessControlList);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

uint64_t GSLibraryGetOrAllocateDocumentId()
{
  return MEMORY[0x1E0D25D10]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1E0D25D20]();
}

uint64_t GSSetDocIDResolutionPolicy()
{
  return MEMORY[0x1E0D25D28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteSint64Field()
{
  return MEMORY[0x1E0D82C90]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1E0D1BD30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCStringIsPromiseName()
{
  return MEMORY[0x1E0C9A5C0]();
}

uint64_t _CFURLCopyLogicalNameOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A620]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1E0C9A640]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _CFURLIsPromiseName()
{
  return MEMORY[0x1E0C9A720]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
}

uint64_t _CFURLSetPermanentResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A770]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __delete()
{
  return MEMORY[0x1E0C80AA8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C813E8](permset_d, *(_QWORD *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1E0C813F8](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81418](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81448](acl, *(_QWORD *)&entry_id, entry_p);
}

acl_t acl_get_fd(int fd)
{
  return (acl_t)MEMORY[0x1E0C81450](*(_QWORD *)&fd);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C81480](permset_d, *(_QWORD *)&perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C81488](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1E0C81490](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1E0C81498](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1E0C814A8](*(_QWORD *)&fd, acl);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1E0C814C8](path_p, *(_QWORD *)&type, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1E0C814D0](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1E0C814E0](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1E0C814E8](entry_d, *(_QWORD *)&tag_type);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1E0C81650](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1E0C81678](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1E0C81688](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
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

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
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

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

uint64_t container_query_set_transient()
{
  return MEMORY[0x1E0C82A20]();
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

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  return MEMORY[0x1E0C82B30](s, *(_QWORD *)&flag, dst);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1E0C82B38](s, *(_QWORD *)&flag, src);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x1E0C82BA8](a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1E0C82BB8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83068](*(_QWORD *)&a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C83088](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1E0C83260](__file, __arg0);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C832B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1E0C832C8](*(_QWORD *)&a1, *(_QWORD *)&a2);
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

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C83320](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
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

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

pid_t fork(void)
{
  return MEMORY[0x1E0C83468]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83540](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C83568](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  return MEMORY[0x1E0C83618](*(_QWORD *)&a1, a2, a3, a4, a5, a6);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C83620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1E0C83698](a1, a2, a3, a4, a5);
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x1E0C836D0](*(_QWORD *)&a1, *(_QWORD *)&a2);
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

passwd *__cdecl getpwuuid(uuid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837B0](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1E0C84008](*(_QWORD *)&gid, uu);
}

uint64_t mbr_identifier_translate()
{
  return MEMORY[0x1E0C84018]();
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C84020](*(_QWORD *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1E0C84028](uu, uid_or_gid, id_type);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C84168](*(_QWORD *)&a1, a2, a3);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1E0C844B8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84BB0](a1, a2, a3, a4, __argv, __envp);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1E0C84D90]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C84F28](*(_QWORD *)&a1, a2, a3);
}

int putenv(char *a1)
{
  return MEMORY[0x1E0C84F58](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
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

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1E0C85110](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

void rewinddir(DIR *a1)
{
  MEMORY[0x1E0C85128](a1);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85340](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C859C0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1E0C85B70]();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xattr_flags_t xattr_flags_from_name(const char *a1)
{
  return MEMORY[0x1E0C85D50](a1);
}

char *__cdecl xattr_name_without_flags(const char *a1)
{
  return (char *)MEMORY[0x1E0C85D68](a1);
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  return MEMORY[0x1E0C85D70](a1, *(_QWORD *)&a2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

